local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("GuiService")
game:GetService("RunService")
local v_u_3 = game:GetService("StarterGui")
local v_u_4
if workspace:GetAttribute("IsDungeonInstance") == nil then
	v_u_4 = workspace:GetAttributeChangedSignal("IsDungeonInstance"):Wait()
	if v_u_4 then
		v_u_4 = workspace:GetAttribute("IsDungeonInstance")
	end
else
	v_u_4 = workspace:GetAttribute("IsDungeonInstance")
end
task.spawn(function()
	-- upvalues: (copy) v_u_4
	game.Players.LocalPlayer:WaitForChild("PlayerGui")
	local v_u_5 = script.Parent
	task.spawn(function()
		-- upvalues: (ref) v_u_4, (copy) v_u_5
		local function v7(p_u_6)
			p_u_6.Visible = false
			p_u_6.Changed:Connect(function()
				-- upvalues: (copy) p_u_6
				if p_u_6.Visible == true then
					p_u_6.Visible = false
				end
			end)
		end
		if v_u_4 then
			local v_u_8 = v_u_5.ShopButton
			v_u_8.Visible = false
			v_u_8.Changed:Connect(function()
				-- upvalues: (copy) v_u_8
				if v_u_8.Visible == true then
					v_u_8.Visible = false
				end
			end)
			local v_u_9 = v_u_5.StatsButton
			v_u_9.Visible = false
			v_u_9.Changed:Connect(function()
				-- upvalues: (copy) v_u_9
				if v_u_9.Visible == true then
					v_u_9.Visible = false
				end
			end)
			local v_u_10 = v_u_5.InventoryButton
			v_u_10.Visible = false
			v_u_10.Changed:Connect(function()
				-- upvalues: (copy) v_u_10
				if v_u_10.Visible == true then
					v_u_10.Visible = false
				end
			end)
			local v_u_11 = v_u_5.MenuButton
			v_u_11.Visible = false
			v_u_11.Changed:Connect(function()
				-- upvalues: (copy) v_u_11
				if v_u_11.Visible == true then
					v_u_11.Visible = false
				end
			end)
			local v_u_12 = v_u_5.HUDButtonBar.HomeButton
			v_u_12.Visible = false
			v_u_12.Changed:Connect(function()
				-- upvalues: (copy) v_u_12
				if v_u_12.Visible == true then
					v_u_12.Visible = false
				end
			end)
			local v_u_13 = v_u_5.HUDButtonBar.ProfileButton
			v_u_13.Visible = false
			v_u_13.Changed:Connect(function()
				-- upvalues: (copy) v_u_13
				if v_u_13.Visible == true then
					v_u_13.Visible = false
				end
			end)
			local v_u_14 = v_u_5.HUDButtonBar.CrewButton
			v_u_14.Visible = false
			v_u_14.Changed:Connect(function()
				-- upvalues: (copy) v_u_14
				if v_u_14.Visible == true then
					v_u_14.Visible = false
				end
			end)
			local v_u_15 = v_u_5.HUDButtonBar.AlliesButton
			v_u_15.Visible = false
			v_u_15.Changed:Connect(function()
				-- upvalues: (copy) v_u_15
				if v_u_15.Visible == true then
					v_u_15.Visible = false
				end
			end)
			local v_u_16 = v_u_5.Level.FriendBoost
			v_u_16.Visible = false
			v_u_16.Changed:Connect(function()
				-- upvalues: (copy) v_u_16
				if v_u_16.Visible == true then
					v_u_16.Visible = false
				end
			end)
			task.spawn(v7, v_u_5:WaitForChild("Compass"))
		end
	end)
end)
local v_u_17 = require(game.ReplicatedStorage.Util.Realm)
local v_u_18 = require(game.ReplicatedStorage.BuildUtil)
local v_u_19 = require(game.ReplicatedStorage.Modules.LastInput)
local v_u_20 = require(game.ReplicatedStorage.ItemConfig)
local v_u_21 = require(game.ReplicatedStorage.Modules.Flags)
local v_u_22 = require(game.ReplicatedStorage.ShopService)
while not v_u_22:GetIfInitialized() do
	print("waiting for ShopService")
	task.wait()
end
local v_u_23 = require(game.ReplicatedStorage.PriceService)
while not v_u_23:GetIfInitialized() do
	print("waiting for PriceService")
	task.wait()
end
local v24 = require(game.ReplicatedStorage.SaleService)
while not v24:GetIfInitialized() do
	print("waiting for SaleService")
	task.wait()
end
local v25 = require(game.ReplicatedStorage.React.Services.HookService)
while not v25:GetIfInitialized() do
	print("waiting for HookService")
	task.wait()
end
local v26 = game.ReplicatedStorage.Modules.Asset
local v_u_27 = require(v26.GetFeaturedFruits)
local v_u_28 = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ReportActivity")
local v_u_29 = require(game.ReplicatedStorage:WaitForChild("JobsReplicated"))
local v_u_30 = require(game.ReplicatedStorage.Util.AnalyticsUtil)
local v_u_31 = v_u_17.getCurrentRealmDifficultyAsync() == 1
local v_u_32 = require(game.ReplicatedStorage.Controllers.UI.BundleMenu)
local v_u_33 = require(game.ReplicatedStorage.Controllers.UI.EventShop)
local v_u_34 = false
local v_u_35 = nil
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v_u_40 = workspace.CurrentCamera
local v_u_41 = v_u_40.CFrame
task.defer(function()
	-- upvalues: (ref) v_u_41
	local v_u_42 = nil
	v_u_42 = game.Players.LocalPlayer.ChildAdded:Connect(function(p_u_43)
		-- upvalues: (ref) v_u_42, (ref) v_u_41
		if p_u_43.Name == "NextSpawn" then
			v_u_42:Disconnect()
			p_u_43.Changed:Connect(function()
				-- upvalues: (copy) p_u_43, (ref) v_u_41
				if p_u_43.Value ~= CFrame.identity then
					v_u_41 = p_u_43.Value
				end
			end)
		end
	end)
end)
local v_u_44 = false
local function v_u_46(_)
	-- upvalues: (copy) v_u_40, (ref) v_u_44, (ref) v_u_41
	local v45 = v_u_40.CameraSubject
	if v45 and (v45:IsA("Humanoid") and not v45.RootPart) then
		v_u_44 = true
		while not v45.RootPart do
			v_u_40.CameraType = "Scriptable"
			v_u_40.CFrame = v_u_41
			task.wait()
			if v_u_40.CameraSubject ~= v45 then
				v_u_44 = false
				return
			end
		end
		v_u_44 = false
		v_u_40.CameraType = Enum.CameraType.Custom
	end
end
v_u_40:GetPropertyChangedSignal("CameraType"):Connect(function()
	-- upvalues: (copy) v_u_46
	v_u_46("CameraType")
end)
v_u_40:GetPropertyChangedSignal("CameraSubject"):Connect(function()
	-- upvalues: (copy) v_u_46
	v_u_46("CameraSubject")
end)
if v_u_31 then
	spawn(function()
		-- upvalues: (copy) v_u_3
		repeat
			local v47 = pcall(function()
				-- upvalues: (ref) v_u_3
				v_u_3:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
			end)
			task.wait()
		until v47
	end)
end
task.spawn(function()
	-- upvalues: (copy) v_u_3
	repeat
		local v48 = pcall(function()
			-- upvalues: (ref) v_u_3
			v_u_3:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
		end)
		task.wait()
	until v48
end)
if workspace:GetAttribute("LEVEL_CAP") == nil then
	workspace:GetAttributeChangedSignal("LEVEL_CAP"):Wait()
end
local v_u_49 = workspace:GetAttribute("LEVEL_CAP")
local v_u_50 = game.Players.LocalPlayer
local v_u_51 = v_u_50:WaitForChild("PlayerGui")
local v_u_52 = nil
local v_u_53 = script.Parent
task.spawn(function()
	-- upvalues: (copy) v_u_51
	local v54 = v_u_51:WaitForChild("LoadingScreen", 99)
	if v54 then
		v54:Destroy()
	end
end)
local v_u_55 = v_u_53:WaitForChild("AwakeningToggler")
local v_u_56 = v_u_53:WaitForChild("Titles")
local v_u_57 = v_u_53:WaitForChild("Colors")
local v_u_58 = v_u_53:WaitForChild("Allies")
local v_u_59 = v_u_51:WaitForChild("HUDNoInset"):WaitForChild("MobileRage")
local v_u_60 = game.ReplicatedStorage:WaitForChild("Remotes")
local v61 = v_u_60:WaitForChild("QuestUpdate")
require(game.ReplicatedStorage:WaitForChild("Quests"))
local v_u_62 = require(game.ReplicatedStorage:WaitForChild("Notification"))
local v_u_63 = require(game.ReplicatedStorage:WaitForChild("GamepadConversion"))
local v64 = require(game.ReplicatedStorage:WaitForChild("DamageCounter"))
local v_u_65 = require(game.ReplicatedStorage:WaitForChild("GuideModule"))
local v_u_66 = require(game.ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("UI"):WaitForChild("Inventory"))
v_u_66.init()
local v_u_67 = require(game.ReplicatedStorage.Controllers.UI.FruitShop)
v_u_67.init()
local v_u_68 = require(script.Skins)
task.spawn(v_u_68.Start)
task.spawn(function()
	-- upvalues: (copy) v_u_32
	v_u_32.init()
end)
task.spawn(function()
	-- upvalues: (copy) v_u_33
	v_u_33.init()
end)
local v_u_69
if game.ReplicatedStorage.Controllers.UI:FindFirstChild("ConsumablesWindow") then
	v_u_69 = require(game.ReplicatedStorage.Controllers.UI:FindFirstChild("ConsumablesWindow"))
else
	v_u_69 = nil
end
require(script.DragonClassic)
local v_u_70 = require(game.ReplicatedStorage:WaitForChild("Controllers").UI.GiftWindow)
local v_u_71 = require(game.ReplicatedStorage:WaitForChild("Controllers").UI.GiftClaimWindow)
require(script.Enchant)
local v_u_72 = require(game.ReplicatedStorage.FruitSkills)
local v_u_73 = require(game.ReplicatedStorage.FruitSpritesheets)
local v_u_74 = require(game.ReplicatedStorage.Modules.Net)
local v_u_75 = require(game.ReplicatedStorage.Controllers.UI.MobileUIController)
local v_u_76 = require(game.ReplicatedStorage.Modules.LastInput).IsMobile
local v_u_77 = require(game.ReplicatedStorage.Modules.Util.TextUtil)
local v_u_78 = require(game.ReplicatedStorage.Controllers.AnalyticsClient)
local v_u_79 = require(game.ReplicatedStorage.Util)
require(game.ReplicatedStorage.Modules.SkinUtil)
require(game.ReplicatedStorage.GlobalUtil)
function _G.buyRobuxShop(p80, p81)
	-- upvalues: (copy) v_u_60
	local v82 = {
		["StorageName"] = p80,
		["PurchaseLocation"] = p81,
		["FunnelId"] = p81 == "Shop" and "Shop" or nil
	}
	return v_u_60.CommF_:InvokeServer("buyRobuxShop", v82)
end
function ApplySprite(p83, p84)
	-- upvalues: (copy) v_u_73
	local v85 = p84:gsub(":", "") .. "1.png"
	for v86, v87 in pairs(v_u_73) do
		for v88, v89 in pairs(v87) do
			if v88 == v85 then
				p83.Image = v86
				p83.ImageRectOffset = Vector2.new(v89[1], v89[2])
				p83.ImageRectSize = Vector2.new(v89[3], v89[4])
				return
			end
		end
	end
end
function getSpecialFruitName()
	local v90 = script:GetAttribute("SpecialFruit")
	local v91 = typeof(v90) == "string"
	assert(v91, "bad \"SpecialFruit\" attribute")
	if v90:len() <= 0 then
		return nil
	else
		return v90
	end
end
function StarsUntilLevel(p92, p93, p94, p95)
	local v96 = p94 > 600 and 600 or p94
	if v96 <= p92 then
		return 0
	end
	local v97 = math.pow(p95, 1.1) * 20
	local v98 = v97 % 100
	local v99
	if v98 >= 50 then
		v99 = v97 + (100 - v98)
	else
		v99 = v97 - v98
	end
	if game:GetService("CollectionService"):HasTag(game.Players.LocalPlayer, "DoubleMastery") then
		v99 = v99 * 2
	end
	local v100 = -p93
	for v101 = p92, v96 - 1 do
		v100 = v100 + require(game.ReplicatedStorage.MasteryEXPFunction)(v101)
	end
	local v102 = v100 / v99
	return math.ceil(v102)
end
local v_u_103 = game:GetService("UserInputService")
game:GetService("ContextActionService")
_G.mobileSelection = nil
_G.mobileSelectionFrame = nil
function BuffLevel(p104, p105, p106, p107)
	local v108 = p104.Exp + p105.Exp
	local v109 = p104.Level
	local v110 = p105.Level
	local v111 = 0
	for v112 = 1, math.min(v110, p107) do
		v111 = v111 + 1
		if v111 % 1000 == 0 then
			task.wait()
		end
		v108 = v108 + p106(v112)
	end
	while true do
		if p107 <= v109 then
			v108 = 0
			break
		end
		local v113 = p106(v109)
		if v108 < v113 then
			break
		end
		v109 = v109 + 1
		v108 = v108 - v113
	end
	warn(p104.Level, p105.Level, v109)
	return v109, v108
