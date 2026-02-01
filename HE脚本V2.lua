local SX_UI = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local TextService = game:GetService("TextService")

local ColorPalette = {
    BackgroundDark = Color3.fromRGB(15, 15, 25),
    BackgroundMedium = Color3.fromRGB(25, 25, 35),
    BackgroundLight = Color3.fromRGB(35, 35, 50),
    AccentRed = Color3.fromRGB(255, 85, 85),
    AccentGreen = Color3.fromRGB(85, 255, 85),
    AccentBlue = Color3.fromRGB(85, 170, 255),
    AccentPurple = Color3.fromRGB(170, 85, 255),
    TextLight = Color3.fromRGB(245, 245, 255),
    TextGray = Color3.fromRGB(180, 180, 200),
    IslandBg = Color3.fromRGB(0, 0, 0, 0.95),
    IslandBorder = Color3.fromRGB(120, 70, 255)
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SX_UI_Main"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 550, 0, 400)
MainFrame.BackgroundColor3 = ColorPalette.BackgroundDark
MainFrame.BackgroundTransparency = 0.05
MainFrame.ZIndex = 10
MainFrame.Visible = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = ColorPalette.IslandBorder
MainStroke.Thickness = 2
MainStroke.Transparency = 0

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ColorPalette.BackgroundDark),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 25, 45)),
    ColorSequenceKeypoint.new(1, ColorPalette.BackgroundDark)
})
MainGradient.Rotation = 45
MainGradient.Transparency = NumberSequence.new(0.05)
MainGradient.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = ColorPalette.BackgroundMedium
TitleBar.BackgroundTransparency = 0.1
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.ZIndex = 11

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 14)
TitleCorner.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.Size = UDim2.new(0.5, 0, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "SX UI - 多功能面板"
TitleText.TextColor3 = ColorPalette.TextLight
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left

local SubTitleText = Instance.new("TextLabel")
SubTitleText.Name = "SubTitleText"
SubTitleText.Parent = TitleBar
SubTitleText.BackgroundTransparency = 1
SubTitleText.Position = UDim2.new(0, 15, 0, 22)
SubTitleText.Size = UDim2.new(0.5, 0, 0, 15)
SubTitleText.Font = Enum.Font.Gotham
SubTitleText.Text = "v2.0.0 | By SX Team"
SubTitleText.TextColor3 = ColorPalette.TextGray
SubTitleText.TextSize = 11
SubTitleText.TextXAlignment = Enum.TextXAlignment.Left

local SearchBox = Instance.new("TextBox")
SearchBox.Name = "SearchBox"
SearchBox.Parent = TitleBar
SearchBox.BackgroundColor3 = ColorPalette.BackgroundLight
SearchBox.BackgroundTransparency = 0.2
SearchBox.Position = UDim2.new(0.6, 0, 0.5, -12)
SearchBox.Size = UDim2.new(0.3, 0, 0, 24)
SearchBox.AnchorPoint = Vector2.new(0, 0.5)
SearchBox.Font = Enum.Font.Gotham
SearchBox.Text = "搜索功能..."
SearchBox.TextColor3 = ColorPalette.TextGray
SearchBox.TextSize = 13
SearchBox.PlaceholderColor3 = ColorPalette.TextGray
SearchBox.PlaceholderText = "搜索功能..."

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 8)
SearchCorner.Parent = SearchBox

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TitleBar
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Position = UDim2.new(1, -35, 0.5, -10)
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.AnchorPoint = Vector2.new(1, 0.5)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = ColorPalette.AccentPurple
MinimizeButton.TextSize = 24

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Size = UDim2.new(1, -20, 1, -60)
ContentFrame.Position = UDim2.new(0, 10, 0, 50)
ContentFrame.ZIndex = 11

local LeftPanel = Instance.new("Frame")
LeftPanel.Name = "LeftPanel"
LeftPanel.Parent = ContentFrame
LeftPanel.BackgroundTransparency = 1
LeftPanel.Size = UDim2.new(0, 150, 1, 0)
LeftPanel.Position = UDim2.new(0, 0, 0, 0)

local LeftScroll = Instance.new("ScrollingFrame")
LeftScroll.Name = "LeftScroll"
LeftScroll.Parent = LeftPanel
LeftScroll.BackgroundTransparency = 1
LeftScroll.Size = UDim2.new(1, 0, 1, 0)
LeftScroll.ScrollBarThickness = 3
LeftScroll.ScrollBarImageColor3 = ColorPalette.AccentPurple
LeftScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
LeftScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local LeftList = Instance.new("UIListLayout")
LeftList.Parent = LeftScroll
LeftList.Padding = UDim.new(0, 8)
LeftList.SortOrder = Enum.SortOrder.LayoutOrder

local LeftPadding = Instance.new("UIPadding")
LeftPadding.Parent = LeftScroll
LeftPadding.PaddingTop = UDim.new(0, 5)

local RightPanel = Instance.new("Frame")
RightPanel.Name = "RightPanel"
RightPanel.Parent = ContentFrame
RightPanel.BackgroundTransparency = 1
RightPanel.Size = UDim2.new(1, -160, 1, 0)
RightPanel.Position = UDim2.new(0, 160, 0, 0)

