local GetGlobal = getgenv and getgenv()
if not game.Loaded then
    game.Loaded:Wait()
end
for i,v in next, game.GetChildren(game) do
    GetGlobal[v.ClassName] = v
end

GetGlobal.wait = task.wait
GetGlobal.spawn = task.spawn
GetGlobal.Player = Players.LocalPlayer
GetGlobal.Kick = Player.Kick
GetGlobal.Error = ScriptContext.Error
GetGlobal.Idled = Player.Idled
GetGlobal.MessageOut = LogService.MessageOut
GetGlobal.Stepped = RunService.Stepped
GetGlobal.RenderStepped = RunService.RenderStepped
GetGlobal.Heartbeat = RunService.Heartbeat
GetGlobal.PreRender = RunService.PreRender
GetGlobal.PreSimulation = RunService.PreSimulation
GetGlobal.PostSimulation = RunService.PostSimulation
GetGlobal.Settings = {}
GetGlobal.Version = "v1"
GetGlobal.VG = {}
GetGlobal.IsVG = false
GetGlobal.Owner = "JLCs-SOFTWORKS-LLC"
GetGlobal.Helper = "Ninja-ST-lib2"
GetGlobal.User = Instance.new("VirtualInputManager")
GetGlobal.AFK = false
GetGlobal.Character = Player.Character or Player.CharacterAdded:Wait()
GetGlobal.Protecter = Instance.new("Model", CoreGui)
GetGlobal.GameId = game.GameId
GetGlobal.AllPlayers = {}
Protecter.RobloxLocked = true

-- Helper functions from vfHelper
local VG = {}
VG.Mag = function(Pos1, Pos2)
    return (Pos1.Position - Pos2.Position).Magnitude
end
VG.Teleport = function(Pos)
    Player.Character:PivotTo(CFrame.new(Pos))
end
VG.GetNearestPlayerToBasePart = function(BasePart)
    for i,v in next, Players:GetPlayers() do
        local Radius = gethiddenproperty(v, "SimulationRadius")
        if (v.Character:GetModelCFrame().Position - BasePart.Position).Magnitude > Radius and v ~= Player then
            return true
        else
            return false
        end
    end
    return false
end
VG.GetNearestXToBasePart = function(BasePart,T)
    local nearest = math.huge
    local nM = nil
    for i,v in next, T do
        if (v.Position - BasePart.Position).Magnitude < nearest then
            nearest = (v.Position - BasePart.Position).Magnitude
            nM = v
        end
    end
    return nM
end
VG.isnetworkowner = isnetworkowner or function(BasePart)
    if BasePart:IsA("BasePart") then
        local Radius = gethiddenproperty(Player, "SimulationRadius")
        if (BasePart:IsDescendantOf(Player.Character) or VG.Mag(Player.Character:GetModelCFrame(), BasePart) <= Radius) and not VG.GetNearestPlayerToBasePart(BasePart) then
            return true
        else
            return false
        end
    end
    return false
end
VG.FireConnection = function(Signal)
    if not getconnections then
        error("No getconnections detected sorry")
    else
        for i,v in next, getconnections(Signal) do
            v:Fire()
        end
    end
end
VG.DisableConnection = function(Signal)
    if not getconnections then
        error("No getconnections Detected wth")
    else
        for i,v in next, getconnections(Signal) do
            v:Disable()
        end
    end
end
local VG_TweenProxy = Instance.new("Part")
VG_TweenProxy.Size = Vector3.new(0,0,0.001)
VG_TweenProxy.Anchored = true
VG_TweenProxy.CanCollide = false
VG_TweenProxy.CanTouch = false
VG_TweenProxy.Transparency = 1
VG_TweenProxy.Name = "(❁´◡`❁)☆*: .｡. o(≧▽≦)o .｡.:*☆"
VG.Tween = function(Object1, Object2, Speed, Offset, Wait)
    if Object1 and Object2 then
        VG_TweenProxy.CFrame = Object1.CFrame
        local Timing = VG.Mag(Object1, Object2) / Speed
        local TweenInfo = TweenInfo.new(Timing, Enum.EasingStyle.Linear)
        local TweenSystem = TweenService:Create(VG_TweenProxy, TweenInfo, {CFrame = CFrame.new(Object2.Position + Offset)})
        TweenSystem:Play()
        if Wait then
            local conn
            conn = RunService.Stepped:Connect(function()
                Object1.CFrame = VG_TweenProxy.CFrame
            end)
            TweenSystem.Completed:Wait()
            Object1.CFrame = VG_TweenProxy.CFrame
            conn:Disconnect()
        end
    end
