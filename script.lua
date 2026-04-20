--[[
    ██████╗ ██████╗  █████╗  ██████╗  ██████╗ ███╗   ██╗
    ██╔══██╗██╔══██╗██╔══██╗██╔════╝ ██╔═══██╗████╗  ██║
    ██║  ██║██████╔╝███████║██║  ███╗██║   ██║██╔██╗ ██║
    ██║  ██║██╔══██╗██╔══██║██║   ██║██║   ██║██║╚██╗██║
    ██████╔╝██║  ██║██║  ██║╚██████╔╝╚██████╔╝██║ ╚████║
    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝
    
    DRAGON HUB - BROOKHAVEN PREMIUM
    Version: 5.0.0 | Build: 2026
    Features: Money, Cars, Houses, Admin, Aimbot, ESP, Fly, Speed, TP
--]]

-- Servisleri tanımla
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

-- [[ GUI OLUŞTURMA ]]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DragonHub_Brookhaven"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Ana Pencere
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -400, 0.5, -300)
MainFrame.Size = UDim2.new(0, 800, 0, 600)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

-- Gradient Arkaplan
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 15, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 20))
})
Gradient.Parent = MainFrame

-- Başlık Çubuğu
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(25, 20, 40)
TopBar.Size = UDim2.new(1, 0, 0, 55)
TopBar.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 16)
TopCorner.Parent = TopBar

-- Dragon Logo ve Başlık
local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 20, 0, 0)
Title.Size = UDim2.new(0, 250, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "🐉 DRAGON HUB | BROOKHAVEN"
Title.TextColor3 = Color3.fromRGB(255, 80, 120)
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Version
local VerLabel = Instance.new("TextLabel")
VerLabel.Parent = TopBar
VerLabel.BackgroundTransparency = 1
VerLabel.Position = UDim2.new(0, 20, 0, 35)
VerLabel.Size = UDim2.new(0, 200, 0, 15)
VerLabel.Font = Enum.Font.Gotham
VerLabel.Text = "v5.0.0 | Premium"
VerLabel.TextColor3 = Color3.fromRGB(150, 150, 170)
VerLabel.TextSize = 11
VerLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Kapatma Butonu
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -50, 0, 0)
CloseBtn.Size = UDim2.new(0, 50, 1, 0)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.TextSize = 22

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Küçült Butonu
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TopBar
MinBtn.BackgroundTransparency = 1
MinBtn.Position = UDim2.new(1, -100, 0, 0)
MinBtn.Size = UDim2.new(0, 50, 1, 0)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 28

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 800, 0, 55), "Out", "Quad", 0.3)
    else
        MainFrame:TweenSize(UDim2.new(0, 800, 0, 600), "Out", "Quad", 0.3)
    end
end)

-- Sekme Butonları Konteynırı
local TabContainer = Instance.new("Frame")
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = Color3.fromRGB(15, 12, 25)
TabContainer.Position = UDim2.new(0, 0, 0, 55)
TabContainer.Size = UDim2.new(0, 180, 1, -55)

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 12)
TabCorner.Parent = TabContainer

-- İçerik Konteynırı
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 190, 0, 65)
ContentFrame.Size = UDim2.new(1, -200, 1, -75)

-- Sekme Sistemi
local Tabs = {}
local CurrentTab = nil

