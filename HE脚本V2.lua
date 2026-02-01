local SX_UI = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local TextService = game:GetService("TextService")
local HttpService = game:GetService("HttpService")

local ColorPalette = {
    BackgroundDark = Color3.fromRGB(15, 15, 25),
    BackgroundMedium = Color3.fromRGB(25, 25, 40),
    BackgroundLight = Color3.fromRGB(35, 35, 55),
    AccentRed = Color3.fromRGB(255, 85, 127),
    AccentBlue = Color3.fromRGB(85, 170, 255),
    AccentPurple = Color3.fromRGB(170, 85, 255),
    AccentGreen = Color3.fromRGB(85, 255, 170),
    TextLight = Color3.fromRGB(245, 250, 255),
    TextGray = Color3.fromRGB(180, 190, 210),
    IslandBackground = Color3.fromRGB(0, 0, 0, 0.95),
    IslandBorder = Color3.fromRGB(150, 50, 255),
    SectionLeft = Color3.fromRGB(30, 30, 50),
    SectionRight = Color3.fromRGB(40, 40, 60)
}

local Icons = {
    sword = "rbxassetid://10734978925",
    shield = "rbxassetid://10734982546",
    wand = "rbxassetid://10734984789",
    gear = "rbxassetid://10734986723",
    user = "rbxassetid://10734988956",
    search = "rbxassetid://10734991567",
    home = "rbxassetid://10734993458",
    star = "rbxassetid://10734995689",
    eye = "rbxassetid://10734997845",
    lock = "rbxassetid://10735000123",
    unlock = "rbxassetid://10735002345",
    bell = "rbxassetid://10735004567",
    heart = "rbxassetid://10735006789",
    settings = "rbxassetid://10735008901",
    trash = "rbxassetid://10735011123",
    download = "rbxassetid://10735013345",
    upload = "rbxassetid://10735015567",
    play = "rbxassetid://10735017789",
    pause = "rbxassetid://10735020001",
    stop = "rbxassetid://10735022223",
    refresh = "rbxassetid://10735024445",
    plus = "rbxassetid://10735026667",
    minus = "rbxassetid://10735028889",
    close = "rbxassetid://10735031101",
    check = "rbxassetid://10735033323",
    cross = "rbxassetid://10735035545",
    info = "rbxassetid://10735037767",
    warning = "rbxassetid://10735039989",
    question = "rbxassetid://10735042201",
    camera = "rbxassetid://10735044423",
    image = "rbxassetid://10735046645",
    video = "rbxassetid://10735048867",
    music = "rbxassetid://10735051089",
    mic = "rbxassetid://10735053301",
    phone = "rbxassetid://10735055523",
    mail = "rbxassetid://10735057745",
    chat = "rbxassetid://10735059967",
    globe = "rbxassetid://10735062189",
    wifi = "rbxassetid://10735064401",
    battery = "rbxassetid://10735066623",
    clock = "rbxassetid://10735068845",
    calendar = "rbxassetid://10735071067",
    filter = "rbxassetid://10735073289",
    sort = "rbxassetid://10735075501",
    grid = "rbxassetid://10735077723",
    list = "rbxassetid://10735079945",
    bookmark = "rbxassetid://10735082167",
    flag = "rbxassetid://10735084389",
    tag = "rbxassetid://10735086601",
    folder = "rbxassetid://10735088823",
    file = "rbxassetid://10735091045",
    save = "rbxassetid://10735093267",
    share = "rbxassetid://10735095489",
    copy = "rbxassetid://10735097701",
    cut = "rbxassetid://10735099923",
    paste = "rbxassetid://10735102145",
    undo = "rbxassetid://10735104367",
    redo = "rbxassetid://10735106589",
    zoom_in = "rbxassetid://10735108801",
    zoom_out = "rbxassetid://10735111023",
    maximize = "rbxassetid://10735113245",
    minimize = "rbxassetid://10735115467"
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SX_UI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999

local IslandContainer = Instance.new("Frame")
IslandContainer.Name = "IslandContainer"
IslandContainer.Parent = ScreenGui
IslandContainer.AnchorPoint = Vector2.new(0.5, 0)
IslandContainer.Position = UDim2.new(0.5, 0, 0.015, 0)
IslandContainer.Size = UDim2.new(0, 220, 0, 48)
IslandContainer.BackgroundTransparency = 1
IslandContainer.ZIndex = 1000
IslandContainer.Visible = true

local IslandBackground = Instance.new("Frame")
IslandBackground.Name = "IslandBackground"
IslandBackground.Parent = IslandContainer
IslandBackground.BackgroundColor3 = ColorPalette.IslandBackground
IslandBackground.Size = UDim2.new(1, 0, 1, 0)
IslandBackground.ZIndex = 1001

local IslandCorner = Instance.new("UICorner")
IslandCorner.CornerRadius = UDim.new(1, 0)
IslandCorner.Parent = IslandBackground

local IslandStroke = Instance.new("UIStroke")
IslandStroke.Parent = IslandBackground
IslandStroke.Color = ColorPalette.IslandBorder
IslandStroke.Thickness = 1.5
IslandStroke.Transparency = 0

local LogoContainer = Instance.new("Frame")
LogoContainer.Name = "LogoContainer"
LogoContainer.Parent = ScreenGui
LogoContainer.AnchorPoint = Vector2.new(1, 0)
LogoContainer.Position = UDim2.new(1, -20, 0.015, 0)
LogoContainer.Size = UDim2.new(0, 40, 0, 40)
LogoContainer.BackgroundTransparency = 1
LogoContainer.ZIndex = 1000
LogoContainer.Visible = true

local LogoBackground = Instance.new("Frame")
LogoBackground.Name = "LogoBackground"
LogoBackground.Parent = LogoContainer
LogoBackground.BackgroundColor3 = ColorPalette.AccentPurple
LogoBackground.Size = UDim2.new(1, 0, 1, 0)
LogoBackground.ZIndex = 1001

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoBackground

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Parent = LogoBackground
LogoStroke.Color = ColorPalette.TextLight
LogoStroke.Thickness = 2
LogoStroke.Transparency = 0

local LogoText = Instance.new("TextLabel")
LogoText.Name = "LogoText"
LogoText.Parent = LogoBackground
LogoText.BackgroundTransparency = 1
LogoText.Size = UDim2.new(1, 0, 1, 0)
LogoText.Font = Enum.Font.GothamBold
LogoText.Text = "SX"
LogoText.TextColor3 = ColorPalette.TextLight
LogoText.TextSize = 16
LogoText.ZIndex = 1002

local ColorBallsContainer = Instance.new("Frame")
ColorBallsContainer.Name = "ColorBalls"
ColorBallsContainer.Parent = IslandBackground
ColorBallsContainer.BackgroundTransparency = 1
ColorBallsContainer.Size = UDim2.new(0, 65, 1, 0)
ColorBallsContainer.Position = UDim2.new(0, 10, 0.5, 0)
ColorBallsContainer.AnchorPoint = Vector2.new(0, 0.5)
ColorBallsContainer.ZIndex = 1002

local colorBalls = {}
local ballColors = {
    ColorPalette.AccentRed,
    ColorPalette.AccentBlue,
    ColorPalette.AccentGreen
}

local ballPositions = {
    UDim2.new(0, 5, 0.5, 0),
    UDim2.new(0, 25, 0.5, 0),
    UDim2.new(0, 45, 0.5, 0)
}

for i = 1, 3 do
    local ball = Instance.new("Frame")
    ball.Name = "ColorBall_" .. i
    ball.Parent = ColorBallsContainer
    ball.BackgroundColor3 = ballColors[i]
    ball.Size = UDim2.new(0, 10, 0, 10)
    ball.Position = ballPositions[i]
    ball.AnchorPoint = Vector2.new(0, 0.5)
    ball.ZIndex = 1003
    
    local ballCorner = Instance.new("UICorner")
    ballCorner.CornerRadius = UDim.new(1, 0)
    ballCorner.Parent = ball
    
    local ballGlow = Instance.new("UIGradient")
    ballGlow.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ballColors[i]),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    })
    ballGlow.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0.2),
        NumberSequenceKeypoint.new(1, 0.5)
    })
    ballGlow.Rotation = 45
    ballGlow.Parent = ball
    
    local innerGlow = Instance.new("Frame")
    innerGlow.Name = "InnerGlow"
    innerGlow.Parent = ball
    innerGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    innerGlow.Size = UDim2.new(0.4, 0, 0.4, 0)
    innerGlow.Position = UDim2.new(0.3, 0, 0.3, 0)
    innerGlow.BackgroundTransparency = 0.4
    innerGlow.ZIndex = 1004
    
    local innerCorner = Instance.new("UICorner")
    innerCorner.CornerRadius = UDim.new(1, 0)
    innerCorner.Parent = innerGlow
    
    colorBalls[i] = ball
