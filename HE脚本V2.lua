local SX_UI = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local HttpService = game:GetService("HttpService")

local ColorPalette = {
    BackgroundDark = Color3.fromRGB(15, 15, 25),
    BackgroundMedium = Color3.fromRGB(25, 25, 35),
    BackgroundLight = Color3.fromRGB(35, 35, 50),
    AccentPurple = Color3.fromRGB(170, 85, 255),
    AccentBlue = Color3.fromRGB(85, 170, 255),
    AccentPink = Color3.fromRGB(255, 85, 170),
    TextLight = Color3.fromRGB(240, 245, 255),
    TextGray = Color3.fromRGB(180, 190, 210),
    IslandBackground = Color3.fromRGB(5, 5, 10),
    IslandBorder = Color3.fromRGB(150, 50, 255),
    SuccessGreen = Color3.fromRGB(85, 255, 85),
    WarningRed = Color3.fromRGB(255, 85, 85)
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SX_UI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local IslandContainer = Instance.new("Frame")
IslandContainer.Name = "IslandContainer"
IslandContainer.Parent = ScreenGui
IslandContainer.AnchorPoint = Vector2.new(0.5, 0)
IslandContainer.Position = UDim2.new(0.5, 0, 0.02, 0)
IslandContainer.Size = UDim2.new(0, 220, 0, 50)
IslandContainer.BackgroundTransparency = 1
IslandContainer.ZIndex = 999
IslandContainer.Visible = false

local IslandBackground = Instance.new("Frame")
IslandBackground.Name = "IslandBackground"
IslandBackground.Parent = IslandContainer
IslandBackground.BackgroundColor3 = ColorPalette.IslandBackground
IslandBackground.Size = UDim2.new(1, 0, 1, 0)
IslandBackground.ZIndex = 1000

local IslandCorner = Instance.new("UICorner")
IslandCorner.CornerRadius = UDim.new(1, 0)
IslandCorner.Parent = IslandBackground

local IslandStroke = Instance.new("UIStroke")
IslandStroke.Parent = IslandBackground
IslandStroke.Color = ColorPalette.IslandBorder
IslandStroke.Thickness = 2
IslandStroke.Transparency = 0

local ColorBallsContainer = Instance.new("Frame")
ColorBallsContainer.Name = "ColorBalls"
ColorBallsContainer.Parent = IslandBackground
ColorBallsContainer.BackgroundTransparency = 1
ColorBallsContainer.Size = UDim2.new(0, 55, 1, 0)
ColorBallsContainer.Position = UDim2.new(0, 10, 0.5, 0)
ColorBallsContainer.AnchorPoint = Vector2.new(0, 0.5)
ColorBallsContainer.ZIndex = 1001

local colorBalls = {}
local ballColors = {ColorPalette.AccentPink, ColorPalette.AccentBlue, ColorPalette.AccentPurple}
local ballPositions = {UDim2.new(0, 5, 0.5, 0), UDim2.new(0, 20, 0.5, 0), UDim2.new(0, 35, 0.5, 0)}

for i = 1, 3 do
    local ball = Instance.new("Frame")
    ball.Name = "ColorBall_" .. i
    ball.Parent = ColorBallsContainer
    ball.BackgroundColor3 = ballColors[i]
    ball.Size = UDim2.new(0, 10, 0, 10)
    ball.Position = ballPositions[i]
    ball.AnchorPoint = Vector2.new(0, 0.5)
    ball.ZIndex = 1002
    
    local ballCorner = Instance.new("UICorner")
    ballCorner.CornerRadius = UDim.new(1, 0)
    ballCorner.Parent = ball
    
    local ballGlow = Instance.new("UIGradient")
    ballGlow.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, ballColors[i]), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))})
    ballGlow.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.3), NumberSequenceKeypoint.new(1, 0.7)})
    ballGlow.Rotation = 45
    ballGlow.Parent = ball
    
    local innerGlow = Instance.new("Frame")
    innerGlow.Name = "InnerGlow"
    innerGlow.Parent = ball
    innerGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    innerGlow.Size = UDim2.new(0.5, 0, 0.5, 0)
    innerGlow.Position = UDim2.new(0.25, 0, 0.25, 0)
    innerGlow.BackgroundTransparency = 0.5
    innerGlow.ZIndex = 1003
    
    local innerCorner = Instance.new("UICorner")
    innerCorner.CornerRadius = UDim.new(1, 0)
    innerCorner.Parent = innerGlow
    
    colorBalls[i] = ball
end

local IslandText = Instance.new("TextLabel")
IslandText.Name = "IslandText"
IslandText.Parent = IslandBackground
IslandText.BackgroundTransparency = 1
IslandText.Position = UDim2.new(0, 70, 0.5, 0)
IslandText.Size = UDim2.new(0, 140, 0.8, 0)
IslandText.AnchorPoint = Vector2.new(0, 0.5)
IslandText.Font = Enum.Font.GothamMedium
IslandText.Text = "SX UI | 等待启动..."
IslandText.TextColor3 = ColorPalette.TextLight
IslandText.TextSize = 12
IslandText.TextXAlignment = Enum.TextXAlignment.Left
IslandText.ZIndex = 1001

local LogoButton = Instance.new("ImageButton")
LogoButton.Name = "LogoButton"
LogoButton.Parent = ScreenGui
LogoButton.AnchorPoint = Vector2.new(1, 0)
LogoButton.Position = UDim2.new(1, -20, 0.02, 0)
LogoButton.Size = UDim2.new(0, 35, 0, 35)
LogoButton.BackgroundColor3 = ColorPalette.IslandBackground
LogoButton.AutoButtonColor = false
LogoButton.Image = "rbxassetid://10709791437"
LogoButton.ZIndex = 1000
LogoButton.Visible = false

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = LogoButton

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Parent = LogoButton
LogoStroke.Color = ColorPalette.IslandBorder
LogoStroke.Thickness = 2