local RightScroll = Instance.new("ScrollingFrame")
RightScroll.Name = "RightScroll"
RightScroll.Parent = RightPanel
RightScroll.BackgroundTransparency = 1
RightScroll.Size = UDim2.new(1, 0, 1, 0)
RightScroll.ScrollBarThickness = 3
RightScroll.ScrollBarImageColor3 = ColorPalette.AccentPurple
RightScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
RightScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local RightList = Instance.new("UIListLayout")
RightList.Parent = RightScroll
RightList.Padding = UDim.new(0, 15)
RightList.SortOrder = Enum.SortOrder.LayoutOrder

local RightPadding = Instance.new("UIPadding")
RightPadding.Parent = RightScroll
RightPadding.PaddingTop = UDim.new(0, 10)
RightPadding.PaddingLeft = UDim.new(0, 10)
RightPadding.PaddingRight = UDim.new(0, 10)

local IslandContainer = Instance.new("Frame")
IslandContainer.Name = "IslandContainer"
IslandContainer.Parent = ScreenGui
IslandContainer.AnchorPoint = Vector2.new(0.5, 0)
IslandContainer.Position = UDim2.new(0.5, 0, 0.02, 0)
IslandContainer.Size = UDim2.new(0, 250, 0, 50)
IslandContainer.BackgroundTransparency = 1
IslandContainer.ZIndex = 100

local IslandBg = Instance.new("Frame")
IslandBg.Name = "IslandBg"
IslandBg.Parent = IslandContainer
IslandBg.BackgroundColor3 = ColorPalette.IslandBg
IslandBg.Size = UDim2.new(1, 0, 1, 0)

local IslandCorner = Instance.new("UICorner")
IslandCorner.CornerRadius = UDim.new(1, 0)
IslandCorner.Parent = IslandBg

local IslandStroke = Instance.new("UIStroke")
IslandStroke.Parent = IslandBg
IslandStroke.Color = ColorPalette.IslandBorder
IslandStroke.Thickness = 2
IslandStroke.Transparency = 0

local BallsContainer = Instance.new("Frame")
BallsContainer.Name = "BallsContainer"
BallsContainer.Parent = IslandBg
BallsContainer.BackgroundTransparency = 1
BallsContainer.Size = UDim2.new(0, 80, 1, 0)
BallsContainer.Position = UDim2.new(0, 15, 0.5, 0)
BallsContainer.AnchorPoint = Vector2.new(0, 0.5)

local Ball1 = Instance.new("Frame")
Ball1.Name = "Ball1"
Ball1.Parent = BallsContainer
Ball1.BackgroundColor3 = ColorPalette.AccentRed
Ball1.Size = UDim2.new(0, 12, 0, 12)
Ball1.Position = UDim2.new(0, 10, 0.5, 0)
Ball1.AnchorPoint = Vector2.new(0, 0.5)
Ball1.ZIndex = 101

local Ball1Corner = Instance.new("UICorner")
Ball1Corner.CornerRadius = UDim.new(1, 0)
Ball1Corner.Parent = Ball1

local Ball1Glow = Instance.new("UIGradient")
Ball1Glow.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ColorPalette.AccentRed),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 200))
})
Ball1Glow.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(1, 0.5)
})
Ball1Glow.Rotation = 45
Ball1Glow.Parent = Ball1

local Ball2 = Instance.new("Frame")
Ball2.Name = "Ball2"
Ball2.Parent = BallsContainer
Ball2.BackgroundColor3 = ColorPalette.AccentGreen
Ball2.Size = UDim2.new(0, 12, 0, 12)
Ball2.Position = UDim2.new(0, 35, 0.5, 0)
Ball2.AnchorPoint = Vector2.new(0, 0.5)
Ball2.ZIndex = 101

local Ball2Corner = Instance.new("UICorner")
Ball2Corner.CornerRadius = UDim.new(1, 0)
Ball2Corner.Parent = Ball2

local Ball2Glow = Instance.new("UIGradient")
Ball2Glow.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ColorPalette.AccentGreen),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 255, 200))
})
Ball2Glow.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(1, 0.5)
})
Ball2Glow.Rotation = 45
Ball2Glow.Parent = Ball2

local Ball3 = Instance.new("Frame")
Ball3.Name = "Ball3"
Ball3.Parent = BallsContainer
Ball3.BackgroundColor3 = ColorPalette.AccentBlue
Ball3.Size = UDim2.new(0, 12, 0, 12)
Ball3.Position = UDim2.new(0, 60, 0.5, 0)
Ball3.AnchorPoint = Vector2.new(0, 0.5)
Ball3.ZIndex = 101

local Ball3Corner = Instance.new("UICorner")
Ball3Corner.CornerRadius = UDim.new(1, 0)
Ball3Corner.Parent = Ball3

local Ball3Glow = Instance.new("UIGradient")
Ball3Glow.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ColorPalette.AccentBlue),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 255))
})
Ball3Glow.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(1, 0.5)
})
Ball3Glow.Rotation = 45
Ball3Glow.Parent = Ball3

local IslandText = Instance.new("TextLabel")
IslandText.Name = "IslandText"
IslandText.Parent = IslandBg
IslandText.BackgroundTransparency = 1
IslandText.Position = UDim2.new(0, 110, 0.5, 0)
IslandText.Size = UDim2.new(0, 120, 0.8, 0)
IslandText.AnchorPoint = Vector2.new(0, 0.5)
IslandText.Font = Enum.Font.GothamMedium
IslandText.Text = "已开启: 0 | 已关闭: 0"
IslandText.TextColor3 = ColorPalette.TextLight
IslandText.TextSize = 12
IslandText.TextXAlignment = Enum.TextXAlignment.Left