end

local IslandText = Instance.new("TextLabel")
IslandText.Name = "IslandText"
IslandText.Parent = IslandBackground
IslandText.BackgroundTransparency = 1
IslandText.Position = UDim2.new(0, 80, 0.5, 0)
IslandText.Size = UDim2.new(0, 130, 0.8, 0)
IslandText.AnchorPoint = Vector2.new(0, 0.5)
IslandText.Font = Enum.Font.GothamMedium
IslandText.Text = "SX UI - 就绪"
IslandText.TextColor3 = ColorPalette.TextLight
IslandText.TextSize = 12
IslandText.TextXAlignment = Enum.TextXAlignment.Left
IslandText.TextTruncate = Enum.TextTruncate.AtEnd
IslandText.ZIndex = 1002

local MainFrame = Instance.new("Frame")
MainFrame.Name = "Main"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 550, 0, 400)
MainFrame.BackgroundTransparency = 1
MainFrame.ZIndex = 10
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false

local BackgroundFrame = Instance.new("Frame")
BackgroundFrame.Name = "SpaceBackground"
BackgroundFrame.Parent = MainFrame
BackgroundFrame.BackgroundColor3 = ColorPalette.BackgroundDark
BackgroundFrame.Size = UDim2.new(1, 0, 1, 0)
BackgroundFrame.Position = UDim2.new(0, 0, 0, 0)
BackgroundFrame.ZIndex = -100

local MainUICorner = Instance.new("UICorner")
MainUICorner.CornerRadius = UDim.new(0, 14)
MainUICorner.Parent = BackgroundFrame

local MainUIStroke = Instance.new("UIStroke")
MainUIStroke.Parent = BackgroundFrame
MainUIStroke.Color = ColorPalette.IslandBorder
MainUIStroke.Thickness = 2
MainUIStroke.Transparency = 0

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ColorPalette.BackgroundDark),
    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(35, 35, 55)),
    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(50, 40, 70)),
    ColorSequenceKeypoint.new(1, ColorPalette.BackgroundDark)
})
MainGradient.Rotation = 45
MainGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.1),
    NumberSequenceKeypoint.new(0.5, 0.2),
    NumberSequenceKeypoint.new(1, 0.1)
})
MainGradient.Parent = BackgroundFrame

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = ColorPalette.BackgroundMedium
TopBar.BackgroundTransparency = 0.1
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.ZIndex = 11

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 14)
TopBarCorner.Parent = TopBar

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Parent = TopBar
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.Size = UDim2.new(0, 200, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "SX UI"
TitleText.TextColor3 = ColorPalette.TextLight
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.TextTransparency = 0

local SubTitleText = Instance.new("TextLabel")
SubTitleText.Name = "SubTitleText"
SubTitleText.Parent = TopBar
SubTitleText.BackgroundTransparency = 1
SubTitleText.Position = UDim2.new(0, 15, 0, 22)
TitleText.Size = UDim2.new(0, 200, 0, 15)
SubTitleText.Font = Enum.Font.Gotham
SubTitleText.Text = "多功能控制面板"
SubTitleText.TextColor3 = ColorPalette.TextGray
SubTitleText.TextSize = 11
SubTitleText.TextXAlignment = Enum.TextXAlignment.Left
SubTitleText.TextTransparency = 0

local SearchContainer = Instance.new("Frame")
SearchContainer.Name = "SearchContainer"
SearchContainer.Parent = TopBar
SearchContainer.BackgroundColor3 = ColorPalette.BackgroundLight
SearchContainer.BackgroundTransparency = 0.2
SearchContainer.Size = UDim2.new(0, 180, 0, 25)
SearchContainer.Position = UDim2.new(1, -200, 0.5, -12.5)
SearchContainer.AnchorPoint = Vector2.new(1, 0.5)
SearchContainer.ZIndex = 12

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 8)
SearchCorner.Parent = SearchContainer

local SearchIcon = Instance.new("ImageLabel")
SearchIcon.Name = "SearchIcon"
SearchIcon.Parent = SearchContainer
SearchIcon.Image = Icons.search
SearchIcon.ImageColor3 = ColorPalette.TextGray
SearchIcon.Size = UDim2.new(0, 16, 0, 16)
SearchIcon.Position = UDim2.new(0, 8, 0.5, -8)
SearchIcon.AnchorPoint = Vector2.new(0, 0.5)
SearchIcon.BackgroundTransparency = 1
SearchIcon.ZIndex = 13

local SearchBox = Instance.new("TextBox")
SearchBox.Name = "SearchBox"
SearchBox.Parent = SearchContainer
SearchBox.BackgroundTransparency = 1
SearchBox.Size = UDim2.new(1, -35, 1, 0)
SearchBox.Position = UDim2.new(0, 30, 0, 0)
SearchBox.Font = Enum.Font.GothamMedium
SearchBox.Text = ""
SearchBox.PlaceholderText = "搜索功能..."
SearchBox.PlaceholderColor3 = ColorPalette.TextGray
SearchBox.TextColor3 = ColorPalette.TextLight
SearchBox.TextSize = 12
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.ZIndex = 13

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Position = UDim2.new(1, -35, 0.5, -10)
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = ColorPalette.AccentPurple
MinimizeButton.TextSize = 24
MinimizeButton.ZIndex = 12
MinimizeButton.TextTransparency = 0

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "Content"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Size = UDim2.new(1, -20, 1, -60)
ContentFrame.Position = UDim2.new(0, 10, 0, 50)
ContentFrame.ZIndex = 11

local TabButtonsContainer = Instance.new("Frame")
TabButtonsContainer.Name = "TabButtons"
TabButtonsContainer.Parent = ContentFrame
TabButtonsContainer.BackgroundTransparency = 1
TabButtonsContainer.Size = UDim2.new(0, 150, 1, 0)
TabButtonsContainer.Position = UDim2.new(0, 0, 0, 0)

local TabButtonList = Instance.new("UIListLayout")
TabButtonList.Parent = TabButtonsContainer
TabButtonList.Padding = UDim.new(0, 8)
TabButtonList.SortOrder = Enum.SortOrder.LayoutOrder

local TabContentContainer = Instance.new("Frame")
TabContentContainer.Name = "TabContents"
TabContentContainer.Parent = ContentFrame
TabContentContainer.BackgroundTransparency = 1
TabContentContainer.Size = UDim2.new(1, -160, 1, 0)
TabContentContainer.Position = UDim2.new(0, 160, 0, 0)

local activeFeatures = {}
local inactiveFeatures = {}
local currentTab = nil
local isMinimized = false
local allElements = {}
local UI_Title = "SX UI"
local UI_SubTitle = "多功能控制面板"

function SX_UI:SetTitle(title, subtitle)
    if title then
        UI_Title = title
        TitleText.Text = title
    end
    if subtitle then
        UI_SubTitle = subtitle
        SubTitleText.Text = subtitle
    end
end

function SX_UI:UpdateIslandText()
    local enabledCount = #activeFeatures
    local disabledCount = #inactiveFeatures
    local text = "SX UI"
    
    if enabledCount > 0 then
        text = text .. " | 开:" .. enabledCount
    end
    if disabledCount > 0 then
        text = text .. " | 关:" .. disabledCount
    end
    
    IslandText.Text = text
end