end
local v_u_114 = nil
local v_u_115 = false
v_u_60.CommE.OnClientEvent:Connect(function(p116, p_u_117)
	-- upvalues: (copy) v_u_29, (ref) v_u_35, (copy) v_u_72, (ref) v_u_114, (ref) v_u_115, (copy) v_u_51, (copy) v_u_53, (copy) v_u_49, (copy) v_u_60
	if p116 == "RefreshToolSetup" then
		local v118 = _G.Encode(p_u_117)
		if v118 and (v118.Parent and v118.Parent == game.Players.LocalPlayer.Character) then
			local v119 = v_u_29.IsEnabled and v_u_29.JobTools.Info.GetInfo(v118)
			if v119 then
				if v_u_35 then
					v_u_35:Disconnect()
					v_u_35 = nil
				end
				v_u_29.JobTools.SkillsInterface.setupJobToolSkills(v118, v119)
				return
			end
			local v120 = v_u_72[v118.Name]
			if v120 then
				v_u_114(v118, v120[1], v120[2])
			end
		end
		return
	elseif p116 == "GiveRestore" and not v_u_115 then
		v_u_115 = true
		pcall(function()
			-- upvalues: (ref) v_u_51
			v_u_51.LoadingScreen:Destroy()
		end)
		local v121 = p_u_117.Old.Date
		local v122 = typeof(v121) ~= "number" and "Unknown Date" or os.date("%x", p_u_117.Old.Date)
		local v123 = v_u_53.DataRestore.Container.List.Restore.TextLabel
		local v124 = "Restore data to (%s | Level %s | %s)"
		local v125 = p_u_117.Old.Level
		local v126
		if p_u_117.Old.Fruit and p_u_117.Old.Fruit ~= "" then
			v126 = p_u_117.Old.Fruit
			if v126 == "" then
				v126 = "Fruitless"
			else
				local v127 = v126:match("^Permanent %a+%-%a+") and "Permanent " or ""
				local v128 = string.match(v126, "(((%u)%-?)([^-.]+))$")
				if v128 then
					v126 = v127 .. v128
				end
			end
		else
			v126 = "Fruitless"
		end
		v123.Text = v124:format(v122, v125, v126)
		if p_u_117.Old.Level > p_u_117.New.Level then
			local v129 = v_u_53.DataRestore.Container.List.Restore.TextLabel
			v129.Text = v129.Text .. " <font color=\"#FFFF00\">\226\152\133Recommended\226\152\133</font>"
		else
			local v130 = v_u_53.DataRestore.Container.List.Update.TextLabel
			v130.Text = v130.Text .. " <font color=\"#FFFF00\">\226\152\133Recommended\226\152\133</font>"
			v_u_53.DataRestore.Container.List.Restore.Button.TextLabel.Visible = false
			v_u_53.DataRestore.Container.List.Update.Button.TextLabel.Visible = true
		end
		v_u_53.DataRestore.Container.List.Restore.Button.Activated:Connect(function()
			-- upvalues: (ref) v_u_53
			v_u_53.DataRestore.Container.List.Restore.Button.TextLabel.Visible = true
			v_u_53.DataRestore.Container.List.Update.Button.TextLabel.Visible = false
		end)
		v_u_53.DataRestore.Container.List.Update.Button.Activated:Connect(function()
			-- upvalues: (ref) v_u_53
			v_u_53.DataRestore.Container.List.Update.Button.TextLabel.Visible = true
			v_u_53.DataRestore.Container.List.Restore.Button.TextLabel.Visible = false
		end)
		local v_u_131 = v_u_53.DataRestore2.Container.List
		local function v_u_149()
			-- upvalues: (copy) p_u_117, (ref) v_u_53, (ref) v_u_49, (copy) v_u_131
			local v132 = {
				["Level"] = p_u_117.Old.Level,
				["Exp"] = p_u_117.Old.Exp,
				["Fruit"] = p_u_117.Old.Fruit
			}
			local v133 = {
				["Level"] = p_u_117.New.Level,
				["Exp"] = p_u_117.New.Exp,
				["Fruit"] = p_u_117.New.Fruit
			}
			if v_u_53.DataRestore.Container.List.Restore.Button.TextLabel.Visible then
				local v134 = v132
				v132 = v133
				v133 = v134
			end
			local v135 = BuffLevel(v133, v132, require(game.ReplicatedStorage.EXPFunction), v_u_49)
			v_u_131.Level.Text = ("Level: %s -> %s"):format(v133.Level, v135)
			if v_u_53.DataRestore.Container.List.Restore.Button.TextLabel.Visible then
				v_u_131.Subtitle.Text = "Restoring Using Old Data"
			else
				v_u_131.Subtitle.Text = "Buffing Current Data"
			end
			if v132.Fruit == v133.Fruit or (not v132.Fruit or v132.Fruit == "") then
				local v136 = v_u_131.Fruit
				local v137 = "Blox Fruit: %s -> %s"
				local v138
				if v132.Fruit == "" then
					v138 = v132.Fruit
					if v138 == "" then
						v138 = "Fruitless"
					else
						local v139 = v138:match("^Permanent %a+%-%a+") and "Permanent " or ""
						local v140 = string.match(v138, "(((%u)%-?)([^-.]+))$")
						if v140 then
							v138 = v139 .. v140
						end
					end
				else
					v138 = "Fruitless"
				end
				local v141 = v133.Fruit
				if v141 == "" then
					v141 = "Fruitless"
				else
					local v142 = v141:match("^Permanent %a+%-%a+") and "Permanent " or ""
					local v143 = string.match(v141, "(((%u)%-?)([^-.]+))$")
					if v143 then
						v141 = v142 .. v143
					end
				end
				v136.Text = v137:format(v138, v141)
			else
				local v144 = v_u_131.Fruit
				local v145 = "Blox Fruit: %s added to storage"
				local v146 = v132.Fruit
				if v146 == "" then
					v146 = "Fruitless"
				else
					local v147 = v146:match("^Permanent %a+%-%a+") and "Permanent " or ""
					local v148 = string.match(v146, "(((%u)%-?)([^-.]+))$")
					if v148 then
						v146 = v147 .. v148
					end
				end
				v144.Text = v145:format(v146)
			end
		end
		v_u_53.DataRestore.Info.Exit.Activated:Connect(function()
			-- upvalues: (copy) v_u_149, (ref) v_u_53
			v_u_149()
			v_u_53.DataRestore.Visible = false
			v_u_53.DataRestore2.Visible = true
		end)
		v_u_53.DataRestore2.Info.Back.Activated:Connect(function()
			-- upvalues: (ref) v_u_53
			v_u_53.DataRestore.Visible = true
			v_u_53.DataRestore2.Visible = false
		end)
		v_u_53.DataRestore2.Info.Confirm.Activated:Connect(function()
			-- upvalues: (ref) v_u_53, (ref) v_u_60
			v_u_53.DataRestore2.Visible = false
			v_u_60.CommF_:InvokeServer("AcceptRestore", v_u_53.DataRestore.Container.List.Restore.Button.TextLabel.Visible and 1 or 2)
		end)
		for _, v_u_150 in pairs(v_u_53:GetChildren()) do
			if v_u_150.Name ~= "DataRestore" and v_u_150.Name ~= "DataRestore2" then
				pcall(function()
					-- upvalues: (copy) v_u_150
					v_u_150.Visible = false
				end)
			end
		end
		v_u_53.DataRestore.Visible = true
	end
end)
if not script:GetAttribute("Restoring") then
	local v_u_151 = {}
	local v_u_152 = nil
	local v_u_153 = {
		["Blox Fruit"] = { Vector2.new(0, 0), Color3.fromRGB(235, 205, 255), Color3.fromRGB(205, 125, 255) },
		["Gun"] = { Vector2.new(376, 0), Color3.fromRGB(255, 245, 205), Color3.fromRGB(255, 217, 65) },
		["Melee"] = { Vector2.new(0, 376), Color3.fromRGB(255, 205, 205), Color3.fromRGB(255, 123, 123) },
		["Sword"] = { Vector2.new(376, 376), Color3.fromRGB(221, 255, 205), Color3.fromRGB(141, 255, 92) }
	}
	local v_u_154 = nil
	local v_u_155 = nil
	local v_u_156 = nil
	local v_u_157 = nil
	local v_u_158 = nil
	local v_u_159 = require(game.ReplicatedStorage.Util).Maid.new()
	local function v163()
		-- upvalues: (copy) v_u_53, (copy) v_u_19
		for _, v160 in v_u_53.Skills:GetChildren() do
			if v160:GetAttribute("SkillsContainer") then
				for _, v161 in v160:GetChildren() do
					if v161:FindFirstChild("GamepadKey") then
						local v162 = v_u_19:Get() == "Gamepad"
						v161.Key.Visible = not v162
						v161.GamepadKey.Visible = v162
					end
				end
			end
		end
	end
	task.defer(v163)
	v_u_19.Changed:Connect(v163)
	local v_u_164 = nil
	local v_u_165 = nil
	local v_u_166 = false
	local v_u_167 = false
	require(game.ReplicatedStorage:WaitForChild("SharedSignals")).TransformationChanged():Connect(function(p168, p169, p170)
		-- upvalues: (ref) v_u_165, (ref) v_u_166, (ref) v_u_167, (copy) v_u_75, (ref) v_u_164
		v_u_165 = p168
		v_u_166 = p169
		v_u_167 = p170
		if _G.MyCurrentTool then
			v_u_75:UnbindSkillContextButtons()
			v_u_164(_G.MyCurrentTool)
		end
	end)
	local v_u_171 = {}
	v_u_114 = function(p_u_172, p173, p174)
		-- upvalues: (copy) v_u_75, (copy) v_u_151, (copy) v_u_103, (copy) v_u_53, (copy) v_u_159, (copy) v_u_171, (copy) v_u_62, (copy) v_u_63, (copy) v_u_19, (copy) v_u_50, (copy) v_u_153, (copy) v_u_1, (copy) v_u_59, (copy) v_u_18, (ref) v_u_35, (ref) v_u_37, (ref) v_u_52, (ref) v_u_36, (ref) v_u_152, (ref) v_u_165, (ref) v_u_38, (ref) v_u_39
		local v_u_175 = {}
		for v176, v177 in p173 do
			v_u_175[v176] = v177
		end
		local v_u_178 = v_u_75:IsNewUIEnabled()
		local v179 = p_u_172.Name
		if p174 then
			for v180, v181 in p174 do
				local v182 = v181[1]
				local v183 = p_u_172:FindFirstChild("AwakenedMoves")
				if v183 then
					v183 = p_u_172.AwakenedMoves:FindFirstChild(v182)
				end
				if v183 then
					v_u_175[v180] = v181
					v_u_175[v180].Awakened = true
				end
			end
		end
		local v184 = false
		if v_u_151[v179] then
			for _, v185 in v_u_175 do
				for _, v186 in v_u_151[v179] do
					if v185[1] == v186[1] and v185[3] ~= v186[3] then
						v184 = true
					end
				end
			end
			if #v_u_175 ~= #v_u_151[v179] then
				v184 = true
			end
		end
		v_u_151[v179] = v_u_175
		if p_u_172:FindFirstChild("Data") then
			if v_u_103.TouchEnabled then
				v_u_53.Skills.BackgroundTransparency = 0.7
			end
			for _, v187 in v_u_53.Skills:GetChildren() do
				if v187:IsA("Frame") then
					v187.Visible = false
				end
			end
			_G.mobileSelection = nil
			_G.mobileSelectionFrame = nil
			local v_u_188 = v_u_53.Skills:FindFirstChild(v179)
			if v184 and v_u_188 then
				v_u_188:Destroy()
				v_u_188 = nil
			end
			v_u_159:DoCleaning()
			local function v190(p189)
				-- upvalues: (ref) v_u_171, (copy) p_u_172, (ref) v_u_62
				if not v_u_171[p_u_172.Name] then
					v_u_171[p_u_172.Name] = {}
				end
				if (p_u_172:GetAttribute("Level") or p_u_172.Level.Value) >= p189[2] then
					if v_u_171[p_u_172.Name][p189[1]] == false then
						v_u_62.new("<Color=Yellow>NEW SKILL AVAILABLE!<Color=/>"):Display()
					end
					v_u_171[p_u_172.Name][p189[1]] = true
				else
					v_u_171[p_u_172.Name][p189[1]] = false
				end
			end
			_G.CurrentTouchObjectForMouse = nil
			local function v_u_201()
				-- upvalues: (ref) v_u_103, (ref) v_u_188, (ref) v_u_53
				if v_u_103.TouchEnabled then
					task.wait(0.1)
					local v191 = nil
					for _, v192 in pairs(v_u_188:GetChildren()) do
						if v192:IsA("Frame") and v192.LayoutOrder == 1 then
							v191 = v192
						end
					end
					if v191 then
						if v191:FindFirstChild("M1Hold") then
							v191:FindFirstChild("M1Hold"):Destroy()
						end
						local v_u_193 = v_u_53.Skills.Container.Template.Mobile:Clone()
						v_u_188.AncestryChanged:Connect(function()
							-- upvalues: (copy) v_u_193
							v_u_193:Destroy()
						end)
						v_u_193.Name = "M1Hold"
						v_u_193.Visible = true
						v_u_193.Parent = v191
						v_u_193.Position = UDim2.new(v_u_193.Position.X.Scale, v_u_193.Position.X.Offset, v_u_193.Position.Y.Scale - v_u_193.Size.Y.Scale, v_u_193.Position.Y.Offset - v_u_193.Size.Y.Offset)
						local v_u_194 = require(game.ReplicatedStorage.Modules.FruitSkillUtil)
						v_u_193.Activated:Connect(function()
							-- upvalues: (copy) v_u_193, (ref) v_u_188, (ref) v_u_103, (copy) v_u_194
							_G.mobileId = nil
							if _G.mobileSelection == nil and _G.mobileSelectionFrame then
								_G.mobileSelectionFrame.BackgroundColor3 = Color3.new()
								_G.mobileSelectionFrame = nil
							end
							if _G.mobileSelectionFrame == v_u_193 then
								_G.mobileSelectionFrame.BackgroundColor3 = Color3.new()
								_G.mobileSelectionFrame = nil
								_G.mobileSelection = nil
							else
								_G.mobileSelection = "G"
								_G.mobileSelectionFrame = v_u_193
								for _, v195 in v_u_188:GetChildren() do
									if v195:IsA("Frame") then
										v195.Mobile.BackgroundColor3 = Color3.new()
									end
								end
								v_u_193.BackgroundColor3 = Color3.new(0, 1, 1)
								local v_u_196 = nil
								v_u_196 = v_u_103.TouchStarted:Connect(function(p197, p198)
									-- upvalues: (ref) v_u_193, (ref) v_u_196, (ref) v_u_194
									if p198 then
										return
									elseif _G.mobileSelectionFrame == v_u_193 then
										local v199 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
										if v199 then
											v_u_196:Disconnect()
											local v200 = {
												["HeldTool"] = v199,
												["InputObject"] = p197,
												["TapHoldButton"] = v_u_193
											}
											v_u_194.MobileM1ButtonActivated(v200)
										end
									else
										return
									end
								end)
							end
						end)
						v_u_193.InputBegan:Connect(function() end)
						v_u_193.InputEnded:Connect(function() end)
						return v_u_193
					end
					_G.TestGameWarn("no found skill")
				else
					_G.TestGameWarn("no uis")
				end
			end
			if not v_u_188 then
				v_u_188 = v_u_53.Skills.Container:Clone()
				v_u_188.Name = v179
				v_u_188:SetAttribute("SkillsContainer", true)
				v_u_188.Parent = v_u_53.Skills
				local function v_u_205(p_u_202, p_u_203)
					-- upvalues: (ref) v_u_103, (ref) v_u_188, (copy) p_u_172
					if v_u_103.TouchEnabled then
						p_u_202.Mobile.Activated:Connect(function()
							-- upvalues: (copy) p_u_202, (copy) p_u_203, (ref) v_u_188
							_G.mobileId = nil
							if _G.mobileSelection == nil and _G.mobileSelectionFrame then
								_G.mobileSelectionFrame.BackgroundColor3 = Color3.new()
								_G.mobileSelectionFrame = nil
							end
							if _G.mobileSelectionFrame == p_u_202.Mobile then
								_G.mobileSelectionFrame.BackgroundColor3 = Color3.new()
								_G.mobileSelectionFrame = nil
								_G.mobileSelection = nil
							else
								_G.mobileSelection = p_u_203[1]
								_G.mobileSelectionFrame = p_u_202.Mobile
								for _, v204 in v_u_188:GetChildren() do
									if v204:IsA("Frame") then
										v204.Mobile.BackgroundColor3 = Color3.new()
									end
								end
								p_u_202.Mobile.BackgroundColor3 = Color3.new(0, 1, 1)
								while _G.mobileSelectionFrame == p_u_202.Mobile do
									task.wait()
								end
								p_u_202.Mobile.BackgroundColor3 = Color3.new()
							end
						end)
						if (p_u_172:GetAttribute("Level") or p_u_172.Level.Value) >= p_u_203[2] then
							p_u_202.Mobile.Visible = true
						end
					end
				end
				local v_u_206 = nil
				local v_u_210 = v_u_53.Skills.ChildAdded:Connect(function(p207)
					-- upvalues: (ref) v_u_206, (copy) v_u_175, (copy) v_u_205
					if v_u_206 ~= p207 then
						if p207.Name == "CreationBuildMode" then
							v_u_206 = p207
							for _, v208 in p207:GetChildren() do
								for _, v209 in v_u_175 do
									if v209[1] == v208.Name then
										v_u_205(v208, v209)
									end
								end
							end
						end
					end
				end)
				v_u_188.Destroying:Connect(function()
					-- upvalues: (ref) v_u_206, (ref) v_u_210
					if v_u_206 then
						v_u_206:Destroy()
					end
					v_u_210:Disconnect()
					v_u_210 = nil
				end)
				for _, v211 in v_u_188:GetChildren() do
					if #v211.Name == 1 then
						v211:Destroy()
					end
				end
				for v212, v213 in v_u_175 do
					v213[2] = require(p_u_172.Data).Lvl[v213[1]]
					v190(v213)
					local v214 = v_u_188.Template:Clone()
					local v215 = (p_u_172:GetAttribute("Level") or p_u_172.Level.Value) < v213[2] and Color3.new(0.45, 0.45, 0.45) or Color3.new(1, 1, 1)
					v214.Title.TextColor3 = v215
					v214.Level.TextColor3 = v215
					v214.Key.TextColor3 = v215
					local _ = v213[1]
					local v216 = v213[1]
					v214.Key.Text = "[" .. v216 .. "]"
					v214.GamepadKey.Image = v_u_63.getImg(v213[1])
					local v217 = v_u_19:Get() == "Gamepad"
					v214.Key.Visible = not v217
					v214.GamepadKey.Visible = v217
					v214.Level.Text = "Mas. " .. v213[2]
					v214.Title.Text = v213[3]
					v214.Name = v213[1]
					v214.LayoutOrder = v212
					v214.Visible = true
					v214.Parent = v_u_188
					v_u_205(v214, v213)
				end
			end
			for _, v218 in v_u_175 do
				local v219 = v218[1]
				local v220 = require(p_u_172.Data).Lvl[v219]
				v218[2] = v220
				v190(v218)
				local v221 = v220 <= (p_u_172:GetAttribute("Level") or p_u_172.Level.Value)
				local v222 = v_u_188[v219]
				local v223 = v221 and Color3.new(1, 1, 1) or Color3.new(0.45, 0.45, 0.45)
				v222.Title.TextColor3 = v223
				v222.Level.TextColor3 = v223
				v222.Key.TextColor3 = v223
				v222.Mobile.BackgroundColor3 = Color3.new()
				if v_u_103.TouchEnabled and v221 then
					v222.Mobile.Visible = true
				end
				if v_u_103.TouchEnabled then
					local v224 = v_u_75:GetContextButton("Skill_" .. v219)
					if v224 then
						if not v221 then
							v224.Button.LockedFrame.Label.Text = "Mas. " .. v220
							v224.Button.LockedFrame.ZIndex = 98
						end
						v224.Button.LockedFrame.Visible = not v221
					end
				end
			end
			if _G.currentTapHold then
				_G.currentTapHold:Destroy()
				_G.currentTapHold = nil
			end
			if p_u_172:GetAttribute("MobileM1Button") and v179 ~= "Dragon-Dragon" then
				_G.currentTapHold = v_u_201()
			end
			local v_u_225 = v_u_53.Skills.StarContainer
			local v_u_226 = v_u_50:WaitForChild("Data"):WaitForChild("Stars")
			local function v229()
				-- upvalues: (copy) v_u_226, (copy) p_u_172, (copy) v_u_225
				local v227 = v_u_226.Max.Value
				local v228 = v_u_226[p_u_172.ToolTip].Value
				v_u_225.Center.Bar.Fill.Position = UDim2.fromScale(-1 + v228 / v227, 0)
				v_u_225.Center.Bar.TextLabel.Text = v228 .. "/" .. v227 .. " Stored"
				if (p_u_172:GetAttribute("Level") or p_u_172.Level.Value) < 600 then
					v_u_225.Center.Bar.Size = UDim2.new(0.7, -14, 1, -4)
					v_u_225.Center.Button.Visible = true
				else
					v_u_225.Center.Bar.Size = UDim2.new(1, -8, 1, -4)
					v_u_225.Center.Button.Visible = false
				end
				v_u_225.Center.Border.Size = v_u_225.Center.Bar.Size
			end
			v_u_159:GiveTask(v_u_226[p_u_172.ToolTip].Changed:Connect(v229))
			v_u_159:GiveTask(v_u_226.Max.Changed:Connect(v229))
			v_u_159:GiveTask(p_u_172.Level.Changed:Connect(v229))
			v229()
			v_u_225.Center.Bar.Fill.BackgroundColor3 = v_u_153[p_u_172.ToolTip][3]
			v_u_225.Center.Bar.Fill.Center.BackgroundColor3 = v_u_153[p_u_172.ToolTip][3]
			v_u_225.Center.Bar.ImageLabel.ImageRectOffset = v_u_153[p_u_172.ToolTip][1]
			local v_u_230 = require(game.ReplicatedStorage.Util).Maid.new()
			v_u_159:GiveTask(v_u_230)
			v_u_159:GiveTask(v_u_225.Center.Button.Activated:Connect(function()
				-- upvalues: (copy) v_u_230, (ref) v_u_53, (copy) v_u_175, (copy) p_u_172, (ref) v_u_50, (ref) v_u_153, (ref) v_u_1
				v_u_230:DoCleaning()
				for _, v231 in v_u_53.Stars.Container:GetChildren() do
					if v231:IsA("Frame") and v231.Visible then
						v231:Destroy()
					end
				end
				local v232 = v_u_53.Stars.Container:FindFirstChild("Template")
				local v_u_233 = {}
				for _, v234 in next, v_u_175 do
					if (p_u_172:GetAttribute("Level") or p_u_172.Level.Value) < v234[2] then
						local v235 = StarsUntilLevel(p_u_172:GetAttribute("Level") or p_u_172.Level.Value, p_u_172:GetAttribute("Exp") or p_u_172.Exp.Value, v234[2], v_u_50.Data.Level.Value)
						local v236 = {
							["Text"] = v234[3] .. " (Mas. " .. v234[2] .. ")",
							["Stars"] = v235,
							["Mastery"] = v234[2]
						}
						table.insert(v_u_233, v236)
					end
				end
				local v_u_237 = 0
				if (p_u_172:GetAttribute("Level") or p_u_172.Level.Value) < 400 then
					local v238 = {
						["Stars"] = StarsUntilLevel(p_u_172:GetAttribute("Level") or p_u_172.Level.Value, p_u_172:GetAttribute("Exp") or p_u_172.Exp.Value, 400, v_u_50.Data.Level.Value)
					}
					table.insert(v_u_233, v238)
				end
				if (p_u_172:GetAttribute("Level") or p_u_172.Level.Value) < 600 then
					v_u_237 = StarsUntilLevel(p_u_172:GetAttribute("Level") or p_u_172.Level.Value, p_u_172:GetAttribute("Exp") or p_u_172.Exp.Value, 600, v_u_50.Data.Level.Value)
					table.insert(v_u_233, {
						["Stars"] = v_u_237
					})
				end
				table.sort(v_u_233, function(p239, p240)
					return p239.Stars < p240.Stars
				end)
				local v_u_241 = v_u_50.Data.Stars[p_u_172.ToolTip]
				local function v_u_250()
					-- upvalues: (ref) v_u_237, (ref) p_u_172, (ref) v_u_50, (copy) v_u_233, (copy) v_u_241, (ref) v_u_53
					v_u_237 = StarsUntilLevel(p_u_172:GetAttribute("Level") or p_u_172.Level.Value, p_u_172:GetAttribute("Exp") or p_u_172.Exp.Value, 600, v_u_50.Data.Level.Value)
					for _, v242 in v_u_233 do
						v242.Stars = StarsUntilLevel(p_u_172:GetAttribute("Level") or p_u_172.Level.Value, p_u_172:GetAttribute("Exp") or p_u_172.Exp.Value, v242.Mastery, v_u_50.Data.Level.Value)
						v242.Gui.Add.ImageLabel.TextLabel.Text = v242.Stars
						if v242.Stars > v_u_241.Value or (v242.Stars == 0 or v_u_237 < v242.Stars) then
							v242.Gui.TextLabel.TextColor3 = Color3.fromRGB(115, 115, 115)
							local v243 = v242.Gui.Add
							v243.BackgroundColor3 = Color3.fromRGB(122, 122, 122)
							v243.BorderColor3 = Color3.fromRGB(100, 100, 100)
							v243.Trans.BackgroundColor3 = Color3.fromRGB(153, 153, 153)
							v243.ImageLabel.TextLabel.TextColor3 = Color3.fromRGB(188, 188, 188)
							v243.ImageLabel.ImageColor3 = Color3.fromRGB(211, 211, 211)
						else
							v242.Gui.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
							local v244 = v242.Gui.Add
							v244.BackgroundColor3 = Color3.fromRGB(255, 214, 49)
							v244.BorderColor3 = Color3.fromRGB(255, 240, 69)
							v244.Trans.BackgroundColor3 = Color3.fromRGB(255, 241, 87)
							v244.ImageLabel.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
							v244.ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
						end
					end
					for _, v245 in v_u_53.Stars.ExtraRow:GetChildren() do
						if v245:IsA("TextButton") then
							local v246 = v245.Name
							if tonumber(v246) > v_u_241.Value then
								::l20::
								v245.BackgroundColor3 = Color3.fromRGB(122, 122, 122)
								v245.BorderColor3 = Color3.fromRGB(100, 100, 100)
								v245.Trans.BackgroundColor3 = Color3.fromRGB(153, 153, 153)
								v245.ImageLabel.TextLabel.TextColor3 = Color3.fromRGB(188, 188, 188)
								v245.ImageLabel.ImageColor3 = Color3.fromRGB(211, 211, 211)
							else
								local v247 = v245.Name
								if tonumber(v247) == 0 then
									goto l20
								end
								local v248 = v_u_237
								local v249 = v245.Name
								if v248 < tonumber(v249) then
									goto l20
								end
								v245.BackgroundColor3 = Color3.fromRGB(255, 214, 49)
								v245.BorderColor3 = Color3.fromRGB(255, 240, 69)
								v245.Trans.BackgroundColor3 = Color3.fromRGB(255, 241, 87)
								v245.ImageLabel.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
								v245.ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
							end
						end
					end
					v_u_53.Stars.Bottom.Available.Text = "Available: " .. v_u_241.Value
				end
				v_u_230:GiveTask(v_u_50.Data.Level.Changed:Connect(v_u_250))
				v_u_230:GiveTask(v_u_241.Changed:Connect(function()
					-- upvalues: (copy) v_u_250
					task.wait(0.1)
					v_u_250()
				end))
				v_u_230:GiveTask(p_u_172.Level.Changed:Connect(function()
					-- upvalues: (copy) v_u_250
					task.wait(0.1)
					v_u_250()
				end))
				for _, v_u_251 in v_u_233 do
					local v252 = v232:Clone()
					v252.Add.ImageLabel.TextLabel.Text = v_u_251.Stars
					v252.TextLabel.Text = v_u_251.Text
					v252.Visible = true
					v252.Add.ImageLabel.ImageRectOffset = v_u_153[p_u_172.ToolTip][1]
					v252.Parent = v_u_53.Stars.Container
					v_u_251.Gui = v252
					v_u_230:GiveTask(v252.Add.Activated:Connect(function()
						-- upvalues: (copy) v_u_251, (ref) v_u_237, (ref) p_u_172
						local v253 = v_u_251.Stars
						local v254 = v_u_237
						local v255 = math.min(v253, v254)
						if v255 ~= 0 then
							game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SpendStar", p_u_172.ToolTip, v255)
						end
					end))
				end
				v_u_230:GiveTask(v_u_53.Stars.Title.Exit.Activated:Connect(function()
					-- upvalues: (ref) v_u_1, (ref) v_u_53, (ref) v_u_230
					v_u_1:Create(v_u_53.Stars, TweenInfo.new(0.2), {
						["Position"] = UDim2.fromScale(0.5, 2)
					}):Play()
					v_u_230:DoCleaning()
				end))
				for _, v_u_256 in v_u_53.Stars.ExtraRow:GetChildren() do
					if v_u_256:IsA("TextButton") then
						v_u_230:GiveTask(v_u_256.Activated:Connect(function()
							-- upvalues: (copy) v_u_256, (ref) v_u_237, (ref) p_u_172
							local v257 = v_u_256.Name
							local v258 = tonumber(v257)
							local v259 = v_u_237
							local v260 = math.min(v258, v259)
							if v260 ~= 0 then
								game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SpendStar", p_u_172.ToolTip, v260)
							end
						end))
						v_u_256.ImageLabel.ImageRectOffset = v_u_153[p_u_172.ToolTip][1]
					end
				end
				v_u_250()
				v_u_1:Create(v_u_53.Stars, TweenInfo.new(0.2), {
					["Position"] = UDim2.fromScale(0.5, 0.5)
				}):Play()
			end))
			v_u_159:GiveTask(function()
				-- upvalues: (ref) v_u_1, (ref) v_u_53
				v_u_1:Create(v_u_53.Stars, TweenInfo.new(0.2), {
					["Position"] = UDim2.fromScale(0.5, 2)
				}):Play()
			end)
			local v261 = v179 == "Black Leg" and "Dark Step" or v179
			local v262 = v261 == "Fishman Karate" and "Water Kung Fu" or v261
			local v263 = v262 == "Electro" and "Electric" or v262
			local v264 = v263 == "Dragon Claw" and "Dragon Breath" or v263
			v_u_53.Skills.Rage.Black.Trans.Visible = false
			v_u_53.Skills.Rage.Bar.UIGradient.Enabled = false
			v_u_59.Bar.Trans.Visible = false
			v_u_59.Bar.UIGradient.Enabled = false
			for _, v265 in v_u_53.Skills.Rage.Ticks:GetChildren() do
				v265.Visible = true
			end
			for _, v266 in v_u_59.Ticks:GetChildren() do
				v266.Visible = true
			end
			v_u_53.Skills.Rage.Ticks.MoodLine.Visible = false
			v_u_59.Ticks.MoodLine.Visible = false
			local v_u_267 = false
			if v264 == getSpecialFruitName() or (v264 == "Control-Control" or (v264 == "Pain-Pain" or (v264 == "Werewolf (Tiger)-Werewolf (Tiger)" or (v264 == "Tiger-Tiger" or (v264 == "Creation-Creation" or v264 == "Gravity-Gravity" and v_u_18.getIfNewGravityEnabled()))))) or (v264 == "Gas-Gas" or (v264 == "Sound-Sound" or (v264 == "Kitsune-Kitsune" or (v264 == "Empyrean (Kitsune)-Empyrean (Kitsune)" or (v264 == "Dragon-Dragon" or (v264 == "Dragon (Classic)-Dragon (Classic)" or (v264 == "T-Rex-T-Rex" or (v264 == "Venom-Venom" or (v264 == "Shadow-Shadow" or (v264 == "Soul-Soul" or v264 == "Spirit-Spirit")))))))))) then
				v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", false)
				v_u_53.Skills.Rage.TextColor3 = Color3.new(1, 1, 1)
				v_u_53.Skills.Rage.Black.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
				v_u_53.Skills.Rage.Black.Trans.Visible = false
				v_u_59.Fire:SetAttribute("ParticleEnabled", false)
				v_u_59.Black.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
				v_u_59.Black.Trans.Visible = false
				if v264 == "Soul-Soul" or v264 == "Spirit-Spirit" then
					if v264 == "Spirit-Spirit" then
						v_u_53.Skills.Rage.Text = "Spirits: ?"
						v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(1, 1, 1)
						v_u_53.Skills.Rage.Bar.UIGradient.Enabled = true
						for _, v268 in v_u_53.Skills.Rage.Ticks:GetChildren() do
							v268.Visible = false
						end
						v_u_53.Skills.Rage.Black.Trans.Visible = false
						v_u_53.Skills.Rage.Ticks.MoodLine.Visible = true
						v_u_59.Text = "Spirits: ?"
						v_u_59.Bar.BackgroundColor3 = Color3.new(1, 1, 1)
						v_u_59.Bar.UIGradient.Enabled = true
						for _, v269 in v_u_59.Ticks:GetChildren() do
							v269.Visible = false
						end
						v_u_59.Black.Trans.Visible = false
						v_u_59.Ticks.MoodLine.Visible = true
						if v_u_35 then
							v_u_35:Disconnect()
							v_u_35 = nil
						end
						if v_u_37 then
							v_u_37:Disconnect()
							v_u_37 = nil
						end
						v_u_53.Skills.Rage.Bar.Size = UDim2.fromScale(1, 0.2)
						v_u_59.Bar.Size = UDim2.fromScale(1, 0.3)
						task.defer(function()
							-- upvalues: (ref) v_u_52, (ref) v_u_35, (ref) v_u_53, (ref) v_u_59, (ref) v_u_1, (ref) v_u_37
							local v_u_270 = v_u_52:WaitForChild("Rage")
							local v_u_271 = v_u_52:WaitForChild("Souls")
							if not v_u_35 then
								local v_u_272 = v_u_270.Value
								local v_u_273 = nil
								local v_u_274 = nil
								v_u_35 = v_u_270.Changed:Connect(function()
									-- upvalues: (copy) v_u_270, (ref) v_u_272, (ref) v_u_273, (ref) v_u_274, (ref) v_u_53, (ref) v_u_59, (ref) v_u_1
									if v_u_270.Value <= v_u_272 then
										if v_u_273 then
											v_u_273:Cancel()
										end
										if v_u_274 then
											v_u_274:Cancel()
										end
										v_u_53.Skills.Rage.Ticks.MoodLine.Position = UDim2.fromScale(v_u_270.Value / 100, 0)
										v_u_59.Ticks.MoodLine.Position = UDim2.fromScale(v_u_270.Value / 100, 0)
									else
										v_u_273 = v_u_1:Create(v_u_53.Skills.Rage.Ticks.MoodLine, TweenInfo.new(0.25), {
											["Position"] = UDim2.new(v_u_270.Value / 100, 0, 0, 0)
										})
										v_u_273:Play()
										v_u_274 = v_u_1:Create(v_u_59.Ticks.MoodLine, TweenInfo.new(0.25), {
											["Position"] = UDim2.new(v_u_270.Value / 100, 0, 0, 0)
										})
										v_u_274:Play()
									end
									if v_u_270.Value > 50 then
										v_u_53.Skills.Rage.TextColor3 = Color3.new(1, 0.1, 0.1)
										v_u_59.TextColor3 = Color3.new(1, 0.1, 0.1)
									else
										v_u_53.Skills.Rage.TextColor3 = Color3.new(0.1, 1, 1)
										v_u_59.TextColor3 = Color3.new(0.1, 1, 1)
									end
									v_u_272 = v_u_270.Value
								end)
								v_u_53.Skills.Rage.Ticks.MoodLine.Position = UDim2.new(v_u_270.Value / 100, 0, 0, 0)
								v_u_59.Ticks.MoodLine.Position = UDim2.new(v_u_270.Value / 100, 0, 0, 0)
							end
							v_u_53.Skills.Rage.Text = "Spirits: " .. v_u_271.Value
							v_u_59.Text = "Spirits: " .. v_u_271.Value
							if not v_u_37 then
								v_u_37 = v_u_271.Changed:Connect(function()
									-- upvalues: (ref) v_u_53, (copy) v_u_271, (ref) v_u_59
									v_u_53.Skills.Rage.Text = "Spirits: " .. v_u_271.Value
									v_u_59.Text = "Spirits: " .. v_u_271.Value
								end)
								v_u_53.Skills.Rage.Text = "Spirits: " .. v_u_271.Value
								v_u_59.Text = "Spirits: " .. v_u_271.Value
							end
						end)
					else
						v_u_53.Skills.Rage.Text = "Souls: ?"
						v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(1, 1, 1)
						v_u_53.Skills.Rage.Bar.UIGradient.Enabled = true
						for _, v275 in v_u_53.Skills.Rage.Ticks:GetChildren() do
							v275.Visible = false
						end
						v_u_53.Skills.Rage.Black.Trans.Visible = false
						v_u_53.Skills.Rage.Ticks.MoodLine.Visible = true
						v_u_59.Text = "Souls: ?"
						v_u_59.Bar.BackgroundColor3 = Color3.new(1, 1, 1)
						v_u_59.Bar.UIGradient.Enabled = true
						for _, v276 in v_u_59.Ticks:GetChildren() do
							v276.Visible = false
						end
						v_u_59.Black.Trans.Visible = false
						v_u_59.Ticks.MoodLine.Visible = true
						if v_u_35 then
							v_u_35:Disconnect()
							v_u_35 = nil
						end
						if v_u_36 then
							v_u_36:Disconnect()
							v_u_36 = nil
						end
						v_u_53.Skills.Rage.Bar.Size = UDim2.fromScale(1, 0.2)
						v_u_59.Bar.Size = UDim2.fromScale(1, 0.3)
						task.defer(function()
							-- upvalues: (ref) v_u_52, (ref) v_u_35, (ref) v_u_53, (ref) v_u_59, (ref) v_u_36
							local v_u_277 = v_u_52:WaitForChild("Rage")
							if not v_u_35 then
								v_u_35 = v_u_277.Changed:Connect(function()
									-- upvalues: (ref) v_u_53, (copy) v_u_277, (ref) v_u_59
									v_u_53.Skills.Rage.Ticks.MoodLine.Position = UDim2.new(v_u_277.Value / 100, 0, 0, 0)
									v_u_59.Ticks.MoodLine.Position = UDim2.new(v_u_277.Value / 100, 0, 0, 0)
								end)
								v_u_53.Skills.Rage.Ticks.MoodLine.Position = UDim2.new(v_u_277.Value / 100, 0, 0, 0)
								v_u_59.Ticks.MoodLine.Position = UDim2.new(v_u_277.Value / 100, 0, 0, 0)
							end
							local v_u_278 = v_u_52:WaitForChild("Souls")
							if not v_u_36 then
								v_u_36 = v_u_278.Changed:Connect(function()
									-- upvalues: (ref) v_u_53, (copy) v_u_278, (ref) v_u_59
									v_u_53.Skills.Rage.Text = "Souls: " .. v_u_278.Value
									v_u_59.Text = "Souls: " .. v_u_278.Value
								end)
								v_u_53.Skills.Rage.Text = "Souls: " .. v_u_278.Value
								v_u_59.Text = "Souls: " .. v_u_278.Value
							end
						end)
					end
				elseif v264 == getSpecialFruitName() then
					v_u_53.Skills.Rage.TextColor3 = Color3.new(1, 1, 1)
					v_u_53.Skills.Rage.Bar.UIGradient.Enabled = false
					for _, v279 in v_u_53.Skills.Rage.Black:GetChildren() do
						v279.Visible = true
					end
					v_u_53.Skills.Rage.Ticks.MoodLine.Visible = false
					v_u_53.Skills.Rage.Text = "Feather Meter"
					v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(1, 0.690196, 0.192157)
					v_u_59.Bar.UIGradient.Enabled = false
					for _, v280 in v_u_59.Black:GetChildren() do
						v280.Visible = true
					end
					v_u_59.Ticks.MoodLine.Visible = false
					v_u_59.Text = "Feather Meter"
					v_u_59.Bar.BackgroundColor3 = Color3.new(1, 0.690196, 0.192157)
					if v_u_35 then
						v_u_35:Disconnect()
						v_u_35 = nil
					end
					coroutine.resume(coroutine.create(function()
						-- upvalues: (ref) v_u_52, (ref) v_u_35, (ref) v_u_53, (ref) v_u_59
						local v_u_281 = v_u_52:WaitForChild("Rage")
						if not v_u_35 then
							v_u_35 = v_u_281.Changed:Connect(function()
								-- upvalues: (ref) v_u_53, (copy) v_u_281, (ref) v_u_59
								v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_281.Value / 100, 0, 0.2, 0)
								v_u_59.Bar.Size = UDim2.new(v_u_281.Value / 100, 0, 0.2, 0)
							end)
							v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_281.Value / 100, 0, 0.2, 0)
							v_u_59.Bar.Size = UDim2.new(v_u_281.Value / 100, 0, 0.2, 0)
						end
					end))
				elseif v264 == "Creation-Creation" then
					v_u_53.Skills.Rage.TextColor3 = Color3.new(1, 1, 1)
					v_u_53.Skills.Rage.Bar.UIGradient.Enabled = false
					for _, v282 in v_u_53.Skills.Rage.Black:GetChildren() do
						v282.Visible = true
					end
					v_u_53.Skills.Rage.Ticks.MoodLine.Visible = false
					v_u_53.Skills.Rage.Text = "Build Meter"
					v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(1, 0.203922, 0.203922)
					v_u_59.TextColor3 = Color3.new(1, 1, 1)
					v_u_59.Text = "Build Meter"
					v_u_59.Bar.BackgroundColor3 = Color3.new(1, 0.203922, 0.203922)
					v_u_59.Bar.UIGradient.Enabled = false
					v_u_59.Ticks.MoodLine.Visible = false
					for _, v283 in v_u_59.Black:GetChildren() do
						v283.Visible = true
					end
					if v_u_35 then
						v_u_35:Disconnect()
						v_u_35 = nil
					end
					if v_u_152 then
						v_u_152:Disconnect()
						v_u_152 = nil
					end
					coroutine.resume(coroutine.create(function()
						-- upvalues: (ref) v_u_52, (ref) v_u_35, (ref) v_u_53, (ref) v_u_59, (copy) p_u_172, (ref) v_u_152, (copy) v_u_178, (ref) v_u_267
						local v_u_284 = v_u_52:WaitForChild("Rage")
						if not v_u_35 then
							v_u_35 = v_u_284.Changed:Connect(function()
								-- upvalues: (ref) v_u_53, (copy) v_u_284, (ref) v_u_59
								v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_284.Value / 100, 0, 0.2, 0)
								v_u_59.Bar.Size = UDim2.new(v_u_284.Value / 100, 0, 0.2, 0)
							end)
							v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_284.Value / 100, 0, 0.2, 0)
							v_u_59.Bar.Size = UDim2.new(v_u_284.Value / 100, 0, 0.2, 0)
						end
						local v_u_285 = p_u_172:WaitForChild("FortBuilderActive")
						if not v_u_152 then
							v_u_152 = v_u_285.Changed:Connect(function()
								-- upvalues: (copy) v_u_285, (ref) v_u_53, (ref) v_u_178, (ref) v_u_59
								if v_u_285.Value == true then
									v_u_53.Skills.Rage.Visible = not v_u_178
									v_u_59.Visible = v_u_178
								else
									v_u_53.Skills.Rage.Visible = false
									v_u_59.Visible = false
								end
							end)
							if v_u_285.Value == true then
								v_u_267 = false
								v_u_53.Skills.Rage.Visible = true
								return
							end
							v_u_267 = true
							v_u_53.Skills.Rage.Visible = false
						end
					end))
				elseif v264 == "Gravity-Gravity" and v_u_18.getIfNewGravityEnabled() then
					local v_u_286 = p_u_172:FindFirstChild("HiddenAbilities")
					if v_u_286 and (v_u_286:FindFirstChild("CelestialCataclysm") or v_u_286:FindFirstChild("DarkMatterImplosion")) then
						v_u_53.Skills.Rage.TextColor3 = Color3.new(1, 1, 1)
						v_u_53.Skills.Rage.Bar.UIGradient.Enabled = false
						for _, v287 in pairs(v_u_53.Skills.Rage.Black:GetChildren()) do
							v287.Visible = true
						end
						v_u_53.Skills.Rage.Ticks.MoodLine.Visible = false
						v_u_53.Skills.Rage.Text = "Gravitational Force"
						v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(0.45098, 0, 1)
						v_u_59.Text = "Gravitational Force"
						v_u_59.Bar.BackgroundColor3 = Color3.new(0.45098, 0, 1)
						v_u_59.Ticks.MoodLine.Visible = false
						v_u_59.Bar.UIGradient.Enabled = false
						for _, v288 in pairs(v_u_59.Black:GetChildren()) do
							v288.Visible = true
						end
						if v_u_35 then
							v_u_35:Disconnect()
							v_u_35 = nil
						end
						coroutine.resume(coroutine.create(function()
							-- upvalues: (ref) v_u_52, (ref) v_u_35, (ref) v_u_53, (ref) v_u_59, (copy) v_u_286
							local v_u_289 = v_u_52:WaitForChild("Rage")
							if not v_u_35 then
								v_u_35 = v_u_289.Changed:Connect(function()
									-- upvalues: (ref) v_u_53, (copy) v_u_289, (ref) v_u_59, (ref) v_u_286
									v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_289.Value / 100, 0, 0.2, 0)
									v_u_59.Bar.Size = UDim2.new(v_u_289.Value / 100, 0, 0.2, 0)
									if v_u_289.Value >= 100 then
										if v_u_286 and v_u_286:FindFirstChild("CelestialCataclysm") then
											v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", "Gravity")
										else
											v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", false)
										end
									else
										v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", false)
										return
									end
								end)
								v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_289.Value / 100, 0, 0.2, 0)
								v_u_59.Bar.Size = UDim2.new(v_u_289.Value / 100, 0, 0.2, 0)
							end
						end))
					else
						v_u_267 = true
					end
				elseif v264 == "Kitsune-Kitsune" or v264 == "Empyrean (Kitsune)-Empyrean (Kitsune)" then
					v_u_53.Skills.Rage.Text = "1 Tail"
					v_u_53.Skills.Rage.TextColor3 = Color3.new(1, 1, 1)
					v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(0, 0, 1)
					v_u_59.Text = "1 Tail"
					v_u_59.Bar.BackgroundColor3 = Color3.new(0, 0, 1)
					if v_u_35 then
						v_u_35:Disconnect()
						v_u_35 = nil
					end
					if v_u_37 then
						v_u_37:Disconnect()
						v_u_37 = nil
					end
					v_u_53.Skills.Rage.Bar.Size = UDim2.fromScale(1, 0.2)
					v_u_59.Bar.Size = UDim2.fromScale(1, 0.2)
					task.defer(function()
						-- upvalues: (ref) v_u_52, (ref) v_u_35, (ref) v_u_53, (ref) v_u_59
						local v_u_290 = v_u_52:WaitForChild("Rage")
						if not v_u_35 then
							local v_u_291 = v_u_290.Value / 100
							local function v297(p292)
								-- upvalues: (ref) v_u_53, (ref) v_u_59
								local v293 = p292 > 0.6666666666666666 and 2 or (p292 > 0.3333333333333333 and 1 or 0)
								local v294 = Color3.new(0, v293 / 2, 1)
								local v295
								if v293 >= 1 then
									v_u_53.Skills.Rage.Black.BackgroundColor3 = Color3.new(0, (v293 - 1) / 2, 1)
									v_u_53.Skills.Rage.Black.Trans.Visible = true
									v_u_59.Black.BackgroundColor3 = Color3.new(0, (v293 - 1) / 2, 1)
									v_u_59.Black.Trans.Visible = true
									v295 = (p292 - v293 * 0.3333333333333333) / 0.3333333333333333
								else
									v_u_53.Skills.Rage.Black.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
									v_u_53.Skills.Rage.Black.Trans.Visible = false
									v_u_59.Black.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
									v_u_59.Black.Trans.Visible = false
									v295 = p292 / 0.3333333333333333
								end
								v_u_53.Skills.Rage.Bar.BackgroundColor3 = v294
								v_u_53.Skills.Rage.Bar.Size = UDim2.new(v295, 0, 0.2, 0)
								v_u_59.Bar.BackgroundColor3 = v294
								v_u_59.Bar.Size = UDim2.new(v295, 0, 0.2, 0)
								local v296 = v293 == 1 and "2 Tails" or (v293 == 2 and "3 Tails" or "1 Tail")
								v_u_53.Skills.Rage.Text = v296
								v_u_59.Text = v296
							end
							local v_u_298 = 0
							v_u_35 = v_u_290.Changed:Connect(function()
								-- upvalues: (copy) v_u_290, (ref) v_u_298, (ref) v_u_291
								local v299 = v_u_290.Value / 100
								v_u_298 = os.clock()
								v_u_291 = v299
							end)
							v297(v_u_291)
							local v300 = v_u_291
							local v301 = v_u_291
							local v302 = v_u_298
							local v303 = false
							while true do
								local v304 = task.wait()
								if not v_u_35 then
									break
								end
								if os.clock() - v302 < 0.25 then
									v300 = v300 + (v301 - v300) * (v304 / 0.25) * 5
									v297(v300)
									v303 = false
								elseif not v303 then
									v297(v301)
									v300 = v301
									v303 = true
								end
								if v301 >= 1 and not (v_u_52:FindFirstChild("Kitsune") or v_u_52:FindFirstChild("RedKitsune")) then
									local v305 = os.clock() % 3 / 3
									local v306 = Color3.fromHSV(v305, 1, 1)
									v_u_53.Skills.Rage.Bar.BackgroundColor3 = v306
									v_u_59.Bar.BackgroundColor3 = v306
								end
							end
						end
					end)
				elseif v264 == "Dragon-Dragon" then
					_G.TestGamePrint("Init dragon tools", v_u_165)
					v_u_53.Skills.Rage.Text = "Fury Meter"
					v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(1, 0.6, 0)
					v_u_59.Text = "Fury Meter"
					v_u_59.Bar.BackgroundColor3 = Color3.new(1, 0.6, 0)
					local v_u_307 = nil
					if v_u_38 then
						v_u_38:Disconnect()
						v_u_38 = nil
					end
					v_u_38 = require(game.ReplicatedStorage:WaitForChild("SharedSignals")).TransformationChanged():Connect(function(p308, p309, p310)
						-- upvalues: (ref) v_u_307, (copy) v_u_201
						_G.TestGamePrint("TransformationChanged: DragonTools", p308, p309, p310)
						if p308 and not p310 then
							_G.TestGamePrint("make flamethrower button for dragon (2)")
							v_u_307 = v_u_201()
							_G.currentTapHold = v_u_307
						elseif v_u_307 then
							_G.TestGamePrint("destroy flame button")
							v_u_307:Destroy()
						end
					end)
					if v_u_165 == "Dragon" then
						_G.TestGamePrint("make flamethrower button for dragon")
						local v311 = v_u_201()
						_G.currentTapHold = v311
					end
					if v_u_35 then
						v_u_35:Disconnect()
						v_u_35 = nil
					end
					if v_u_37 then
						v_u_37:Disconnect()
						v_u_37 = nil
					end
					v_u_53.Skills.Rage.Bar.Size = UDim2.fromScale(1, 0.2)
					v_u_59.Bar.Size = UDim2.fromScale(1, 0.2)
					coroutine.resume(coroutine.create(function()
						-- upvalues: (ref) v_u_52, (ref) v_u_35, (ref) v_u_53, (ref) v_u_59
						local v_u_312 = v_u_52:WaitForChild("Rage")
						if not v_u_35 then
							local v_u_313 = v_u_312.Value / 100
							local function v317(p314)
								-- upvalues: (ref) v_u_53, (ref) v_u_59
								local v315 = Color3.new(1, 0.6, 0)
								local v316
								if p314 >= 0.5 then
									v_u_53.Skills.Rage.Black.BackgroundColor3 = v315
									v_u_53.Skills.Rage.Black.Trans.Visible = true
									v_u_59.Black.BackgroundColor3 = v315
									v_u_59.Black.Trans.Visible = true
									v315 = Color3.new(1, 0, 0)
									v316 = (p314 - 0.5) / 0.5
								else
									v_u_53.Skills.Rage.Black.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
									v_u_53.Skills.Rage.Black.Trans.Visible = false
									v_u_59.Black.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
									v_u_59.Black.Trans.Visible = false
									v316 = p314 / 0.5
								end
								v_u_53.Skills.Rage.Bar.BackgroundColor3 = v315
								v_u_53.Skills.Rage.Bar.Size = UDim2.new(v316, 0, 0.2, 0)
								v_u_59.Bar.BackgroundColor3 = v315
								v_u_59.Bar.Size = UDim2.new(v316, 0, 0.2, 0)
							end
							local v_u_318 = 0
							v_u_35 = v_u_312.Changed:Connect(function()
								-- upvalues: (copy) v_u_312, (ref) v_u_318, (ref) v_u_313
								local v319 = v_u_312.Value / 100
								v_u_318 = os.clock()
								v_u_313 = v319
							end)
							v317(v_u_313)
							local v320 = v_u_313
							local v321 = v_u_35
							local v322 = v_u_313
							local v323 = v_u_318
							local v324 = false
							while true do
								local v325 = task.wait()
								local v326 = math.min(v325, 0.05)
								if not v_u_35 or v321 ~= v_u_35 then
									break
								end
								if os.clock() - v323 < 0.25 then
									v320 = v320 + (v322 - v320) * (v326 / 0.25) * 5
									v317(v320)
									v324 = false
								elseif not v324 then
									v317(v322)
									v320 = v322
									v324 = true
								end
								if v322 >= 1 and not v_u_52:FindFirstChild("Dragon") then
									local v327 = os.clock() % 3 / 3
									local v328 = Color3.fromHSV(v327, 1, 1)
									v_u_53.Skills.Rage.Bar.BackgroundColor3 = v328
									v_u_59.Bar.BackgroundColor3 = v328
								end
							end
						end
					end))
				elseif v264 == "Tiger-Tiger" or v264 == "Werewolf (Tiger)-Werewolf (Tiger)" then
					v_u_53.Skills.Rage.TextColor3 = Color3.new(1, 1, 1)
					v_u_53.Skills.Rage.Bar.UIGradient.Enabled = false
					for _, v329 in pairs(v_u_53.Skills.Rage.Ticks:GetChildren()) do
						v329.Visible = true
					end
					v_u_53.Skills.Rage.Ticks.MoodLine.Visible = false
					v_u_53.Skills.Rage.Text = "Fire Meter"
					v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(1, 0, 0)
					v_u_59.Text = "Fire Meter"
					v_u_59.Bar.BackgroundColor3 = Color3.new(1, 0, 0)
					v_u_59.Ticks.MoodLine.Visible = false
					v_u_59.Bar.UIGradient.Enabled = false
					for _, v330 in v_u_59.Ticks:GetChildren() do
						v330.Visible = true
					end
					if v_u_35 then
						v_u_35:Disconnect()
						v_u_35 = nil
					end
					coroutine.resume(coroutine.create(function()
						-- upvalues: (ref) v_u_52, (ref) v_u_35, (copy) p_u_172, (ref) v_u_53, (ref) v_u_59
						local v_u_331 = v_u_52:WaitForChild("Rage")
						if not v_u_35 then
							v_u_35 = v_u_331.Changed:Connect(function()
								-- upvalues: (ref) p_u_172, (copy) v_u_331, (ref) v_u_53, (ref) v_u_59
								if p_u_172:GetAttribute("Awakened") then
									v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", "TigerAwakened")
								elseif v_u_331.Value >= 100 then
									v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", "TigerAwakened")
								elseif v_u_331.Value >= 75 then
									v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", true)
								else
									v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", false)
								end
								v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_331.Value / 100, 0, 0.2, 0)
								v_u_59.Bar.Size = UDim2.new(v_u_331.Value / 100, 0, 0.2, 0)
							end)
							v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_331.Value / 100, 0, 0.2, 0)
							v_u_59.Bar.Size = UDim2.new(v_u_331.Value / 100, 0, 0.2, 0)
						end
					end))
				elseif v264 == "Control-Control" then
					v_u_53.Skills.Rage.TextColor3 = Color3.new(1, 1, 1)
					v_u_53.Skills.Rage.Bar.UIGradient.Enabled = false
					for _, v332 in pairs(v_u_53.Skills.Rage.Ticks:GetChildren()) do
						v332.Visible = true
					end
					v_u_53.Skills.Rage.Ticks.MoodLine.Visible = false
					v_u_53.Skills.Rage.Text = ""
					v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(0.721569, 0.160784, 1)
					v_u_59.Text = ""
					v_u_59.Bar.BackgroundColor3 = Color3.new(0.721569, 0.160784, 1)
					v_u_59.Ticks.MoodLine.Visible = false
					v_u_59.Bar.UIGradient.Enabled = false
					for _, v333 in v_u_59.Ticks:GetChildren() do
						v333.Visible = true
					end
					if v_u_35 then
						v_u_35:Disconnect()
						v_u_35 = nil
					end
					coroutine.resume(coroutine.create(function()
						-- upvalues: (ref) v_u_52, (ref) v_u_35, (ref) v_u_53, (ref) v_u_59
						local v_u_334 = v_u_52:WaitForChild("ControlModeProxy")
						local v_u_335 = v_u_52:WaitForChild("Rage")
						if not v_u_35 then
							v_u_35 = game:GetService("RunService").Heartbeat:Connect(function()
								-- upvalues: (ref) v_u_52, (ref) v_u_53, (copy) v_u_334, (ref) v_u_59, (copy) v_u_335
								if v_u_52:FindFirstChild("__Room") then
									v_u_53.Skills.Rage.Text = "Mode: " .. v_u_334.Value
									v_u_53.Skills.Rage.Visible = true
									v_u_59.Text = "Mode: " .. v_u_334.Value
								else
									v_u_53.Skills.Rage.Text = ""
									v_u_53.Skills.Rage.Visible = false
									v_u_59.Text = ""
								end
								v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_335.Value / 100, 0, 0.2, 0)
								v_u_59.Bar.Size = UDim2.new(v_u_335.Value / 100, 0, 0.2, 0)
							end)
							v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_335.Value / 100, 0, 0.2, 0)
							v_u_59.Bar.Size = UDim2.new(v_u_335.Value / 100, 0, 0.2, 0)
						end
					end))
				elseif v264 == "Pain-Pain" then
					v_u_53.Skills.Rage.TextColor3 = Color3.new(1, 1, 1)
					v_u_53.Skills.Rage.Bar.UIGradient.Enabled = false
					for _, v336 in pairs(v_u_53.Skills.Rage.Ticks:GetChildren()) do
						v336.Visible = true
					end
					v_u_53.Skills.Rage.Ticks.MoodLine.Visible = false
					v_u_53.Skills.Rage.Text = "Pain Meter"
					v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(0.847059, 0, 0.0156863)
					v_u_59.Text = "Pain Meter"
					v_u_59.Bar.BackgroundColor3 = Color3.new(0.847059, 0, 0.0156863)
					v_u_59.Ticks.MoodLine.Visible = false
					v_u_59.Bar.UIGradient.Enabled = false
					for _, v337 in v_u_59.Ticks:GetChildren() do
						v337.Visible = true
					end
					if v_u_35 then
						v_u_35:Disconnect()
						v_u_35 = nil
					end
					if v_u_39 then
						v_u_39:Disconnect()
						v_u_39 = nil
					end
					local v_u_338 = v_u_52:GetAttribute("PainLastStandClientApplied")
					local function v_u_355(p339)
						-- upvalues: (ref) v_u_338, (ref) v_u_52, (ref) v_u_39, (ref) v_u_35, (ref) v_u_53, (ref) v_u_59, (ref) v_u_1
						if not v_u_338 then
							v_u_338 = true
							v_u_52:SetAttribute("PainLastStandClientApplied", true)
							if v_u_39 then
								v_u_39:Disconnect()
								v_u_39 = nil
							end
							if v_u_35 then
								v_u_35:Disconnect()
								v_u_35 = nil
							end
							task.wait()
							local v340 = p339:GetAttribute("Duration") and (p339:GetAttribute("Duration") or 20) or 20
							local v341 = workspace:GetServerTimeNow() - p339:GetAttribute("Timestamp")
							local v342 = math.min(v340, v341)
							local v343 = task.delay
							local v344 = 0.3 - v342
							v343(math.max(0, v344), function()
								-- upvalues: (ref) v_u_52, (ref) v_u_53
								if v_u_52:FindFirstChild("Pain-Pain") then
									v_u_53.Skills.BackgroundColor3 = Color3.fromRGB(115, 7, 7)
									v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", "Pain")
								end
							end)
							v_u_53.Skills.Rage.Bar.Size = UDim2.new(1 - v342 / v340, 0, 0.2, 0)
							v_u_59.Bar.Size = UDim2.new(1 - v342 / v340, 0, 0.2, 0)
							local v345 = v_u_1
							local v346 = v_u_53.Skills.Rage.Bar
							local v347 = TweenInfo.new
							local v348 = v340 - v342
							local v_u_349 = v345:Create(v346, v347((math.max(0.1, v348))), {
								["Size"] = UDim2.new(0, 0, 0.2, 0)
							})
							v_u_349:Play()
							local v350 = v_u_1
							local v351 = v_u_59.Bar
							local v352 = TweenInfo.new
							local v353 = v340 - v342
							local v_u_354 = v350:Create(v351, v352((math.max(0.1, v353))), {
								["Size"] = UDim2.new(0, 0, 0.2, 0)
							})
							v_u_354:Play()
							task.wait()
							p339.AncestryChanged:Once(function()
								-- upvalues: (ref) v_u_53, (copy) v_u_349, (copy) v_u_354
								v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", false)
								v_u_53.Skills.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
								v_u_349:Cancel()
								v_u_354:Cancel()
							end)
						end
					end
					if not v_u_338 then
						local v356 = v_u_52:FindFirstChild("PainTransformed")
						if v356 then
							task.defer(v_u_355, v356)
						else
							v_u_39 = v_u_52.ChildAdded:Connect(function(p357)
								-- upvalues: (copy) v_u_355
								if p357.Name == "PainTransformed" then
									v_u_355(p357)
								end
							end)
							coroutine.resume(coroutine.create(function()
								-- upvalues: (ref) v_u_52, (ref) v_u_35, (ref) v_u_53, (ref) v_u_59, (ref) v_u_50
								local v_u_358 = v_u_52:WaitForChild("Rage")
								if not v_u_35 then
									v_u_35 = v_u_358.Changed:Connect(function()
										-- upvalues: (ref) v_u_53, (copy) v_u_358, (ref) v_u_59, (ref) v_u_50
										v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_358.Value / 100, 0, 0.2, 0)
										v_u_59.Bar.Size = UDim2.new(v_u_358.Value / 100, 0, 0.2, 0)
										if v_u_358.Value >= 100 or v_u_50.Character:GetAttribute("PainAura") and v_u_358.Value > 0 then
											v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", "Pain")
										elseif v_u_358.Value <= 0 then
											v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", false)
										end
									end)
									v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_358.Value / 100, 0, 0.2, 0)
									v_u_59.Bar.Size = UDim2.new(v_u_358.Value / 100, 0, 0.2, 0)
								end
							end))
						end
					end
				else
					v_u_53.Skills.Rage.TextColor3 = Color3.new(1, 1, 1)
					v_u_59.TextColor3 = Color3.new(1, 1, 1)
					if v264 == "Shadow-Shadow" then
						v_u_53.Skills.Rage.Text = "Umbra Meter"
						v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(0.33, 0, 1)
						v_u_59.Text = "Umbra Meter"
						v_u_59.Bar.BackgroundColor3 = Color3.new(0.33, 0, 1)
					elseif v264 == "Gas-Gas" then
						v_u_53.Skills.Rage.Text = "Gas Meter"
						v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(0.811765, 0.482353, 1)
						v_u_59.Text = "Gas Meter"
						v_u_59.Bar.BackgroundColor3 = Color3.new(0.811765, 0.482353, 1)
					elseif v264 == "Sound-Sound" then
						v_u_53.Skills.Rage.Text = "Tempo Meter"
						v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(1, 1, 1)
						v_u_59.Text = "Tempo Meter"
						v_u_59.Bar.BackgroundColor3 = Color3.new(1, 1, 1)
						task.spawn(function()
							-- upvalues: (copy) p_u_172, (ref) v_u_53, (ref) v_u_59
							local v_u_359 = p_u_172:WaitForChild("MaxTempoActive", 10)
							if v_u_359 then
								v_u_359.Changed:Connect(function()
									-- upvalues: (ref) v_u_53, (copy) v_u_359, (ref) v_u_59
									v_u_53.Skills.Rage.Bar.BackgroundColor3 = v_u_359.Value and Color3.new(1, 0.9, 0.1) or Color3.new(1, 1, 1)
									v_u_59.Bar.BackgroundColor3 = v_u_359.Value and Color3.new(1, 0.9, 0.1) or Color3.new(1, 1, 1)
								end)
							end
						end)
					else
						v_u_53.Skills.Rage.Text = "Fury Meter"
						v_u_53.Skills.Rage.Bar.BackgroundColor3 = Color3.new(1, 0, 0)
						v_u_59.Text = "Fury Meter"
						v_u_59.Bar.BackgroundColor3 = Color3.new(1, 0, 0)
					end
					if v_u_35 then
						v_u_35:Disconnect()
						v_u_35 = nil
					end
					if v_u_36 then
						v_u_36:Disconnect()
						v_u_36 = nil
					end
					task.defer(function()
						-- upvalues: (ref) v_u_52, (ref) v_u_35, (ref) v_u_53, (ref) v_u_59
						local v_u_360 = v_u_52:WaitForChild("Rage")
						if not v_u_35 then
							v_u_35 = v_u_360.Changed:Connect(function()
								-- upvalues: (ref) v_u_53, (copy) v_u_360, (ref) v_u_59
								v_u_53.Skills.Rage.Bar.Size = UDim2.fromScale(v_u_360.Value / 100, 0.2)
								v_u_59.Bar.Size = UDim2.fromScale(v_u_360.Value / 100, 0.2)
							end)
							v_u_53.Skills.Rage.Bar.Size = UDim2.new(v_u_360.Value / 100, 0, 0.2, 0)
							v_u_59.Bar.Size = UDim2.fromScale(v_u_360.Value / 100, 0.2)
						end
					end)
				end
				if v_u_267 then
					v_u_53.Skills.Rage.Visible = false
					v_u_59.Visible = false
				else
					v_u_53.Skills.Rage.Visible = not v_u_178
					v_u_59.Visible = v_u_178
				end
			else
				v_u_53.Skills.Rage.Visible = false
				v_u_59.Visible = false
			end
			if v_u_52:GetAttribute("PainLastStandClientApplied") and v264 == "Pain-Pain" then
				v_u_53.Skills.Rage.Fire:SetAttribute("ParticleEnabled", "Pain")
				v_u_53.Skills.BackgroundColor3 = Color3.fromRGB(115, 7, 7)
			else
				v_u_53.Skills.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			end
			local v361 = 0.937 - #v_u_175 * 0.2 * 0.42
			v_u_53.Skills.Position = UDim2.new(0.83, -10, v361, -10)
			local v362 = v_u_53.Skills.Title
			local v363 = string.upper
			if v264 == "" then
				v264 = "Fruitless"
			else
				local v364 = v264:match("^Permanent %a+%-%a+") and "Permanent " or ""
				local v365 = string.match(v264, "(((%u)%-?)([^-.]+))$")
				if v365 then
					v264 = v364 .. v365
				end
			end
			v362.Text = v363(v264)
			v_u_188.Visible = true
			v_u_53.MobileMasteryLevel.Visible = v_u_178
			if not v_u_178 then
				v_u_53.Skills.Visible = true
			end
		else
			_G.TestGamePrint("No tool data, can\'t setup skills")
		end
	end
	local v_u_366 = v_u_53.HUDButtonBar.HomeButton
	local function v371()
		-- upvalues: (copy) v_u_30, (copy) v_u_366, (copy) v_u_60
		v_u_30.reportActivity("HUD/Button/Home")
		if v_u_366.ImageColor3 == Color3.fromRGB(255, 255, 255) then
			v_u_366.ImageColor3 = Color3.fromRGB(134, 134, 134)
			v_u_366.ImageTransparency = 0.5
			local v367 = v_u_60.CommF_:InvokeServer("TeleportToSpawn")
			if v367 then
				repeat
					task.wait(0.1)
					local v368 = v_u_366.Notify
					local v369 = v367 - workspace:GetServerTimeNow()
					v368.Text = math.floor(v369)
					local v370 = v367 - workspace:GetServerTimeNow()
				until math.floor(v370) <= 0
				v_u_366.Notify.Text = ""
			end
			v_u_366.ImageColor3 = Color3.fromRGB(255, 255, 255)
			v_u_366.ImageTransparency = 0
		end
	end
	v_u_366.Activated:Connect(v371)
	game.ReplicatedStorage.Events.ActivateHomeButton.Event:Connect(v371)
	v_u_164 = function(p372)
		-- upvalues: (copy) v_u_72, (copy) v_u_75, (ref) v_u_114, (copy) v_u_29, (ref) v_u_35
		local v373 = v_u_72[p372.Name]
		if v373 then
			if not (p372:FindFirstChild("Level") and p372:FindFirstChild("Exp")) then
				task.wait()
			end
			if v_u_75:IsNewUIEnabled() then
				v_u_75:CreateSkillContextButtons(p372)
			end
			v_u_114(p372, v373[1], v373[2])
		end
		local v374 = v_u_29.IsEnabled and v_u_29.JobTools.Info.GetInfo(p372)
		if v374 then
			if v_u_35 then
				v_u_35:Disconnect()
				v_u_35 = nil
			end
			v_u_29.JobTools.SkillsInterface.setupJobToolSkills(p372, v374)
		end
	end
	local function v380(p375)
		-- upvalues: (copy) v_u_76, (copy) v_u_2, (ref) v_u_35, (ref) v_u_156, (copy) v_u_50, (ref) v_u_157, (ref) v_u_158, (ref) v_u_52, (ref) v_u_154, (ref) v_u_155, (copy) v_u_53, (copy) v_u_59, (copy) v_u_55, (ref) v_u_164, (copy) v_u_75
		if p375 then
			if v_u_76() then
				v_u_2.TouchControlsEnabled = true
			end
			require(script.Parent.Shared).reflectHUDButtonVisibility()
			if v_u_35 then
				v_u_35:Disconnect()
				v_u_35 = nil
			end
			v_u_156 = v_u_50:WaitForChild("Data")
			v_u_157 = v_u_156:WaitForChild("Beli")
			v_u_158 = v_u_156:WaitForChild("Fragments")
			v_u_52 = p375
			if v_u_52:IsDescendantOf(workspace) then
				v_u_154 = v_u_52:WaitForChild("Humanoid")
				v_u_155 = v_u_52:WaitForChild("Energy")
				v_u_53.Skills.Visible = false
				v_u_59.Visible = false
				v_u_53.Timer.Visible = false
				v_u_55.Visible = false
				for _, v376 in v_u_53.Skills:GetChildren() do
					if v376:IsA("Frame") and v376.Name ~= "Container" then
						v376:Destroy()
					end
				end
				v_u_52.ChildAdded:Connect(function(p_u_377)
					-- upvalues: (ref) v_u_164, (ref) v_u_75
					if p_u_377:IsA("Tool") then
						_G.MyCurrentTool = p_u_377
						v_u_164(p_u_377)
						p_u_377.ChildAdded:Connect(function(p378)
							-- upvalues: (ref) v_u_75, (ref) v_u_164, (copy) p_u_377
							if p378.Name == "AwakenedMoves" then
								v_u_75:UnbindSkillContextButtons()
								v_u_164(p_u_377)
							end
						end)
					end
				end)
				v_u_52.ChildRemoved:Connect(function(p379)
					-- upvalues: (ref) v_u_53, (ref) v_u_59, (ref) v_u_52
					if p379:IsA("Tool") then
						if p379.Parent then
							_G.MyCurrentTool = nil
							v_u_53.Skills.Visible = false
							v_u_53.MobileMasteryLevel.Visible = false
							v_u_59.Visible = false
							return
						end
						task.wait()
						if not (p379.Parent or v_u_52:FindFirstChildOfClass("Tool")) then
							v_u_53.Skills.Visible = false
							v_u_53.MobileMasteryLevel.Visible = false
							v_u_59.Visible = false
						end
					end
				end)
				v_u_52:GetPropertyChangedSignal("Parent"):Connect(function()
					-- upvalues: (ref) v_u_75
					v_u_75:UnbindSkillContextButtons()
				end)
			end
		else
			return
		end
	end
	v_u_50.CharacterAdded:Connect(v380)
	v380(v_u_50.Character)
	local v_u_381 = require(game.ReplicatedStorage:WaitForChild("EXPFunction"))
	local v_u_382 = require(game.ReplicatedStorage:WaitForChild("MasteryEXPFunction"))
	v_u_382(600)
	local v_u_383 = v_u_382(599)
	function _G.secondsToTime(p384)
		local v385 = math.floor
		return string.format("%d:%02d:%02d:%02d", v385(p384 / 86400), v385(p384 % 86400 / 3600), v385(p384 % 3600 / 60), (v385(p384 % 60)))
	end
	local v_u_386 = v_u_53:WaitForChild("HP")
	local v_u_387 = v_u_53:WaitForChild("Energy")
	local v_u_388 = v_u_53:WaitForChild("RaceEnergy")
	local v_u_389 = v_u_53:WaitForChild("Beli")
	v_u_389.Text = "$" .. v_u_77.commaValue(v_u_157.Value)
	v_u_157.Changed:Connect(function()
		-- upvalues: (copy) v_u_389, (copy) v_u_77, (ref) v_u_157
		v_u_389.Text = "$" .. v_u_77.commaValue(v_u_157.Value)
	end)
	local v390 = v_u_2:IsTenFootInterface()
	if v390 then
		v390 = v_u_103.GamepadEnabled
	end
	if v390 then
		local v391 = v_u_53:WaitForChild("Timer")
		v391.Position = UDim2.new(0, 6, 0.06, 5)
		v391.TextXAlignment = "Left"
	end
	local v_u_392 = v_u_103.TouchEnabled
	local v_u_393 = v_u_53:WaitForChild("Fragments")
	v_u_158.Changed:Connect(function()
		-- upvalues: (ref) v_u_392, (ref) v_u_158, (copy) v_u_393, (copy) v_u_77
		if v_u_392 then
			if v_u_158.Value <= 0 then
				v_u_393.Text = ""
			else
				v_u_393.Text = "\198\146" .. v_u_77.commaValue(v_u_158.Value)
			end
		else
			return
		end
	end)
	if v_u_392 then
		if v_u_158.Value > 0 or not v_u_31 then
			v_u_393.Text = "\198\146" .. v_u_77.commaValue(v_u_158.Value)
		else
			v_u_393.Text = ""
		end
	else
		local function v394()
			-- upvalues: (ref) v_u_392, (ref) v_u_158, (copy) v_u_31, (copy) v_u_393, (copy) v_u_77, (copy) v_u_389
			v_u_392 = true
			if v_u_158.Value > 0 or not v_u_31 then
				v_u_393.Text = "\198\146" .. v_u_77.commaValue(v_u_158.Value)
				v_u_389.Visible = false
			else
				v_u_393.Text = ""
			end
		end
		v_u_393.MouseEnter:Connect(v394)
		local function v395()
			-- upvalues: (ref) v_u_392, (copy) v_u_393, (copy) v_u_389
			v_u_392 = false
			v_u_393.Text = ""
			v_u_389.Visible = true
		end
		v_u_393.MouseLeave:Connect(v395)
	end
	local v_u_396 = v_u_53:WaitForChild("MenuButton")
	local v_u_397 = v64.new(v_u_53)
	_G.dmgCounter = v_u_397
	v_u_397:Start()
	v_u_60:WaitForChild("Combo").OnClientEvent:Connect(function(p398)
		-- upvalues: (copy) v_u_397
		v_u_397:Increment(p398)
	end)
	local v_u_399 = game:GetService("CollectionService")
	local v_u_400 = v_u_53:WaitForChild("Shop")
	local v_u_401 = v_u_400:WaitForChild("MenuShop"):WaitForChild("ScrollingFrame")
	local v_u_402 = false
	local v_u_403 = false
	local v_u_404 = false
	local v_u_405 = false
	local v_u_406 = false
	local v_u_407 = false
	local v_u_408 = v_u_53:WaitForChild("InventoryContainer")
	local v_u_409 = Instance.new("NumberValue")
	local v_u_410 = Instance.new("NumberValue")
	v_u_410.Value = 1
	Instance.new("NumberValue").Value = 1
	local v_u_411 = 0
	local v_u_412 = 1
	local v_u_413 = 1
	local v_u_434 = (function()
		local v414 = {}
		local v_u_415 = {}
		local v_u_416 = require(game.ReplicatedStorage.Modules.Util.Signal).new()
		function v414.new(p417, p418)
			-- upvalues: (copy) v_u_415, (copy) v_u_416
			local v419 = v_u_415[p417] == nil
			assert(v419)
			local v420 = p418 or {}
			local v421 = v420.Min
			local v_u_431 = {
				["_Group"] = p417,
				["_Min"] = v421,
				["_Max"] = v420.Max - 1,
				["_Clamped"] = v421,
				["_Denote"] = v420.Denote,
				["_Raw"] = v421,
				["_String"] = tostring(v421),
				["Get"] = function(_)
					-- upvalues: (copy) v_u_431
					return v_u_431
				end,
				["Increment"] = function(_, p422)
					-- upvalues: (copy) v_u_431, (ref) v_u_416
					local v423 = p422 + v_u_431._Raw
					if v_u_431._Raw ~= v423 then
						local v424 = v_u_431._Min
						local v425 = v_u_431._Max
						local v426 = math.clamp(v423, v424, v425)
						v_u_431._String = v426 == v_u_431._Max and ("%*%*"):format(v426, v_u_431._Denote) or tostring(v426)
						v_u_431._Clamped = v426
						v_u_431._Raw = v423
						v_u_416:Fire(v_u_431)
					end
				end,
				["Set"] = function(_, p427)
					-- upvalues: (copy) v_u_431, (ref) v_u_416
					if v_u_431._Raw ~= p427 then
						local v428 = v_u_431._Min
						local v429 = v_u_431._Max
						local v430 = math.clamp(p427, v428, v429)
						v_u_431._String = v430 == v_u_431._Max and ("%*%*"):format(v430, v_u_431._Denote) or tostring(v430)
						v_u_431._Clamped = v430
						v_u_431._Raw = p427
						v_u_416:Fire(v_u_431)
					end
				end
			}
			return v_u_431
		end
		function v414.Connect(_, p432)
			-- upvalues: (copy) v_u_416
			return v_u_416:Connect(p432)
		end
		function v414.GetBadge(_, p433)
			-- upvalues: (copy) v_u_415
			return v_u_415[p433]
		end
		function v414.GetAllBadges(_)
			-- upvalues: (copy) v_u_415
			return v_u_415
		end
		return v414
	end)()
	local v_u_435 = v_u_434.new("Gifts")
	function ApplyHpBar()
		-- upvalues: (copy) v_u_409, (copy) v_u_386, (copy) v_u_410
		local v436 = v_u_409.Value + 1
		local v437 = math.max(1, v436)
		local v438, v439
		if v437 > 1 then
			local v440 = v_u_386.AbsoluteSize.X * (v_u_409.Value + v_u_410.Value) / v437 + 0.5
			local v441 = math.floor(v440)
			local v442 = v_u_410.Value / (v_u_410.Value + v_u_409.Value) * v441
			v438 = math.floor(v442)
			v439 = v441 - v438
		else
			local v443 = v_u_386.AbsoluteSize.X * v_u_410.Value + 0.5
			v438 = math.floor(v443)
			local v444 = v_u_386.AbsoluteSize.X * v_u_409.Value + 0.5
			v439 = math.floor(v444)
		end
		v_u_386.Fill.Size = UDim2.new(0, v438, 1, 0)
		if v_u_409.Value > 0 then
			v_u_386.OverFill.Visible = true
			v_u_386.OverFill.Size = UDim2.new(0, v439, 1, 0)
			v_u_386.OverFill.Position = UDim2.fromOffset(v438, 0)
		else
			v_u_386.OverFill.Visible = false
		end
	end
	v_u_409.Changed:Connect(ApplyHpBar)
	v_u_410.Changed:Connect(ApplyHpBar)
	local v_u_445 = script.Parent.DodgeNotifier.TextLabel
	local v_u_446 = Instance.new("NumberValue")
	local v_u_447 = Instance.new("BoolValue")
	v_u_446.Changed:Connect(function(p448)
		-- upvalues: (copy) v_u_445, (copy) v_u_447
		local v449 = v_u_445
		local v450 = p448 * 100
		v449.Text = math.floor(v450)
		local v451 = v_u_445.Shadow
		local v452 = p448 * 100
		v451.Text = math.floor(v452)
		local v453 = 216 * (1 - p448)
		if p448 >= 1 then
			v453 = 360 - 73 * (p448 - 1) * 2
			v_u_447.Value = true
			v_u_445.Shadow.TextStrokeColor3 = Color3.fromHSV(v453 / 360, 1, 1)
			v_u_445.Shadow.TextStrokeTransparency = 0.7
			v_u_445.TextTransparency = 1
		else
			v_u_447.Value = false
			v_u_445.Shadow.TextStrokeColor3 = Color3.new(0, 0, 0)
			v_u_445.Shadow.TextStrokeTransparency = 1
			v_u_445.TextTransparency = 0.6
		end
		local v454 = v_u_445.Shadow
		local v455 = Color3.fromHSV
		local v456 = v453 / 360
		local v457 = p448 * 0.3 + 0.7
		v454.TextColor3 = v455(v456, math.min(v457, 1), 1)
	end)
	function evalNS(p458, p459)
		if p459 == 0 then
			return p458.Keypoints[1].Value
		end
		if p459 == 1 then
			return p458.Keypoints[#p458.Keypoints].Value
		end
		for v460 = 1, #p458.Keypoints - 1 do
			local v461 = p458.Keypoints[v460]
			local v462 = p458.Keypoints[v460 + 1]
			if v461.Time <= p459 and p459 < v462.Time then
				local v463 = (p459 - v461.Time) / (v462.Time - v461.Time)
				return (v462.Value - v461.Value) * v463 + v461.Value
			end
		end
	end
	local v_u_464 = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.144, 0),
		NumberSequenceKeypoint.new(0.298, 1),
		NumberSequenceKeypoint.new(0.454, 0),
		NumberSequenceKeypoint.new(0.6, 1),
		NumberSequenceKeypoint.new(0.698, 0.256),
		NumberSequenceKeypoint.new(0.799, 0),
		NumberSequenceKeypoint.new(1, 1)
	})
	local v_u_465 = {}
	local v_u_466 = {}
	local v_u_467 = { "rbxassetid://7043414509", "rbxassetid://7043414587", "rbxassetid://7043414735" }
	function Emit(p468)
		-- upvalues: (copy) v_u_465, (copy) v_u_445, (ref) v_u_466
		local v469 = v_u_465[1]
		if v469 then
			table.remove(v_u_465, 1)
		else
			v469 = Instance.new("ImageLabel")
			v469.BackgroundTransparency = 1
			v469.AnchorPoint = Vector2.new(0.5, 0.5)
			v469.SizeConstraint = Enum.SizeConstraint.RelativeXX
			v469.Parent = v_u_445
		end
		local v470 = 1 + 0.3 * math.random()
		local _ = 1 + 0.3 * math.random()
		v469.Size = UDim2.fromScale(v470, v470)
		v469.Image = p468
		v469.Position = UDim2.fromScale(math.random() * 0.2 + 0.3, math.random() * 0.2 + 0.3)
		v469.Rotation = math.random() * 720 - 360
		v469.ImageTransparency = 1
		local v471 = v_u_466
		local v472 = { v469, os.clock(), 0.125 * math.random() + 0.075 }
		table.insert(v471, v472)
	end
	v_u_447.Changed:Connect(function()
		-- upvalues: (copy) v_u_447, (ref) v_u_466, (copy) v_u_465, (copy) v_u_467, (copy) v_u_445, (copy) v_u_464
		if v_u_447.Value then
			local v_u_473 = { os.clock() + math.random() * 0.5 + 0.75, os.clock() + math.random() * 0.5 + 0.75 }
			game:GetService("RunService"):BindToRenderStep("RageParticleGui", 1000, function(_)
				-- upvalues: (copy) v_u_473, (ref) v_u_467, (ref) v_u_466, (ref) v_u_445, (ref) v_u_464, (ref) v_u_465
				for v474, v475 in pairs(v_u_473) do
					if v475 < os.clock() then
						Emit(v_u_467[v474])
						v_u_473[v474] = os.clock() + math.random() * 0.5 + 0.75
					end
				end
				local v476 = {}
				for _, v477 in pairs(v_u_466) do
					local v478 = (os.clock() - v477[2]) / v477[3]
					local v479 = math.min(v478, 1)
					v477[1].ImageColor3 = v_u_445.Shadow.TextColor3
					v477[1].ImageTransparency = evalNS(v_u_464, v479)
					if v479 == 1 then
						local v480 = v_u_465
						local v481 = v477[1]
						table.insert(v480, v481)
					else
						table.insert(v476, v477)
					end
				end
				v_u_466 = v476
			end)
		else
			game:GetService("RunService"):UnbindFromRenderStep("RageParticleGui")
			for _, v482 in pairs(v_u_466) do
				v482[1].ImageTransparency = 1
				local v483 = v_u_465
				local v484 = v482[1]
				table.insert(v483, v484)
			end
		end
	end)
	local v_u_485 = 0
	game:GetService("RunService"):BindToRenderStep("Bars", 10000, function(_)
		-- upvalues: (ref) v_u_154, (ref) v_u_155, (ref) v_u_485, (copy) v_u_1, (copy) v_u_446, (ref) v_u_411, (copy) v_u_409, (ref) v_u_412, (copy) v_u_410, (ref) v_u_413, (copy) v_u_387, (copy) v_u_388, (copy) v_u_386, (copy) v_u_397, (ref) v_u_156, (copy) v_u_381, (copy) v_u_4, (copy) v_u_53, (copy) v_u_49, (copy) v_u_77, (copy) v_u_62, (ref) v_u_52, (copy) v_u_383, (copy) v_u_382, (copy) v_u_399, (copy) v_u_50, (ref) v_u_402, (copy) v_u_435, (copy) v_u_408, (copy) v_u_396
		if v_u_154 and v_u_154.Parent then
			local v486 = v_u_155.Value / v_u_155.MaxValue
			local v487 = v_u_154.Parent:GetAttribute("OverflowHP") or 0
			script.Parent.DodgeNotifier.Visible = false
			if v_u_154:GetAttribute("SoruCharges") then
				script.Parent.DodgeNotifier.Visible = true
				script.Parent.DodgeNotifier.Fill.Visible = true
				local v488 = v_u_154:GetAttribute("SoruCharges")
				local _ = v488 * 0.333
				local v489 = script.Parent.DodgeNotifier.Fill.UIGradient
				if v488 == 0 then
					v489.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(1, 0.3) })
					v489.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0)) })
				elseif v488 == 3 then
					v489.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0) })
					v489.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)) })
				else
					v489.Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(v488 / 3, 0),
						NumberSequenceKeypoint.new(v488 / 3 + 0.001, 0.3),
						NumberSequenceKeypoint.new(1, 0.3)
					})
					v489.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(v488 / 3, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(v488 / 3 + 0.001, Color3.new(0, 0, 0)),
						ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
					})
				end
			else
				script.Parent.DodgeNotifier.Fill.Visible = false
			end
			if v_u_154:GetAttribute("RagePercentage") then
				script.Parent.DodgeNotifier.Visible = true
				script.Parent.DodgeNotifier.TextLabel.Visible = true
				if v_u_485 ~= v_u_154:GetAttribute("RagePercentage") then
					v_u_1:Create(v_u_446, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						["Value"] = v_u_154:GetAttribute("RagePercentage")
					}):Play()
					v_u_485 = v_u_154:GetAttribute("RagePercentage")
				end
			else
				script.Parent.DodgeNotifier.TextLabel.Visible = false
				v_u_446.Value = 0
			end
			if v487 / v_u_154.MaxHealth ~= v_u_411 and v_u_154.MaxHealth ~= (1 / 0) then
				v_u_411 = v487 / v_u_154.MaxHealth
				v_u_1:Create(v_u_409, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					["Value"] = v487 / v_u_154.MaxHealth
				}):Play()
			end
			if v_u_154.Health / v_u_154.MaxHealth ~= v_u_412 and v_u_154.MaxHealth ~= (1 / 0) then
				v_u_412 = v_u_154.Health / v_u_154.MaxHealth
				v_u_1:Create(v_u_410, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					["Value"] = v_u_154.Health / v_u_154.MaxHealth
				}):Play()
			end
			if v_u_413 ~= v486 then
				v_u_387.Fill:TweenSize(UDim2.new(v486, 0, 1, 0), "Out", "Linear", 0.3, true)
				v_u_413 = v486
			end
			if v_u_154.Parent then
				if v_u_154.Parent:FindFirstChild("RaceEnergy") then
					v_u_388.Visible = true
					local v490 = v_u_154.Parent.RaceEnergy.Value
					local v491 = math.clamp(v490, 0, 1)
					v_u_388.Fill:TweenSize(UDim2.fromScale(v491, 1), "Out", "Linear", 0.3, true)
					v_u_388.Missing:TweenSize(UDim2.new(1 - v491, 2, 1.2, 0), "Out", "Linear", 0.3, true)
				else
					v_u_388.Visible = false
				end
				local v492 = os.clock() % 3 / 3
				if v_u_154.Parent:FindFirstChild("RaceTransformed") then
					if v_u_154.Parent.RaceTransformed.Value then
						v_u_388.Fill.BackgroundColor3 = Color3.fromHSV(v492, 1, 1)
						v_u_388.BorderColor3 = Color3.fromHSV(v492, 1, 1)
					else
						v_u_388.Fill.BackgroundColor3 = Color3.new(1, 0, 0)
						v_u_388.BorderColor3 = Color3.fromHSV(0, 0, 0)
					end
				else
					v_u_388.Fill.BackgroundColor3 = Color3.new(1, 0, 0)
					v_u_388.BorderColor3 = Color3.fromHSV(0, 0, 0)
				end
			else
				v_u_388.Fill.BackgroundColor3 = Color3.new(1, 0, 0)
				v_u_388.BorderColor3 = Color3.fromHSV(0, 0, 0)
			end
			local v493 = v_u_386.TextLabel
			local v494 = v_u_154.Health - 0.5
			local v495 = math.ceil(v494)
			local v496 = math.abs(v495)
			local v497 = v_u_154.MaxHealth - 0.5
			v493.Text = "Health " .. v496 .. "/" .. math.ceil(v497)
			local v498 = v_u_387.TextLabel
			local v499 = v_u_155.Value - 0.5
			local v500 = math.ceil(v499)
			local v501 = math.abs(v500)
			local v502 = v_u_155.MaxValue - 0.5
			v498.Text = "Energy " .. v501 .. "/" .. math.ceil(v502)
			v_u_397.MaxNumber = v_u_156.Level.Value * 6
			local v503 = v_u_381(v_u_156.Level.Value)
			if v_u_4 then
				v_u_53.Level.Text = "Lv. " .. v_u_156.Level.Value .. (v_u_49 <= v_u_156.Level.Value and " (MAX)" or "")
				v_u_53.Level.Bar.Visible = false
				v_u_53.Level.Exp.Visible = false
			else
				v_u_53.Level.Text = "Lv. " .. v_u_156.Level.Value .. (v_u_49 <= v_u_156.Level.Value and " (MAX)" or "")
				local v504 = v_u_53.Level.Bar
				local v505 = UDim2.new
				local v506 = v_u_156.Exp.Value / v503
				v504.Size = v505(math.min(1, v506), 0, 0.2, 0)
				v_u_53.Level.Exp.Text = v_u_77.commaValue(v_u_156.Exp.Value) .. "/" .. v_u_77.commaValue(v503)
			end
			if _G.ServerData and _G.ServerData.ExpBoost > 0 then
				local v507 = _G.ServerData.ExpBoost - (tick() - _G.ServerData.ExpBoostTick)
				if v507 <= 0 then
					if _G.ServerData.ExpBoost > 0 then
						v_u_62.new("<Color=Purple>Your 2x EXP has ended!<Color=/>", 10):Display()
						v_u_62.new("<Color=Purple>Open the shop to buy more.<Color=/>", 10):Display()
					end
					_G.ServerData.ExpBoost = 0
				else
					local v508 = v_u_53.Level.Exp
					local v509 = v_u_53.Level.Exp.Text
					local v510 = math.floor
					v508.Text = v509 .. " (2x ends in " .. string.format("%d:%02d:%02d:%02d", v510(v507 / 86400), v510(v507 % 86400 / 3600), v510(v507 % 3600 / 60), (v510(v507 % 60))) .. ")"
				end
			end
			local v511 = v_u_52:FindFirstChildOfClass("Tool")
			local v512, v513
			if v511 and v_u_53.Skills:FindFirstChild(v511.Name) then
				v512 = v511:GetAttribute("Level") or v511.Level.Value
				v513 = v511.ToolTip
				local _ = v_u_53.Skills[v511.Name]
				local v514 = v511:GetAttribute("Exp") or v511.Exp.Value
				local v515
				if v512 >= 600 then
					v514 = v_u_383
					v515 = v514
				else
					v515 = v_u_382(v512)
				end
				local v516 = v_u_399:HasTag(v_u_50, "DoubleMastery")
				for _, v517 in { v_u_53.Skills.Level, v_u_53.MobileMasteryLevel } do
					v517.Text = "Mastery " .. v512 .. (v512 >= 600 and " (MAX)" or "")
					local v518 = v517.Bar
					local v519 = UDim2.fromScale
					local v520 = v514 / v515
					v518.Size = v519(math.min(1, v520), 0.2)
					v517.Exp.Text = v_u_77.commaValue(v514) .. "/" .. v_u_77.commaValue(v515) .. (v516 and " (2x)" or "")
				end
			else
				v513 = nil
				v512 = 0
			end
			if v_u_402 then
				local v521 = v513 == "Blox Fruit" and "Demon Fruit" or v513
				local v522 = next
				local v523, v524 = v_u_156:WaitForChild("Stats"):GetChildren()
				for _, v525 in v522, v523, v524 do
					local v526 = v_u_53.Stats.Container[v525.Name]
					local v527
					if v_u_4 or v525.Name ~= v521 then
						v527 = 0
					else
						local v528 = v512 / 4 + v_u_156.Level.Value * (v512 / 600) * 0.1
						v527 = math.floor(v528) or 0
					end
					local v529 = v525.Level.Value
					if v_u_154.Parent:FindFirstChild("RaceTransformed") and v_u_154.Parent.RaceTransformed.Value then
						local v530 = v525.Name == "Defense" and 1 or 1.1
						local v531 = v_u_156.Level.Value
						local v532 = v_u_49
						local v533 = math.max(v531, v532) * v530 - v529
						v527 = v527 + math.ceil(v533)
					end
					v526.Number.Text = "Lv. " .. v529 .. (v527 > 0 and " (+" .. v527 .. ")" or "") .. (v_u_4 and "" or (v_u_49 <= v529 and " (MAX)" or ""))
					if v_u_4 then
						v526.Add.Active = false
						v526.Add.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
						v526.Add.BorderColor3 = Color3.fromRGB(135, 135, 135)
						v526.Add.Trans.Visible = false
					end
				end
				if v_u_4 then
					v_u_53.Stats.Points.Reset.Visible = false
					v_u_53.Stats.Points.Available.Text = "Your stats are being overridden by the dungeon."
				else
					if v_u_156.StatRefunds.Value > 0 then
						v_u_53.Stats.Points.Reset.TextLabel.Text = "Refund (" .. v_u_156.StatRefunds.Value .. " Stored)"
					else
						v_u_53.Stats.Points.Reset.TextLabel.Text = "Refund"
					end
					v_u_53.Stats.Points.Available.Text = "Available Points: " .. v_u_156.Points.Value
				end
				local v534
				if v_u_156.Subclass.Value == "" then
					v534 = false
				else
					v534 = v_u_156.Subclass.Value
				end
				local v535 = v_u_53.Stats.Top.Race
				local v536 = "" .. v_u_156.Race.Value
				local v537 = v536 == "Skypiea" and "Angel" or v536
				local v538 = v537 == "Fishman" and "Shark" or v537
				v535.Text = "Race: " .. (v538 == "Mink" and "Rabbit" or v538)
				v_u_53.Stats.Top.Subclass.Text = v534 and "Subclass: " .. v534 or ""
			end
			local v539 = v_u_435:Get()
			local v540 = v_u_156.Points.Value
			local _ = v_u_408:GetAttribute("totalNew") or 0
			local v541 = v539._Raw
			local v542 = v541 > 0 and 1 or 0
			if v540 > 0 then
				v542 = v542 + 1
				local _ = v540 > 99
			end
			local v543 = v_u_408:GetAttribute("totalNew") or 0
			if v543 > 0 then
				v542 = v542 + 1
				local _ = v543 > 99
			end
			if v_u_396.TextLabel.Text == "Menu" then
				v_u_396.Badge.Visible = true
				if v542 > 1 then
					if v540 > 0 then
						v_u_396.Badge.UIGradient.Offset = Vector2.new(0, 0)
						v_u_396.Badge.Badge.UIGradient.Offset = Vector2.new(0, 0)
					else
						v_u_396.Badge.UIGradient.Offset = Vector2.new(-10, 0)
						v_u_396.Badge.Badge.UIGradient.Offset = Vector2.new(-10, 0)
					end
					v_u_396.Badge.Badge.TextLabel.Text = "!!"
				elseif v543 == 0 then
					if v540 == 0 then
						if v541 == 0 then
							v_u_396.Badge.Visible = false
						else
							v_u_396.Badge.UIGradient.Offset = Vector2.new(-10, 0)
							v_u_396.Badge.Badge.UIGradient.Offset = Vector2.new(-10, 0)
							v_u_396.Badge.Badge.TextLabel.Text = v539._String
						end
					else
						v_u_396.Badge.UIGradient.Offset = Vector2.new(10, 0)
						v_u_396.Badge.Badge.UIGradient.Offset = Vector2.new(10, 0)
						v_u_396.Badge.Badge.TextLabel.Text = v540 == "99+" and "99+" or (v540 > 99 and "99+" or v540)
					end
				else
					v_u_396.Badge.UIGradient.Offset = Vector2.new(-10, 0)
					v_u_396.Badge.Badge.UIGradient.Offset = Vector2.new(-10, 0)
					v_u_396.Badge.Badge.TextLabel.Text = v543 == "99+" and "99+" or (v543 > 99 and "99+" or v543)
				end
			else
				v_u_396.Badge.Visible = false
			end
			v_u_53.StatsButton.Badge.Badge.TextLabel.Text = v540 == "99+" and "99+" or (v540 > 99 and "99+" or v540)
			v_u_53.StatsButton.Badge.Visible = v540 ~= 0
			v_u_53.InventoryButton.Badge.Badge.TextLabel.Text = v543 == "99+" and "99+" or (v543 > 99 and "99+" or v543)
			v_u_53.InventoryButton.Badge.Visible = v543 ~= 0
		end
	end)
	local v_u_544 = false
	local function v_u_545() end
	local v546 = v_u_53:WaitForChild("Crew")
	local v_u_547 = v546:WaitForChild("Create")
	local v_u_548 = v546:WaitForChild("Main")
	function statsMenuFunction()
		-- upvalues: (ref) v_u_402, (copy) v_u_53
		closeOthers("Stats")
		task.defer(function()
			-- upvalues: (ref) v_u_402, (ref) v_u_53
			v_u_402 = not v_u_402
			if v_u_402 then
				v_u_53.Stats:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), "Out", "Quad", 0.3, true)
			else
				v_u_53.Stats:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), "In", "Quad", 0.3, true)
			end
		end)
	end
	function shopMenuFunction()
		-- upvalues: (ref) v_u_403, (copy) v_u_400
		closeOthers("Shop")
		v_u_403 = not v_u_403
		task.defer(function()
			-- upvalues: (ref) v_u_400, (ref) v_u_403
			v_u_400:SetAttribute("IsVisible", v_u_403)
			if v_u_403 then
				v_u_400.Visible = true
				v_u_400:TweenPosition(UDim2.new(0.5, 0, 0.475, 0), "Out", "Quad", 0.3, true)
			else
				v_u_400:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), "In", "Quad", 0.3, true)
			end
		end)
	end
	function crewMenuFunction()
		-- upvalues: (ref) v_u_405, (copy) v_u_53, (copy) v_u_50, (ref) v_u_544, (copy) v_u_60, (ref) v_u_545, (copy) v_u_547, (copy) v_u_548
		closeOthers("Crews")
		task.defer(function()
			-- upvalues: (ref) v_u_405, (ref) v_u_53, (ref) v_u_50, (ref) v_u_544, (ref) v_u_60, (ref) v_u_545, (ref) v_u_547, (ref) v_u_548
			v_u_405 = not v_u_405
			if v_u_405 then
				v_u_53.Crew:TweenPosition(UDim2.new(0.5, 0, 0.488, 0), "Out", "Quad", 0.3, true)
				if v_u_50:WaitForChild("Data"):WaitForChild("CrewID").Value == "" then
					v_u_547.Visible = true
					v_u_548.Visible = false
					v_u_548.ConfirmAbandon.Visible = false
				else
					v_u_544 = true
					local v549, _, v550, v551 = v_u_60.Crew:InvokeServer("GetData")
					if v549 then
						v_u_545(v550, v551)
						v_u_547.Visible = false
						v_u_548.Visible = true
						v_u_548.ConfirmAbandon.Visible = false
					end
					v_u_544 = false
				end
			else
				v_u_53.Crew:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), "In", "Quad", 0.3, true)
				return
			end
		end)
	end
	local v_u_552 = nil
	function alliesMenuFunction()
		-- upvalues: (ref) v_u_404, (copy) v_u_58, (ref) v_u_552
		closeOthers("Allies")
		task.defer(function()
			-- upvalues: (ref) v_u_404, (ref) v_u_58, (ref) v_u_552
			v_u_404 = not v_u_404
			if v_u_404 then
				v_u_58:TweenPosition(UDim2.new(0.5, 0, 0.475, 0), "Out", "Quad", 0.3, true)
				v_u_552:load()
			else
				v_u_58:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), "In", "Quad", 0.3, true)
			end
		end)
	end
	function itemsMenuFunction(_)
		-- upvalues: (copy) v_u_66
		closeOthers("Items")
		if v_u_66.IsOpen then
			v_u_66:Close()
		else
			v_u_66:Open()
		end
	end
	local v_u_553 = nil
	local v_u_605 = {
		["Stats"] = function(p_u_554)
			-- upvalues: (ref) v_u_402
			local v555, v556 = pcall(function()
				-- upvalues: (ref) p_u_554, (ref) v_u_402
				if p_u_554 == nil then
					p_u_554 = v_u_402 == true
				end
				if p_u_554 and v_u_402 then
					statsMenuFunction()
				elseif not (p_u_554 or v_u_402) then
					statsMenuFunction()
				end
			end)
			if not v555 then
				print(v556)
			end
		end,
		["Shop"] = function(p_u_557)
			-- upvalues: (ref) v_u_403
			local v558, v559 = pcall(function()
				-- upvalues: (ref) p_u_557, (ref) v_u_403
				if p_u_557 == nil then
					p_u_557 = not v_u_403
				end
				if p_u_557 and v_u_403 then
					shopMenuFunction()
				elseif not (p_u_557 or v_u_403) then
					shopMenuFunction()
				end
			end)
			if not v558 then
				print(v559)
			end
		end,
		["Allies"] = function(p_u_560)
			-- upvalues: (ref) v_u_404
			local v561, v562 = pcall(function()
				-- upvalues: (ref) p_u_560, (ref) v_u_404
				if p_u_560 == nil then
					p_u_560 = v_u_404 == true
				end
				if p_u_560 and v_u_404 then
					alliesMenuFunction()
				elseif not (p_u_560 or v_u_404) then
					alliesMenuFunction()
				end
			end)
			if not v561 then
				print(v562)
			end
		end,
		["Crews"] = function(p_u_563)
			-- upvalues: (ref) v_u_405
			local v564, v565 = pcall(function()
				-- upvalues: (ref) p_u_563, (ref) v_u_405
				if p_u_563 == nil then
					p_u_563 = v_u_405 == true
				end
				if p_u_563 and v_u_405 then
					crewMenuFunction()
				elseif not (p_u_563 or v_u_405) then
					crewMenuFunction()
				end
			end)
			if not v564 then
				print(v565)
			end
		end,
		["Items"] = function(p_u_566)
			-- upvalues: (copy) v_u_66
			local v568, v569 = pcall(function()
				-- upvalues: (ref) v_u_66, (ref) p_u_566
				local v567 = v_u_66.IsOpen
				if p_u_566 == nil then
					p_u_566 = v567 == true
				end
				if p_u_566 and v567 then
					itemsMenuFunction()
				elseif not (p_u_566 or v567) then
					itemsMenuFunction()
				end
			end)
			if not v568 then
				print(v569)
			end
		end,
		["Skins"] = function(p_u_570, p_u_571)
			-- upvalues: (copy) v_u_68
			local v572, v573 = pcall(function()
				-- upvalues: (copy) p_u_570, (ref) v_u_68, (copy) p_u_571
				if p_u_570 then
					v_u_68:Close()
				else
					v_u_68:Open(p_u_571)
				end
			end)
			if not v572 then
				print(v573)
			end
		end,
		["GachaWindow"] = function(p_u_574, ...)
			local v575, v576 = pcall(function()
				-- upvalues: (copy) p_u_574
				if p_u_574 then
					require(game.ReplicatedStorage.Controllers.UI.GachaWindow):Close()
				end
			end)
			if not v575 then
				print(v576)
			end
		end,
		["Juice"] = function(p_u_577, p_u_578, p_u_579)
			local v580, v581 = pcall(function()
				-- upvalues: (copy) p_u_577, (copy) p_u_578, (copy) p_u_579
				if p_u_577 then
					require(game.ReplicatedStorage.Controllers.UI.JuiceWindow):Close()
				else
					require(game.ReplicatedStorage.Controllers.UI.JuiceWindow):Open(p_u_578, p_u_579)
				end
			end)
			if not v580 then
				print(v581)
			end
		end,
		["Consumables"] = function(p_u_582, p_u_583)
			-- upvalues: (ref) v_u_69
			if v_u_69 then
				local v584, v585 = pcall(function()
					-- upvalues: (copy) p_u_582, (ref) v_u_69, (copy) p_u_583
					if p_u_582 then
						v_u_69:Close()
					else
						v_u_69:Open(p_u_583)
					end
				end)
				if not v584 then
					print(v585)
				end
			end
		end,
		["Gift"] = function(p_u_586, p_u_587, p_u_588)
			local v590, v591 = pcall(function()
				-- upvalues: (copy) p_u_586, (copy) p_u_587, (copy) p_u_588
				if p_u_586 then
					require(game.ReplicatedStorage.Controllers.UI.GiftWindow):Close()
				else
					local v589 = {
						["shopData"] = p_u_587,
						["purchaseLocation"] = p_u_588
					}
					require(game.ReplicatedStorage.Controllers.UI.GiftWindow):Open(v589)
				end
			end)
			if not v590 then
				print(v591)
			end
		end,
		["GiftClaim"] = function(p_u_592)
			local v593, v594 = pcall(function()
				-- upvalues: (copy) p_u_592
				if p_u_592 then
					require(game.ReplicatedStorage.Controllers.UI.GiftClaimWindow):Close()
				else
					require(game.ReplicatedStorage.Controllers.UI.GiftClaimWindow):Open()
				end
			end)
			if not v593 then
				print(v594)
			end
		end,
		["EasterCodex"] = function(p_u_595)
			local v_u_596 = require(game.ReplicatedStorage.Controllers.UI.EasterCodex)
			local v597, v598 = pcall(function()
				-- upvalues: (copy) p_u_595, (copy) v_u_596
				if p_u_595 then
					v_u_596:Close()
				else
					v_u_596:Open()
				end
			end)
			if not v597 then
				print(v598)
			end
		end,
		["ServerBrowser"] = function(p_u_599)
			-- upvalues: (ref) v_u_553
			local v600, v601 = pcall(function()
				-- upvalues: (ref) v_u_553, (ref) p_u_599
				v_u_553 = v_u_553 or game.Players.LocalPlayer.PlayerGui:FindFirstChild("ServerBrowser")
				if v_u_553 then
					if p_u_599 == nil then
						p_u_599 = v_u_553.Enabled == true
					end
					if p_u_599 then
						v_u_553.Enabled = false
					else
						v_u_553.Enabled = true
					end
				else
					return
				end
			end)
			if not v600 then
				print(v601)
			end
		end,
		["FruitShop"] = function()
			-- upvalues: (copy) v_u_67
			v_u_67:Close()
		end,
		["WhatsNew"] = function(p_u_602)
			local v603, v604 = pcall(function()
				-- upvalues: (copy) p_u_602
				if p_u_602 then
					script.Parent.WhatsNew:SetAttribute("Closed", (script.Parent.WhatsNew:GetAttribute("Closed") or 0) + 1)
				end
			end)
			if not v603 then
				print(v604)
			end
		end
	}
	function closeOthers(p606)
		-- upvalues: (copy) v_u_28, (copy) v_u_605
		if _G.closeSettingsMenu and p606 ~= "Settings" then
			pcall(_G.closeSettingsMenu)
		end
		if _G.closeProfileLookup then
			pcall(_G.closeProfileLookup)
		end
		if _G.closePlayerProfile then
			pcall(_G.closePlayerProfile)
		end
		if p606 then
			v_u_28:FireServer(p606)
		end
		for v607 in pairs(v_u_605) do
			if not p606 or p606 ~= v607 then
				v_u_605[v607](true)
			end
		end
	end
	_G.closeOthers = closeOthers
	function closeMenu(p608, ...)
		-- upvalues: (copy) v_u_605
		if v_u_605[p608] then
			v_u_605[p608](true, ...)
		end
	end
	_G.closeMenu = closeMenu
	function openMenu(p609, ...)
		-- upvalues: (copy) v_u_605
		closeOthers(p609)
		if v_u_605[p609] then
			v_u_605[p609](false, ...)
		end
	end
	_G.openMenu = openMenu
	function openMenuSimple(p610, ...)
		-- upvalues: (copy) v_u_28, (copy) v_u_605
		v_u_28:FireServer(p610)
		if v_u_605[p610] then
			v_u_605[p610](false, ...)
		end
	end
	_G.openMenuSimple = openMenuSimple
	function _G.toggleMenu(p611, ...)
		-- upvalues: (copy) v_u_605
		closeOthers(p611)
		if v_u_605[p611] then
			v_u_605[p611](nil, ...)
		end
	end
	function menuFunction()
		-- upvalues: (copy) v_u_53, (ref) v_u_406
		v_u_53.StatsButton.Visible = not v_u_53.StatsButton.Visible
		v_u_53.ShopButton.Visible = not v_u_53.ShopButton.Visible
		v_u_53.InventoryButton.Visible = not v_u_53.InventoryButton.Visible
		v_u_406 = v_u_53.ShopButton.Visible
		if v_u_53.StatsButton.Visible then
			v_u_53.MenuButton.TextLabel.Text = "Close"
		else
			v_u_53.MenuButton.TextLabel.Text = "Menu"
			closeMenu("Shop")
			closeMenu("Stats")
			closeMenu("Items")
			closeMenu("Crews")
			closeMenu("Allies")
		end
	end
	_G.hudMenuFunction = menuFunction
	v_u_53.InventoryButton.Activated:Connect(function()
		-- upvalues: (copy) v_u_30
		v_u_30.reportActivity("HUD/Menu/Inventory")
		itemsMenuFunction()
	end)
	v_u_53.MenuButton.Activated:Connect(function()
		-- upvalues: (copy) v_u_30
		v_u_30.reportActivity("HUD/Menu")
		menuFunction()
	end)
	v_u_53.StatsButton.Activated:Connect(function()
		-- upvalues: (copy) v_u_30
		v_u_30.reportActivity("HUD/Menu/Stats")
		statsMenuFunction()
	end)
	v_u_53.ShopButton.Activated:Connect(function()
		-- upvalues: (copy) v_u_30
		v_u_30.reportActivity("HUD/Menu/Shop")
		shopMenuFunction()
	end)
	v_u_53.HUDButtonBar.AlliesButton.Activated:Connect(function()
		-- upvalues: (copy) v_u_30
		v_u_30.reportActivity("HUD/Menu/Allies")
		alliesMenuFunction()
	end)
	v_u_53.HUDButtonBar.CrewButton.Activated:Connect(function()
		-- upvalues: (copy) v_u_30
		v_u_30.reportActivity("HUD/Menu/Crew")
		crewMenuFunction()
	end)
	v_u_53.MobileStatsButton.Activated:Connect(function()
		-- upvalues: (copy) v_u_30
		v_u_30.reportActivity("HUD/Menu/Stats")
		statsMenuFunction()
	end)
	v_u_53.MobileShopButton.Activated:Connect(function()
		-- upvalues: (copy) v_u_30
		v_u_30.reportActivity("HUD/Menu/Shop")
		shopMenuFunction()
	end)
	game.ReplicatedStorage.Events.ToggleCrewWindow.Event:Connect(function()
		crewMenuFunction()
	end)
	game.ReplicatedStorage.Events.ToggleAllies.Event:Connect(function()
		alliesMenuFunction()
	end)
	game.ReplicatedStorage.Events.ToggleInventoryWindow.Event:Connect(function()
		itemsMenuFunction()
	end)
	v_u_53:WaitForChild("Stats"):WaitForChild("Exit").Activated:Connect(function()
		-- upvalues: (ref) v_u_402
		if v_u_402 then
			statsMenuFunction()
		end
	end)
	v_u_53:WaitForChild("Shop"):WaitForChild("Exit").Activated:Connect(function()
		-- upvalues: (ref) v_u_403
		if v_u_403 then
			shopMenuFunction()
		end
	end)
	v_u_53:WaitForChild("Allies"):WaitForChild("Exit").Activated:Connect(function()
		-- upvalues: (ref) v_u_404
		if v_u_404 then
			alliesMenuFunction()
		end
	end)
	v_u_53:WaitForChild("Crew"):WaitForChild("Create"):WaitForChild("Exit").Activated:Connect(function()
		-- upvalues: (ref) v_u_405
		if v_u_405 then
			crewMenuFunction()
		end
	end)
	v_u_53:WaitForChild("Crew"):WaitForChild("Main"):WaitForChild("Exit").Activated:Connect(function()
		-- upvalues: (ref) v_u_405
		if v_u_405 then
			crewMenuFunction()
		end
	end)
	v_u_408:GetAttributeChangedSignal("itemsVisible"):Connect(function()
		-- upvalues: (ref) v_u_407, (copy) v_u_408
		if v_u_407 ~= v_u_408:GetAttribute("itemsVisible") then
			v_u_407 = v_u_408:GetAttribute("itemsVisible")
			itemsMenuFunction(true)
		end
	end)
	local v_u_612 = true
	function manageGamepadMenus(_, p613, p614)
		-- upvalues: (ref) v_u_612, (ref) v_u_406, (ref) v_u_402, (ref) v_u_403
		if p613 == Enum.UserInputState.Begin and v_u_612 then
			v_u_612 = false
			if p614.KeyCode == Enum.KeyCode.DPadUp then
				statsMenuFunction()
				if v_u_406 ~= v_u_402 then
					menuFunction()
				end
			else
				shopMenuFunction()
				if v_u_406 ~= v_u_403 then
					menuFunction()
				end
			end
			wait(0.3)
			v_u_612 = true
		end
	end
	local v615 = next
	local v616, v617 = v_u_53.Stats.Container:GetChildren()
	local v_u_618 = v_u_164
	local v_u_619 = v_u_154
	local v_u_620 = v_u_156
	for _, v_u_621 in v615, v616, v617 do
		local v622 = v_u_621:FindFirstChild("Add")
		if v622 then
			v622.Activated:Connect(function()
				-- upvalues: (copy) v_u_53, (copy) v_u_60, (copy) v_u_621
				local v623 = v_u_53.Stats.TextBox.Text
				local v624 = tonumber(v623) or 1
				if not tostring(v624):find("%.") then
					v_u_60.CommF_:InvokeServer("AddPoint", v_u_621.Name, v624)
				end
			end)
		end
	end
	v_u_53:WaitForChild("Stats"):WaitForChild("Points"):WaitForChild("Reset").Activated:Connect(function()
		-- upvalues: (ref) v_u_620, (copy) v_u_60
		if v_u_620.StatRefunds.Value > 0 then
			v_u_60.CommF_:InvokeServer("redeemRefundPoints", "Refund Points")
		else
			v_u_60.CommF_:InvokeServer("buyRobuxShop", {})
		end
	end)
	local v_u_625 = false
	local v_u_626 = false
	local v_u_627 = nil
	local v_u_628 = false
	local v_u_629 = nil
	if v_u_21.COMPASS_REWORK_ENABLED then
		local v_u_630 = require(game.ReplicatedStorage.Controllers.UI.NavigationWindow)
		local function v631()
			-- upvalues: (copy) v_u_630, (copy) v_u_397
			if v_u_630.guideActive then
				v_u_397:SetPosition(UDim2.new(0.02, 10, 0.455, -8))
			else
				v_u_397:SetPosition(UDim2.new(0.2, 10, 0.6, 0))
			end
		end
		v_u_630.guideVisible:Connect(v631)
		task.spawn(v631)
	else
		local v_u_632 = v_u_53:WaitForChild("Quest")
		local v_u_633 = v_u_65.UI
		local v_u_634 = v_u_65.SideCompass
		local v635 = v_u_65.SideCompass:WaitForChild("Frame"):WaitForChild("Button")
		v_u_65:ParentUI(v_u_53)
		local v_u_636 = nil
		local function v_u_639(p637)
			-- upvalues: (ref) v_u_633, (copy) v_u_65, (ref) v_u_626, (ref) v_u_632, (ref) v_u_634, (ref) v_u_625, (copy) v_u_53
			local v638 = v_u_633:WaitForChild("LeftFrame"):WaitForChild("Abandon")
			if p637 == true then
				v638.Visible = true
				v_u_65:ToggleCompassShown(false)
				v_u_65:ResetCompass()
				if not v_u_626 then
					v_u_632.Visible = true
					v_u_634.Visible = false
				end
				v_u_625 = true
				v_u_633.TopFrame.Header.Text = "Mission"
				v_u_633.BottomFrame.Header.Text = "Reward:"
				v_u_53:WaitForChild("Guide"):WaitForChild("LeftFrame"):WaitForChild("Track").Visible = false
			else
				v_u_65:ChangeDisplayedNPC(nil)
				v_u_65:ToggleCompassShown(not script.Parent.Parent:FindFirstChild("DungeonInterface"))
				v638.Visible = false
				if not v_u_626 then
					v_u_634.Visible = not script.Parent.Parent:FindFirstChild("DungeonInterface")
				end
				v_u_632.Visible = false
				v_u_625 = false
				v_u_633.TopFrame.Header.Text = "Recommended Quest"
				v_u_633.BottomFrame.Header.Text = ""
				v_u_633.BottomFrame.Description.Text = ""
				v_u_53:WaitForChild("Guide"):WaitForChild("LeftFrame"):WaitForChild("Track").Visible = true
			end
		end
		local function v_u_641(p640)
			-- upvalues: (ref) v_u_634, (ref) v_u_633, (ref) v_u_632, (ref) v_u_626, (copy) v_u_397, (ref) v_u_625, (ref) v_u_636
			_G.TestGamePrint("toggleGuide", p640)
			v_u_634:WaitForChild("Notify").Visible = false
			if p640 == true then
				v_u_633.Visible = true
				v_u_634.Visible = false
				v_u_632.Visible = false
				v_u_626 = true
				v_u_397:SetPosition(UDim2.new(0.02, 10, 0.455, -8))
			else
				v_u_633.Visible = p640
				if v_u_625 then
					v_u_632.Visible = true
				else
					v_u_634.Visible = not script.Parent.Parent:FindFirstChild("DungeonInterface")
				end
				v_u_397:SetPosition(UDim2.new(0.2, 10, 0.6, 0))
				v_u_626 = false
			end
			if v_u_636 then
				task.spawn(v_u_636)
			end
		end
		local v_u_642 = false
		local v_u_643 = v_u_620 and v_u_620.Level and (v_u_620.Level.Value or 0) or 0
		local function v645()
			-- upvalues: (ref) v_u_642, (ref) v_u_628, (ref) v_u_620, (ref) v_u_643, (ref) v_u_634, (ref) v_u_633, (ref) v_u_632, (ref) v_u_626, (copy) v_u_397, (ref) v_u_636
			if v_u_642 then
				return
			elseif v_u_628 then
				if v_u_620 and v_u_620.Level then
					local v644 = v_u_620.Level.Value
					if v_u_643 < 10 and v644 >= 10 then
						v_u_642 = true
						_G.TestGamePrint("toggleGuide", true)
						v_u_634:WaitForChild("Notify").Visible = false
						v_u_633.Visible = true
						v_u_634.Visible = false
						v_u_632.Visible = false
						v_u_626 = true
						v_u_397:SetPosition(UDim2.new(0.02, 10, 0.455, -8))
						if v_u_636 then
							task.spawn(v_u_636)
						end
					end
					v_u_643 = v644
				end
			else
				return
			end
		end
		v_u_629 = v645
		if v_u_620 and v_u_620.Level then
			v_u_620.Level.Changed:Connect(v645)
		end
		v635.TextButton.MouseButton1Click:Connect(function()
			-- upvalues: (copy) v_u_30, (copy) v_u_641, (ref) v_u_626
			_G.TestGamePrint("compassButton.Activated")
			v_u_30.reportActivity("HUD/Button/Compass")
			v_u_641(not v_u_626)
		end)
		v635.Activated:Connect(function()
			-- upvalues: (copy) v_u_641, (ref) v_u_626
			_G.TestGamePrint("compassButton.Activated")
			v_u_641(not v_u_626)
		end)
		v_u_633:WaitForChild("Close").Activated:Connect(function()
			-- upvalues: (copy) v_u_641
			_G.TestGamePrint("guideWindow:WaitForChild(\"Close\").Activated")
			v_u_641(false)
		end)
		v_u_632:WaitForChild("Expand").Activated:Connect(function()
			-- upvalues: (ref) v_u_634, (ref) v_u_633, (ref) v_u_632, (ref) v_u_626, (copy) v_u_397, (ref) v_u_636
			_G.TestGamePrint("questWindow:WaitForChild(\"Expand\").Activated")
			_G.TestGamePrint("toggleGuide", true)
			v_u_634:WaitForChild("Notify").Visible = false
			v_u_633.Visible = true
			v_u_634.Visible = false
			v_u_632.Visible = false
			v_u_626 = true
			v_u_397:SetPosition(UDim2.new(0.02, 10, 0.455, -8))
			if v_u_636 then
				task.spawn(v_u_636)
			end
		end)
		local v_u_646 = require(game.ReplicatedStorage.Modules.Util.Trove)
		local v_u_647 = nil
		local function v_u_651(p648)
			-- upvalues: (ref) v_u_647, (copy) v_u_65, (copy) v_u_53, (copy) v_u_646, (copy) v_u_641
			if v_u_647 then
				v_u_647:Destroy()
				v_u_647 = nil
			end
			v_u_65.Data.Tracking = p648
			local v649 = v_u_53:WaitForChild("Guide"):WaitForChild("LeftFrame"):WaitForChild("Track")
			v_u_65:ResetCompass()
			if v_u_65.Data.Tracking == true then
				v_u_647 = v_u_646.new()
				local v650 = v_u_647
				assert(v650):Add(function()
					-- upvalues: (ref) v_u_647
					v_u_647 = nil
					_G.GuideCallbacks.SpecialLocation = nil
				end)
				v649.TextLabel.Text = "Untrack"
				v_u_65.SideCompass.Frame.Button.ImageTransparency = 1
				v_u_641(false)
			else
				v649.TextLabel.Text = "Track"
				v_u_65.SideCompass.Frame.Button.ImageTransparency = 0
				v_u_641(false)
			end
			if not p648 then
				_G.TrackingLightningEvent = false
				_G.TrackingCorruptedEvent = false
			end
			return v_u_647
		end
		script.Parent.Parent.ChildAdded:Connect(function(p_u_652)
			-- upvalues: (copy) v_u_639
			task.defer(function()
				-- upvalues: (copy) p_u_652, (ref) v_u_639
				if p_u_652.Name == "DungeonInterface" then
					task.defer(function()
						-- upvalues: (ref) v_u_639
						v_u_639(false)
					end)
				end
			end)
		end)
		local v_u_653 = require(game.ReplicatedStorage.Util.Maid).new()
		v61.OnClientEvent:Connect(function(p_u_654)
			-- upvalues: (copy) v_u_653, (copy) v_u_639, (ref) v_u_633, (copy) v_u_65, (ref) v_u_626, (ref) v_u_632, (ref) v_u_634, (ref) v_u_625, (copy) v_u_53, (copy) v_u_651, (ref) v_u_619, (ref) v_u_52, (ref) v_u_620, (copy) v_u_51, (copy) v_u_77
			v_u_653:DoCleaning()
			if p_u_654 == nil then
				v_u_639(false)
			else
				v_u_633:WaitForChild("LeftFrame"):WaitForChild("Abandon").Visible = true
				v_u_65:ToggleCompassShown(false)
				v_u_65:ResetCompass()
				if not v_u_626 then
					v_u_632.Visible = true
					v_u_634.Visible = false
				end
				v_u_625 = true
				v_u_633.TopFrame.Header.Text = "Mission"
				v_u_633.BottomFrame.Header.Text = "Reward:"
				v_u_53:WaitForChild("Guide"):WaitForChild("LeftFrame"):WaitForChild("Track").Visible = false
				v_u_651(false)
				if v_u_65.Data.Ready and (v_u_619 and v_u_619.Health > 0) then
					if v_u_65.Data.DisplayedNPC == nil then
						task.spawn(function()
							-- upvalues: (copy) p_u_654, (ref) v_u_65, (ref) v_u_52, (ref) v_u_620, (ref) v_u_51
							if p_u_654.Info.Job or (p_u_654.Info.IsHiddenAbilityQuest or p_u_654.Info.Custom) then
								v_u_65:ChangeDisplayedNPC(nil)
								v_u_65.IconFrame.GuideIcon.Image = ""
								v_u_65.Data.QuestData = p_u_654.Info
								return
							else
								local v655 = "Bandit"
								for v656, _ in next, p_u_654.Info.Task do
									v655 = v656
								end
								if p_u_654.Info.BountyTargetPlayer then
									v_u_65:ChangeDisplayedNPC("rbxthumb://type=AvatarHeadShot&id=" .. p_u_654.Info.BountyTargetPlayer.UserId .. "&w=150&h=150")
								else
									local v657 = v_u_52:FindFirstChild("HumanoidRootPart")
									if v657 then
										v_u_65:GetNearestNPC(v657.Position, v_u_620.Level.Value)
										local v658 = v_u_51:WaitForChild(v655):FindFirstChild("HumanoidRootPart")
										if v658 then
											v_u_65.IconFrame.GuideIcon.Image = ""
											v_u_65:ChangeDisplayedNPC(v658)
											v658.Parent:Destroy()
											v_u_65.Data.QuestData = p_u_654.Info
											return
										end
										v_u_65:ChangeDisplayedNPC(nil)
									end
								end
							end
						end)
					elseif p_u_654.Info.Name ~= p_u_654.PreviousQuest or p_u_654.Info.Name ~= v_u_65.Data.QuestData.Name then
						task.spawn(function()
							-- upvalues: (copy) p_u_654, (ref) v_u_65, (ref) v_u_52, (ref) v_u_620, (ref) v_u_51
							if p_u_654.Info.Job or (p_u_654.Info.IsHiddenAbilityQuest or p_u_654.Info.Custom) then
								v_u_65:ChangeDisplayedNPC(nil)
								v_u_65.IconFrame.GuideIcon.Image = ""
								v_u_65.Data.QuestData = p_u_654.Info
								return
							else
								local v659 = "Bandit"
								for v660, _ in next, p_u_654.Info.Task do
									v659 = v660
								end
								if p_u_654.Info.BountyTargetPlayer then
									v_u_65:ChangeDisplayedNPC("rbxthumb://type=AvatarHeadShot&id=" .. p_u_654.Info.BountyTargetPlayer.UserId .. "&w=150&h=150")
								else
									local v661 = v_u_52:FindFirstChild("HumanoidRootPart")
									if v661 then
										v_u_65:GetNearestNPC(v661.Position, v_u_620.Level.Value)
										local v662 = v_u_51:WaitForChild(v659):FindFirstChild("HumanoidRootPart")
										if v662 then
											v_u_65.IconFrame.GuideIcon.Image = ""
											v_u_65:ChangeDisplayedNPC(v662)
											v662.Parent:Destroy()
											v_u_65.Data.QuestData = p_u_654.Info
											return
										end
										v_u_65:ChangeDisplayedNPC(nil)
									end
								end
							end
						end)
					end
				end
				local v663 = 0
				for _, _ in p_u_654.Info.Task do
					v663 = v663 + 1
				end
				local v_u_664 = ""
				local v665 = ""
				local v666 = ""
				local v_u_667 = false
				local v668 = v_u_53.Quest.Container.QuestReward
				local v_u_669 = v_u_53.Quest.Container.QuestTitle
				local v_u_670 = false
				local function v_u_677(p671)
					-- upvalues: (ref) v_u_670, (copy) v_u_669
					if v_u_670 then
						v_u_669.Size = UDim2.new(1, 0, 0.2, 0)
						v_u_669.Frame.Visible = true
						v_u_669.Title.Position = UDim2.new(0, 0, -0.2, 0)
						v_u_669.Title.Size = UDim2.new(1, 0, 1.2, 0)
						v_u_669.Title.TextYAlignment = Enum.TextYAlignment.Center
					else
						v_u_669.Frame.Visible = false
						local _, v672 = p671:gsub("\n", "")
						local v673 = v_u_669
						local v674 = UDim2.new
						local v675 = v672 * 0.2
						local v676 = math.min(v675, 0.5)
						v673.Size = v674(1, 0, math.max(0, v676) + 0.2, 0)
						v_u_669.Title.Position = UDim2.new(0, 0, 0, 0)
						v_u_669.Title.Size = UDim2.new(1, 0, 1, 0)
						v_u_669.Title.TextYAlignment = Enum.TextYAlignment.Top
					end
				end
				_G.GuideCallbacks.TrackingTag = nil
				local v678
				if p_u_654.Info.Job or p_u_654.Info.Custom then
					if p_u_654.Info.TrackingTag then
						function _G.GuideCallbacks.TrackingTag(p679, _, _)
							-- upvalues: (copy) p_u_654
							local v680 = 1000
							local v681 = nil
							for _, v682 in game:GetService("CollectionService"):GetTagged(p_u_654.Info.TrackingTag) do
								if v682:IsA("Model") then
									local v683 = (v682:GetPivot().Position - p679).Magnitude
									if v683 < v680 then
										v681 = v682:GetPivot().Position
										v680 = v683
									end
								elseif v682:IsA("BasePart") then
									local v684 = (v682.Position - p679).Magnitude
									if v684 < v680 then
										v681 = v682.Position
										v680 = v684
									end
								end
							end
							return {
								v681,
								p_u_654.Info.TrackingTag,
								"",
								false
							}
						end
					end
					local v685 = 0
					v678 = v_u_670
					local v686 = v685
					for v687, v_u_688 in p_u_654.Info.Task do
						v685 = v686 + 1
						local v689 = p_u_654.Progress[v687]
						if typeof(v_u_688) == "table" and v689 ~= true then
							if v_u_688.timer then
								local v690 = math.random(1, 5000000)
								v_u_653[("TIMER%*"):format((math.floor(v690)))] = task.defer(function()
									-- upvalues: (ref) v_u_664, (copy) v_u_688, (ref) v_u_53, (ref) v_u_667, (copy) v_u_677
									while true do
										local v691
										if v_u_664:len() > 0 then
											v691 = v_u_688.text
										else
											v691 = false
										end
										if v_u_688.timer - os.time() >= 0 then
											local v692 = v_u_53.Quest.Container.QuestTitle.Title
											local v693 = "%* (%*)%*"
											local v694
											if v691 then
												v694 = v_u_688.text
											else
												v694 = v_u_688.text or v_u_664
											end
											local v695 = v_u_688.timer - os.time()
											local v696
											if v695 < 0 then
												v696 = "00:00"
											else
												local v697 = v695 / 60
												local v698 = math.floor(v697)
												local v699 = v695 % 60
												local v700 = math.floor(v699)
												v696 = string.format("%02d:%02d", v698, v700)
											end
											v692.Text = v693:format(v694, v696, not v691 and "" or "\n" .. v_u_664)
										else
											v_u_667 = true
											v_u_53.Quest.Container.QuestTitle.Title.RichText = v_u_667
											local v701 = v_u_53.Quest.Container.QuestTitle.Title
											local v702 = "%* <font color=\"rgb(255,0,0)\">(FAILED.)</font>%*"
											local v703
											if v691 then
												v703 = v_u_688.text
											else
												v703 = v_u_688.text or v_u_664
											end
											v701.Text = v702:format(v703, not v691 and "" or "\n" .. v_u_664)
										end
										v_u_677(v_u_53.Quest.Container.QuestTitle.Title.Text)
										task.wait(1)
									end
								end)
								v686 = v685
							else
								local v704 = v_u_688.Amount > 1 and "s" or ""
								v665 = v665 .. v687 .. v704
								v666 = v666 .. "(" .. p_u_654.Progress[v687] .. "/" .. v_u_688.Amount .. ")" .. (v685 < v663 and "\t" or " ")
								v_u_664 = v_u_664 .. (v687 .. v704) .. " " .. "(" .. p_u_654.Progress[v687] .. "/" .. v_u_688.Amount .. ")" .. (v685 < v663 and "\n" or " ")
								v686 = v685
							end
						else
							local v705 = typeof(v_u_688) == "number"
							local v706
							if v689 == true then
								v706 = true
							elseif v705 then
								v706 = v_u_688 <= v689
							else
								v706 = v705
							end
							local v707 = v705 and v_u_688 > 1 and "s" or ""
							local v708 = ("%*"):format(not p_u_654.Info.Predicate and "" or p_u_654.Info.Predicate .. " ") .. (v_u_688 == 1 and "" or (not v705 and "" or tostring(v_u_688)) .. " ") .. v687 .. v707
							local v709 = not v705 and "" or "(" .. v689 .. "/" .. (v_u_688 or "") .. ")"
							if v706 then
								v_u_667 = true
								v_u_53.Quest.Container.QuestTitle.Title.RichText = v_u_667
								v709 = ("<i><s>%*</s></i>"):format(v709)
								v708 = ("<i><s>%*</s></i>"):format(v708)
							end
							v665 = v665 .. v708
							v666 = v709 .. (v685 < v663 and "\n" or " ")
							v_u_664 = v_u_664 .. v665 .. " " .. v666
							v686 = v685
						end
					end
				else
					v678 = v_u_670
					for v710, v711 in next, p_u_654.Info.Task do
						if p_u_654.Info.NoEdit then
							if p_u_654.Info.CustomTasks then
								v665 = v665 .. v710 .. ""
							else
								v665 = v665 .. "Defeat " .. (v711 == 1 and "" or v711 .. " ") .. v710 .. ""
							end
							v666 = "(" .. p_u_654.Progress[v710] .. "/" .. v711 .. ")" .. (v711 < #p_u_654.Info.Task and "\n" or "")
							v_u_664 = v_u_664 .. v665 .. " " .. v666
						else
							local v712 = v711 > 1 and "s" or ""
							if p_u_654.Info.CustomTasks then
								v665 = v665 .. (v711 == 1 and "" or v711 .. " ") .. v710 .. v712
							else
								v665 = v665 .. "Defeat " .. (v711 == 1 and "" or v711 .. " ") .. v710 .. v712
							end
							if p_u_654.Info.HideProgress then
								v666 = ""
							elseif p_u_654.Info.DisplayProgressAsPercentage then
								local v713 = p_u_654.Progress[v710] / v711 * 100
								local v714 = math.floor(v713)
								v666 = string.format("(%s%%)", v714) .. (v711 < #p_u_654.Info.Task and "\n" or "")
							else
								v666 = "(" .. p_u_654.Progress[v710] .. "/" .. v711 .. ")" .. (v711 < #p_u_654.Info.Task and "\n" or "")
							end
							v_u_664 = v_u_664 .. v665 .. " " .. v666
						end
					end
				end
				v_u_53.Quest.Container.QuestTitle.Title.RichText = v_u_667
				if not v_u_653.timerQuest then
					v_u_53.Quest.Container.QuestTitle.Title.Text = v_u_664
					v_u_633.TopFrame.Subtitle1.Text = v665
					v_u_633.TopFrame.Subtitle2.Text = v666
				end
				local v715 = ""
				if p_u_654.Info.Reward.Beli then
					v715 = v715 .. "$" .. v_u_77.commaValue(p_u_654.Info.Reward.Beli) .. "\n"
					v_u_670 = true
					v678 = v_u_670
				end
				if p_u_654.Info.Reward.Exp then
					v715 = v715 .. v_u_77.commaValue(p_u_654.Info.Reward.Exp) .. " Exp."
					v_u_670 = true
					v678 = v_u_670
				end
				if p_u_654.Info.Reward.Custom then
					if v715 == "" then
						v715 = p_u_654.Info.Reward.Custom
					else
						v715 = v715 .. "\n" .. p_u_654.Info.Reward.Custom
					end
					v_u_670 = true
					v678 = v_u_670
				end
				if p_u_654.Info.NoExpand then
					v_u_53.Quest.Expand.Visible = false
				else
					v_u_53.Quest.Expand.Visible = true
				end
				if p_u_654.Info.CustomTitle then
					v_u_53.Quest.Title.Text = p_u_654.Info.CustomTitle
				else
					v_u_53.Quest.Title.Text = "QUEST"
				end
				if v678 then
					v_u_669.Size = UDim2.new(1, 0, 0.2, 0)
					v668.Title.Text = "Reward:\n" .. v715
				else
					v668.Title.Text = ""
				end
				v_u_677(v_u_53.Quest.Container.QuestTitle.Title.Text)
				v_u_633.BottomFrame.Description.Text = v715
			end
		end)
		v_u_53:WaitForChild("Guide"):WaitForChild("Close").Activated:Connect(function()
			-- upvalues: (copy) v_u_641
			v_u_641(false)
		end)
		v_u_53:WaitForChild("Guide"):WaitForChild("LeftFrame"):WaitForChild("Abandon").Activated:Connect(function()
			-- upvalues: (copy) v_u_639, (copy) v_u_60
			v_u_639(false)
			v_u_60.CommF_:InvokeServer("AbandonQuest")
		end)
		v_u_53:WaitForChild("Guide"):WaitForChild("LeftFrame"):WaitForChild("Track").Activated:Connect(function()
			-- upvalues: (copy) v_u_651, (copy) v_u_65
			v_u_651(not v_u_65.Data.Tracking)
		end)
		require(game.ReplicatedStorage.React.RobloxTypes)
		function e(p716, p717, p718)
			local v_u_719 = Instance.new(p716)
			if p717 then
				for v_u_720, v_u_721 in pairs(p717) do
					if v_u_721 ~= nil then
						local v722, v723 = pcall(function(...)
							-- upvalues: (copy) v_u_719, (copy) v_u_720, (copy) v_u_721
							v_u_719[v_u_720] = v_u_721
						end)
						if not v722 then
							task.spawn(error, v723)
						end
					end
				end
			end
			if p718 then
				for _, v724 in ipairs(p718) do
					if v724 and typeof(v724) == "Instance" then
						v724.Parent = v_u_719
					end
				end
			end
			return v_u_719
		end
		local v_u_725 = e("Frame", {
			["Size"] = UDim2.fromScale(1, 1),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Parent"] = v_u_65.SideCompass.Frame
		}, { e("UIAspectRatioConstraint") })
		local function v_u_741(p726)
			-- upvalues: (copy) v_u_725, (copy) v_u_19
			local v727 = e
			local v728 = "TextButton"
			local v729 = {
				["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
				["BorderMode"] = Enum.BorderMode.Outline,
				["Size"] = UDim2.fromScale(0.3, 0.3),
				["Parent"] = v_u_725
			}
			local v730 = {}
			local v731 = e("UIScale", {
				["Scale"] = v_u_19:Get() == "Touch" and 1.25 or 1
			})
			local v732 = e("UICorner", {
				["CornerRadius"] = UDim.new(1, 0)
			})
			local v733 = e("UIAspectRatioConstraint")
			local v734 = e
			local v735 = "ImageLabel"
			local v736 = {
				["Image"] = p726.Image,
				["Size"] = p726.ImageSize or UDim2.fromScale(1, 1),
				["Position"] = p726.ImagePosition or UDim2.fromScale(0.5, 0.5),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["ScaleType"] = p726.ImageScaleType or Enum.ScaleType.Fit,
				["ImageColor3"] = Color3.fromRGB(255, 255, 255),
				["ImageRectOffset"] = p726.ImageRectOffset or Vector2.new(0, 0),
				["ImageRectSize"] = p726.ImageRectSize or Vector2.new(0, 0)
			}
			local v737 = {}
			local v738
			if p726.ImageUICorner == false then
				v738 = nil
			else
				v738 = e("UICorner", {
					["CornerRadius"] = UDim.new(1, 0)
				})
			end
			local v739
			if p726.HalloweenBatFlares == true then
				v739 = e("ImageLabel", {
					["Size"] = UDim2.fromScale(0.403, 0.403),
					["Position"] = UDim2.fromScale(0.078, 0.15),
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["ScaleType"] = Enum.ScaleType.Fit,
					["ImageColor3"] = Color3.fromRGB(255, 255, 255)
				})
			else
				v739 = nil
			end
			local v740
			if p726.HalloweenBatFlares == true then
				v740 = e("ImageLabel", {
					["Size"] = UDim2.fromScale(0.403, 0.403),
					["Position"] = UDim2.fromScale(1, 0.8),
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["ScaleType"] = Enum.ScaleType.Fit,
					["ImageColor3"] = Color3.fromRGB(255, 255, 255)
				})
			else
				v740 = nil
			end
			__set_list(v737, 1, {v738, v739, v740})
			__set_list(v730, 1, {v731, v732, v733, v734(v735, v736, v737), e("UIGradient", {
	["Color"] = p726.GradientColorSequence
}), e("UIStroke", {
	["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border,
	["Color"] = p726.UIStrokeColor or Color3.fromRGB(),
	["Thickness"] = v_u_19:Get() == "Touch" and 1 or 1.5
})})
			return v727(v728, v729, v730)
		end
		local v_u_742 = nil
		v_u_742 = {
			["Lightning Event"] = {
				["Locations"] = {},
				["new"] = function(p743)
					-- upvalues: (copy) v_u_741
					if p743.TextButton then
						return p743.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#05e2ff")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#05e2ff")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#20b7e3")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#20b7e3"))
							}),
							["ImageRectSize"] = Vector2.new(256, 256)
						})
					end
				end
			},
			["Oni Realm"] = {
				["Locations"] = {},
				["new"] = function(p744)
					-- upvalues: (copy) v_u_741
					if p744.TextButton then
						return p744.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#e97481")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#e97481")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#e04458")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#e04458"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Stretch,
							["ImageRectOffset"] = Vector2.new(256, 0),
							["ImageRectSize"] = Vector2.new(256, 256)
						})
					end
				end
			},
			["Corrupted Event"] = {
				["Locations"] = {},
				["new"] = function(p745)
					-- upvalues: (copy) v_u_741
					if p745.TextButton then
						return p745.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#dc2f44")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#dc2f44")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#95233e")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#95233e"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Stretch,
							["ImageSize"] = UDim2.fromScale(1.05, 0.75),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.55)
						})
					end
				end
			},
			["Slap Arena"] = {
				["Locations"] = {},
				["new"] = function(p746)
					-- upvalues: (copy) v_u_741
					if p746.TextButton then
						return p746.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#65d6ff")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#65d6ff")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#31beff")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#31beff"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(0.85, 0.85),
							["ImagePosition"] = UDim2.fromScale(0.525, 0.475)
						})
					end
				end
			},
			["Celestial Domain"] = {
				["Locations"] = {},
				["new"] = function(p747)
					-- upvalues: (copy) v_u_741
					if p747.TextButton then
						return p747.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#b48fff")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#b48fff")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#8856f8")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#8856f8"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(1, 1),
							["ImageRectSize"] = Vector2.new(256, 256),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.5)
						})
					end
				end
			},
			["Tournament Fisherman"] = {
				["Locations"] = {},
				["new"] = function(p748)
					-- upvalues: (copy) v_u_741
					if p748.TextButton then
						return p748.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#fff700")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#fff700")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#eeba00")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#dd9e00"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(1, 1),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.45)
						})
					end
				end
			},
			["Event Fishing Spot"] = {
				["Locations"] = {},
				["new"] = function(p749)
					-- upvalues: (copy) v_u_741
					if p749.TextButton then
						return p749.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#65d6ff")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#65d6ff")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#31beff")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#31beff"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(0.85, 0.85),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.5)
						})
					end
				end
			},
			["Celebration Teleporter"] = {
				["Locations"] = {},
				["new"] = function(p750)
					-- upvalues: (copy) v_u_741
					if p750.TextButton then
						return p750.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#fff157")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#fff157")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#ffd631")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#ffd631"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(1.15, 1.15),
							["ImagePosition"] = UDim2.fromScale(0.55, 0.45)
						})
					end
				end
			},
			["RedTree"] = {
				["Locations"] = {},
				["new"] = function(p751)
					-- upvalues: (copy) v_u_741
					if p751.TextButton then
						return p751.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#ff8383")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#ff8383")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#f44747")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#f44747"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(0.95, 0.95),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.55)
						})
					end
				end
			},
			["PurpleTree"] = {
				["Locations"] = {},
				["new"] = function(p752)
					-- upvalues: (copy) v_u_741
					if p752.TextButton then
						return p752.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#b8afff")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#b8afff")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#a189ff")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#a189ff"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(0.95, 0.95),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.55)
						})
					end
				end
			},
			["Halloween Event"] = {
				["Locations"] = {},
				["TeleportFunction"] = function()
					-- upvalues: (copy) v_u_50, (ref) v_u_742, (copy) v_u_60
					local v753 = require(game.ReplicatedStorage.Modules.Data.SharedEventData)
					local v754 = v_u_50:GetAttribute("CurrentLocation")
					local v755 = v_u_50:GetAttribute("ExactLocation")
					local v756 = false
					for _, v757 in v753.Halloween2025.EventIslands do
						if v754 == v757 or v755 == v757 then
							v756 = true
							break
						end
					end
					if v756 or v_u_742["Halloween Event"].IsOnCooldown == true then
						return false
					end
					v_u_742["Halloween Event"].IsOnCooldown = true
					task.defer(function()
						-- upvalues: (ref) v_u_60, (ref) v_u_742
						v_u_60.CommF_:InvokeServer("TeleportToSpawn", true)
						task.wait(0.1)
						v_u_742["Halloween Event"].IsOnCooldown = nil
					end)
					print("teleporting")
					return true
				end,
				["new"] = function(p758)
					-- upvalues: (copy) v_u_741
					if p758.TextButton then
						return p758.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#ffdf3d")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#ffdf3d")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#ff9d00")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#ff9d00"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(0.85, 0.85),
							["ImagePosition"] = UDim2.fromScale(0.51, 0.475),
							["UIStrokeColor"] = Color3.fromRGB(231, 135, 0)
						})
					end
				end
			},
			["WerewolfBossDoor"] = {
				["Locations"] = {},
				["new"] = function(p759)
					-- upvalues: (copy) v_u_741
					if p759.TextButton then
						return p759.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#a200ff")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#a200ff")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#7300ff")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#7300ff"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(0.9, 0.9),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.5)
						})
					end
				end
			},
			["EasterCodex"] = {
				["Locations"] = {},
				["new"] = function(p760)
					-- upvalues: (copy) v_u_741
					if p760.TextButton then
						return p760.TextButton
					end
					local v761 = v_u_741({
						["GradientColorSequence"] = ColorSequence.new({
							ColorSequenceKeypoint.new(0, Color3.fromHex("#d4ff78")),
							ColorSequenceKeypoint.new(0.499, Color3.fromHex("#abfbff")),
							ColorSequenceKeypoint.new(0.5, Color3.fromHex("#abfbff")),
							ColorSequenceKeypoint.new(1, Color3.fromHex("#d5b3ff"))
						}),
						["UIStrokeColor"] = Color3.fromRGB(40, 74, 58),
						["ImageScaleType"] = Enum.ScaleType.Fit,
						["ImageSize"] = UDim2.fromScale(0.9, 0.9),
						["ImagePosition"] = UDim2.fromScale(0.5, 0.5),
						["ImageRectOffset"] = Vector2.new(272, 0),
						["ImageRectSize"] = Vector2.new(136, 168)
					})
					local v_u_762 = Instance.new("Frame")
					v_u_762.Active = false
					v_u_762.Selectable = false
					v_u_762.Visible = false
					v_u_762.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
					v_u_762.Size = UDim2.fromScale(0.4, 0.4)
					v_u_762.Position = UDim2.fromScale(0.7, -0.1)
					Instance.new("UICorner", v_u_762).CornerRadius = UDim.new(1, 0)
					v_u_762.Parent = v761
					local v_u_763 = require(game.ReplicatedStorage.Controllers.UI.EasterCodex.EasterNetwork)
					local v_u_764 = require(game.ReplicatedStorage.Controllers.UI.EasterCodex)
					local function v767()
						-- upvalues: (copy) v_u_764, (copy) v_u_763, (copy) v_u_762
						local v765 = false
						if not v_u_764.IsOpen() then
							for _, v766 in pairs(v_u_763.Data.Index) do
								if v766.IsNew then
									v765 = true
									break
								end
							end
						end
						v_u_762.Visible = v765 == true
					end
					local v_u_768 = v_u_763.OnItemChanged(v767)
					v767()
					local v_u_769 = v761.MouseButton1Click:Connect(function(_, _)
						-- upvalues: (copy) v_u_762
						require(game.ReplicatedStorage.Controllers.UI.EasterCodex):Toggle()
						v_u_762.Visible = false
					end)
					v761.Destroying:Once(function(...)
						-- upvalues: (copy) v_u_768, (copy) v_u_769
						v_u_768:Disconnect()
						v_u_769:Disconnect()
					end)
					return v761
				end
			},
			["ValentinesEvent"] = {
				["Locations"] = {},
				["new"] = function(p770)
					-- upvalues: (copy) v_u_741
					if p770.TextButton then
						return p770.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#ffc5e7")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#ffc5e7")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#ed8fc2")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#ed8fc2"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(0.9, 0.9),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.5)
						})
					end
				end
			},
			["ValentinesEvent_Delivery"] = {
				["Locations"] = {},
				["new"] = function(p771)
					-- upvalues: (copy) v_u_741
					if p771.TextButton then
						return p771.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#ffc5e7")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#ffc5e7")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#ed8fc2")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#ed8fc2"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(0.9, 0.9),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.5)
						})
					end
				end
			},
			["SealedEgg"] = {
				["Locations"] = {},
				["new"] = function(p772)
					-- upvalues: (copy) v_u_741
					if p772.TextButton then
						return p772.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#b50000")),
								ColorSequenceKeypoint.new(0.492, Color3.fromHex("#b50000")),
								ColorSequenceKeypoint.new(0.513, Color3.fromHex("#b30000")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#b30000"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(1.1, 1.1),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.5)
						})
					end
				end
			},
			[("Friendly Neighborhood Egg_%*"):format(v_u_50.UserId)] = {
				["Locations"] = {},
				["new"] = function(p773)
					-- upvalues: (copy) v_u_741
					if p773.TextButton then
						return p773.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#ffff61")),
								ColorSequenceKeypoint.new(0.492, Color3.fromHex("#ffff61")),
								ColorSequenceKeypoint.new(0.513, Color3.fromHex("#cf8a00")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#cf8a00"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(0.95, 0.95),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.5)
						})
					end
				end
			},
			["AprilFoolsGacha"] = {
				["Locations"] = {},
				["new"] = function(p774)
					-- upvalues: (copy) v_u_741
					if p774.TextButton then
						return p774.TextButton
					else
						return v_u_741({
							["GradientColorSequence"] = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromHex("#002806")),
								ColorSequenceKeypoint.new(0.499, Color3.fromHex("#20AA1D")),
								ColorSequenceKeypoint.new(0.5, Color3.fromHex("#053300")),
								ColorSequenceKeypoint.new(1, Color3.fromHex("#306E00"))
							}),
							["ImageScaleType"] = Enum.ScaleType.Fit,
							["ImageSize"] = UDim2.fromScale(0.8, 0.8),
							["ImagePosition"] = UDim2.fromScale(0.5, 0.5)
						})
					end
				end
			}
		}
		local v_u_775 = nil
		local function v_u_793(p776)
			-- upvalues: (ref) v_u_742, (ref) v_u_626, (copy) v_u_65, (ref) v_u_625, (ref) v_u_775, (copy) v_u_19
			if next(v_u_742) then
				if v_u_626 or (v_u_65.Data.Tracking == true or v_u_625) then
					return
				else
					if v_u_775 then
						task.cancel(v_u_775)
						v_u_775 = nil
					end
					local function v_u_792()
						-- upvalues: (ref) v_u_742, (ref) v_u_65, (ref) v_u_19
						local v777 = {}
						for _, v778 in pairs(v_u_742) do
							local v779 = v778.TextButton
							if v779 then
								local v780 = {
									["Button"] = v779,
									["LayoutOrder"] = v779.LayoutOrder
								}
								table.insert(v777, v780)
							end
						end
						if #v777 ~= 0 then
							table.sort(v777, function(p781, p782)
								return p781.LayoutOrder < p782.LayoutOrder
							end)
							local v783 = v_u_65.SideCompass.Frame.AbsoluteSize
							local v784 = v783.X / 2 + (v_u_19:Get() == "Touch" and 3 or 0)
							local v785 = Vector2.new(v783.X / 2, v783.Y / 2)
							for v786 = 1, #v777 do
								local v787 = v777[v786]
								local v788 = -310 - (v786 - 1) * 45
								local v789 = math.rad(v788)
								local v790 = v785.X + math.cos(v789) * v784
								local v791 = v785.Y + math.sin(v789) * v784
								v787.Button.AnchorPoint = Vector2.new(0, 0)
								v787.Button.Position = UDim2.fromOffset(v790 - v787.Button.AbsoluteSize.X / 2, v791 - v787.Button.AbsoluteSize.Y / 2)
							end
						end
					end
					if p776 then
						v_u_775 = task.delay(0.1, function()
							-- upvalues: (ref) v_u_775, (copy) v_u_792
							v_u_775 = nil
							v_u_792()
						end)
					else
						v_u_792()
					end
				end
			else
				return
			end
		end
		v_u_636 = function()
			-- upvalues: (ref) v_u_742, (ref) v_u_626, (ref) v_u_625, (copy) v_u_65, (ref) v_u_636, (copy) v_u_651, (copy) v_u_793, (copy) v_u_725
			if not next(v_u_742) then
				return
			end
			local v794 = v_u_626 or v_u_625 or v_u_65.Data.Tracking == true
			for v_u_795, v_u_796 in pairs(v_u_742) do
				if v_u_796.Enabled == false then
					if v_u_796.TextButton then
						v_u_796.TextButton:Destroy()
						v_u_796.TextButton = nil
					end
				else
					if v_u_796.CollectionTagAdded == nil then
						local v_u_797 = nil
						v_u_796.CollectionTagAdded = game:GetService("CollectionService"):GetInstanceAddedSignal(v_u_795):Connect(function(_)
							-- upvalues: (ref) v_u_797, (ref) v_u_636
							if v_u_797 then
								task.cancel(v_u_797)
								v_u_797 = nil
							end
							v_u_797 = task.delay(0.5, function()
								-- upvalues: (ref) v_u_797, (ref) v_u_636
								v_u_797 = nil
								v_u_636()
							end)
						end)
					end
					if v_u_796.CollectionTagRemoved == nil then
						v_u_796.CollectionTagRemoved = game:GetService("CollectionService"):GetInstanceRemovedSignal(v_u_795):Connect(function(p798)
							-- upvalues: (copy) v_u_796, (ref) v_u_65, (ref) v_u_651, (ref) v_u_636
							local v799 = v_u_796.Locations[p798]
							v_u_796.Locations[p798] = nil
							if v799 then
								if v_u_65.Data.LastClosestNPC == v799.UID and not next(v_u_796.Locations) then
									v_u_651(false)
									return
								end
								v_u_636()
							end
						end)
					end
					for _, v_u_800 in pairs(game:GetService("CollectionService"):GetTagged(v_u_795)) do
						if not v_u_796.Locations[v_u_800] and (not v_u_796.ShouldCreateLocation or v_u_796.ShouldCreateLocation(v_u_800) == true) then
							local v801 = {
								["UID"] = game:GetService("HttpService"):GenerateGUID()
							}
							if v_u_800:IsA("Attachment") then
								function v801.GetPosition()
									-- upvalues: (copy) v_u_800
									return v_u_800.WorldPosition
								end
							elseif v_u_800:IsA("Model") then
								function v801.GetPosition()
									-- upvalues: (copy) v_u_800
									return v_u_800:GetPivot().Position
								end
							elseif v_u_800:IsA("BasePart") then
								function v801.GetPosition()
									-- upvalues: (copy) v_u_800
									return v_u_800.Position
								end
							elseif v_u_800:IsA("Workspace") then
								function v801.GetPosition()
									-- upvalues: (copy) v_u_800
									return v_u_800:GetPivot().Position
								end
							end
							if v801.GetPosition then
								v_u_796.Locations[v_u_800] = v801
							else
								warn((("unknown instance: %*"):format(v_u_800.ClassName)))
							end
						end
					end
					local v802
					if v_u_796.WorkspaceAttribute then
						if workspace:GetAttribute(v_u_796.WorkspaceAttribute) then
							v802 = true
							goto l34
						end
						if v_u_796.TextButton then
							v_u_796.TextButton:Destroy()
							v_u_796.TextButton = nil
						end
					else
						v802 = false
						::l34::
						if next(v_u_796.Locations) or v802 then
							local v803 = v_u_796.new(v_u_796)
							if not v_u_796.TextButton then
								v803.LayoutOrder = v_u_796.LayoutOrder
								v803.Activated:Connect(function()
									-- upvalues: (copy) v_u_796, (ref) v_u_651, (copy) v_u_795, (ref) v_u_65
									if v_u_796.SinkClick then
										return
									elseif v_u_796.TeleportFunction and v_u_796.TeleportFunction() or v_u_796.IsOnCooldown then
										return
									else
										local v804 = v_u_651(true)
										if v804 then
											if v_u_795 == "Lightning Event" then
												_G.TrackingLightningEvent = true
												v804:Add(game.Players.LocalPlayer:GetAttributeChangedSignal("LightningEnemyKilled"):Connect(function(...)
													-- upvalues: (ref) v_u_651
													v_u_651(false)
												end))
											elseif v_u_795 == "Oni Realm" or (v_u_795 == "Celestial Domain" or v_u_795 == "Celebration NPC") then
												v804:Add(game.Players.LocalPlayer:GetAttributeChangedSignal("CurrentLocation"):Connect(function()
													-- upvalues: (ref) v_u_795, (ref) v_u_651
													local v805 = game.Players.LocalPlayer:GetAttribute("CurrentLocation")
													if v_u_795 == "Oni Realm" and v805 == "Oni Realm" then
														v_u_651(false)
														return
													elseif v_u_795 == "Celestial Domain" and v805 == "Celestial Domain" then
														v_u_651(false)
													elseif v_u_795 == "Celebration NPC" and v805 == "Celebration Domain" then
														v_u_651(false)
													end
												end))
											elseif v_u_795 == "Corrupted Event" then
												_G.TrackingCorruptedEvent = true
												v804:Add(game.Players.LocalPlayer:GetAttributeChangedSignal("CorruptedEnemyKilled"):Connect(function(...)
													-- upvalues: (ref) v_u_651
													v_u_651(false)
												end))
											elseif v_u_795 == "Halloween Event" then
												v804:Add(game.Players.LocalPlayer:GetAttributeChangedSignal("TrickOrTreatDoorInteracted"):Connect(function(...)
													-- upvalues: (ref) v_u_651
													v_u_651(false)
												end))
											end
											function _G.GuideCallbacks.SpecialLocation(_, _, _)
												-- upvalues: (ref) v_u_796, (ref) v_u_651, (ref) v_u_65, (ref) v_u_795
												debug.profilebegin("SpecialLocation")
												local v806 = (1 / 0)
												local v807 = nil
												local v808 = nil
												for _, v809 in pairs(v_u_796.Locations) do
													local v810 = require(game.ReplicatedStorage.Modules.Tracking):GetLocation(game.Players.LocalPlayer)
													local v811 = workspace.CurrentCamera.CFrame
													if v810 and v810.CFrame then
														v811 = v810.CFrame
													end
													local v812 = v809.GetPosition()
													local v813 = (v811.Position - v812).Magnitude
													if v813 < v806 then
														v808 = v812
														v807 = v809
														v806 = v813
													end
												end
												debug.profileend()
												if v807 == nil then
													v_u_651(false)
													return nil
												else
													v_u_65.Data.LastClosestNPC = v807.UID
													return {
														v808,
														v_u_795,
														v_u_796.Description,
														false
													}
												end
											end
										end
									end
								end)
								v_u_796.TextButton = v803
							end
							v803.Visible = true
						elseif v_u_796.TextButton then
							v_u_796.TextButton:Destroy()
							v_u_796.TextButton = nil
						end
					end
				end
			end
			v_u_793()
			v_u_725.Visible = v794 == false
		end
		v_u_636()
		v_u_65.SideCompass:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: (copy) v_u_793
			v_u_793(true)
		end)
		local function v814()
			-- upvalues: (ref) v_u_636
			v_u_636()
		end
		v814()
		workspace:GetAttributeChangedSignal("HalloweenEventActive"):Connect(v814)
		workspace:GetAttributeChangedSignal("EasterClaimEnabled"):Connect(v814)
		task.spawn(function()
			-- upvalues: (ref) v_u_742, (copy) v_u_399, (ref) v_u_636
			if v_u_742.AprilFoolsGacha.Enabled then
				local v_u_815 = nil
				local function v_u_819(p816)
					-- upvalues: (ref) v_u_815
					if p816:IsA("Model") then
						local v817 = p816:GetAttribute("FloorPos") or p816:GetPivot().Position
						if v_u_815 then
							v_u_815.Position = v817
						else
							local v818 = Instance.new("Part")
							v818.Anchored = true
							v818.Transparency = 1
							v818.CanCollide = false
							v818.CanTouch = false
							v818.CanQuery = false
							v818.Position = v817
							v818.Parent = workspace
							v818:AddTag("AprilFoolsGacha")
							v_u_815 = v818
						end
					else
						return
					end
				end
				for _, v820 in v_u_399:GetTagged("AprilFoolsGacha") do
					v_u_819(v820)
					v_u_636()
				end
				v_u_399:GetInstanceAddedSignal("AprilFoolsGacha"):Connect(function(p821)
					-- upvalues: (copy) v_u_819, (ref) v_u_636
					v_u_819(p821)
					v_u_636()
				end)
				local function v822()
					-- upvalues: (ref) v_u_742, (ref) v_u_636
					v_u_742.AprilFoolsGacha.Enabled = game.Players.LocalPlayer:GetAttribute("AprilFoolsGachaTracker") and true or false
					v_u_636()
				end
				game.Players.LocalPlayer:GetAttributeChangedSignal("AprilFoolsGachaTracker"):Connect(v822)
				v_u_742.AprilFoolsGacha.Enabled = game.Players.LocalPlayer:GetAttribute("AprilFoolsGachaTracker") and true or false
				v_u_636()
			end
		end)
		v_u_633.Visible = false
		v_u_634.Visible = true
		v_u_627 = v_u_633
	end
	local v_u_823 = false
	v_u_2:GetPropertyChangedSignal("SelectedObject"):Connect(function()
		-- upvalues: (copy) v_u_400, (copy) v_u_103, (copy) v_u_2
		if v_u_400.Visible and (v_u_103.GamepadEnabled and (v_u_2.SelectedObject and (not v_u_2.SelectedObject:IsDescendantOf(v_u_400.Blackout) and v_u_400.Blackout.Visible))) then
			v_u_2.SelectedObject = v_u_400.Blackout.Confirm.Buy
		end
	end)
	local function v824()
		-- upvalues: (copy) v_u_28, (ref) v_u_403, (copy) v_u_400, (copy) v_u_67
		v_u_28:FireServer("FruitShop")
		v_u_403 = false
		v_u_400.Visible = false
		v_u_400.Position = UDim2.new(0.5, 0, 1.5, 0)
		v_u_67:Open("ShopGui")
	end
	_G.OpenFruitShop = v824
	task.spawn(function()
		require(script.FeaturedContent)()
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_435, (copy) v_u_434, (copy) v_u_400, (copy) v_u_71, (copy) v_u_28, (copy) v_u_78, (ref) v_u_34, (copy) v_u_21, (copy) v_u_62, (copy) v_u_50
		local v_u_825 = 0
		local v_u_826 = script.Parent
		local function v828()
			-- upvalues: (ref) v_u_435, (copy) v_u_826
			local v827 = v_u_435:Get()
			v_u_826.ShopButton.Badge.Visible = v827._Raw > 0
			v_u_826.ShopButton.Badge.UIGradient.Offset = Vector2.new(-10, 0)
			v_u_826.ShopButton.Badge.Badge.UIGradient.Offset = Vector2.new(-10, 0)
			v_u_826.ShopButton.Badge.Badge.TextLabel.Text = v827._String
		end
		task.spawn(v828)
		v_u_434:Connect(v828)
		local v_u_829 = v_u_400.MenuShop
		local v_u_830 = v_u_829.ScrollingFrame
		local _ = v_u_830.ViewAllFruits.More
		local _ = v_u_829.FruitBanner
		local v_u_831 = v_u_829.GiftBanner
		local v_u_832 = v_u_400.ClaimIcon
		local v833 = {
			["PaddingTop"] = v_u_829.UIPadding.PaddingTop,
			["PaddingBottom"] = v_u_829.UIPadding.PaddingBottom
		}
		local v834 = v_u_830.Size
		local v835 = v_u_830.Position
		local v836 = v_u_830.AnchorPoint
		local v_u_837 = {
			["Inactive"] = {
				["Position"] = v_u_832.Position,
				["AnchorPoint"] = v_u_832.AnchorPoint
			},
			["Active"] = {
				["Position"] = UDim2.new(0.895, 0, 0.11, 3),
				["AnchorPoint"] = Vector2.new(1, 0)
			}
		}
		local v_u_838 = nil
		local v_u_839 = {}
		local v842 = {
			["SetState"] = function(p840)
				-- upvalues: (copy) v_u_830, (copy) v_u_829, (copy) v_u_832, (copy) v_u_837, (copy) v_u_831
				local v841 = v_u_830:FindFirstChild("WideBanner")
				if v841 then
					if not v841:GetAttribute("OriginalSize") then
						v841:SetAttribute("OriginalSize", v841.Size)
					end
					v841.Size = v841:GetAttribute("OriginalSize")
				end
				v_u_830.Size = p840.ScrollingFrame.Size
				v_u_830.Position = p840.ScrollingFrame.Position
				v_u_830.AnchorPoint = p840.ScrollingFrame.AnchorPoint
				v_u_829.UIPadding.PaddingTop = p840.UIPadding.PaddingTop
				v_u_832.Position = v_u_837.Inactive.Position
				v_u_832.AnchorPoint = v_u_837.Inactive.AnchorPoint
				v_u_831.TextLabel.Visible = false
				v_u_831.Visible = false
				v_u_832.Visible = true
			end,
			["UIPadding"] = {
				["PaddingTop"] = v833.PaddingTop
			},
			["ScrollingFrame"] = {
				["Size"] = v834,
				["Position"] = v835,
				["AnchorPoint"] = v836
			}
		}
		v_u_839.Default = v842
		local v845 = {
			["SetState"] = function(p843)
				-- upvalues: (copy) v_u_830, (copy) v_u_829, (copy) v_u_832, (copy) v_u_837, (copy) v_u_831
				local v844 = v_u_830:FindFirstChild("WideBanner")
				if v844 then
					if not v844:GetAttribute("OriginalSize") then
						v844:SetAttribute("OriginalSize", v844.Size)
					end
					v844.Size = v844:GetAttribute("OriginalSize") - UDim2.fromScale(0, 0.06)
				end
				v_u_830.Size = p843.ScrollingFrame.Size
				v_u_830.Position = p843.ScrollingFrame.Position
				v_u_830.AnchorPoint = p843.ScrollingFrame.AnchorPoint
				v_u_829.UIPadding.PaddingTop = p843.UIPadding.PaddingTop
				v_u_832.Position = v_u_837.Active.Position
				v_u_832.AnchorPoint = v_u_837.Active.AnchorPoint
				v_u_831.TextLabel.Visible = true
				v_u_831.Visible = true
				v_u_832.Visible = true
			end,
			["UIPadding"] = {
				["PaddingTop"] = UDim.new(0, 0)
			},
			["ScrollingFrame"] = {
				["Size"] = UDim2.new(v834.X.Scale, v834.X.Offset, v834.Y.Scale - v_u_831.Size.Y.Scale, 0),
				["Position"] = UDim2.new(v835.X.Scale, v835.X.Offset, 1, 0),
				["AnchorPoint"] = Vector2.new(v836.X, 1)
			}
		}
		v_u_839.Gifts = v845
		local v_u_846 = nil
		local v_u_847 = nil
		local v_u_848 = v_u_832.UIGradient
		local function v_u_851()
			-- upvalues: (ref) v_u_846, (ref) v_u_847, (copy) v_u_831, (ref) v_u_71, (copy) v_u_832, (ref) v_u_838, (copy) v_u_848
			v_u_846 = v_u_847:Extend()
			v_u_846:Add(function()
				-- upvalues: (ref) v_u_846
				v_u_846 = nil
			end)
			v_u_846:Add(v_u_831.SinkBanner.Activated:Connect(function()
				-- upvalues: (ref) v_u_71
				closeMenu("Shop")
				v_u_71:Open()
			end))
			local _ = v_u_832.ImageLabel
			local v849 = Color3.fromRGB(255, 197, 20)
			v_u_832.ImageLabel.ImageColor3 = v849:Lerp(Color3.new(1, 1, 1), 0.1)
			local v850 = 0.016666666666666666
			while v_u_846 do
				if v_u_838 == "Gifts" then
					v_u_848.Rotation = (v_u_848.Rotation + v850 * 90) % 360
				end
				v850 = task.wait()
			end
		end
		local function v_u_853()
			-- upvalues: (ref) v_u_847, (ref) v_u_71, (ref) v_u_825, (ref) v_u_846, (copy) v_u_851, (copy) v_u_848, (ref) v_u_400, (ref) v_u_838, (copy) v_u_839
			if not v_u_847 then
				return false
			end
			v_u_825 = v_u_71:GetSummary().TotalGifts
			if v_u_825 == 0 then
				if v_u_846 then
					v_u_846:Destroy()
				end
			elseif not v_u_846 then
				task.spawn(v_u_851)
			end
			v_u_848.Enabled = v_u_825 > 0
			v_u_400.MenuShop.GiftBanner.TextLabel.Text = v_u_825 > 1 and ("You have %* UNCLAIMED gifts!"):format(v_u_825) or ("You have %* UNCLAIMED gift!"):format(v_u_825)
			local v852 = v_u_825 > 0 and "Gifts" or "Default"
			if v852 ~= v_u_838 then
				v_u_838 = v852
				v_u_839[v852]:SetState()
			end
		end
		local v_u_854 = false
		local v_u_855 = require(game.ReplicatedStorage.Modules.Create.PremiumGachaBanner)
		local function v_u_859()
			-- upvalues: (ref) v_u_28, (ref) v_u_854, (ref) v_u_78, (ref) v_u_847, (ref) v_u_34, (ref) v_u_435, (ref) v_u_71, (copy) v_u_853, (ref) v_u_21, (copy) v_u_830, (copy) v_u_855
			v_u_28:FireServer("Shop")
			if not v_u_854 then
				v_u_854 = true
				v_u_78:ReportShoppingStep({})
			end
			if not v_u_847 then
				v_u_847 = require(game.ReplicatedStorage.Modules.Util.Trove).new()
				v_u_847:Add(function()
					-- upvalues: (ref) v_u_34, (ref) v_u_847, (ref) v_u_435
					v_u_34 = false
					v_u_847 = nil
					v_u_435:Set(0)
				end)
				v_u_847:Add(v_u_71.GiftsChanged:Connect(v_u_853))
				v_u_853()
				if v_u_21.GACHA.PREMIUM_GACHA_ENABLED then
					local v856 = v_u_830:FindFirstChild("_PremiumGachaBanner")
					if v856 == nil then
						local v857 = Instance.new("Frame")
						v857.BackgroundTransparency = 1
						v857.Size = UDim2.fromScale(1, 1)
						v856 = game.ReplicatedStorage.Modules.Create.Templates.PremiumGachaBanner:Clone()
						v856.Size = UDim2.fromScale(1, 1)
						v856.Parent = v857
						Instance.new("UICorner", v857)
						local v858 = Instance.new("UIAspectRatioConstraint")
						v858.AspectRatio = 2.8
						v858.Parent = v857
						v857.LayoutOrder = -10
						v857.Name = "_PremiumGachaBanner"
						v857.Parent = v_u_830
					end
					v_u_847:Add(v_u_855({
						["Window"] = v856,
						["PurchaseFooter"] = v856:FindFirstChild("PurchaseFooter", true),
						["SelectionChanged"] = function(_)
							closeMenu("Shop")
							require(game.ReplicatedStorage.Controllers.SceneController).xmas25Controller():Prewarm(true)
							require(game.ReplicatedStorage.Controllers.UI.GachaWindow):Open("PremiumXmasGacha25")
						end,
						["PurchaseSelected"] = hookBuy
					}))
				end
			end
		end
		v_u_400:GetAttributeChangedSignal("IsVisible"):Connect(function()
			-- upvalues: (ref) v_u_400, (copy) v_u_859, (ref) v_u_847
			if v_u_400:GetAttribute("IsVisible") then
				v_u_859()
			elseif v_u_847 then
				v_u_847:Destroy()
			end
		end)
		v_u_400:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: (ref) v_u_400, (copy) v_u_859, (ref) v_u_847
			if v_u_400.Visible then
				v_u_859()
			elseif v_u_847 then
				v_u_847:Destroy()
			end
		end)
		local v_u_860 = 0
		local function v_u_864(p861, p862)
			-- upvalues: (ref) v_u_860, (ref) v_u_435, (ref) v_u_62
			if p862 < p861 then
				if v_u_860 ~= 0 then
					local v863 = p861 - p862
					if v863 == 1 then
						v_u_435:Increment(v863)
					elseif v863 > 1 then
						v_u_435:Set(v863)
					end
				end
				if v_u_860 == 0 then
					v_u_62.new("<Color=Green>You have unclaimed gifts, check the shop!<Color=/>", 5):Display()
				end
			end
			v_u_860 = v_u_860 + 1
		end
		local function v866()
			-- upvalues: (ref) v_u_50, (ref) v_u_435
			local v865 = v_u_50:GetAttribute("PromotionCount")
			if v865 then
				v_u_435:Increment(v865)
				v_u_50:SetAttribute("PromotionCount")
			end
		end
		v_u_50:GetAttributeChangedSignal("PromotionCount"):Connect(v866)
		local v867 = v_u_50:GetAttribute("PromotionCount")
		if v867 then
			v_u_435:Increment(v867)
			v_u_50:SetAttribute("PromotionCount")
		end
		v_u_71.GiftsChanged:Connect(v_u_864)
		v_u_832.Activated:Connect(function()
			-- upvalues: (ref) v_u_71
			closeMenu("Shop")
			v_u_71:Open()
		end)
		require(game.ReplicatedStorage.Modules.PlayerUtil).PlayerReady(game.Players.LocalPlayer, function()
			-- upvalues: (copy) v_u_839, (ref) v_u_71, (copy) v_u_864
			v_u_839.Default:SetState()
			v_u_864(v_u_71:GetSummary().TotalGifts, 0)
		end)
	end)
	local v_u_868 = nil
	local v_u_869 = {
		["NameMap"] = {
			["WinterCombo24"] = {},
			["HolidayEssentials24"] = {},
			["ULTIMATEBUNDLE24"] = {}
		},
		["IdMap"] = {
			[2679601475] = {},
			[2679601753] = {},
			[2679601096] = {}
		}
	}
	local v_u_870 = nil
	local function v_u_875(_)
		-- upvalues: (ref) v_u_868, (copy) v_u_869, (ref) v_u_870, (copy) v_u_74, (copy) v_u_400
		local v871 = v_u_868
		if v871 then
			v871 = v_u_869.NameMap[v_u_868]
		end
		if v871 then
			if not v_u_870 then
				v_u_870 = v_u_74:RemoteFunction("ShopNetworkRequest"):InvokeServer({
					["History"] = { "WinterCombo24", "HolidayEssentials24", "ULTIMATEBUNDLE24" }
				})
			end
			local v872 = v_u_870.Gifted[v_u_868]
			local v873 = v_u_400.Blackout.Confirm.Gift.TextLabel
			local v874 = v871.Max - v872
			v873.Text = ("Gift (%*)"):format((math.max(0, v874)))
		else
			v_u_400.Blackout.Confirm.Gift.TextLabel.Text = "Gift"
		end
	end
	game:GetService("MarketplaceService").PromptProductPurchaseFinished:Connect(function(_, p876, p877)
		-- upvalues: (copy) v_u_50, (copy) v_u_869, (ref) v_u_868, (ref) v_u_870
		if v_u_50 == game.Players.LocalPlayer and p877 then
			local v878 = v_u_869.IdMap[p876]
			if v878 and (v878.Name == v_u_868 and (v_u_870 and v_u_870.Gifted[v_u_868])) then
				local v879 = v_u_870.Gifted
				local v880 = v_u_868
				local v881 = v_u_870.Gifted[v_u_868] + 1
				v879[v880] = math.max(0, v881)
			end
		end
	end)
	function hookBuy(p_u_882, p_u_883, p_u_884)
		-- upvalues: (copy) v_u_70, (ref) v_u_868, (copy) v_u_875, (ref) v_u_823, (copy) v_u_78, (copy) v_u_22, (copy) v_u_60, (copy) v_u_400, (copy) v_u_103, (copy) v_u_2
		print("hookBuy", p_u_882)
		v_u_70:Close()
		v_u_868 = p_u_882
		if p_u_884 == nil then
			task.spawn(v_u_875)
		end
		if v_u_823 then
			print("buy busy")
			return
		else
			v_u_823 = true
			v_u_78:ReportShoppingStep({
				["storageName"] = p_u_882
			})
			local v_u_885 = v_u_22:GetLegacyRobuxItems()[p_u_882]
			if v_u_885 and not v_u_885.gift then
				if p_u_883 and p_u_883.Buy then
					p_u_883.Buy(v_u_885)
				else
					v_u_60.CommF_:InvokeServer("buyRobuxShop", {
						["StorageName"] = p_u_882
					})
				end
				v_u_823 = false
			else
				local v_u_886 = require(game.ReplicatedStorage.Modules.Util.Trove).new()
				v_u_886:Add(function()
					-- upvalues: (ref) v_u_886, (copy) p_u_884, (ref) v_u_400
					v_u_886 = nil
					if p_u_884 == nil then
						v_u_400.Blackout.Visible = false
					end
				end)
				if p_u_884 == nil then
					v_u_400.Blackout.Visible = true
					if v_u_103.GamepadEnabled then
						v_u_2.SelectedObject = v_u_400.Blackout.Confirm.Buy
					end
					v_u_886:Add(v_u_400.Blackout.Confirm.Cancel.Activated:Connect(function()
						-- upvalues: (ref) v_u_886, (ref) v_u_823
						if v_u_886 then
							v_u_886:Destroy()
						end
						v_u_823 = false
					end))
				end
				local function v888()
					-- upvalues: (ref) v_u_886, (ref) v_u_70, (copy) v_u_885, (ref) v_u_823
					if v_u_886 then
						v_u_886:Destroy()
					end
					local v887 = v_u_70:Open({
						["shopData"] = v_u_885
					})
					if v887 then
						v887:Add(function()
							-- upvalues: (ref) v_u_823
							v_u_823 = false
						end)
					else
						v_u_823 = false
					end
				end
				if p_u_884 == nil then
					v_u_886:Add(v_u_400.Blackout.Confirm.Gift.Activated:Connect(v888))
				elseif p_u_884 == "Gift" then
					v888()
				end
				local function v890()
					-- upvalues: (ref) v_u_886, (copy) p_u_883, (copy) v_u_885, (copy) p_u_882, (ref) v_u_60, (ref) v_u_823
					if v_u_886 then
						v_u_886:Destroy()
					end
					if p_u_883 and p_u_883.Buy then
						p_u_883.Buy(v_u_885)
					else
						local v889 = {
							["StorageName"] = p_u_882
						}
						v_u_60.CommF_:InvokeServer("buyRobuxShop", v889)
					end
					v_u_823 = false
				end
				if p_u_884 == nil then
					v_u_886:Add(v_u_400.Blackout.Confirm.Buy.Activated:Connect(v890))
				elseif p_u_884 == "Buy" then
					if v_u_886 then
						v_u_886:Destroy()
					end
					if p_u_883 and p_u_883.Buy then
						p_u_883.Buy(v_u_885)
					else
						v_u_60.CommF_:InvokeServer("buyRobuxShop", {
							["StorageName"] = p_u_882
						})
					end
					v_u_823 = false
				end
			end
		end
	end
	_G.hookBuy = hookBuy
	local function v_u_895(p891, p_u_892)
		p891:SetAttribute("ShopItem", p_u_892)
		if not p891:FindFirstChild("Bottom") then
			for _, v893 in pairs(p891:GetDescendants()) do
				if v893:IsA("TextLabel") and v893.Text:match("^R%$%d+$") then
					v893.Name = "TextLabel"
					v893.Parent.Name = "Bottom"
					break
				end
			end
		end
		local v894 = p891:FindFirstChild("Bottom")
		if v894 then
			v894:FindFirstChild("TextLabel").RichText = true
		end
		p891.Activated:Connect(function()
			-- upvalues: (copy) p_u_892
			hookBuy(p_u_892)
		end)
	end
	task.spawn(function()
		-- upvalues: (copy) v_u_401
		local v896 = Instance.new("Frame")
		v896.Name = "end"
		v896.BackgroundTransparency = 1
		v896.LayoutOrder = 999
		v896.Size = UDim2.fromScale(1, 0.04)
		v896.SizeConstraint = Enum.SizeConstraint.RelativeXX
		v896.ZIndex = 2
		local v897 = Instance.new("Frame")
		v897.Name = "Frame"
		v897.BackgroundTransparency = 1
		v897.Position = UDim2.fromScale(0, 1)
		v897.Size = UDim2.new(1, 0, 0, 1)
		v897.ZIndex = 2
		v897.Parent = v896
		v896.Parent = v_u_401
	end)
	if not v_u_31 then
		task.spawn(function()
			-- upvalues: (copy) v_u_401, (copy) v_u_20, (copy) v_u_23
			local v898 = v_u_401.FragmentsFrame:Clone()
			v898.Name = "SimDataFrame"
			v898.Parent = v_u_401
			v898.LayoutOrder = 20
			local v899 = Instance.new("UIGradient")
			v899.Name = "UIGradient"
			v899.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(155, 211, 255)), ColorSequenceKeypoint.new(0.481667, Color3.fromRGB(198, 224, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(137, 190, 255)) })
			v899.Parent = v898.TextLabel
			v898.TextLabel.Text = "SIMULATION DATA"
			local v900 = v_u_401.Fragments:Clone()
			v900.Name = "SimData"
			v900.Parent = v_u_401
			v900.LayoutOrder = 21
			v900.Visible = true
			v898.Visible = true
			local v901 = require(game.ReplicatedStorage.Spritesheets)
			local v902 = require(game.ReplicatedStorage.Economy.ItemId)
			for v903, v904 in {
				"200",
				"1000",
				"2700",
				"6000",
				"10000"
			} do
				local v905 = v902.getId(("%* Simulation Data"):format(v904), "Redeemable"):unwrapOr(nil)
				local v906 = v_u_20.tryGet(v905)
				local v907 = v900:FindFirstChild("Pack" .. v903)
				if v907 and v905 then
					local v_u_908 = ("%* Simulation Data"):format(v904)
					v907:SetAttribute("ShopItem", v_u_908)
					local v909 = v901.MAP[("%* Simulation Data"):format(v904)]
					if v909 then
						v907.Top.TextLabel.Text = "+" .. ("%* Simulation Data"):format(v904)
						v907.Top.ImageLabel.ImageColor3 = Color3.fromRGB(121, 200, 241)
						v907.Middle.ImageLabel.Image = v909.Image
						v907.Middle.ImageLabel.ImageRectOffset = v909.ImageRectOffset
						v907.Middle.ImageLabel.ImageRectSize = v909.ImageRectSize
						v907.Bottom.TextLabel.Text = ("\238\128\130 %*"):format((v_u_23.getPrice(v906.Index.ItemId)))
					else
						warn("No sprite for", (("%* Simulation Data"):format(v904)))
						v900.Visible = false
						v898.Visible = false
					end
					v907.Activated:Connect(function()
						-- upvalues: (copy) v_u_908
						hookBuy(v_u_908)
					end)
				elseif v907 then
					warn((("no bagid %*:%*"):format(v903, v904)))
					v900.Visible = false
					v898.Visible = false
				end
			end
		end)
	end
	if v_u_31 then
		v_u_895(v_u_401:WaitForChild("Beli").Pack1, "10K Money")
		v_u_895(v_u_401:WaitForChild("Beli").Pack2, "50K Money")
		v_u_895(v_u_401:WaitForChild("Beli").Pack3, "135K Money")
		v_u_895(v_u_401:WaitForChild("Beli").Pack4, "300K Money")
		v_u_895(v_u_401:WaitForChild("Beli").Pack5, "500K Money")
	else
		local v910 = {}
		if v_u_17.getCurrentRealmDifficultyAsync() >= 3 then
			v_u_895(v_u_401:WaitForChild("Beli").Pack1, "60K Money")
			v_u_895(v_u_401:WaitForChild("Beli").Pack2, "305K Money")
			v_u_895(v_u_401:WaitForChild("Beli").Pack3, "810K Money")
			v_u_895(v_u_401:WaitForChild("Beli").Pack4, "1.8M Money")
			v_u_895(v_u_401:WaitForChild("Beli").Pack5, "3M Money")
			v910 = {}
		elseif v_u_17.getCurrentRealmDifficultyAsync() == 2 then
			v_u_895(v_u_401:WaitForChild("Beli").Pack1, "30K Money")
			v_u_895(v_u_401:WaitForChild("Beli").Pack2, "150K Money")
			v_u_895(v_u_401:WaitForChild("Beli").Pack3, "405K Money")
			v_u_895(v_u_401:WaitForChild("Beli").Pack4, "900K Money")
			v_u_895(v_u_401:WaitForChild("Beli").Pack5, "1.5M Money")
		end
		for _, v911 in pairs(v_u_401:WaitForChild("Beli"):GetChildren()) do
			local v912 = v911:FindFirstChild("Top")
			if v912 then
				v912.TextLabel.Text = v910[v911.Name]
			end
		end
		local v913 = {}
		local v914 = {}
		for _, v915 in pairs(v_u_401:WaitForChild("Fragments"):GetChildren()) do
			local v916 = v915:FindFirstChild("Top")
			local v917 = v915:FindFirstChild("Bottom")
			if v916 then
				v916.TextLabel.Text = v913[v915.Name]
			end
			if v917 then
				v917.TextLabel.Text = v914[v915.Name]
			end
		end
		v_u_895(v_u_401:WaitForChild("Fragments").Pack1, "500 Fragments")
		v_u_895(v_u_401:WaitForChild("Fragments").Pack2, "2.1K Fragments")
		v_u_895(v_u_401:WaitForChild("Fragments").Pack3, "4.5K Fragments")
		v_u_895(v_u_401:WaitForChild("Fragments").Pack4, "10K Fragments")
		v_u_895(v_u_401:WaitForChild("Fragments").Pack5, "16K Fragments")
	end
	local function v919(p_u_918)
		if p_u_918:GetAttribute("ShopHooked") then
			return
		elseif p_u_918.Name == "DualBanner" then
			p_u_918.Pack1.Activated:Connect(function()
				-- upvalues: (copy) p_u_918
				hookBuy(p_u_918.Pack1:GetAttribute("ShopItem2"))
			end)
			p_u_918.Pack2.Activated:Connect(function()
				-- upvalues: (copy) p_u_918
				hookBuy(p_u_918.Pack2:GetAttribute("ShopItem2"))
			end)
			p_u_918:SetAttribute("ShopHooked", true)
		elseif p_u_918.Name == "WideBanner" then
			p_u_918.Pack1.Activated:Connect(function()
				-- upvalues: (copy) p_u_918
				hookBuy(p_u_918.Pack1:GetAttribute("ShopItem2"))
			end)
			p_u_918:SetAttribute("ShopHooked", true)
		end
	end
	v_u_401.ChildAdded:Connect(v919)
	for _, v920 in pairs(v_u_401:GetChildren()) do
		v919(v920)
	end
	v_u_895(v_u_401:WaitForChild("Products").RespawnAll, "Respawn Bosses")
	v_u_895(v_u_401:WaitForChild("Products").RefundStats, "Refund Points")
	v_u_895(v_u_401:WaitForChild("Products").ChangeRace, "Change Race")
	v_u_895(v_u_401:WaitForChild("Products2").UpgradeBag, "+1 Fruit Storage")
	if v_u_17.getCurrentRealmDifficultyAsync() < 3 then
		for _, v921 in pairs(v_u_401.Products2.ScrollPack1:GetChildren()) do
			v921:Destroy()
		end
		for _, v922 in pairs(v_u_401.Products2.ScrollPack2:GetChildren()) do
			v922:Destroy()
		end
		v_u_401.Products2.ScrollPack1.ImageColor3 = v_u_401.Products2.ScrollPack1.ImageColor3:Lerp(Color3.new(1, 1, 1), 0.11)
		v_u_401.Products2.ScrollPack2.ImageColor3 = v_u_401.Products2.ScrollPack2.ImageColor3:Lerp(Color3.new(1, 1, 1), 0.11)
	else
		v_u_895(v_u_401:WaitForChild("Products2").ScrollPack1, "5x Legendary Scrolls")
		v_u_895(v_u_401:WaitForChild("Products2").ScrollPack2, "3x Mythical Scrolls")
	end
	v_u_401:WaitForChild("Premium").Pack1.Activated:Connect(function()
		-- upvalues: (copy) v_u_60
		v_u_60.CommF_:InvokeServer("buyPremium")
	end)
	v_u_401:WaitForChild("ViewAllFruits").More.More.Activated:Connect(v824)
	v_u_67.OnClose:Connect(function(p923)
		-- upvalues: (ref) v_u_403, (copy) v_u_400
		if p923 == "ShopGui" then
			v_u_403 = true
			v_u_400.Visible = true
			v_u_400.Position = UDim2.new(0.5, 0, 0.5, 0)
		end
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_401, (copy) v_u_400
		local function v931(p924, p925)
			local v926 = p925 or Color3.new(1, 0, 0)
			local v927 = p924:GetChildren()
			local v928 = p924:Clone()
			v928:ClearAllChildren()
			v928.Size = UDim2.new(1, -4, 1, -4)
			v928.Position = UDim2.new(0, 2, 0, 2)
			v928.Parent = p924
			p924.Image = ""
			p924.BackgroundColor3 = Color3.new(1, 1, 1)
			local v929 = Instance.new("UIGradient")
			v929.Color = ColorSequence.new(v926, v926:Lerp(Color3.new(1, 1, 1), 0.8))
			v929.Parent = p924
			p924.Parent:WaitForChild("Top"):WaitForChild("ImageLabel").ImageColor3 = v926:Lerp(Color3.new(1, 1, 1), 0.1)
			for _, v930 in pairs(v927) do
				if v930:IsA("ImageLabel") then
					v930.ZIndex = v930.ZIndex + 1
				end
			end
			return v929
		end
		local v932 = {
			["p1"] = v931(v_u_401:WaitForChild("MiscFruits"):WaitForChild("Pack1"):WaitForChild("Middle"), Color3.fromRGB(179, 179, 179)),
			["p2"] = v931(v_u_401:WaitForChild("MiscFruits"):WaitForChild("Pack2"):WaitForChild("Middle"), Color3.fromRGB(92, 140, 211)),
			["p3"] = v931(v_u_401:WaitForChild("MiscFruits"):WaitForChild("Pack3"):WaitForChild("Middle"), Color3.fromRGB(140, 82, 255)),
			["p4"] = v931(v_u_401:WaitForChild("MiscFruits"):WaitForChild("Pack4"):WaitForChild("Middle"), Color3.fromRGB(213, 43, 228)),
			["p5"] = v931(v_u_401:WaitForChild("MiscFruits"):WaitForChild("Pack5"):WaitForChild("Middle"), Color3.fromRGB(238, 47, 50))
		}
		local v933 = {}
		local v934 = 0.016666666666666666
		local v935 = {}
		while true do
			while v_u_400:GetAttribute("IsVisible") do
				v933.Rotation = (v933.Rotation + v934 * 90) % 360
				local v936 = v933.Rotation
				local v937 = math.rad(v936)
				v935.Rotation = math.sin(v937) * 5
				v932.p1.Rotation = v933.Rotation
				v932.p2.Rotation = v933.Rotation
				v932.p3.Rotation = v933.Rotation
				v932.p4.Rotation = v933.Rotation
				v932.p5.Rotation = v933.Rotation
				v934 = task.wait()
			end
			v_u_400:GetAttributeChangedSignal("IsVisible"):Wait()
		end
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_401, (copy) v_u_22, (copy) v_u_27, (copy) v_u_20, (copy) v_u_23, (copy) v_u_895
		-- failed to decompile
	end)
	v_u_895(v_u_401:WaitForChild("Exp").Exp1, "2x EXP (15 mins.)")
	v_u_895(v_u_401:WaitForChild("Exp").Exp2, "2x EXP (1 hour)")
	v_u_895(v_u_401:WaitForChild("Exp").Exp3, "2x EXP (6 hours)")
	v_u_895(v_u_401:WaitForChild("Exp").Exp4, "2x EXP (12 hours)")
	v_u_895(v_u_401:WaitForChild("Exp").Exp5, "2x EXP (24 hours)")
	v_u_895(v_u_401:WaitForChild("Gamepasses1").DoubleBeli, "2x Money")
	v_u_895(v_u_401:WaitForChild("Gamepasses2").DoubleMastery, "2x Mastery")
	v_u_895(v_u_401:WaitForChild("Gamepasses1").DoubleDrops, "2x Boss Drops")
	v_u_895(v_u_401:WaitForChild("Gamepasses2").Yoru, "Dark Blade")
	v_u_895(v_u_401:WaitForChild("Gamepasses2").Notifier, "Fruit Notifier")
	v_u_895(v_u_401:WaitForChild("Gamepasses1").FastBoat, "Fast Boats")
	local v_u_946 = {
		["loadData"] = function(_)
			-- upvalues: (copy) v_u_55, (copy) v_u_60
			for _, v938 in pairs(v_u_55.BottomContainer.Frame:GetChildren()) do
				if v938:IsA("ImageButton") and v938.Name ~= "Template" then
					v938:Destroy()
				end
			end
			for _, v939 in pairs(v_u_55.TopContainer.Frame:GetChildren()) do
				if v939:IsA("ImageButton") and v939.Name ~= "Template" then
					v939:Destroy()
				end
			end
			local v940 = v_u_60.CommF_:InvokeServer("getAwakenedAbilities")
			local v941 = 0
			local v942 = {}
			for _, _ in next, v940 do
				v941 = v941 + 1
			end
			local v943 = 1
			for _, v_u_944 in next, v940 do
				if v_u_944.Awakened then
					local v_u_945 = v_u_55.TopContainer.Frame.Template:Clone()
					v_u_945.Name = v_u_944.Key
					v_u_945.Label.Text = v_u_944.Enabled and "(Awakened)" or "(Unawakened)"
					v_u_945.ImageLabel.ImageColor3 = v_u_944.Enabled and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
					v_u_945.TextLabel.Text = v_u_944.Key
					v_u_945.Activated:Connect(function()
						-- upvalues: (copy) v_u_945, (ref) v_u_60, (copy) v_u_944
						if v_u_945.Label.Text == "(Unawakened)" then
							v_u_945.Label.Text = "(Awakened)"
							v_u_945.ImageLabel.ImageColor3 = Color3.new(0, 1, 0)
						else
							v_u_945.Label.Text = "(Unawakened)"
							v_u_945.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
						end
						v_u_60.CommF_:InvokeServer("toggleAwakening", v_u_944.Key)
					end)
					v_u_945.LayoutOrder = v942[v_u_944.Key] or 6
					if v941 > 5 and v943 > 3 then
						v_u_945.Parent = v_u_55.BottomContainer.Frame
					else
						v_u_945.Parent = v_u_55.TopContainer.Frame
					end
					v_u_945.Visible = true
					v943 = v943 + 1
				else
					local _ = v_u_944.HiddenSkill
				end
			end
			v_u_55.BottomContainer.Visible = v941 > 5
		end
	}
	v_u_55:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: (copy) v_u_55, (ref) v_u_402, (ref) v_u_403, (ref) v_u_404, (ref) v_u_405, (copy) v_u_946
		if v_u_55.Visible then
			if v_u_402 then
				statsMenuFunction()
			end
			if v_u_403 then
				shopMenuFunction()
			end
			if v_u_404 then
				alliesMenuFunction()
			end
			if v_u_405 then
				crewMenuFunction()
			end
			v_u_946:loadData()
		end
	end)
	v_u_55:WaitForChild("Info"):WaitForChild("Exit").Activated:Connect(function()
		-- upvalues: (copy) v_u_55
		v_u_55.Visible = false
	end)
	local v_u_969 = {
		["loadData"] = function(_, p947)
			-- upvalues: (copy) v_u_56, (copy) v_u_60, (copy) v_u_969
			local v_u_948 = {
				["gui"] = v_u_56
			}
			if not p947 then
				for _, v949 in pairs(v_u_948.gui.Left.Container.Titles.ScrollingFrame:GetChildren()) do
					if v949:IsA("Frame") and v949.Name ~= "Template" then
						v949:Destroy()
					end
				end
			end
			local v950, v951, v952 = v_u_60.CommF_:InvokeServer("getTitles")
			local v953 = {}
			local v954 = 0
			local v955 = 0
			for _, v956 in next, v950 do
				local v957 = v956.Index
				table.insert(v953, v957)
			end
			table.sort(v953)
			if not p947 then
				for _, v_u_958 in next, v950 do
					v954 = v954 + 1
					local v_u_959 = v_u_948.gui.Left.Container.Titles.ScrollingFrame.Template:Clone()
					v_u_959.Desc.Text = " " .. v_u_958.Description
					local v960 = 0
					for v961, v962 in pairs(v953) do
						if v962 == v_u_958.Index then
							v953[v961] = -1
							v960 = v961
							break
						end
					end
					local v963 = ("%03d"):format(v960)
					if v_u_958.Unlocked then
						v955 = v955 + 1
						v_u_959.Activate.Visible = true
					else
						v_u_959.Activate.Visible = false
					end
					v_u_959.Title.Text = " #" .. v963 .. " " .. v_u_958.Name
					v_u_959.Activate.Activated:Connect(function()
						-- upvalues: (ref) v_u_60, (copy) v_u_958, (copy) v_u_959, (ref) v_u_969
						v_u_60.CommF_:InvokeServer("activateTitle", v_u_958.EventName or v_u_959.Name)
						v_u_969:loadData(true)
					end)
					v_u_959.Name = v_u_958.Name
					v_u_959.LayoutOrder = v_u_958.Index
					v_u_959.Parent = v_u_948.gui.Left.Container.Titles.ScrollingFrame
					v_u_959.Visible = true
				end
				v_u_948.gui.Info.TextLabel.Text = " Choose a title to show next to your chat tag. (" .. v955 .. "/" .. v954 .. ")"
			end
			if not v_u_948.gui.Left.Container.Titles.ScrollingFrame:GetAttribute("AutoSizeHooked") then
				v_u_948.gui.Left.Container.Titles.ScrollingFrame:SetAttribute("AutoSizeHooked", true)
				v_u_948.gui.Left.Container.Titles.ScrollingFrame.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					-- upvalues: (copy) v_u_948
					v_u_948.gui.Left.Container.Titles.ScrollingFrame.CanvasSize = UDim2.fromOffset(0, v_u_948.gui.Left.Container.Titles.ScrollingFrame.UIListLayout.AbsoluteContentSize.Y)
				end)
			end
			for _, v964 in pairs(v_u_948.gui.Right.ScrollingFrame:GetChildren()) do
				if v964:IsA("Frame") and v964.Name ~= "Template" then
					v964:Destroy()
				end
			end
			for v965, v966 in pairs(v952) do
				local v_u_967 = v_u_948.gui.Right.ScrollingFrame.Template:Clone()
				local v968
				if tonumber(v965) then
					v968 = v965
				else
					local _ = v965 == "Default"
					v968 = -2
				end
				v_u_967.LayoutOrder = v968
				v_u_967.Activate.Visible = v966.Unlocked and true or false
				v_u_967.Activate.TextLabel.Text = v951 == v965 and "[Equipped]" or (v966.OnSale and "Buy" or "Equip")
				v_u_967.Title.TextColor3 = v966.Color
				v_u_967.Title.Text = v966.ColorName
				v_u_967.Desc.Text = v966.Desc
				v_u_967.Name = v965
				v_u_967.Parent = v_u_948.gui.Right.ScrollingFrame
				v_u_967.Visible = true
				v_u_967.Activate.Activated:Connect(function()
					-- upvalues: (ref) v_u_60, (copy) v_u_967, (ref) v_u_969
					v_u_60.CommF_:InvokeServer("activateTitleColor", v_u_967.Name)
					v_u_969:loadData(true)
				end)
			end
			if not v_u_948.gui.Right.ScrollingFrame:GetAttribute("AutoSizeHooked") then
				v_u_948.gui.Right.ScrollingFrame:SetAttribute("AutoSizeHooked", true)
				v_u_948.gui.Right.ScrollingFrame.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					-- upvalues: (copy) v_u_948
					v_u_948.gui.Right.ScrollingFrame.CanvasSize = UDim2.fromOffset(0, v_u_948.gui.Right.ScrollingFrame.UIListLayout.AbsoluteContentSize.Y)
				end)
			end
		end
	}
	v_u_56:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: (copy) v_u_56, (ref) v_u_402, (ref) v_u_403, (ref) v_u_404, (ref) v_u_405, (copy) v_u_969
		if v_u_56.Visible then
			if v_u_402 then
				statsMenuFunction()
			end
			if v_u_403 then
				shopMenuFunction()
			end
			if v_u_404 then
				alliesMenuFunction()
			end
			if v_u_405 then
				crewMenuFunction()
			end
			v_u_969:loadData()
		end
	end)
	v_u_56:WaitForChild("Info"):WaitForChild("Exit").Activated:Connect(function()
		-- upvalues: (copy) v_u_56
		v_u_56.Visible = false
	end)
	v_u_56:WaitForChild("Info"):WaitForChild("Disable").Activated:Connect(function()
		-- upvalues: (copy) v_u_60
		v_u_60.CommF_:InvokeServer("activateTitle", "")
	end)
	v_u_57:WaitForChild("Info"):WaitForChild("Exit").Activated:Connect(function()
		-- upvalues: (copy) v_u_57
		v_u_57.Visible = false
	end)
	v_u_57:WaitForChild("Info"):WaitForChild("Disable").Activated:Connect(function()
		-- upvalues: (copy) v_u_60
		v_u_60.CommF_:InvokeServer("activateColor", "")
	end)
	v_u_552 = {
		["players"] = v_u_58.Container.Players,
		["requests"] = v_u_58.Container.Requests,
		["allies"] = v_u_58.Container.Allies,
		["load"] = function(p970)
			-- upvalues: (copy) v_u_50
			p970:removeAll()
			local v971 = next
			local v972, v973 = game.Players:GetPlayers()
			for _, v974 in v971, v972, v973 do
				if v974 ~= v_u_50 and v974.Team == game.Teams.Pirates then
					p970:displayItem(v974)
				end
			end
		end,
		["removeAll"] = function(p975)
			p975.invites = 0
			for _, v976 in next, { p975.players, p975.requests, p975.allies } do
				local v977 = next
				local v978, v979 = v976.ScrollingFrame.Frame:GetChildren()
				for _, v980 in v977, v978, v979 do
					if v980:IsA("ImageButton") and v980.Name ~= "Template" then
						v980:Destroy()
					end
				end
			end
			p975:adjustBar()
		end,
		["adjustBar"] = function(p981)
			-- upvalues: (copy) v_u_53, (ref) v_u_552
			for _, v982 in next, { p981.players, p981.requests, p981.allies } do
				local v983 = v982.ScrollingFrame
				local v984 = v983.Frame.Template
				local v985 = #v983.Frame:GetChildren() - 2
				v983.CanvasSize = UDim2.new(0, 0, v985 * v984.Size.Y.Scale * 1.5, 0)
			end
			v_u_53.HUDButtonBar.AlliesButton.Notify.Visible = v_u_552.invites > 0
		end,
		["displayItem"] = function(p_u_986, p_u_987)
			-- upvalues: (copy) v_u_50, (copy) v_u_60
			local v_u_988 = p_u_986.players
			local v_u_989 = nil
			local v990 = nil
			if game:GetService("CollectionService"):HasTag(p_u_987, "Ally" .. v_u_50.Name) or (game:GetService("CollectionService"):HasTag(v_u_50, "Ally" .. p_u_987.Name) or p_u_987.Team == game.Teams.Marines and v_u_50.Team == game.Teams.Marines) then
				v_u_988 = p_u_986.allies
			elseif game:GetService("CollectionService"):HasTag(v_u_50, "Requested" .. p_u_987.Name) then
				v_u_988 = p_u_986.requests
				p_u_986.invites = p_u_986.invites + 1
			elseif game:GetService("CollectionService"):HasTag(p_u_987, "Requested" .. v_u_50.Name) then
				v_u_989 = Color3.fromRGB(50, 250, 50)
				v990 = "(Pending)"
			end
			local v_u_991 = p_u_987.Name
			local v_u_992 = v_u_988.ScrollingFrame.Frame.Template:Clone()
			if v_u_989 then
				v_u_992.ImageLabel.ImageColor3 = v_u_989
			end
			if v990 then
				v_u_992.Label.Text = v990
			end
			v_u_992.Name = v_u_991
			v_u_992.TextLabel.Text = v_u_991
			if v_u_988 == p_u_986.requests then
				v_u_992.Accept.Activated:Connect(function()
					-- upvalues: (copy) p_u_986, (ref) v_u_60, (copy) v_u_991, (copy) v_u_992, (copy) p_u_987
					if not p_u_986.busy then
						p_u_986.busy = true
						v_u_60.CommF_:InvokeServer("AcceptAlly", v_u_991)
						p_u_986.invites = p_u_986.invites - 1
						v_u_992:Destroy()
						p_u_986:displayItem(p_u_987)
						p_u_986.busy = false
					end
				end)
				v_u_992.Cancel.Activated:Connect(function()
					-- upvalues: (copy) p_u_986, (ref) v_u_60, (copy) v_u_991, (copy) v_u_992, (copy) p_u_987
					if not p_u_986.busy then
						p_u_986.busy = true
						v_u_60.CommF_:InvokeServer("CancelAlly", v_u_991)
						p_u_986.invites = p_u_986.invites - 1
						v_u_992:Destroy()
						p_u_986:displayItem(p_u_987)
						p_u_986.busy = false
					end
				end)
			else
				v_u_992.Activated:Connect(function()
					-- upvalues: (ref) v_u_989, (copy) p_u_986, (ref) v_u_988, (ref) v_u_60, (copy) v_u_991, (copy) v_u_992, (copy) p_u_987
					if v_u_989 == nil then
						if not p_u_986.busy then
							p_u_986.busy = true
							if v_u_988 == p_u_986.players then
								if v_u_60.CommF_:InvokeServer("InviteAlly", v_u_991) then
									v_u_992:Destroy()
									p_u_986:displayItem(p_u_987)
								end
							elseif v_u_988 == p_u_986.allies and v_u_60.CommF_:InvokeServer("RemoveAlly", v_u_991) then
								v_u_992:Destroy()
								p_u_986:displayItem(p_u_987)
							end
							p_u_986.busy = false
						end
					else
						return
					end
				end)
			end
			v_u_992.Parent = v_u_988.ScrollingFrame.Frame
			v_u_992.Visible = true
			p_u_986:adjustBar()
		end
	}
	v_u_60.Allies.OnClientEvent:Connect(function()
		-- upvalues: (ref) v_u_552
		v_u_552:load()
	end)
	v_u_50:GetPropertyChangedSignal("Team"):Connect(function()
		-- upvalues: (copy) v_u_76, (copy) v_u_2
		if v_u_76() then
			v_u_2.TouchControlsEnabled = true
		end
		require(script.Parent.Shared).reflectHUDButtonVisibility()
	end)
	require(script.Parent.Shared).EnableGuiComponentsOnSpawn()
	local v_u_993 = v_u_53.HUDButtonBar.Settings:WaitForChild("Buttons")
	_G.postSpawn = {}
	local function v_u_997(p994)
		-- upvalues: (copy) v_u_103, (copy) v_u_62, (copy) v_u_2, (copy) v_u_53
		v_u_103:SetNavigationGamepad(p994, true)
		local v995 = _G.postSpawn
		local function v996()
			-- upvalues: (ref) v_u_103, (ref) v_u_62, (ref) v_u_2
			if v_u_103.GamepadEnabled then
				v_u_62.new("<Color=Green>Console mode activated (Gamepad).<Color=/>"):Display()
			end
			v_u_2.SelectedObject = nil
		end
		table.insert(v995, v996)
		v_u_2.SelectedObject = v_u_53:WaitForChild("ChooseTeam"):WaitForChild("Container"):WaitForChild("Pirates"):WaitForChild("Frame"):WaitForChild("TextButton")
	end
	v_u_103.GamepadConnected:Connect(function(p998)
		-- upvalues: (copy) v_u_62, (copy) v_u_997
		v_u_62.new("<Color=Green>Console mode activated (Gamepad).<Color=/>"):Display()
		v_u_997(p998)
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_103, (copy) v_u_997
		for _, v999 in v_u_103:GetConnectedGamepads() do
			v_u_997(v999)
		end
	end)
	v_u_60:WaitForChild("BreakTree").OnClientEvent:Connect(function(p1000)
		local v_u_1001 = _G.Encode(p1000)
		if v_u_1001.Parent ~= nil then
			local v_u_1002 = v_u_1001.Parent
			local v1003 = v_u_1001:Clone()
			v1003.Parent = v_u_1001.Parent
			v_u_1001.Parent = nil
			require(game.ReplicatedStorage.Effect).new("TreeBreak"):replicate({ v1003 })
			if _G.reducing then
				local v1004 = Enum.Material.SmoothPlastic
				local v1005 = next
				local v1006, v1007 = v1003:GetDescendants()
				for _, v1008 in v1005, v1006, v1007 do
					if v1008:IsA("BasePart") then
						v1008.Material = v1004
					end
				end
			end
			task.delay(10, function()
				-- upvalues: (ref) v_u_1001, (copy) v_u_1002
				v_u_1001.Parent = v_u_1002
			end)
		end
	end)
	v_u_60:WaitForChild("RegenModel").OnClientEvent:Connect(function(p1009)
		local v1010 = _G.Encode(p1009)
		if _G.reducing then
			local v1011 = Enum.Material.SmoothPlastic
			local v1012 = next
			local v1013, v1014 = v1010:GetDescendants()
			for _, v1015 in v1012, v1013, v1014 do
				if v1015:IsA("BasePart") then
					v1015.Material = v1011
				end
			end
		end
	end)
	local v_u_1016 = v_u_53:WaitForChild("ChooseTeam")
	_G.reducing = false
	function disableAllyEffects(p1017)
		if game.Players.LocalPlayer:GetAttribute("DisableAllyEffects") then
			p1017.TextLabel.Text = "Ally FX (ON)"
			game.Players.LocalPlayer:SetAttribute("DisableAllyEffects", false)
		else
			p1017.TextLabel.Text = "Ally FX (OFF)"
			game.Players.LocalPlayer:SetAttribute("DisableAllyEffects", true)
		end
	end
	v_u_1016:WaitForChild("FastModeButton").Activated:Connect(function()
		-- upvalues: (copy) v_u_1016, (copy) v_u_993, (copy) v_u_79
		local v_u_1018 = v_u_1016:FindFirstChild("FastModeButton")
		if v_u_1018 then
			v_u_1018 = v_u_1016.FastModeButton:FindFirstChild("TextLabel")
		end
		local v_u_1019 = v_u_993.Page2.FastModeButton.TextLabel
		local v1020 = {}
		if not _G.reducing then
			_G.reducing = true
			if v_u_1018 then
				v_u_1018.Text = "Working.."
				v_u_1016.FastModeButton.Notify.Text = "(You can play while it\'s working, usually takes 20 to 80 seconds to finish)"
			end
			v_u_1019.Text = "Working.."
			if v1020 then
				v1020.Text = "Working.."
			end
			v_u_993.FastModeButton.Notify.Text = "(You can play while it\'s working, usually takes 20 to 80 seconds to finish)"
			game:GetService("TextChatService").TextChannels.RBXGeneral:DisplaySystemMessage("<font color=\"#00FF00\">Tip: Try disabling allied FX in the settings menu for even less lag!</font>")
			_G.FastMode = true
			local v1021 = workspace:WaitForChild("Map")
			local v1022 = game.ReplicatedStorage:WaitForChild("Unloaded")
			local _ = v_u_79.FPSTracker
			local v1023 = Enum.Material.SmoothPlastic
			local v1024 = v1021:GetDescendants()
			wait(0.5)
			local v1025 = v1022:GetDescendants()
			wait(0.5)
			local v1026 = os.clock
			local v1027 = task.wait
			local _ = rawget
			local v1028 = v1022.IsA
			local v1029 = v1026()
			local v1030 = tick()
			local v1031 = v1029
			local v1032 = 0
			for _, v1033 in next, v1024 do
				if v1028(v1033, "BasePart") then
					v1033.Material = v1023
					v1032 = v1032 + 1
					if v1026() - v1029 > 0.008333333333333333 then
						local v1034 = "Working.. " .. v1032
						v_u_1019.Text = v1034
						v1020.Text = v1034
						if v_u_1018 then
							v_u_1018.Text = v1034
						end
						v1027()
						v1027()
						v1029 = v1026()
					end
				elseif v1033:IsA("Texture") and not v1033:GetAttribute("Offset") then
					v1033:Destroy()
				end
			end
			for _, v1035 in next, v1025 do
				if v1028(v1035, "BasePart") then
					v1035.Material = v1023
					v1032 = v1032 + 1
					if v1026() - v1029 > 0.008333333333333333 then
						local v1036 = "Working.. " .. v1032
						v_u_1019.Text = v1036
						v1020.Text = v1036
						if v_u_1018 then
							v_u_1018.Text = v1036
						end
						v1027()
						v1027()
						v1029 = v1026()
					end
				elseif v1035:IsA("Texture") and not v1035:GetAttribute("Offset") then
					v1035:Destroy()
				end
			end
			game.Players.LocalPlayer.PlayerScripts.OptimizerClientActor:SendMessage("Optimize", true)
			print("Time taken to Fast Mode: ", tick() - v1030, v1026() - v1031)
			v_u_993.FastModeButton.Notify.Text = "Materials have been disabled."
			local v1037 = tick() - v1030
			local v1038 = "Finished in " .. math.floor(v1037) .. "s"
			v_u_1019.Text = v1038
			v1020.Text = v1038
			pcall(function()
				-- upvalues: (ref) v_u_1016, (ref) v_u_993, (copy) v_u_1018, (copy) v_u_1019
				v_u_1016.FastModeButton.Notify.Text = v_u_993.FastModeButton.Notify.Text
				v_u_1018.Text = v_u_1019.Text
			end)
		end
	end)
	local v_u_1039 = script.Parent.Level.FriendBoost.TextLabel2.UIGradient
	function fixFriendBoostIcon()
		local v1040 = script.Parent.Level.TextBounds.X
		local v1041 = UDim2.new(0, script.Parent.Level.AbsoluteSize.X - script.Parent.Level.FriendBoost.AbsoluteSize.X + 5, 0.5, -10)
		if script.Parent.Level.AbsoluteSize.X - script.Parent.Level.FriendBoost.AbsoluteSize.X - 3 < v1040 then
			v1041 = UDim2.new(1, 20, 0.5, -10)
		end
		script.Parent.Level.FriendBoost.Position = v1041
	end
	fixFriendBoostIcon()
	script.Parent.Level:GetPropertyChangedSignal("TextBounds"):Connect(fixFriendBoostIcon)
	local function v1050()
		-- upvalues: (copy) v_u_50
		local v1042 = v_u_50:GetAttribute("FriendBoost")
		if v1042 and v1042 > 0 then
			local v1043 = v_u_50:GetAttribute("NumFriends") or 0
			local v1044 = math.min(v1043, 3)
			local v1045 = v1042 * 100 + 0.5
			local v1046 = math.floor(v1045)
			local v1047 = v1044 * 15
			local v1048 = math.min(v1047, 45)
			script.Parent.Level.FriendBoost.Visible = true
			script.Parent.Level.FriendBoost.TextLabel.Text = v1046 .. "%"
			local v1049 = v1044 > 0 and (v1044 .. " friend" .. (v1044 > 1 and "s are " or " is ") .. "in your server! +" .. v1048 .. "% EXP" or "") or ""
			if v1048 < v1046 then
				v1049 = v1049 .. string.format(" (+%s%% from buffs)", v1046 - v1048)
			end
			script.Parent.Level.FriendBoost.TextLabel2.Text = v1049
		else
			script.Parent.Level.FriendBoost.Visible = false
		end
	end
	script.Parent.Level.FriendBoost.TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
	script.Parent.Level.FriendBoost.TextLabel2.Size = UDim2.fromScale(15, 0.6)
	v1050()
	v_u_50:GetAttributeChangedSignal("FriendBoost"):Connect(v1050)
	script.Parent.Level.FriendBoost.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_1039
		v_u_1039.Parent = script.Parent.Level.FriendBoost.TextLabel
	end)
	script.Parent.Level.FriendBoost.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_1039
		v_u_1039.Parent = script.Parent.Level.FriendBoost.TextLabel2
	end)
	local v_u_1051 = script.Parent.Level.ExploreBoost.TextLabel2.UIGradient
	local v_u_1052 = script.Parent.Level.FishBoost.TextLabel2.UIGradient
	function fixExploreBoostIcon()
		local v1053 = script.Parent.Level.TextBounds.X
		local v1054 = UDim2.new(0, script.Parent.Level.AbsoluteSize.X - script.Parent.Level.ExploreBoost.AbsoluteSize.X + 5, 0.5, 0)
		if script.Parent.Level.AbsoluteSize.X - script.Parent.Level.ExploreBoost.AbsoluteSize.X - 3 < v1053 then
			v1054 = UDim2.new(1, 20, 0.5, 0)
		end
		script.Parent.Level.ExploreBoost.Position = v1054
		script.Parent.Level.FishBoost.Position = v1054
	end
	fixExploreBoostIcon()
	script.Parent.Level:GetPropertyChangedSignal("TextBounds"):Connect(fixExploreBoostIcon)
	local function v1059()
		-- upvalues: (copy) v_u_50
		local v1055 = script.Parent.Level.ExploreBoost
		local v1056 = script.Parent.Level.FishBoost
		local v1057 = v_u_50:GetAttribute("ExploreBoost")
		local v1058 = v_u_50:GetAttribute("FishFriendBonus")
		if v1057 and (v1057 > 1 and (not v1058 or v1058 <= 0)) then
			v1055.Visible = true
			v1056.Visible = false
			v1055.TextLabel.Text = v1057
			v1055.TextLabel2.Text = ("Sea Exploration Group: %* Players"):format(v1057)
			return
		else
			v1055.Visible = false
			if v1058 and v1058 > 0 then
				v1056.Visible = true
				v1056.TextLabel.Text = ("+%*%% Luck%*"):format(2.5 * v1058, v1058 >= 6 and " (MAX)" or "")
			else
				v1056.Visible = false
			end
		end
	end
	v_u_50:GetAttributeChangedSignal("ExploreBoost"):Connect(v1059)
	v_u_50:GetAttributeChangedSignal("FishFriendBonus"):Connect(v1059)
	v1059()
	script.Parent.Level.ExploreBoost.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_1051, (copy) v_u_1052
		v_u_1051.Parent = script.Parent.Level.ExploreBoost.TextLabel
		v_u_1052.Parent = script.Parent.Level.FishBoost.TextLabel
	end)
	script.Parent.Level.ExploreBoost.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_1051, (copy) v_u_1052
		v_u_1051.Parent = script.Parent.Level.ExploreBoost.TextLabel2
		v_u_1052.Parent = script.Parent.Level.FishBoost.TextLabel2
	end)
	local v1060 = v_u_548:WaitForChild("Bar")
	local v_u_1061 = v1060:WaitForChild("CommandBox")
	v1060:WaitForChild("Invite").Activated:Connect(function()
		-- upvalues: (ref) v_u_544, (copy) v_u_1061, (copy) v_u_60, (copy) v_u_62
		if not v_u_544 and #v_u_1061.Text ~= 0 then
			local _, v1062, _ = v_u_60.Crew:InvokeServer("Invite", v_u_1061.Text)
			v_u_1061.Text = ""
			if v1062 then
				v_u_62.new(v1062):Display()
			end
		end
	end)
	v1060:WaitForChild("Kick").Activated:Connect(function()
		-- upvalues: (ref) v_u_544, (copy) v_u_1061, (copy) v_u_60, (copy) v_u_62, (ref) v_u_545
		if not v_u_544 and #v_u_1061.Text ~= 0 then
			local _, v1063, v1064 = v_u_60.Crew:InvokeServer("Kick", v_u_1061.Text)
			v_u_1061.Text = ""
			v_u_62.new(v1063):Display()
			if v1064 then
				v_u_545(v1064)
			end
		end
	end)
	v1060:WaitForChild("Abandon").Activated:Connect(function()
		-- upvalues: (copy) v_u_548
		v_u_548.ConfirmAbandon.Visible = true
	end)
	v_u_548:WaitForChild("ConfirmAbandon"):WaitForChild("Yes").Activated:Connect(function()
		-- upvalues: (ref) v_u_544, (copy) v_u_60, (copy) v_u_62, (copy) v_u_547, (copy) v_u_548
		if not v_u_544 then
			local v1065, v1066, _ = v_u_60.Crew:InvokeServer("Abandon")
			v_u_62.new(v1066):Display()
			if v1065 then
				v_u_547.Visible = true
				v_u_548.Visible = false
				v_u_548.ConfirmAbandon.Visible = false
			end
		end
	end)
	v_u_548:WaitForChild("ConfirmAbandon"):WaitForChild("No").Activated:Connect(function()
		-- upvalues: (copy) v_u_548
		v_u_548.ConfirmAbandon.Visible = false
	end)
	v_u_548:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: (ref) v_u_545
		v_u_545()
	end)
	v_u_545 = function(p1067, p1068)
		-- upvalues: (copy) v_u_548, (copy) v_u_60, (copy) v_u_50, (copy) v_u_77
		local v1069 = next
		local v1070, v1071 = v_u_548.Members:GetChildren()
		for _, v1072 in v1069, v1070, v1071 do
			if v1072:IsA("Frame") and (v1072.Visible and v1072.Name == "Entry") then
				v1072:Destroy()
			end
		end
		if not p1067 then
			local v1073, v1074
			v1073, v1074, p1067, p1068 = v_u_60.Crew:InvokeServer("GetData")
			_ = v1073
			_ = v1074
		end
		if p1067 then
			if p1067.Owner.UserId == v_u_50.UserId then
				v_u_548.Bar.Kick.Visible = true
				v_u_548.Bar.Invite.Visible = true
				v_u_548.Bar.CommandBox.Visible = true
				v_u_548.Bar.Warning.Visible = false
			else
				v_u_548.Bar.Kick.Visible = false
				v_u_548.Bar.Invite.Visible = false
				v_u_548.Bar.CommandBox.Visible = false
				v_u_548.Bar.Warning.Visible = true
			end
			v_u_548.CrewName.Text = p1067.Name .. " | Members: " .. #p1067.Members .. "/" .. p1067.MaxMembers
			v_u_548.CrewOwner.Text = "Captain: " .. p1067.Owner.Name
			v_u_548.CrewBounty.Text = "Total Bounty: $" .. v_u_77.commaValue(p1067.TotalBounty)
			table.sort(p1067.Members, function(p1075, p1076)
				return p1075.Bounty > p1076.Bounty
			end)
			local v1077 = 0
			for _, v1078 in next, p1067.Members do
				v1077 = v1077 + 1
				local v1079 = v_u_548.Members.Entry:Clone()
				v1079.Bounty.Text = "$" .. v_u_77.shortValue(v1078.Bounty)
				v1079.Level.Text = v1078.Level > 0 and (v1078.Level or "(Loading..)") or "(Loading..)"
				v1079:FindFirstChild("Name").Text = v1078.Name
				v1079.LayoutOrder = v1077
				v1079.Visible = true
				v1079.Parent = v_u_548.Members
			end
			v_u_548.Members.CanvasSize = UDim2.new(0, 0, 0, (1 + p1067.MaxMembers) * 18)
		end
		if p1068 then
			local v1080 = next
			local v1081, v1082 = v_u_548.Leaderboard:GetChildren()
			for _, v1083 in v1080, v1081, v1082 do
				if v1083:IsA("Frame") and (v1083.Visible and v1083.Name == "Entry") then
					v1083:Destroy()
				end
			end
			local v1084 = 0
			for _, v1085 in next, p1068 do
				v1084 = v1084 + 1
				local v1086 = v_u_548.Leaderboard.Entry:Clone()
				v1086.Rank.Text = v1085.Rank or "#?"
				v1086.Bounty.Text = "$" .. v_u_77.shortValue(v1085.TotalBounty)
				v1086:FindFirstChild("Name").Text = v1085.Name:match("(.+);") or "(Loading..)"
				v1086.LayoutOrder = v1084
				v1086.Visible = true
				v1086.Parent = v_u_548.Leaderboard
			end
			v_u_548.Leaderboard.CanvasSize = UDim2.new(0, 0, 0, 1818)
		end
	end
	v_u_547:WaitForChild("CreateButton").Activated:Connect(function()
		-- upvalues: (ref) v_u_544, (copy) v_u_60, (copy) v_u_547, (ref) v_u_545, (copy) v_u_548, (copy) v_u_62
		if not v_u_544 then
			v_u_544 = true
			local v1087, v1088, v1089 = v_u_60.Crew:InvokeServer("Create", {
				["Name"] = v_u_547.CrewNameBox.Text,
				["Logo"] = v_u_547.Preview.Image.Image:match("&assetId=(%d+)") or v_u_547.Preview.Image.Image:match("rbxassetid://(%d+)")
			})
			if v1087 then
				v_u_545(v1089)
				v_u_547.Visible = false
				v_u_548.Visible = true
			elseif v1089 then
				v_u_547.CrewNameBox.Text = v1089
			end
			v_u_62.new(v1088):Display()
			v_u_544 = false
		end
	end)
	v_u_547:WaitForChild("CrewNameBox"):GetPropertyChangedSignal("Text"):Connect(function()
		-- upvalues: (copy) v_u_547
		local v1090 = v_u_547.CrewNameBox
		local v1091 = v_u_547.CrewNameBox.Text
		v1090.Text = string.sub(v1091, 0, 21)
	end)
	v_u_547:WaitForChild("LogoBox").FocusLost:Connect(function()
		-- upvalues: (copy) v_u_547, (copy) v_u_62
		local v1092 = string.match(v_u_547.LogoBox.Text, "library/(%d+)/") or string.match(v_u_547.LogoBox.Text, "asset/(%d+)/")
		if v1092 then
			v_u_547.Preview.Image.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=" .. v1092
			v_u_62.new("<Logo ID set to " .. v1092 .. ">"):Display()
		else
			v_u_547.Preview.Image.Image = ""
			v_u_62.new("<ERROR: Invalid Link.>"):Display()
		end
	end)
	local v_u_1093 = v_u_547:WaitForChild("Invite")
	local v_u_1094 = nil
	v_u_1093:WaitForChild("Accept").Activated:Connect(function()
		-- upvalues: (ref) v_u_544, (ref) v_u_1094, (copy) v_u_60, (ref) v_u_545, (copy) v_u_547, (copy) v_u_548, (copy) v_u_62
		if not v_u_544 then
			v_u_544 = true
			if v_u_1094 then
				local v1095 = {
					["CrewID"] = v_u_1094
				}
				local v1096, v1097, v1098 = v_u_60.Crew:InvokeServer("Join", v1095)
				if v1096 then
					v_u_545(v1098)
					v_u_547.Visible = false
					v_u_548.Visible = true
					v_u_1094 = nil
					v_u_547.Invite.Visible = false
				end
				v_u_62.new(v1097):Display()
			end
			v_u_544 = false
		end
	end)
	v_u_1093:WaitForChild("Cancel").Activated:Connect(function()
		-- upvalues: (copy) v_u_1093, (ref) v_u_1094
		v_u_1093.Visible = false
		v_u_1094 = nil
	end)
	v_u_60:WaitForChild("RefreshCrew").OnClientEvent:Connect(function(p1099, p1100, p1101)
		-- upvalues: (ref) v_u_405, (ref) v_u_545, (copy) v_u_547, (copy) v_u_548, (ref) v_u_1094
		local v1102 = v_u_405
		if p1099 == "CrewInfo" and v1102 then
			if p1100 then
				v_u_545(p1100, p1101)
				v_u_547.Visible = false
				v_u_548.Visible = true
				v_u_548.ConfirmAbandon.Visible = false
			else
				v_u_547.Visible = true
				v_u_548.Visible = false
				v_u_548.ConfirmAbandon.Visible = false
			end
		else
			if p1099 == "CrewInvite" then
				if p1100 then
					v_u_1094 = p1100.CrewID
					v_u_547.Invite.name.Text = p1100.Name
					v_u_547.Invite.Visible = true
					return
				end
				v_u_1094 = nil
				v_u_547.Invite.Visible = false
			end
			return
		end
	end)
	local function v_u_1113(p1103)
		local v1104 = tonumber(p1103)
		if v1104 <= 0 then
			return "00:00"
		end
		local v1105 = string.format
		local v1106 = v1104 / 3600
		local v1107 = v1105("%02.f", (math.floor(v1106)))
		local v1108 = string.format
		local v1109 = v1104 / 60 - v1107 * 60
		local v1110 = v1108("%02.f", (math.floor(v1109)))
		local v1111 = string.format
		local v1112 = v1104 - v1107 * 3600 - v1110 * 60
		return v1110 .. ":" .. v1111("%02.f", (math.floor(v1112)))
	end
	local v_u_1114 = v_u_53.TopHUDList.RaidTimer
	local v_u_1115 = 0
	v_u_60:WaitForChild("Raids").OnClientEvent:Connect(function(p1116, ...)
		-- upvalues: (ref) v_u_1115, (copy) v_u_1114, (copy) v_u_1113
		if p1116 == "StartTimer" then
			v_u_1115 = v_u_1115 + 1
			local v1117 = v_u_1115
			local v1118, v1119 = ...
			v_u_1114.Text = ""
			v_u_1114.Visible = true
			local v1120 = not v1119 and 0 or workspace:GetServerTimeNow() - v1119
			local v1121 = tick() - v1120
			while v_u_1114.Visible and v1117 == v_u_1115 do
				v_u_1114.Text = "Time Left: " .. v_u_1113(v1118 - (tick() - v1121))
				task.wait(0.1)
			end
		elseif p1116 == "Finished" then
			v_u_1114.Visible = false
		end
	end)
	task.defer(function()
		-- upvalues: (copy) v_u_17, (copy) v_u_53, (copy) v_u_76, (copy) v_u_74
		local v1122 = {}
		local function v_u_1123() end
		function v1122.ReturnBlankFunctionOnWorldFail(p1124, p1125)
			-- upvalues: (ref) v_u_17, (copy) v_u_1123
			if typeof(p1124) == "table" then
				for _, v1126 in pairs(p1124) do
					if v_u_17.getCurrentSeaAsync() == v1126 then
						return p1125
					end
				end
				return v_u_1123
			elseif v_u_17.getCurrentSeaAsync() == p1124 then
				return p1125
			else
				return v_u_1123
			end
		end
		v1122.ReturnBlankFunctionOnWorldFail("Zou", function()
			-- upvalues: (ref) v_u_53, (ref) v_u_76, (ref) v_u_74
			local v_u_1127 = Color3.fromRGB(255, 255, 255)
			local v_u_1128 = Color3.fromRGB(85, 0, 0)
			local v_u_1129 = v_u_53.TopHUDList.ActiveRocks
			local v_u_1130 = v_u_53.TopHUDList.ActiveMobs
			local v_u_1131 = v_u_53.TopHUDList.PrehistoricRaidTimer
			local v_u_1132 = v_u_53.TopHUDList.PrehistoricRelicHealth
			local v_u_1133 = nil
			local function v1145(...)
				-- upvalues: (copy) v_u_1129, (copy) v_u_1130, (ref) v_u_76, (copy) v_u_1131, (copy) v_u_1132, (copy) v_u_1127, (copy) v_u_1128, (ref) v_u_1133
				_G.TestGamePrint("HandlePrehistoricEvent", ...)
				local v1134 = { ... }
				local v1135 = v1134[1]
				local v1136 = nil
				local v1137 = nil
				if v1135 == "Rocks" then
					v1136 = v_u_1129
					v1137 = "Active Rocks"
				elseif v1135 == "Mobs" then
					v1136 = v_u_1130
					v1137 = "Active Mobs"
				end
				if v_u_76() then
					v_u_1129.Size = UDim2.new(1, 0, 0, 20)
					v_u_1130.Size = UDim2.new(1, 0, 0, 20)
					v_u_1131.Size = UDim2.new(1, 0, 0, 20)
					v_u_1132.Size = UDim2.new(1, 0, 0, 20)
				end
				if v1135 == "Rocks" or v1135 == "Mobs" then
					local v1138 = v1134[2]
					v1136.Text = string.format("%s: %s", v1137, v1138)
					v1136.Visible = true
					v1136.TextColor3 = v_u_1127:Lerp(v_u_1128, v1138 / 5)
					return
				elseif v1135 == "HideLabels" then
					if v_u_1133 then
						v_u_1133:Disconnect()
						v_u_1133 = nil
					end
					v_u_1129.TextColor3 = Color3.fromRGB(20, 20, 20)
					v_u_1130.TextColor3 = Color3.fromRGB(20, 20, 20)
					v_u_1131.TextColor3 = Color3.fromRGB(255, 237, 97)
					v_u_1132.TextColor3 = Color3.fromRGB(255, 255, 255)
					task.wait(3)
					v_u_1129.Visible = false
					v_u_1130.Visible = false
					v_u_1131.Visible = false
					v_u_1132.Visible = false
					return
				elseif v1135 == "UpdatePressure" then
					v_u_1131.Text = string.format("Volcano Pressure: %s%%", v1134[2])
					v_u_1131.TextColor3 = Color3.fromRGB(255, 237, 97):Lerp(Color3.fromRGB(200, 0, 0), v1134[2] / 100)
					v_u_1131.Visible = true
				elseif v1135 == "ListenToRelicHealth" then
					local v1139 = workspace.Map:WaitForChild("PrehistoricIsland"):WaitForChild("Core"):WaitForChild("PrehistoricRelic")
					local v_u_1140 = v1139.Health
					local v_u_1141 = v1139.MaxHealth
					local function v1144()
						-- upvalues: (copy) v_u_1140, (copy) v_u_1141, (ref) v_u_1132
						local v1142 = v_u_1140.Value / v_u_1141.Value * 100
						local v1143 = math.floor(v1142)
						v_u_1132.Text = string.format("Relic Health: %s%%", v1143)
						v_u_1132.TextColor3 = Color3.fromRGB(200, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), v_u_1140.Value / v_u_1141.Value)
					end
					v1144()
					v_u_1133 = v_u_1140.Changed:Connect(v1144)
					v_u_1132.Visible = true
				end
			end
			v_u_74:RemoteEvent("PrehistoricEvent").OnClientEvent:Connect(v1145)
		end)()
	end)
	task.defer(function()
		-- upvalues: (copy) v_u_53, (copy) v_u_76, (copy) v_u_2
		local v1146 = v_u_53.TopHUDList
		if v_u_76() then
			v1146.Position = UDim2.new(0.5, 0, 0, 0)
		else
			local v1147, _ = v_u_2:GetGuiInset()
			v1146.Position = UDim2.new(0.5, 0, 0, -v1147.Y + 10)
		end
	end)
	local v_u_1148 = v_u_53:WaitForChild("BottomHUDList"):WaitForChild("Radar")
	local v_u_1149 = v_u_1148:Clone()
	v_u_1149.Name = "EggRadar"
	v_u_1149.Parent = v_u_1148.Parent
	v_u_1149.LayoutOrder = 96.1
	v_u_1149.Size = UDim2.new(0.75, 0, 0.75, 0)
	local v_u_1150 = false
	local v_u_1151 = nil
	local v_u_1152 = nil
	local v_u_1153 = nil
	v_u_60:WaitForChild("RadarNotify").OnClientEvent:Connect(function(p1154, p1155)
		-- upvalues: (ref) v_u_1150, (ref) v_u_1151, (ref) v_u_1152, (ref) v_u_1153, (copy) v_u_62
		if p1154 == "Enabled" then
			v_u_1150 = true
		else
			v_u_1151 = _G.Encode(p1154)
			v_u_1152 = p1155
			v_u_1153 = tick()
			v_u_62.new("<Color=Green>A BLOX FRUIT HAS SPAWNED IN THE GAME!<Color=/>"):Display()
			v_u_62.new("Radar activated."):Display()
		end
	end)
	task.spawn(function()
		require(script.SeaExploration)
	end)
	local v1156 = v_u_51:WaitForChild("Backpack"):WaitForChild("Hotbar")
	v_u_53.BottomHUDList.Position = UDim2.new(0.5, 0, 1, v1156.Position.Y.Offset - 5)
	if v_u_2:IsTenFootInterface() then
		script.Parent.BottomHUDList.Position = UDim2.new(0.5, 0, 1, -125)
		script.Parent.BottomHUDList.UniversalContextButtons.Size = UDim2.fromScale(1, 1)
	end
	if v_u_76() then
		v_u_53.Level.Position = UDim2.new(0, 6, 0.71, 0)
		v_u_53.Fragments.Position = UDim2.new(0, 6, 0.8700000000000001, 0)
		v_u_53.HP.Position = UDim2.new(0.305, -1, 0.93, -70)
		v_u_53.Energy.Position = UDim2.new(0.505, 1, 0.93, -70)
		v_u_53.RaceEnergy.Position = UDim2.new(0, 10, 0.815, 0)
		v_u_53.DodgeNotifier.Position = UDim2.new(0.5, 0, 0.95, -85)
		game.ReplicatedStorage.Events.MobileUIModeUpdated.Event:Connect(function(p1157)
			-- upvalues: (copy) v_u_50, (copy) v_u_53, (copy) v_u_75, (ref) v_u_618
			local v1158 = v_u_50.Character
			if v1158 then
				require(script.Parent.Shared).reflectHUDButtonVisibility()
				local v1159 = v1158:FindFirstChildOfClass("Tool")
				if v1159 then
					if v_u_53.Skills.Visible and p1157 then
						v_u_53.Skills.Visible = false
					else
						v_u_75:UnbindSkillContextButtons()
					end
					v_u_618(v1159)
				end
			end
		end)
	end
	task.defer(function()
		-- upvalues: (copy) v_u_50, (copy) v_u_62
		repeat
			task.wait()
		until v_u_50.Character and (v_u_50.Character:IsDescendantOf(workspace.Characters) and v_u_50.Team ~= nil)
		v_u_62.new("Joined <" .. v_u_50.Team.Name .. "> team."):Display()
		for _, v1160 in _G.postSpawn do
			v1160()
		end
	end)
	local v_u_1161 = v_u_1150
	local v_u_1162 = v_u_1153
	local v_u_1163 = v_u_1152
	local v_u_1164 = v_u_1151
	while not _G.NPCReady do
		task.wait()
	end
	local v1165 = game:GetService("ReplicatedStorage")
	local v_u_1166 = require(v1165.TestingGroupUtil)
	local v_u_1167 = require(v1165.Util:WaitForChild("IrisLog")).new("A/E TESTING", "Tester")
	v_u_1167:EnsureTab("Tools")
	v_u_1167:EnsureTab("Log")
	_G.AB_TEST_OVERRIDES = _G.AB_TEST_OVERRIDES or {}
	local v_u_1168 = _G.AB_TEST_OVERRIDES
	local v_u_1169 = nil
	local v_u_1170 = false
	local function v_u_1175(p1171)
		-- upvalues: (copy) v_u_1168, (ref) v_u_1169, (ref) v_u_628, (ref) v_u_629, (ref) v_u_1170, (copy) v_u_1167
		local v1172 = v_u_1168.FreshieNotifyV1
		if v1172 ~= "Enabled" and v1172 ~= "Disabled" then
			local v1173 = v_u_1169
			v1172 = v1173 ~= "Enabled" and v1173 ~= "Disabled" and "Disabled" or v_u_1169
		end
		v_u_628 = v1172 == "Enabled"
		if v_u_629 then
			v_u_629()
		end
		if v_u_1170 then
			if p1171 == "Toggle" then
				local v1174 = v_u_1168.FreshieNotifyV1
				if v1174 == "Enabled" and true or v1174 == "Disabled" then
					v_u_1167:AppendToTab("Log", v_u_1167:Gold("FreshieNotifyV1 forced -> "), v1174 == "Enabled" and v_u_1167:Green("Enabled") or v_u_1167:VeryRed("Disabled"), v_u_1167:Gold(" (now "), v1172 == "Enabled" and v_u_1167:Green("ON") or v_u_1167:VeryRed("OFF"), v_u_1167:Gold(")"))
					return
				end
			elseif p1171 == "UseAB" then
				v_u_1167:AppendToTab("Log", v_u_1167:Gold("FreshieNotifyV1 override cleared (back to current state)"))
			end
		else
			v_u_1170 = true
			v_u_1167:AppendToTab("Log", v_u_1167:Gold("FreshieNotifyV1: "), v1172 == "Enabled" and v_u_1167:Green("ON") or v_u_1167:VeryRed("OFF"))
		end
	end
	v_u_1167:AppendToTab("Tools", v_u_1167:NewLine(), v_u_1167:Gold("FreshieNotifyV1"))
	v_u_1167:AppendToTab("Tools", v_u_1167:Button("Toggle", function()
		-- upvalues: (copy) v_u_1168, (ref) v_u_1169, (copy) v_u_1175
		local v1176 = v_u_1168.FreshieNotifyV1
		if v1176 ~= "Enabled" and v1176 ~= "Disabled" then
			local v1177 = v_u_1169
			v1176 = v1177 ~= "Enabled" and v1177 ~= "Disabled" and "Disabled" or v_u_1169
		end
		v_u_1168.FreshieNotifyV1 = v1176 == "Enabled" and "Disabled" or "Enabled"
		v_u_1175("Toggle")
	end))
	v_u_1167:AppendToTab("Tools", v_u_1167:Button("Current State", function()
		-- upvalues: (copy) v_u_1168, (ref) v_u_1169, (ref) v_u_628, (ref) v_u_629, (ref) v_u_1170, (copy) v_u_1167
		v_u_1168.FreshieNotifyV1 = nil
		local v1178 = v_u_1168.FreshieNotifyV1
		if v1178 ~= "Enabled" and v1178 ~= "Disabled" then
			local v1179 = v_u_1169
			v1178 = v1179 ~= "Enabled" and v1179 ~= "Disabled" and "Disabled" or v_u_1169
		end
		v_u_628 = v1178 == "Enabled"
		if v_u_629 then
			v_u_629()
		end
		if v_u_1170 then
			v_u_1167:AppendToTab("Log", v_u_1167:Gold("FreshieNotifyV1 override cleared (back to current state)"))
		else
			v_u_1170 = true
			v_u_1167:AppendToTab("Log", v_u_1167:Gold("FreshieNotifyV1: "), v1178 == "Enabled" and v_u_1167:Green("ON") or v_u_1167:VeryRed("OFF"))
		end
	end))
	task.spawn(function()
		-- upvalues: (copy) v_u_1166, (copy) v_u_50, (ref) v_u_1169, (copy) v_u_1168, (ref) v_u_628, (ref) v_u_629, (ref) v_u_1170, (copy) v_u_1167
		local v1180 = v_u_1166.getGroup(v_u_50.UserId, "FreshieNotifyV1"):await()
		v1180:inspectErr(warn)
		local v1181 = v1180:asNullable()
		if v1181 == "Enabled" and true or v1181 == "Disabled" then
			v_u_1169 = v1181
		else
			warn("[FreshieNotifyV1] bad AB value:", v1181, (typeof(v1181)))
		end
		local v1182 = v_u_1168.FreshieNotifyV1
		if v1182 ~= "Enabled" and v1182 ~= "Disabled" then
			local v1183 = v_u_1169
			v1182 = v1183 ~= "Enabled" and v1183 ~= "Disabled" and "Disabled" or v_u_1169
		end
		v_u_628 = v1182 == "Enabled"
		if v_u_629 then
			v_u_629()
		end
		if not v_u_1170 then
			v_u_1170 = true
			v_u_1167:AppendToTab("Log", v_u_1167:Gold("FreshieNotifyV1: "), v1182 == "Enabled" and v_u_1167:Green("ON") or v_u_1167:VeryRed("OFF"))
		end
	end)
	task.defer(function()
		-- upvalues: (copy) v_u_21, (copy) v_u_65, (ref) v_u_619, (ref) v_u_52, (ref) v_u_620, (ref) v_u_625, (ref) v_u_627, (ref) v_u_1164, (ref) v_u_1163, (ref) v_u_1162, (copy) v_u_1148, (copy) v_u_62, (ref) v_u_1161, (copy) v_u_1149, (copy) v_u_103, (copy) v_u_53, (copy) v_u_60, (ref) v_u_628, (copy) v_u_50
		task.wait(3)
		while true do
			local v1184 = not v_u_21.COMPASS_REWORK_ENABLED and (v_u_65.Data.Ready and (v_u_619 and (v_u_619.Health > 0 and v_u_52:FindFirstChild("HumanoidRootPart"))))
			if v1184 then
				local v1185 = v_u_65:GetNearestNPC(v1184.Position, v_u_620.Level.Value)
				local v1186 = v1185[1]
				local v1187 = v1185[2]
				local v1188 = v1185[3]
				local v1189 = v1185[5]
				if v_u_625 then
					v_u_65:PointCompass(v1186)
				elseif v1186 then
					local v1190 = (v_u_65:GetDistance(v1186) - v1184.Position).magnitude / 10
					local v1191 = math.floor(v1190)
					v_u_65.Data.LastMeters = v1191
					v_u_65:PointCompass(v1186)
					v_u_627.TopFrame.Subtitle2.Text = v1191 > 9999 and "Over 9999m away.." or (v1191 <= 9999 and (v1191 > 8 and v1191 .. "m away") or "Nearby!")
					if v1189 then
						if v1189 == 1 then
							v_u_627.TopFrame.Subtitle1.Text = "Capture the <Frozen Heart> using a harpoon!"
						elseif v1189 == 2 then
							v_u_627.TopFrame.Subtitle1.Text = "Deliver the <Frozen Heart> to Tiki Outpost."
						end
						v_u_627:WaitForChild("LeftFrame").IconFrame.UIStroke.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 197, 20))
					elseif v1188 then
						if typeof(v1188) == "string" then
							v_u_627.TopFrame.Subtitle1.Text = v1188
						else
							v1188:GetAttributes()
							v_u_627.TopFrame.Subtitle1.Text = "Find the NPC at " .. v1188.Name .. "."
						end
					else
						local v1192 = v_u_627:WaitForChild("LeftFrame").IconFrame
						v_u_627.TopFrame.Subtitle1.Text = "Find the " .. v1187 .. "."
						v1192.UIStroke.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 197, 20))
					end
				else
					v_u_65:PointCompass()
					local v1193 = v_u_627:WaitForChild("LeftFrame").IconFrame
					v_u_627.TopFrame.Subtitle1.Text = "(None)"
					v_u_627.TopFrame.Subtitle2.Text = "-"
					v1193.UIStroke.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 197, 20))
				end
			end
			if v_u_1164 then
				if v_u_1164:IsDescendantOf(workspace) then
					local v1194 = v_u_1163 and (v_u_619 and (v_u_619.Health > 0 and v_u_52:FindFirstChild("HumanoidRootPart")))
					if v1194 then
						local v1195 = (v_u_1163 - v1194.Position).magnitude
						local v1196 = v1195 / 40
						local v1197 = 0.8 + math.random() * 0.2
						local v1198 = 1 - (tick() - v_u_1162) * 0.2
						local v1199 = v1196 * (v1197 * math.max(v1198, 0))
						local v1200 = v1195 / 10 + v1199
						v_u_1148.Text = "FRUIT DETECTED: " .. math.floor(v1200) .. "m away." .. (v1199 > 0 and " (Calibrating...)" or "")
						v_u_1148.Visible = true
					end
				else
					v_u_1164 = nil
					v_u_1163 = nil
					v_u_1162 = nil
					v_u_1148.Visible = false
					v_u_62.new("Blox Fruit despawned."):Display()
				end
			end
			if v_u_1161 then
				local v1201 = false
				for _, v1202 in workspace:GetChildren() do
					local v1203
					if v1202.Name == "" then
						v1203 = v1202:FindFirstChild("_PrimaryPart")
					else
						v1203 = false
					end
					if v1203 then
						local v1204 = v_u_52:FindFirstChild("HumanoidRootPart")
						if v1204 and (v1203.Position - v1204.Position).magnitude < 250 then
							v_u_1149.Text = "EGG DETECTED NEARBY!"
							v_u_1149.Visible = true
							v1201 = true
						end
					end
				end
				if not v1201 then
					v_u_1149.Visible = false
				end
			end
			if v_u_103.GamepadEnabled or not v_u_103.MouseEnabled then
				pcall(function()
					-- upvalues: (ref) v_u_53, (ref) v_u_60
					v_u_53.Parent.Smokescreen:Destroy()
					v_u_60.CommF_:InvokeServer("NoSmoke2")
				end)
			end
			local v1205 = script.Parent.BottomHUDList:FindFirstChild("FreshieNotify")
			if v_u_628 and (v_u_620.Level.Value < 10 and v_u_619.Health > 0) then
				local v1206 = v_u_52:FindFirstChild("HumanoidRootPart")
				if not v1206 then
					return
				end
				local v1207 = v_u_50.Team
				if v1207 then
					v1207 = v_u_50.Team.Name == "Marines"
				end
				local v1208, v1209
				if v1207 then
					v1208 = workspace.Map:FindFirstChild("MarineStart")
					v1209 = 650
				else
					v1208 = workspace.Map:FindFirstChild("Windmill")
					v1209 = 450
				end
				if v1208 then
					v1208 = v1208:FindFirstChild("FreshieCheck")
				end
				if v1208 and v1208:IsA("BasePart") then
					local v1210 = v1206.Position.X
					local v1211 = v1206.Position.Z
					local v1212 = Vector3.new(v1210, 0, v1211)
					local v1213 = v1208.Position.X
					local v1214 = v1208.Position.Z
					v1205.Visible = v1209 < (v1212 - Vector3.new(v1213, 0, v1214)).Magnitude
				end
			end
			task.wait(0.2)
		end
	end)
end