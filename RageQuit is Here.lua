-- Базовые Значения При Инжекте
local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")

-- Отображается справа нотифи о том, что чiт заинжекчен
game.StarterGui:SetCore("SendNotification", { 
    Title = "Anal Destroyer",
    Text = "Injected successfully",
    Duration = 3
})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local SoundService = game:GetService("SoundService")

local gui = Instance.new("ScreenGui")
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- звук при инжекте
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://7405939280" -- ID звука
sound.Volume = 5 -- Громкость
sound.Parent = gui

sound:Play()
task.delay(5, function()
    gui:Destroy()
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local function HighlightPlayers()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local highlight = char:FindFirstChild("ESP_Highlight") or Instance.new("Highlight")
            highlight.Name = "ESP_Highlight"
            highlight.FillColor = player.Team == LocalPlayer.Team and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
            highlight.OutlineColor = Color3.new(1, 1, 1)
            highlight.Parent = char
        end
    end
end

RunService.Heartbeat:Connect(HighlightPlayers)
-- [FUNCTION] Jump : T бинд
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Сила прыжка
local jumpForce = 35

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.T then
		humanoidRootPart.Velocity = Vector3.new(0, jumpForce, 0)
	end
end)

-- [FUNCTION] Dash на 15метров(базовое значение) : F бинд
local Player = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

local COOLDOWN = 0
local canDash = true

local function dash()
    if not canDash or not RootPart or Humanoid.Health <= 0 then return end
    canDash = false
    
    local Camera = workspace.CurrentCamera
    local LookVector = Camera.CFrame.LookVector * Vector3.new(1, 0, 1).Unit
    
    RootPart.Velocity = Vector3.new(0, 0, 0)
    RootPart.CFrame = RootPart.CFrame + LookVector * 15 -- ЧЕЛ СИЛА ЭМ МЕТРЫ ДЭШ
    
    for i = 1, 10 do
        RootPart.CFrame = RootPart.CFrame + LookVector * 0.1
        task.wait(0.01)
    end
    
    task.wait(COOLDOWN)
    canDash = true
end

UIS.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.F and not gameProcessed then
        dash()
    end
end)
-- [FUNCTION] FOV Changer : V бинд
local Player = game:GetService("Players").LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

local DesiredFOV = 200

if Camera then
    Camera.FieldOfView = DesiredFOV
end

RunService.RenderStepped:Connect(function()
    if Camera and Camera.FieldOfView ~= DesiredFOV then
        Camera.FieldOfView = DesiredFOV
    end
end)

-- ORIGINAL MADED BY:
-- [DeadByRoblox Destroyer, WATCH OUT BRO] Sanyog Saken Kok
-- [Anal Expander, OH NO SHE IS RIGHT THERE] GlebASS 

-- CREATED AT: [15.04.2025]
-- LAST UPDATED: [16.04.2025]
-- VERSION: dbrd-gang.cheat:AnalDestroyer>>1.1.0