local MainFrame = Instance.new("Frame")
MainFrame.Name = "Main"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 550, 0, 400)
MainFrame.BackgroundTransparency = 1
MainFrame.ZIndex = 1
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false

local BackgroundFrame = Instance.new("Frame")
BackgroundFrame.Name = "Background"
BackgroundFrame.Parent = MainFrame
BackgroundFrame.BackgroundColor3 = ColorPalette.BackgroundDark
BackgroundFrame.Size = UDim2.new(1, 0, 1, 0)
BackgroundFrame.ZIndex = -100

local MainUICorner = Instance.new("UICorner")
MainUICorner.CornerRadius = UDim.new(0, 15)
MainUICorner.Parent = BackgroundFrame

local MainUIStroke = Instance.new("UIStroke")
MainUIStroke.Parent = BackgroundFrame
MainUIStroke.Color = ColorPalette.IslandBorder
MainUIStroke.Thickness = 2
MainUIStroke.Transparency = 0

local BackgroundGradient = Instance.new("UIGradient")
BackgroundGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ColorPalette.BackgroundDark),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 30, 45)),
    ColorSequenceKeypoint.new(1, ColorPalette.BackgroundDark)
})
BackgroundGradient.Rotation = 135
BackgroundGradient.Parent = BackgroundFrame

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = ColorPalette.BackgroundMedium
TopBar.BackgroundTransparency = 0.1
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.ZIndex = 2

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 15)
TopBarCorner.Parent = TopBar

local SearchBox = Instance.new("TextBox")
SearchBox.Name = "SearchBox"
SearchBox.Parent = TopBar
SearchBox.BackgroundColor3 = ColorPalette.BackgroundLight
SearchBox.BackgroundTransparency = 0.2
SearchBox.Position = UDim2.new(0, 15, 0.5, -12)
SearchBox.Size = UDim2.new(0, 150, 0, 24)
SearchBox.AnchorPoint = Vector2.new(0, 0.5)
SearchBox.Font = Enum.Font.Gotham
SearchBox.PlaceholderText = "搜索功能..."
SearchBox.PlaceholderColor3 = ColorPalette.TextGray
SearchBox.TextColor3 = ColorPalette.TextLight
SearchBox.TextSize = 12
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.ZIndex = 3

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 8)
SearchCorner.Parent = SearchBox

local SearchPadding = Instance.new("UIPadding")
SearchPadding.Parent = SearchBox
SearchPadding.PaddingLeft = UDim.new(0, 8)

local TitleContainer = Instance.new("Frame")
TitleContainer.Name = "TitleContainer"
TitleContainer.Parent = TopBar
TitleContainer.BackgroundTransparency = 1
TitleContainer.Size = UDim2.new(0, 200, 1, 0)
TitleContainer.Position = UDim2.new(0.5, -100, 0, 0)
TitleContainer.ZIndex = 2

local TitleText = Instance.new("TextLabel")
TitleText.Name = "Title"
TitleText.Parent = TitleContainer
TitleText.BackgroundTransparency = 1
TitleText.Size = UDim2.new(1, 0, 0.6, 0)
TitleText.Position = UDim2.new(0, 0, 0, 5)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "SX UI"
TitleText.TextColor3 = ColorPalette.TextLight
TitleText.TextSize = 18
TitleText.ZIndex = 3

local SubTitleText = Instance.new("TextLabel")
SubTitleText.Name = "SubTitle"
SubTitleText.Parent = TitleContainer
SubTitleText.BackgroundTransparency = 1
SubTitleText.Size = UDim2.new(1, 0, 0.4, 0)
SubTitleText.Position = UDim2.new(0, 0, 0.6, 0)
SubTitleText.Font = Enum.Font.GothamMedium
SubTitleText.Text = "高级多功能面板"
SubTitleText.TextColor3 = ColorPalette.TextGray
SubTitleText.TextSize = 11
SubTitleText.ZIndex = 3

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundTransparency = 1
CloseButton.Position = UDim2.new(1, -30, 0.5, -10)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.AnchorPoint = Vector2.new(1, 0.5)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "−"
CloseButton.TextColor3 = ColorPalette.AccentPurple
CloseButton.TextSize = 18
CloseButton.ZIndex = 10

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "Content"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Size = UDim2.new(1, -20, 1, -60)
ContentFrame.Position = UDim2.new(0, 10, 0, 50)
ContentFrame.ZIndex = 2

local TabButtons = Instance.new("ScrollingFrame")
TabButtons.Name = "TabButtons"
TabButtons.Parent = ContentFrame
TabButtons.BackgroundTransparency = 1
TabButtons.Size = UDim2.new(0, 150, 1, 0)
TabButtons.Position = UDim2.new(0, 0, 0, 0)
TabButtons.ScrollBarThickness = 2
TabButtons.ScrollBarImageColor3 = ColorPalette.AccentPurple
TabButtons.AutomaticCanvasSize = Enum.AutomaticSize.Y
TabButtons.CanvasSize = UDim2.new(0, 0, 0, 0)
TabButtons.ZIndex = 2

local TabButtonList = Instance.new("UIListLayout")
TabButtonList.Parent = TabButtons
TabButtonList.Padding = UDim.new(0, 5)
TabButtonList.SortOrder = Enum.SortOrder.LayoutOrder

local TabButtonPadding = Instance.new("UIPadding")
TabButtonPadding.Parent = TabButtons
TabButtonPadding.PaddingTop = UDim.new(0, 5)

local TabContents = Instance.new("Frame")
TabContents.Name = "TabContents"
TabContents.Parent = ContentFrame
TabContents.BackgroundTransparency = 1
TabContents.Size = UDim2.new(1, -160, 1, 0)
TabContents.Position = UDim2.new(0, 160, 0, 0)
TabContents.ZIndex = 2

local SectionsContainer = Instance.new("Frame")
SectionsContainer.Name = "SectionsContainer"
SectionsContainer.Parent = TabContents
SectionsContainer.BackgroundTransparency = 1
SectionsContainer.Size = UDim2.new(1, 0, 1, 0)
SectionsContainer.ZIndex = 2