local LogoContainer = Instance.new("Frame")
LogoContainer.Name = "LogoContainer"
LogoContainer.Parent = ScreenGui
LogoContainer.AnchorPoint = Vector2.new(1, 0)
LogoContainer.Position = UDim2.new(1, -20, 0.02, 0)
LogoContainer.Size = UDim2.new(0, 40, 0, 40)
LogoContainer.BackgroundTransparency = 1
LogoContainer.ZIndex = 100

local LogoButton = Instance.new("ImageButton")
LogoButton.Name = "LogoButton"
LogoButton.Parent = LogoContainer
LogoButton.BackgroundColor3 = ColorPalette.BackgroundDark
LogoButton.Size = UDim2.new(1, 0, 1, 0)
LogoButton.Image = "rbxassetid://10734896206"
LogoButton.ScaleType = Enum.ScaleType.Fit
LogoButton.AutoButtonColor = false

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoButton

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Parent = LogoButton
LogoStroke.Color = ColorPalette.IslandBorder
LogoStroke.Thickness = 2
LogoStroke.Transparency = 0

local LogoGlow = Instance.new("UIGradient")
LogoGlow.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ColorPalette.AccentPurple),
    ColorSequenceKeypoint.new(1, ColorPalette.BackgroundLight)
})
LogoGlow.Rotation = 45
LogoGlow.Transparency = NumberSequence.new(0.2)
LogoGlow.Parent = LogoButton

local tabs = {}
local currentTab = nil
local enabledFeatures = 0
local disabledFeatures = 0
local featureCounts = {}
local isMinimized = false

local Icons = {
    sword = "rbxassetid://7072720871",
    shield = "rbxassetid://7072718155",
    wand = "rbxassetid://7072716617",
    gear = "rbxassetid://7072715226",
    user = "rbxassetid://7072713902",
    eye = "rbxassetid://7072711877",
    target = "rbxassetid://7072709299",
    star = "rbxassetid://7072707292",
    heart = "rbxassetid://7072705188",
    flag = "rbxassetid://7072703182",
    globe = "rbxassetid://7072701182",
    lock = "rbxassetid://7072698172",
    bell = "rbxassetid://7072695172",
    camera = "rbxassetid://7072692172",
    settings = "rbxassetid://10734924532"
}

function SX_UI:GetIcon(iconName)
    return Icons[iconName] or "rbxassetid://10734924532"
end

function SX_UI:UpdateIslandText()
    IslandText.Text = string.format("已开启: %d | 已关闭: %d", enabledFeatures, disabledFeatures)
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
    explosionCenter.ZIndex = 8
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
        particle.ZIndex = 9
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
        end)
        
        task.wait(0.8)
    end)
end

function SX_UI:ToggleUI()
    if isMinimized then
        self:DigitalParticleExplosion(LogoButton)
        
        local frameTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 550, 0, 400),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            BackgroundTransparency = 0.05
        })
        
        local strokeTween = TweenService:Create(MainStroke, TweenInfo.new(0.5), {
            Transparency = 0
        })
        
        frameTween:Play()
        strokeTween:Play()
        
        task.wait(0.3)
        MainFrame.Visible = true
        LogoButton.Image = "rbxassetid://10734896206"
        
        isMinimized = false
    else
        self:DigitalParticleExplosion(LogoButton)
        
        local frameTween = TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            BackgroundTransparency = 1
        })
        
        local strokeTween = TweenService:Create(MainStroke, TweenInfo.new(0.3), {
            Transparency = 1
        })
        
        frameTween:Play()
        strokeTween:Play()
        
        task.wait(0.4)
        MainFrame.Visible = false
        LogoButton.Image = "rbxassetid://10734924532"
        
        isMinimized = true
    end
end

function SX_UI:SetTitle(title, subtitle)
    TitleText.Text = title or "SX UI"
    SubTitleText.Text = subtitle or "v2.0.0 | By SX Team"
end

function SX_UI:CreateWindow(config)
    self:SetTitle(config.Name or "SX UI", config.SubTitle or "多功能控制面板")
    
    LogoButton.MouseButton1Click:Connect(function()
        self:ToggleUI()
    end)
    
    IslandBg.MouseButton1Click:Connect(function()
        self:ToggleUI()
    end)
    
    MinimizeButton.MouseButton1Click:Connect(function()
        self:ToggleUI()
    end)
    
    SearchBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local searchText = SearchBox.Text:lower()
            if searchText == "" then return end
            
            for _, tab in pairs(tabs) do
                for _, section in pairs(tab.sections) do
                    for _, element in pairs(section.elements) do
                        if element.Name:lower():find(searchText, 1, true) then
                            element.Highlight.Visible = true
                            task.wait(0.5)
                            element.Highlight.Visible = false
                        end
                    end
                end
            end
        end
    end)
    
    return self
end

