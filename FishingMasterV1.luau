--[[
    ╔══════════════════════════════════════════════════════════════╗
    ║                  ⚠️  SCRIPT ĐÃ CŨ  ⚠️                         ║
    ║                                                              ║
    ║   Phiên bản bạn đang sử dụng đã lỗi thời!                    ║
    ║   Vui lòng chọn một trong hai tùy chọn bên dưới:             ║
    ║                                                              ║
    ║   [1] BẬT SCRIPT V2 (Khuyến nghị)                            ║
    ║   [2] COPY SCRIPT V2                                         ║
    ╚══════════════════════════════════════════════════════════════╝
]]

local V2_URL = "https://raw.githubusercontent.com/KimLong-Valencia/REAL/refs/heads/main/FishingMasterV2.txt"
local LOAD_SCRIPT = 'loadstring(game:HttpGet("' .. V2_URL .. '"))()'

-- ==================== SERVICES ====================
local Players           = game:GetService("Players")
local TweenService      = game:GetService("TweenService")
local UserInputService  = game:GetService("UserInputService")
local CoreGui           = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

-- ==================== CLEAN OLD GUI ====================
local oldGui = CoreGui:FindFirstChild("OldScriptNotify")
if oldGui then oldGui:Destroy() end

-- ==================== GUI ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OldScriptNotify"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- ==================== MAIN FRAME ====================
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 420, 0, 260)
Main.Position = UDim2.new(0.5, -210, 0.5, -130)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(80, 80, 120)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.3
MainStroke.Parent = Main

-- Gradient background
local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 22)),
})
MainGradient.Rotation = 135
MainGradient.Parent = Main

-- ==================== TOP BAR ====================
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
TopBar.BackgroundTransparency = 0.2
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

local TopGradient = Instance.new("UIGradient")
TopGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 90, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 40, 120)),
})
TopGradient.Rotation = 90
TopGradient.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "⚠️  SCRIPT ĐÃ CŨ  ⚠️"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Close button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -38, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseEnter:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(255, 110, 110)}):Play()
end)
CloseBtn.MouseLeave:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(255, 70, 70)}):Play()
end)
CloseBtn.MouseButton1Click:Connect(function()
    local t = TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 1
    })
    t:Play()
    t.Completed:Connect(function() ScreenGui:Destroy() end)
end)

-- ==================== MESSAGE ====================
local Message = Instance.new("TextLabel")
Message.Size = UDim2.new(1, -30, 0, 60)
Message.Position = UDim2.new(0, 15, 0, 55)
Message.BackgroundTransparency = 1
Message.Text = "Phiên bản bạn đang dùng đã lỗi thời!\nVui lòng chọn một tùy chọn bên dưới 👇"
Message.TextColor3 = Color3.fromRGB(210, 210, 230)
Message.TextSize = 14
Message.Font = Enum.Font.Gotham
Message.TextWrapped = true
Message.TextYAlignment = Enum.TextYAlignment.Top
Message.Parent = Main

-- ==================== BUTTONS ====================
local function makeButton(text, color1, color2, yPos)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -30, 0, 48)
    Btn.Position = UDim2.new(0, 15, 0, yPos)
    Btn.BackgroundColor3 = color1
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 15
    Btn.Font = Enum.Font.GothamBold
    Btn.AutoButtonColor = false
    Btn.Parent = Main

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 10)
    BtnCorner.Parent = Btn

    local BtnGradient = Instance.new("UIGradient")
    BtnGradient.Color = ColorSequence.new(color1, color2)
    BtnGradient.Rotation = 90
    BtnGradient.Parent = Btn

    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Color = Color3.fromRGB(255, 255, 255)
    BtnStroke.Transparency = 0.8
    BtnStroke.Thickness = 1
    BtnStroke.Parent = Btn

    Btn.MouseEnter:Connect(function()
        TweenService:Create(Btn, TweenInfo.new(0.15), {Size = UDim2.new(1, -22, 0, 48)}):Play()
    end)
    Btn.MouseLeave:Connect(function()
        TweenService:Create(Btn, TweenInfo.new(0.15), {Size = UDim2.new(1, -30, 0, 48)}):Play()
    end)

    return Btn
end

-- Button 1: BẬT SCRIPT V2
local Btn1 = makeButton("🚀  BẬT SCRIPT V2", Color3.fromRGB(0, 170, 120), Color3.fromRGB(0, 120, 200), 125)

-- Button 2: COPY SCRIPT V2
local Btn2 = makeButton("📋  COPY SCRIPT V2", Color3.fromRGB(150, 70, 220), Color3.fromRGB(220, 60, 140), 185)

-- ==================== STATUS LABEL ====================
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -30, 0, 20)
Status.Position = UDim2.new(0, 15, 1, -25)
Status.BackgroundTransparency = 1
Status.Text = ""
Status.TextColor3 = Color3.fromRGB(120, 255, 180)
Status.TextSize = 12
Status.Font = Enum.Font.GothamMedium
Status.TextXAlignment = Enum.TextXAlignment.Center
Status.Parent = Main

-- ==================== FUNCTIONS ====================
local function setStatus(text, color)
    Status.Text = text
    Status.TextColor3 = color or Color3.fromRGB(120, 255, 180)
end

-- BẬT SCRIPT V2
Btn1.MouseButton1Click:Connect(function()
    setStatus("⏳ Đang tải Script V2...", Color3.fromRGB(255, 220, 100))
    task.wait(0.3)

    local success, err = pcall(function()
        loadstring(game:HttpGet(V2_URL))()
    end)

    if success then
        setStatus("✅ Đã bật Script V2!", Color3.fromRGB(120, 255, 180))
        task.wait(1)
        ScreenGui:Destroy()
    else
        setStatus("❌ Lỗi: " .. tostring(err), Color3.fromRGB(255, 100, 100))
    end
end)

-- COPY SCRIPT V2
Btn2.MouseButton1Click:Connect(function()
    local success = pcall(function()
        if setclipboard then
            setclipboard(LOAD_SCRIPT)
        elseif toclipboard then
            toclipboard(LOAD_SCRIPT)
        else
            error("Không hỗ trợ clipboard")
        end
    end)

    if success then
        setStatus("📋 Đã copy Script V2 vào clipboard!", Color3.fromRGB(150, 200, 255))
        Btn2.Text = "✅  ĐÃ COPY!"
        task.wait(1.5)
        Btn2.Text = "📋  COPY SCRIPT V2"
    else
        setStatus("❌ Không thể copy. Hãy copy thủ công bên dưới.", Color3.fromRGB(255, 100, 100))
        warn("=== SCRIPT V2 ===")
        warn(LOAD_SCRIPT)
    end
end)

-- ==================== DRAG ====================
local dragging, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- ==================== OPEN ANIMATION ====================
Main.Size = UDim2.new(0, 0, 0, 0)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 420, 0, 260),
    Position = UDim2.new(0.5, -210, 0.5, -130)
}):Play()

-- Pulsing stroke glow
task.spawn(function()
    while Main.Parent do
        TweenService:Create(MainStroke, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.6}):Play()
        task.wait(1)
        TweenService:Create(MainStroke, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.2}):Play()
        task.wait(1)
    end
end)
