local v_u_1 = script.Parent
local v_u_2 = require(game.ReplicatedStorage.Mouse)
local v_u_3 = require(game.ReplicatedStorage.Util)
local v_u_4 = require(game.ReplicatedStorage:WaitForChild("Effect"))
local v_u_5 = require(game.ReplicatedStorage.Modules.Util.TableAttribute)
local v6 = require(game.ReplicatedStorage.FruitClient)(script, getfenv())
if not script.Parent.Parent:IsA("Model") then
	repeat
		script.Parent.AncestryChanged:wait()
	until script.Parent.Parent:IsA("Model")
end
game:GetService("ReplicatedStorage"):WaitForChild("FX")
local v_u_7 = game:GetService("Players").LocalPlayer.Character
local v_u_8 = v_u_7.HumanoidRootPart
local v_u_9 = v_u_7.Humanoid
local _ = workspace.CurrentCamera
local v_u_10 = game:GetService("Players").LocalPlayer
game:GetService("UserInputService")
workspace:WaitForChild("_WorldOrigin")
Random.new()
local v11 = v_u_3.HeartbeatLoopFor
local _ = v11.HeartbeatLoopFor
local _ = v11.AwaitHeartbeatLoopFor
local v_u_12 = RaycastParams.new()
v_u_12.FilterType = Enum.RaycastFilterType.Exclude
v_u_12.FilterDescendantsInstances = { workspace._WorldOrigin, workspace.Characters, workspace.Enemies }
local v_u_13 = {}
local v_u_14 = false
v_u_13.Equipped = v_u_1.Equipped:Connect(function()
	-- upvalues: (ref) v_u_14
	v_u_14 = true
end)
v_u_13.Unequipped = v_u_1.Unequipped:Connect(function()
	-- upvalues: (ref) v_u_14
	v_u_14 = false
end)
local v_u_15 = game:GetService("UserInputService")
local v_u_16 = nil
local v_u_17 = 1
local v_u_18 = time
local v_u_19 = v_u_18()
local v_u_20 = false
v_u_13.Activated = v_u_1.Activated:Connect(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_9, (ref) v_u_20, (copy) v_u_10, (copy) v_u_18, (ref) v_u_19, (copy) v_u_8, (copy) v_u_12, (copy) v_u_2, (ref) v_u_17, (copy) v_u_3, (copy) v_u_7, (copy) v_u_4, (ref) v_u_16
	if _G.mobileSoru then
		return
	elseif v_u_1.Parent:FindFirstChildOfClass("Humanoid") == nil then
		return
	elseif v_u_9.Sit then
		return
	elseif v_u_20 then
		return
	elseif script.Parent.Holding.Value then
		return
	elseif v_u_10.Character.Busy.Value then
		return
	elseif v_u_10.Character.Stun.Value <= 0 then
		if v_u_18() - v_u_19 > 0 then
			local v_u_21 = workspace:Raycast(v_u_8.Position, -(v_u_9.HipHeight + v_u_8.Size.Y * 0.5 + 4) * Vector3.yAxis, v_u_12) ~= nil
			script.Parent.LeftClickRemote:FireServer(((v_u_2.Hit.Position - v_u_8.Position) * Vector3.new(1, 0, 1)).Unit, v_u_17, v_u_21)
			local v22 = script.Parent.TransformedRigObject
			local v23 = v22.Value ~= nil
			local v24 = v_u_17 == 5 and not v_u_21 and "Air" or ""
			v_u_3.Anims:Get(v23 and v22.Value or v_u_7, (v23 and "" or "Char") .. "KitsuneM1_" .. v_u_17 .. v24):Play()
			local v_u_25 = v_u_17
			task.delay(0.1, function()
				-- upvalues: (ref) v_u_4, (ref) v_u_10, (ref) v_u_8, (copy) v_u_25, (copy) v_u_21
				v_u_4.new("Kitsune.M1Combo"):replicate({
					["player"] = v_u_10,
					["hrp"] = v_u_8,
					["index"] = v_u_25,
					["playerOnGround"] = v_u_21,
					["transformed"] = script.Parent.IsTransformed.Value
				})
			end)
			local v26 = ((v_u_2.Hit.p - v_u_8.Position) * Vector3.new(1, 0, 1)).Unit
			local v27 = (v_u_17 < 5 and 0.3 or 1) - 1 * (v_u_7 and v_u_7:GetAttribute("FruitTAPCooldown") or 0)
			if v_u_16 then
				task.cancel(v_u_16)
			end
			v_u_16 = task.delay(1, function()
				-- upvalues: (ref) v_u_17
				v_u_17 = 1
			end)
			if not _G.Dodging then
				local v_u_28 = v_u_3.BodyMover.new(v_u_7):Create("BodyVelocity", {
					["Velocity"] = v26 * 80
				})
				task.spawn(function()
					-- upvalues: (copy) v_u_28
					local v29 = tick()
					local v30 = false
					while tick() - v29 < 0.3 do
						if tick() - v29 > 0.15 and not v30 then
							v_u_28:SetForce((Vector3.new(0, 100000, 0)))
							v30 = true
						end
						if _G.Dodging then
							v_u_28:Destroy()
							return
						end
						task.wait()
					end
				end)
			end
			local v_u_31 = v_u_3.BodyMover.new(v_u_7):Create("BodyGyro", {
				["CFrame"] = CFrame.lookAt(v_u_8.Position, v_u_8.Position + v26)
			})
			v_u_9.AutoRotate = false
			task.delay(0.3, function()
				-- upvalues: (copy) v_u_31, (ref) v_u_9
				v_u_31:Destroy()
				v_u_9.AutoRotate = true
			end)
			if v_u_17 < 5 then
				v_u_17 = v_u_17 + 1
			else
				v_u_17 = 1
			end
			v_u_19 = v_u_18() + v27
		end
	end
end)
v_u_13.Died = v_u_9.Died:Connect(function()
	-- upvalues: (copy) v_u_13
	for _, v32 in pairs(v_u_13) do
		v32:Disconnect()
	end
end)
v_u_13.AncestryChanged = v_u_1.AncestryChanged:Connect(function(_, p33)
	-- upvalues: (copy) v_u_13
	if p33 == nil then
		for _, v34 in pairs(v_u_13) do
			v34:Disconnect()
		end
	end
end)
local v_u_35 = {}
v_u_1.TransformedRigObject.Changed:Connect(function(p_u_36)
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_35, (copy) v_u_8, (copy) v_u_15
	if p_u_36 then
		require(game.ReplicatedStorage.Util.AttributeCounter).add(v_u_9, "BlockSit")
	else
		require(game.ReplicatedStorage.Util.AttributeCounter).remove(v_u_9, "BlockSit")
	end
	if p_u_36 == nil then
		for _, v37 in pairs(v_u_35) do
			v37:Disconnect()
		end
	else
		local v38 = v_u_3.Anims:Get(p_u_36, "KitsuneIdle")
		v38.Priority = Enum.AnimationPriority.Idle
		v38.Looped = true
		v38:Play()
		local v_u_39 = nil
		v_u_35.Running = v_u_9.Running:Connect(function(p40)
			-- upvalues: (ref) v_u_39, (ref) v_u_3, (copy) p_u_36
			if p40 > 0.1 and script.Parent.Holding.Value == false then
				if v_u_39 == nil then
					v_u_39 = v_u_3.Anims:Get(p_u_36, "KitsuneRun")
					v_u_39.Priority = Enum.AnimationPriority.Movement
					v_u_39.Looped = true
					v_u_39:Play()
				end
				v_u_39:AdjustSpeed(0.5 + p40 / 48 * 0.5)
			elseif v_u_39 ~= nil then
				v_u_39:Stop()
				v_u_39 = nil
			end
		end)
		local v_u_41 = nil
		v_u_35.StateChanged = v_u_9.StateChanged:Connect(function(p42, p43)
			-- upvalues: (ref) v_u_9, (ref) v_u_39, (ref) v_u_41, (ref) v_u_3, (copy) p_u_36
			if v_u_9.MoveDirection.Magnitude == 0 and v_u_39 ~= nil then
				v_u_39:Stop()
				v_u_39 = nil
			end
			if p43 == Enum.HumanoidStateType.Freefall and v_u_41 == nil then
				if v_u_39 ~= nil then
					v_u_39:Stop()
					v_u_39 = nil
				end
				v_u_41 = v_u_3.Anims:Get(p_u_36, "KitsuneFall")
				v_u_41.Priority = Enum.AnimationPriority.Movement
				v_u_41.Looped = true
				v_u_41:Play()
			end
			if p42 == Enum.HumanoidStateType.Freefall and v_u_41 ~= nil then
				v_u_41:Stop()
				v_u_41 = nil
				local v44 = v_u_3.Anims:Get(p_u_36, "KitsuneGround")
				v44.Priority = Enum.AnimationPriority.Action
				v44.Looped = false
				v44:Play()
				v44:AdjustWeight(1, 0.0001)
			end
		end)
		local v_u_45 = tick()
		local function v_u_50(p46)
			-- upvalues: (ref) v_u_45, (ref) v_u_3, (ref) v_u_8, (ref) v_u_9, (copy) p_u_36
			if tick() - v_u_45 < 0.05 then
				return
			else
				v_u_45 = tick()
				local v47, _, _ = v_u_3.Ray(v_u_8.Position, -Vector3.yAxis * (v_u_8.Size.Y * 0.5 + v_u_9.HipHeight + 2), { workspace.Characters, workspace.Enemies }, false)
				if p46 then
					local v48 = v_u_3.Anims:Get(p_u_36, "KitsuneGeppo")
					v48.Priority = Enum.AnimationPriority.Action
					v48.Looped = false
					v48:Play()
					v48:AdjustWeight(1, 0.0001)
					v48:AdjustSpeed(1)
					return
				elseif v47 then
					local v49 = v_u_3.Anims:Get(p_u_36, "KitsuneJump")
					v49.Priority = Enum.AnimationPriority.Action
					v49.Looped = false
					v49:Play()
					v49:AdjustWeight(1, 0.0001)
					v49:AdjustSpeed(1)
				end
			end
		end
		v_u_35.IsJumping = v_u_9.Jumping:Connect(function()
			-- upvalues: (copy) v_u_50
			v_u_50()
		end)
		v_u_35.Dodged = game:GetService("ReplicatedStorage").PlayerDodged.Event:Connect(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_15, (ref) v_u_3, (copy) p_u_36
			local v51 = workspace.CurrentCamera
			local v52 = CFrame.lookAt(Vector3.zero, v51.CFrame.LookVector * Vector3.new(1, 0.001, 1)):VectorToObjectSpace(v_u_9.MoveDirection)
			local v53 = math.sqrt(2) * 0.5
			local v54 = v53 < v52:Dot((Vector3.new(1, 0, 0)))
			local v55 = v53 < v52:Dot((Vector3.new(-1, 0, 0)))
			local _ = v53 < v52:Dot((Vector3.new(0, 0, -1)))
			local v56 = v53 < v52:Dot((Vector3.new(0, 0, 1)))
			local v57 = "FullKitsuneDashForward"
			if _G.Shiftlock or v_u_15.MouseBehavior == Enum.MouseBehavior.LockCenter then
				v57 = v56 and "FullKitsuneDashBack" or (v54 and "FullKitsuneDashRight" or (v55 and "FullKitsuneDashLeft" or v57))
			end
			local v58 = v_u_3.Anims:Get(p_u_36, v57)
			v58.Priority = Enum.AnimationPriority.Action
			v58.Looped = false
			v58:Play(0.1)
			v58:AdjustWeight(1, 0.0001)
		end)
		local v_u_59 = false
		v_u_35.SkyJumped = game:GetService("ReplicatedStorage").PlayerSkyJumped.Event:Connect(function()
			-- upvalues: (ref) v_u_59, (ref) v_u_3, (copy) p_u_36
			v_u_59 = not v_u_59
			local v60 = v_u_3.Anims:Get(p_u_36, "KitsuneGeppo")
			v60.Priority = Enum.AnimationPriority.Action
			v60.Looped = false
			v60:Play()
			v60:AdjustWeight(1, 0.0001)
			v60:AdjustSpeed(1)
		end)
	end
end)
v_u_9.Died:Connect(function()
	-- upvalues: (copy) v_u_35
	for _, v61 in pairs(v_u_35) do
		v61:Disconnect()
	end
end)
local v_u_62 = v_u_20
local v63 = {
	"KitsuneDashBackward",
	"KitsuneDashForward",
	"KitsuneDashForward2",
	"KitsuneDashForwardZigZag",
	"KitsuneDashLeft",
	"KitsuneDashRight",
	"KitsuneSkyJump"
}
local function v_u_67(p64)
	-- upvalues: (copy) v_u_3, (copy) v_u_7
	if not v_u_3.Ray(p64 + Vector3.yAxis * 0.1, Vector3.yAxis * -0.2, { workspace.Characters, workspace.Enemies }) then
		return p64
	end
	local v65 = v_u_7.HumanoidRootPart.Size.Y * 0.5 + v_u_7.Humanoid.HipHeight
	local v66 = math.min(9.5, v65)
	return p64 + Vector3.new(0, v66, 0)
