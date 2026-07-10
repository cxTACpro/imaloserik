-- https://lua.expert/
if require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Flags")).COMPASS_REWORK_ENABLED then
	return require(game.ReplicatedStorage.Controllers.NavigationController)
end

local CurrentCamera = workspace.CurrentCamera

game:GetService("RunService")
game:GetService("ReplicatedStorage")

local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Notification = require(game.ReplicatedStorage:WaitForChild("Notification"))
local Util = require(game.ReplicatedStorage:WaitForChild("Util"))
local Guide = script:WaitForChild("Guide")
local TeleportQuests = require(script.TeleportQuests)
local t = {
	UI = Guide,
	SideCompass = script:WaitForChild("Compass"),
	IconFrame = Guide.LeftFrame.IconFrame,
	Viewport = Guide.LeftFrame.IconFrame.ViewportFrame,
	AbandonButton = Guide.LeftFrame.Abandon,
	TrackButton = Guide.LeftFrame.Track
}

t.SideCompass.Notify:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 29 | Upvalues: t (copy) ]]
	if t.SideCompass.Notify.Visible then
		if not (t.SideCompass.Frame.Background.Visible and t.NotifyTween) then
			return
		end

		t.NotifyTween:Play()
		t.SideCompass.Frame.Alert.Visible = true
	elseif t.NotifyTween then
		t.NotifyTween:Pause()
		t.SideCompass.Frame.Alert.Visible = false
	end
end)
t.NotifyTween = TweenService:Create(t.SideCompass.Frame.Alert, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), {
	ImageTransparency = 0
})
t.SideCompass.Frame.Alert.Visible = false
t.Data = {
	Ready = false,
	Tracking = false,
	QuestData = nil,
	DisplayedNPC = nil,
	CompassLoop = nil,
	LastClosestNPC = nil,
	LastMeters = 0,
	NPCList = {}
}
t.Properties = {
	unknownLocationImage = "49009723",
	defaultCompassIcon = "8934096355",
	LocationDefaults = {
		GuideColors = { Guide.LeftFrame.IconFrame.UIStroke.UIGradient, "Color", ColorSequence.new(Color3.fromRGB(255, 197, 20)) },
		GuideIconID = { Guide.LeftFrame.IconFrame.GuideIcon, "Image", 7252565452 }
	}
}

local function ScreenToWorldSpace(p1, p2) --[[ ScreenToWorldSpace | Line: 66 | Upvalues: CurrentCamera (copy) ]]
	local ViewportSize = CurrentCamera.ViewportSize
	local v1 = p2 or 0.1
	local v2 = if p1 then p1 else Vector2.new()
	local Y = ViewportSize.Y
	local X = ViewportSize.X
	local v4 = math.tan(math.rad(CurrentCamera.FieldOfView) * 0.5)

	return CurrentCamera.CFrame * CFrame.new((Vector3.new(X / Y * v4 * (2 * v1 * (v2.X / (X - 1)) - v1), -v4 * (2 * v1 * (v2.Y / (Y - 1)) - v1), -v1)))
end

function t.SetDataReady(p1, p2) --[[ SetDataReady | Line: 90 ]]
	assert(if p2 == nil then false else true)
	assert(if typeof(p2) == "boolean" then true else false)
	p1.Data.Ready = p2
end
function t.ToggleCompassShown(p1, p2) --[[ ToggleCompassShown | Line: 96 | Upvalues: t (copy) ]]
	p1.IconFrame.GuideIcon.Visible = p2
	p1.IconFrame.Background.Visible = p2
	p1.IconFrame.GuideIcon.Image = "rbxassetid://" .. t.Properties.defaultCompassIcon
end
function t.ResetCompass(p1) --[[ ResetCompass | Line: 102 ]]
	p1.IconFrame.GuideIcon.Rotation = 0
	p1.IconFrame.GuideIcon.ImageColor3 = Color3.new(255/255, 255/255, 255/255)
	p1.SideCompass.Frame.GuideIcon.Rotation = 0
	p1.SideCompass.Frame.GuideIcon.ImageColor3 = Color3.new(255/255, 255/255, 255/255)
