local Notification = {}
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local GUI = CoreGui:FindFirstChild("ModernNotification")
if not GUI then
    GUI = Instance.new("ScreenGui")
    GUI.Name = "ModernNotification"
    GUI.Parent = CoreGui
    GUI.ResetOnSpawn = false
    GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
end

local activeNotifications = {}
local notificationSpacing = 85
local maxNotifications = 5

local colorPalette = {
    primary = Color3.fromRGB(25, 25, 30),
    secondary = Color3.fromRGB(35, 35, 40),
    text = Color3.fromRGB(255, 255, 255),
    textSecondary = Color3.fromRGB(180, 180, 190),
    buttonBackground = Color3.fromRGB(45, 45, 50),
    buttonHover = Color3.fromRGB(55, 55, 60),
    cancelButton = Color3.fromRGB(80, 80, 85),
    confirmButton = Color3.fromRGB(0, 120, 215)
}

function Notification:Notify(config)
    local title = config.Title or "提示"
    local message = config.Message or ""
    local duration = config.Duration or 5
    local showButtons = config.ShowButtons or false
    local cancelText = config.CancelText or "取消"
    local confirmText = config.ConfirmText or "确认"
    local cancelCallback = config.CancelCallback
    local confirmCallback = config.ConfirmCallback
    local callback = config.Callback

    if #activeNotifications >= maxNotifications then
        local oldestId = next(activeNotifications)
        if oldestId then
            activeNotifications[oldestId].Container:Destroy()
            activeNotifications[oldestId] = nil
        end
    end

    local notificationId = #activeNotifications + 1
    local positionY = 15 + (#activeNotifications * notificationSpacing)

    local mainContainer = Instance.new("Frame")
    mainContainer.Name = "Notification_" .. notificationId
    mainContainer.Parent = GUI
    mainContainer.BackgroundColor3 = colorPalette.primary
    mainContainer.BorderSizePixel = 0
    mainContainer.Size = UDim2.new(0, 0, 0, 0)
    mainContainer.Position = UDim2.new(0, 15, 0, positionY)
    mainContainer.ClipsDescendants = true
    mainContainer.ZIndex = 100

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = mainContainer

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 65)
    stroke.Thickness = 1
    stroke.Parent = mainContainer

    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Parent = mainContainer
    content.BackgroundTransparency = 1
    content.Size = UDim2.new(1, -20, 1, -20)
    content.Position = UDim2.new(0, 10, 0, 10)
    content.ZIndex = 101

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Parent = content
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, 0, 0, 24)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Font = Enum.Font.GothamSemibold
    titleLabel.Text = title
    titleLabel.TextColor3 = colorPalette.text
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextTransparency = 1
    titleLabel.ZIndex = 102

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Name = "Message"
    messageLabel.Parent = content
    messageLabel.BackgroundTransparency = 1
    messageLabel.Size = UDim2.new(1, 0, 0, showButtons and 40 or 50)
    messageLabel.Position = UDim2.new(0, 0, 0, 24)
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.Text = message
    messageLabel.TextColor3 = colorPalette.textSecondary
    messageLabel.TextSize = 14
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.TextWrapped = true
    messageLabel.TextTransparency = 1
    messageLabel.ZIndex = 102

    local progressBarContainer = Instance.new("Frame")
    progressBarContainer.Name = "ProgressBarContainer"
    progressBarContainer.Parent = mainContainer
    progressBarContainer.BackgroundColor3 = colorPalette.secondary
    progressBarContainer.BorderSizePixel = 0
    progressBarContainer.Size = UDim2.new(1, -20, 0, 3)
    progressBarContainer.Position = UDim2.new(0, 10, 1, -13)
    progressBarContainer.ZIndex = 103
    progressBarContainer.AnchorPoint = Vector2.new(0, 1)

    local progressContainerCorner = Instance.new("UICorner")
    progressContainerCorner.CornerRadius = UDim.new(1, 0)
    progressContainerCorner.Parent = progressBarContainer

    local progressBar = Instance.new("Frame")
    progressBar.Name = "ProgressBar"
    progressBar.Parent = progressBarContainer
    progressBar.BackgroundColor3 = colorPalette.textSecondary
    progressBar.BorderSizePixel = 0
    progressBar.Size = UDim2.new(1, 0, 1, 0)
    progressBar.ZIndex = 104

    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(1, 0)
    progressCorner.Parent = progressBar

    local buttonContainer
    local cancelButton
    local confirmButton

    if showButtons then
        buttonContainer = Instance.new("Frame")
        buttonContainer.Name = "ButtonContainer"
        buttonContainer.Parent = content
        buttonContainer.BackgroundTransparency = 1
        buttonContainer.Size = UDim2.new(1, 0, 0, 30)
        buttonContainer.Position = UDim2.new(0, 0, 1, -30)
        buttonContainer.ZIndex = 102

        cancelButton = Instance.new("TextButton")
        cancelButton.Name = "CancelButton"
        cancelButton.Parent = buttonContainer
        cancelButton.BackgroundColor3 = colorPalette.cancelButton
        cancelButton.BorderSizePixel = 0
        cancelButton.Size = UDim2.new(0.45, 0, 1, 0)
        cancelButton.Position = UDim2.new(0, 0, 0, 0)
        cancelButton.Font = Enum.Font.Gotham
        cancelButton.Text = cancelText
        cancelButton.TextColor3 = colorPalette.text
        cancelButton.TextSize = 14
        cancelButton.ZIndex = 103
        cancelButton.AutoButtonColor = false
        cancelButton.BackgroundTransparency = 1

        local cancelCorner = Instance.new("UICorner")
        cancelCorner.CornerRadius = UDim.new(0, 4)
        cancelCorner.Parent = cancelButton

        confirmButton = Instance.new("TextButton")
        confirmButton.Name = "ConfirmButton"
        confirmButton.Parent = buttonContainer
        confirmButton.BackgroundColor3 = colorPalette.confirmButton
        confirmButton.BorderSizePixel = 0
        confirmButton.Size = UDim2.new(0.45, 0, 1, 0)
        confirmButton.Position = UDim2.new(1, -0, 0, 0)
        confirmButton.AnchorPoint = Vector2.new(1, 0)
        confirmButton.Font = Enum.Font.Gotham
        confirmButton.Text = confirmText
        confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        confirmButton.TextSize = 14
        confirmButton.ZIndex = 103
        confirmButton.AutoButtonColor = false
        confirmButton.BackgroundTransparency = 1

        local confirmCorner = Instance.new("UICorner")
        confirmCorner.CornerRadius = UDim.new(0, 4)
        confirmCorner.Parent = confirmButton
    end

    local totalHeight = showButtons and 110 or 90

    activeNotifications[notificationId] = {
        Container = mainContainer,
        PositionY = positionY
    }

    coroutine.wrap(function()
        local enterTween = TweenService:Create(
            mainContainer,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 320, 0, totalHeight)}
        )
        enterTween:Play()

        wait(0.1)

        local fadeInTweens = {
            TweenService:Create(titleLabel, TweenInfo.new(0.2), {TextTransparency = 0}),
            TweenService:Create(messageLabel, TweenInfo.new(0.2), {TextTransparency = 0.2})
        }

        for _, tween in ipairs(fadeInTweens) do
            tween:Play()
        end

        if showButtons then
            cancelButton.BackgroundTransparency = 0
            confirmButton.BackgroundTransparency = 0
        end

        local progressTween = TweenService:Create(
            progressBar,
            TweenInfo.new(duration, Enum.EasingStyle.Linear),
            {Size = UDim2.new(0, 0, 1, 0)}
        )
        progressTween:Play()

        if showButtons then
            local buttonMouseEnter = function(button, hoverColor)
                button.MouseEnter:Connect(function()
                    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
                end)
            end

            local buttonMouseLeave = function(button, originalColor)
                button.MouseLeave:Connect(function()
                    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = originalColor}):Play()
                end)
            end

            local buttonClick = function(button, callback)
                button.MouseButton1Click:Connect(function()
                    if callback then
                        pcall(callback)
                    end
                    progressTween:Cancel()
                end)
            end

            buttonMouseEnter(cancelButton, colorPalette.buttonHover)
            buttonMouseLeave(cancelButton, colorPalette.cancelButton)
            buttonClick(cancelButton, cancelCallback)

            buttonMouseEnter(confirmButton, Color3.fromRGB(0, 140, 240))
            buttonMouseLeave(confirmButton, colorPalette.confirmButton)
            buttonClick(confirmButton, confirmCallback)
        else
            wait(duration)
        end

        if not showButtons then
            local fadeOutTweens = {
                TweenService:Create(titleLabel, TweenInfo.new(0.2), {TextTransparency = 1}),
                TweenService:Create(messageLabel, TweenInfo.new(0.2), {TextTransparency = 1})
            }

            for _, tween in ipairs(fadeOutTweens) do
                tween:Play()
            end

            wait(0.2)

            local exitTween = TweenService:Create(
                mainContainer,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {Size = UDim2.new(0, 320, 0, 0)}
            )
            exitTween:Play()

            wait(0.3)
        else
            while mainContainer.Parent do
                wait(0.1)
            end
        end

        mainContainer:Destroy()
        activeNotifications[notificationId] = nil

        if callback then
            pcall(callback)
        end

        for id, notification in pairs(activeNotifications) do
            if id > notificationId then
                local newPosition = notification.PositionY - notificationSpacing
                notification.PositionY = newPosition

                TweenService:Create(
                    notification.Container,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Position = UDim2.new(0, 15, 0, newPosition)}
                ):Play()
            end
        end
    end)()
end

function Notification:Info(title, message, duration)
    return self:Notify({
        Title = title,
        Message = message,
        Duration = duration,
        ShowButtons = false
    })
end

function Notification:Success(title, message, duration)
    return self:Notify({
        Title = title,
        Message = message,
        Duration = duration,
        ShowButtons = false
    })
end

function Notification:Warning(title, message, duration)
    return self:Notify({
        Title = title,
        Message = message,
        Duration = duration,
        ShowButtons = false
    })
end

function Notification:Error(title, message, duration)
    return self:Notify({
        Title = title,
        Message = message,
        Duration = duration,
        ShowButtons = false
    })
end

function Notification:Confirm(title, message, cancelText, confirmText, cancelCallback, confirmCallback)
    return self:Notify({
        Title = title,
        Message = message,
        Duration = 30,
        ShowButtons = true,
        CancelText = cancelText,
        ConfirmText = confirmText,
        CancelCallback = cancelCallback,
        ConfirmCallback = confirmCallback
    })
end

return Notification