end
VG.ServerHop = function()
    spawn(function()
        while wait() do
            pcall(function()
                local Gay = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                for i,v in next, Gay.data do
                    if v.playing < v.maxPlayers then
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id)
                        break
                    end
                end
            end)
            wait(4)
        end
    end)
end
VG.CheckChests = function(chestParent)
    chestParent = chestParent or workspace
    local chests = {}
    for _, v in next, chestParent:GetDescendants() do
        if v:IsA("BasePart") and v.Name:lower():find("chest") then
            table.insert(chests, v)
        elseif v:IsA("Model") and v.Name:lower():find("chest") then
            table.insert(chests, v)
        end
    end
    if #chests == 0 then
        VG.SendNotification(
            "Chests",
            "No chests remaining in this area!",
            "rbxassetid://6023426926",
            5
        )
        return false, {}
    end
    return true, chests
end
VG.Rejoin = function()
    return TeleportService:Teleport(game.PlaceId, Player)
end
VG.NoClip = function()
    for i,v in next, Player.Character:GetChildren() do
        if v:IsA("BasePart") then
            v.CanCollide = false
            v.Velocity = Vector3.new(0,0,0)
        end
    end
end
VG.GetTool = function(Name)
    if Player.Backpack:FindFirstChild(Name) then
        Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild(Name))
    end
end
VG.FFD = function(Parent, Instance)
    return Parent:FindFirstChild(Instance, true)
end
VG.FFC = function(Parent, Instance)
    return Parent:FindFirstChild(Instance)
end
VG.Wait = function(Parent, Instance)
    return Parent:WaitForChild(Instance)
end
VG.KeyPress = function(PressDown, Key, Repeated, Instance, TimesPressed)
    if User then
        User:SendKeyEvent(PressDown, Key, Repeated, Instance, TimesPressed)
    end
end
VG.GetProtecter = function()
    return Protecter
end
VG.Protect = function(Gui)
    if type(Gui) == "userdata" then
        if sethiddenproperty then
            sethiddenproperty(Gui, "RobloxLocked", true)
        elseif not sethiddenproperty then
            Gui.RobloxLocked = true
        end
    end
    Gui.Parent = VG.GetProtecter()
end
VG.GetPos = function(Instance)
    if Instance then
        if Instance:IsA("BasePart") then
            return Instance.Position
        elseif Instance:IsA("Model") then
            return Instance:GetModelCFrame().Position
        end
    end
end
VG.PlayersTable = function()
    local Ta = {}
    for i,v in next, Players:GetPlayers() do
        if not table.find(Ta, v.Name) and v ~= Player then
            table.insert(Ta, v.Name)
        end
    end
    return Ta
end
VG.GetHumanoid = function()
    return Player.Character:FindFirstChildWhichIsA("Humanoid")
end
VG.GetRoot = function()
    return Player.Character.PrimaryPart
end
VG.IsA = function(Parent, Instance)
    return Parent:FindFirstChildWhichIsA(Instance, true)
end
VG.SendNotification = function(Title, Text, Icon, Duration)
    return StarterGui:SetCore("SendNotification", {Title = Title, Text = Text, Icon = Icon, Duration = Duration})
end
VG.GetScreenPosition = function(Model)
    if Model and Model.PrimaryPart then
        local ScreenPosition, OnScreen = CurrentCamera():WorldToViewportPoint(Model.PrimaryPart.Position)
        if OnScreen then
            return Vector2.new(ScreenPosition.X, ScreenPosition.Y)
        end
    end
    return Vector2.new(0,0)
end
VG.GetHealth = function(Model)
    local Humanoid = VG.IsA(Model, "Humanoid")
    if Humanoid then
        return Humanoid.Health
    end
    return 100