end
function t.ParentUI(p1, p2) --[[ ParentUI | Line: 109 ]]
	p1.UI.Parent = p2
	p1.SideCompass.Parent = p2
end
function t.AppendNPCData(p1, p2, p3) --[[ AppendNPCData | Line: 117 ]]
	p1.Data.NPCList[p2] = p3
end

local function getNearestLocation(p1) --[[ getNearestLocation | Line: 123 | Upvalues: Workspace (copy) ]]
	local v1 = nil
	local v2 = Workspace:WaitForChild("_WorldOrigin"):WaitForChild("Locations"):GetChildren()

	if #v2 > 0 then
		for k, v in pairs(v2) do
			if not v:GetAttribute("IgnoreInTracking") and (v:IsA("BasePart") and (not v1 or (v.Position - p1).Magnitude < (v1.Position - p1).Magnitude)) then
				v1 = v
			end
		end
	end

	return v1
end

local GuideCallbacks = require(script.GuideCallbacks)

local function f1(p1, p2) --[[ Line: 147 ]]
	return p2 < p1
end

local v2 = 0

function t.GetNearestNPC(p1, p2, p3) --[[ GetNearestNPC | Line: 149 | Upvalues: Notification (copy), GuideCallbacks (copy), getNearestLocation (copy), f1 (copy), v2 (ref) ]]
	local FrozenHeart = workspace.Map:FindFirstChild("FrozenHeart")

	if FrozenHeart then
		if not FrozenHeart.PrimaryPart then
			warn("the frozen heart is not streamed...")
		end

		if (p2 - FrozenHeart.PrimaryPart.Position).Magnitude < 1000 and FrozenHeart:FindFirstChild(game.Players.LocalPlayer.Name) then
			if p1.Data.LastClosestNPC ~= "Frozen Heart" then
				p1.SideCompass.Notify.Visible = true
				Notification.new("<Color=Purple>NEW QUEST AVAILABLE!<Color=/>", 10):Display()
				Notification.new("<Color=Purple>Open your compass menu to obtain the <Leviathan Heart>.<Color=/>", 10):Display()
				p1.Data.LastClosestNPC = "Frozen Heart"
			end

			if not (FrozenHeart:FindFirstChild("Inside") and FrozenHeart.Inside:GetAttribute("Harpooned")) then
				return {
					workspace.Map.FrozenHeart.PrimaryPart.Position,
					"Frozen Heart",
					false,
					false,
					1
				}
			end

			if workspace.Map.TikiOutpost:FindFirstChild("HeartDropoff") then
				return {
					workspace.Map.TikiOutpost.HeartDropoff.HeartDropoff.Position,
					"Frozen Heart",
					false,
					false,
					2
				}
			end

			warn("critical: there\'s no heartdropoff!")

			return {
				workspace.Map.TikiOutpost.HeartDropoff.HeartDropoff.Position,
				"Frozen Heart",
				false,
				false,
				2
			}
		end
	end

	for k, v in pairs(GuideCallbacks) do
		local v1 = v(p2, p3, getNearestLocation)

		if v1 then
			return v1
		end
	end

	local t = {}
	local v22 = 0
	local v3 = nil
	local v4 = nil
	local v5 = nil
	local v6 = nil

	for k, v in pairs(p1.Data.NPCList) do
		for k2, v7 in pairs(v.Levels) do
			if v22 < v7 and v7 <= p3 then
				v22 = v7
				t = {}
			end

			if v22 == v7 then
				table.insert(t, v7)
			end
		end
	end

	table.sort(t, f1)

	local v7 = t[1]

	for k, v in pairs(p1.Data.NPCList) do
		for k2, v8 in pairs(v.Levels) do
			if v8 == v7 and (not v3 or (v.Position - p2).Magnitude < (v3 - p2).Magnitude) then
				v3 = v.Position
				v4 = v.NPCName
				v6 = k
			end
		end
	end

	if v3 then
		local v8 = getNearestLocation(v3)

		v5 = if v8 and v8:FindFirstChild("Mesh").Scale.X / 2 < (v8.Position - v3).Magnitude then nil else v8
	end

	if p1.Data.LastClosestNPC == nil then
		p1.Data.LastClosestNPC = v4
	end

	if p1.Data.LastQuestLevel == nil then
		p1.Data.LastQuestLevel = v22
	end

	if v4 ~= p1.Data.LastClosestNPC or p1.Data.LastQuestLevel ~= v22 then
		p1.Data.LastClosestNPC = v4

		if p1.Data.LastQuestLevel ~= v22 then
			p1.SideCompass.Notify.Visible = true

			if v2 < tick() then
				v2 = tick() + 5
				Notification.new("<Color=Purple>NEW QUEST AVAILABLE!<Color=/>", 10):Display()
				Notification.new("<Color=Purple>Open your compass menu to find the next island.<Color=/>", 10):Display()
			end

			p1.Data.LastQuestLevel = v22
		end
	end

	return {
		v3,
		v4 or "Unknown NPC",
		v5,
		v6
	}
