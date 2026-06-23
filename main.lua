-- Создаем графический интерфейс
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MegaTroll"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false -- Чтобы надпись оставалась даже после смерти персонажа

-- Создаем текстовое поле на весь экран
local textLabel = Instance.new("TextLabel")
textLabel.Parent = screenGui
textLabel.Size = UDim2.new(1, 0, 1, 0) -- Растягиваем на 100% ширины и высоты
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Черный фон
textLabel.BackgroundTransparency = 0.3 -- Слегка прозрачный, чтобы было обиднее смотреть на игру
textLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Ярко-красный текст
textLabel.TextScaled = true -- Текст автоматически становится огромным
textLabel.Font = Enum.Font.Creepster -- Прикольный жутковатый шрифт
textLabel.Text = "NIGGERS NIGGA NIGGA \nNIGGA NIGGA! 🤡\nМамку ебал, аххха"
textLabel.ZIndex = 9999 -- Накладываем поверх вообще всех остальных окон в игре

