local RedBlack = {}
RedBlack.__index = RedBlack

--// Services
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

--// Create Window
function RedBlack:CreateWindow(title)

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RedBlackUI"
    ScreenGui.Parent = game.CoreGui

    -- Main Frame
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

    -- Left Panel (Name + Tabs)
    local LeftPanel = Instance.new("Frame", Main)
    LeftPanel.Size = UDim2.new(0,150,1,-20)
    LeftPanel.Position = UDim2.new(0,10,0,10)
    LeftPanel.BackgroundTransparency = 1

    -- Name Box
    local NameBox = Instance.new("Frame", LeftPanel)
    NameBox.Size = UDim2.new(1,0,0,60)
    NameBox.BackgroundColor3 = Color3.fromRGB(40,0,0)
    NameBox.BorderColor3 = Color3.new(0,0,0)
    NameBox.BorderSizePixel = 2
    Instance.new("UICorner", NameBox).CornerRadius = UDim.new(0,20)

    local Title = Instance.new("TextLabel", NameBox)
    Title.Size = UDim2.new(1,0,1,0)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255,0,0)
    Title.Font = Enum.Font.GothamBold
    Title.TextScaled = true

    -- Tabs Holder
    local Tabs = Instance.new("Frame", LeftPanel)
    Tabs.Position = UDim2.new(0,0,0,80)
    Tabs.Size = UDim2.new(1,0,1,-80)
    Tabs.BackgroundColor3 = Color3.fromRGB(30,0,0)
    Tabs.BorderColor3 = Color3.new(0,0,0)
    Tabs.BorderSizePixel = 2
    Instance.new("UICorner", Tabs).CornerRadius = UDim.new(0,30)

    local TabLayout = Instance.new("UIListLayout", Tabs)
    TabLayout.Padding = UDim.new(0,10)

    -- Content Area
    local Content = Instance.new("Frame", Main)
    Content.Size = UDim2.new(1,-180,1,-20)
    Content.Position = UDim2.new(0,170,0,10)
    Content.BackgroundColor3 = Color3.fromRGB(15,15,15)
    Content.BorderColor3 = Color3.new(0,0,0)
    Content.BorderSizePixel = 3
    Instance.new("UICorner", Content).CornerRadius = UDim.new(0,40)

    -- 2 Columns
    local LeftColumn = Instance.new("Frame", Content)
    LeftColumn.Size = UDim2.new(0.5,-5,1,-10)
    LeftColumn.Position = UDim2.new(0,5,0,5)
    LeftColumn.BackgroundTransparency = 1

    local RightColumn = Instance.new("Frame", Content)
    RightColumn.Size = UDim2.new(0.5,-5,1,-10)
    RightColumn.Position = UDim2.new(0.5,5,0,5)
    RightColumn.BackgroundTransparency = 1

    -- Draggable
    local dragging, dragInput, dragStart, startPos

    Main.InputBegan:Connect(function(input)
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

    Main.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Return API
    local Window = {}

    function Window:AddTab(name)
        local Button = Instance.new("TextButton", Tabs)
        Button.Size = UDim2.new(1,-10,0,40)
        Button.BackgroundColor3 = Color3.fromRGB(60,0,0)
        Button.Text = name
        Button.TextColor3 = Color3.new(1,1,1)
        Button.Font = Enum.Font.Gotham
        Button.TextScaled = true
        Instance.new("UICorner", Button).CornerRadius = UDim.new(0,15)

        return {
            Left = LeftColumn,
            Right = RightColumn
        }
    end

    return Window
end

return RedBlack