end
VG.GetPlayerFromCharacter = function(Model)
    return Players:GetPlayerFromCharacter(Model)
end
VG.GetTeam = function()
    return Player and Player.Team
end
VG.GetCharacter = function()
    return Player and Player.Character
end
VG.GetTeamColor = function()
    return Player and Player.TeamColor 
end
VG.IDC = function(Part, Parent)
    if Part and Part:IsDescendantOf(Parent) then
        return true
    end
    return false
end
VG.DoNothing = function()
    return {}
end
VG.WalkSpeed = function(Speed)
    VG.GetHumanoid().WalkSpeed = Speed
end
VG.SemiBypassedWalkSpeed = function(Speed)
    VG.DisableConnection(VG.GetHumanoid().Changed)
    sethiddenproperty(VG.GetHumanoid(), "WalkSpeed", Speed)
end
VG.BypassedWalkSpeed = function(Speed)
    local OldNameCall = nil
    OldNameCall = hookmetamethod(game, "__index", function(A, B, C)
        if A and B == "WalkSpeed" then
            return Speed
        end
        return OldNameCall(A, B, C)
    end)
    VG.GetHumanoid().WalkSpeed = Speed
end
VG.SuperBypassedWalkSpeed = function(Speed)
    VG.DisableConnection(VG.GetHumanoid().Changed)
    local OldNameCall = nil
    OldNameCall = hookmetamethod(game, "__index", function(A, B, C)
        if A and B == "WalkSpeed" then
            return Speed
        end
        return OldNameCall(A, B, C)
    end)
    sethiddenproperty(VG.GetHumanoid(), "WalkSpeed", Speed)
end
VG.Adonis = function()
    for i,v in next, getgc(true) do
        if type(v) == "table" then
            local Raw = rawget(v, "Detected")
            if Raw and typeof(Raw) == "function" and getfenv(Raw).script then
                return true
            end
        end
    end
    return false
end
VG.AntiAdonis = function()
    if VG.Adonis() then
        local NewInstances = {}
        for _,v in next, getgc(true) do
            if type(v) == "table" then
                local Raw, Raw2, Raw3 = rawget(v, "Detected"), rawget(v, "Kill"), rawget(v, "Disconnect")
                if Raw and Raw2 and Raw3 and typeof(Raw) == "function" and getfenv(Raw).script then
                    for _,v in next, v do
                        if type(v) == "function" then
                            table.insert(NewInstances, v)
                        end
                    end
                end
            end
        end
        setthreadidentity(2)
        for _,v in next, NewInstances do
            hookfunction(v, coroutine.yield())
            hookfunction(v, VG.DoNothing())
            ScriptContext.SetTimeout(0)
        end
        setthreadidentity(8)
    end
    return {{{{{{}}}}}}
end
VG.RigCheck = function()
    return VG.GetHumanoid().RigType
end
-- Player tracking loop
for i,v in next, Players:GetPlayers() do
    if v ~= Player then
        table.insert(AllPlayers, v.Name)
    end
end

Players.PlayerAdded:Connect(function(v)
    if v ~= Player then
        table.insert(AllPlayers, v.Name)
    end
end)

Players.PlayerRemoving:Connect(function(v)
    if v ~= Player then 
        local String = table.find(AllPlayers, v.Name)
        table.remove(AllPlayers, String)
    end
end)

RenderStepped:Connect(function()
    VG.GetProtecter().Name = HttpService:GenerateGUID()
end)