function SX_UI:DigitalParticleExplosion(target)
    if not target then return end
    
    local mouse = Players.LocalPlayer:GetMouse()
    local absolutePosition = target.AbsolutePosition
    local absoluteSize = target.AbsoluteSize
    
    local relX = (mouse.X - absolutePosition.X) / absoluteSize.X
    local relY = (mouse.Y - absolutePosition.Y) / absoluteSize.Y
    
    local explosionCenter = Instance.new("Frame")
    explosionCenter.Name = "ExplosionCenter"
    explosionCenter.Parent = target
    explosionCenter.BackgroundColor3 = ColorPalette.AccentPurple
    explosionCenter.BackgroundTransparency = 0.3
    explosionCenter.ZIndex = 100
    explosionCenter.Size = UDim2.new(0, 20, 0, 20)
    explosionCenter.AnchorPoint = Vector2.new(0.5, 0.5)
    explosionCenter.Position = UDim2.new(relX, 0, relY, 0)
    
    local centerCorner = Instance.new("UICorner")
    centerCorner.CornerRadius = UDim.new(1, 0)
    centerCorner.Parent = explosionCenter
    
    local centerStroke = Instance.new("UIStroke")
    centerStroke.Parent = explosionCenter
    centerStroke.Color = ColorPalette.AccentPurple
    centerStroke.Thickness = 3
    centerStroke.Transparency = 0.2
    
    local particles = {}
    for i = 1, 12 do
        local particle = Instance.new("TextLabel")
        particle.Name = "DigitalParticle_" .. i
        particle.Parent = target
        particle.BackgroundTransparency = 1
        particle.Text = tostring(math.random(0, 1))
        particle.TextColor3 = Color3.fromRGB(
            math.random(170, 255),
            math.random(50, 170),
            math.random(170, 255)
        )
        particle.TextSize = math.random(10, 14)
        particle.Font = Enum.Font.Code
        particle.ZIndex = 101
        particle.Size = UDim2.new(0, 20, 0, 20)
        particle.Position = UDim2.new(relX, 0, relY, 0)
        particle.AnchorPoint = Vector2.new(0.5, 0.5)
        
        table.insert(particles, particle)
    end
    
    task.spawn(function()
        local startTime = tick()
        
        local centerTween = TweenService:Create(explosionCenter, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 40, 0, 40)
        })
        
        local strokeTween = TweenService:Create(centerStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Thickness = 8,
            Transparency = 1
        })
        
        centerTween:Play()
        strokeTween:Play()
        
        local connection
        connection = RunService.Heartbeat:Connect(function()
            local elapsed = tick() - startTime
            if elapsed > 0.8 then
                connection:Disconnect()
                for _, particle in pairs(particles) do
                    particle:Destroy()
                end
                explosionCenter:Destroy()
                return
            end
            
            local progress = elapsed / 0.8
            
            local angles = {
                0, 30, 60, 90, 120, 150, 
                180, 210, 240, 270, 300, 330
            }
            
            for i, particle in pairs(particles) do
                local angle = math.rad(angles[i] or (i * 30))
                local distance = 100 * progress
                local xOffset = math.cos(angle) * distance
                local yOffset = math.sin(angle) * distance
                
                particle.Position = UDim2.new(relX, xOffset, relY, yOffset)
                particle.Rotation = angles[i] * progress
                particle.TextTransparency = progress
            end
            
            explosionCenter.Size = UDim2.new(0, 40 + 20 * progress, 0, 40 + 20 * progress)
        end)
    end)
end

local function toggleMinimize()
    SX_UI:DigitalParticleExplosion(MinimizeButton)
    
    if isMinimized then
        MinimizeButton.Text = "−"
        
        local frameTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 550, 0, 400),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        
        local strokeTween = TweenService:Create(MainUIStroke, TweenInfo.new(0.5), {
            Transparency = 0
        })
        
        frameTween:Play()
        strokeTween:Play()
        
        TweenService:Create(IslandContainer, TweenInfo.new(0.3), {
            Position = UDim2.new(0.5, 0, -0.05, 0)
        }):Play()
        
        MainFrame.Visible = true
        isMinimized = false
    else
        MinimizeButton.Text = "+"
        
        local frameTween = TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        
        local strokeTween = TweenService:Create(MainUIStroke, TweenInfo.new(0.3), {
            Transparency = 1
        })
        
        frameTween:Play()
        strokeTween:Play()
        
        TweenService:Create(IslandContainer, TweenInfo.new(0.3), {
            Position = UDim2.new(0.5, 0, 0.015, 0)
        }):Play()
        
        task.wait(0.4)
        MainFrame.Visible = false
        isMinimized = true
    end
end

local function toggleFromIsland()
    SX_UI:DigitalParticleExplosion(IslandBackground)
    
    if MainFrame.Visible then
        toggleMinimize()
    else
        if isMinimized then
            toggleMinimize()
        end
    end
end

local function toggleFromLogo()
    SX_UI:DigitalParticleExplosion(LogoBackground)
    
    if MainFrame.Visible then
        toggleMinimize()
    else
        if isMinimized then
            toggleMinimize()
        end
    end
end

IslandBackground.MouseButton1Click:Connect(toggleFromIsland)
LogoBackground.MouseButton1Click:Connect(toggleFromLogo)
MinimizeButton.MouseButton1Click:Connect(toggleMinimize)

local function createSection(parent, position)
    local section = Instance.new("Frame")
    section.Name = "Section"
    section.Parent = parent
    section.BackgroundTransparency = 1
    section.Size = UDim2.new(0.48, 0, 1, 0)
    
    if position == 'left' then
        section.Position = UDim2.new(0, 0, 0, 0)
    elseif position == 'right' then
        section.Position = UDim2.new(0.52, 0, 0, 0)
    else
        section.Size = UDim2.new(1, 0, 1, 0)
        section.Position = UDim2.new(0, 0, 0, 0)
    end
    
    local sectionList = Instance.new("UIListLayout")
    sectionList.Parent = section
    sectionList.Padding = UDim.new(0, 10)
    sectionList.SortOrder = Enum.SortOrder.LayoutOrder
    
    return section
end

