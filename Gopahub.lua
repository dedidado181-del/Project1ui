-- Скрипт загрузочного экрана GopaHub
-- Вставить в LocalScript внутри StarterGui

-- Создаём GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Фон
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(20, 0, 40) -- Тёмно-фиолетовый
background.Parent = screenGui

-- Заголовок
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.15, 0)
title.Position = UDim2.new(0, 0, 0.1, 0)
title.BackgroundTransparency = 1
title.Text = "GopaHub"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(200, 100, 255)
title.Parent = background

-- Прогресс-бар рамка
local barFrame = Instance.new("Frame")
barFrame.Size = UDim2.new(0.6, 0, 0.05, 0)
barFrame.Position = UDim2.new(0.2, 0, 0.5, 0)
barFrame.BackgroundColor3 = Color3.fromRGB(60, 0, 100)
barFrame.BorderSizePixel = 0
barFrame.Parent = background

-- Заполняющая часть
local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(200, 100, 255)
progressBar.BorderSizePixel = 0
progressBar.Parent = barFrame

-- Текст прогресса
local progressText = Instance.new("TextLabel")
progressText.Size = UDim2.new(1, 0, 1.5, 0)
progressText.Position = UDim2.new(0, 0, 1.2, 0)
progressText.BackgroundTransparency = 1
progressText.Text = "Loading... 0%"
progressText.TextScaled = true
progressText.Font = Enum.Font.Gotham
progressText.TextColor3 = Color3.fromRGB(200, 100, 255)
progressText.Parent = barFrame

-- Настройка времени загрузки
local totalTime = 240 -- 4 минуты
local stepTime = totalTime / 100 -- время на каждый процент

-- Анимация
for i = 1, 100 do
	progressBar.Size = UDim2.new(i/100, 0, 1, 0)
	progressText.Text = "Loading... " .. i .. "%"
	wait(stepTime)
end

-- После загрузки убираем экран
screenGui:Destroy()
