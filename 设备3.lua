local CONFIG = {
WHITELIST_URLS = {
"https://raw.githubusercontent.com/SQ182/y/refs/heads/main/ui废弃版本.lua",
},
EXPECTED_HASH = nil,
TIMEOUT = 10,
STRICT_MODE = true
}
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CLIENT_ID = RbxAnalyticsService:GetClientId()
print("设备码:", CLIENT_ID)
local SX_KEY = _G.SX_KEY or _G.NE_KEY or nil
local function sha256(data)
local function tohex(num)
return string.format("%02x", num)
end
local function rotateRight(num, count)
return bit32.rrotate(num, count)
end
local function sigma0(num)
return bit32.bxor(
rotateRight(num, 7),
rotateRight(num, 18),
bit32.rshift(num, 3)
)
end
local function sigma1(num)
return bit32.bxor(
rotateRight(num, 17),
rotateRight(num, 19),
bit32.rshift(num, 10)
)
end
local K = {
0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
0x3956c25b, 0x59f111f1, 0x923f82e4, 0xab1c5ed5,
0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
}
local message = data
local bitlen = #message * 8
message = message .. string.char(0x80)
while (#message + 8) % 64 ~= 0 do
message = message .. string.char(0x00)
end
for i = 7, 0, -1 do
message = message .. string.char(bit32.band(bit32.rshift(bitlen, i * 8), 0xFF))
end
local H = {
0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19
}
for chunk = 1, #message, 64 do
local block = message:sub(chunk, chunk + 63)
local W = {}
for i = 0, 15 do
W[i] = 0
for j = 1, 4 do
W[i] = W[i] * 256 + block:byte((i * 4) + j)
end
end
for i = 16, 63 do
W[i] = (sigma1(W[i - 2]) + W[i - 7] + sigma0(W[i - 15]) + W[i - 16]) % 0x100000000
end
local a, b, c, d, e, f, g, h = H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8]
for i = 0, 63 do
local S1 = bit32.bxor(rotateRight(e, 6), rotateRight(e, 11), rotateRight(e, 25))
local ch = bit32.bxor(bit32.band(e, f), bit32.band(bit32.bnot(e), g))
local temp1 = (h + S1 + ch + K[i + 1] + W[i]) % 0x100000000
local S0 = bit32.bxor(rotateRight(a, 2), rotateRight(a, 13), rotateRight(a, 22))
local maj = bit32.bxor(bit32.band(a, b), bit32.band(a, c), bit32.band(b, c))
local temp2 = (S0 + maj) % 0x100000000
h = g
g = f
f = e
e = (d + temp1) % 0x100000000
d = c
c = b
b = a
a = (temp1 + temp2) % 0x100000000
end
H[1] = (H[1] + a) % 0x100000000
H[2] = (H[2] + b) % 0x100000000
H[3] = (H[3] + c) % 0x100000000
H[4] = (H[4] + d) % 0x100000000
H[5] = (H[5] + e) % 0x100000000
H[6] = (H[6] + f) % 0x100000000
H[7] = (H[7] + g) % 0x100000000
H[8] = (H[8] + h) % 0x100000000
end
local result = ""
for i = 1, 8 do
result = result .. string.format("%08x", H[i])
end
return result
end
local function verifyContentIntegrity(content)
if not content or content == "" then
return false, "内容为空"
end
if not content:match("return%s*{") then
return false, "无效的白名单格式"
end
if CONFIG.EXPECTED_HASH then
local contentHash = sha256(content)
if contentHash ~= CONFIG.EXPECTED_HASH then
return false, "文件哈希不匹配，可能被篡改"
end
end
return true, "验证通过"
end
local function loadWhitelistSafely()
local whitelist = {}
local lastError = ""
for _, url in ipairs(CONFIG.WHITELIST_URLS) do
local success, content = pcall(function()
return game:HttpGet(url, true)
end)
if success and content then
local integrityOk, integrityMsg = verifyContentIntegrity(content)
if integrityOk then
local chunkSuccess, result = pcall(function()
local fn = loadstring(content)
if fn then
return fn()
end
return nil
end)
if chunkSuccess and type(result) == "table" then
whitelist = result
print("白名单从以下链接加载成功:", url)
break
else
lastError = "白名单数据格式无效"
end
else
lastError = integrityMsg
end
else
lastError = "无法加载白名单: " .. tostring(content)
end
end
if next(whitelist) == nil then
warn("白名单加载失败: " .. lastError)
if CONFIG.STRICT_MODE then
error("无法加载白名单，系统停止运行")
end
end
return whitelist
end
local WHITELIST = loadWhitelistSafely()
local function kickPlayerAndCopyId(player, reason)
pcall(function()
if setclipboard then
setclipboard(CLIENT_ID)
end
end)
local message = string.format([[
验证失败: %s
设备码: %s
请使用正确的 SX_KEY
]], reason, CLIENT_ID)
task.delay(0.5, function()
pcall(function()
player:Kick(message)
end)
end)
end
local function validatePlayer(player)
if not SX_KEY or SX_KEY == "" then
kickPlayerAndCopyId(player, "未设置 SX_KEY")
return false
end
local expectedKey = WHITELIST[CLIENT_ID]
if not expectedKey then
kickPlayerAndCopyId(player, "设备码未注册")
return false
end
if expectedKey ~= SX_KEY then
kickPlayerAndCopyId(player, "SX_KEY 错误")
return false
end
if #SX_KEY < 8 then
kickPlayerAndCopyId(player, "SX_KEY 格式无效")
return false
end
return true
end
Players.PlayerAdded:Connect(function(player)
task.wait(0.5)
if validatePlayer(player) then
print(string.format("玩家 %s (ID: %d) 验证通过", player.Name, player.UserId))
local logMessage = string.format("验证成功 | 玩家: %s | 设备码: %s | 时间: %s",
player.Name, CLIENT_ID, os.date("%Y-%m-%d %H:%M:%S"))
print(logMessage)
end
end)
for _, player in ipairs(Players:GetPlayers()) do
task.spawn(function()
task.wait(1)
validatePlayer(player)
end)
end
local RunService = game:GetService("RunService")
local lastKeyCheck = SX_KEY
RunService.Heartbeat:Connect(function()
local currentKey = _G.SX_KEY or _G.NE_KEY or nil
if currentKey ~= lastKeyCheck then
lastKeyCheck = currentKey
SX_KEY = currentKey
for _, player in ipairs(Players:GetPlayers()) do
task.spawn(function()
validatePlayer(player)
end)
end
end
end)
print("设备码:", CLIENT_ID)
print("白名单记录数:", table.getn(WHITELIST))
