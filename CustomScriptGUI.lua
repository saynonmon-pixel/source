-- Custom Script GUI
-- Place this LocalScript inside StarterGui

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "CustomScriptGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(620, 390)
main.Position = UDim2.new(0.5, -310, 0.5, -195)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local top = Instance.new("Frame")
top.Size = UDim2.new(1, 0, 0, 45)
top.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
top.BorderSizePixel = 0
top.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.fromOffset(15, 0)
title.BackgroundTransparency = 1
title.Text = "  Script Hub"
title.TextColor3 = Color3.fromRGB(240, 240, 245)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = top

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(40, 35)
minimize.Position = UDim2.new(1, -85, 0, 5)
minimize.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
minimize.Text = "—"
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.TextSize = 20
minimize.Font = Enum.Font.GothamBold
minimize.Parent = top

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 8)
minCorner.Parent = minimize

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(40, 35)
close.Position = UDim2.new(1, -45, 0, 5)
close.BackgroundColor3 = Color3.fromRGB(55, 35, 40)
close.Text = "×"
close.TextColor3 = Color3.fromRGB(255, 120, 120)
close.TextSize = 22
close.Font = Enum.Font.GothamBold
close.Parent = top

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = close

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.fromOffset(145, 345)
sidebar.Position = UDim2.fromOffset(0, 45)
sidebar.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
sidebar.BorderSizePixel = 0
sidebar.Parent = main

local scriptsTitle = Instance.new("TextLabel")
scriptsTitle.Size = UDim2.new(1, -20, 0, 35)
scriptsTitle.Position = UDim2.fromOffset(10, 10)
scriptsTitle.BackgroundTransparency = 1
scriptsTitle.Text = "MY SCRIPTS"
scriptsTitle.TextColor3 = Color3.fromRGB(150, 150, 160)
scriptsTitle.TextSize = 11
scriptsTitle.Font = Enum.Font.GothamBold
scriptsTitle.TextXAlignment = Enum.TextXAlignment.Left
scriptsTitle.Parent = sidebar

local function createTab(text, y)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, -20, 0, 40)
	button.Position = UDim2.fromOffset(10, y)
	button.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
	button.Text = text
	button.TextColor3 = Color3.fromRGB(220, 220, 225)
	button.TextSize = 13
	button.Font = Enum.Font.Gotham
	button.Parent = sidebar

	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 7)
	c.Parent = button
	return button
end

local tab1 = createTab("Script 1", 50)
local tab2 = createTab("Script 2", 98)
local tab3 = createTab("Script 3", 146)

local editor = Instance.new("TextBox")
editor.Size = UDim2.new(1, -170, 1, -115)
editor.Position = UDim2.fromOffset(160, 60)
editor.BackgroundColor3 = Color3.fromRGB(15, 15, 19)
editor.TextColor3 = Color3.fromRGB(220, 220, 225)
editor.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
editor.PlaceholderText = "-- Write your Luau code here..."
editor.Text = '-- Script 1\n\nprint("Hello from Script Hub!")'
editor.TextSize = 14
editor.Font = Enum.Font.Code
editor.TextXAlignment = Enum.TextXAlignment.Left
editor.TextYAlignment = Enum.TextYAlignment.Top
editor.MultiLine = true
editor.ClearTextOnFocus = false
editor.TextWrapped = false
editor.Parent = main

local editorCorner = Instance.new("UICorner")
editorCorner.CornerRadius = UDim.new(0, 8)
editorCorner.Parent = editor

local run = Instance.new("TextButton")
run.Size = UDim2.fromOffset(110, 38)
run.Position = UDim2.new(1, -245, 1, -50)
run.BackgroundColor3 = Color3.fromRGB(45, 125, 75)
run.Text = "RUN"
run.TextColor3 = Color3.new(1, 1, 1)
run.TextSize = 14
run.Font = Enum.Font.GothamBold
run.Parent = main

local runCorner = Instance.new("UICorner")
runCorner.CornerRadius = UDim.new(0, 8)
runCorner.Parent = run

local clear = Instance.new("TextButton")
clear.Size = UDim2.fromOffset(110, 38)
clear.Position = UDim2.new(1, -125, 1, -50)
clear.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
clear.Text = "CLEAR"
clear.TextColor3 = Color3.new(1, 1, 1)
clear.TextSize = 14
clear.Font = Enum.Font.GothamBold
clear.Parent = main

local clearCorner = Instance.new("UICorner")
clearCorner.CornerRadius = UDim.new(0, 8)
clearCorner.Parent = clear

local scripts = {
	[1] = '-- Script 1\n\nprint("Hello from Script 1!")',
	[2] = '-- Script 2\n\nprint("Hello from Script 2!")',
	[3] = '-- Script 3\n\nprint("Hello from Script 3!")'
}

local currentScript = 1

local function selectScript(number)
	scripts[currentScript] = editor.Text
	currentScript = number
	editor.Text = scripts[number]
end

tab1.MouseButton1Click:Connect(function() selectScript(1) end)
tab2.MouseButton1Click:Connect(function() selectScript(2) end)
tab3.MouseButton1Click:Connect(function() selectScript(3) end)

clear.MouseButton1Click:Connect(function()
	editor.Text = ""
end)

run.MouseButton1Click:Connect(function()
	scripts[currentScript] = editor.Text
	print("Running Script " .. currentScript)
	print(editor.Text)
end)

local minimized = false

minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	sidebar.Visible = not minimized
	editor.Visible = not minimized
	run.Visible = not minimized
	clear.Visible = not minimized

	if minimized then
		main.Size = UDim2.fromOffset(620, 45)
		minimize.Text = "+"
	else
		main.Size = UDim2.fromOffset(620, 390)
		minimize.Text = "—"
	end
end)

close.MouseButton1Click:Connect(function()
	gui.Enabled = false
end)

local dragging = false
local dragStart
local startPos

top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)