end
for _, v68 in pairs(game.ReplicatedStorage.Util.Anims.Storage["2"].Kitsune:GetChildren()) do
	local v69 = v68.Name
	table.insert(v63, v69)
end
for _, v70 in pairs(v63) do
	v_u_3.Anims:Preload(v70)
end
local v_u_71 = require(v_u_1.Data)
local v_u_72 = {}
for v73, v74 in pairs(v_u_71.Cooldown) do
	v_u_72[v73] = v74
end
v6.add(Enum.KeyCode.Z, function(_, _, _)
	-- upvalues: (ref) v_u_62, (copy) v_u_2, (copy) v_u_9, (copy) v_u_8, (copy) v_u_67, (copy) v_u_3, (copy) v_u_7, (copy) v_u_1, (copy) v_u_4, (copy) v_u_10, (copy) v_u_71, (copy) v_u_72
	v_u_62 = true
	script.Parent.RemoteEvent:FireServer(v_u_2.Hit.p)
	v_u_9.AutoRotate = false
	local v75 = {
		["CFrame"] = CFrame.new(v_u_8.Position, v_u_67(v_u_2.Hit.p))
	}
	local v_u_76 = v_u_3.BodyMover.new(v_u_7):Create("BodyGyro", v75)
	local v77 = v_u_3.BodyMover.new(v_u_7):Create("BodyVelocity", {
		["Velocity"] = Vector3.zero
	})
	local v_u_78 = false
	spawn(function()
		-- upvalues: (ref) v_u_1, (ref) v_u_7, (ref) v_u_78, (ref) v_u_2, (copy) v_u_76, (ref) v_u_8, (ref) v_u_67
		while v_u_1:IsDescendantOf(v_u_7) and not v_u_78 do
			script.Parent.RemoteEvent:FireServer(v_u_2.Hit.p)
			v_u_76:Set(CFrame.new(v_u_8.Position, v_u_67(v_u_2.Hit.p)))
			wait()
		end
	end)
	if not script.Parent.IsTransformed.Value then
		v_u_4.new("Kitsune.ZCharge"):replicate({
			["player"] = v_u_10,
			["hrp"] = v_u_8,
			["holding"] = v_u_1.Holding
		})
	end
	local v_u_79 = v_u_1.TransformedRigObject.Value and v_u_3.Anims:Get(v_u_1.TransformedRigObject.Value, "KitsuneZCharge") or v_u_3.Anims:Get(v_u_7, "CharKitsuneZCharge")
	v_u_79:Play()
	local v_u_80 = false
	task.spawn(function()
		-- upvalues: (ref) v_u_78, (copy) v_u_79, (ref) v_u_1, (ref) v_u_3, (ref) v_u_7, (ref) v_u_80
		if script.Parent.Holding.Value then
			script.Parent.Holding.Changed:Wait()
		end
		v_u_78 = true
		v_u_79:Stop()
		local v81 = v_u_1.TransformedRigObject.Value and v_u_3.Anims:Get(v_u_1.TransformedRigObject.Value, "KitsuneFDash") or v_u_3.Anims:Get(v_u_7, "CharKitsuneZFire")
		v81:Play()
		if v_u_1.TransformedRigObject.Value then
			repeat
				task.wait()
			until v_u_7:FindFirstChild("KitsuneZGrab") or v_u_80
			v81:Stop()
		end
	end)
	script.Parent.RemoteFunction:InvokeServer("Z")
	v_u_71.Cooldown.Z = v_u_72.Z * (v_u_1.TransformedRigObject.Value and 0.75 or 1)
	v_u_79:Stop()
	v_u_80 = true
	v77:Destroy()
	v_u_76:Destroy()
	v_u_9.AutoRotate = true
	v_u_78 = true
	v_u_62 = false
end)
local v_u_82 = false
v6.add(Enum.KeyCode.X, function(_, _, _)
	-- upvalues: (ref) v_u_62, (copy) v_u_3, (copy) v_u_7, (copy) v_u_8, (copy) v_u_67, (copy) v_u_2, (copy) v_u_9, (copy) v_u_1, (ref) v_u_82, (copy) v_u_71, (copy) v_u_72
	v_u_62 = true
	if script.Parent.TransformedRigObject.Value == nil then
		local v_u_83 = v_u_3.BodyMover.new(v_u_7):Create("BodyGyro", {
			["CFrame"] = CFrame.new(v_u_8.Position, v_u_67(v_u_2.Hit.p))
		})
		local v84 = v_u_3.BodyMover.new(v_u_7):Create("BodyPosition", {
			["Position"] = v_u_8.Position
		})
		v_u_9.AutoRotate = false
		local v_u_85 = false
		local v_u_86 = false
		task.spawn(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_7, (ref) v_u_86, (ref) v_u_85, (copy) v_u_83, (ref) v_u_8, (ref) v_u_67, (ref) v_u_2
			while v_u_1:IsDescendantOf(v_u_7) and not v_u_86 do
				if not v_u_85 then
					v_u_83:Set(CFrame.new(v_u_8.Position, v_u_67(v_u_2.Hit.p)))
				end
				script.Parent.RemoteEvent:FireServer(v_u_2.Hit.p)
				task.wait()
			end
		end)
		v_u_82 = not v_u_82
		local v_u_87 = v_u_3.Anims:Get(v_u_7, "CharKitsuneXFire" .. (v_u_82 and 2 or 1))
		v_u_87:Play(nil, nil, 2)
		task.spawn(function()
			-- upvalues: (copy) v_u_87, (ref) v_u_85
			task.wait(0.1)
			v_u_87:AdjustSpeed(0)
			if script.Parent.Holding.Value then
				script.Parent.Holding.Changed:Wait()
			end
			v_u_85 = true
			v_u_87:AdjustSpeed(2)
		end)
		script.Parent.RemoteFunction:InvokeServer("X", v_u_82)
		v_u_86 = true
		v_u_71.Cooldown.X = v_u_72.X * (v_u_1.TransformedRigObject.Value and 0.75 or 1)
		v_u_83:Destroy()
		v84:Destroy()
		v_u_9.AutoRotate = true
	else
		local v88 = v_u_3.BodyMover.new(v_u_7)
		local v89 = {}
		local v90 = CFrame.new
		local v91 = v_u_8.Position
		local v92 = v_u_2.Hit.p.X
		local v93 = v_u_8.Position.Y
		local v94 = v_u_2.Hit.p.Z
		v89.CFrame = v90(v91, (Vector3.new(v92, v93, v94)))
		local v_u_95 = v88:Create("BodyGyro", v89)
		local v96 = v_u_3.BodyMover.new(v_u_7):Create("BodyVelocity", {
			["Velocity"] = Vector3.zero
		})
		v_u_9.AutoRotate = false
		local v_u_97 = {}
		task.spawn(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_7, (copy) v_u_97, (copy) v_u_95, (ref) v_u_8, (ref) v_u_2
			while v_u_1:IsDescendantOf(v_u_7) and v_u_97.ClientReleased ~= true do
				local v98 = v_u_95
				local v99 = CFrame.new
				local v100 = v_u_8.Position
				local v101 = v_u_2.Hit.p.X
				local v102 = v_u_8.Position.Y
				local v103 = v_u_2.Hit.p.Z
				v98:Set(v99(v100, (Vector3.new(v101, v102, v103))))
				script.Parent.RemoteEvent:FireServer(v_u_2.Hit.p)
				task.wait()
			end
		end)
		local v104 = v_u_3.Anims:Get(script.Parent.TransformedRigObject.Value, "KitsuneXCharge")
		v104:Play()
		task.spawn(function()
			-- upvalues: (ref) v_u_71, (ref) v_u_72, (ref) v_u_1, (copy) v_u_97
			script.Parent.RemoteFunction:InvokeServer("X")
			v_u_71.Cooldown.X = v_u_72.X * (v_u_1.TransformedRigObject.Value and 0.75 or 1)
			v_u_97.ServerDone = true
		end)
		if script.Parent.Holding.Value then
			script.Parent.Holding.Changed:Wait()
		end
		v_u_97.ClientReleased = true
		local v105 = tick()
		local v106 = false
		while tick() - v105 <= 5 and (v_u_9.Health > 0 and (v_u_8 ~= nil and (v_u_8.Parent ~= nil and v_u_1.Parent == v_u_7))) do
			if v_u_7:FindFirstChild("_KitsuDashStart") then
				if v_u_95 then
					v_u_95:Destroy()
				end
				if v96 then
					v96:Destroy()
				end
				v_u_7:FindFirstChild("_KitsuDashStart"):Destroy()
				v106 = true
			end
			task.wait()
			if v_u_97.ServerDone == true then
				break
			end
		end
		v104:Stop()
		if not v106 then
			if v_u_95 then
				v_u_95:Destroy()
			end
			if v96 then
				v96:Destroy()
			end
		end
		v_u_9.AutoRotate = true
	end
	v_u_62 = false
end)
v6.add(Enum.KeyCode.C, function(_, _, _)
	-- upvalues: (ref) v_u_62, (copy) v_u_2, (copy) v_u_9, (copy) v_u_8, (copy) v_u_67, (copy) v_u_3, (copy) v_u_7, (copy) v_u_1, (copy) v_u_4, (copy) v_u_10, (copy) v_u_71, (copy) v_u_72
	v_u_62 = true
	script.Parent.RemoteEvent:FireServer(v_u_2.Hit.p)
	v_u_9.AutoRotate = false
	local v107 = {
		["CFrame"] = CFrame.new(v_u_8.Position, v_u_67(v_u_2.Hit.p))
	}
	local v_u_108 = v_u_3.BodyMover.new(v_u_7):Create("BodyGyro", v107)
	local v109 = v_u_3.BodyMover.new(v_u_7):Create("BodyPosition", {
		["Position"] = v_u_8.Position
	})
	local v_u_110 = false
	spawn(function()
		-- upvalues: (ref) v_u_1, (ref) v_u_7, (ref) v_u_110, (ref) v_u_2, (copy) v_