function SX_UI:DrawTab(config)
    local tabName = config.Name or "Tab"
    local tabIcon = config.Icon or "gear"
    local enableScrolling = config.EnableScrolling or true
    
    local tabButton = Instance.new("TextButton")
    tabButton.Name = "Tab_" .. tabName
    tabButton.Parent = LeftScroll
    tabButton.BackgroundColor3 = ColorPalette.BackgroundLight
    tabButton.BackgroundTransparency = 0.3
    tabButton.Size = UDim2.new(1, -10, 0, 40)
    tabButton.Position = UDim2.new(0, 5, 0, 0)
    tabButton.Font = Enum.Font.GothamMedium
    tabButton.Text = ""
    tabButton.TextColor3 = ColorPalette.TextLight
    tabButton.TextSize = 14
    tabButton.AutoButtonColor = false
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 8)
    tabCorner.Parent = tabButton
    
    local tabIconLabel = Instance.new("ImageLabel")
    tabIconLabel.Name = "Icon"
    tabIconLabel.Parent = tabButton
    tabIconLabel.BackgroundTransparency = 1
    tabIconLabel.Size = UDim2.new(0, 24, 0, 24)
    tabIconLabel.Position = UDim2.new(0, 10, 0.5, -12)
    tabIconLabel.AnchorPoint = Vector2.new(0, 0.5)
    tabIconLabel.Image = self:GetIcon(tabIcon)
    tabIconLabel.ImageColor3 = ColorPalette.TextGray
    
    local tabTextLabel = Instance.new("TextLabel")
    tabTextLabel.Name = "Text"
    tabTextLabel.Parent = tabButton
    tabTextLabel.BackgroundTransparency = 1
    tabTextLabel.Size = UDim2.new(1, -40, 1, 0)
    tabTextLabel.Position = UDim2.new(0, 40, 0, 0)
    tabTextLabel.Font = Enum.Font.GothamMedium
    tabTextLabel.Text = tabName
    tabTextLabel.TextColor3 = ColorPalette.TextLight
    tabTextLabel.TextSize = 14
    tabTextLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local tabHighlight = Instance.new("Frame")
    tabHighlight.Name = "Highlight"
    tabHighlight.Parent = tabButton
    tabHighlight.BackgroundColor3 = ColorPalette.AccentPurple
    tabHighlight.BackgroundTransparency = 0.7
    tabHighlight.Size = UDim2.new(0, 4, 0.7, 0)
    tabHighlight.Position = UDim2.new(0, 3, 0.15, 0)
    tabHighlight.Visible = false
    
    local tabContent = Instance.new("Frame")
    tabContent.Name = "Content_" .. tabName
    tabContent.Parent = RightScroll
    tabContent.BackgroundTransparency = 1
    tabContent.Size = UDim2.new(1, 0, 0, 0)
    tabContent.LayoutOrder = #tabs + 1
    tabContent.Visible = false
    
    local tabContentList = Instance.new("UIListLayout")
    tabContentList.Parent = tabContent
    tabContentList.Padding = UDim.new(0, 15)
    tabContentList.SortOrder = Enum.SortOrder.LayoutOrder
    
    local tabSections = {}
    local tabData = {
        Name = tabName,
        Button = tabButton,
        Content = tabContent,
        sections = tabSections
    }
    
    table.insert(tabs, tabData)
    
    local function switchToTab()
        if currentTab then
            currentTab.Button.BackgroundColor3 = ColorPalette.BackgroundLight
            currentTab.Button.BackgroundTransparency = 0.3
            currentTab.Button.Icon.ImageColor3 = ColorPalette.TextGray
            currentTab.Button.Text.TextColor3 = ColorPalette.TextLight
            currentTab.Button.Highlight.Visible = false
            currentTab.Content.Visible = false
        end
        
        currentTab = tabData
        
        TweenService:Create(tabButton, TweenInfo.new(0.3), {
            BackgroundColor3 = ColorPalette.AccentPurple,
            BackgroundTransparency = 0.1
        }):Play()
        
        TweenService:Create(tabIconLabel, TweenInfo.new(0.3), {
            ImageColor3 = ColorPalette.TextLight
        }):Play()
        
        TweenService:Create(tabTextLabel, TweenInfo.new(0.3), {
            TextColor3 = ColorPalette.TextLight
        }):Play()
        
        tabHighlight.Visible = true
        tabContent.Visible = true
        
        self:DigitalParticleExplosion(tabButton)
    end
    
    tabButton.MouseButton1Click:Connect(switchToTab)
    
    if #tabs == 1 then
        switchToTab()
    end
    
    local tabMethods = {}
    
    function tabMethods:DrawSection(config)
        local sectionName = config.Name or "Section"
        local position = config.Position or 'left'
        
        local sectionFrame = Instance.new("Frame")
        sectionFrame.Name = "Section_" .. sectionName
        sectionFrame.Parent = tabContent
        sectionFrame.BackgroundColor3 = ColorPalette.BackgroundLight
        sectionFrame.BackgroundTransparency = 0.15
        sectionFrame.Size = UDim2.new(1, 0, 0, 0)
        sectionFrame.AutomaticSize = Enum.AutomaticSize.Y
        
        local sectionCorner = Instance.new("UICorner")
        sectionCorner.CornerRadius = UDim.new(0, 10)
        sectionCorner.Parent = sectionFrame
        
        local sectionStroke = Instance.new("UIStroke")
        sectionStroke.Parent = sectionFrame
        sectionStroke.Color = ColorPalette.IslandBorder
        sectionStroke.Thickness = 1
        sectionStroke.Transparency = 0.3
        
        local sectionTitle = Instance.new("TextLabel")
        sectionTitle.Name = "Title"
        sectionTitle.Parent = sectionFrame
        sectionTitle.BackgroundTransparency = 1
        sectionTitle.Size = UDim2.new(1, -20, 0, 30)
        sectionTitle.Position = UDim2.new(0, 10, 0, 5)
        sectionTitle.Font = Enum.Font.GothamBold
        sectionTitle.Text = sectionName
        sectionTitle.TextColor3 = ColorPalette.TextLight
        sectionTitle.TextSize = 16
        sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        local sectionElements = Instance.new("Frame")
        sectionElements.Name = "Elements"
        sectionElements.Parent = sectionFrame
        sectionElements.BackgroundTransparency = 1
        sectionElements.Size = UDim2.new(1, -20, 0, 0)
        sectionElements.Position = UDim2.new(0, 10, 0, 40)
        sectionElements.AutomaticSize = Enum.AutomaticSize.Y
        
        local elementsList = Instance.new("UIListLayout")
        elementsList.Parent = sectionElements
        elementsList.Padding = UDim.new(0, 10)
        elementsList.SortOrder = Enum.SortOrder.LayoutOrder
        
        local sectionData = {
            Name = sectionName,
            Frame = sectionFrame,
            Elements = sectionElements,
            elements = {}
        }
        
        table.insert(tabSections, sectionData)
        
        local sectionMethods = {}
        
        function sectionMethods:AddButton(config)
            local buttonName = config.Name or "Button"
            local callback = config.Callback or function() end
            
            local buttonFrame = Instance.new("Frame")
            buttonFrame.Name = "Button_" .. buttonName
            buttonFrame.Parent = sectionElements
            buttonFrame.BackgroundColor3 = ColorPalette.BackgroundMedium
            buttonFrame.BackgroundTransparency = 0.2
            buttonFrame.Size = UDim2.new(1, 0, 0, 35)
            
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 8)
            buttonCorner.Parent = buttonFrame
            
            local button = Instance.new("TextButton")
            button.Name = "Button"
            button.Parent = buttonFrame
            button.BackgroundTransparency = 1
            button.Size = UDim2.new(1, 0, 1, 0)
            button.Font = Enum.Font.GothamMedium
            button.Text = buttonName
            button.TextColor3 = ColorPalette.TextLight
            button.TextSize = 14
            button.AutoButtonColor = false
            
            local buttonStroke = Instance.new("UIStroke")
            buttonStroke.Parent = buttonFrame
            buttonStroke.Color = ColorPalette.IslandBorder
            buttonStroke.Thickness = 1
            buttonStroke.Transparency = 0.5
            
            local buttonHighlight = Instance.new("Frame")
            buttonHighlight.Name = "Highlight"
            buttonHighlight.Parent = buttonFrame
            buttonHighlight.BackgroundColor3 = ColorPalette.AccentPurple
            buttonHighlight.BackgroundTransparency = 0.9
            buttonHighlight.Size = UDim2.new(1, 0, 1, 0)
            buttonHighlight.Visible = false
            
            button.MouseButton1Click:Connect(function()
                SX_UI:DigitalParticleExplosion(button)
                callback()
            end)
            
            button.MouseEnter:Connect(function()
                buttonHighlight.Visible = true
                TweenService:Create(buttonFrame, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.1
                }):Play()
                TweenService:Create(buttonStroke, TweenInfo.new(0.2), {
                    Transparency = 0.2
                }):Play()
            end)
            
            button.MouseLeave:Connect(function()
                buttonHighlight.Visible = false
                TweenService:Create(buttonFrame, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.2
                }):Play()
                TweenService:Create(buttonStroke, TweenInfo.new(0.2), {
                    Transparency = 0.5
                }):Play()
            end)
            
            local elementData = {
                Name = buttonName,
                Type = "Button",
                Highlight = buttonHighlight
            }
            
            table.insert(sectionData.elements, elementData)
            
            return buttonFrame
        end
        
        function sectionMethods:AddToggle(config)
            local toggleName = config.Name or "Toggle"
            local defaultValue = config.Default or false
            local callback = config.Callback or function() end
            
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Name = "Toggle_" .. toggleName
            toggleFrame.Parent = sectionElements
            toggleFrame.BackgroundTransparency = 1
            toggleFrame.Size = UDim2.new(1, 0, 0, 35)
            
            local label = Instance.new("TextLabel")
            label.Name = "Label"
            label.Parent = toggleFrame
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(0.7, 0, 1, 0)
            label.Font = Enum.Font.GothamMedium
            label.Text = toggleName
            label.TextColor3 = ColorPalette.TextLight
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            local toggleButton = Instance.new("TextButton")
            toggleButton.Name = "ToggleButton"
            toggleButton.Parent = toggleFrame
            toggleButton.BackgroundColor3 = ColorPalette.BackgroundMedium
            toggleButton.Size = UDim2.new(0, 50, 0, 25)
            toggleButton.Position = UDim2.new(1, 0, 0.5, 0)
            toggleButton.AnchorPoint = Vector2.new(1, 0.5)
            toggleButton.Font = Enum.Font.GothamMedium
            toggleButton.Text = ""
            toggleButton.AutoButtonColor = false
            
            local toggleCorner = Instance.new("UICorner")
            toggleCorner.CornerRadius = UDim.new(1, 0)
            toggleCorner.Parent = toggleButton
            
            local toggleDot = Instance.new("Frame")
            toggleDot.Name = "ToggleDot"
            toggleDot.Parent = toggleButton
            toggleDot.BackgroundColor3 = ColorPalette.TextLight
            toggleDot.Size = UDim2.new(0, 18, 0, 18)
            toggleDot.Position = defaultValue and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 4, 0.5, -9)
            toggleDot.AnchorPoint = Vector2.new(0.5, 0.5)
            
            local dotCorner = Instance.new("UICorner")
            dotCorner.CornerRadius = UDim.new(1, 0)
            dotCorner.Parent = toggleDot
            
            local toggleStroke = Instance.new("UIStroke")
            toggleStroke.Parent = toggleButton
            toggleStroke.Color = ColorPalette.IslandBorder
            toggleStroke.Thickness = 1
            toggleStroke.Transparency = 0.3
            
            local isToggled = defaultValue
            
            if defaultValue then
                enabledFeatures = enabledFeatures + 1
            else
                disabledFeatures = disabledFeatures + 1
            end
            
            local function updateToggle()
                if isToggled then
                    TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                        BackgroundColor3 = ColorPalette.AccentGreen
                    }):Play()
                    TweenService:Create(toggleDot, TweenInfo.new(0.3), {
                        Position = UDim2.new(1, -22, 0.5, -9)
                    }):Play()
                    enabledFeatures = enabledFeatures + 1
                    disabledFeatures = disabledFeatures - 1
                else
                    TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                        BackgroundColor3 = ColorPalette.BackgroundMedium
                    }):Play()
                    TweenService:Create(toggleDot, TweenInfo.new(0.3), {
                        Position = UDim2.new(0, 4, 0.5, -9)
                    }):Play()
                    enabledFeatures = enabledFeatures - 1
                    disabledFeatures = disabledFeatures + 1
                end
                SX_UI:UpdateIslandText()
                callback(isToggled)
            end
            
            toggleButton.MouseButton1Click:Connect(function()
                isToggled = not isToggled
                SX_UI:DigitalParticleExplosion(toggleButton)
                updateToggle()
            end)
            
            updateToggle()
            
            local elementData = {
                Name = toggleName,
                Type = "Toggle",
                Value = isToggled
            }
            
            table.insert(sectionData.elements, elementData)
            
            return toggleFrame
        end
        
        function sectionMethods:AddSlider(config)
            local sliderName = config.Name or "Slider"
            local minValue = config.Min or 0
            local maxValue = config.Max or 100
            local defaultValue = config.Default or 50
            local callback = config.Callback or function() end
            
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Name = "Slider_" .. sliderName
            sliderFrame.Parent = sectionElements
            sliderFrame.BackgroundTransparency = 1
            sliderFrame.Size = UDim2.new(1, 0, 0, 50)
            
            local label = Instance.new("TextLabel")
            label.Name = "Label"
            label.Parent = sliderFrame
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(1, 0, 0, 20)
            label.Font = Enum.Font.GothamMedium
            label.Text = sliderName .. ": " .. defaultValue
            label.TextColor3 = ColorPalette.TextLight
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            local sliderBar = Instance.new("Frame")
            sliderBar.Name = "SliderBar"
            sliderBar.Parent = sliderFrame
            sliderBar.BackgroundColor3 = ColorPalette.BackgroundMedium
            sliderBar.Size = UDim2.new(1, 0, 0, 6)
            sliderBar.Position = UDim2.new(0, 0, 0, 30)
            
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
            sliderDot.AnchorPoint = Vector2.new(0.5, 0.5)
            
            local dotCorner = Instance.new("UICorner")
            dotCorner.CornerRadius = UDim.new(1, 0)
            dotCorner.Parent = sliderDot
            
            local isDragging = false
            
            local function updateSlider(value)
                local clampedValue = math.clamp(value, minValue, maxValue)
                local ratio = (clampedValue - minValue) / (maxValue - minValue)
                
                sliderFill.Size = UDim2.new(ratio, 0, 1, 0)
                sliderDot.Position = UDim2.new(ratio, -6, 0.5, -6)
                label.Text = sliderName .. ": " .. math.floor(clampedValue)
                
                callback(clampedValue)
            end
            
            sliderBar.MouseButton1Down:Connect(function()
                isDragging = true
                SX_UI:DigitalParticleExplosion(sliderBar)
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    isDragging = false
                end
            end)
            
            RunService.Heartbeat:Connect(function()
                if isDragging then
                    local mouse = Players.LocalPlayer:GetMouse()
                    local barAbsolute = sliderBar.AbsolutePosition
                    local barSize = sliderBar.AbsoluteSize
                    
                    local relativeX = (mouse.X - barAbsolute.X) / barSize.X
                    local value = minValue + (maxValue - minValue) * math.clamp(relativeX, 0, 1)
                    
                    updateSlider(value)
                end
            end)
            
            updateSlider(defaultValue)
            
            local elementData = {
                Name = sliderName,
                Type = "Slider",
                Value = defaultValue
            }
            
            table.insert(sectionData.elements, elementData)
            
            return sliderFrame
        end
        
        function sectionMethods:AddDropdown(config)
            local dropdownName = config.Name or "Dropdown"
            local options = config.Options or {"选项1", "选项2", "选项3"}
            local defaultValue = config.Default or options[1]
            local callback = config.Callback or function() end
            
            local dropdownFrame = Instance.new("Frame")
            dropdownFrame.Name = "Dropdown_" .. dropdownName
            dropdownFrame.Parent = sectionElements
            dropdownFrame.BackgroundTransparency = 1
            dropdownFrame.Size = UDim2.new(1, 0, 0, 35)
            
            local label = Instance.new("TextLabel")
            label.Name = "Label"
            label.Parent = dropdownFrame
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(0.7, 0, 1, 0)
            label.Font = Enum.Font.GothamMedium
            label.Text = dropdownName
            label.TextColor3 = ColorPalette.TextLight
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            local dropdownButton = Instance.new("TextButton")
            dropdownButton.Name = "DropdownButton"
            dropdownButton.Parent = dropdownFrame
            dropdownButton.BackgroundColor3 = ColorPalette.BackgroundMedium
            dropdownButton.Size = UDim2.new(0, 120, 0, 30)
            dropdownButton.Position = UDim2.new(1, 0, 0.5, 0)
            dropdownButton.AnchorPoint = Vector2.new(1, 0.5)
            dropdownButton.Font = Enum.Font.GothamMedium
            dropdownButton.Text = defaultValue
            dropdownButton.TextColor3 = ColorPalette.TextLight
            dropdownButton.TextSize = 13
            dropdownButton.AutoButtonColor = false
            
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 6)
            buttonCorner.Parent = dropdownButton
            
            local buttonStroke = Instance.new("UIStroke")
            buttonStroke.Parent = dropdownButton
            buttonStroke.Color = ColorPalette.IslandBorder
            buttonStroke.Thickness = 1
            buttonStroke.Transparency = 0.3
            
            local dropdownList = Instance.new("Frame")
            dropdownList.Name = "DropdownList"
            dropdownList.Parent = ScreenGui
            dropdownList.BackgroundColor3 = ColorPalette.BackgroundDark
            dropdownList.BackgroundTransparency = 0.05
            dropdownList.Size = UDim2.new(0, 120, 0, 0)
            dropdownList.Position = dropdownButton.AbsolutePosition + UDim2.new(0, 0, 0, 35)
            dropdownList.Visible = false
            dropdownList.ZIndex = 1000
            
            local listCorner = Instance.new("UICorner")
            listCorner.CornerRadius = UDim.new(0, 6)
            listCorner.Parent = dropdownList
            
            local listStroke = Instance.new("UIStroke")
            listStroke.Parent = dropdownList
            listStroke.Color = ColorPalette.IslandBorder
            listStroke.Thickness = 1
            listStroke.Transparency = 0.2
            
            local listScroll = Instance.new("ScrollingFrame")
            listScroll.Name = "ListScroll"
            listScroll.Parent = dropdownList
            listScroll.BackgroundTransparency = 1
            listScroll.Size = UDim2.new(1, -5, 1, -5)
            listScroll.Position = UDim2.new(0, 2, 0, 2)
            listScroll.ScrollBarThickness = 3
            listScroll.ScrollBarImageColor3 = ColorPalette.AccentPurple
            listScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            listScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
            
            local listLayout = Instance.new("UIListLayout")
            listLayout.Parent = listScroll
            listLayout.Padding = UDim.new(0, 2)
            listLayout.SortOrder = Enum.SortOrder.LayoutOrder
            
            local currentValue = defaultValue
            local isOpen = false
            
            local function toggleDropdown()
                isOpen = not isOpen
                
                if isOpen then
                    SX_UI:DigitalParticleExplosion(dropdownButton)
                    dropdownList.Visible = true
                    TweenService:Create(dropdownList, TweenInfo.new(0.3), {
                        Size = UDim2.new(0, 120, 0, math.min(#options * 30, 150))
                    }):Play()
                else
                    TweenService:Create(dropdownList, TweenInfo.new(0.3), {
                        Size = UDim2.new(0, 120, 0, 0)
                    }):Play()
                    task.wait(0.3)
                    dropdownList.Visible = false
                end
            end
            
            local function selectOption(option)
                currentValue = option
                dropdownButton.Text = option
                toggleDropdown()
                callback(option)
            end
            
            for _, option in pairs(options) do
                local optionButton = Instance.new("TextButton")
                optionButton.Name = "Option_" .. option
                optionButton.Parent = listScroll
                optionButton.BackgroundColor3 = ColorPalette.BackgroundMedium
                optionButton.BackgroundTransparency = 0.3
                optionButton.Size = UDim2.new(1, -4, 0, 28)
                optionButton.Font = Enum.Font.Gotham
                optionButton.Text = option
                optionButton.TextColor3 = ColorPalette.TextLight
                optionButton.TextSize = 12
                optionButton.AutoButtonColor = false
                
                local optionCorner = Instance.new("UICorner")
                optionCorner.CornerRadius = UDim.new(0, 4)
                optionCorner.Parent = optionButton
                
                optionButton.MouseButton1Click:Connect(function()
                    selectOption(option)
                end)
                
                optionButton.MouseEnter:Connect(function()
                    TweenService:Create(optionButton, TweenInfo.new(0.2), {
                        BackgroundTransparency = 0.1,
                        BackgroundColor3 = ColorPalette.AccentPurple
                    }):Play()
                end)
                
                optionButton.MouseLeave:Connect(function()
                    TweenService:Create(optionButton, TweenInfo.new(0.2), {
                        BackgroundTransparency = 0.3,
                        BackgroundColor3 = ColorPalette.BackgroundMedium
                    }):Play()
                end)
            end
            
            dropdownButton.MouseButton1Click:Connect(toggleDropdown)
            
            local elementData = {
                Name = dropdownName,
                Type = "Dropdown",
                Value = currentValue
            }
            
            table.insert(sectionData.elements, elementData)
            
            return dropdownFrame
        end
        
        function sectionMethods:AddTextBox(config)
            local textboxName = config.Name or "Text Box"
            local placeholder = config.Placeholder or "输入文本..."
            local defaultValue = config.Default or ""
            local callback = config.Callback or function() end
            
            local textboxFrame = Instance.new("Frame")
            textboxFrame.Name = "TextBox_" .. textboxName
            textboxFrame.Parent = sectionElements
            textboxFrame.BackgroundTransparency = 1
            textboxFrame.Size = UDim2.new(1, 0, 0, 35)
            
            local label = Instance.new("TextLabel")
            label.Name = "Label"
            label.Parent = textboxFrame
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(0.7, 0, 1, 0)
            label.Font = Enum.Font.GothamMedium
            label.Text = textboxName
            label.TextColor3 = ColorPalette.TextLight
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            local textBox = Instance.new("TextBox")
            textBox.Name = "TextBox"
            textBox.Parent = textboxFrame
            textBox.BackgroundColor3 = ColorPalette.BackgroundMedium
            textBox.Size = UDim2.new(0, 150, 0, 30)
            textBox.Position = UDim2.new(1, 0, 0.5, 0)
            textBox.AnchorPoint = Vector2.new(1, 0.5)
            textBox.Font = Enum.Font.Gotham
            textBox.Text = defaultValue
            textBox.TextColor3 = ColorPalette.TextLight
            textBox.TextSize = 13
            textBox.PlaceholderText = placeholder
            textBox.PlaceholderColor3 = ColorPalette.TextGray
            textBox.ClearTextOnFocus = false
            
            local boxCorner = Instance.new("UICorner")
            boxCorner.CornerRadius = UDim.new(0, 6)
            boxCorner.Parent = textBox
            
            local boxStroke = Instance.new("UIStroke")
            boxStroke.Parent = textBox
            boxStroke.Color = ColorPalette.IslandBorder
            boxStroke.Thickness = 1
            boxStroke.Transparency = 0.3
            
            textBox.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    SX_UI:DigitalParticleExplosion(textBox)
                    callback(textBox.Text)
                end
            end)
            
            local elementData = {
                Name = textboxName,
                Type = "TextBox",
                Value = defaultValue
            }
            
            table.insert(sectionData.elements, elementData)
            
            return textboxFrame
        end
        
        function sectionMethods:AddLabel(config)
            local labelText = config.Text or "标签"
            local textSize = config.TextSize or 14
            
            local labelFrame = Instance.new("Frame")
            labelFrame.Name = "Label_" .. labelText
            labelFrame.Parent = sectionElements
            labelFrame.BackgroundTransparency = 1
            labelFrame.Size = UDim2.new(1, 0, 0, textSize + 10)
            
            local label = Instance.new("TextLabel")
            label.Name = "Label"
            label.Parent = labelFrame
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(1, 0, 1, 0)
            label.Font = Enum.Font.GothamMedium
            label.Text = labelText
            label.TextColor3 = ColorPalette.TextLight
            label.TextSize = textSize
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            local elementData = {
                Name = labelText,
                Type = "Label"
            }
            
            table.insert(sectionData.elements, elementData)
            
            return labelFrame
        end
        
        function sectionMethods:AddParagraph(config)
            local title = config.Title or "标题"
            local content = config.Content or "内容"
            
            local paragraphFrame = Instance.new("Frame")
            paragraphFrame.Name = "Paragraph_" .. title
            paragraphFrame.Parent = sectionElements
            paragraphFrame.BackgroundColor3 = ColorPalette.BackgroundMedium
            paragraphFrame.BackgroundTransparency = 0.2
            paragraphFrame.Size = UDim2.new(1, 0, 0, 0)
            paragraphFrame.AutomaticSize = Enum.AutomaticSize.Y
            
            local paragraphCorner = Instance.new("UICorner")
            paragraphCorner.CornerRadius = UDim.new(0, 8)
            paragraphCorner.Parent = paragraphFrame
            
            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "Title"
            titleLabel.Parent = paragraphFrame
            titleLabel.BackgroundTransparency = 1
            titleLabel.Size = UDim2.new(1, -20, 0, 25)
            titleLabel.Position = UDim2.new(0, 10, 0, 5)
            titleLabel.Font = Enum.Font.GothamBold
            titleLabel.Text = title
            titleLabel.TextColor3 = ColorPalette.TextLight
            titleLabel.TextSize = 14
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local contentLabel = Instance.new("TextLabel")
            contentLabel.Name = "Content"
            contentLabel.Parent = paragraphFrame
            contentLabel.BackgroundTransparency = 1
            contentLabel.Size = UDim2.new(1, -20, 0, 0)
            contentLabel.Position = UDim2.new(0, 10, 0, 30)
            contentLabel.AutomaticSize = Enum.AutomaticSize.Y
            contentLabel.Font = Enum.Font.Gotham
            contentLabel.Text = content
            contentLabel.TextColor3 = ColorPalette.TextGray
            contentLabel.TextSize = 12
            contentLabel.TextWrapped = true
            contentLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local elementData = {
                Name = title,
                Type = "Paragraph"
            }
            
            table.insert(sectionData.elements, elementData)
            
            return paragraphFrame
        end
        
        return sectionMethods
    end
    
    return tabMethods
end

function SX_UI:Initialize()
    self:UpdateIslandText()
    
    local connection
    connection = RunService.Heartbeat:Connect(function()
        local time = tick()
        local glow1 = 0.5 + 0.3 * math.sin(time * 2)
        local glow2 = 0.5 + 0.3 * math.sin(time * 2 + 1)
        local glow3 = 0.5 + 0.3 * math.sin(time * 2 + 2)
        
        Ball1.BackgroundTransparency = glow1
        Ball2.BackgroundTransparency = glow2
        Ball3.BackgroundTransparency = glow3
    end)
    
    local logoConnection
    logoConnection = RunService.Heartbeat:Connect(function()
        local time = tick()
        LogoButton.Rotation = 5 * math.sin(time * 0.5)
    end)
    
    return self
end

getgenv().SX_UI = SX_UI

SX_UI:Initialize()

return SX_UI