local module = {}
getgenv().active = true
-- Configuration
module.blockedRemote = {
    [game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommE")] = true,
    ["CommE"] = true
}
-- Data lists (exposed for UI to use)
module.meleeNames = { "Combat", "Black Leg", "Electro", "Fishman Karate", "Dragon Claw", "Superhuman", "Death Step", "Sharkman Karate", "Electric Claw", "Dragon Talon", "Godhuman", "Sanguine Art", "Divine Art" }
module.swordNames = { "Dark Blade", "Triple Katana", "Shark Saw", "Katana", "Iron Mace", "Bisento", "Saber", "Dual Katana", "Cutlass", "Wardens Sword", "Pipe", "Dual-Headed Blade", "Soul Cane", "Trident", "Pole (1st Form)", "Gravity Blade", "Shizu", "Longsword", "Saishi", "Oroshi", "True Triple Katana", "Flail", "Koko", "Midnight Blade", "Rengoku", "Dragon Trident", "Pole (2nd Form)", "Canvander", "Yama", "Tushita", "Twin Hooks", "Dark Dagger", "Hallow Scythe", "Buddy Sword", "Spikey Trident", "Cursed Dual Katana", "Shark Anchor", "Fox Lamp", "Triple Dark Blade", "Fishing Trophy", "Dragonheart" }
module.FruitsNames = { "Quake-Quake", "Magma-Magma", "Light-Light", "Ice-Ice", "Buddha-Buddha", "Flame-Flame", "Dark-Dark", "Rubber-Rubber", "Bomb-Bomb", "Spike-Spike", "Meme-Meme", "Chop-Chop", "Blade-Blade", "Smoke-Smoke", "Phoenix-Phoenix", "Spring-Spring", "Spider-Spider", "Sand-Sand", "Gravity-Gravity", "Pain-Pain", "Barrier-Barrier", "Dough-Dough", "Control-Control", "Dragon-Dragon", "Dragon (Classic)-Dragon (Classic)", "Venom-Venom", "Spin-Spin", "Door-Door", "Portal-Portal", "Rocket-Rocket", "Kilo-Kilo", "Diamond-Diamond", "Love-Love", "Falcon-Falcon", "Revive-Revive", "Ghost-Ghost", "Shadow-Shadow", "Soul-Soul", "Spirit-Spirit", "Yeti-Yeti", "Fiend (Yeti)-Fiend (Yeti)", "Tiger-Tiger", "Mammoth-Mammoth", "Sound-Sound", "Kitsune-Kitsune", "Empyrean (Kitsune)-Empyrean (Kitsune)", "T-Rex-T-Rex", "Gas-Gas", "Eagle-Eagle" }
module.guns = { "Slingshot", "Refined Slingshot", "Dual Flintlock", "Musket", "Flintlock", "Cannon", "Magma Blaster", "Bazooka", "Acidum Rifle", "Kabucha", "Bizarre Revolver", "Venom Bow", "Skull Guitar", "Dragonstorm" }
local lookup = {
-- accessing the module's directory of items to find types
    ["melee"] = module.meleeNames,
    ["sword"] = module.swordNames,
    ["fruit"] = module.FruitsNames,
    ["Gun"] = module.guns,
}
function module.playerHas(itemType, itemName)
    local backpack = game:GetService("Players").LocalPlayer.Backpack
    local character = game:GetService("Players").LocalPlayer.Character

    local function hasItem(name, type_)
        
        local function anytt(t)
            local charItems = character:GetChildren()
            local bpItems = backpack:GetChildren()
            
            -- Safely merge bpItems into charItems in place
            table.move(bpItems, 1, #bpItems, #charItems + 1, charItems)
            
            for i, v in ipairs(charItems) do
                if lookup[type_:lower()] then
                    for _, validName in ipairs(lookup[type_:lower()]) do
                        if v.Name == validName then
                            return v
                        end
                    end
                end
            end
        end
        
        return (name and (character:FindFirstChild(name) or backpack:FindFirstChild(name))) or (type_ and anytt(type_))
    end

    return hasItem(itemName, itemType)
end
local original
original = hookmetamethod(game, "__namecall", function(remote, ...)
    if getgenv().blockBadnamecall then
        return getgenv().blockBadnamecall(remote, ...)
    end
    return original(remote, ...)
end)
function module.blockBADremotes(list, value)
    getgenv().blockbad = value or false
    
    if not list then 
        list = module.blockedRemote 
    end
    
    getgenv().blockBadnamecall = function(remote, ...)
        if typeof(remote) == "Instance" then
            local methodName = getnamecallmethod()
            
            if methodName == "FireServer" or methodName == "InvokeServer" or methodName == "fireServer" or methodName == "invokeServer" then
                local validInstance, remoteName = pcall(function() return remote.Name end)
                
                if getgenv().blockbad and validInstance and (list[remote] or list[remoteName]) then
                    return nil 
                end
            end
        end
        
        return original(remote, ...)
    end
    
    return getgenv().blockbad  -- Return current state for UI feedback
end
-- Dynamic remote management (useful for UI toggles)
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
-- Sea detection
function module.getSea()
    local RunService = game:GetService("RunService")
    local Net = require(game.ReplicatedStorage.Modules.Net)
    
    local getHasTag = Net:RemoteFunction("GetRealmHasTag")
    local getDifficulty = Net:RemoteFunction("GetRealmDifficulty")
    
    -- Safety checks for UI loading order
    if not getHasTag or not getDifficulty then
        return "1"  -- Default fallback
    end

    local function hasTag(tag)
        if RunService:IsServer() then
            return require(game.ServerStorage.Realms).getCurrentRealm():HasTag(tag)
        end
        local result = getHasTag:InvokeServer(tag)
        return result == true
    end

    if hasTag("IsThirdSea") then
        return "3"
    elseif hasTag("IsSecondSea") then
        return "2"
    elseif hasTag("IsFirstSea") then
        return "1"
    else
        local difficulty = getDifficulty:InvokeServer()
        if difficulty >= 3 then
            return "3"
        elseif difficulty == 2 then
            return "2"
        else
            return "1"
        end
    end
end
-- M1 Attack function
function module.m1Attack(targetPart, equipIfnot)
    if not targetPart then 
        warn("m1Attack: No target part provided")
        return false 
    end
    
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    local Util = require(game:GetService("ReplicatedStorage"):WaitForChild("Util"))
    
    local item = module.playerHas("Melee") or module.playerHas("Sword")
    if not item then
        warn("m1Attack: No melee or sword found")
        return false
    end
    
    if equipIfnot then
        local tool = LocalPlayer.Backpack:FindFirstChild(item)
        if tool then
            Character.Humanoid:EquipTool(tool)
        else
            warn("m1Attack: Item found but not in backpack:", item)
        end
    end
    
    local Net = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"))
    local RegisterAttack = Net:RemoteEvent("RegisterAttack")
    local RegisterHit = Net:RemoteEvent("RegisterHit", true)
    
    RegisterAttack:FireServer(0.5)
    Util.Sound:Play("SwordSwing", HumanoidRootPart)
    task.wait(0.15)
    RegisterHit:FireServer(targetPart, {})
    
    -- Visual feedback
    local highlight = Instance.new("Highlight")
    highlight.Parent = targetPart.Parent
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.5
    highlight.Adornee = targetPart.Parent
    task.delay(0.3, function()
        highlight:Destroy()
    end)

    print("Melee hit fired on", targetPart.Name)
    return true
end
local RenderStepped = game:GetService("RunService").RenderStepped
getgenv().steps = {}
RenderStepped:Connect(function()
    for i,v in pairs(getgenv().steps)do 
        pcall(v)
    end
end)
function module.addfunctoStep(i,v)
    getgenv().steps[i] = v
end
function module.extendHitbox(factor)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") then
            local h = Instance.New("Part")
            h.Size = Vector3.new(factor,factor,factor)
            h.Transparency = 1
            h.CanCollide = false
            h.Anchored =false
            h.CFrame = v.HumanoidRootPart.CFrame
            h.Name = "ExtendedHitbox_removeable"
            h.Parent = v
            local weld = Instance.new("WeldConstraint",h)
            weld.Part0 = v.HumanoidRootPart
            weld.Part1 = h
            do
                local params = OverlapParams.new()
                params.FilterType = Enum.RaycastFilterType.Exclude
                params.FilterDescendantsInstances = {h}
                params.RespectCanCollide = false
                local overlappingParts = workspace:GetPartsInPart(h, params)
                for i,v2 in pairs(overlappingParts) do
                    if Character:GetDescendants()[v2] then
                        local attak = module.playerHas("Melee") or module.playerHas("Sword")
                        if attak then
                            attak.Activated:Connect(function()
                                module.m1Attack(v2.LeftLowerArm, true)
                            end)
                        end
                    end
                end
            end
        end
    end
end
function module.shutdown()
    getgenv().active = false
end

-- Expose VG helper functions through module
module.VG = VG
--VG.AntiAdonis() -- detected easily, so we don't run this to prevent ban

return module