end

local function setupModel(p1) --[[ setupModel | Line: 246 | Upvalues: Util (copy) ]]
	local Proxy_Shirt = p1.Model:FindFirstChild("Proxy_Shirt")

	if Proxy_Shirt and (Proxy_Shirt:IsA("StringValue") and p1.Model:FindFirstChildWhichIsA("Shirt")) then
		local v1 = p1.Model:FindFirstChildWhichIsA("Shirt")

		v1.ShirtTemplate = Util.Graphics.SmartScale(Proxy_Shirt:GetAttribute("ShirtTemplate"))
		v1.Color3 = Proxy_Shirt:GetAttribute("Color3")
	end

	local Proxy_Pants = p1.Model:FindFirstChild("Proxy_Pants")

	if Proxy_Pants and (Proxy_Pants:IsA("StringValue") and p1.Model:FindFirstChildWhichIsA("Pants")) then
		local v2 = p1.Model:FindFirstChildWhichIsA("Pants")

		v2.PantsTemplate = Util.Graphics.SmartScale(Proxy_Pants:GetAttribute("PantsTemplate"))
		v2.Color3 = Proxy_Pants:GetAttribute("Color3")
	end

	local v3 = p1.Model:GetAttribute("FaceId")

	if v3 and (p1.Model:FindFirstChild("Head") and p1.Model.Head:FindFirstChild("face")) then
		p1.Model.Head.face.Texture = Util.Graphics.SmartScale(v3)
	end

	for k, v in pairs(p1.Model:GetChildren()) do
		if v:IsA("Accessory") or v:IsA("Hat") then
			for k2, v2 in pairs(v:GetDescendants()) do
				if v2.Name == "Proxy_SpecialMesh" then
					local v4 = v2.Parent:FindFirstChildWhichIsA("SpecialMesh")

					for k3, v5 in pairs({ "MeshId", "MeshType", "Offset", "Scale", "TextureId", "VertexColor" }) do
						local v52 = v2:GetAttribute(v5)

						if v5 == "TextureId" then
							v52 = Util.Graphics.SmartScale(v52)
						end

						v4[v5] = v52
					end
				end
			end
		end
	end
end

