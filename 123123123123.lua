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

    local Corner0 = Instance.new("UICorner")
    Corner0.CornerRadius = UDim.new(0, 20)
    Corner0.Parent = Window

    -- TITLE
    local title = Instance.new("Frame")
    title.Name = "title"
    title.Size = UDim2.new(0.234, 0, 0.166, 0)
    title.Position = UDim2.new(0, 0, 0.018, 0)
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 0.3
    title.Parent = Window

    local Stroke0 = Instance.new("UIStroke")
    Stroke0.Color = Color3.fromRGB(255, 255, 255)
    Stroke0.Thickness = 1.5
    Stroke0.Parent = title

    local Corner1 = Instance.new("UICorner")
    Corner1.CornerRadius = UDim.new(0, 8)
    Corner1.Parent = title

    local TitleText = Instance.new("TextLabel")
    TitleText.Name = "title"
    TitleText.Text = "LightVisuals"
    TitleText.Size = UDim2.new(0, 145, 0, 40)
    TitleText.Position = UDim2.new(-0.007, 0, 0, 0)
    TitleText.TextColor3 = Color3.fromRGB(0, 0, 0)
    TitleText.BackgroundTransparency = 1
    TitleText.TextScaled = true
    TitleText.Font = Enum.Font.GothamBold
    TitleText.Parent = title

    local VersionText = Instance.new("TextLabel")
    VersionText.Name = "version"
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

    local Stroke1 = Instance.new("UIStroke")
    Stroke1.Color = Color3.fromRGB(255, 255, 255)
    Stroke1.Thickness = 1.5
    Stroke1.Parent = Tabs

    local Corner2 = Instance.new("UICorner")
    Corner2.CornerRadius = UDim.new(0, 8)
    Corner2.Parent = Tabs

    local TabsHolder = Instance.new("Frame")
    TabsHolder.Name = "TabsHolder"
    TabsHolder.Size = UDim2.new(0.938, 0, 0.965, 0)
    TabsHolder.Position = UDim2.new(0.029, 0, 0.017, 0)
    TabsHolder.BackgroundTransparency = 1
    TabsHolder.Parent = Tabs

    local List = Instance.new("UIListLayout")
    List.Padding = UDim.new(0, 5)
    List.Parent = TabsHolder

    -- CONTENT CONTAINER
    local TabConteiner = Instance.new("Frame")
    TabConteiner.Name = "TabConteiner"
    TabConteiner.Size = UDim2.new(0.732, 0, 0.955, 0)
    TabConteiner.Position = UDim2.new(0.244, 0, 0.018, 0)
    TabConteiner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabConteiner.BackgroundTransparency = 0.3
    TabConteiner.Parent = Window

    local Corner3 = Instance.new("UICorner")
    Corner3.CornerRadius = UDim.new(0, 8)
    Corner3.Parent = TabConteiner

    local Stroke2 = Instance.new("UIStroke")
    Stroke2.Color = Color3.fromRGB(255, 255, 255)
    Stroke2.Thickness = 1.5
    Stroke2.Parent = TabConteiner

    local WindowFunctions = {}

    function WindowFunctions:CreateTab(name)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0.158, 0)
        TabButton.Text = name
        TabButton.TextScaled = true
        TabButton.BackgroundTransparency = 1
        TabButton.TextColor3 = Color3.fromRGB(0,0,0)
        TabButton.Font = Enum.Font.GothamBold
        TabButton.Parent = TabsHolder

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

        function TabFunctions:CreateButton(text, callback)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0,150,0,40)
            Button.Text = text
            Button.TextScaled = true
            Button.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Button.BackgroundTransparency = 0.3
            Button.TextColor3 = Color3.fromRGB(0,0,0)
            Button.Font = Enum.Font.GothamBold
            Button.Parent = Page

            local c = Instance.new("UICorner")
            c.CornerRadius = UDim.new(0,8)
            c.Parent = Button

            Button.MouseButton1Click:Connect(function()
                if callback then
                    callback()
                end
            end)
        end

        return TabFunctions
    end

    return WindowFunctions
end

return Library