function SX_UI:DrawWindow(config)
    local windowTitle = config.Name or "SX UI"
    local windowSubTitle = config.SubTitle or "多功能控制面板"
    
    self:SetTitle(windowTitle, windowSubTitle)
    
    local window = {}
    local tabs = {}
    
    function window:DrawTab(config)
        local tabName = config.Name or "标签页"
        local tabIcon = config.Icon or "gear"
        local enableScrolling = config.EnableScrolling or true
        
        local tabButton = Instance.new("TextButton")
        tabButton.Name = "Tab_" .. tabName
        tabButton.Parent = TabButtonsContainer
        tabButton.BackgroundColor3 = ColorPalette.BackgroundLight
        tabButton.BackgroundTransparency = 0.3
        tabButton.Size = UDim2.new(1, 0, 0, 40)
        tabButton.Font = Enum.Font.GothamMedium
        tabButton.Text = ""
        tabButton.TextColor3 = ColorPalette.TextGray
        tabButton.TextSize = 14
        tabButton.AutoButtonColor = false
        
        local tabButtonCorner = Instance.new("UICorner")
        tabButtonCorner.CornerRadius = UDim.new(0, 10)
        tabButtonCorner.Parent = tabButton
        
        local iconImage = Instance.new("ImageLabel")
        iconImage.Name = "Icon"
        iconImage.Parent = tabButton
        iconImage.Image = Icons[tabIcon] or Icons.gear
        iconImage.ImageColor3 = ColorPalette.TextGray
        iconImage.Size = UDim2.new(0, 20, 0, 20)
        iconImage.Position = UDim2.new(0, 15, 0.5, -10)
        iconImage.AnchorPoint = Vector2.new(0, 0.5)
        iconImage.BackgroundTransparency = 1
        
        local label = Instance.new("TextLabel")
        label.Name = "Label"
        label.Parent = tabButton
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, -50, 1, 0)
        label.Position = UDim2.new(0, 45, 0, 0)
        label.Font = Enum.Font.GothamMedium
        label.Text = tabName
        label.TextColor3 = ColorPalette.TextGray
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left
        
        local tabContent = Instance.new("Frame")
        tabContent.Name = "Content_" .. tabName
        tabContent.Parent = TabContentContainer
        tabContent.BackgroundTransparency = 1
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.Visible = false
        
        local contentScroll
        if enableScrolling then
            contentScroll = Instance.new("ScrollingFrame")
            contentScroll.Name = "Scroll"
            contentScroll.Parent = tabContent
            contentScroll.BackgroundTransparency = 1
            contentScroll.Size = UDim2.new(1, 0, 1, 0)
            contentScroll.ScrollBarThickness = 4
            contentScroll.ScrollBarImageColor3 = ColorPalette.AccentPurple
            contentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            contentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
        else
            contentScroll = Instance.new("Frame")
            contentScroll.Name = "ContentArea"
            contentScroll.Parent = tabContent
            contentScroll.BackgroundTransparency = 1
            contentScroll.Size = UDim2.new(1, 0, 1, 0)
        end
        
        local contentList = Instance.new("UIListLayout")
        contentList.Parent = contentScroll
        contentList.Padding = UDim.new(0, 15)
        contentList.SortOrder = Enum.SortOrder.LayoutOrder
        
        local contentPadding = Instance.new("UIPadding")
        contentPadding.Parent = contentScroll
        contentPadding.PaddingTop = UDim.new(0, 10)
        contentPadding.PaddingBottom = UDim.new(0, 10)
        contentPadding.PaddingLeft = UDim.new(0, 5)
        contentPadding.PaddingRight = UDim.new(0, 5)
        
        local tabData = {
            Button = tabButton,
            Content = tabContent,
            Scroll = contentScroll,
            Sections = {}
        }
        table.insert(tabs, tabData)
        
        local function switchToTab()
            if currentTab then
                currentTab.Button.BackgroundColor3 = ColorPalette.BackgroundLight
                currentTab.Button.BackgroundTransparency = 0.3
                currentTab.Button.Icon.ImageColor3 = ColorPalette.TextGray
                currentTab.Button.Label.TextColor3 = ColorPalette.TextGray
                currentTab.Content.Visible = false
            end
            
            currentTab = tabData
            
            local buttonTween = TweenService:Create(tabButton, TweenInfo.new(0.3), {
                BackgroundColor3 = ColorPalette.AccentPurple,
                BackgroundTransparency = 0.1
            })
            
            local iconTween = TweenService:Create(iconImage, TweenInfo.new(0.3), {
                ImageColor3 = ColorPalette.TextLight
            })
            
            local labelTween = TweenService:Create(label, TweenInfo.new(0.3), {
                TextColor3 = ColorPalette.TextLight
            })
            
            buttonTween:Play()
            iconTween:Play()
            labelTween:Play()
            tabContent.Visible = true
            
            SX_UI:DigitalParticleExplosion(tabButton)
        end
        
        tabButton.MouseButton1Click:Connect(switchToTab)
        
        if #tabs == 1 then
            switchToTab()
        end
        
        local tabMethods = {}
        
        function tabMethods:DrawSection(config)
            local sectionName = config.Name or "区域"
            local sectionPosition = config.Position or 'full'
            
            local section = createSection(contentScroll, sectionPosition)
            section.Name = "Section_" .. sectionName
            
            local sectionHeader = Instance.new("Frame")
            sectionHeader.Name = "Header"
            sectionHeader.Parent = section
            sectionHeader.BackgroundTransparency = 1
            sectionHeader.Size = UDim2.new(1, 0, 0, 30)
            
            local headerLabel = Instance.new("TextLabel")
            headerLabel.Name = "Label"
            headerLabel.Parent = sectionHeader
            headerLabel.BackgroundTransparency = 1
            headerLabel.Size = UDim2.new(1, 0, 1, 0)
            headerLabel.Font = Enum.Font.GothamBold
            headerLabel.Text = sectionName
            headerLabel.TextColor3 = ColorPalette.TextLight
            headerLabel.TextSize = 16
            headerLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local sectionContent = Instance.new("Frame")
            sectionContent.Name = "Content"
            sectionContent.Parent = section
            sectionContent.BackgroundTransparency = 1
            sectionContent.Size = UDim2.new(1, 0, 0, 0)
            sectionContent.AutomaticSize = Enum.AutomaticSize.Y
            
            local contentList = Instance.new("UIListLayout")
            contentList.Parent = sectionContent
            contentList.Padding = UDim.new(0, 8)
            contentList.SortOrder = Enum.SortOrder.LayoutOrder
            
            local sectionData = {
                Container = section,
                Header = sectionHeader,
                Content = sectionContent
            }
            table.insert(tabData.Sections, sectionData)
            
            local sectionMethods = {}
            
            function sectionMethods:AddButton(config)
                local buttonName = config.Name or "按钮"
                local buttonDesc = config.Description or ""
                local buttonIcon = config.Icon or "plus"
                local callback = config.Callback or function() end
                
                local buttonFrame = Instance.new("Frame")
                buttonFrame.Name = "Button_" .. buttonName
                buttonFrame.Parent = sectionContent
                buttonFrame.BackgroundColor3 = ColorPalette.BackgroundLight
                buttonFrame.BackgroundTransparency = 0.2
                buttonFrame.Size = UDim2.new(1, 0, 0, 45)
                
                local buttonCorner = Instance.new("UICorner")
                buttonCorner.CornerRadius = UDim.new(0, 10)
                buttonCorner.Parent = buttonFrame
                
                local buttonStroke = Instance.new("UIStroke")
                buttonStroke.Parent = buttonFrame
                buttonStroke.Color = ColorPalette.AccentPurple
                buttonStroke.Thickness = 1
                buttonStroke.Transparency = 0.5
                
                local icon = Instance.new("ImageLabel")
                icon.Name = "Icon"
                icon.Parent = buttonFrame
                icon.Image = Icons[buttonIcon] or Icons.plus
                icon.ImageColor3 = ColorPalette.AccentPurple
                icon.Size = UDim2.new(0, 20, 0, 20)
                icon.Position = UDim2.new(0, 15, 0.5, -10)
                icon.AnchorPoint = Vector2.new(0, 0.5)
                icon.BackgroundTransparency = 1
                
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Parent = buttonFrame
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(1, -50, 0.6, 0)
                label.Position = UDim2.new(0, 45, 0, 8)
                label.Font = Enum.Font.GothamMedium
                label.Text = buttonName
                label.TextColor3 = ColorPalette.TextLight
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Left
                
                local desc = Instance.new("TextLabel")
                desc.Name = "Description"
                desc.Parent = buttonFrame
                desc.BackgroundTransparency = 1
                desc.Size = UDim2.new(1, -50, 0.4, 0)
                desc.Position = UDim2.new(0, 45, 0, 28)
                desc.Font = Enum.Font.Gotham
                desc.Text = buttonDesc
                desc.TextColor3 = ColorPalette.TextGray
                desc.TextSize = 11
                desc.TextXAlignment = Enum.TextXAlignment.Left
                desc.TextTruncate = Enum.TextTruncate.AtEnd
                
                local button = Instance.new("TextButton")
                button.Name = "Button"
                button.Parent = buttonFrame
                button.BackgroundTransparency = 1
                button.Size = UDim2.new(1, 0, 1, 0)
                button.Text = ""
                
                button.MouseButton1Click:Connect(function()
                    SX_UI:DigitalParticleExplosion(buttonFrame)
                    callback()
                end)
                
                button.MouseEnter:Connect(function()
                    TweenService:Create(buttonFrame, TweenInfo.new(0.2), {
                        BackgroundTransparency = 0
                    }):Play()
                    TweenService:Create(buttonStroke, TweenInfo.new(0.2), {
                        Transparency = 0.3
                    }):Play()
                end)
                
                button.MouseLeave:Connect(function()
                    TweenService:Create(buttonFrame, TweenInfo.new(0.2), {
                        BackgroundTransparency = 0.2
                    }):Play()
                    TweenService:Create(buttonStroke, TweenInfo.new(0.2), {
                        Transparency = 0.5
                    }):Play()
                end)
                
                local buttonData = {
                    Frame = buttonFrame,
                    Button = button,
                    Label = label,
                    Description = desc,
                    Icon = icon
                }
                table.insert(allElements, buttonData)
                
                return buttonData
            end
            
            function sectionMethods:AddToggle(config)
                local toggleName = config.Name or "开关"
                local toggleDesc = config.Description or ""
                local defaultValue = config.Default or false
                local toggleIcon = config.Icon or "check"
                local callback = config.Callback or function() end
                local flagName = config.Flag or toggleName
                
                local toggleFrame = Instance.new("Frame")
                toggleFrame.Name = "Toggle_" .. toggleName
                toggleFrame.Parent = sectionContent
                toggleFrame.BackgroundColor3 = ColorPalette.BackgroundLight
                toggleFrame.BackgroundTransparency = 0.2
                toggleFrame.Size = UDim2.new(1, 0, 0, 45)
                
                local toggleCorner = Instance.new("UICorner")
                toggleCorner.CornerRadius = UDim.new(0, 10)
                toggleCorner.Parent = toggleFrame
                
                local toggleStroke = Instance.new("UIStroke")
                toggleStroke.Parent = toggleFrame
                toggleStroke.Color = ColorPalette.AccentPurple
                toggleStroke.Thickness = 1
                toggleStroke.Transparency = 0.5
                
                local icon = Instance.new("ImageLabel")
                icon.Name = "Icon"
                icon.Parent = toggleFrame
                icon.Image = Icons[toggleIcon] or Icons.check
                icon.ImageColor3 = ColorPalette.AccentPurple
                icon.Size = UDim2.new(0, 20, 0, 20)
                icon.Position = UDim2.new(0, 15, 0.5, -10)
                icon.AnchorPoint = Vector2.new(0, 0.5)
                icon.BackgroundTransparency = 1
                
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Parent = toggleFrame
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(1, -50, 0.6, 0)
                label.Position = UDim2.new(0, 45, 0, 8)
                label.Font = Enum.Font.GothamMedium
                label.Text = toggleName
                label.TextColor3 = ColorPalette.TextLight
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Left
                
                local desc = Instance.new("TextLabel")
                desc.Name = "Description"
                desc.Parent = toggleFrame
                desc.BackgroundTransparency = 1
                desc.Size = UDim2.new(1, -50, 0.4, 0)
                desc.Position = UDim2.new(0, 45, 0, 28)
                desc.Font = Enum.Font.Gotham
                desc.Text = toggleDesc
                desc.TextColor3 = ColorPalette.TextGray
                desc.TextSize = 11
                desc.TextXAlignment = Enum.TextXAlignment.Left
                desc.TextTruncate = Enum.TextTruncate.AtEnd
                
                local toggleButton = Instance.new("TextButton")
                toggleButton.Name = "ToggleButton"
                toggleButton.Parent = toggleFrame
                toggleButton.BackgroundColor3 = ColorPalette.BackgroundMedium
                toggleButton.Size = UDim2.new(0, 50, 0, 25)
                toggleButton.Position = UDim2.new(1, -65, 0.5, -12.5)
                toggleButton.AnchorPoint = Vector2.new(1, 0.5)
                toggleButton.Font = Enum.Font.GothamMedium
                toggleButton.Text = ""
                toggleButton.AutoButtonColor = false
                
                local buttonCorner = Instance.new("UICorner")
                buttonCorner.CornerRadius = UDim.new(1, 0)
                buttonCorner.Parent = toggleButton
                
                local toggleDot = Instance.new("Frame")
                toggleDot.Name = "ToggleDot"
                toggleDot.Parent = toggleButton
                toggleDot.BackgroundColor3 = ColorPalette.TextLight
                toggleDot.Size = UDim2.new(0, 19, 0, 19)
                toggleDot.Position = defaultValue and UDim2.new(1, -22, 0.5, -9.5) or UDim2.new(0, 3, 0.5, -9.5)
                toggleDot.AnchorPoint = Vector2.new(0.5, 0.5)
                
                local dotCorner = Instance.new("UICorner")
                dotCorner.CornerRadius = UDim.new(1, 0)
                dotCorner.Parent = toggleDot
                
                local isToggled = defaultValue
                
                local function updateToggle()
                    if isToggled then
                        TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                            BackgroundColor3 = ColorPalette.AccentPurple
                        }):Play()
                        TweenService:Create(toggleDot, TweenInfo.new(0.3), {
                            Position = UDim2.new(1, -22, 0.5, -9.5)
                        }):Play()
                        
                        if not table.find(activeFeatures, toggleName) then
                            table.insert(activeFeatures, toggleName)
                        end
                        if table.find(inactiveFeatures, toggleName) then
                            local index = table.find(inactiveFeatures, toggleName)
                            table.remove(inactiveFeatures, index)
                        end
                    else
                        TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                            BackgroundColor3 = ColorPalette.BackgroundMedium
                        }):Play()
                        TweenService:Create(toggleDot, TweenInfo.new(0.3), {
                            Position = UDim2.new(0, 3, 0.5, -9.5)
                        }):Play()
                        
                        if not table.find(inactiveFeatures, toggleName) then
                            table.insert(inactiveFeatures, toggleName)
                        end
                        if table.find(activeFeatures, toggleName) then
                            local index = table.find(activeFeatures, toggleName)
                            table.remove(activeFeatures, index)
                        end
                    end
                    
                    SX_UI:UpdateIslandText()
                    callback(isToggled)
                end
                
                toggleButton.MouseButton1Click:Connect(function()
                    isToggled = not isToggled
                    SX_UI:DigitalParticleExplosion(toggleButton)
                    updateToggle()
                end)
                
                local button = Instance.new("TextButton")
                button.Name = "Button"
                button.Parent = toggleFrame
                button.BackgroundTransparency = 1
                button.Size = UDim2.new(1, -120, 1, 0)
                button.Text = ""
                
                button.MouseButton1Click:Connect(function()
                    isToggled = not isToggled
                    SX_UI:DigitalParticleExplosion(toggleFrame)
                    updateToggle()
                end)
                
                button.MouseEnter:Connect(function()
                    TweenService:Create(toggleFrame, TweenInfo.new(0.2), {
                        BackgroundTransparency = 0
                    }):Play()
                    TweenService:Create(toggleStroke, TweenInfo.new(0.2), {
                        Transparency = 0.3
                    }):Play()
                end)
                
                button.MouseLeave:Connect(function()
                    TweenService:Create(toggleFrame, TweenInfo.new(0.2), {
                        BackgroundTransparency = 0.2
                    }):Play()
                    TweenService:Create(toggleStroke, TweenInfo.new(0.2), {
                        Transparency = 0.5
                    }):Play()
                end)
                
                updateToggle()
                
                local toggleData = {
                    Frame = toggleFrame,
                    Button = button,
                    ToggleButton = toggleButton,
                    Label = label,
                    Description = desc,
                    Icon = icon,
                    Value = isToggled,
                    Set = function(self, value)
                        if value ~= isToggled then
                            isToggled = value
                            updateToggle()
                        end
                    end,
                    Get = function(self)
                        return isToggled
                    end
                }
                table.insert(allElements, toggleData)
                
                return toggleData
            end
            
            function sectionMethods:AddSlider(config)
                local sliderName = config.Name or "滑条"
                local sliderDesc = config.Description or ""
                local minValue = config.Min or 0
                local maxValue = config.Max or 100
                local defaultValue = config.Default or 50
                local sliderIcon = config.Icon or "slider"
                local callback = config.Callback or function() end
                
                local sliderFrame = Instance.new("Frame")
                sliderFrame.Name = "Slider_" .. sliderName
                sliderFrame.Parent = sectionContent
                sliderFrame.BackgroundColor3 = ColorPalette.BackgroundLight
                sliderFrame.BackgroundTransparency = 0.2
                sliderFrame.Size = UDim2.new(1, 0, 0, 60)
                
                local sliderCorner = Instance.new("UICorner")
                sliderCorner.CornerRadius = UDim.new(0, 10)
                sliderCorner.Parent = sliderFrame
                
                local sliderStroke = Instance.new("UIStroke")
                sliderStroke.Parent = sliderFrame
                sliderStroke.Color = ColorPalette.AccentPurple
                sliderStroke.Thickness = 1
                sliderStroke.Transparency = 0.5
                
                local icon = Instance.new("ImageLabel")
                icon.Name = "Icon"
                icon.Parent = sliderFrame
                icon.Image = Icons[sliderIcon] or Icons.slider
                icon.ImageColor3 = ColorPalette.AccentPurple
                icon.Size = UDim2.new(0, 20, 0, 20)
                icon.Position = UDim2.new(0, 15, 0, 10)
                icon.BackgroundTransparency = 1
                
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Parent = sliderFrame
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(1, -50, 0, 20)
                label.Position = UDim2.new(0, 45, 0, 10)
                label.Font = Enum.Font.GothamMedium
                label.Text = sliderName
                label.TextColor3 = ColorPalette.TextLight
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Left
                
                local desc = Instance.new("TextLabel")
                desc.Name = "Description"
                desc.Parent = sliderFrame
                desc.BackgroundTransparency = 1
                desc.Size = UDim2.new(0.7, 0, 0, 15)
                desc.Position = UDim2.new(0, 45, 0, 30)
                desc.Font = Enum.Font.Gotham
                desc.Text = sliderDesc
                desc.TextColor3 = ColorPalette.TextGray
                desc.TextSize = 11
                desc.TextXAlignment = Enum.TextXAlignment.Left
                desc.TextTruncate = Enum.TextTruncate.AtEnd
                
                local valueLabel = Instance.new("TextLabel")
                valueLabel.Name = "Value"
                valueLabel.Parent = sliderFrame
                valueLabel.BackgroundTransparency = 1
                valueLabel.Size = UDim2.new(0, 50, 0, 20)
                valueLabel.Position = UDim2.new(1, -60, 0, 10)
                valueLabel.Font = Enum.Font.GothamBold
                valueLabel.Text = tostring(defaultValue)
                valueLabel.TextColor3 = ColorPalette.AccentPurple
                valueLabel.TextSize = 14
                valueLabel.TextXAlignment = Enum.TextXAlignment.Right
                
                local sliderBar = Instance.new("Frame")
                sliderBar.Name = "SliderBar"
                sliderBar.Parent = sliderFrame
                sliderBar.BackgroundColor3 = ColorPalette.BackgroundMedium
                sliderBar.Size = UDim2.new(1, -30, 0, 6)
                sliderBar.Position = UDim2.new(0, 15, 1, -20)
                sliderBar.AnchorPoint = Vector2.new(0, 1)
                
                local barCorner = Instance.new("UICorner")
                barCorner.CornerRadius = UDim.new(1, 0)
                barCorner.Parent = sliderBar
                
                local sliderFill = Instance.new("Frame")
                sliderFill.Name = "SliderFill"
                sliderFill.Parent = sliderBar
                sliderFill.BackgroundColor3 = ColorPalette.AccentPurple
                sliderFill.Size = UDim2.new((defaultValue - minValue) / (maxValue - minValue), 0, 1, 0)
                
                local fillCorner = Instance.new("UICorner")
                fillCorner.CornerRadius = UDim.new(1, 0)
                fillCorner.Parent = sliderFill
                
                local sliderDot = Instance.new("Frame")
                sliderDot.Name = "SliderDot"
                sliderDot.Parent = sliderBar
                sliderDot.BackgroundColor3 = ColorPalette.TextLight
                sliderDot.Size = UDim2.new(0, 12, 0, 12)
                sliderDot.Position = UDim2.new((defaultValue - minValue) / (maxValue - minValue), -6, 0.5, -6)
                sliderDot.AnchorPoint = Vector2.new(0, 0.5)
                
                local dotCorner = Instance.new("UICorner")
                dotCorner.CornerRadius = UDim.new(1, 0)
                dotCorner.Parent = sliderDot
                
                local currentValue = defaultValue
                local isDragging = false
                
                local function updateSlider(value, fromInput)
                    currentValue = math.clamp(value, minValue, maxValue)
                    local percent = (currentValue - minValue) / (maxValue - minValue)
                    
                    sliderFill.Size = UDim2.new(percent, 0, 1, 0)
                    sliderDot.Position = UDim2.new(percent, -6, 0.5, -6)
                    valueLabel.Text = tostring(math.floor(currentValue))
                    
                    if fromInput then
                        SX_UI:DigitalParticleExplosion(sliderDot)
                    end
                    
                    callback(currentValue)
                end
                
                sliderBar.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDragging = true
                        local mouse = Players.LocalPlayer:GetMouse()
                        local relativeX = (mouse.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X
                        local newValue = minValue + (maxValue - minValue) * math.clamp(relativeX, 0, 1)
                        updateSlider(newValue, true)
                    end
                end)
                
                sliderBar.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDragging = false
                    end
                end)
                
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local mouse = Players.LocalPlayer:GetMouse()
                        local relativeX = (mouse.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X
                        local newValue = minValue + (maxValue - minValue) * math.clamp(relativeX, 0, 1)
                        updateSlider(newValue, false)
                    end
                end)
                
                local sliderData = {
                    Frame = sliderFrame,
                    Label = label,
                    Description = desc,
                    Icon = icon,
                    ValueLabel = valueLabel,
                    Value = currentValue,
                    Set = function(self, value)
                        updateSlider(value, true)
                    end,
                    Get = function(self)
                        return currentValue
                    end
                }
                table.insert(allElements, sliderData)
                
                return sliderData
            end
            
            function sectionMethods:AddDropdown(config)
                local dropdownName = config.Name or "下拉框"
                local dropdownDesc = config.Description or ""
                local options = config.Options or {"选项1", "选项2", "选项3"}
                local defaultValue = config.Default or options[1]
                local dropdownIcon = config.Icon or "list"
                local callback = config.Callback or function() end
                
                local dropdownFrame = Instance.new("Frame")
                dropdownFrame.Name = "Dropdown_" .. dropdownName
                dropdownFrame.Parent = sectionContent
                dropdownFrame.BackgroundColor3 = ColorPalette.BackgroundLight
                dropdownFrame.BackgroundTransparency = 0.2
                dropdownFrame.Size = UDim2.new(1, 0, 0, 45)
                dropdownFrame.ClipsDescendants = true
                
                local dropdownCorner = Instance.new("UICorner")
                dropdownCorner.CornerRadius = UDim.new(0, 10)
                dropdownCorner.Parent = dropdownFrame
                
                local dropdownStroke = Instance.new("UIStroke")
                dropdownStroke.Parent = dropdownFrame
                dropdownStroke.Color = ColorPalette.AccentPurple
                dropdownStroke.Thickness = 1
                dropdownStroke.Transparency = 0.5
                
                local icon = Instance.new("ImageLabel")
                icon.Name = "Icon"
                icon.Parent = dropdownFrame
                icon.Image = Icons[dropdownIcon] or Icons.list
                icon.ImageColor3 = ColorPalette.AccentPurple
                icon.Size = UDim2.new(0, 20, 0, 20)
                icon.Position = UDim2.new(0, 15, 0.5, -10)
                icon.AnchorPoint = Vector2.new(0, 0.5)
                icon.BackgroundTransparency = 1
                
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Parent = dropdownFrame
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(1, -50, 0.6, 0)
                label.Position = UDim2.new(0, 45, 0, 8)
                label.Font = Enum.Font.GothamMedium
                label.Text = dropdownName
                label.TextColor3 = ColorPalette.TextLight
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Left
                
                local desc = Instance.new("TextLabel")
                desc.Name = "Description"
                desc.Parent = dropdownFrame
                desc.BackgroundTransparency = 1
                desc.Size = UDim2.new(1, -50, 0.4, 0)
                desc.Position = UDim2.new(0, 45, 0, 28)
                desc.Font = Enum.Font.Gotham
                desc.Text = dropdownDesc
                desc.TextColor3 = ColorPalette.TextGray
                desc.TextSize = 11
                desc.TextXAlignment = Enum.TextXAlignment.Left
                desc.TextTruncate = Enum.TextTruncate.AtEnd
                
                local currentValue = defaultValue
                local isOpen = false
                
                local valueButton = Instance.new("TextButton")
                valueButton.Name = "ValueButton"
                valueButton.Parent = dropdownFrame
                valueButton.BackgroundColor3 = ColorPalette.BackgroundMedium
                valueButton.Size = UDim2.new(0, 120, 0, 25)
                valueButton.Position = UDim2.new(1, -130, 0.5, -12.5)
                valueButton.AnchorPoint = Vector2.new(1, 0.5)
                valueButton.Font = Enum.Font.GothamMedium
                valueButton.Text = currentValue
                valueButton.TextColor3 = ColorPalette.TextLight
                valueButton.TextSize = 12
                valueButton.AutoButtonColor = false
                
                local valueCorner = Instance.new("UICorner")
                valueCorner.CornerRadius = UDim.new(0, 8)
                valueCorner.Parent = valueButton
                
                local arrow = Instance.new("ImageLabel")
                arrow.Name = "Arrow"
                arrow.Parent = valueButton
                arrow.Image = Icons.arrow_down
                arrow.ImageColor3 = ColorPalette.TextLight
                arrow.Size = UDim2.new(0, 12, 0, 12)
                arrow.Position = UDim2.new(1, -15, 0.5, -6)
                arrow.AnchorPoint = Vector2.new(1, 0.5)
                arrow.BackgroundTransparency = 1
                
                local optionsFrame = Instance.new("Frame")
                optionsFrame.Name = "Options"
                optionsFrame.Parent = dropdownFrame
                optionsFrame.BackgroundColor3 = ColorPalette.BackgroundDark
                optionsFrame.Size = UDim2.new(1, -20, 0, 0)
                optionsFrame.Position = UDim2.new(0, 10, 1, 5)
                optionsFrame.ClipsDescendants = true
                optionsFrame.Visible = false
                
                local optionsCorner = Instance.new("UICorner")
                optionsCorner.CornerRadius = UDim.new(0, 8)
                optionsCorner.Parent = optionsFrame
                
                local optionsStroke = Instance.new("UIStroke")
                optionsStroke.Parent = optionsFrame
                optionsStroke.Color = ColorPalette.AccentPurple
                optionsStroke.Thickness = 1
                
                local optionsList = Instance.new("UIListLayout")
                optionsList.Parent = optionsFrame
                optionsList.Padding = UDim.new(0, 2)
                optionsList.SortOrder = Enum.SortOrder.LayoutOrder
                
                local optionsPadding = Instance.new("UIPadding")
                optionsPadding.Parent = optionsFrame
                optionsPadding.PaddingTop = UDim.new(0, 5)
                optionsPadding.PaddingBottom = UDim.new(0, 5)
                optionsPadding.PaddingLeft = UDim.new(0, 5)
                optionsPadding.PaddingRight = UDim.new(0, 5)
                
                local function createOption(optionText)
                    local optionButton = Instance.new("TextButton")
                    optionButton.Name = "Option_" .. optionText
                    optionButton.Parent = optionsFrame
                    optionButton.BackgroundColor3 = ColorPalette.BackgroundLight
                    optionButton.BackgroundTransparency = 0.3
                    optionButton.Size = UDim2.new(1, 0, 0, 25)
                    optionButton.Font = Enum.Font.GothamMedium
                    optionButton.Text = optionText
                    optionButton.TextColor3 = optionText == currentValue and ColorPalette.AccentPurple or ColorPalette.TextLight
                    optionButton.TextSize = 12
                    optionButton.AutoButtonColor = false
                    
                    local optionCorner = Instance.new("UICorner")
                    optionCorner.CornerRadius = UDim.new(0, 6)
                    optionCorner.Parent = optionButton
                    
                    optionButton.MouseButton1Click:Connect(function()
                        currentValue = optionText
                        valueButton.Text = currentValue
                        SX_UI:DigitalParticleExplosion(optionButton)
                        callback(currentValue)
                        
                        for _, child in pairs(optionsFrame:GetChildren()) do
                            if child:IsA("TextButton") then
                                child.TextColor3 = child.Text == currentValue and ColorPalette.AccentPurple or ColorPalette.TextLight
                            end
                        end
                        
                        TweenService:Create(optionsFrame, TweenInfo.new(0.3), {
                            Size = UDim2.new(1, -20, 0, 0)
                        }):Play()
                        task.wait(0.3)
                        optionsFrame.Visible = false
                        isOpen = false
                        TweenService:Create(arrow, TweenInfo.new(0.3), {
                            Rotation = 0
                        }):Play()
                    end)
                    
                    optionButton.MouseEnter:Connect(function()
                        TweenService:Create(optionButton, TweenInfo.new(0.2), {
                            BackgroundTransparency = 0.1
                        }):Play()
                    end)
                    
                    optionButton.MouseLeave:Connect(function()
                        TweenService:Create(optionButton, TweenInfo.new(0.2), {
                            BackgroundTransparency = 0.3
                        }):Play()
                    end)
                end
                
                for _, option in pairs(options) do
                    createOption(option)
                end
                
                local function toggleDropdown()
                    isOpen = not isOpen
                    
                    if isOpen then
                        optionsFrame.Visible = true
                        local optionCount = #options
                        local newHeight = math.min(optionCount * 27 + 10, 150)
                        TweenService:Create(optionsFrame, TweenInfo.new(0.3), {
                            Size = UDim2.new(1, -20, 0, newHeight)
                        }):Play()
                        TweenService:Create(arrow, TweenInfo.new(0.3), {
                            Rotation = 180
                        }):Play()
                        SX_UI:DigitalParticleExplosion(valueButton)
                    else
                        TweenService:Create(optionsFrame, TweenInfo.new(0.3), {
                            Size = UDim2.new(1, -20, 0, 0)
                        }):Play()
                        task.wait(0.3)
                        optionsFrame.Visible = false
                        TweenService:Create(arrow, TweenInfo.new(0.3), {
                            Rotation = 0
                        }):Play()
                    end
                end
                
                valueButton.MouseButton1Click:Connect(toggleDropdown)
                
                local dropdownData = {
                    Frame = dropdownFrame,
                    ValueButton = valueButton,
                    Label = label,
                    Description = desc,
                    Icon = icon,
                    Value = currentValue,
                    Set = function(self, value)
                        if table.find(options, value) then
                            currentValue = value
                            valueButton.Text = currentValue
                            callback(currentValue)
                            
                            for _, child in pairs(optionsFrame:GetChildren()) do
                                if child:IsA("TextButton") then
                                    child.TextColor3 = child.Text == currentValue and ColorPalette.AccentPurple or ColorPalette.TextLight
                                end
                            end
                        end
                    end,
                    Get = function(self)
                        return currentValue
                    end
                }
                table.insert(allElements, dropdownData)
                
                return dropdownData
            end
            
            function sectionMethods:AddTextBox(config)
                local textboxName = config.Name or "输入框"
                local textboxDesc = config.Description or ""
                local defaultValue = config.Default or ""
                local placeholder = config.Placeholder or "输入文本..."
                local textboxIcon = config.Icon or "edit"
                local callback = config.Callback or function() end
                
                local textboxFrame = Instance.new("Frame")
                textboxFrame.Name = "TextBox_" .. textboxName
                textboxFrame.Parent = sectionContent
                textboxFrame.BackgroundColor3 = ColorPalette.BackgroundLight
                textboxFrame.BackgroundTransparency = 0.2
                textboxFrame.Size = UDim2.new(1, 0, 0, 45)
                
                local textboxCorner = Instance.new("UICorner")
                textboxCorner.CornerRadius = UDim.new(0, 10)
                textboxCorner.Parent = textboxFrame
                
                local textboxStroke = Instance.new("UIStroke")
                textboxStroke.Parent = textboxFrame
                textboxStroke.Color = ColorPalette.AccentPurple
                textboxStroke.Thickness = 1
                textboxStroke.Transparency = 0.5
                
                local icon = Instance.new("ImageLabel")
                icon.Name = "Icon"
                icon.Parent = textboxFrame
                icon.Image = Icons[textboxIcon] or Icons.edit
                icon.ImageColor3 = ColorPalette.AccentPurple
                icon.Size = UDim2.new(0, 20, 0, 20)
                icon.Position = UDim2.new(0, 15, 0.5, -10)
                icon.AnchorPoint = Vector2.new(0, 0.5)
                icon.BackgroundTransparency = 1
                
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Parent = textboxFrame
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(1, -50, 0.6, 0)
                label.Position = UDim2.new(0, 45, 0, 8)
                label.Font = Enum.Font.GothamMedium
                label.Text = textboxName
                label.TextColor3 = ColorPalette.TextLight
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Left
                
                local desc = Instance.new("TextLabel")
                desc.Name = "Description"
                desc.Parent = textboxFrame
                desc.BackgroundTransparency = 1
                desc.Size = UDim2.new(1, -50, 0.4, 0)
                desc.Position = UDim2.new(0, 45, 0, 28)
                desc.Font = Enum.Font.Gotham
                desc.Text = textboxDesc
                desc.TextColor3 = ColorPalette.TextGray
                desc.TextSize = 11
                desc.TextXAlignment = Enum.TextXAlignment.Left
                desc.TextTruncate = Enum.TextTruncate.AtEnd
                
                local inputBox = Instance.new("TextBox")
                inputBox.Name = "InputBox"
                inputBox.Parent = textboxFrame
                inputBox.BackgroundColor3 = ColorPalette.BackgroundMedium
                inputBox.Size = UDim2.new(0, 120, 0, 25)
                inputBox.Position = UDim2.new(1, -130, 0.5, -12.5)
                inputBox.AnchorPoint = Vector2.new(1, 0.5)
                inputBox.Font = Enum.Font.GothamMedium
                inputBox.Text = defaultValue
                inputBox.PlaceholderText = placeholder
                inputBox.PlaceholderColor3 = ColorPalette.TextGray
                inputBox.TextColor3 = ColorPalette.TextLight
                inputBox.TextSize = 12
                inputBox.ClearTextOnFocus = false
                
                local inputCorner = Instance.new("UICorner")
                inputCorner.CornerRadius = UDim.new(0, 8)
                inputCorner.Parent = inputBox
                
                inputBox.FocusLost:Connect(function(enterPressed)
                    if enterPressed then
                        SX_UI:DigitalParticleExplosion(inputBox)
                        callback(inputBox.Text)
                    end
                end)
                
                inputBox.Focused:Connect(function()
                    TweenService:Create(inputBox, TweenInfo.new(0.2), {
                        BackgroundColor3 = ColorPalette.BackgroundLight
                    }):Play()
                end)
                
                inputBox.FocusLost:Connect(function()
                    TweenService:Create(inputBox, TweenInfo.new(0.2), {
                        BackgroundColor3 = ColorPalette.BackgroundMedium
                    }):Play()
                end)
                
                local textboxData = {
                    Frame = textboxFrame,
                    InputBox = inputBox,
                    Label = label,
                    Description = desc,
                    Icon = icon,
                    Value = defaultValue,
                    Set = function(self, value)
                        inputBox.Text = value
                        callback(value)
                    end,
                    Get = function(self)
                        return inputBox.Text
                    end
                }
                table.insert(allElements, textboxData)
                
                return textboxData
            end
            
            function sectionMethods:AddLabel(config)
                local labelText = config.Text or "标签"
                local labelDesc = config.Description or ""
                local labelIcon = config.Icon or "info"
                local textSize = config.TextSize or 14
                
                local labelFrame = Instance.new("Frame")
                labelFrame.Name = "Label_" .. labelText
                labelFrame.Parent = sectionContent
                labelFrame.BackgroundColor3 = ColorPalette.BackgroundLight
                labelFrame.BackgroundTransparency = 0.2
                labelFrame.Size = UDim2.new(1, 0, 0, 45)
                
                local labelCorner = Instance.new("UICorner")
                labelCorner.CornerRadius = UDim.new(0, 10)
                labelCorner.Parent = labelFrame
                
                local labelStroke = Instance.new("UIStroke")
                labelStroke.Parent = labelFrame
                labelStroke.Color = ColorPalette.AccentPurple
                labelStroke.Thickness = 1
                labelStroke.Transparency = 0.5
                
                local icon = Instance.new("ImageLabel")
                icon.Name = "Icon"
                icon.Parent = labelFrame
                icon.Image = Icons[labelIcon] or Icons.info
                icon.ImageColor3 = ColorPalette.AccentPurple
                icon.Size = UDim2.new(0, 20, 0, 20)
                icon.Position = UDim2.new(0, 15, 0.5, -10)
                icon.AnchorPoint = Vector2.new(0, 0.5)
                icon.BackgroundTransparency = 1
                
                local labelTextLabel = Instance.new("TextLabel")
                labelTextLabel.Name = "Label"
                labelTextLabel.Parent = labelFrame
                labelTextLabel.BackgroundTransparency = 1
                labelTextLabel.Size = UDim2.new(1, -50, 0.6, 0)
                labelTextLabel.Position = UDim2.new(0, 45, 0, 8)
                labelTextLabel.Font = Enum.Font.GothamMedium
                labelTextLabel.Text = labelText
                labelTextLabel.TextColor3 = ColorPalette.TextLight
                labelTextLabel.TextSize = textSize
                labelTextLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                local desc = Instance.new("TextLabel")
                desc.Name = "Description"
                desc.Parent = labelFrame
                desc.BackgroundTransparency = 1
                desc.Size = UDim2.new(1, -50, 0.4, 0)
                desc.Position = UDim2.new(0, 45, 0, 28)
                desc.Font = Enum.Font.Gotham
                desc.Text = labelDesc
                desc.TextColor3 = ColorPalette.TextGray
                desc.TextSize = 11
                desc.TextXAlignment = Enum.TextXAlignment.Left
                desc.TextTruncate = Enum.TextTruncate.AtEnd
                
                local labelData = {
                    Frame = labelFrame,
                    Label = labelTextLabel,
                    Description = desc,
                    Icon = icon,
                    Set = function(self, text)
                        labelTextLabel.Text = text
                    end
                }
                table.insert(allElements, labelData)
                
                return labelData
            end
            
            function sectionMethods:AddKeybind(config)
                local keybindName = config.Name or "按键绑定"
                local keybindDesc = config.Description or ""
                local defaultKey = config.Default or Enum.KeyCode.E
                local keybindIcon = config.Icon or "key"
                local callback = config.Callback or function() end
                
                local keybindFrame = Instance.new("Frame")
                keybindFrame.Name = "Keybind_" .. keybindName
                keybindFrame.Parent = sectionContent
                keybindFrame.BackgroundColor3 = ColorPalette.BackgroundLight
                keybindFrame.BackgroundTransparency = 0.2
                keybindFrame.Size = UDim2.new(1, 0, 0, 45)
                
                local keybindCorner = Instance.new("UICorner")
                keybindCorner.CornerRadius = UDim.new(0, 10)
                keybindCorner.Parent = keybindFrame
                
                local keybindStroke = Instance.new("UIStroke")
                keybindStroke.Parent = keybindFrame
                keybindStroke.Color = ColorPalette.AccentPurple
                keybindStroke.Thickness = 1
                keybindStroke.Transparency = 0.5
                
                local icon = Instance.new("ImageLabel")
                icon.Name = "Icon"
                icon.Parent = keybindFrame
                icon.Image = Icons[keybindIcon] or Icons.key
                icon.ImageColor3 = ColorPalette.AccentPurple
                icon.Size = UDim2.new(0, 20, 0, 20)
                icon.Position = UDim2.new(0, 15, 0.5, -10)
                icon.AnchorPoint = Vector2.new(0, 0.5)
                icon.BackgroundTransparency = 1
                
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Parent = keybindFrame
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(1, -50, 0.6, 0)
                label.Position = UDim2.new(0, 45, 0, 8)
                label.Font = Enum.Font.GothamMedium
                label.Text = keybindName
                label.TextColor3 = ColorPalette.TextLight
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Left
                
                local desc = Instance.new("TextLabel")
                desc.Name = "Description"
                desc.Parent = keybindFrame
                desc.BackgroundTransparency = 1
                desc.Size = UDim2.new(1, -50, 0.4, 0)
                desc.Position = UDim2.new(0, 45, 0, 28)
                desc.Font = Enum.Font.Gotham
                desc.Text = keybindDesc
                desc.TextColor3 = ColorPalette.TextGray
                desc.TextSize = 11
                desc.TextXAlignment = Enum.TextXAlignment.Left
                desc.TextTruncate = Enum.TextTruncate.AtEnd
                
                local keyButton = Instance.new("TextButton")
                keyButton.Name = "KeyButton"
                keyButton.Parent = keybindFrame
                keyButton.BackgroundColor3 = ColorPalette.BackgroundMedium
                keyButton.Size = UDim2.new(0, 80, 0, 25)
                keyButton.Position = UDim2.new(1, -90, 0.5, -12.5)
                keyButton.AnchorPoint = Vector2.new(1, 0.5)
                keyButton.Font = Enum.Font.GothamBold
                keyButton.Text = tostring(defaultKey):gsub("Enum.KeyCode.", "")
                keyButton.TextColor3 = ColorPalette.AccentPurple
                keyButton.TextSize = 12
                keyButton.AutoButtonColor = false
                
                local keyCorner = Instance.new("UICorner")
                keyCorner.CornerRadius = UDim.new(0, 8)
                keyCorner.Parent = keyButton
                
                local currentKey = defaultKey
                local listening = false
                
                local function updateKey(key)
                    currentKey = key
                    keyButton.Text = tostring(key):gsub("Enum.KeyCode.", "")
                    callback(key)
                end
                
                keyButton.MouseButton1Click:Connect(function()
                    listening = true
                    keyButton.Text = "..."
                    keyButton.TextColor3 = ColorPalette.AccentRed
                    
                    local connection
                    connection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                        if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard then
                            listening = false
                            updateKey(input.KeyCode)
                            SX_UI:DigitalParticleExplosion(keyButton)
                            connection:Disconnect()
                        end
                    end)
                end)
                
                local keybindData = {
                    Frame = keybindFrame,
                    KeyButton = keyButton,
                    Label = label,
                    Description = desc,
                    Icon = icon,
                    Key = currentKey,
                    Set = function(self, key)
                        updateKey(key)
                    end,
                    Get = function(self)
                        return currentKey
                    end
                }
                table.insert(allElements, keybindData)
                
                return keybindData
            end
            
            return sectionMethods
        end
        
        return tabMethods
    end
    
    return window
