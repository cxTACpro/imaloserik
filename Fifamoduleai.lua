local module = {}
getgenv().FFMactive = true
module.blockedRemote = {
    [game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommE")] = true,
    ["CommE"] = true
}
module.meleeNames = { "Combat", "Black Leg", "Electro", "Fishman Karate", "Dragon Claw", "Superhuman", "Death Step", "Sharkman Karate", "Electric Claw", "Dragon Talon", "Godhuman", "Sanguine Art", "Divine Art" }
module.swordNames = { "Dark Blade", "Triple Katana", "Shark Saw", "Katana", "Iron Mace", "Bisento", "Saber", "Dual Katana", "Cutlass", "Wardens Sword", "Pipe", "Dual-Headed Blade", "Soul Cane", "Trident", "Pole (1st Form)", "Gravity Blade", "Shizu", "Longsword", "Saishi", "Oroshi", "True Triple Katana", "Flail", "Koko", "Midnight Blade", "Rengoku", "Dragon Trident", "Pole (2nd Form)", "Canvander", "Yama", "Tushita", "Twin Hooks", "Dark Dagger", "Hallow Scythe", "Buddy Sword", "Spikey Trident", "Cursed Dual Katana", "Shark Anchor", "Fox Lamp", "Triple Dark Blade", "Fishing Trophy", "Dragonheart" }
module.FruitsNames = { "Quake-Quake", "Magma-Magma", "Light-Light", "Ice-Ice", "Buddha-Buddha", "Flame-Flame", "Dark-Dark", "Rubber-Rubber", "Bomb-Bomb", "Spike-Spike", "Meme-Meme", "Chop-Chop", "Blade-Blade", "Smoke-Smoke", "Phoenix-Phoenix", "Spring-Spring", "Spider-Spider", "Sand-Sand", "Gravity-Gravity", "Pain-Pain", "Barrier-Barrier", "Dough-Dough", "Control-Control", "Dragon-Dragon", "Dragon (Classic)-Dragon (Classic)", "Venom-Venom", "Spin-Spin", "Door-Door", "Portal-Portal", "Rocket-Rocket", "Kilo-Kilo", "Diamond-Diamond", "Love-Love", "Falcon-Falcon", "Revive-Revive", "Ghost-Ghost", "Shadow-Shadow", "Soul-Soul", "Spirit-Spirit", "Yeti-Yeti", "Fiend (Yeti)-Fiend (Yeti)", "Tiger-Tiger", "Mammoth-Mammoth", "Sound-Sound", "Kitsune-Kitsune", "Empyrean (Kitsune)-Empyrean (Kitsune)", "T-Rex-T-Rex", "Gas-Gas", "Eagle-Eagle" }
module.guns = { "Slingshot", "Refined Slingshot", "Dual Flintlock", "Musket", "Flintlock", "Cannon", "Magma Blaster", "Bazooka", "Acidum Rifle", "Kabucha", "Bizarre Revolver", "Venom Bow", "Skull Guitar", "Dragonstorm" }
function module.playerHas(itemType, itemName)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then return nil end

    local backpack = LocalPlayer:WaitForChild("Backpack")
    local character = LocalPlayer.Character or LocalPlayer:WaitForChild("Character")

    local function hasItem(name)
        return (character and character:FindFirstChild(name)) or (backpack and backpack:FindFirstChild(name))
    end

    if not itemType then
        return hasItem(itemName)
    end

    local lookup = {
        Melee = module.meleeNames,
        Sword = module.swordNames,
        Fruit = module.FruitsNames,
        Gun   = module.guns,
    }

    local list = lookup[itemType]
    if list then
        for _, name in ipairs(list) do
            if hasItem(name) then
                return name
            end
        end
    end

    return nil
end
local original
original = hookmetamethod(game, "__namecall", function(self, ...)
    if getgenv().blockBadnamecall then
        return getgenv().blockBadnamecall(self, ...)
    end
    return original(self, ...)
end)
function module.blockBADremotes(list, value)
    getgenv().blockbad = value or false

    if not list then
        list = module.blockedRemote
    end

    getgenv().blockBadnamecall = function(self, ...)
        if typeof(self) == "Instance" then
            local methodName = getnamecallmethod()

            if methodName == "FireServer" or methodName == "InvokeServer" then
                local success, remoteName = pcall(function() return self.Name end)

                if getgenv().blockbad and success and (list[self] or list[remoteName]) then
                    return nil
                end
            end
        end

        return original(self, ...)
    end

    return getgenv().blockbad
end
function module.addBlockedRemote(remote)
    if type(remote) == "string" then
        module.blockedRemote[remote] = true
    elseif typeof(remote) == "Instance" then
        module.blockedRemote[remote] = true
        module.blockedRemote[remote.Name] = true
    end
end
function module.removeBlockedRemote(remote)
    if type(remote) == "string" then
        module.blockedRemote[remote] = nil
    elseif typeof(remote) == "Instance" then
        module.blockedRemote[remote] = nil
        module.blockedRemote[remote.Name] = nil
    end
end
function module.getSea()
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local Net
    local success, err = pcall(function()
        Net = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net"))
    end)

    if not success or not Net then
        warn("getSea: Failed to load Net module, defaulting to sea 1")
        return "1"
    end

    local getHasTag = Net:RemoteFunction("GetRealmHasTag")
    local getDifficulty = Net:RemoteFunction("GetRealmDifficulty")

    if not getHasTag or not getDifficulty then
        warn("getSea: Remote functions not found, defaulting to sea 1")
        return "1"
    end

    local function hasTag(tag)
        if RunService:IsServer() then
            return require(game.ServerStorage.Realms).getCurrentRealm():HasTag(tag)
        end
        local success, result = pcall(function()
            return getHasTag:InvokeServer(tag)
        end)
        return success and result == true
    end

    if hasTag("IsThirdSea") then
        return "3"
    elseif hasTag("IsSecondSea") then
        return "2"
    elseif hasTag("IsFirstSea") then
        return "1"
    else
        local success, difficulty = pcall(function()
            return getDifficulty:InvokeServer()
        end)
        if success then
            if difficulty >= 3 then
                return "3"
            elseif difficulty == 2 then
                return "2"
            else
                return "1"
            end
        else
            return "1"
        end
    end
end
function module.m1Attack(targetMan, equipIfnot)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local targetPart
    if targetMan and targetMan.Humanoid then
        for i=1 ,# targetMan:GetChildren() do
            if targetMan:GetChildren()[i]:IsA("BasePart") then
                targetPart = targetPart:GetChildren()[Random.New():NextInteger(1, #targetMan:GetChildren())]
            end
        end
    else 
        return nil
    end
    if equipIfnot then
        local tool
        local suc, bk = pcall(function() return LocalPlayer.Backpack end)
        if suc and bk then
            tool = bk:FindFirstChild(item) or (Character and Character:FindFirstChild(item))
        end
        if tool and tool:IsA("Tool") then
            local humanoid = Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:EquipTool(tool)
            end
        else
            warn("m1Attack: Item found but not equipable:", item)
        end
    end
    local Net = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net"))
    local RegisterAttack = Net:RemoteEvent("RegisterAttack")
    local RegisterHit = Net:RemoteEvent("RegisterHit", true)
    RegisterAttack:FireServer(0.5)
    RegisterHit:FireServer(targetPart, {})
    return true
end
local RenderStepped = game:GetService("RunService").RenderStepped
getgenv().steps = {}
local stepConnection
stepConnection = RenderStepped:Connect(function()
    -- General steps
    for i, v in pairs(getgenv().steps) do
        pcall(v)
    end
    
    -- Dedicated Hit System Loop
    if module.attackEnabled and module.currentTarget then
        -- This ensures the target is always updated every frame
        -- and the attack is ready to fire immediately on click
        local hitbox = module.hitboxData[module.currentTarget.Parent]
        if hitbox then
            module.currentTarget = module.getClosestEnemyPart(hitbox.part)
        end
    end
end)
function module.addfunctoStep(i, v)
    getgenv().steps[i] = v
end
function module.removefunctoStep(i)
    getgenv().steps[i] = nil
end
module.hitboxData = {}
module.hitCooldowns = {}
module.attackEnabled = false
module.currentTarget = nil
function module.hasMeleeWeapon()
    return module.playerHas("Melee") or module.playerHas("Sword")
end
function module.setupMeleeListener()
    if module._meleeConnection then
        module._meleeConnection:Disconnect()
        module._meleeConnection = nil
    end

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Character = LocalPlayer.Character
    if not Character then return end

    local meleeItem = module.playerHas("Melee") or module.playerHas("Sword")
    if not meleeItem then return end

    local tool = Character and Character:FindFirstChild(meleeItem)
    if not tool then
        local suc, bk = pcall(function() return LocalPlayer.Backpack end)
        if suc and bk then
            tool = bk:FindFirstChild(meleeItem)
        end
    end
    if not tool or not tool:IsA("Tool") then return end

    -- Connect to Activated event
    module._meleeConnection = tool.Activated:Connect(function()
        if module.attackEnabled and module.currentTarget then
            -- Trigger attack
            local success = module.m1Attack(module.currentTarget, true)
            if success then
                -- Disconnect and reconnect to refresh the listener and avoid bugs
                module._meleeConnection:Disconnect()
                module.setupMeleeListener()
            end
        end
    end)

    print("Melee listener refreshed for:", meleeItem)
end
function module.getClosestEnemyPart(hitboxPart)
    if not hitboxPart or not hitboxPart.Parent then return nil end

    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then return nil end

    local Character = LocalPlayer.Character
    if not Character then return nil end

    local rootPart = Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end

    -- Create params to exclude player and hitbox
    local params = OverlapParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {Character, hitboxPart}

    local overlappingParts = workspace:GetPartsInPart(hitboxPart, params)
    if not overlappingParts or #overlappingParts == 0 then return nil end

    local closestPart = nil
    local closestDistance = math.huge

    for _, part in pairs(overlappingParts) do
        -- Check if part belongs to an enemy (has Humanoid or is in Enemies folder)
        local model = part:FindFirstAncestorWhichIsA("Model")
        if model and model ~= Character then
            -- Check if it's an enemy (has Humanoid with Health)
            local humanoid = model:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local distance = (part.Position - rootPart.Position).Magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closestPart = part
                end
            end
        end
    end

    return closestPart
end
function module.extendHitboxForEnemy(enemy, factor)
    if not enemy or not enemy:IsA("Model") or not enemy.Parent then return end
    -- Ensure only one hitbox per enemy model. Clean up any existing data.
    if module.hitboxData[enemy] then
        module.cleanupHitbox(enemy)
    end
    local existing = enemy:FindFirstChild("ExtendedHitbox_removable")
    if existing then
        existing:Destroy()
    end

    local rootPart = enemy:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    -- Use provided factor or fallback to stored module factor
    local sz = factor or module.hitboxFactor or 10
    -- Create hitbox part
    local h = Instance.new("Part")
    h.Size = Vector3.new(sz, sz, sz)
    h.Transparency = 0.8
    h.CanCollide = false
    h.Anchored = false
    h.Material = Enum.Material.SmoothPlastic
    h.CFrame = rootPart.CFrame
    h.Name = "ExtendedHitbox_removable"
    h.Parent = enemy

    -- Weld to enemy
    local weld = Instance.new("WeldConstraint")
    weld.Part0 = rootPart
    weld.Part1 = h
    weld.Parent = h

    -- Store data
    module.hitboxData[enemy] = {
        part = h,
        weld = weld,
        enemy = enemy,
        rootPart = rootPart
    }

    -- Step function to track enemies in hitbox
    local stepName = "ExtendedHitbox_" .. enemy.Name .. "_" .. tostring(enemy)

    module.addfunctoStep(stepName, function()
        -- Cleanup if enemy or hitbox is destroyed
        if not enemy.Parent or not h.Parent or not rootPart.Parent then
            module.cleanupHitbox(enemy)
            return
        end

        -- Re-weld if weld is broken
        if not weld.Part0 or not weld.Part1 or weld.Part0 ~= rootPart then
            weld:Destroy()
            weld = Instance.new("WeldConstraint")
            weld.Part0 = rootPart
            weld.Part1 = h
            weld.Parent = h
            module.hitboxData[enemy].weld = weld
        end

        -- Check if player has melee weapon
        if not module.hasMeleeWeapon() then
            module.attackEnabled = false
            return
        end

        -- Get the closest enemy part in the hitbox
        local targetPart = module.getClosestEnemyPart(h)

        if targetPart then
            module.attackEnabled = true
            module.currentTarget = targetPart
        else
            module.attackEnabled = false
            module.currentTarget = nil
        end
    end)
end
function module.cleanupHitbox(enemy)
    if not enemy then return end

    local data = module.hitboxData[enemy]
    if data then
        if data.part and data.part.Parent then
            data.part:Destroy()
        end
        if data.weld then
            data.weld:Destroy()
        end
        module.hitboxData[enemy] = nil
    end

    -- Remove step function
    local stepName = "ExtendedHitbox_" .. enemy.Name .. "_" .. tostring(enemy)
    module.removefunctoStep(stepName)
end
function module.initialize(factor)
    -- If the module was already initialized, shut it down first to clear any
    -- existing hitboxes, step functions and global state. This allows the script
    -- to be run multiple times safely.
    if module._initialized then
        print("Module already initialized – reinitializing")
        local prevFactor = factor
        module.shutdown()
        -- Clear any lingering global flags set by the previous run
        getgenv().blockbad = nil
        getgenv().blockBadnamecall = nil
        getgenv().steps = {}
        getgenv().FFMactive = true
        factor = prevFactor
    end

    -- Wait for game to load
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
        Players.PlayerAdded:Wait()
        LocalPlayer = Players.LocalPlayer
    end

    while not LocalPlayer.Character do
        LocalPlayer.CharacterAdded:Wait()
    end

    local workspace = game:GetService("Workspace")
    local enemies = workspace:FindFirstChild("Enemies")

    if not enemies then
        -- Wait for Enemies folder to exist
        local success, result = pcall(function()
            return workspace:WaitForChild("Enemies", 30)
        end)
        if not success or not result then
            warn("extendHitbox: Enemies folder not found after 30 seconds")
            return
        end
        enemies = result
    end

    factor = factor or 10
    -- Store the factor for later helper calls (e.g., enableAllHitboxes)
    module.hitboxFactor = factor

    -- Clear existing hitboxes (in case of re‑initialisation)
    for enemy, _ in pairs(module.hitboxData) do
        module.cleanupHitbox(enemy)
    end
    module.hitboxData = {}

    -- Reset state tables and flags
    module.hitboxCooldowns = {}
    module.attackEnabled = false
    module.currentTarget = nil
    getgenv().steps = {}
    getgenv().FFMactive = true

    -- Setup melee listener
    module.setupMeleeListener()

    -- Apply to existing enemies
    for _, enemy in pairs(enemies:GetChildren()) do
        if enemy:IsA("Model") then
            module.extendHitboxForEnemy(enemy, factor)
        end
    end

    -- Apply to new enemies
    enemies.ChildAdded:Connect(function(enemy)
        if enemy:IsA("Model") then
            task.wait(0.5)  -- Wait for enemy to fully load
            module.extendHitboxForEnemy(enemy, factor)
        end
    end)

    -- Clean up when enemies are removed
    enemies.ChildRemoved:Connect(function(enemy)
        module.cleanupHitbox(enemy)
    end)

    -- Listen for weapon changes
    if LocalPlayer then
        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1)
            module.setupMeleeListener()
        end)

        local suc, bk = pcall(function() return LocalPlayer.Backpack end)
        if suc and bk then
            bk.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    task.wait(0.1)
                    module.setupMeleeListener()
                end
            end)
        end
    end

    module._initialized = true
    print("Extended hitbox system initialized with factor:", factor)
