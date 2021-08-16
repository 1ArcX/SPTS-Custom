local Library = {}

local mouse = game.Players.LocalPlayer:GetMouse()
local uis = game:GetService("UserInputService")

function Library:CreateWindow(name)
	local X = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local Tabs = Instance.new("Frame")
	local Name = Instance.new("TextLabel")
	local Keybind = Instance.new("TextLabel")
	local UIGridLayout = Instance.new("UIGridLayout")

	X.Name = "X"
	X.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	X.DisplayOrder = 1
	X.ResetOnSpawn = false

	Frame.Parent = X
	Frame.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
	Frame.Position = UDim2.new(0.8317518, 0, 0, 0)
	Frame.Size = UDim2.new(0.168248081, 0, 1, 0)
	Frame.ZIndex = 101

	Tabs.Name = "Tabs"
	Tabs.Parent = Frame
	Tabs.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Tabs.Position = UDim2.new(0.652485609, 0, 0.167752445, 0)
	Tabs.Size = UDim2.new(0.347513855, 0, 0.657980442, 0)
	Tabs.ZIndex = 102

	Name.Name = "Name"
	Name.Parent = X
	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.Position = UDim2.new(0.844525552, 0, 0.0293159597, 0)
	Name.Size = UDim2.new(0.139051148, 0, 0.0960912034, 0)
	Name.Font = Enum.Font.SourceSansBold
	Name.TextColor3 = Color3.fromRGB(255, 76, 79)
	Name.TextScaled = true
	Name.TextSize = 14.000
	Name.TextStrokeTransparency = 0.000
	Name.TextWrapped = true
	Name.Text = name
	Name.ZIndex = 101

	Keybind.Name = "Keybind"
	Keybind.Parent = X
	Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Keybind.BackgroundTransparency = 1.000
	Keybind.Position = UDim2.new(0.84543798, 0, 0.877850175, 0)
	Keybind.Size = UDim2.new(0.139051148, 0, 0.0960912034, 0)
	Keybind.Font = Enum.Font.SourceSansBold
	Keybind.Text = "Press Right Control to toggle Ui"
	Keybind.TextColor3 = Color3.fromRGB(255, 76, 79)
	Keybind.TextScaled = true
	Keybind.TextSize = 14.000
	Keybind.TextStrokeTransparency = 0.000
	Keybind.TextWrapped = true
	Keybind.ZIndex = 101

	UIGridLayout.Parent = Tabs
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0.0500000007, 0)
	UIGridLayout.CellSize = UDim2.new(1, 0, 0.100000001, 0)


	game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
		if input.KeyCode == Enum.KeyCode.RightControl and not isTyping then
			X.Enabled = not X.Enabled
		end
	end)

	local XLibrary = {}

	function XLibrary:NewTab(TabName)
		local Selected = false

		local Tab = Instance.new("TextButton")
		local ScrollingFrame = Instance.new("ScrollingFrame")
		local UIGridLayout2 = Instance.new("UIGridLayout")
		local TextLabel = Instance.new("TextLabel")

		Tab.Name = TabName
		Tab.Parent = Tabs
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.Size = UDim2.new(1, 0, 0.100000001, 0)
		Tab.Font = Enum.Font.SourceSansBold
		Tab.Text = TabName
		Tab.TextColor3 = Color3.fromRGB(255,255,255)
		Tab.TextScaled = true
		Tab.TextSize = 14.000
		Tab.TextWrapped = true
		Tab.ZIndex = 103

		ScrollingFrame.Parent = Frame
		ScrollingFrame.Active = true
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Position = UDim2.new(0, 0, 0.166123807, 0)
		ScrollingFrame.Size = UDim2.new(0.652485311, 0, 0.659609079, 0)
		ScrollingFrame.ScrollBarThickness = 10
		ScrollingFrame.Name = TabName
		ScrollingFrame.Visible = false
		ScrollingFrame.ZIndex = 102

		UIGridLayout2.Parent = ScrollingFrame
		UIGridLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout2.CellPadding = UDim2.new(0, 0, 0.00999999978, 0)
		UIGridLayout2.CellSize = UDim2.new(0.899999976, 0, 0.0299999993, 0)

		TextLabel.Parent = ScrollingFrame
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(0.900000036, 0, 0.0909629688, 0)
		TextLabel.Font = Enum.Font.SourceSansBold
		TextLabel.Text = TabName
		TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextStrokeTransparency = 0.000
		TextLabel.TextWrapped = true
		TextLabel.ZIndex = 103

		Tab.MouseButton1Click:Connect(function()
			for i,v in pairs(Frame:GetChildren()) do
				if v.ClassName == "ScrollingFrame" then
					if v.Name ~= TabName then
						v.Visible = false
					else
						v.Visible = true
					end
				end
			end
		end)

		local Elements = {}

		function Elements:NewButton(bname, callback)
			callback = callback or function() end

			local TextButton = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")
			local Shadow = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local TextButtonText = Instance.new("TextLabel")

			TextButton.Parent = ScrollingFrame
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 75, 78)
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(0, 180, 0, 45)
			TextButton.ZIndex = 2
			TextButton.Font = Enum.Font.GothamSemibold
			TextButton.Text = ""
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextScaled = true
			TextButton.TextSize = 14.000
			TextButton.TextWrapped = true
			TextButton.Name = bname
			TextButton.ZIndex = 104

			UICorner.Parent = TextButton

			Shadow.Name = "Shadow"
			Shadow.Parent = TextButton
			Shadow.BackgroundColor3 = Color3.fromRGB(112, 33, 34)
			Shadow.BorderSizePixel = 0
			Shadow.Size = UDim2.new(1, 0, 1, 4)
			Shadow.ZIndex = 103

			UICorner_2.Parent = Shadow

			TextButtonText.Name = bname .." text"
			TextButtonText.Parent = TextButton
			TextButtonText.AnchorPoint = Vector2.new(0.5, 0.5)
			TextButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButtonText.BackgroundTransparency = 1.000
			TextButtonText.BorderColor3 = Color3.fromRGB(27, 42, 53)
			TextButtonText.BorderSizePixel = 0
			TextButtonText.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextButtonText.Size = UDim2.new(1, -20, 1, -20)
			TextButtonText.ZIndex = 2
			TextButtonText.Font = Enum.Font.GothamSemibold
			TextButtonText.Text = bname
			TextButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButtonText.TextScaled = true
			TextButtonText.TextSize = 14.000
			TextButtonText.TextWrapped = true
			TextButtonText.ZIndex = 105

			TextButton.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
		end

			function Elements:NewToggle(tname, callback)
				callback = callback or function() end
				local Enabled = false
				local switchactions = {}

				local Toggle = Instance.new("ImageLabel")
				local TText = Instance.new("TextLabel")
				local TButton = Instance.new("TextButton")

				Toggle.Name = tname
				Toggle.Parent = ScrollingFrame
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BackgroundTransparency = 1.000
				Toggle.Position = UDim2.new(0.109489053, 0, 0.381107479, 0)
				Toggle.Size = UDim2.new(0.420620441, 0, 0.0798045695, 0)
				Toggle.Image = "rbxassetid://3570695787"
				Toggle.ImageTransparency = 1.000
				Toggle.ScaleType = Enum.ScaleType.Slice
				Toggle.SliceCenter = Rect.new(100, 100, 100, 100)
				Toggle.SliceScale = 0.120
				Toggle.ZIndex = 103

				TText.Name = tname .." text"
				TText.Parent = Toggle
				TText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TText.BackgroundTransparency = 1.000
				TText.Position = UDim2.new(0, 0, 0.224489346, 0)
				TText.Size = UDim2.new(0.614621103, 0, 0.571428716, 0)
				TText.Font = Enum.Font.SourceSans
				TText.Text = tname
				TText.TextColor3 = Color3.fromRGB(255, 255, 255)
				TText.TextScaled = true
				TText.TextSize = 14.000
				TText.TextWrapped = true
				TText.ZIndex = 104

				TButton.Name = "TButton"
				TButton.Parent = Toggle
				TButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				TButton.BorderSizePixel = 0
				TButton.Position = UDim2.new(0.68105942, 0, 0.224489346, 0)
				TButton.Size = UDim2.new(0.31894061, 0, 0.571428955, 0)
				TButton.Font = Enum.Font.SourceSans
				TButton.Text = "DISABLED"
				TButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TButton.TextSize = 14.000
				TButton.ZIndex = 104

				local function Trigger()
					Enabled = not Enabled
					TButton.Text = Enabled and "ENABLED" or "DISABLED"
					if Enabled then
						TButton.BackgroundColor3 = Color3.fromRGB(255, 75, 78)
					else
						TButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					end
					pcall(callback, Enabled)
				end

				TButton.MouseButton1Click:Connect(Trigger)

				function switchactions:Set(state)
					TButton.Text = Enabled and "ENABLED" or "DISABLED"
					if Enabled then
						TButton.BackgroundColor3 = Color3.fromRGB(255, 75, 78)
					else
						TButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					end
					pcall(callback, Enabled)
				end
				return switchactions
			end

				function Elements:NewTextBox(tbname, callback)
					callback = callback or function() end

					local TextBox = Instance.new("ImageLabel")
					local TBText = Instance.new("TextLabel")
					local TextBox_2 = Instance.new("TextBox")

					TextBox.Name = tbname
					TextBox.Parent = ScrollingFrame
					TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextBox.BackgroundTransparency = 1.000
					TextBox.Position = UDim2.new(0.109489053, 0, 0.381107479, 0)
					TextBox.Size = UDim2.new(0.420620441, 0, 0.0798045695, 0)
					TextBox.Image = "rbxassetid://3570695787"
					TextBox.ImageTransparency = 1.000
					TextBox.ScaleType = Enum.ScaleType.Slice
					TextBox.SliceCenter = Rect.new(100, 100, 100, 100)
					TextBox.SliceScale = 0.120
					TextBox.ZIndex = 103

					TBText.Name = tbname .."text"
					TBText.Parent = TextBox
					TBText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TBText.BackgroundTransparency = 1.000
					TBText.Position = UDim2.new(0, 0, 0.224489346, 0)
					TBText.Size = UDim2.new(0.614621103, 0, 0.571428716, 0)
					TBText.Font = Enum.Font.SourceSans
					TBText.Text = tbname
					TBText.TextColor3 = Color3.fromRGB(255, 255, 255)
					TBText.TextScaled = true
					TBText.TextSize = 14.000
					TBText.TextWrapped = true
					TBText.ZIndex = 104

					TextBox_2.Parent = TextBox
					TextBox_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					TextBox_2.Position = UDim2.new(0.680999994, 0, 0.224000007, 0)
					TextBox_2.Size = UDim2.new(0.319000006, 0, 0.57099998, 0)
					TextBox_2.Font = Enum.Font.SourceSans
					TextBox_2.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextBox_2.TextScaled = true
					TextBox_2.TextSize = 14.000
					TextBox_2.TextWrapped = true
					TextBox_2.ZIndex = 104

					TextBox_2.FocusLost:Connect(function(ep)
						if ep then
							if #TextBox_2.Text > 0 then
								pcall(callback, TextBox_2.Text)
							end
						end
					end)
				end

					function Elements:NewSlider(sname, min, max, callback)
						callback = callback or function() end
						local Value;

						local Slider = Instance.new("ImageLabel")
						local SText = Instance.new("TextLabel")
						local IText = Instance.new("TextLabel")
						local SButton = Instance.new("TextButton")
						local TextButton_Roundify_12px = Instance.new("ImageLabel")
						local Slider_2 = Instance.new("ImageLabel")

						Slider.Name = sname
						Slider.Parent = ScrollingFrame
						Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Slider.BackgroundTransparency = 1.000
						Slider.Position = UDim2.new(0.109489053, 0, 0.381107479, 0)
						Slider.Size = UDim2.new(0.420620441, 0, 0.0798045695, 0)
						Slider.Image = "rbxassetid://3570695787"
						Slider.ImageTransparency = 1.000
						Slider.ScaleType = Enum.ScaleType.Slice
						Slider.SliceCenter = Rect.new(100, 100, 100, 100)
						Slider.SliceScale = 0.120
						Slider.ZIndex = 103

						SText.Name = sname .."text"
						SText.Parent = Slider
						SText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						SText.BackgroundTransparency = 1.000
						SText.Position = UDim2.new(0, 0, 0.224489346, 0)
						SText.Size = UDim2.new(0.614621103, 0, 0.571428716, 0)
						SText.Font = Enum.Font.SourceSans
						SText.Text = sname
						SText.TextColor3 = Color3.fromRGB(255, 255, 255)
						SText.TextScaled = true
						SText.TextSize = 14.000
						SText.TextWrapped = true
						SText.ZIndex = 104

						IText.Name = "IText"
						IText.Parent = Slider
						IText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						IText.BackgroundTransparency = 1.000
						IText.Position = UDim2.new(0.679978192, 0, -0.318399251, 0)
						IText.Size = UDim2.new(0.292799562, 0, 0.517139912, 0)
						IText.Font = Enum.Font.SourceSans
						IText.Text = min .."/".. max
						IText.TextColor3 = Color3.fromRGB(255, 255, 255)
						IText.TextScaled = true
						IText.TextSize = 14.000
						IText.TextWrapped = true
						IText.ZIndex = 104

						SButton.Name = "SButton"
						SButton.Parent = Slider
						SButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						SButton.BackgroundTransparency = 1.000
						SButton.BorderSizePixel = 0
						SButton.Position = UDim2.new(0.680999994, 0, 0.333000004, 0)
						SButton.Size = UDim2.new(0.319000006, 0, 0.354000002, 0)
						SButton.Font = Enum.Font.SourceSans
						SButton.Text = ""
						SButton.TextColor3 = Color3.fromRGB(0, 0, 0)
						SButton.TextSize = 14.000
						SButton.ZIndex = 104

						TextButton_Roundify_12px.Name = "TextButton_Roundify_12px"
						TextButton_Roundify_12px.Parent = SButton
						TextButton_Roundify_12px.Active = true
						TextButton_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
						TextButton_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextButton_Roundify_12px.BackgroundTransparency = 1.000
						TextButton_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
						TextButton_Roundify_12px.Selectable = true
						TextButton_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
						TextButton_Roundify_12px.Image = "rbxassetid://3570695787"
						TextButton_Roundify_12px.ImageColor3 = Color3.fromRGB(0, 0, 0)
						TextButton_Roundify_12px.ScaleType = Enum.ScaleType.Slice
						TextButton_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
						TextButton_Roundify_12px.SliceScale = 0.120
						TextButton_Roundify_12px.SliceScale.ZIndex = 105

						Slider_2.Name = "Slider"
						Slider_2.Parent = SButton
						Slider_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
						Slider_2.BackgroundTransparency = 1.000
						Slider_2.Size = UDim2.new(-0.0160849895, 1, 1, 1)
						Slider_2.Image = "rbxassetid://3570695787"
						Slider_2.ImageColor3 = Color3.fromRGB(255, 75, 78)
						Slider_2.ScaleType = Enum.ScaleType.Slice
						Slider_2.SliceCenter = Rect.new(100, 100, 100, 100)
						Slider_2.SliceScale = 0.120
						Slider_2.ZIndex = 105

						SButton.MouseButton1Down:Connect(function()
							Value = math.floor((((tonumber(max) - tonumber(min)) / 60) * Slider_2.AbsoluteSize.X) + tonumber(min)) or 0
							pcall(function()
								callback(Value)
							end)
							Slider_2.Size = UDim2.new(0, math.clamp(mouse.X - Slider_2.AbsolutePosition.X, 0, 60), 0, 16)
							moveconnection = mouse.Move:Connect(function()
								IText.Text = Value .."/".. max
								Value = math.floor((((tonumber(max) - tonumber(min)) / 60) * Slider_2.AbsoluteSize.X) + tonumber(min))
								pcall(function()
									callback(Value)
								end)
								Slider_2.Size = UDim2.new(0, math.clamp(mouse.X - Slider_2.AbsolutePosition.X, 0, 60), 0, 16)
							end)
							releaseconnection = uis.InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									Value = math.floor((((tonumber(max) - tonumber(min)) / 60) * Slider_2.AbsoluteSize.X) + tonumber(min))
									pcall(function()
										callback(Value)
									end)
									Slider_2.Size = UDim2.new(0, math.clamp(mouse.X - Slider_2.AbsolutePosition.X, 0, 60), 0, 16)
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
					end


						function Elements:NewDropdown(dname, list, callback)
							list = list or {}
							callback = callback or function() end
							local IsDropped = false

							local Dropdown = Instance.new("ImageLabel")
							local DText = Instance.new("TextLabel")
							local DButton = Instance.new("TextButton")
							local DropdownFrame = Instance.new("Frame")
							local DropdownScrollingFrame = Instance.new("ScrollingFrame")
							local UIGridLayout3 = Instance.new("UIGridLayout")

							Dropdown.Name = dname
							Dropdown.Parent = ScrollingFrame
							Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							Dropdown.BackgroundTransparency = 1.000
							Dropdown.Position = UDim2.new(0.109489053, 0, 0.381107479, 0)
							Dropdown.Size = UDim2.new(0.899999917, 0, 0.0909629688, 0)
							Dropdown.Image = "rbxassetid://3570695787"
							Dropdown.ImageTransparency = 1.000
							Dropdown.ScaleType = Enum.ScaleType.Slice
							Dropdown.SliceCenter = Rect.new(100, 100, 100, 100)
							Dropdown.SliceScale = 0.120
							Dropdown.ZIndex = 103

							DText.Name = dname .."text"
							DText.Parent = Dropdown
							DText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							DText.BackgroundTransparency = 1.000
							DText.Position = UDim2.new(0, 0, 0.224489346, 0)
							DText.Size = UDim2.new(0.614621103, 0, 0.571428716, 0)
							DText.Font = Enum.Font.SourceSans
							DText.Text = dname
							DText.TextColor3 = Color3.fromRGB(255, 255, 255)
							DText.TextScaled = true
							DText.TextSize = 14.000
							DText.TextWrapped = true
							DText.ZIndex = 104

							DButton.Name = "DButton"
							DButton.Parent = Dropdown
							DButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
							DButton.BorderSizePixel = 0
							DButton.Position = UDim2.new(0.68105942, 0, 0.224489346, 0)
							DButton.Size = UDim2.new(0.31894061, 0, 0.571428955, 0)
							DButton.Font = Enum.Font.SourceSans
							DButton.Text = "+"
							DButton.TextColor3 = Color3.fromRGB(255, 255, 255)
							DButton.TextSize = 14.000
							DButton.ZIndex = 104

							DropdownFrame.Name = "DropdownFrame"
							DropdownFrame.Parent = Dropdown
							DropdownFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
							DropdownFrame.ClipsDescendants = true
							DropdownFrame.Position = UDim2.new(0.681059778, 0, 0.794032753, 0)
							DropdownFrame.Size = UDim2.new(0.319000006, 0, 0.00188539631, 0)
							DropdownFrame.ZIndex = 109

							DropdownScrollingFrame.Name = "DropdownScrollingFrame"
							DropdownScrollingFrame.Parent = DropdownFrame
							DropdownScrollingFrame.Active = true
							DropdownScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							DropdownScrollingFrame.BackgroundTransparency = 1.000
							DropdownScrollingFrame.Size = UDim2.new(1, 1, 1, 1)
							DropdownScrollingFrame.ScrollBarThickness = 0
							DropdownScrollingFrame.ZIndex = 109

							UIGridLayout3.Parent = DropdownScrollingFrame
							UIGridLayout3.SortOrder = Enum.SortOrder.LayoutOrder
							UIGridLayout3.CellPadding = UDim2.new(0, 0, 0.00999999978, 0)
							UIGridLayout3.CellSize = UDim2.new(1, 0, 0.150000006, 0)

							DButton.MouseButton1Click:Connect(function()
								if IsDropped then
									IsDropped = false
									DropdownFrame.Size = UDim2.new(0.319000006, 0, 0.00188539631, 0)
								else
									IsDropped = true
									DropdownFrame.Size = UDim2.new(0.319, 0,2.119, 0)
								end
							end)

							for i,v in next, list do
								local DropdownButton = Instance.new("TextButton")

								DropdownButton.Name = "DropdownButton"
								DropdownButton.Parent = DropdownScrollingFrame
								DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								DropdownButton.BackgroundTransparency = 0.800
								DropdownButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
								DropdownButton.Size = UDim2.new(0, 200, 0, 50)
								DropdownButton.Font = Enum.Font.SourceSans
								DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
								DropdownButton.TextScaled = true
								DropdownButton.TextSize = 14.000
								DropdownButton.TextWrapped = true
								DropdownButton.Text = v
								DropdownButton.ZIndex = 110

								DropdownButton.MouseButton1Click:Connect(function()
									DButton.Text = v
									callback(v)
									IsDropped = false
									DropdownFrame.Size = UDim2.new(0.319000006, 0, 0.00188539631, 0)
								end)
							end

							local DropFunction = {}

							function DropFunction:Refresh(newlist)
								newlist = newlist or {}

								for i,v in next, DropdownScrollingFrame:GetChildren() do
									if v.Name == "DropdownButton" then
										v:Destroy()
									end
								end
								for i,v in next, newlist do 
									local DropdownButton = Instance.new("TextButton")

									DropdownButton.Name = "DropdownButton"
									DropdownButton.Parent = DropdownScrollingFrame
									DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
									DropdownButton.BackgroundTransparency = 0.800
									DropdownButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
									DropdownButton.Size = UDim2.new(0, 200, 0, 50)
									DropdownButton.Font = Enum.Font.SourceSans
									DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
									DropdownButton.TextScaled = true
									DropdownButton.TextSize = 14.000
									DropdownButton.TextWrapped = true
									DropdownButton.Text = v
									DropdownButton.ZIndex = 110

									DropdownButton.MouseButton1Click:Connect(function()
										DButton.Text = v
										callback(v)
										IsDropped = false
										DropdownFrame.Size = UDim2.new(0.319000006, 0, 0.00188539631, 0)
									end)
								end
								return DropFunction
							end
						end
							return Elements
						end
						return XLibrary
					end

----------------------------------------------------------------