local function CreateTab(name, icon, color)
    local btn = Instance.new("TextButton")
    btn.Parent = TabContainer
    btn.BackgroundColor3 = Color3.fromRGB(25, 20, 38)
    btn.BackgroundTransparency = 0.5
    btn.BorderSizePixel = 0
    btn.Position = UDim2.new(0, 10, 0, 10 + (#Tabs * 50))
    btn.Size = UDim2.new(1, -20, 0, 45)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = icon .. "  " .. name
    btn.TextColor3 = Color3.fromRGB(200, 200, 220)
    btn.TextSize = 14
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn
    
    local content = Instance.new("ScrollingFrame")
    content.Parent = ContentFrame
    content.BackgroundTransparency = 1
    content.Size = UDim2.new(1, 0, 1, 0)
    content.CanvasSize = UDim2.new(0, 0, 0, 0)
    content.ScrollBarThickness = 6
    content.ScrollBarImageColor3 = Color3.fromRGB(255, 80, 120)
    content.Visible = false
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = content
    layout.Padding = UDim.new(0, 12)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        content.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)
    
    btn.MouseButton1Click:Connect(function()
        for _, tab in pairs(Tabs) do
            tab.Button.BackgroundTransparency = 0.5
            tab.Button.TextColor3 = Color3.fromRGB(200, 200, 220)
            tab.Content.Visible = false
        end
        btn.BackgroundTransparency = 0
        btn.TextColor3 = Color3.fromRGB(255, 80, 120)
        content.Visible = true
        CurrentTab = name
    end)
    
    table.insert(Tabs, {Button = btn, Content = content, Name = name})
    return content
end

-- Yardımcı Fonksiyonlar
local function CreateSection(parent, title, icon)
    local section = Instance.new("Frame")
    section.Parent = parent
    section.BackgroundColor3 = Color3.fromRGB(20, 18, 32)
    section.BackgroundTransparency = 0.2
    section.Size = UDim2.new(1, -20, 0, 0)
    section.AutomaticSize = Enum.AutomaticSize.Y
    
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 12)
    sectionCorner.Parent = section
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = section
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 15, 0, 10)
    titleLabel.Size = UDim2.new(1, -30, 0, 25)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = icon .. "  " .. title
    titleLabel.TextColor3 = Color3.fromRGB(255, 80, 120)
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local line = Instance.new("Frame")
    line.Parent = section
    line.BackgroundColor3 = Color3.fromRGB(255, 80, 120)
    line.BorderSizePixel = 0
    line.Position = UDim2.new(0, 15, 0, 40)
    line.Size = UDim2.new(1, -30, 0, 2)
    
    return section, titleLabel
end

local function CreateButton(parent, text, callback, yOffset)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.BackgroundColor3 = Color3.fromRGB(30, 28, 45)
    btn.BorderSizePixel = 0
    btn.Position = UDim2.new(0, 15, 0, yOffset or 0)
    btn.Size = UDim2.new(1, -30, 0, 40)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function CreateToggle(parent, text, default, callback, yOffset)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.BackgroundColor3 = Color3.fromRGB(30, 28, 45)
    frame.BorderSizePixel = 0
    frame.Position = UDim2.new(0, 15, 0, yOffset or 0)
    frame.Size = UDim2.new(1, -30, 0, 40)
    
    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 8)
    frameCorner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 15, 0, 0)
    label.Size = UDim2.new(0, 200, 1, 0)
    label.Font = Enum.Font.Gotham
    label.Text = text
    label.TextColor3 = Color3.fromRGB(220, 220, 240)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Parent = frame
    toggleBtn.BackgroundColor3 = default and Color3.fromRGB(80, 40, 60) or Color3.fromRGB(40, 38, 55)
    toggleBtn.Position = UDim2.new(1, -60, 0, 5)
    toggleBtn.Size = UDim2.new(0, 50, 0, 30)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.Text = default and "ON" or "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.TextSize = 12
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 6)
    toggleCorner.Parent = toggleBtn
    
    local state = default
    
    toggleBtn.MouseButton1Click:Connect(function()
        state = not state
        toggleBtn.BackgroundColor3 = state and Color3.fromRGB(80, 40, 60) or Color3.fromRGB(40, 38, 55)
        toggleBtn.Text = state and "ON" or "OFF"
        callback(state)
    end)
    
    return toggleBtn, frame
end