end
function module.enableAllHitboxes(factor)
    -- Use the stored factor if none is provided
    factor = factor or module.hitboxFactor or 10
    -- Ensure a clean environment before enabling hitboxes
    getgenv().FFMactive = true
    getgenv().steps = {}
    getgenv().blockbad = nil
    getgenv().blockBadnamecall = nil

    local workspace = game:GetService("Workspace")
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then
        warn("enableAllHitboxes: Enemies folder not found")
        return
    end
    for _, enemy in pairs(enemies:GetChildren()) do
        if enemy:IsA("Model") then
            module.extendHitboxForEnemy(enemy, factor)
        end
    end
    print("Enabled extended hitboxes for all enemies with factor:", factor)
end
function module.shutdown()
    getgenv().FFMactive = false

    -- Disconnect melee listener
    if module._meleeConnection then
        module._meleeConnection:Disconnect()
        module._meleeConnection = nil
    end

    -- Clean up all hitboxes
    for enemy, _ in pairs(module.hitboxData) do
        module.cleanupHitbox(enemy)
    end

    module.hitboxData = {}
    module.hitCooldowns = {}
    module.attackEnabled = false
    module.currentTarget = nil
    module._initialized = false

    -- Clear all step functions and reset the steps table
    getgenv().steps = {}
    -- Clear any global flags that may have been set during operation
    getgenv().blockbad = nil
    getgenv().blockBadnamecall = nil

    print("Module shutdown complete")
end
return module