function t.ChangeDisplayedNPC(p1, p2) --[[ ChangeDisplayedNPC | Line: 290 | Upvalues: setupModel (copy) ]]
	if p2 then
		if typeof(p2) == "string" then
			if p1.Data.DisplayedNPC ~= nil then
				p1.Data.DisplayedNPC:Destroy()
			end

			p1.IconFrame.PlayerImage.Image = p2

			return
		end

		p1.IconFrame.PlayerImage.Image = ""

		if p1.Data.DisplayedNPC ~= nil then
			p1.Data.DisplayedNPC:Destroy()
		end

		local v1 = p2.Parent

		if v1 == nil then
			return
		end

		if not v1.PrimaryPart then
			_G.TestGameWarn("The npc model has no primarypart", v1, v1:GetFullName())

			return
		end

		local v2 = v1:Clone()
		local Y = v2:WaitForChild("HumanoidRootPart").Orientation.Y
		local v3 = CFrame.Angles(0, Y + -math.sign(Y) * math.abs(Y), 0) * CFrame.Angles(0, math.pi, 0) * (CFrame.new(0.5, -1, -0.5) * CFrame.Angles(0, -0.4363323129985824, 0))

		v2:SetPrimaryPartCFrame(CFrame.new(74.8819351, 2.40001965, 9.47781467, 8.74227766e-8, 0, -1, 0, 1, 0, 1, 0, 8.74227766e-8) * v3)
		v2.Parent = p1.Viewport
		p1.Data.DisplayedNPC = v2
		setupModel({
			Model = v2
		})
	else
		p1.IconFrame.PlayerImage.Image = ""

		if p1.Data.DisplayedNPC then
			p1.Data.DisplayedNPC:Destroy()
			p1.Data.DisplayedNPC = nil
		end
	end
end
function t.GetDistance(p1, p2) --[[ GetDistance | Line: 332 | Upvalues: CurrentCamera (copy), TeleportQuests (copy) ]]
	if p2 then
		local Magnitude = (p2 - CurrentCamera.CFrame.p).Magnitude

		for k, v in pairs(TeleportQuests) do
			if (p2 - v[1]).Magnitude < Magnitude and (CurrentCamera.CFrame.p - v[2]).Magnitude < Magnitude then
				return v[2]
			end

			if (p2 - v[2]).Magnitude < Magnitude and (CurrentCamera.CFrame.p - v[1]).Magnitude < Magnitude then
				return v[1]
			end
		end
	end

	return p2
end
function t.PointCompass(p1, p2) --[[ PointCompass | Line: 355 | Upvalues: CurrentCamera (copy), ScreenToWorldSpace (copy), Workspace (copy) ]]
	local v1 = p1:GetDistance(p2)

	local function adjust() --[[ adjust | Line: 357 | Upvalues: CurrentCamera (ref), ScreenToWorldSpace (ref), p1 (copy), v1 (ref) ]]
		local v12 = ScreenToWorldSpace(p1.IconFrame.GuideIcon.AbsolutePosition, 1) * CFrame.new(0, 0, -(CurrentCamera.CFrame.p - CurrentCamera.Focus.p).Magnitude)
		local v2 = v12:VectorToObjectSpace((CFrame.new(v12.Position, v1).LookVector * Vector3.new(1, 0, 1)).Unit)

		return math.deg((math.atan2(-v2.X, -v2.Z)))
	end

	task.spawn(function() --[[ Line: 365 | Upvalues: p1 (copy), v1 (ref), Workspace (ref), adjust (copy) ]]
		if p1.Data.CompassLoop then
			p1.Data.CompassLoop:Disconnect()
			p1.Data.CompassLoop = nil
		end

		if p1.Data.Billboard then
			p1.Data.Billboard:Destroy()
			p1.Data.Billboard = nil
		end

		if v1 then
			local RunService = game:GetService("RunService")

			p1.Data.CompassLoop = RunService.RenderStepped:Connect(function() --[[ Line: 382 | Upvalues: Workspace (ref), p1 (ref), adjust (ref), v1 (ref) ]]
				if Workspace.CurrentCamera then
					local v12 = adjust()
					local v3 = math.clamp(1 - (math.abs(v12) - 5) / 15, 0, 1)
					local v4 = Color3.new(255/255, 0/255, 0/255):Lerp(Color3.new(0/255, 255/255, 0/255), v3)

					p1.IconFrame.GuideIcon.ImageColor3 = v4
					p1.IconFrame.GuideIcon.Rotation = v12

					if not p1.Data.Tracking then
						return
					end

					p1.SideCompass.Frame.GuideIcon.ImageColor3 = v4
					p1.SideCompass.Frame.GuideIcon.Rotation = v12

					if p1.Data.Billboard then
						p1.Data.Billboard.CFrame = CFrame.new(v1)
					else
						p1.Data.Billboard = script.TrackerPart:Clone()
						p1.Data.Billboard.CFrame = CFrame.new(v1)
						p1.Data.Billboard.Parent = workspace._WorldOrigin
					end

					p1.Data.Billboard.BBG.TextLabel.Text = p1.Data.LastMeters .. "m away"
				else
					p1.Data.CompassLoop:Disconnect()
					p1.Data.CompassLoop = nil

					if not p1.Data.Billboard then
						return
					end

					p1.Data.Billboard:Destroy()
					p1.Data.Billboard = nil
				end
			end)
		else
			p1.IconFrame.GuideIcon.Rotation = 0
			p1.IconFrame.GuideIcon.ImageColor3 = Color3.new(0/255, 255/255, 0/255)
			p1.SideCompass.Frame.GuideIcon.ImageColor3 = Color3.new(0/255, 255/255, 0/255)
			p1.SideCompass.Frame.GuideIcon.Rotation = 0
		end
	end)
