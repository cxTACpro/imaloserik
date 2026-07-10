local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = Players.LocalPlayer

-- Server age check
local serverAgeSeconds = workspace.DistributedGameTime
local serverAgeHours = serverAgeSeconds / 3600

if serverAgeHours < 4 then
    warn("⚠️ Server age is only " .. math.floor(serverAgeHours * 10) / 10 .. " hours. Recommend waiting for 4+ hrs server.")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Server Age",
        Text = "Server is only " .. math.floor(serverAgeHours * 10) / 10 .. "h old. Not yet 4hrs+!",
        Duration = 5
    })
end

-- Check if should hop: no Fist in backpack AND no ChestModels in workspace
local function shouldHop()
    local hasFist = false
    local backpack = localPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, item in backpack:GetChildren() do
            if item.Name:lower():find("fist") then
                hasFist = true
                break
            end
        end
    end

    local chestModels = workspace:FindFirstChild("ChestModels")
    local chestsEmpty = not chestModels or #chestModels:GetChildren() == 0

    return not hasFist and chestsEmpty
end

-- Server hop using __ServerBrowser
local function hopServer()
    local ServerBrowser = ReplicatedStorage:FindFirstChild("__ServerBrowser")
    if not ServerBrowser then
        ServerBrowser = ReplicatedStorage:WaitForChild("__ServerBrowser")
    end

    local success, newJobId = pcall(function()
        return ServerBrowser:InvokeServer("teleport", game.JobId)
    end)

    if success and newJobId then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, newJobId, localPlayer)
    else
        warn("Failed to get new JobId, using random hop...")
        pcall(function()
            local data = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
            local decoded = game:GetService("HttpService"):JSONDecode(data)
            for _, server in decoded.data do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, localPlayer)
                    break
                end
            end
        end)
    end
end

function getOwnedEnemies()
    local ownedEnemies = {}

    if not workspace or not workspace:FindFirstChild("Enemies") then
        return ownedEnemies
    end

    local function hasOwnedPart(enemy)
        for _, part in ipairs(enemy:GetChildren()) do
            if part:IsA("BasePart") and part.ReceiveAge == 0 then
                return true
            end
        end
        return false
    end

    for _, enemy in ipairs(workspace.Enemies:GetChildren()) do
        local humanoid = enemy:FindFirstChild("Humanoid")
        if humanoid and humanoid.Health > 0 and hasOwnedPart(enemy) then
            table.insert(ownedEnemies, {Model = enemy, Humanoid = humanoid, HRP = enemy:FindFirstChild("HumanoidRootPart")})
        end
    end

    return ownedEnemies
end

getgenv().tPlayer = game.Players.LocalPlayer
getgenv().tChar = getgenv().tPlayer.Character or workspace.Characters:FindFirstChild(getgenv().tPlayer.Name)

game:GetService("RunService").RenderStepped:Connect(function()
    local ownedEnemies = getOwnedEnemies()
    for _, Enemy in ipairs(ownedEnemies) do
        local model = Enemy.Model
        local humanoid = Enemy.Humanoid
        local hrp = Enemy.HRP
        local opas = hrp.Position.Y
        local tHrp = getgenv().tChar:FindFirstChild("HumanoidRootPart")
        if not tHrp then return end
        model:SetPrimaryPartCFrame(CFrame.new(tHrp.Position.X, opas, tHrp.Position.Z))
    end
end)

-- Periodic check for hop condition
spawn(function()
    while wait(30) do
        if shouldHop() then
            warn("🔄 No Fist and no ChestModels found - hopping server!")
            hopServer()
            break
        end
    end
end)