local function CreateSlider(parent, text, min, max, default, callback, yOffset)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.BackgroundColor3 = Color3.fromRGB(30, 28, 45)
    frame.BorderSizePixel = 0
    frame.Position = UDim2.new(0, 15, 0, yOffset or 0)
    frame.Size = UDim2.new(1, -30, 0, 70)
    
    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 8)
    frameCorner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 15, 0, 10)
    label.Size = UDim2.new(0, 200, 0, 20)
    label.Font = Enum.Font.Gotham
    label.Text = text .. ": " .. tostring(default)
    label.TextColor3 = Color3.fromRGB(220, 220, 240)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local sliderBar = Instance.new("Frame")
    sliderBar.Parent = frame
    sliderBar.BackgroundColor3 = Color3.fromRGB(50, 48, 65)
    sliderBar.BorderSizePixel = 0
    sliderBar.Position = UDim2.new(0, 15, 0, 40)
    sliderBar.Size = UDim2.new(1, -30, 0, 6)
    
    local sliderBarCorner = Instance.new("UICorner")
    sliderBarCorner.CornerRadius = UDim.new(0, 3)
    sliderBarCorner.Parent = sliderBar
    
    local fill = Instance.new("Frame")
    fill.Parent = sliderBar
    fill.BackgroundColor3 = Color3.fromRGB(255, 80, 120)
    fill.BorderSizePixel = 0
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 3)
    fillCorner.Parent = fill
    
    local knob = Instance.new("TextButton")
    knob.Parent = frame
    knob.BackgroundColor3 = Color3.fromRGB(255, 80, 120)
    knob.BorderSizePixel = 0
    knob.Position = UDim2.new((default - min) / (max - min), -10, 0, 34)
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Text = ""
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local value = default
    
    local function updateSlider(input)
        local pos = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
        value = min + (max - min) * pos
        value = math.floor(value * 100) / 100
        label.Text = text .. ": " .. tostring(value)
        fill.Size = UDim2.new(pos, 0, 1, 0)
        knob.Position = UDim2.new(pos, -10, 0, 34)
        callback(value)
    end
    
    knob.MouseButton1Down:Connect(function()
        local connection
        connection = UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                updateSlider(input)
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                connection:Disconnect()
            end
        end)
    end)
    
    return frame
end

-- ============================ --
--        ANA SEKMELER          --
-- ============================ --

-- 1. MONEY SEKMESI
local MoneyTab = CreateTab("MONEY", "💰")

local MoneySection, _ = CreateSection(MoneyTab, "PARA HİLELERİ", "💰")

-- Money Glitch Butonu
CreateButton(MoneySection, "💸 10,000 PARA EKLE (GLITCH)", function()
    for i = 1, 10 do
        local args = {
            [1] = "AddMoney",
            [2] = 1000
        }
        game:GetService("ReplicatedStorage"):FindFirstChild("Events"):FireServer(unpack(args))
        task.wait(0.05)
    end
    print("Dragon Hub: 10,000 para eklendi!")
end, 55)

-- Infinite Money
local infiniteMoney = false
CreateToggle(MoneySection, "♾️ SINIRSIZ PARA (OTOMATİK)", false, function(state)
    infiniteMoney = state
    if state then
        spawn(function()
            while infiniteMoney do
                local args = { [1] = "AddMoney", [2] = 500 }
                game:GetService("ReplicatedStorage"):FindFirstChild("Events"):FireServer(unpack(args))
                task.wait(0.3)
            end
        end)
    end
end, 110)

-- Duplicate Item
CreateButton(MoneySection, "🔄 EŞYA DUBLİKASYONU", function()
    local args = { [1] = "DuplicateItem", [2] = "Diamond" }
    game:GetService("ReplicatedStorage"):FindFirstChild("Events"):FireServer(unpack(args))
    print("Dragon Hub: Eşya kopyalandı!")
end, 165)

-- Sell All Items
CreateButton(MoneySection, "🏪 TÜM EŞYALARI SAT", function()
    local args = { [1] = "SellAllItems" }
    game:GetService("ReplicatedStorage"):FindFirstChild("Events"):FireServer(unpack(args))
    print("Dragon Hub: Tüm eşyalar satıldı!")
end, 220)