end
game:GetService("CollectionService"):GetInstanceAddedSignal("ObjectiveReplicatorTracker"):Connect(function(p1) --[[ Line: 426 | Upvalues: CurrentCamera (copy) ]]
	local v1 = p1.Value

	if not (v1 and v1:IsA("BasePart")) then
		return
	end

	local _ = p1.Parent
	local v2 = if p1 then p1:GetAttribute("Text") else p1
	local v3 = coroutine.running()
	local v4 = script.TrackerPart.BBG:Clone()

	v4.Parent = v1
	p1.AncestryChanged:Connect(function() --[[ Line: 435 | Upvalues: p1 (copy), v4 (copy), v3 (copy) ]]
		if p1.Parent then
			return
		end

		v4:Destroy()
		pcall(task.cancel, v3)
	end)
	v4.Adornee = v1

	local v5 = v4:FindFirstChildWhichIsA("TextLabel")

	if not v5 then
		return
	end

	while v4.Parent do
		task.wait(0.1)
		v5.Text = ("%* (%*m) "):format(v2 or "", (math.floor(math.floor((CurrentCamera.CFrame.p - v1.Position).Magnitude) / 10)))
	end
end)
function t.ChangeGuideIcon(p1, p2) --[[ ChangeGuideIcon | Line: 458 | Upvalues: TweenService (copy), t (copy) ]]
	local v1 = TweenService:Create(t.IconFrame.GuideIcon, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
		ImageTransparency = 1
	})

	v1.Completed:Connect(function() --[[ Line: 463 | Upvalues: p1 (copy), p2 (copy), TweenService (ref), t (ref) ]]
		p1.IconFrame.GuideIcon.Image = "rbxassetid://" .. p2
		TweenService:Create(t.IconFrame.GuideIcon, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
			ImageTransparency = 0
		}):Play()
	end)
	v1:Play()
end
task.spawn(function() --[[ Line: 473 | Upvalues: t (copy), f1 (copy) ]]
	game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("GetBestQuestNPC").OnClientInvoke = function(p1, p2) --[[ Line: 475 | Upvalues: t (ref), f1 (ref) ]]
		local t2 = {}
		local v1 = 0
		local v2 = nil
		local v3 = nil
		local v4 = nil

		for k, v in pairs(t.Data.NPCList) do
			for k2, v5 in pairs(v.Levels) do
				if v1 < v5 and v5 <= p1 then
					v1 = v5
					t2 = {}
				end

				if v1 == v5 then
					table.insert(t2, v5)
				end
			end
		end

		table.sort(t2, f1)

		local v5 = t2[1]

		for k, v in pairs(t.Data.NPCList) do
			for k2, v6 in pairs(v.Levels) do
				if v6 == v5 and (not v2 or (v.Position - p2).Magnitude < (v2 - p2).Magnitude) then
					v2 = v.Position
					v4 = v.NPCName
					v3 = k:FindFirstAncestorOfClass("Model")
				end
			end
		end

		return v3, v4
	end
end)

return t
