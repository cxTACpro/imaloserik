
-- ---------------------------------------------------------------------------
-- Standalone version of RunHitDetection
-- This function can be used outside of the CombatUtil module by providing the
-- required services and utilities as arguments. Variable names have been
-- expanded for readability.
-- ---------------------------------------------------------------------------

--- Runs hit detection for a given attacker.
--- @param attacker Character The character performing the attack.
--- @param hitPart BasePart The part that initiated the hit (e.g., weapon handle).
--- @param moveIndex number The index of the move/animation being used.
--- @param animationTrack AnimationTrack The animation track playing the attack.
--- @param deps table A table containing required dependencies:
---   {
---     Players = Players,
---     Enemies = Enemies,
---     Characters = Characters,
---     HitPartLookup = t3,
---     Flags = Flags,
---     GetBoundingBoxCustom = GetBoundingBoxCustom,
---     GetCornersOfPart = GetCornersOfPart,
---     RaycastParams = v5,
---     IsServer = v1,
---     RemoteEvents = t2,
---     CombatModule = t,
---   }
--- @return nil
function RunHitDetectionStandalone(attacker, hitPart, moveIndex, animationTrack, deps)
	-- Resolve dependencies with sensible defaults when not provided
	local Players = deps and deps.Players or game:GetService("Players")
	local Enemies = deps and deps.Enemies or workspace.Enemies
	local Characters = deps and deps.Characters or workspace.Characters
	local HitPartLookup = deps and deps.HitPartLookup or {}
	local Flags = deps and deps.Flags or {}
	local GetBoundingBoxCustom = deps and deps.GetBoundingBoxCustom or GetBoundingBoxCustom
	local GetCornersOfPart = deps and deps.GetCornersOfPart or GetCornersOfPart
	local RaycastParams = deps and deps.RaycastParams or v5
	local IsServer = deps and deps.IsServer or v1
	local RemoteEvents = deps and deps.RemoteEvents or t2
	local Combat = deps and deps.CombatModule or t

	local attackerPlayer = Players:GetPlayerFromCharacter(attacker)
	local humanoidRoot = attacker.HumanoidRootPart
	local upperTorso = attacker.UpperTorso
	local rightFoot = attacker.RightFoot

	local equippedWeapon = attacker:FindFirstChild("EquippedWeapon") or Combat:GetEquippedWeaponTool(attacker)
	local weaponName = Combat:GetWeaponName(equippedWeapon)
	local weaponData = Combat:GetWeaponData(weaponName)
	local isMelee = weaponData.WeaponType == "Melee"
	local isEnemyWeapon = equippedWeapon and equippedWeapon:IsDescendantOf(Enemies) and not attacker:FindFirstChild("Summoner")
	local attackerSummoner = attacker:FindFirstChild("Summoner")
	local basicMoveset = weaponData.Moveset.Basic

	assert(basicMoveset, ("Couldn't find the 'Basic' moveset for %s"):format(weaponName))

	-- Abort if the move has an AOEDelay defined (original guard)
	if basicMoveset[moveIndex].AOEDelay ~= nil then
		return
	end

	-- Gather all potential hit parts
	local potentialHitParts = {}
	if isMelee then
		for _, part in ipairs(attacker:GetChildren()) do
			if part:HasTag("WeaponHitbox") or part:HasTag("Blade") then
				table.insert(potentialHitParts, part)
			end
		end
	end
	for _, descendant in ipairs(equippedWeapon:GetDescendants()) do
		if descendant:HasTag("WeaponHitbox") or descendant:HasTag("Blade") then
			table.insert(potentialHitParts, descendant)
		end
	end

	local pendingHits = {}
	local processedHits = {}
	local maxAoeTargets = Combat:CanCharacterMeleeAoe(attacker)

	local function tryRegisterHit(candidates)
		local firstTarget = nil
		local firstHitPart = nil
		for _, candidatePart in ipairs(candidates) do
			local targetCharacter = Combat:GetRigOfHitPart(candidatePart)
			if targetCharacter then
				if HitPartLookup[candidatePart.Name] then
					local targetSummoner = targetCharacter:FindFirstChild("Summoner")
					local attackerSummoner = attacker:FindFirstChild("Summoner")
					if (not attackerSummoner or targetCharacter ~= attackerSummoner.Value.Character) and (not attackerPlayer or (not targetSummoner or targetSummoner.Value ~= attackerPlayer)) then
						local canHit = false
						if weaponData.ValidateFrontHits then
							local attackerPos = humanoidRoot.CFrame.Position
							local targetPos = targetCharacter.PrimaryPart.CFrame.Position
							if not (Combat:GetAttackAngle(attacker, targetCharacter) > 1.3) and ((not isEnemyWeapon or (not targetCharacter:IsDescendantOf(workspace.Enemies) or (attackerSummoner or targetSummoner))) and (targetCharacter ~= attacker and Combat:IsVulnerable(targetCharacter))) then
								canHit = true
							end
						else
							if (not isEnemyWeapon or (not targetCharacter:IsDescendantOf(workspace.Enemies) or (attackerSummoner or targetSummoner))) and (targetCharacter ~= attacker and Combat:IsVulnerable(targetCharacter)) then
								canHit = true
							end
						end

						if canHit then
							if firstTarget then
								if #processedHits < maxAoeTargets and candidatePart.Parent ~= firstTarget and not table.find(processedHits, candidatePart.Parent) then
									table.insert(pendingHits, { targetCharacter, candidatePart })
									table.insert(processedHits, targetCharacter)
								end
								continue
							end
							firstTarget = targetCharacter
							firstHitPart = candidatePart
						end
					end
				end
			else
				warn("No rig found for hit part:", candidatePart)
			end
		end
		if firstTarget then
			registerHit(attacker, firstTarget, firstHitPart, weaponData, pendingHits)
		end
		return firstTarget, firstHitPart
	end

	-- Visualization (optional, kept identical to original for debugging)
	local broadphaseHitbox = nil
	local broadphaseHitbox2 = nil
	if Flags.NEW_COMBAT_SYSTEM_VISUALIZE_HITBOXES then
		broadphaseHitbox2 = Instance.new("Part")
		broadphaseHitbox2.Name = "BroadphaseHitboxPart"
		broadphaseHitbox2.BrickColor = BrickColor.new("Bright red")
		broadphaseHitbox2.Transparency = 0.8
		broadphaseHitbox2.CanCollide = false
		broadphaseHitbox2.CanTouch = false
		broadphaseHitbox2.CanQuery = false
		broadphaseHitbox2.Anchored = true
		broadphaseHitbox2.Parent = workspace
	end

	local buddha2 = attacker.HumanoidRootPart:FindFirstChild("Buddha2")
	local hasBuddha = (buddha2 or attacker.HumanoidRootPart:FindFirstChild("Buddha")) and true or false
	local dummy = humanoidRoot.Size.Y * 0.5 + attacker.Humanoid.HipHeight + 0.5
	local animationLength = animationTrack._Object.Length
	local elapsed = 0
	local hitStopped = nil
	local recentFrames = {}

	while elapsed < animationLength and (animationTrack._Object.IsPlaying and not hitStopped) do
		elapsed = elapsed + task.wait()
		if equippedWeapon and not equippedWeapon:IsDescendantOf(workspace) then break end
		if not (elapsed < 0.13) then
			local rootCFrame = humanoidRoot.CFrame
			local rootPos = rootCFrame.Position
			local torsoOffset = rootCFrame * Vector3.new(upperTorso.Size.X, 0, 0)
			local progress = math.clamp(elapsed / animationLength, 0, 1)
			local footPos = torsoOffset:Lerp(Vector3.new(rootPos.X, (rightFoot.Position - Vector3.new(0, rightFoot.Size.Y * 0.5, 0)).Y, rootPos.Z), progress)
			local boxCFrame, boxSize = GetBoundingBoxCustom(potentialHitParts)
			local corners = GetCornersOfPart({ CFrame = boxCFrame, Size = boxSize })
			local sweepPoints = { torsoOffset, footPos, unpack(corners) }
			for i = #recentFrames, #recentFrames + 1 - 30, -1 do
				local old = recentFrames[i]
				if old then
					for _, offset in ipairs(old) do
						table.insert(sweepPoints, rootCFrame * offset)
					end
				end
			end
			local transformedPoints = {}
			for _, corner in ipairs(corners) do
				table.insert(transformedPoints, rootCFrame:ToObjectSpace(corner))
			end
			table.insert(recentFrames, transformedPoints)
			local boxCFrame2, boxSize2 = GetBoundingBoxCustom(sweepPoints)
			local finalCFrame = boxCFrame2 * (rootCFrame - rootPos)
			local finalSize = boxSize2 * (1 / math.clamp(humanoidRoot:GetAttribute("CharacterSizeScaleNumber") or 1, 1, 999))
			local useHalf = if isEnemyWeapon then not attackerSummoner else isEnemyWeapon
			if useHalf then finalSize = finalSize * 0.5 end
			local characterScale = humanoidRoot.Size * (humanoidRoot:GetAttribute("HrpSizeScale") or 1)
			if hasBuddha and isMelee then
				finalSize = Vector3.new(10.625, 7.5, 10) * characterScale.Y / 2
				local hitboxMag = weaponData.HitboxMagnitude
				if hitboxMag then finalSize = finalSize * (1 + (hitboxMag - 2) * 0.1) end
				if buddha2 then finalSize = finalSize * Vector3.new(1, 1, 0.875) end
				finalCFrame = humanoidRoot.CFrame * CFrame.new(0, -finalSize.Y * 0.125, -finalSize.Z / 3.25)
			elseif hasBuddha then
				finalSize = Vector3.new(finalSize.X, math.max(characterScale.Y * 4, finalSize.Y), finalSize.Z)
			end
			if broadphaseHitbox2 then
				broadphaseHitbox2.CFrame = finalCFrame
				broadphaseHitbox2.Size = finalSize
			end
			local hitResults = workspace:GetPartBoundsInBox(finalCFrame, finalSize, RaycastParams)
			if hasBuddha and not isMelee then
				local extraSize = Vector3.new(10.625, 7.5, 10) * characterScale.Y / 2
				local hitboxMag = weaponData.HitboxMagnitude
				if hitboxMag then extraSize = extraSize * (1 + (hitboxMag - 2) * 0.1) end
				if buddha2 then extraSize = extraSize * Vector3.new(1, 1, 0.875) end
				local extraCFrame = humanoidRoot.CFrame * CFrame.new(0, -extraSize.Y * 0.125, -extraSize.Z / 3.25)
				if Flags.NEW_COMBAT_SYSTEM_VISUALIZE_HITBOXES and not broadphaseHitbox then
					broadphaseHitbox = Instance.new("Part")
					broadphaseHitbox.Name = "BroadphaseHitboxPart"
					broadphaseHitbox.BrickColor = BrickColor.new("Bright red")
					broadphaseHitbox.Transparency = 0.8
					broadphaseHitbox.CanCollide = false
					broadphaseHitbox.CanTouch = false
					broadphaseHitbox.CanQuery = false
					broadphaseHitbox.Anchored = true
					broadphaseHitbox.CFrame = extraCFrame
					broadphaseHitbox.Size = extraSize
					broadphaseHitbox.Parent = workspace
				end
				if broadphaseHitbox then
					broadphaseHitbox.CFrame = extraCFrame
					broadphaseHitbox.Size = extraSize
				end
				for _, extraHit in pairs(workspace:GetPartBoundsInBox(extraCFrame, extraSize, RaycastParams)) do
					table.insert(hitResults, extraHit)
				end
			end
			local hitTarget, hitPart = tryRegisterHit(hitResults)
			if hitTarget then
				local hitPlayer = Players:GetPlayerFromCharacter(hitTarget)
				if attackerPlayer and hitPlayer then
					local hitPos = hitPart.Position
					for _, otherPlayer in ipairs(Players:GetPlayers()) do
						local otherChar = otherPlayer.Character
						if otherPlayer ~= attackerPlayer and otherChar and (otherChar:GetPivot().Position - hitPos).Magnitude <= 300 then
							RemoteEvents.ReceivedHit:FireClient(hitPlayer, hitTarget, otherChar, weaponData.Name, weaponData.WeaponType, hitPart)
						end
					end
				end
				break
			end
			hitStopped = hitTarget
			if not hasBuddha or not isMelee then
				for _, extraPart in ipairs(potentialHitParts) do
					local size = extraPart.Size
					local finalSizeCalc
					if useHalf then
						finalSizeCalc = size * 0.5
					else
						local hitboxMag = weaponData.HitboxMagnitude
						if hitboxMag then size = size + Vector3.new(1,1,1) * hitboxMag end
						if isMelee then size = size + Vector3.new(2,2,2) end
						if attacker.HumanoidRootPart:FindFirstChild("Buddha2") then
							size = size * 1.5
						elseif attacker.HumanoidRootPart:FindFirstChild("Buddha") then
							size = size * 1.2
						end
						finalSizeCalc = Vector3.new(math.max(3, size.X), math.max(3, size.Y), math.max(3, size.Z))
					end
					if Flags.NEW_COMBAT_SYSTEM_VISUALIZE_HITBOXES then
						local partVis = Instance.new("Part")
						partVis.BrickColor = BrickColor.new("Bright red")
						partVis.Transparency = 0.5
						partVis.CanCollide = false
						partVis.CanTouch = false
						partVis.CanQuery = false
						partVis.Anchored = true
						partVis.CFrame = extraPart.CFrame
						partVis.Size = finalSizeCalc
						partVis.Parent = workspace
						task.delay(0, function() partVis:Destroy() end)
					end
					local extraHitTarget, extraHitPart = tryRegisterHit(workspace:GetPartBoundsInBox(extraPart.CFrame, finalSizeCalc, RaycastParams))
					if extraHitTarget then
						local extraPlayer = Players:GetPlayerFromCharacter(extraHitTarget)
						if attackerPlayer and extraPlayer then
							local extraPos = extraHitPart.Position
							for _, otherPlayer in ipairs(Players:GetPlayers()) do
								local otherChar = otherPlayer.Character
								if otherPlayer ~= attackerPlayer and otherChar and (otherChar:GetPivot().Position - extraPos).Magnitude <= 300 then
									RemoteEvents.ReceivedHit:FireClient(extraPlayer, extraHitTarget, otherChar, weaponData.Name, weaponData.WeaponType, extraHitPart)
								end
							end
						end
						break
					end
					hitStopped = extraHitTarget
				end
				continue
			end
		end
	end

	if attackerPlayer == game.Players.LocalPlayer then
		registerHit(true)
	end

	if not Flags.NEW_COMBAT_SYSTEM_VISUALIZE_HITBOXES then return end
	task.delay(0.1, function() if broadphaseHitbox2 then broadphaseHitbox2:Destroy() end end)
	if not broadphaseHitbox then return end
	task.delay(0.1, function() broadphaseHitbox:Destroy() end)
end