-- 2. MOBILITY SEKMESI
local MobilityTab = CreateTab("MOBILITY", "🏃")

local FlySection, _ = CreateSection(MobilityTab, "UÇMA & HIZ", "🚀")

-- Fly Toggle
local flying = false
local flySpeed = 50
local bodyVelocity = nil

CreateToggle(FlySection, "🕊️ UÇMA MODU", false, function(state)
    flying = state
    if flying then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.Parent = char.HumanoidRootPart
            
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = true
            end
            
            spawn(function()
                while flying and bodyVelocity do
                    local moveDirection = Vector3.new(0, 0, 0)
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + Vector3.new(0, 0, -flySpeed) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection + Vector3.new(0, 0, flySpeed) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection + Vector3.new(-flySpeed, 0, 0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + Vector3.new(flySpeed, 0, 0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDirection = moveDirection + Vector3.new(0, flySpeed, 0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDirection = moveDirection + Vector3.new(0, -flySpeed, 0) end
                    
                    bodyVelocity.Velocity = char.HumanoidRootPart.CFrame:VectorToWorldSpace(moveDirection)
                    task.wait()
                end
            end)
        end
    else
        if bodyVelocity then bodyVelocity:Destroy() end
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.PlatformStand = false
        end
    end
end, 55)

-- Speed Slider
local speedValue = 16
CreateSlider(FlySection, "YÜRÜME HIZI", 16, 250, 16, function(value)
    speedValue = value
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = value
    end
end, 110)

-- Jump Power Slider
local jumpValue = 50
CreateSlider(FlySection, "ZIPLAMA GÜCÜ", 50, 300, 50, function(value)
    jumpValue = value
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = value
    end
end, 195)

-- Noclip Toggle
local noclipEnabled = false
CreateToggle(FlySection, "🎮 NOCLIP (Duvarlardan Geç)", false, function(state)
    noclipEnabled = state
    if state then
        spawn(function()
            while noclipEnabled do
                task.wait(0.1)
                local char = LocalPlayer.Character
                if char then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end
        end)
    else
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end, 280)

-- 3. CAR SEKMESI
local CarTab = CreateTab("CARS", "🚗")

local CarSection, _ = CreateSection(CarTab, "ARAÇ HİLELERİ", "🏎️")

-- Spawn Car
local cars = {
    "Lamborghini", "Ferrari", "Tesla", "Bugatti", 
    "PoliceCar", "Ambulance", "FireTruck", "Motorcycle"
}

CreateButton(CarSection, "🏎️ SÜPER ARABA ÇAĞIR", function()
    local args = { [1] = "SpawnVehicle", [2] = "Lamborghini" }
    game:GetService("ReplicatedStorage"):FindFirstChild("Events"):FireServer(unpack(args))
    print("Dragon Hub: Lamborghini çağrıldı!")
end, 55)

CreateButton(CarSection, "🚓 POLİS ARABASI ÇAĞIR", function()
    local args = { [1] = "SpawnVehicle", [2] = "PoliceCar" }
    game:GetService("ReplicatedStorage"):FindFirstChild("Events"):FireServer(unpack(args))
end, 110)

CreateButton(CarSection, "🏍️ MOTOSİKLET ÇAĞIR", function()
    local args = { [1] = "SpawnVehicle", [2] = "Motorcycle" }
    game:GetService("ReplicatedStorage"):FindFirstChild("Events"):FireServer(unpack(args))
end, 165)

-- Car Speed Boost
local carBoost = false
CreateToggle(CarSection, "💨 ARABA HIZ PATLATMA (BOOST)", false, function(state)
    carBoost = state
    if state then
        spawn(function()
            while carBoost do
                task.wait(0.05)
                local vehicle = LocalPlayer.Character and LocalPlayer.Character:
