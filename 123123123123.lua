local Library = {}

function Library:CreateWindow()

    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UiOwner"
    ScreenGui.Parent = player:WaitForChild("PlayerGui")

    local Window = Instance.new("Frame")
    Window.Size = UDim2.new(0.74, 0, 0.674, 0)
    Window.AnchorPoint = Vector2.new(0.5, 0.5)
    Window.Position = UDim2.new(0.5, 0, 0.5, 0)
    Window.BackgroundTransparency = 1
    Window.Parent = ScreenGui

    local WC = Instance.new("UICorner")
    WC.CornerRadius = UDim.new(0, 20)
    WC.Parent = Window

    -- TITLE
    local title = Instance.new("Frame")
    title.Name = "title"
    title.Size = UDim2.new(0.234, 0, 0.166, 0)
    title.Position = UDim2.new(0, 0, 0.018, 0)
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 0.3
    title.Parent = Window

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(255, 255, 255)
    Stroke.Thickness = 1.5
    Stroke.Parent = title

    local TC = Instance.new("UICorner")
    TC.CornerRadius = UDim.new(0, 8)
    TC.Parent = title

    local TitleText = Instance.new("TextLabel")
    TitleText.Text = "LightVisuals"
    TitleText.Size = UDim2.new(0, 145, 0, 40)
    TitleText.Position = UDim2.new(-0.007, 0, 0, 0)
    TitleText.TextColor3 = Color3.fromRGB(0, 0, 0)
    TitleText.BackgroundTransparency = 1
    TitleText.TextScaled = true
    TitleText.Font = Enum.Font.GothamBold
    TitleText.Parent = title

    local VersionText = Instance.new("TextLabel")
    VersionText.Text = "v0.0.1"
    VersionText.Size = UDim2.new(0, 146, 0, 37)
    VersionText.Position = UDim2.new(-0.007, 0, 0.519, 0)
    VersionText.TextColor3 = Color3.fromRGB(0, 0, 0)
    VersionText.BackgroundTransparency = 1
    VersionText.TextScaled = true
    VersionText.Font = Enum.Font.GothamBold
    VersionText.Parent = title

    -- TABS PANEL
    local Tabs = Instance.new("Frame")
    Tabs.Name = "Tabs"
    Tabs.Size = UDim2.new(0.234, 0, 0.774, 0)
    Tabs.Position = UDim2.new(0, 0, 0.199, 0)
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 0.3
    Tabs.Parent = Window

    local Stroke2 = Instance.new("UIStroke")
    Stroke2.Color = Color3.fromRGB(255, 255, 255)
    Stroke2.Thickness = 1.5
    Stroke2.Parent = Tabs

    local TC2 = Instance.new("UICorner")
    TC2.CornerRadius = UDim.new(0, 8)
    TC2.Parent = Tabs

    local TabsHolder = Instance.new("Frame")
    TabsHolder.Name = "TabsHolder"
    TabsHolder.Size = UDim2.new(0.938, 0, 0.965, 0)
    TabsHolder.Position = UDim2.new(0.029, 0, 0.017, 0)
    TabsHolder.BackgroundTransparency = 1
    TabsHolder.Parent = Tabs

    local UIList = Instance.new("UIListLayout")
    UIList.Padding = UDim.new(0, 0.02)
    UIList.Parent = TabsHolder

    -- CONTENT
    local TabConteiner = Instance.new("Frame")
    TabConteiner.Name = "TabConteiner"
    TabConteiner.Size = UDim2.new(0.732, 0, 0.955, 0)
    TabConteiner.Position = UDim2.new(0.244, 0, 0.018, 0)
    TabConteiner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabConteiner.BackgroundTransparency = 0.3
    TabConteiner.Parent = Window

    local TC3 = Instance.new("UICorner")
    TC3.CornerRadius = UDim.new(0, 8)
    TC3.Parent = TabConteiner

    local Stroke3 = Instance.new("UIStroke")
    Stroke3.Color = Color3.fromRGB(255, 255, 255)
    Stroke3.Thickness = 1.5
    Stroke3.Parent = TabConteiner

    local WindowFunctions = {}

    function WindowFunctions:CreateTab(name)

        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0.158, 0)
        TabButton.BackgroundColor3 = Color3.fromRGB(255,255,255) -- БЕЛЫЙ ФОН
        TabButton.BackgroundTransparency = 0.3
        TabButton.Text = name
        TabButton.TextScaled = true
        TabButton.TextColor3 = Color3.fromRGB(0,0,0)
        TabButton.Font = Enum.Font.GothamBold
        TabButton.Parent = TabsHolder

        local CornerBtn = Instance.new("UICorner")
        CornerBtn.CornerRadius = UDim.new(0,8)
        CornerBtn.Parent = TabButton

        local Page = Instance.new("Frame")
        Page.Size = UDim2.new(1,0,1,0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.Parent = TabConteiner

        TabButton.MouseButton1Click:Connect(function()
            for _,v in pairs(TabConteiner:GetChildren()) do
                if v:IsA("Frame") then
                    v.Visible = false
                end
            end
            Page.Visible = true
        end)

        local TabFunctions = {}
        return TabFunctions
    end

    return WindowFunctions
end

return Library