local LeftSections = Instance.new("Frame")
LeftSections.Name = "LeftSections"
LeftSections.Parent = SectionsContainer
LeftSections.BackgroundTransparency = 1
LeftSections.Size = UDim2.new(0.48, 0, 1, 0)
LeftSections.Position = UDim2.new(0, 0, 0, 0)

local RightSections = Instance.new("Frame")
RightSections.Name = "RightSections"
RightSections.Parent = SectionsContainer
RightSections.BackgroundTransparency = 1
RightSections.Size = UDim2.new(0.48, 0, 1, 0)
RightSections.Position = UDim2.new(0.52, 0, 0, 0)

local LeftSectionList = Instance.new("UIListLayout")
LeftSectionList.Parent = LeftSections
LeftSectionList.Padding = UDim.new(0, 15)
LeftSectionList.SortOrder = Enum.SortOrder.LayoutOrder

local RightSectionList = Instance.new("UIListLayout")
RightSectionList.Parent = RightSections
RightSectionList.Padding = UDim.new(0, 15)
RightSectionList.SortOrder = Enum.SortOrder.LayoutOrder

local LeftSectionPadding = Instance.new("UIPadding")
LeftSectionPadding.Parent = LeftSections
LeftSectionPadding.PaddingTop = UDim.new(0, 10)

local RightSectionPadding = Instance.new("UIPadding")
RightSectionPadding.Parent = RightSections
RightSectionPadding.PaddingTop = UDim.new(0, 10)

local Icons = {
    sword = "rbxassetid://10734924532",
    shield = "rbxassetid://10734896206",
    settings = "rbxassetid://10734924532",
    user = "rbxassetid://10734896206",
    star = "rbxassetid://10734924532",
    heart = "rbxassetid://10734896206",
    eye = "rbxassetid://10734924532",
    zap = "rbxassetid://10734896206"
}

local enabledFeatures = {}
local disabledFeatures = {}
local activeFeatures = {}

local isMinimized = false
local currentTab = nil
local tabs = {}
local sections = {}

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
    explosionCenter.ZIndex = 998
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
    for i = 1, 8 do
        local particle = Instance.new("TextLabel")
        particle.Name = "DigitalParticle_" .. i
        particle.Parent = target
        particle.BackgroundTransparency = 1
        particle.Text = tostring(math.random(0, 1))
        particle.TextColor3 = ballColors[math.random(1, 3)]
        particle.TextSize = math.random(10, 14)
        particle.Font = Enum.Font.Code
        particle.ZIndex = 999
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
            
            local angles = {0, 45, 90, 135, 180, 225, 270, 315}
            
            for i, particle in pairs(particles) do
                local angle = math.rad(angles[i] or (i * 45))
                local distance = 80 * progress
                local xOffset = math.cos(angle) * distance
                local yOffset = math.sin(angle) * distance
                
                particle.Position = UDim2.new(relX, xOffset, relY, yOffset)
                particle.Rotation = angles[i] * progress
                particle.TextTransparency = progress
            end
            
            explosionCenter.Size = UDim2.new(0, 40 + 20 * progress, 0, 40 + 20 * progress)
        end)
        
        task.wait(0.8)
    end)
end

function SX_UI:UpdateIslandText()
    local enabledCount = 0
    for _ in pairs(enabledFeatures) do
        enabledCount = enabledCount + 1
    end
    
    local disabledCount = 0
    for _ in pairs(disabledFeatures) do
        disabledCount = disabledCount + 1
    end
    
    local activeList = ""
    for name, _ in pairs(activeFeatures) do
        if #activeList < 30 then
            if activeList ~= "" then
                activeList = activeList .. ", "
            end
            activeList = activeList .. name
        end
    end
    
    if #activeList > 30 then
        activeList = activeList:sub(1, 27) .. "..."
    end
    
    local text = "SX UI"
    if enabledCount > 0 or disabledCount > 0 then
        text = string.format("开启:%d 关闭:%d | %s", enabledCount, disabledCount, activeList)
    end
    
    IslandText.Text = text
end

function SX_UI:ToggleMinimize()
    self:DigitalParticleExplosion(CloseButton)
    
    if isMinimized then
        CloseButton.Text = "−"
        
        local frameTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 550, 0, 400),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        
        frameTween:Play()
        
        task.wait(0.1)
        MainFrame.Visible = true
        
        TweenService:Create(IslandContainer, TweenInfo.new(0.3), {
            Position = UDim2.new(0.5, 0, -0.05, 0)
        }):Play()
        
        isMinimized = false
    else
        CloseButton.Text = "+"
        
        local frameTween = TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        
        frameTween:Play()
        
        task.wait(0.4)
        MainFrame.Visible = false
        
        TweenService:Create(IslandContainer, TweenInfo.new(0.3), {
            Position = UDim2.new(0.5, 0, 0.02, 0)
        }):Play()
        
        isMinimized = true
    end
end

function SX_UI:ToggleUI()
    self:DigitalParticleExplosion(LogoButton)
    
    if MainFrame.Visible then
        self:ToggleMinimize()
    else
        MainFrame.Visible = true
        isMinimized = false
        CloseButton.Text = "−"
        
        local frameTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 550, 0, 400),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        
        frameTween:Play()
        
        TweenService:Create(IslandContainer, TweenInfo.new(0.3), {
            Position = UDim2.new(0.5, 0, -0.05, 0)
        }):Play()
    end
end

