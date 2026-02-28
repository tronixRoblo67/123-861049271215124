--// REDBLACK UI LIB (FULL SCRIPT)

local RedBlack = {}

local UIS = game:GetService("UserInputService")

function RedBlack:CreateWindow(title)

    -- ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RedBlackUI"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ResetOnSpawn = false

    -- Main
    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UDim2.new(0, 750, 0, 420)
    Main.Position = UDim2.new(0.5, -375, 0.5, -210)
    Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
    Main.BorderSizePixel = 3
    Main.BorderColor3 = Color3.new(0,0,0)

    Instance.new("UICorner", Main).CornerRadius = UDim.new(0,40)

    -- Gradient
    local Grad = Instance.new("UIGradient", Main)
    Grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(120,0,0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))
    })
    Grad.Rotation = 90

    -- Left Panel
    local LeftPanel = Instance.new("Frame", Main)
    LeftPanel.Size = UDim2.new(0,150,1,-20)
    LeftPanel.Position = UDim2.new(0,10,0,10)
    LeftPanel.BackgroundTransparency = 1

    -- NameBox (ДРАГ ТОЛЬКО ЗДЕСЬ)
    local NameBox = Instance.new("Frame", LeftPanel)
    NameBox.Size = UDim2.new(1,0,0,60)
    NameBox.BackgroundColor3 = Color3.fromRGB(40,0,0)
    NameBox.BorderSizePixel = 2
    NameBox.BorderColor3 = Color3.new(0,0,0)
    Instance.new("UICorner", NameBox).CornerRadius = UDim.new(0,20)

    local Title = Instance.new("TextLabel", NameBox)
    Title.Size = UDim2.new(1,0,1,0)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255,0,0)
    Title.Font = Enum.Font.GothamBold
    Title.TextScaled = true

    -- DRAG SYSTEM (ТОЛЬКО NameBox)
    local dragging = false
    local dragStart
    local startPos

    NameBox.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Tabs Holder (БЕЗ ФОНА)
    local Tabs = Instance.new("Frame", LeftPanel)
    Tabs.Position = UDim2.new(0,0,0,80)
    Tabs.Size = UDim2.new(1,0,1,-80)
    Tabs.BackgroundTransparency = 1
    Tabs.BorderSizePixel = 0

    local TabLayout = Instance.new("UIListLayout", Tabs)
    TabLayout.Padding = UDim.new(0,10)
    TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    TabLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Content Area
    local Content = Instance.new("Frame", Main)
    Content.Size = UDim2.new(1,-180,1,-20)
    Content.Position = UDim2.new(0,170,0,10)
    Content.BackgroundColor3 = Color3.fromRGB(15,15,15)
    Content.BorderSizePixel = 3
    Content.BorderColor3 = Color3.new(0,0,0)
    Instance.new("UICorner", Content).CornerRadius = UDim.new(0,40)

    -- Columns
    local LeftColumn = Instance.new("Frame", Content)
    LeftColumn.Size = UDim2.new(0.5,-5,1,-10)
    LeftColumn.Position = UDim2.new(0,5,0,5)
    LeftColumn.BackgroundTransparency = 1

    local RightColumn = Instance.new("Frame", Content)
    RightColumn.Size = UDim2.new(0.5,-5,1,-10)
    RightColumn.Position = UDim2.new(0.5,5,0,5)
    RightColumn.BackgroundTransparency = 1

    -- Column Layouts
    local LeftLayout = Instance.new("UIListLayout", LeftColumn)
    LeftLayout.Padding = UDim.new(0,10)

    local RightLayout = Instance.new("UIListLayout", RightColumn)
    RightLayout.Padding = UDim.new(0,10)

    -- API
    local Window = {}

    function Window:AddTab(name)
        local Button = Instance.new("TextButton", Tabs)
        Button.Size = UDim2.new(0.9,0,0,40)
        Button.BackgroundColor3 = Color3.fromRGB(60,0,0)
        Button.Text = name
        Button.TextColor3 = Color3.new(1,1,1)
        Button.Font = Enum.Font.Gotham
        Button.TextScaled = true
        Button.BorderSizePixel = 0
        Instance.new("UICorner", Button).CornerRadius = UDim.new(0,15)

        return {
            Left = LeftColumn,
            Right = RightColumn
        }
    end

    return Window
end

--// EXAMPLE USAGE

local Window = RedBlack:CreateWindow("RedBlack Hub")
local MainTab = Window:AddTab("Main")

-- Button example
local Btn = Instance.new("TextButton", MainTab.Left)
Btn.Size = UDim2.new(1,-10,0,40)
Btn.BackgroundColor3 = Color3.fromRGB(80,0,0)
Btn.Text = "Print Hello"
Btn.TextColor3 = Color3.new(1,1,1)
Btn.Font = Enum.Font.Gotham
Btn.TextScaled = true
Btn.BorderSizePixel = 0
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,15)

Btn.MouseButton1Click:Connect(function()
    print("Hello 🔥")
end)