end

local function initializeAnimations()
    task.spawn(function()
        task.wait(1)
        
        TweenService:Create(IslandContainer, TweenInfo.new(0.8, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, 0, 0.015, 0)
        }):Play()
        
        TweenService:Create(LogoContainer, TweenInfo.new(0.8, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, -20, 0.015, 0)
        }):Play()
        
        for i, ball in ipairs(colorBalls) do
            ball.Size = UDim2.new(0, 0, 0, 0)
            ball.BackgroundTransparency = 1
            
            task.wait(0.1 * i)
            
            TweenService:Create(ball, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 10, 0, 10),
                BackgroundTransparency = 0
            }):Play()
        end
        
        task.wait(0.5)
        
        IslandText.TextTransparency = 1
        IslandText.Visible = true
        TweenService:Create(IslandText, TweenInfo.new(0.6), {
            TextTransparency = 0
        }):Play()
    end)
end

initializeAnimations()

SearchBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local searchText = SearchBox.Text:lower()
        if searchText == "" then
            for _, element in pairs(allElements) do
                if element.Frame then
                    element.Frame.Visible = true
                end
            end
        else
            for _, element in pairs(allElements) do
                if element.Label and element.Frame then
                    local elementText = element.Label.Text:lower()
                    if element.Description then
                        elementText = elementText .. " " .. element.Description.Text:lower()
                    end
                    element.Frame.Visible = elementText:find(searchText, 1, true) ~= nil
                end
            end
        end
    end