function SX_UI:CreateWindow(config)
    local windowName = config.Name or "SX UI"
    local subTitle = config.SubTitle or "高级多功能面板"
    
    TitleText.Text = windowName
    SubTitleText.Text = subTitle
    
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = SearchBox.Text:lower()
        
        for _, tabData in pairs(tabs) do
            local tabVisible = false
            
            for _, sectionData in pairs(sections) do
                if sectionData.Tab == tabData.Button then
                    local sectionVisible = false
                    
                    for _, element in pairs(sectionData.Elements) do
                        local elementText = element.Name:lower()
                        local matches = searchText == "" or elementText:find(searchText, 1, true)
                        
                        if element.Instance then
                            element.Instance.Visible = matches
                        end
                        
                        if matches then
                            sectionVisible = true
                        end
                    end
                    
                    if sectionData.Container then
                        sectionData.Container.Visible = sectionVisible
                    end
                    
                    if sectionVisible then
                        tabVisible = true
                    end
                end
            end
            
            if tabData.Button then
                tabData.Button.Visible = tabVisible or searchText == ""
            end
        end
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        self:ToggleMinimize()
    end)
    
    IslandBackground.MouseButton1Click:Connect(function()
        self:ToggleUI()
    end)
    
    LogoButton.MouseButton1Click:Connect(function()
        self:ToggleUI()
    end)
    
    local window = {}
    
    function window:DrawTab(config)
        local tabName = config.Name or "标签页"
        local iconName = config.Icon or "settings"
        local enableScrolling = config.EnableScrolling or true
        
        local icon = Icons[iconName] or Icons.settings
        
        local tabButton = Instance.new("TextButton")
        tabButton.Name = "Tab_" .. tabName
        tabButton.Parent = TabButtons
        tabButton.BackgroundColor3 = ColorPalette.BackgroundLight
        tabButton.BackgroundTransparency = 0.3
        tabButton.Size = UDim2.new(1, -10, 0, 35)
        tabButton.Font = Enum.Font.GothamMedium
        tabButton.Text = ""
        tabButton.TextColor3 = ColorPalette.TextGray
        tabButton.TextSize = 14
        tabButton.AutoButtonColor = false
        
        local tabCorner = Instance.new("UICorner")
        tabCorner.CornerRadius = UDim.new(0, 8)
        tabCorner.Parent = tabButton
        
        local iconLabel = Instance.new("ImageLabel")
        iconLabel.Name = "Icon"
        iconLabel.Parent = tabButton
        iconLabel.BackgroundTransparency = 1
        iconLabel.Size = UDim2.new(0, 20, 0, 20)
        iconLabel.Position = UDim2.new(0, 10, 0.5, -10)
        iconLabel.AnchorPoint = Vector2.new(0, 0.5)
        iconLabel.Image = icon
        iconLabel.ImageColor3 = ColorPalette.TextGray
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "Text"
        textLabel.Parent = tabButton
        textLabel.BackgroundTransparency = 1
        textLabel.Size = UDim2.new(1, -40, 1, 0)
        textLabel.Position = UDim2.new(0, 35, 0, 0)
        textLabel.Font = Enum.Font.GothamMedium
        textLabel.Text = tabName
        textLabel.TextColor3 = ColorPalette.TextGray
        textLabel.TextSize = 14
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local tabContent = Instance.new("ScrollingFrame")
        tabContent.Name = "Content_" .. tabName
        tabContent.Parent = SectionsContainer
        tabContent.BackgroundTransparency = 1
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.ScrollBarThickness = 3
        tabContent.ScrollBarImageColor3 = ColorPalette.AccentPurple
        tabContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
        tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContent.Visible = false
        
        if not enableScrolling then
            tabContent.ScrollingEnabled = false
        end
        
        local tabMethods = {}
        
        function tabMethods:DrawSection(config)
            local sectionName = config.Name or "区域"
            local position = config.Position or 'left'
            
            local sectionContainer
            if position == 'left' then
                sectionContainer = LeftSections
            else
                sectionContainer = RightSections
            end
            
            local sectionFrame = Instance.new("Frame")
            sectionFrame.Name = "Section_" .. sectionName
            sectionFrame.Parent = sectionContainer
            sectionFrame.BackgroundColor3 = ColorPalette.BackgroundLight
            sectionFrame.BackgroundTransparency = 0.2
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
            
            local header = Instance.new("Frame")
            header.Name = "Header"
            header.Parent = sectionFrame
            header.BackgroundTransparency = 1
            header.Size = UDim2.new(1, 0, 0, 30)
            
            local title = Instance.new("TextLabel")
            title.Name = "Title"
            title.Parent = header
            title.BackgroundTransparency = 1
            title.Size = UDim2.new(1, -20, 1, 0)
            title.Position = UDim2.new(0, 10, 0, 0)
            title.Font = Enum.Font.GothamBold
            title.Text = sectionName
            title.TextColor3 = ColorPalette.TextLight
            title.TextSize = 15
            title.TextXAlignment = Enum.TextXAlignment.Left
            
            local content = Instance.new("Frame")
            content.Name = "Content"
            content.Parent = sectionFrame
            content.BackgroundTransparency = 1
            content.Size = UDim2.new(1, -20, 0, 0)
            content.Position = UDim2.new(0, 10, 0, 35)
            content.AutomaticSize = Enum.AutomaticSize.Y
            
            local contentList = Instance.new("UIListLayout")
            contentList.Parent = content
            contentList.Padding = UDim.new(0, 8)
            contentList.SortOrder = Enum.SortOrder.LayoutOrder
            
            local sectionElements = {}
            
            table.insert(sections, {
                Tab = tabButton,
                Container = sectionFrame,
                Elements = sectionElements
            })
            
            local sectionMethods = {}
            
            function sectionMethods:AddButton(config)
                local buttonName = config.Name or "按钮"
                local callback = config.Callback or function() end
                
                local buttonFrame = Instance.new("Frame")
                buttonFrame.Name = "Button_" .. buttonName
                buttonFrame.Parent = content
                buttonFrame.BackgroundColor3 = ColorPalette.BackgroundMedium
                buttonFrame.BackgroundTransparency = 0.3
                buttonFrame.Size = UDim2.new(1, 0, 0, 35)
                
                table.insert(sectionElements, {Name = buttonName, Instance = buttonFrame})
                
                local buttonCorner = Instance.new("UICorner")
                buttonCorner.CornerRadius = UDim.new(0, 8)
                buttonCorner.Parent = buttonFrame
                
                local buttonStroke = Instance.new("UIStroke")
                buttonStroke.Parent = buttonFrame
                buttonStroke.Color = ColorPalette.IslandBorder
                buttonStroke.Thickness = 1
                buttonStroke.Transparency = 0.5
                
                local button = Instance.new("TextButton")
                button.Name = "Button"
                button.Parent = buttonFrame
                button.BackgroundTransparency = 1
                button.Size = UDim2.new(1, 0, 1, 0)
                button.Font = Enum.Font.GothamMedium
                button.Text = buttonName
                button.TextColor3 = ColorPalette.TextLight
                button.TextSize = 14
                
                button.MouseButton1Click:Connect(function()
                    SX_UI:DigitalParticleExplosion(button)
                    callback()
                end)
                
                button.MouseEnter:Connect(function()
                    TweenService:Create(buttonFrame, TweenInfo.new(0.2), {
                        BackgroundTransparency = 0.1
                    }):Play()
                end)
                
                button.MouseLeave:Connect(function()
                    TweenService:Create(buttonFrame, TweenInfo.new(0.2), {
                        BackgroundTransparency = 0.3
                    }):Play()
                end)
                
                local buttonObj = {}
                
                function buttonObj:SetText(newText)
                    button.Text = newText
                end
                
                return buttonObj
            end
            
            function sectionMethods:AddToggle(config)
                local toggleName = config.Name or "开关"
                local defaultValue = config.Default or false
                local callback = config.Callback or function() end
                
                local toggleFrame = Instance.new("Frame")
                toggleFrame.Name = "Toggle_" .. toggleName
                toggleFrame.Parent = content
                toggleFrame.BackgroundTransparency = 1
                toggleFrame.Size = UDim2.new(1, 0, 0, 30)
                
                table.insert(sectionElements, {Name = toggleName, Instance = toggleFrame})
                
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
                toggleButton.Position = UDim2.new(1, 0, 0.5, -12.5)
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
                toggleDot.Size = UDim2.new(0, 19, 0, 19)
                toggleDot.Position = defaultValue and UDim2.new(1, -22, 0.5, -9.5) or UDim2.new(0, 3, 0.5, -9.5)
                toggleDot.AnchorPoint = Vector2.new(0.5, 0.5)
                
                local dotCorner = Instance.new("UICorner")
                dotCorner.CornerRadius = UDim.new(1, 0)
                dotCorner.Parent = toggleDot
                
                local isToggled = defaultValue
                
                if defaultValue then
                    enabledFeatures[toggleName] = true
                else
                    disabledFeatures[toggleName] = true
                end
                
                local function updateToggle()
                    if isToggled then
                        TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                            BackgroundColor3 = ColorPalette.AccentPurple
                        }):Play()
                        TweenService:Create(toggleDot, TweenInfo.new(0.3), {
                            Position = UDim2.new(1, -22, 0.5, -9.5)
                        }):Play()
                        
                        enabledFeatures[toggleName] = true
                        disabledFeatures[toggleName] = nil
                        activeFeatures[toggleName] = true
                    else
                        TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                            BackgroundColor3 = ColorPalette.BackgroundMedium
                        }):Play()
                        TweenService:Create(toggleDot, TweenInfo.new(0.3), {
                            Position = UDim2.new(0, 3, 0.5, -9.5)
                        }):Play()
                        
                        disabledFeatures[toggleName] = true
                        enabledFeatures[toggleName] = nil
                        activeFeatures[toggleName] = nil
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
                
                local toggleObj = {}
                
                function toggleObj:SetValue(value)
                    isToggled = value
                    updateToggle()
                end
                
                function toggleObj:GetValue()
                    return isToggled
                end
                
                return toggleObj
            end
            
            function sectionMethods:AddSlider(config)
                local sliderName = config.Name or "滑条"
                local minValue = config.Min or 0
                local maxValue = config.Max or 100
                local defaultValue = config.Default or 50
                local callback = config.Callback or function() end
                local precise = config.Precise or false
                
                local sliderFrame = Instance.new("Frame")
                sliderFrame.Name = "Slider_" .. sliderName
                sliderFrame.Parent = content
                sliderFrame.BackgroundTransparency = 1
                sliderFrame.Size = UDim2.new(1, 0, 0, 50)
                
                table.insert(sectionElements, {Name = sliderName, Instance = sliderFrame})
                
                local topRow = Instance.new("Frame")
                topRow.Name = "TopRow"
                topRow.Parent = sliderFrame
                topRow.BackgroundTransparency = 1
                topRow.Size = UDim2.new(1, 0, 0, 20)
                
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Parent = topRow
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(0.7, 0, 1, 0)
                label.Font = Enum.Font.GothamMedium
                label.Text = sliderName
                label.TextColor3 = ColorPalette.TextLight
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Left
                
                local valueLabel = Instance.new("TextLabel")
                valueLabel.Name = "Value"
                valueLabel.Parent = topRow
                valueLabel.BackgroundTransparency = 1
                valueLabel.Size = UDim2.new(0.3, 0, 1, 0)
                valueLabel.Position = UDim2.new(0.7, 0, 0, 0)
                valueLabel.Font = Enum.Font.GothamMedium
                valueLabel.Text = tostring(defaultValue)
                valueLabel.TextColor3 = ColorPalette.TextLight
                valueLabel.TextSize = 14
                valueLabel.TextXAlignment = Enum.TextXAlignment.Right
                
                local sliderBar = Instance.new("Frame")
                sliderBar.Name = "SliderBar"
                sliderBar.Parent = sliderFrame
                sliderBar.BackgroundColor3 = ColorPalette.BackgroundMedium
                sliderBar.Size = UDim2.new(1, 0, 0, 6)
                sliderBar.Position = UDim2.new(0, 0, 1, -6)
                sliderBar.AnchorPoint = Vector2.new(0, 1)
                
                local barCorner = Instance.new("UICorner")
                barCorner.CornerRadius = UDim.new(1, 0)
                barCorner.Parent = sliderBar
                
                local fill = Instance.new("Frame")
                fill.Name = "Fill"
                fill.Parent = sliderBar
                fill.BackgroundColor3 = ColorPalette.AccentPurple
                fill.Size = UDim2.new((defaultValue - minValue) / (maxValue - minValue), 0, 1, 0)
                fill.ZIndex = 2
                
                local fillCorner = Instance.new("UICorner")
                fillCorner.CornerRadius = UDim.new(1, 0)
                fillCorner.Parent = fill
                
                local dot = Instance.new("Frame")
                dot.Name = "Dot"
                dot.Parent = sliderBar
                dot.BackgroundColor3 = ColorPalette.TextLight
                dot.Size = UDim2.new(0, 14, 0, 14)
                dot.Position = UDim2.new((defaultValue - minValue) / (maxValue - minValue), -7, 0.5, -7)
                dot.AnchorPoint = Vector2.new(0, 0.5)
                dot.ZIndex = 3
                
                local dotCorner = Instance.new("UICorner")
                dotCorner.CornerRadius = UDim.new(1, 0)
                dotCorner.Parent = dot
                
                local isDragging = false
                local currentValue = defaultValue
                
                local function updateSlider(value)
                    currentValue = precise and value or math.floor(value)
                    local ratio = (currentValue - minValue) / (maxValue - minValue)
                    
                    TweenService:Create(fill, TweenInfo.new(0.1), {
                        Size = UDim2.new(ratio, 0, 1, 0)
                    }):Play()
                    
                    TweenService:Create(dot, TweenInfo.new(0.1), {
                        Position = UDim2.new(ratio, -7, 0.5, -7)
                    }):Play()
                    
                    valueLabel.Text = tostring(currentValue)
                    callback(currentValue)
                end
                
                sliderBar.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDragging = true
                        SX_UI:DigitalParticleExplosion(sliderBar)
                    end
                end)
                
                sliderBar.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDragging = false
                    end
                end)
                
                UserInputService.InputChanged:Connect(function(input)
                    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local mouse = Players.LocalPlayer:GetMouse()
                        local xOffset = mouse.X - sliderBar.AbsolutePosition.X
                        local ratio = math.clamp(xOffset / sliderBar.AbsoluteSize.X, 0, 1)
                        local value = minValue + ratio * (maxValue - minValue)
                        updateSlider(value)
                    end
                end)
                
                updateSlider(defaultValue)
                
                local sliderObj = {}
                
                function sliderObj:SetValue(value)
                    updateSlider(math.clamp(value, minValue, maxValue))
                end
                
                function sliderObj:GetValue()
                    return currentValue
                end
                
                return sliderObj
            end
            
            function sectionMethods:AddDropdown(config)
                local dropdownName = config.Name or "下拉框"
                local options = config.Options or {"选项1", "选项2", "选项3"}
                local defaultValue = config.Default or options[1]
                local callback = config.Callback or function() end
                
                local dropdownFrame = Instance.new("Frame")
                dropdownFrame.Name = "Dropdown_" .. dropdownName
                dropdownFrame.Parent = content
                dropdownFrame.BackgroundTransparency = 1
                dropdownFrame.Size = UDim2.new(1, 0, 0, 35)
                
                table.insert(sectionElements, {Name = dropdownName, Instance = dropdownFrame})
                
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
                dropdownButton.Size = UDim2.new(0.3, 0, 0, 30)
                dropdownButton.Position = UDim2.new(0.7, 0, 0.5, -15)
                dropdownButton.AnchorPoint = Vector2.new(0, 0.5)
                dropdownButton.Font = Enum.Font.GothamMedium
                dropdownButton.Text = defaultValue
                dropdownButton.TextColor3 = ColorPalette.TextLight
                dropdownButton.TextSize = 13
                dropdownButton.AutoButtonColor = false
                
                local buttonCorner = Instance.new("UICorner")
                buttonCorner.CornerRadius = UDim.new(0, 6)
                buttonCorner.Parent = dropdownButton
                
                local dropdownList = Instance.new("ScrollingFrame")
                dropdownList.Name = "DropdownList"
                dropdownList.Parent = ScreenGui
                dropdownList.BackgroundColor3 = ColorPalette.BackgroundLight
                dropdownList.BackgroundTransparency = 0.1
                dropdownList.Size = UDim2.new(0, 120, 0, 0)
                dropdownList.Position = UDim2.new(0, 0, 0, 0)
                dropdownList.ScrollBarThickness = 2
                dropdownList.ScrollBarImageColor3 = ColorPalette.AccentPurple
                dropdownList.AutomaticCanvasSize = Enum.AutomaticSize.Y
                dropdownList.CanvasSize = UDim2.new(0, 0, 0, 0)
                dropdownList.Visible = false
                dropdownList.ZIndex = 9999
                
                local listCorner = Instance.new("UICorner")
                listCorner.CornerRadius = UDim.new(0, 6)
                listCorner.Parent = dropdownList
                
                local listStroke = Instance.new("UIStroke")
                listStroke.Parent = dropdownList
                listStroke.Color = ColorPalette.IslandBorder
                listStroke.Thickness = 1
                
                local listLayout = Instance.new("UIListLayout")
                listLayout.Parent = dropdownList
                listLayout.Padding = UDim.new(0, 2)
                listLayout.SortOrder = Enum.SortOrder.LayoutOrder
                
                local listPadding = Instance.new("UIPadding")
                listPadding.Parent = dropdownList
                listPadding.PaddingTop = UDim.new(0, 5)
                listPadding.PaddingBottom = UDim.new(0, 5)
                
                local isOpen = false
                local currentValue = defaultValue
                
                local function updatePosition()
                    local buttonPos = dropdownButton.AbsolutePosition
                    local buttonSize = dropdownButton.AbsoluteSize
                    
                    dropdownList.Position = UDim2.new(
                        0, buttonPos.X,
                        0, buttonPos.Y + buttonSize.Y + 5
                    )
                    dropdownList.Size = UDim2.new(0, buttonSize.X, 0, math.min(#options * 30 + 10, 150))
                end
                
                local function toggleDropdown()
                    isOpen = not isOpen
                    dropdownList.Visible = isOpen
                    
                    if isOpen then
                        updatePosition()
                        SX_UI:DigitalParticleExplosion(dropdownButton)
                    end
                end
                
                dropdownButton.MouseButton1Click:Connect(toggleDropdown)
                
                local function selectOption(option)
                    currentValue = option
                    dropdownButton.Text = option
                    toggleDropdown()
                    callback(option)
                end
                
                for _, option in ipairs(options) do
                    local optionButton = Instance.new("TextButton")
                    optionButton.Name = "Option_" .. option
                    optionButton.Parent = dropdownList
                    optionButton.BackgroundColor3 = ColorPalette.BackgroundMedium
                    optionButton.BackgroundTransparency = 0.3
                    optionButton.Size = UDim2.new(1, -10, 0, 25)
                    optionButton.Position = UDim2.new(0, 5, 0, 0)
                    optionButton.Font = Enum.Font.Gotham
                    optionButton.Text = option
                    optionButton.TextColor3 = ColorPalette.TextLight
                    optionButton.TextSize = 13
                    optionButton.AutoButtonColor = false
                    
                    local optionCorner = Instance.new("UICorner")
                    optionCorner.CornerRadius = UDim.new(0, 4)
                    optionCorner.Parent = optionButton
                    
                    optionButton.MouseButton1Click:Connect(function()
                        selectOption(option)
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
                
                UserInputService.InputBegan:Connect(function(input)
                    if isOpen and input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local mousePos = input.Position
                        local listPos = dropdownList.AbsolutePosition
                        local listSize = dropdownList.AbsoluteSize
                        
                        if mousePos.X < listPos.X or mousePos.X > listPos.X + listSize.X or
                           mousePos.Y < listPos.Y or mousePos.Y > listPos.Y + listSize.Y then
                            toggleDropdown()
                        end
                    end
                end)
                
                local dropdownObj = {}
                
                function dropdownObj:SetValue(value)
                    if table.find(options, value) then
                        selectOption(value)
                    end
                end
                
                function dropdownObj:GetValue()
                    return currentValue
                end
                
                function dropdownObj:UpdateOptions(newOptions)
                    options = newOptions
                    
                    for _, child in ipairs(dropdownList:GetChildren()) do
                        if child:IsA("TextButton") then
                            child:Destroy()
                        end
                    end
                    
                    for _, option in ipairs(newOptions) do
                        local optionButton = Instance.new("TextButton")
                        optionButton.Name = "Option_" .. option
                        optionButton.Parent = dropdownList
                        optionButton.BackgroundColor3 = ColorPalette.BackgroundMedium
                        optionButton.BackgroundTransparency = 0.3
                        optionButton.Size = UDim2.new(1, -10, 0, 25)
                        optionButton.Position = UDim2.new(0, 5, 0, 0)
                        optionButton.Font = Enum.Font.Gotham
                        optionButton.Text = option
                        optionButton.TextColor3 = ColorPalette.TextLight
                        optionButton.TextSize = 13
                        optionButton.AutoButtonColor = false
                        
                        local optionCorner = Instance.new("UICorner")
                        optionCorner.CornerRadius = UDim.new(0, 4)
                        optionCorner.Parent = optionButton
                        
                        optionButton.MouseButton1Click:Connect(function()
                            selectOption(option)
                        end)
                    end
                end
                
                return dropdownObj
            end
            
            function sectionMethods:AddTextBox(config)
                local textboxName = config.Name or "输入框"
                local defaultValue = config.Default or ""
                local placeholder = config.Placeholder or "输入文本..."
                local callback = config.Callback or function() end
                
                local textboxFrame = Instance.new("Frame")
                textboxFrame.Name = "Textbox_" .. textboxName
                textboxFrame.Parent = content
                textboxFrame.BackgroundTransparency = 1
                textboxFrame.Size = UDim2.new(1, 0, 0, 35)
                
                table.insert(sectionElements, {Name = textboxName, Instance = textboxFrame})
                
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
                
                local textbox = Instance.new("TextBox")
                textbox.Name = "Textbox"
                textbox.Parent = textboxFrame
                textbox.BackgroundColor3 = ColorPalette.BackgroundMedium
                textbox.BackgroundTransparency = 0.3
                textbox.Size = UDim2.new(0.3, 0, 0, 30)
                textbox.Position = UDim2.new(0.7, 0, 0.5, -15)
                textbox.AnchorPoint = Vector2.new(0, 0.5)
                textbox.Font = Enum.Font.Gotham
                textbox.Text = defaultValue
                textbox.PlaceholderText = placeholder
                textbox.PlaceholderColor3 = ColorPalette.TextGray
                textbox.TextColor3 = ColorPalette.TextLight
                textbox.TextSize = 13
                textbox.ClearTextOnFocus = false
                
                local textboxCorner = Instance.new("UICorner")
                textboxCorner.CornerRadius = UDim.new(0, 6)
                textboxCorner.Parent = textbox
                
                textbox.Focused:Connect(function()
                    TweenService:Create(textbox, TweenInfo.new(0.2), {
                        BackgroundTransparency = 0.1
                    }):Play()
                end)
                
                textbox.FocusLost:Connect(function()
                    TweenService:Create(textbox, TweenInfo.new(0.2), {
                        BackgroundTransparency = 0.3
                    }):Play()
                    
                    callback(textbox.Text)
                end)
                
                local textboxObj = {}
                
                function textboxObj:SetText(text)
                    textbox.Text = text
                    callback(text)
                end
                
                function textboxObj:GetText()
                    return textbox.Text
                end
                
                return textboxObj
            end
            
            function sectionMethods:AddLabel(config)
                local labelText = config.Text or "标签"
                local textSize = config.TextSize or 14
                local textColor = config.TextColor or ColorPalette.TextLight
                
                local labelFrame = Instance.new("Frame")
                labelFrame.Name = "Label_" .. labelText
                labelFrame.Parent = content
                labelFrame.BackgroundTransparency = 1
                labelFrame.Size = UDim2.new(1, 0, 0, textSize + 10)
                
                table.insert(sectionElements, {Name = labelText, Instance = labelFrame})
                
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Parent = labelFrame
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(1, 0, 1, 0)
                label.Font = Enum.Font.GothamMedium
                label.Text = labelText
                label.TextColor3 = textColor
                label.TextSize = textSize
                label.TextXAlignment = Enum.TextXAlignment.Left
                
                local labelObj = {}
                
                function labelObj:SetText(text)
                    label.Text = text
                end
                
                return labelObj
            end
            
            function sectionMethods:AddKeybind(config)
                local keybindName = config.Name or "按键绑定"
                local defaultKey = config.Default or Enum.KeyCode.F
                local callback = config.Callback or function() end
                
                local keybindFrame = Instance.new("Frame")
                keybindFrame.Name = "Keybind_" .. keybindName
                keybindFrame.Parent = content
                keybindFrame.BackgroundTransparency = 1
                keybindFrame.Size = UDim2.new(1, 0, 0, 35)
                
                table.insert(sectionElements, {Name = keybindName, Instance = keybindFrame})
                
                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Parent = keybindFrame
                label.BackgroundTransparency = 1
                label.Size = UDim2.new(0.7, 0, 1, 0)
                label.Font = Enum.Font.GothamMedium
                label.Text = keybindName
                label.TextColor3 = ColorPalette.TextLight
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Left
                
                local keybindButton = Instance.new("TextButton")
                keybindButton.Name = "KeybindButton"
                keybindButton.Parent = keybindFrame
                keybindButton.BackgroundColor3 = ColorPalette.BackgroundMedium
                keybindButton.BackgroundTransparency = 0.3
                keybindButton.Size = UDim2.new(0.3, 0, 0, 30)
                keybindButton.Position = UDim2.new(0.7, 0, 0.5, -15)
                keybindButton.AnchorPoint = Vector2.new(0, 0.5)
                keybindButton.Font = Enum.Font.GothamMedium
                keybindButton.Text = tostring(defaultKey):gsub("Enum.KeyCode.", "")
                keybindButton.TextColor3 = ColorPalette.TextLight
                keybindButton.TextSize = 13
                keybindButton.AutoButtonColor = false
                
                local buttonCorner = Instance.new("UICorner")
                buttonCorner.CornerRadius = UDim.new(0, 6)
                buttonCorner.Parent = keybindButton
                
                local listening = false
                local currentKey = defaultKey
                
                local function updateKeybind(key)
                    currentKey = key
                    keybindButton.Text = tostring(key):gsub("Enum.KeyCode.", "")
                    callback(key)
                end
                
                keybindButton.MouseButton1Click:Connect(function()
                    listening = true
                    keybindButton.Text = "..."
                    SX_UI:DigitalParticleExplosion(keybindButton)
                end)
                
                local connection
                connection = UserInputService.InputBegan:Connect(function(input)
                    if listening then
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            updateKeybind(input.KeyCode)
                            listening = false
                        elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                            updateKeybind(Enum.KeyCode.LeftControl)
                            listening = false
                        end
                    elseif input.KeyCode == currentKey then
                        callback(currentKey)
                    end
                end)
                
                local keybindObj = {}
                
                function keybindObj:SetKey(key)
                    updateKeybind(key)
                end
                
                function keybindObj:GetKey()
                    return currentKey
                end
                
                return keybindObj
            end
            
            return sectionMethods
        end
        
        local function switchToTab()
            if currentTab then
                currentTab.Button.BackgroundColor3 = ColorPalette.BackgroundLight
                currentTab.Button.TextColor3 = ColorPalette.TextGray
                currentTab.Button.Icon.ImageColor3 = ColorPalette.TextGray
                currentTab.Content.Visible = false
            end
            
            currentTab = {
                Button = tabButton,
                Content = tabContent
            }
            
            local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            local buttonTween = TweenService:Create(tabButton, tweenInfo, {
                BackgroundColor3 = ColorPalette.AccentPurple,
                BackgroundTransparency = 0.2
            })
            
            local textTween = TweenService:Create(tabButton.Text, tweenInfo, {
                TextColor3 = ColorPalette.TextLight
            })
            
            local iconTween = TweenService:Create(tabButton.Icon, tweenInfo, {
                ImageColor3 = ColorPalette.TextLight
            })
            
            buttonTween:Play()
            textTween:Play()
            iconTween:Play()
            
            tabContent.Visible = true
            
            SX_UI:DigitalParticleExplosion(tabButton)
        end
        
        tabButton.MouseButton1Click:Connect(switchToTab)
        
        if #TabButtons:GetChildren() == 3 then
            switchToTab()
        end
        
        table.insert(tabs, {Button = tabButton, Content = tabContent})
        
        return tabMethods
    end
    
    local initTween = TweenService:Create(MainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 550, 0, 400),
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    
    initTween:Play()
    
    task.wait(0.3)
    
    IslandContainer.Visible = true
    LogoButton.Visible = true
    
    local islandTween = TweenService:Create(IslandContainer, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, 0, 0.02, 0)
    })
    
    local logoTween = TweenService:Create(LogoButton, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -20, 0.02, 0)
    })
    
    islandTween:Play()
    logoTween:Play()
    
    self:UpdateIslandText()
    
    return window
end

getgenv().SX_UI = SX_UI
return SX_UI