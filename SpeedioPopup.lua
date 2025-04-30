
-- MEGA ULTIMATE SPEEDIO POPUP SCRIPT
local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local tweenService = game:GetService("TweenService")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpeedioMessage"
screenGui.Parent = playerGui

-- Create BlurEffect
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game.Lighting

-- Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.6, 0, 0.1, 0)
frame.Position = UDim2.new(0.2, 0, -0.2, 0) -- Start above
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 4
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.BackgroundTransparency = 1
frame.Parent = screenGui

-- Rounded Corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = frame

-- Create TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
textLabel.TextStrokeTransparency = 0
textLabel.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
textLabel.TextScaled = true
textLabel.Font = Enum.Font.GothamBold
textLabel.Text = "Speedio: Make sure you're in public servers! To avoid bugs"
textLabel.TextTransparency = 1
textLabel.Parent = frame

-- Add Sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9118828560" -- cool pop sound (you can replace the ID)
sound.Volume = 2
sound.Parent = frame

-- Add ParticleEmitter
local emitter = Instance.new("ParticleEmitter")
emitter.Rate = 50
emitter.Lifetime = NumberRange.new(0.5)
emitter.Speed = NumberRange.new(5,10)
emitter.Size = NumberSequence.new(0.2)
emitter.Texture = "rbxassetid://258128463" -- spark texture
emitter.LightEmission = 1
emitter.Color = ColorSequence.new(Color3.new(1,0,0), Color3.new(1,1,0)) -- red-yellow
emitter.Enabled = false
emitter.Parent = frame

-- Function: Vibration effect
local function vibrate()
    for _ = 1, 10 do
        frame.Position = frame.Position + UDim2.new(0, math.random(-2,2), 0, math.random(-2,2))
        task.wait(0.02)
    end
    frame.Position = UDim2.new(0.2, 0, 0.1, 0)
end

-- === Fancy Slide In + Effects ===
sound:Play()
emitter.Enabled = true
for i = 1, 0, -0.05 do
    task.wait(0.02)
    frame.Position = UDim2.new(0.2, 0, 0.1 - (i * 0.3), 0)
    frame.BackgroundTransparency = i
    textLabel.TextTransparency = i
    blur.Size = blur.Size + 2
end
frame.Position = UDim2.new(0.2, 0, 0.1, 0)
blur.Size = 12
task.wait(0.2)
vibrate()
emitter.Enabled = false

-- === Stay Visible ===
task.wait(3)

-- === Slide Out ===
for i = 0, 1, 0.05 do
    task.wait(0.02)
    frame.Position = UDim2.new(0.2, 0, 0.1 - (i * 0.3), 0)
    frame.BackgroundTransparency = i
    textLabel.TextTransparency = i
    blur.Size = math.max(0, blur.Size - 2)
end

-- Cleanup
blur:Destroy()
screenGui:Destroy()