end)

MinimizeButton.MouseEnter:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {
        TextColor3 = ColorPalette.TextLight,
        TextSize = 28
    }):Play()
end)

MinimizeButton.MouseLeave:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {
        TextColor3 = ColorPalette.AccentPurple,
        TextSize = 24
    }):Play()
end)

LogoBackground.MouseEnter:Connect(function()
    TweenService:Create(LogoBackground, TweenInfo.new(0.2), {
        BackgroundColor3 = ColorPalette.AccentBlue
    }):Play()
end)

LogoBackground.MouseLeave:Connect(function()
    TweenService:Create(LogoBackground, TweenInfo.new(0.2), {
        BackgroundColor3 = ColorPalette.AccentPurple
    }):Play()
end)

IslandBackground.MouseEnter:Connect(function()
    TweenService:Create(IslandBackground, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.9
    }):Play()
    TweenService:Create(IslandStroke, TweenInfo.new(0.2), {
        Thickness = 2
    }):Play()
end)

IslandBackground.MouseLeave:Connect(function()
    TweenService:Create(IslandBackground, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.95
    }):Play()
    TweenService:Create(IslandStroke, TweenInfo.new(0.2), {
        Thickness = 1.5
    }):Play()
end)

getgenv().SX_UI = SX_UI

return SX_UI