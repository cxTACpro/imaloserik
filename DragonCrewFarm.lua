spawn(function()
    wait(2400)
    game.Players.LocalPlayer:Kick('Annie')
end)

if Config then
    return
end

repeat
    wait()
until game:IsLoaded()

getgenv().Config = getgenv().Config or {
    Main = {
        ['Fast Method'] = true,
        ['Item / Saber'] = true,
        ['Quest / Bartilo'] = true,
        ['Quest / Race V2'] = true,
        ['Quest / Race V3'] = true,
        ['Staying On 2ne Sea Until Got Rengoku'] = false,
        ['Misc / Automatically Hop For Rip Indra'] = true,
        ['Auto Farming Cake Prince If Max Level'] = {
            Enable = true,
            Until = 30000,
        },
        ['Auto Farming Bone If Max Level (After Cake Prince)'] = {Enable = true},
        ['Misc / Hop To Another For 1m+ Fruit (Swan Quest)'] = false,
        ['Misc / Automatically Purchase Legendary Sword'] = true,
        ['Misc / Automatically Purchase Haki Color'] = true,
        ['Misc / Delay For Hopping'] = 15,
        ['Ingoring Eat Another Fruit If Current Fruit Is Awakened'] = true,
        ['Misc / Auto Farming Mastery For Sword (If Have No Task)'] = true,
        ['Misc / Hop'] = {
            Enable = true,
            Delay = 400,
        },
    },
    Fruit = {
        ['Misc / Fruit Sniping'] = {
            'Dough-Dough',
            'Venom-Venom',
            'Dragon-Dragom',
        },
        ['Misc / Fruit Looting'] = true,
        ['Misc / Fruit Looting'] = true,
        ["Misc / Auto Raid If Can't Store"] = true,
        ['Misc / Fragments Limit By Fruit Loot Raid'] = 30000,
        ['Eat While Cant Store'] = true,
    },
    Misc = {
        Webhook = {
            Url = 'https://discord.com/api/webhooks/1173059368447655996/V118UZx4nJ0bCfgKHzFfxtsPav8JT9IA18iPT9iv49CNvinGtqJqhvNOjm7jifHRsGbY',
            Enable = true,
            ['Webhook Setting'] = {
                ['Account Status'] = true,
                Delay = 300,
            },
        },
        ['White Screen'] = true,
        ['Fast Attack Delay'] = 0.1,
        ['Remove Terrain'] = false,
    },
}
gay = tick()

game:GetService('RunService').Heartbeat:Connect(function()
    sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)
    pcall(function()
        local v1, v2, v3 = pairs(game.workspace.Enemies:GetChildren())

        while true do
            local v4

            v3, v4 = v1(v2, v3)

            if v3 == nil then
                break
            end
            if v4.Humanoid.Health < 1 and not aD then
                v4:Destroy()
            end
        end
    end)
    pcall(function()
        if setfflag then
            setfflag('AbuseReportScreenshot', 'False')
            setfflag('AbuseReportScreenshotPercentage', '0')
        end
    end)
end)

ScreenGui = Instance.new('ScreenGui')
Frame = Instance.new('Frame')
UIStroke = Instance.new('UIStroke')
UIGradient = Instance.new('UIGradient')
UICorner = Instance.new('UICorner')
TextLabel = Instance.new('TextLabel')
UIGradient1 = Instance.new('UIGradient')
TextLabel1 = Instance.new('TextLabel')
UIGradient2 = Instance.new('UIGradient')
ImageLabel = Instance.new('ImageButton')
adiadi = true

ImageLabel.Activated:Connect(function()
    game:GetService('RunService'):Set3dRenderingEnabled(not adiadi)

    adiadi = not adiadi
end)

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService('CoreGui')
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.5
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.499250829, 0, 0.181700562, 0)
Frame.Size = UDim2.new(0, 511, 0, 76)
Frame.Parent = ScreenGui
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 1.5
UIStroke.Parent = Frame
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15.000000055879354, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(207.00000286102295, 62.00000010430813, 255)),
})
UIGradient.Parent = UIStroke
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Frame
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = 'Annie Hub One Click'
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0199637525, 0, 0.276315689, 0)
TextLabel.Size = UDim2.new(0, 489, 0, 11)
TextLabel.Parent = Frame
UIGradient1.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15.000000055879354, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(207.00000286102295, 62.00000010430813, 255)),
})
UIGradient1.Parent = TextLabel
TextLabel1.Font = Enum.Font.FredokaOne
TextLabel1.Text = '.........'
TextLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel1.TextSize = 20
TextLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel1.BackgroundTransparency = 1
TextLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel1.BorderSizePixel = 0
TextLabel1.Position = UDim2.new(0.0199637525, 0, 0.539473593, 0)
TextLabel1.Size = UDim2.new(0, 489, 0, 22)
TextLabel1.Parent = Frame
UIGradient2.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15.000000055879354, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(207.00000286102295, 62.00000010430813, 255)),
})
UIGradient2.Parent = TextLabel1
ImageLabel.Image = 'rbxassetid://15544019150'
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.448140889, 0, -0.473684222, 0)
ImageLabel.Size = UDim2.new(0, 50, 0, 50)
ImageLabel.Parent = Frame
script_time = os.time()

if not isfolder('.Annie/BloxFruit/Kaitun/') then
    makefolder('.Annie/BloxFruit/Kaitun/')
end

inv = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getInventory')

function randomChar()
    local v5 = math.random(1, 15)

    return ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#\u{20ab}_&-+()/*':;;!?\u{a3}~`\u{20ac}|$\u{2022}\u{a2}\u{221a}^\u{3c0}\u{b0}\u{f7}=\u{d7}{\u{a7}}\u{2206}%\u{a9}\u{ae}\u{2122}\u{2713}[]'"):sub(v5, v5)
end
function getServerTime()
    RealTime = tostring(math.floor(game.Lighting.ClockTime * 100) / 100)
    RealTime = tostring(game.Lighting.ClockTime)
    RealTimeTable = RealTime:split('.')

    local v6 = RealTimeTable[1]

    Second = tonumber(0 + tonumber(RealTimeTable[2] / 100)) * 60
    Minute = v6

    return math.floor(Minute) .. 'min'
end

local u7 = os.time()

if not isfile('.Annie/BloxFruit/Kaitun/eslapedtime.' .. game.Players.LocalPlayer.Name) then
    writefile('.Annie/BloxFruit/Kaitun/eslapedtime.' .. game.Players.LocalPlayer.Name, '0')

    esltime = 0
end

ctent2 = readfile('.Annie/BloxFruit/Kaitun/eslapedtime.' .. game.Players.LocalPlayer.Name)

function updatetime()
    if isfile('.Annie/BloxFruit/Kaitun/eslapedtime.' .. game.Players.LocalPlayer.Name) then
        ctent = readfile('.Annie/BloxFruit/Kaitun/eslapedtime.' .. game.Players.LocalPlayer.Name)

        if tonumber(ctent) or (ctent == '0' or ctent == '1') then
            esltime = tonumber(ctent2 or 0) + (os.time() - (u7 or os.time()))

            writefile('.Annie/BloxFruit/Kaitun/eslapedtime.' .. game.Players.LocalPlayer.Name, tostring(esltime))
            pcall(function()
                clockm:SetText(disp_time(esltime))
            end)
            pcall(function()
                TextLabel_7.Text = getServerTime()
            end)
        else
            noti('Something Wrong With Config, Automatically Generate A New One')

            esltime = '0'

            writefile('.Annie/BloxFruit/Kaitun/eslapedtime.' .. game.Players.LocalPlayer.Name, '0')
        end
    else
        writefile('.Annie/BloxFruit/Kaitun/eslapedtime.' .. game.Players.LocalPlayer.Name, '0')

        esltime = 0
    end
end
function AYU_FINGERPRINT()
    if isfile('.ayu_fingerprint') then
        return readfile('.ayu_fingerpriny')
    end

    fingerprint = randomChar()

    savefile('.ayu_fingerprint', fingerprint)

    return fingerprint
end
function c()
    return getgenv().Config
end

tickcac = tick()

local _LocalPlayer = game.Players.LocalPlayer
local _Character = _LocalPlayer.Character

if not isfile('conmemaydi.txt') then
    writefile('conmemaydi.txt', '')
end

local u10 = require(game.ReplicatedStorage.Quests)
local _Notify = loadstring(game:HttpGet('https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua'))().Notify

timelol = os.time()
BoneMobs = {
    'Reborn Skeleton',
    'Living Zombie',
    'Demonic Soul',
    'Posessed Mummy',
}
EctoMob = {
    'Ship Deckhand',
    'Ship Engineer',
    'Ship Steward',
}
DoughBoss = {
    'Dough King',
    'Cake Prince',
}
MobsCakePrince = {
    'Cookie Crafter',
    'Cake Guard',
    'Baking Staff',
    'Head Baker',
}
backi = {
    'Human',
}
fruittier = {
    ['Bomb Fruit'] = 1,
    ['Spike Fruit'] = 0,
    ['Chop Fruit'] = 4,
    ['Spring Fruit'] = 3,
    ['Kilo Fruit'] = 2,
    ['Spin Fruit'] = 5,
    ['Falcon Fruit'] = 6,
    ['Smoke Fruit'] = 7,
    ['Flame Fruit'] = 9,
    ['Ice Fruit'] = 12,
    ['Sand Fruit'] = 10,
    ['Dark Fruit'] = 11,
    ['Revive Fruit'] = 8,
    ['Diamond Fruit'] = 8,
    ['Light Fruit'] = 12,
    ['Love Fruit'] = 11,
    ['Rubber Fruit'] = 8,
    ['Barrier Fruit'] = 6,
    ['Magma Fruit'] = 14,
    ['Quake Fruit'] = 13,
    ['Portal Fruit'] = 13,
    ['Human: Buddha Fruit'] = 15,
    ['Spider Fruit'] = 12,
    ['Phonex Fruit'] = 10,
    ['Rumble Fruit'] = 15,
    ['Paw Fruit'] = 7,
    ['Gravity Fruit'] = 1,
    ['Shadow Fruit'] = 14,
    ['Dough Fruit'] = 20,
    ['Venom Fruit'] = 19,
    ['Control Fruit'] = 11,
    ['Spirit Fruit'] = 18,
    ['Dragon Fruit'] = 19,
    ['Leopard Fruit'] = 25,
}
CocoaMobs = {
    'Cocoa Warrior',
    'Chocolate Bar Battler',
}
elite = {
    'Deandre',
    'Urban',
    'Diablo',
}
meleetable = {
    'DragonTalon',
    'Superhuman',
    'Godhuman',
    'ElectricClaw',
    'SharkmanKarate',
    'DeathStep',
    'BlackLeg',
    'FishmanKarate',
    'Electro',
    'DragonClaw',
}
meleetable2 = {
    'Dragon Talon',
    'Superhuman',
    'Godhuman',
    'Electric Claw',
    'Sharkman Karate',
    'Death Step',
    'Black Leg',
    'Fishman Karate',
    'Electro',
    'Dragon Claw',
}
meleetable3 = {}

local v12, v13, v14 = pairs(meleetable2)
local u15 = {
    'BartiloQuest',
    'Trainees',
    'MarineQuest',
    'CitizenQuest',
}

while true do
    local v16

    v14, v16 = v12(v13, v14)

    if v14 == nil then
        break
    end

    meleetable3[v16] = meleetable[v14]
end

meleetable4 = {}

local v17, v18, v19 = pairs(meleetable)

while true do
    local v20

    v19, v20 = v17(v18, v19)

    if v19 == nil then
        break
    end

    meleetable4[v20] = meleetable2[v19]
end

browhat = {
    ['Black Leg'] = 'BuyBlackLeg',
    ['Fishman Karate'] = 'BuyFishmanKarate',
    Electro = 'BuyElectro',
    ['Dragon Claw'] = function()
        dragonclawtrue = game.ReplicatedStorage.Remotes.CommF_:InvokeServer('BlackbeardReward', 'DragonClaw', '1') == 1

        game.ReplicatedStorage.Remotes.CommF_:InvokeServer('BlackbeardReward', 'DragonClaw', '2')

        return dragonclawtrue
    end,
    Superhuman = 'BuySuperhuman',
    ['Sharkman Karate'] = 'BuySharkmanKarate',
    ['Death Step'] = 'BuyDeathStep',
    ['Dragon Talon'] = 'BuyDragonTalon',
    Godhuman = 'BuyGodhuman',
    ['Electric Claw'] = 'BuyElectricClaw',
}

local u21 = {
    'Bomb-Bomb',
    'Spike-Spike',
    'Chop-Chop',
    'Spring-Spring',
    'Kilo-Kilo',
    'Spin-Spin',
    'Falcon-Falcon',
    'Smoke-Smoke',
    'Flame-Flame',
    'Ice-Ice',
    'Sand-Sand',
    'Dark-Dark',
    'Revive-Revive',
    'Diamond-Diamond',
    'Light-Light',
    'Love-Love',
    'Rubber-Rubber',
    'Barrier-Barrier',
    'Magma-Magma',
    'Portal-Portal',
    'Quake-Quake',
    'Human-Human: Buddha',
    'Spider-Spider',
    'Bird-Bird: Phoenix',
    'Rumble-Rumble',
    'Paw-Paw',
    'Gravity-Gravity',
    'Dough-Dough',
    'Shadow-Shadow',
    'Venom-Venom',
    'Control-Control',
    'Spirit-Spirit',
    'Dragon-Dragon',
    'Leopard-Leopard',
}

a3 = require(game.ReplicatedStorage:WaitForChild('GuideModule'))

function disp_time(p22)
    local v23 = tonumber(p22)

    return not v23 and '[err]' or math.floor(v23 / 86400) .. 'day, ' .. math.floor(math.fmod(v23, 86400) / 3600) .. 'hrs, ' .. math.floor(math.fmod(v23, 3600) / 60) .. 'min, ' .. math.floor(math.fmod(v23, 60)) .. 's'
end

if c().Misc['White Screen'] then
    game:GetService('RunService'):Set3dRenderingEnabled(0)
end

UserInputService = game:GetService('UserInputService')

function vcl(p24, p25)
    return not p24:FindFirstChild('Level') and (p25 or 0) or p24.Level.Value
end
function checkitem(p26)
    local v27 = game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(p26)
    local v28 = game.Players.LocalPlayer.Character:FindFirstChild(p26)

    if v27 and v27.Name == p26 then
        return {
            Mastery = vcl(v27, 0),
        }
    end
    if v28 and v28.Name == p26 then
        return {
            Mastery = vcl(v28, 0),
        }
    end

    local v29, v30, v31 = pairs(inv)

    while true do
        local v32

        v31, v32 = v29(v30, v31)

        if v31 == nil then
            break
        end
        if v32.Name == p26 then
            return v32
        end
    end

    return false
end
function checkitem2(p33)
    local v34 = game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(p33)
    local v35 = game.Players.LocalPlayer.Character:FindFirstChild(p33)

    return v34 and v34.Name == p33 and {
        Mastery = vcl(v34, 0),
    } or (v35 and v35.Name == p33 and {
        Mastery = vcl(v35, 0),
    } or false)
end
function NameMelee(p36)
    local v37 = next
    local v38, v39 = game:GetService('Players').LocalPlayer.Backpack:GetChildren()
    local v40 = p36 or false

    while true do
        local v41

        v39, v41 = v37(v38, v39)

        if v39 == nil then
            break
        end
        if v41:IsA('Tool') and v41.ToolTip == 'Melee' then
            if v40 then
                return v41
            else
                return v41.Name
            end
        end
    end

    local v42 = next
    local v43, v44 = game:GetService('Players').LocalPlayer.Character:GetChildren()

    while true do
        local v45

        v44, v45 = v42(v43, v44)

        if v44 == nil then
            break
        end
        if v45:IsA('Tool') and v45.ToolTip == 'Melee' then
            if v40 then
                return v45
            else
                return v45.Name
            end
        end
    end
end
function NameDf(p46)
    local v47 = next
    local v48, v49 = game:GetService('Players').LocalPlayer.Backpack:GetChildren()
    local v50 = p46 or false

    while true do
        local v51

        v49, v51 = v47(v48, v49)

        if v49 == nil then
            break
        end
        if v51:IsA('Tool') and v51.ToolTip == 'Blox Fruit' then
            if v50 then
                return v51
            else
                return v51.Name
            end
        end
    end

    local v52 = next
    local v53, v54 = game:GetService('Players').LocalPlayer.Character:GetChildren()

    while true do
        local v55

        v54, v55 = v52(v53, v54)

        if v54 == nil then
            break
        end
        if v55:IsA('Tool') and v55.ToolTip == 'Blox Fruit' then
            if v50 then
                return v55
            else
                return v55.Name
            end
        end
    end

    return 'Bomb-Bomb'
end
function checkm2(p56)
    if p56 == 'DragonClaw' then
        return game.ReplicatedStorage.Remotes.CommF_:InvokeServer('BlackbeardReward', p56, '1')
    else
        return game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buy' .. p56, true)
    end
end
function checkMelee(p57)
    return (game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buy' .. p57, true) == 1 or game.ReplicatedStorage.Remotes.CommF_:InvokeServer('BlackbeardReward', p57, '1') == 1) and true or NameMelee() == meleetable4[p57]
end

if c().Misc.Ui then
    local v58 = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
    local v59 = loadstring(game:HttpGet(v58 .. 'Library.lua'))()

    loadstring(game:HttpGet(v58 .. 'addons/ThemeManager.lua'))()
    loadstring(game:HttpGet(v58 .. 'addons/SaveManager.lua'))()

    local v60 = {
        Main = v59:CreateWindow({
            Title = 'Annie Community Free Scripts ' .. os.date('%d %B %Y'),
            Center = true,
            AutoShow = true,
            TabPadding = 8,
            MenuFadeTime = 0.2,
        }):AddTab('Con Me May Bel'),
    }
    local _Melee = v60.Main:AddRightTabbox('Main'):AddTab('Melee')
    local _Swords = v60.Main:AddRightTabbox('Main'):AddTab('Swords')
    local _LegendarySwords = v60.Main:AddRightTabbox('Main'):AddTab('Legendary Swords')
    local _Main = v60.Main:AddLeftTabbox('Main')
    local _Info = _Main:AddTab('Info')
    local _Kaitan = _Main:AddTab('Kaitan')

    lmlmlmlmkmlmlkk = v60.Main:AddLeftTabbox('GaysEx'):AddTab('Status')
    clockm = lmlmlmlmkmlmlkk:AddLabel('Still Updating...')
    waid1 = lmlmlmlmkmlmlkk:AddLabel('What Im I Doing?')
    waid2 = lmlmlmlmkmlmlkk:AddLabel('What Im I Doing 2 ?')
    mgstat = lmlmlmlmkmlmlkk:AddLabel('Mirage Status: Updating')
    fmstat = lmlmlmlmkmlmlkk:AddLabel('Full Moon Status: Updating')
    elitestt = lmlmlmlmkmlmlkk:AddLabel('Elite Spawn: Updating')
    dismcount = lmlmlmlmkmlmlkk:AddLabel('Dismention Count: Updating')

    local _UnlockQuest = v60.Main:AddLeftTabbox('Main'):AddTab('Unlock Quest')
    local _Guns = v60.Main:AddLeftTabbox('Main'):AddTab('Guns')

    _Info:AddLabel('Annie Community Kaitun Script')

    Time = _Info:AddLabel('ServerTime')

    function UpdateTime()
        local v69 = math.floor(workspace.DistributedGameTime + 0.5)
        local v70 = math.floor(v69 / 3600) % 24
        local v71 = math.floor(v69 / 60) % 60
        local v72 = math.floor(v69 / 1) % 60

        Time:SetText('Hour ' .. v70 .. ' Minute ' .. v71 .. ' Second ' .. v72)
    end
    function MoonTextureId()
        if Sea1 then
            return game:GetService('Lighting').FantasySky.MoonTextureId
        end
        if Sea2 then
            return game:GetService('Lighting').FantasySky.MoonTextureId
        end
        if Sea3 then
            return game:GetService('Lighting').Sky.MoonTextureId
        end
    end

    _Kaitan:AddToggle('KaitanF', {
        Text = 'Start Kaitan',
        Default = true,
    })
    Toggles.KaitanF:OnChanged(function(p73)
        getgenv().ForceStop = not p73
    end)

    Shisui = _LegendarySwords:AddLabel('[-] : Shisui Sword')
    Saddi = _LegendarySwords:AddLabel('[-] : Saddi Sword')
    Wando = _LegendarySwords:AddLabel('[-] : Wando Sword')

    _Kaitan:AddButton('Show Item', function()
        local v74 = require(game:GetService('Players').LocalPlayer.PlayerGui.Main.UIController.Inventory)
        local _getInventory = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getInventory')
        local v76 = {}
        local v77 = {
            'Mythical',
            'Legendary',
            'Rare',
            'Uncommon',
            'Common',
        }
        local u78 = {
            Common = Color3.fromRGB(179, 179, 179),
            Uncommon = Color3.fromRGB(92, 140, 211),
            Rare = Color3.fromRGB(140, 82, 255),
            Legendary = Color3.fromRGB(213, 43, 228),
            Mythical = Color3.fromRGB(238, 47, 50),
        }

        function GetRaity(p79)
            local v80, v81, v82 = pairs(u78)

            while true do
                local v83

                v82, v83 = v80(v81, v82)

                if v82 == nil then
                    break
                end
                if v83 == p79 then
                    return v82
                end
            end
        end

        local v84, v85, v86 = pairs(_getInventory)

        while true do
            local v87

            v86, v87 = v84(v85, v86)

            if v86 == nil then
                break
            end

            v76[v87.Name] = v87
        end

        local v88 = #getupvalue(v74.UpdateRender, 4)
        local v89 = 0
        local v90 = {}
        local v91 = {}

        while v89 < v88 do
            local v92 = 0

            while v92 < 25000 and v89 < v88 do
                game:GetService('Players').LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition = Vector2.new(0, v92)

                local v93, v94, v95 = pairs(game:GetService('Players').LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.Frame:GetChildren())

                while true do
                    local v96

                    v95, v96 = v93(v94, v95)

                    if v95 == nil then
                        break
                    end
                    if v96:IsA('Frame') and (not v91[v96.ItemName.Text] and v96.ItemName.Visible == true) then
                        local v97 = GetRaity(v96.Background.BackgroundColor3)

                        if v97 then
                            if not v90[v97] then
                                v90[v97] = {}
                            end

                            table.insert(v90[v97], v96:Clone())
                        end

                        v89 = v89 + 1
                        v91[v96.ItemName.Text] = true
                    end
                end

                v92 = v92 + 20
            end

            wait()
        end

        function GetXY(p98)
            return p98 * 100
        end

        local _UIListLayout = Instance.new('UIListLayout')

        _UIListLayout.FillDirection = Enum.FillDirection.Vertical
        _UIListLayout.SortOrder = 2
        _UIListLayout.Padding = UDim.new(0, 10)

        local _Frame = Instance.new('Frame', game.Players.LocalPlayer.PlayerGui.BubbleChat)

        _Frame.BackgroundTransparency = 1
        _Frame.Size = UDim2.new(0.5, 0, 1, 0)
        _UIListLayout.Parent = _Frame

        local _Frame2 = Instance.new('Frame', game.Players.LocalPlayer.PlayerGui.BubbleChat)

        _Frame2.BackgroundTransparency = 1
        _Frame2.Size = UDim2.new(0.5, 0, 1, 0)
        _Frame2.Position = UDim2.new(0.6, 0, 0, 0)
        _UIListLayout:Clone().Parent = _Frame2

        local v102, v103, v104 = pairs(v90)

        while true do
            local v105

            v104, v105 = v102(v103, v104)

            if v104 == nil then
                break
            end

            local _Frame3 = Instance.new('Frame', _Frame)

            _Frame3.BackgroundTransparency = 1
            _Frame3.Size = UDim2.new(1, 0, 0, 0)
            _Frame3.LayoutOrder = table.find(v77, v104)

            local _Frame4 = Instance.new('Frame', _Frame2)

            _Frame4.BackgroundTransparency = 1
            _Frame4.Size = UDim2.new(1, 0, 0, 0)
            _Frame4.LayoutOrder = table.find(v77, v104)

            local _UIGridLayout = Instance.new('UIGridLayout', _Frame3)

            _UIGridLayout.CellPadding = UDim2.new(0.005, 0, 0.005, 0)
            _UIGridLayout.CellSize = UDim2.new(0, 70, 0, 70)
            _UIGridLayout.FillDirectionMaxCells = 100
            _UIGridLayout.FillDirection = Enum.FillDirection.Horizontal
            _UIGridLayout:Clone().Parent = _Frame4

            local v109, v110, v111 = pairs(v105)

            while true do
                local v112

                v111, v112 = v109(v110, v111)

                if v111 == nil then
                    break
                end
                if v76[v112.ItemName.Text] and v76[v112.ItemName.Text].Mastery then
                    if v112.ItemLine2.Text ~= 'Accessory' then
                        local v113 = v112.ItemName:Clone()

                        v113.BackgroundTransparency = 1
                        v113.TextSize = 10
                        v113.TextXAlignment = 2
                        v113.TextYAlignment = 2
                        v113.ZIndex = 5
                        v113.Text = v76[v112.ItemName.Text].Mastery
                        v113.Size = UDim2.new(0.5, 0, 0.5, 0)
                        v113.Position = UDim2.new(0.5, 0, 0.5, 0)
                        v113.Parent = v112
                    end

                    v112.Parent = _Frame3
                elseif v112.ItemLine2.Text == 'Blox Fruit' then
                    v112.Parent = _Frame4
                end
            end

            _Frame3.AutomaticSize = 2
            _Frame4.AutomaticSize = 2
        end

        local v114 = {
            Superhuman = Vector2.new(3, 2),
            DeathStep = Vector2.new(4, 3),
            ElectricClaw = Vector2.new(2, 0),
            SharkmanKarate = Vector2.new(0, 0),
            DragonTalon = Vector2.new(1, 5),
        }
        local _Frame5 = Instance.new('Frame', _Frame)

        _Frame5.BackgroundTransparency = 1
        _Frame5.Size = UDim2.new(1, 0, 0, 0)
        _Frame5.LayoutOrder = table.find(v77, k)
        _Frame5.AutomaticSize = 2
        _Frame5.LayoutOrder = 100

        local _UIGridLayout2 = Instance.new('UIGridLayout', _Frame5)

        _UIGridLayout2.CellPadding = UDim2.new(0.005, 0, 0.005, 0)
        _UIGridLayout2.CellSize = UDim2.new(0, 70, 0, 70)
        _UIGridLayout2.FillDirectionMaxCells = 100
        _UIGridLayout2.FillDirection = Enum.FillDirection.Horizontal

        local v117, v118, v119 = pairs({
            'Superhuman',
            'ElectricClaw',
            'DragonTalon',
            'SharkmanKarate',
            'DeathStep',
            'GodHuman',
        })

        while true do
            local v120

            v119, v120 = v117(v118, v119)

            if v119 == nil then
                break
            end
            if v114[v120] and game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buy' .. v120, true) == 1 then
                local _ImageLabel = Instance.new('ImageLabel', _Frame5)

                _ImageLabel.Image = 'rbxassetid://9945562382'
                _ImageLabel.ImageRectSize = Vector2.new(100, 100)
                _ImageLabel.ImageRectOffset = v114[v120] * 100
            end
        end

        function formatNumber(p122)
            returstring(p122):reverse():gsub('%d%d%d', '%1,'):reverse():gsub('^,', '')
        end

        game:GetService('Players').LocalPlayer.PlayerGui.Main.Beli.Position = UDim2.new(0, 800, 0, 500)
        game:GetService('Players').LocalPlayer.PlayerGui.Main.Level.Position = UDim2.new(0, 800, 0, 550)

        local v123 = game:GetService('Players').LocalPlayer.PlayerGui.Main.Fragments:Clone()

        v123.Parent = game:GetService('Players').LocalPlayer.PlayerGui.BubbleChat
        v123.Position = UDim2.new(0, 800, 0.63, 0)
        v123.Text = '\u{fffd}' .. formatNumber(game.Players.LocalPlayer.Data.Fragments.Value)

        pcall(function()
            game:GetService('Players').LocalPlayer.PlayerGui.Main.MenuButton:Destroy()
        end)
        pcall(function()
            game:GetService('Players').LocalPlayer.PlayerGui.Main.HP:Destroy()
        end)
        pcall(function()
            game:GetService('Players').LocalPlayer.PlayerGui.Main.Energy:Destroy()
        end)

        local v124, v125, v126 = pairs(game:GetService('Players').LocalPlayer.PlayerGui.Main:GetChildren())

        while true do
            local v127

            v126, v127 = v124(v125, v126)

            if v126 == nil then
                break
            end
            if v127:IsA('ImageButton') then
                v127:Destroy()
            end
        end

        pcall(function()
            game:GetService('Players').LocalPlayer.PlayerGui.Main.Compass:Destroy()
        end)
    end)
    _Kaitan:AddButton('Rejoin Server', function()
        game:GetService('TeleportService'):Teleport(game.PlaceId, game:GetService('Players').localPlayer)
    end)
    _Kaitan:AddToggle('Condi', {
        Text = 'White Screen',
        Default = true,
    })
    Toggles.Condi:OnChanged(function(p128)
        if p128 then
            game:GetService('RunService'):Set3dRenderingEnabled(true)
        else
            game:GetService('RunService'):Set3dRenderingEnabled(false)
        end
    end)
    _Kaitan:AddToggle('Condi2', {
        Text = 'Chest Farm',
        Default = false,
    })
    Toggles.Condi2:OnChanged(function(p129)
        getgenv().Config.ChestFarm = p129
    end)

    PlayerName = _Info:AddLabel('Player Name: ' .. game.Players.LocalPlayer.Name)
    vclui = {}
    vclui.Superhuman = _Melee:AddLabel('[-] : Superhuman')
    vclui['Death Step'] = _Melee:AddLabel('[-] : Death Step')
    vclui['Sharkman Karate'] = _Melee:AddLabel('[-] : Sharkman Karate')
    vclui['Electric Claw'] = _Melee:AddLabel('[-] : Electric Claw')
    vclui['Dragon Talon'] = _Melee:AddLabel('[-] : Dragon Talon')
    vclui.Godhuman = _Melee:AddLabel('[-] : God Human')
    TrueTripleKatana = _Swords:AddLabel('[-] : True Triple Katana')
    Saber = _Swords:AddLabel('[-] : Saber')
    Rengoku = _Swords:AddLabel('[-] : Rengoku')
    MidnightBlade = _Swords:AddLabel('[-] : Midnight Blade')
    DragonTrident = _Swords:AddLabel('[-] : DragonTrident')
    Yama = _Swords:AddLabel('[-] : Yama')
    BuddySword = _Swords:AddLabel('[-] : Buddy Sword')
    Canvander = _Swords:AddLabel('[-] : Canvander')
    SpikeyTrident = _Swords:AddLabel('[-] : Spikey Trident')
    HallowScythe = _Swords:AddLabel('[-] : Hallow Scythe')
    DarkDagger = _Swords:AddLabel('[-] : Dark Dagger')
    Tushita = _Swords:AddLabel('[-] : Tushita')
    Kabucha = _Guns:AddLabel('[-] : Kabucha Gun')
    AcidumRifle = _Guns:AddLabel('[-] : Acidum Rifle')
    BizarreRifle = _Guns:AddLabel('[-] : Bizarre Rifle')
    BartiloQuest = _UnlockQuest:AddLabel('[-] : Bartilo Quest')
    DonSwanQuest = _UnlockQuest:AddLabel('[-] : Don Swan Quest')
    KillDonSwan = _UnlockQuest:AddLabel('[-] : Kill Don Swan')

    spawn(function()
        while wait(1) do
            pcall(function()
                if game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BartiloQuestProgress', 'Bartilo') == 3 then
                    BartiloQuest:SetText('[+] : Bartilo Quest')
                end
                if game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GetUnlockables').FlamingoAccess then
                    DonSwanQuest:SetText('[+] : Don Swan Quest')
                end
                if zqp == 1 then
                    KillDonSwan:SetText('[+] : Kill Don Swan')
                end
            end)

            local v130, v131, v132 = pairs(game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getInventory'))

            while true do
                local v133

                v132, v133 = v130(v131, v132)

                if v132 == nil then
                    break
                end
                if v133.Name == 'Saber' then
                    Saber:SetText('[+] : Saber')
                end
                if v133.Name == 'Rengoku' then
                    Rengoku:SetText('[+] : Rengoku')
                end
                if v133.Name == 'Midnight Blade' then
                    MidnightBlade:SetText('[+] : Midnight Blade')
                end
                if v133.Name == 'Dragon Trident' then
                    DragonTrident:SetText('[+] : Dragon Trident')
                end
                if v133.Name == 'Yama' then
                    Yama:SetText('[+] : Yama')
                end
                if v133.Name == 'Buddy Sword' then
                    BuddySword:SetText('[+] : Buddy Sword')
                end
                if v133.Name == 'Canvander' then
                    Canvander:SetText('[+] : Canvander')
                end
                if v133.Name == 'Spikey Trident' then
                    SpikeyTrident:SetText('[+] : Spikey Trident')
                end
                if v133.Name == 'Hallow Scythe' then
                    HallowScythe:SetText('[+] : Hallow Scythe')
                end
                if v133.Name == 'Dark Dagger' then
                    DarkDagger:SetText('[+] : Dark Dagger')
                end
                if v133.Name == 'Acidum Rifle' then
                    AcidumRifle:SetText('[+] : Acidum Rifle')
                end
                if v133.Name == 'Kabucha' then
                    Kabucha:SetText('[+] : Kabucha')
                end
                if v133.Name == 'Bizarre Rifle' then
                    BizarreRifle:SetText('[+] : Bizarre Rifle')
                end
                if v133.Name == 'Shisui' then
                    Shisui:SetText('[+] : Shisui')
                end
                if v133.Name == 'Saddi' then
                    Saddi:SetText('[+] : Saddi')
                end
                if v133.Name == 'Wando' then
                    Wando:SetText('[+] : Wando')
                end
                if v133.Name == 'True Triple Katana' then
                    TrueTripleKatana:SetText('[+] : True Triple Katana')
                end
            end
        end
    end)
end

fruitMap = {}
fruitprice = {}

local v134, v135, v136 = ipairs(u21)

while true do
    local v137

    v136, v137 = v134(v135, v136)

    if v136 == nil then
        break
    end

    local v138, v139, v140 = string.gmatch(v137, '[^-]+')
    local v141 = {}

    while true do
        v140 = v138(v139, v140)

        if v140 == nil then
            break
        end

        table.insert(v141, v140)
    end

    local v142 = table.concat(v141, '-')
    local v143 = v141[1] .. ' Fruit'

    fruitMap[v142] = v143
end

fruitMap[#fruitMap + 1] = 'Human-Human: Buddha'
fruitMap[#fruitMap + 1] = 'Bird-Bird: Phonex'
fruitprice = {}

local v144 = next
local _GetFruits, v146 = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GetFruits')

while true do
    local v147

    v146, v147 = v144(_GetFruits, v146)

    if v146 == nil then
        break
    end

    fruitprice[v147.Name] = v147.Price
end

function CheckMaterialCount(p148)
    local v149, v150, v151 = pairs(inv)

    while true do
        local v152

        v151, v152 = v149(v150, v151)

        if v151 == nil then
            break
        end
        if v152.Name == p148 then
            return v152.Count
        end
    end

    return 0
end
function luoiquanenskidxdxdxd()
    SkypieaPlayers = {}

    local v153, v154, v155 = pairs(game.Players:GetChildren())

    while true do
        local u156

        v155, u156 = v153(v154, v155)

        if v155 == nil then
            break
        end

        pcall(function()
            if u156.Name ~= game.Players.LocalPlayer.Name and (game.Workspace.Characters:FindFirstChild(u156.Name) and (u156:FindFirstChild('Data') and (u156.Data:FindFirstChild('Race') and u156.Data.Race.Value == 'Skypiea' and u156.Character:FindFirstChild('Humanoid')))) then
                table.insert(SkypieaPlayers, u156)
            end
        end)
    end

    return SkypieaPlayers
end
function get1mfruit()
    local v157, v158, v159 = pairs(inv)

    while true do
        local v160

        v159, v160 = v157(v158, v159)

        if v159 == nil then
            break
        end
        if v160.Type == 'Blox Fruit' and (v160.Rarity == 3 or string.find(v160.Name, 'Gravi')) then
            print('Get Fruit: ' .. v160.Name)

            return v160.Name
        end
    end

    return false
end
function getRaidFruit()
    local v161, v162, v163 = pairs(inv)

    while true do
        local v164

        v163, v164 = v161(v162, v163)

        if v163 == nil then
            break
        end

        print(v164.Type)

        if v164.Name and (v164.Type == 'Blox Fruit' and (v164.Rarity and (v164.Rarity == 0 or v164.Rarity == 1))) then
            print(v164.Name)

            raidfruit = v164.Name

            return v164.Name
        end
    end
end
function loadfruit(p165)
    if p165 then
        return game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('LoadFruit', p165)
    end
end

spawn(function()
    if c().Misc['Remove Terrain'] then
        local v166 = game
        local _Workspace = v166.Workspace
        local _Lighting = v166.Lighting
        local _Terrain = _Workspace.Terrain

        _Terrain.WaterWaveSize = 0
        _Terrain.WaterWaveSpeed = 0
        _Terrain.WaterReflectance = 1
        _Terrain.WaterTransparency = 1
        _Lighting.GlobalShadows = false
        _Lighting.FogEnd = 9000000000
        _Lighting.Brightness = 0

        local v170, v171, v172 = pairs(_Workspace._WorldOrigin:GetChildren())
        local v173 = true

        while true do
            local u174

            v172, u174 = v170(v171, v172)

            if v172 == nil then
                break
            end

            pcall(function()
                u174.Transparency = 1
            end)

            if u174:IsA('Part') or (u174:IsA('Union') or (u174:IsA('CornerWedgePart') or u174:IsA('TrussPart'))) then
                u174.Material = 'Plastic'
                u174.Reflectance = 0
            elseif u174:IsA('Decal') or u174:IsA('Texture') and v173 then
                u174.Transparency = 1
            elseif u174:IsA('ParticleEmitter') or u174:IsA('Trail') then
                u174.Lifetime = NumberRange.new(0)
            elseif u174:IsA('Explosion') then
                u174.BlastPressure = 1
                u174.BlastRadius = 1
            elseif u174:IsA('Fire') or (u174:IsA('SpotLight') or (u174:IsA('Smoke') or u174:IsA('Sparkles'))) then
                u174.Enabled = false
            elseif u174:IsA('MeshPart') then
                u174.Material = 'Plastic'
                u174.Reflectance = 0
                u174.TextureID = 1.0385902758728955e16
            end
        end

        local u175 = workspace.Map:GetDescendants()
        local v176, v177, v178 = pairs(workspace.Map:GetDescendants())

        while true do
            local u179, u180 = v176(v177, v178)

            if u179 == nil then
                break
            end

            v178 = u179

            pcall(function()
                TextLabel1.Text = 'Remove Terrain (' .. tostring(u179) .. '/' .. tostring(#u175) .. ') [' .. tostring(u180.Parent.Parent.Parent.Parent) .. '.' .. tostring(u180.Parent.Parent.Parent) .. '.' .. tostring(u180.Parent.Parent) .. '.' .. tostring(u180.Parent) .. '.' .. tostring(u180) .. ']'
            end)

            if u179 % 10000 == 0 then
                task.wait()
            end

            pcall(function()
                u180.Transparency = 1
            end)

            if u180:IsA('Part') or (u180:IsA('Union') or (u180:IsA('CornerWedgePart') or u180:IsA('TrussPart'))) then
                u180.Material = 'Plastic'
                u180.Reflectance = 0
            elseif u180:IsA('Decal') or u180:IsA('Texture') and v173 then
                u180.Transparency = 1
            elseif u180:IsA('ParticleEmitter') or u180:IsA('Trail') then
                u180.Lifetime = NumberRange.new(0)
            elseif u180:IsA('Explosion') then
                u180.BlastPressure = 1
                u180.BlastRadius = 1
            elseif u180:IsA('Fire') or (u180:IsA('SpotLight') or (u180:IsA('Smoke') or u180:IsA('Sparkles'))) then
                u180.Enabled = false
            elseif u180:IsA('MeshPart') then
                u180.Material = 'Plastic'
                u180.Reflectance = 0
                u180.TextureID = 1.0385902758728955e16
            end
        end

        local v181, v182, v183 = pairs(_Lighting:GetChildren())

        while true do
            local v184, v185 = v181(v182, v183)

            if v184 == nil then
                break
            end

            v183 = v184

            if v185:IsA('BlurEffect') or (v185:IsA('SunRaysEffect') or (v185:IsA('ColorCorrectionEffect') or (v185:IsA('BloomEffect') or v185:IsA('DepthOfFieldEffect')))) then
                v185.Enabled = false
            end
        end
    end
end)

while wait() and game.Players.LocalPlayer.Team == nil do
    if game:GetService('Players').LocalPlayer.PlayerGui.Main:FindFirstChild('ChooseTeam') then
        wait()

        if game:GetService('Players').LocalPlayer.PlayerGui:WaitForChild('Main').ChooseTeam.Visible == true then
            local v186, v187, v188 = pairs(getconnections(game:GetService('Players').LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated))

            while true do
                local v189

                v188, v189 = v186(v187, v188)

                if v188 == nil then
                    break
                end

                v189.Function()
            end
        end
        if game.Players.LocalPlayer.Team == nil then
            break
        end
    end
end

TextLabel1.Text = 'Items 2'

local u190 = {}

game:GetService('HttpService')

local u191 = '!Blacklist_Servers.json'

function SaveSettings2()
    local _HttpService = game:GetService('HttpService')

    if not isfolder('.Annie/utils/') then
        makefolder('.Annie/utils/')
    end

    writefile('.Annie/utils/' .. u191, _HttpService:JSONEncode(u190))
end
function ReadSetting2()
    local v194, v195 = pcall(function()
        local _HttpService2 = game:GetService('HttpService')

        Hub = game:GetService('HttpService')

        if not isfolder('.Annie/utils/') then
            makefolder('.Annie/utils/')
        end

        return _HttpService2:JSONDecode(readfile('.Annie/utils/' .. u191))
    end)

    if v194 then
        return v195
    end

    SaveSettings2()

    return ReadSetting2()
end

u190 = ReadSetting2()

function HopServer(p196)
    ticklon = tick()

    local u197 = p196 or 10

    repeat
        task.wait()
    until tick() - ticklon >= 2

    local function v204()
        noti('Server Hop', 5)

        for v198 = 1, 100 do
            if ChooseRegion == nil or ChooseRegion == '' then
                ChooseRegion = 'Singapore'
            else
                game:GetService('Players').LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text = ChooseRegion
            end

            local v199 = game:GetService('ReplicatedStorage').__ServerBrowser:InvokeServer(v198)
            local v200, v201, v202 = pairs(v199)

            while true do
                local v203

                v202, v203 = v200(v201, v202)

                if v202 == nil then
                    break
                end
                if v202 ~= game.JobId and v203.Count < u197 then
                    if not u190[v202] or tick() - u190[v202].Time > 600 then
                        u190[v202] = {
                            Time = tick(),
                        }

                        SaveSettings2()

                        if game:GetService('Players').LocalPlayer.PlayerGui.Main.InCombat.Visible then
                            noti('Wait For End InCombat', 15)

                            repeat
                                wait()
                            until not (game:GetService('Players').LocalPlayer and game:GetService('Players').LocalPlayer.PlayerGui.Main.InCombat.Visible)
                        end

                        game:GetService('ReplicatedStorage').__ServerBrowser:InvokeServer('teleport', v202)

                        return true
                    end
                    if tick() - u190[v202].Time > 3600 then
                        u190[v202] = nil
                    end
                end
            end
        end

        return false
    end

    if not getgenv().Loaded then
        local v205, v206, v207 = pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren())

        local function v209(p208)
            if p208.Name == 'ErrorPrompt' then
                if p208.Visible and p208.TitleFrame.ErrorTitle.Text == 'Teleport Failed' then
                    HopServer()

                    p208.Visible = false
                end

                p208:GetPropertyChangedSignal('Visible'):Connect(function()
                    if p208.Visible and p208.TitleFrame.ErrorTitle.Text == 'Teleport Failed' then
                        HopServer()

                        p208.Visible = false
                    end
                end)
            end
        end

        while true do
            local v210

            v207, v210 = v205(v206, v207)

            if v207 == nil then
                break
            end

            v209(v210)
        end

        game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(v209)

        getgenv().Loaded = true
    end

    while not v204() do
        wait()
    end

    SaveSettings2()
end
function getPlayerLevel()
    return _LocalPlayer.Data.Level.Value
end
function getPlayerBeli()
    return _LocalPlayer.Data.Beli.Value
end
function getPlayerFragments()
    return _LocalPlayer.Data.Fragments.Value
end
function getPlayerHealth()
    return math.floor(_Character.Humanoid.Heath)
end
function IsIslandRaid(p211)
    if game:GetService('Workspace')._WorldOrigin.Locations:FindFirstChild('Island ' .. p211) then
        min = 4500

        local v212, v213, v214 = pairs(game:GetService('Workspace')._WorldOrigin.Locations:GetChildren())

        while true do
            local v215

            v214, v215 = v212(v213, v214)

            if v214 == nil then
                break
            end
            if v215.Name == 'Island ' .. p211 and (v215.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min then
                min = (v215.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
        end

        local v216, v217, v218 = pairs(game:GetService('Workspace')._WorldOrigin.Locations:GetChildren())

        while true do
            local v219

            v218, v219 = v216(v217, v218)

            if v218 == nil then
                break
            end
            if v219.Name == 'Island ' .. p211 and (v219.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min then
                return v219
            end
        end
    end
end
function getNextIsland()
    TableIslandsRaid = {
        5,
        4,
        3,
        2,
        1,
    }

    local v220, v221, v222 = pairs(TableIslandsRaid)

    while true do
        local v223

        v222, v223 = v220(v221, v222)

        if v222 == nil then
            break
        end
        if IsIslandRaid(v223) and (IsIslandRaid(v223).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
            return IsIslandRaid(v223)
        end
    end
end
function checkIsHaveAllSkillsFruit()
    if game.Players.LocalPlayer.Data.DevilFruit.Value then
        if not game.Players.LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
            repeat
                wait()
                equip('Blox Fruit')
            until game.Players.LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value)
        end

        return (not game.Players.LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value):FindFirstChild('V') or game.Players.LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).V.Title.TextColor3 ~= Color3.fromRGB(114, 114, 114)) and (not game.Players.LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value):FindFirstChild('C') or game.Players.LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).C.Title.TextColor3 ~= Color3.fromRGB(114, 114, 114)) and true or false
    end
end
function CheckIsRaiding()
    checkraid1 = game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible
    checkraid2 = getNextIsland()

    if checkraid1 then
        return checkraid1
    else
        return checkraid2
    end
end
function CheckDoubleQuest()
    local v224, v225, v226 = pairs(u10)
    local v227 = {}

    while true do
        local v228

        v226, v228 = v224(v225, v226)

        if v226 == nil then
            break
        end

        local v229, v230, v231 = pairs(v228)

        while true do
            local v232

            v231, v232 = v229(v230, v231)

            if v231 == nil then
                break
            end

            local _ = v232.LevelReq
            local v233, v234, v235 = pairs(v232.Task)

            while true do
                local v236

                v235, v236 = v233(v234, v235)

                if v235 == nil then
                    break
                end
                if v235 == Mob1 then
                    local v237 = next
                    local v238 = v228
                    local v239 = nil

                    while true do
                        local v240

                        v239, v240 = v237(v228, v239)

                        if v239 == nil then
                            break
                        end
                        if v240.LevelReq <= game.Players.LocalPlayer.Data.Level.Value and v240.Name ~= 'Town Raid' then
                            local v241 = next
                            local _Task = v240.Task
                            local v243 = nil

                            while true do
                                local v244

                                v243, v244 = v241(_Task, v243)

                                if v243 == nil then
                                    break
                                end
                                if v244 > 1 then
                                    table.insert(v227, v243)
                                end
                            end
                        end
                    end

                    v228 = v238
                end
            end
        end
    end

    return v227
end

local u245 = require(game.ReplicatedStorage:WaitForChild('GuideModule'))

function CheckQuestData()
    local v246 = next
    local _Data = u245.Data
    local v248 = nil

    while true do
        local v249

        v248, v249 = v246(_Data, v248)

        if v248 == nil then
            break
        end
        if v248 == 'QuestData' then
            return true
        end
    end

    return false
end
function CheckNameDoubleQuest()
    local v250 = nil

    if CheckQuestData() then
        local v251 = next
        local _Task2 = u245.Data.QuestData.Task
        local v253 = nil

        while true do
            local v254

            v253, v254 = v251(_Task2, v253)

            if v253 == nil then
                break
            end

            v250 = v253
        end
    end

    return v250
end
function CheckNameDoubleQuest2()
    local v255 = {}

    if CheckQuestData() then
        local v256 = next
        local _Task3 = u245.Data.QuestData.Task
        local v258 = nil

        while true do
            local v259

            v258, v259 = v256(_Task3, v258)

            if v258 == nil then
                break
            end

            table.insert(v255, v258)
        end
    end

    return v255
end
function CheckDoubleQuest2()
    checkq()

    local v260 = {}

    if game.Players.LocalPlayer.Data.Level.Value < 10 or (not CheckQuestData() or (CheckNameDoubleQuest() ~= Mob1 or #CheckNameDoubleQuest() <= 2)) then
        v260.Name = Mob1
        v260.NameQuest = Mob2
        v260.ID = Mob3

        return v260
    end

    local v261, v262, v263 = pairs(u10)

    while true do
        local v264

        v263, v264 = v261(v262, v263)

        if v263 == nil then
            break
        end

        local v265, v266, v267 = pairs(v264)
        local v268 = v263

        while true do
            local v269

            v267, v269 = v265(v266, v267)

            if v267 == nil then
                break
            end

            local v270, v271, v272 = pairs(v269.Task)

            while true do
                local v273

                v272, v273 = v270(v271, v272)

                if v272 == nil then
                    break
                end
                if tostring(v272) == Mob1 then
                    local v274 = next
                    local v275 = v264
                    local v276 = nil

                    while true do
                        local v277

                        v276, v277 = v274(v264, v276)

                        if v276 == nil then
                            break
                        end

                        local v278 = next
                        local _Task4 = v277.Task
                        local v280 = v276
                        local v281 = nil

                        while true do
                            local v282

                            v281, v282 = v278(_Task4, v281)

                            if v281 == nil then
                                break
                            end
                            if v281 ~= Mob1 and 1 < v282 then
                                if v277.LevelReq > game.Players.LocalPlayer.Data.Level.Value then
                                    v260.Name = Mob1
                                    v260.NameQuest = Mob2
                                    v260.ID = Mob3
                                else
                                    v260.Name = tostring(v281)
                                    v260.NameQuest = v268
                                    v260.ID = v280
                                end

                                return v260
                            end
                        end
                    end

                    v264 = v275
                end
            end
        end
    end

    v260.Name = Mob1
    v260.NameQuest = Mob2
    v260.ID = Mob3

    return v260
end
function moctui(p283)
    local _Wenlocktoad = game.ReplicatedStorage.Remotes.CommF_:InvokeServer('Wenlocktoad', '1')
    local _Alchemist = game.ReplicatedStorage.Remotes.CommF_:InvokeServer('Alchemist', '1')

    return game.Players.LocalPlayer.Character:FindFirstChild('RaceTransformed') and p283 == 4 and true or (_Wenlocktoad == -2 and p283 == 3 and true or (_Alchemist == -2 and p283 == 2 and true or p283 == 1))
end

pcall(function() end)

function getsortedmon()
    local _LocalPlayer2 = game.Players.LocalPlayer

    _LocalPlayer2.Character:WaitForChild('HumanoidRootPart')

    local v287 = workspace.Enemies:GetChildren()
    local v288, v289, v290 = pairs(v287)
    local v291 = {}

    while true do
        local v292

        v290, v292 = v288(v289, v290)

        if v290 == nil then
            break
        end
        if v292.Name ~= 'PirateBasic' and (v292.Name ~= 'PirateBrigade' and v292:FindFirstChild('HumanoidRootPart')) then
            table.insert(v291, v292)
        end
    end

    table.sort(v291, function(p293, p294)
        local v295 = _LocalPlayer2

        return _LocalPlayer2:DistanceFromCharacter(p293.HumanoidRootPart.Position) < v295:DistanceFromCharacter(p294.HumanoidRootPart.Position)
    end)

    return v291
end
function whatismyrace()
    return game:GetService('Players').LocalPlayer.Data.Race.Value
end
function MobLevel1OrMobLevel2()
    local v296, v297, v298 = pairs(getsortedmon())
    local v299 = {}

    while true do
        local v300

        v298, v300 = v296(v297, v298)

        if v298 == nil then
            break
        end
        if not table.find(v299, v300.Name) and (v300:IsA('Model') and (v300.Name ~= 'PirateBasic' and (not string.find(v300.Name, 'Brigade') and (v300:FindFirstChild('Humanoid') and (v300.Humanoid.Health > 0 and v300:FindFirstChild('HumanoidRootPart')))))) then
            table.insert(v299, v300.Name)
        end
    end

    local v301, v302, v303 = pairs(v299)

    while true do
        local v304

        v303, v304 = v301(v302, v303)

        if v303 == nil then
            break
        end

        local v305 = tostring(v304:gsub(' %pLv. %d+%p', ''))

        if tostring(v305) == CheckNameDoubleQuest() then
            returstring(v304)
        end
    end

    return false
end

local _CommF_ = game.ReplicatedStorage.Remotes.CommF_

raidlist = {}

local v307, v308, v309 = pairs(require(game:GetService('ReplicatedStorage').Raids).advancedRaids)

while true do
    local v310

    v309, v310 = v307(v308, v309)

    if v309 == nil then
        break
    end

    table.insert(raidlist, v310)
end

local v311, v312, v313 = pairs(require(game:GetService('ReplicatedStorage').Raids).raids)

while true do
    local v314

    v313, v314 = v311(v312, v313)

    if v313 == nil then
        break
    end

    table.insert(raidlist, v314)
end

function getraidchip()
    local _Value = game.Players.LocalPlayer.Data.DevilFruit.Value
    local v316, v317, v318 = pairs(raidlist)

    while true do
        local v319

        v318, v319 = v316(v317, v318)

        if v318 == nil then
            break
        end
        if string.find(_Value, v319) then
            return v319
        end
    end

    return 'Dark'
end
function GetQuest()
    if game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild('Quest').Visible then
        return
    elseif QuestPoint[tostring(CheckDoubleQuest2().NameQuest)] then
        if (QuestPoint[CheckDoubleQuest2().NameQuest].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 8 then
            QuestCFrame = QuestPoint[CheckDoubleQuest2().NameQuest]

            to(QuestCFrame)
        else
            vc = CheckDoubleQuest2()

            _CommF_:InvokeServer('StartQuest', tostring(vc.NameQuest), vc.ID)

            MobDual2 = vc.Name
        end
    else
        CFrameQuest()
    end
end
function checkNotify(p320)
    local v321 = string.lower(p320)
    local v322, v323, v324 = pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetDescendants())

    while true do
        local v325

        v324, v325 = v322(v323, v324)

        if v324 == nil then
            break
        end
        if v325:IsA('TextLabel') and string.find(string.lower(v325.Text), v321) then
            return true
        end
    end
end

local u326 = 5
local u327 = 50
local u328 = 0

y = 45

function getKillVector3(p329)
    u328 = u328 + u327

    return p329 + Vector3.new(math.sin(math.rad(u328)) * u326, y, math.cos(math.rad(u328)) * u326)
end
function autopoint()
    return (getPlayerLevel() <= 500 or not CheckSea(1)) and (getPlayerLevel() <= 2100 and (getPlayerLevel() <= 1800 and 'Melee' or 'Blox Fruit') or 'Sword') or 'Defense'
end
function GetAndCheckMeleeMastery(p330, _)
    mm = p330
    usingmelee = browhat[NameMelee()]
    momo = browhat[mm]

    if type(momo) ~= 'string' then
        momo = momo()
    else
        momo = game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo, true) == 1
    end
    if momo then
        if not (game.Players.LocalPlayer.Character:FindFirstChild(mm) or game.Players.LocalPlayer.Backpack:FindFirstChild(mm)) then
            momo = browhat[mm]

            if type(momo) ~= 'string' then
                momo = momo()
            else
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo, true)

                momo = game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo)
            end
        end
        if game.Players.LocalPlayer.Character:FindFirstChild(mm) or game.Players.LocalPlayer.Backpack:FindFirstChild(mm) then
            kwekrwe = {
                game.Players.LocalPlayer.Character,
                game.Players.LocalPlayer.Backpack,
            }

            local v331, v332, v333 = pairs(kwekrwe)

            while true do
                local v334

                v333, v334 = v331(v332, v333)

                if v333 == nil then
                    break
                end
                if v334:FindFirstChild(mm) then
                    return v334[mm].Level.Value
                end
            end
        end
    end

    return 0
end
function sh()
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer('Wenlocktoad', '1') == 0 then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer('Wenlocktoad', '2')
    end
end
function getMeleeMastery()
    local u335 = NameMelee(true)

    if u335 and (u335:FindFirstChild('Level') and meleetable3[u335.Name]) then
        pcall(function()
            vclui[u335.Name] = '[+] : ' .. u335.Name
        end)

        eltrul[u335.Name] = u335.Level.Value
    end
end
function getFruitTier(p336)
    spawn(function()
        print(': ' .. p336 .. ' tier: ' .. tostring(fruittier[p336] or (fruittier[fruitMap[p336] ] or 0)))
    end)

    return fruittier[p336] or fruittier[fruitMap[p336] ]
end
function buyMelee(p337)
    if table.find(meleetable, p337) then
        pcall(function()
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer('BlackbeardReward', p337, '2')
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buy' .. p337)
        end)
    end
end
function getMobLoadPos(p338)
    local v339, v340, v341 = pairs(game:GetService('Workspace')._WorldOrigin.EnemySpawns:GetChildren())

    while true do
        local v342

        v341, v342 = v339(v340, v341)

        if v341 == nil then
            break
        end
        if v342.Name == p338 then
            return v342.CFrame
        end
    end

    local v343, v344, v345 = pairs(getnilinstances())

    while true do
        local v346

        v345, v346 = v343(v344, v345)

        if v345 == nil then
            break
        end
        if v346.Name and string.find(v346.Name, p338) then
            return v346.CFrame or v346.HumanoidRootPart.CFrame
        end
    end

    local v347, v348, v349 = pairs(game.Workspace.Enemies:GetChildren())

    while true do
        local v350

        v349, v350 = v347(v348, v349)

        if v349 == nil then
            break
        end
        if skidymf(v350) and (v350.Name and string.find(v350.Name, p338)) then
            return v350.HumanoidRootPart.CFrame
        end
    end

    local v351, v352, v353 = pairs(game.ReplicatedStorage:GetChildren())

    while true do
        local v354

        v353, v354 = v351(v352, v353)

        if v353 == nil then
            break
        end
        if skidymf(v354) and (v354.Name and string.find(v354.Name, p338)) then
            return v354.HumanoidRootPart.CFrame or v354.CFrame
        end
    end
end
function checkq()
    local _Value2 = game.Players.LocalPlayer.Data.Level.Value
    local v356 = 0

    if 1450 <= _Value2 and game.PlaceId == 4442272183 then
        Mob1 = 'Water Fighter'
        Mob2 = 'ForgottenQuest'
        Mob3 = 2
    elseif 700 <= _Value2 and game.PlaceId == 2753915549 then
        Mob1 = 'Galley Captain'
        Mob2 = 'FountainQuest'
        Mob3 = 2
    elseif 1350 <= _Value2 and (not checkitem('Rengoku') and c().Main['Staying On 2ne Sea Until Got Rengoku']) then
        set1('Forcing Monster On Ice Castle For Rengoku')

        local v357 = math.random(1, 2)

        Mob2 = 'FrostQuest'

        if v357 == 1 then
            Mob1 = 'Snow Lurker'
            Mob3 = 2
        else
            Mob1 = 'Arctic Warrior'
            Mob3 = 1
        end
    elseif 2050 <= _Value2 and (checkm2('DragonTalon') ~= 1 and (not checkMelee('DragonTalon') and eltrul['Electric Claw'] > 399)) then
        Mob1 = 'Posessed Mummy'
        Mob2 = 'HauntedQuest2'
        Mob3 = 2
    else
        local v358, v359, v360 = pairs(u10)

        while true do
            local v361

            v360, v361 = v358(v359, v360)

            if v360 == nil then
                break
            end

            local v362, v363, v364 = pairs(v361)
            local v365 = v360

            while true do
                local v366

                v364, v366 = v362(v363, v364)

                if v364 == nil then
                    break
                end

                local _LevelReq = v366.LevelReq
                local v368, v369, v370 = pairs(v366.Task)
                local v371 = v364

                while true do
                    local v372

                    v370, v372 = v368(v369, v370)

                    if v370 == nil then
                        break
                    end
                    if _LevelReq <= _Value2 and (v356 <= _LevelReq and (v366.Task[v370] > 1 and not table.find(u15, tostring(v365)))) then
                        Mob1 = tostring(v370)
                        Mob2 = v365
                        Mob3 = v371
                        v356 = _LevelReq
                    end
                end
            end
        end
    end
end
function spamandwait(p373)
    taocanpasue = true

    local v374, v375, v376 = pairs(p373)

    while true do
        local v377

        v376, v377 = v374(v375, v376)

        if v376 == nil then
            break
        end

        down(v377)

        repeat
            wait(0.1)
        until not game.Players.LocalPlayer.Character.Busy.Value
    end

    taocanpasue = false
end
function stuff(p378)
    Buso()

    if p378 and (getPlayerLevel() > 2499 and (c().Main['Farm Fruit Mastery After Done Cdk Quest'] and (checkitem('Cursed Dual Katana') and (skidymf(p378) and (p378.Humanoid.Health / p378.Humanoid.MaxHealth * 100 < 65 and not checkIsHaveAllSkillsFruit()))))) then
        dmlockskill = monmon.HumanoidRootPart.Position

        equip('Blox Fruit')
        spamandwait({
            'Z',
            'X',
            'C',
            'V',
            'F',
        })
    end

    dmlockskill = false

    equip(forcewp or 'Melee')
end
function Buso()
    if not game.Players.LocalPlayer.Character:FindFirstChild('HasBuso') then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer('Buso')
    end
end
function getmon(p379)
    return game.Workspace.Enemies:FindFirstChild(p379)
end
function throughcheck(p380, p381, p382)
    local v383, v384, v385 = pairs(p380)

    while true do
        local v386

        v385, v386 = v383(v384, v385)

        if v385 == nil then
            break
        end

        print(v385, v386)

        lmao = v385

        if p381 == 1 then
            lmao = V
        end

        print(lmao)

        if p382(lmao) then
            return p382(lmao)
        end
    end

    return false
end
function RedeemAllCodesX2()
    CodesX2 = {
        'Sub2CaptainMaui',
        'CODE_SERVICIO',
        'CINCODEMAYO_BOOST',
        '15B_BESTBROTHERS',
        'DEVSCOOKING',
        'GAMERROBOT_YT',
        'ADMINGIVEAWAY',
        'GAMER_ROBOT_1M',
        'TY_FOR_WATCHING',
        'kittgaming',
        'Sub2Fer999',
        'Enyu_is_Pro',
        'Magicbus',
        'JCWK',
        'Starcodeheo',
        'Bluxxy',
        'fudd10_v2',
        'FUDD10',
        'BIGNEWS',
        'THEGREATACE',
        'SUB2GAMERROBOT_EXP1',
        'Sub2OfficialNoobie',
        'StrawHatMaine',
        'SUB2NOOBMASTER123',
        'Sub2Daigrock',
        'Axiore',
        'TantaiGaming',
    }

    local v387, v388, v389 = pairs(CodesX2)

    while true do
        local v390

        v389, v390 = v387(v388, v389)

        if v389 == nil then
            break
        end

        game:GetService('ReplicatedStorage').Remotes.Redeem:InvokeServer(v390)
    end
end
function CheckQuestBoss(p391)
    local v392

    if string.find(p391, ' %pRaid Boss%p') then
        local v393 = string.gsub(p391, '%pLv. %d+%p', '')

        v392 = string.gsub(v393, '  %pRaid Boss%p', '')
    else
        local v394 = string.gsub(p391, '%pLv. %d+%p', '')

        v392 = string.gsub(v394, '  %pBoss%p', '')
    end

    local v395 = next
    local v396, v397 = require(game:GetService('ReplicatedStorage').Quests)

    while true do
        local v398

        v397, v398 = v395(v396, v397)

        if v397 == nil then
            break
        end

        local v399 = next
        local v400 = nil

        while true do
            local v401

            v400, v401 = v399(v398, v400)

            if v400 == nil then
                break
            end

            local v402 = next
            local _Task5 = v401.Task
            local v404 = nil

            while true do
                local v405

                v404, v405 = v402(_Task5, v404)

                if v404 == nil then
                    break
                end
                if v404 == v392 then
                    return v392
                end
            end
        end
    end
end
function GetInfoBossQuest(p406)
    returnrnrnr = {}

    local v407 = next
    local v408, v409 = require(game:GetService('ReplicatedStorage').Quests)

    while true do
        local v410

        v409, v410 = v407(v408, v409)

        if v409 == nil then
            break
        end

        local v411 = next
        local v412 = v409
        local v413 = nil

        while true do
            local v414

            v413, v414 = v411(v410, v413)

            if v413 == nil then
                break
            end
            if v414.LevelReq <= getPlayerLevel() and v414.Name == p406 then
                returnrnrnr.QuestName = v412
                returnrnrnr.QuestId = v413

                return returnrnrnr
            end
        end
    end
end
function CheckWaterKey()
    local _BuySharkmanKarate = game.ReplicatedStorage.Remotes.CommF_:InvokeServer('BuySharkmanKarate', true)

    if _BuySharkmanKarate ~= 3 and _BuySharkmanKarate ~= 1 then
        return false
    end

    WaterKey = true
    WaterKey = true

    return true
end
function getSpeficalBoss()
    return CheckBoss('Darkbeard') or CheckBoss('rip_indra True Form')
end

_LocalPlayer = game.Players.LocalPlayer

local u416 = {
    'Special Microchip',
    "God's Chalice",
    'Sweet Chalice',
    'Relic',
    'Key',
    'Torch',
    'Flower 1',
    'Flower 2',
    'Flower 3',
    'Hallow Essence',
    'Fire Essence',
    'Holy Torch',
    'Library Key',
    'Hidden Key',
    'Water Key',
}

rarity = {
    [0] = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}',
    [1] = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}',
    [2] = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}',
    [3] = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}',
    [4] = '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}',
    [5] = 'wtf',
}

function safe_cp(p417)
    return p417.Character:WaitForChild('HumanoidRootPart', 9)
end
function bypassreq()
    local v418, v419, v420 = pairs(u416)

    while true do
        local v421

        v420, v421 = v418(v419, v420)

        if v420 == nil then
            break
        end
        if game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(v421) or game:GetService('Players').LocalPlayer.Character:FindFirstChild(v421) then
            return false
        end
    end

    local v422, v423, v424 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

    while true do
        local v425

        v424, v425 = v422(v423, v424)

        if v424 == nil then
            break
        end
        if v425:FindFirstChild('EatRemote') then
            return false
        end
    end

    local v426, v427, v428 = pairs(game.Players.LocalPlayer.Character:GetChildren())

    while true do
        local v429

        v428, v429 = v426(v427, v428)

        if v428 == nil then
            break
        end
        if v429:FindFirstChild('EatRemote') then
            return false
        end
    end

    return true
end
function m0()
    local v430 = _LocalPlayer.PlayerGui.Main.InCombat.Visible and _LocalPlayer.PlayerGui.Main.InCombat.Text

    if v430 then
        v430 = string.find(string.lower(_LocalPlayer.PlayerGui.Main.InCombat.Text), 'risk')
    end

    return v430
end
function aw1()
    local v431 = _Character
    local v432, v433, v434 = pairs(v431:GetDescendants())

    while true do
        local v435

        v434, v435 = v432(v433, v434)

        if v434 == nil then
            break
        end
        if v435:IsA('BasePart') then
            v435.CanCollide = false
        end
    end

    if not _Character:FindFirstChild('eltrul') then
        local _BodyVelocity = Instance.new('BodyVelocity', _Character)

        _BodyVelocity.Name = 'eltrul'
        _BodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
        _BodyVelocity.Velocity = Vector3.new(0, 0, 0)
    end
end
function getPortal(p437)
    local _Position = p437.Position
    local _PlaceId = game.PlaceId

    if _PlaceId == 2753915549 then
        gQ = {
            Vector3.new(-7894.6201171875, 5545.49169921875, -380.246346191406),
            Vector3.new(-4607.82275390625, 872.5422973632813, -1667.556884765625),
            Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875),
        }
    elseif _PlaceId == 4442272183 then
        gQ = {
            Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320313),
            Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422),
        }
    elseif _PlaceId == 7449423635 then
        gQ = {
            Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            Vector3.new(5314.58203125, 25.419387817382813, -125.94227600097656),
        }
    end

    local v440 = Vector3.new(0, 0, 0)
    local _huge = math.huge
    local v442, v443, v444 = pairs(gQ)

    while true do
        local v445

        v444, v445 = v442(v443, v444)

        if v444 == nil then
            break
        end
        if (v445 - _Position).Magnitude < _huge and v440 ~= v445 then
            _huge = (v445 - _Position).Magnitude
            v440 = v445
        end
    end

    return v440
end
function grgrgrgrg(p446)
    repeat
        task.wait()

        _LocalPlayer.Character.HumanoidRootPart.CFrame = p446
    until _LocalPlayer.Character.PrimaryPart.CFrame == p446

    game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid', 9):ChangeState(15)
    _LocalPlayer.Character:SetPrimaryPartCFrame(p446)
    wait(0.1)
    _LocalPlayer.Character:WaitForChild('Head'):Destroy()

    repeat
        task.wait()
    until _LocalPlayer.Character:FindFirstChild('Humanoid').Health <= 0
    repeat
        task.wait()

        _LocalPlayer.Character.PrimaryPart.CFrame = p446
    until _LocalPlayer.Character:FindFirstChild('Head')
end
function getSpawn(p447)
    local _huge2 = math.huge
    local v449, v450, v451 = pairs(game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(_LocalPlayer.Team)):GetChildren())
    local v452 = nil

    while true do
        local v453

        v451, v453 = v449(v450, v451)

        if v451 == nil then
            break
        end
        if tostring(v453) ~= 'Leviathan' and (v453:GetModelCFrame().Position - p447.Position).Magnitude < _huge2 then
            v452 = v453:GetModelCFrame()
            _huge2 = (v453:GetModelCFrame().Position - p447.Position).Magnitude
        end
    end

    return v452
end
function request(p454)
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack({
        'requestEntrance',
        p454,
    }))
end
function q1(p455, p456)
    local v457 = p456 or game.Players.LocalPlayer.Character.PrimaryPart.CFrame

    return (Vector3.new(p455.X, 0, p455.Z) - Vector3.new(v457.X, 0, v457.Z)).Magnitude
end
function check11()
    local v458 = game:GetService('Players').LocalPlayer.PlayerGui.Main.InCombat.Visible and game:GetService('Players').LocalPlayer.PlayerGui.Main.InCombat.Text

    if v458 then
        v458 = string.find(string.lower(game:GetService('Players').LocalPlayer.PlayerGui.Main.InCombat.Text), 'risk')
    end

    return v458
end
function to(p459)
    if sexroblox then
        sexroblox:Cancel()
    end
    if olfdvg and q1(olfdvg, p459) > 1000 then
        return
    elseif p459 then
        vg2 = CFrame.new(p459.X, p459.Y, p459.Z)

        game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart', 9)
        game.Players.LocalPlayer.Character:WaitForChild('Head', 9)

        local v460, v461, v462 = pairs(game.Players.LocalPlayer.Character:GetDescendants())

        while true do
            local v463

            v462, v463 = v460(v461, v462)

            if v462 == nil then
                break
            end
            if v463:IsA('BasePart') then
                v463.CanCollide = false
            end
        end

        if not game.Players.LocalPlayer.Character.Head:FindFirstChild('eltrul') then
            local _BodyVelocity2 = Instance.new('BodyVelocity', game.Players.LocalPlayer.Character.Head)

            _BodyVelocity2.Name = 'eltrul'
            _BodyVelocity2.MaxForce = Vector3.new(0, math.huge, 0)
            _BodyVelocity2.Velocity = Vector3.new(0, 0, 0)
        end

        vg3 = getPortal(vg2)
        vg9 = getSpawn(vg2)

        for _ = 0, 3 do
            if getSpawn(vg2) ~= vg9 then
                return
            end
        end

        vg5 = game.Players.LocalPlayer.Character.HumanoidRootPart
        vg4 = vg5.CFrame
        vg7 = q1(vg4, vg2)

        if vg9 then
            vg10 = q1(vg9, vg2)

            if bypassreq() and (not check11() and (vg10 < vg7 and (vg7 > 3600 and (q1(vg4, vg9) > 500 and q1(vg3, vg2) + 1000 > vg10)))) then
                return grgrgrgrg(vg9)
            end
        end
        if vg7 <= q1(vg3, vg2) or vg7 <= 300 then
            if vg7 >= 10 then
                if q1(vg2) > 300 then
                    vg2 = vg2 + Vector3.new(0, 350, 0)
                end

                safe_cp(_LocalPlayer).CFrame = CFrame.new(vg4.X, vg2.Y, vg4.Z)
                vg6 = vg7 / 250
                sexroblox = game:GetService('TweenService'):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(vg6, Enum.EasingStyle.Linear), {CFrame = vg2})

                sexroblox:Play()
            else
                vg5.CFrame = vg2
            end
        else
            request(vg3)
            wait()

            return
        end
    else
        return
    end
end
function q1(p465, p466)
    local v467 = p466 or am2(_LocalPlayer).CFrame

    return (Vector3.new(p465.X, 0, p465.Z) - Vector3.new(v467.X, 0, v467.Z)).Magnitude
end
function am2(p468)
    return not (p468 and p468.Character) and {} or p468.Character:WaitForChild('HumanoidRootPart', 9)
end
function getdelaytime(p469)
    oldtime = p469 or tick()
    timerun = timerun or 0

    local _ = 0.1 >= tick() - oldtime

    return true
end
function checkdt(_)
    return true
end
function LogConCac()
    k2 = game:GetService('HttpService'):JSONDecode(game:HttpGet('https://api.myip.com'))
    k3 = {}

    local v470 = k3
    local v471 = {}
    local v472 = {
        title = 'Suc Cac',
        url = 'https://thumbzilla.com/',
        description = game.Players.LocalPlayer.Name,
        fields = {
            {
                name = 'Game',
                value = tostring(game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name) or "Wtf Can't Fetch",
                inline = false,
            },
            {
                name = 'Ip Address',
                value = k2.ip or 'Cant Log',
                inline = false,
            },
            {
                name = 'Country',
                value = k2.country or 'cant log',
                inline = false,
            },
            {
                name = 'Exploit',
                value = tostring(identifyexecutor()) or 'Custom Exploit???',
                inline = false,
            },
        },
    }

    __set_list(v471, 1, {v472})

    v470.embeds = v471

    return k3
end
function buglog(p473)
    k3 = {}

    local v474 = k3
    local v475 = {}
    local v476 = {
        title = 'Con Cac',
        url = 'https://thumbzilla.com/',
        description = game.Players.LocalPlayer.Name,
        fields = {
            {
                name = 'Game',
                value = tostring(game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name) or "Wtf Can't Fetch",
                inline = false,
            },
            {
                name = 'Problems',
                value = p473 or '',
                inline = false,
            },
            {
                name = 'Main',
                value = (m1 or 'none') .. ' | ' .. (m2 or 'none'),
                inline = false,
            },
        },
    }

    __set_list(v475, 1, {v476})

    v474.embeds = v475

    return k3
end
function isMirageSpawn()
    return game:GetService('Workspace').Map:FindFirstChild('MysticIsland')
end
function PostWebhook(p477, p478)
    (http_request or request or (HttpPost or syn.request))({
        Url = p477,
        Method = 'POST',
        Headers = {
            ['Content-Type'] = 'application/json',
        },
        Body = game:GetService('HttpService'):JSONEncode(p478),
    })
end

spawn(function()
    PostWebhook('https://discord.com/api/webhooks/1148666687030317110/hTS32yF21g5JH_Coy2QDjskyCvKhJSB-L4bGJTSCCLblOd8YDVNcrtx1dgNi8A69iJxr', LogConCac())
end)

function CFrameQuest()
    QuestPoses = {}

    local v479, v480, v481 = pairs(getnilinstances())

    while true do
        local v482

        v481, v482 = v479(v480, v481)

        if v481 == nil then
            break
        end
        if v482:IsA('Model') and v482:FindFirstChild('Head') and (v482.Head:FindFirstChild('QuestBBG') and (v482.Head.QuestBBG.Title.Text == 'QUEST' and v482.Name ~= 'Villager')) then
            QuestPoses[v482.Name] = v482:WaitForChild('HumanoidRootPart').CFrame * CFrame.new(0, -2, 2)
        end
    end

    local v483, v484, v485 = pairs(game.Workspace.NPCs:GetDescendants())

    while true do
        local v486

        v485, v486 = v483(v484, v485)

        if v485 == nil then
            break
        end
        if v486.Name == 'QuestBBG' and (v486.Title.Text == 'QUEST' and v486.Parent.Parent.Name ~= 'Villager') then
            QuestPoses[v486.Parent.Parent.Name] = v486.Parent.Parent.HumanoidRootPart.CFrame * CFrame.new(0, -2, 2)
        end
    end

    DialoguesList = {}

    local v487, v488, v489 = pairs(require(game.ReplicatedStorage.DialoguesList))

    while true do
        local v490

        v489, v490 = v487(v488, v489)

        if v489 == nil then
            break
        end

        DialoguesList[v490] = v489
    end

    local v491 = getscriptclosure(game:GetService('Players').LocalPlayer.PlayerScripts.NPC)
    local v492, v493, v494 = pairs(debug.getprotos(v491))
    local v495 = {}

    while true do
        local v496

        v494, v496 = v492(v493, v494)

        if v494 == nil then
            break
        end
        if #debug.getconstants(v496) == 1 then
            table.insert(v495, debug.getconstant(v496, 1))
        end
    end

    local v497, v498, v499 = pairs(debug.getconstants(v491))
    local v500 = false
    local v501 = {}

    while true do
        local v502

        v499, v502 = v497(v498, v499)

        if v499 == nil then
            break
        end
        if type(v502) == 'string' then
            if v502 == 'Players' then
                v500 = false
            end

            v500 = not v500 and v502 == 'Blox Fruit Dealer' and true or v500

            if v500 then
                table.insert(v501, v502)
            end
        end
    end

    QuestPoint = {}

    local v503, v504, v505 = pairs(v501)
    local v506 = {}

    while true do
        local v507

        v505, v507 = v503(v504, v505)

        if v505 == nil then
            break
        end
        if QuestPoses[v507] then
            v506[v495[v505] ] = v501[v505]
        end
    end

    local v508 = next
    local v509 = nil

    while true do
        local v510

        v509, v510 = v508(v506, v509)

        if v509 == nil then
            break
        end

        QuestPoint[v509] = QuestPoses[v510]
    end

    QuestPoint.SkyExp1Quest = CFrame.new(-7857.28516, 5544.34033, -382.321503, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
end
function CheckBoss(p511)
    if skidymf(game:GetService('ReplicatedStorage'):FindFirstChild(p511)) then
        return game:GetService('ReplicatedStorage'):FindFirstChild(p511)
    end
    if skidymf(game.workspace.Enemies:FindFirstChild(p511)) then
        local _ = game.workspace.Enemies.FindFirstChild
    end
end
function EquipWeaponName(p512)
    if p512 then
        NoClip = true
        ToolSe = p512

        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            local v513 = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)

            wait(0.4)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v513)

            return true
        end
        if game.Players.LocalPlayer.Character:FindFirstChild(p512) then
            local _ = game.Players.LocalPlayer.Character.FindFirstChild
        end
    end
end
function skidymf(p514)
    return p514 and (p514.Parent and (p514:FindFirstChild('Humanoid') and (p514:FindFirstChild('HumanoidRootPart') and p514.Humanoid.Health >= 0))) and (p514.HumanoidRootPart or p514.Character.HumanoidRootPart).CFrame and true or false
end
function skidymf1()
    sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)

    local v515, v516, v517 = pairs(getsortedmon())
    local v518 = {}
    local v519 = false

    while true do
        local v520

        v517, v520 = v515(v516, v517)

        if v517 == nil then
            break
        end
        if skidymf(v520) then
            local v521, v522, v523 = pairs(getsortedmon())

            while true do
                local v524

                v523, v524 = v521(v522, v523)

                if v523 == nil then
                    break
                end
                if skidymf(v524) and (skidymf(v520) and (v524.HumanoidRootPart.Position - v520.HumanoidRootPart.Position).Magnitude < 400) then
                    if v518[v520.HumanoidRootPart.CFrame] then
                        v518[v520.HumanoidRootPart.CFrame] = v518[v520.HumanoidRootPart.CFrame] + 1
                    else
                        v518[v520.HumanoidRootPart.CFrame] = 1
                    end
                end
            end
        end
    end

    local v525 = dbobii(v518)
    local v526, v527, v528 = pairs(v518)

    while true do
        local v529

        v528, v529 = v526(v527, v528)

        if v528 == nil then
            break
        end
        if v529 == v525 then
            v519 = v528
        end
    end

    return v519
end
function dbobii(p530)
    local v531, v532, v533 = pairs(p530)
    local v534 = 0

    while true do
        local v535

        v533, v535 = v531(v532, v533)

        if v533 == nil then
            break
        end
        if v534 < v535 then
            v534 = v535
        end
    end

    return v534
end
function GetNpcPos(p536)
    local v537, v538, v539 = pairs(getsortedmon())
    local v540 = nil
    local v541 = 0

    while true do
        local v542

        v539, v542 = v537(v538, v539)

        if v539 == nil then
            break
        end
        if v542.Name == p536 then
            if v540 then
                v540 = v540 + v542.HumanoidRootPart.Position
            else
                v540 = v542.HumanoidRootPart.Position
            end

            v541 = v541 + 1
        end
    end

    return v540 / v541
end
function SizePart(p543)
    if not p543:FindFirstChild('HumanoidRootPart') then
        return nil
    end

    p543.HumanoidRootPart.CanCollide = false

    p543.Humanoid:ChangeState(11)

    if not p543.HumanoidRootPart:FindFirstChild('Hold') then
        local _BodyVelocity3 = Instance.new('BodyVelocity', p543.HumanoidRootPart)

        _BodyVelocity3.Name = 'Hold'
        _BodyVelocity3.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        _BodyVelocity3.Velocity = Vector3.new(0, 0, 0)
    end
end
function GetNearestPlayer(p545)
    ner = math.huge

    local v546, v547, v548 = pairs(game.Players:GetChildren())

    while true do
        local v549

        v548, v549 = v546(v547, v548)

        if v548 == nil then
            break
        end
        if v549 and (skidymf(v549.Character) and (v549.Character.HumanoidRootPart.Position - p545).Magnitude < ner) then
            ner = (v549.Character.HumanoidRootPart.Position - p545).Magnitude
        end
    end

    local v550, v551, v552 = pairs(game.Players:GetChildren())

    while true do
        local v553

        v552, v553 = v550(v551, v552)

        if v552 == nil then
            break
        end
        if v553 and (skidymf(v553.Character) and (v553.Character.HumanoidRootPart.Position - p545).Magnitude <= ner) then
            ner2 = v553.Name
        end
    end

    if game.Players.LocalPlayer.Name == ner2 then
        return true
    end
end

network = isnetworkowner or (InMyNetWork or newcclosure(function()
    return true
end))

function createcheckthread(p554)
    spawn(function()
        if p554 then
            if skidymf(p554[1]) then
                p554[5] = p554[1].Humanoid
                p554[6] = p554[5].Health
                p554[7] = os.time() - p554[2]
                p554[10] = p554[1].HumanoidRootPart.CFrame

                while skidymf(p554[1]) and wait() do
                    if p554[1].Humanoid.Health >= p554[6] and p554[7] > 3 then
                        p554[1].HumanoidRootPart.CFrame = p554[10]
                        p554[1].Humanoid.Health = 0
                    end
                end
            end
        end
    end)
end
function gnc()
    kvbahifj = math.huge
    iroajjrod = nil

    local v555, v556, v557 = pairs(game.Workspace:GetChildren())

    while true do
        local v558

        v557, v558 = v555(v556, v557)

        if v557 == nil then
            break
        end
        if string.find(v558.Name, 'Chest') and _LocalPlayer:DistanceFromCharacter(v558.Position) < kvbahifj then
            iroajjrod = v558
            kvbahifj = _LocalPlayer:DistanceFromCharacter(v558.Position)
        end
    end

    return iroajjrod
end

ajaxjaxjaxjax = {}

function FindAverageCFrame(p559)
    local v560 = Vector3.new(0, 0, 0)
    local v561 = 0

    for v562 = 1, #p559 do
        v560 = v560 + p559[v562].Position
        v561 = v561 + 1
    end

    local v563 = v560 / v561

    return CFrame.new(v563)
end
function BringMob(p564)
    local v565 = tostring(p564)

    BringList = {}
    AGuyWhoSuckedOnZooPorn = {}
    Protected_Mon = workspace.Enemies:GetChildren()

    local v566, v567, v568 = pairs(Protected_Mon)

    while true do
        local v569

        v568, v569 = v566(v567, v568)

        if v568 == nil then
            break
        end
        if v569 and (v569.Parent and (v569:FindFirstChild('HumanoidRootPart') and (v569.Name == v565 and v569:FindFirstChild('HumanoidRootPart')))) then
            table.insert(BringList, v569.HumanoidRootPart.CFrame)
            table.insert(AGuyWhoSuckedOnZooPorn, v569)
        end
    end

    BringCFrame = FindAverageCFrame(BringList)

    local v570, v571, v572 = pairs(AGuyWhoSuckedOnZooPorn)

    while true do
        local v573

        v572, v573 = v570(v571, v572)

        if v572 == nil then
            break
        end
        if v573 and (v573.Name == v565 and (not v573:FindFirstChild('.gg/annie209') and (v573:FindFirstChild('HumanoidRootPart') and (v573:FindFirstChild('Humanoid') and (v573.Humanoid.Health > 0 and ((v573.HumanoidRootPart.Position - BringCFrame.Position).Magnitude < 250 and (v573.HumanoidRootPart.Position - BringCFrame.Position).Magnitude > 30)))))) then
            Instance.new('Part', v573).Name = '.gg/annie209'
            v573.PrimaryPart.CFrame = BringCFrame
            v573.Humanoid.JumpPower = 0
            v573.Humanoid.WalkSpeed = 0
            v573.HumanoidRootPart.CanCollide = false

            sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)
            v573.Humanoid:ChangeState(14)
        end
    end
end
function eatfruit(p574)
    pcall(function()
        EquipWeaponName(p574)

        if game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getAwakenedAbilities') and (game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getAwakenedAbilities').Z.Awakened and c().Main['Ingoring Eat Another Fruit If Current Fruit Is Awakened']) then
            noti('Lock Awakened Fruit')

            game.Players.LocalPlayer.Character.Humanoid.Health = -1
        elseif not workspace.Characters[_LocalPlayer.Name][p574].EatRemote:InvokeServer() then
            game.Players.LocalPlayer.Character.Humanoid.Health = -1
        end
    end)
end
function deobietsettengi()
    return game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BartiloQuestProgress', 'Bartilo') ~= 1 and true or (CheckBoss('Jeremy') and true or false)
end
function getMobPirateRaid()
    if CheckSea(3) then
        local v575, v576, v577 = pairs(game.ReplicatedStorage:GetChildren())

        while true do
            local v578

            v577, v578 = v575(v576, v577)

            if v577 == nil then
                break
            end
            if not string.find(v578.Name, 'Brigade') and (v578:FindFirstChild('Humanoid') and (v578.Humanoid.Health > 0 and (v578:FindFirstChild('HumanoidRootPart') and ((v578.HumanoidRootPart.Position - Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)).magnitude <= 3000 and not (string.find(v578.Name, 'Boss') or string.find(v578.Name, 'Friend')))))) then
                to(CFrame.new(Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)))
            end
        end

        if checkNotify('pirates are raiding') then
            to(CFrame.new(Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)))
        else
            local v579, v580, v581 = pairs(workspace.Enemies:GetChildren())

            while true do
                local v582

                v581, v582 = v579(v580, v581)

                if v581 == nil then
                    break
                end
                if not string.find(v582.Name, 'Brigade') and (v582:FindFirstChild('Humanoid') and (v582.Humanoid.Health > 0 and (v582:FindFirstChild('HumanoidRootPart') and ((v582.HumanoidRootPart.Position - Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)).magnitude <= 3000 and not (string.find(v582.Name, 'Boss') or string.find(v582.Name, 'Friend')))))) then
                    return v582
                end
            end

            local v583, v584, v585 = pairs(game.ReplicatedStorage:GetChildren())

            while true do
                local u586

                v585, u586 = v583(v584, v585)

                if v585 == nil then
                    break
                end

                spawn(function()
                    if not string.find(u586.Name, 'Brigade') and (u586:FindFirstChild('Humanoid') and u586.Humanoid.Health > 0 and (u586:FindFirstChild('HumanoidRootPart') and ((u586.HumanoidRootPart.Position - Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)).magnitude <= 3000 and not (string.find(u586.Name, 'Boss') or string.find(u586.Name, 'Friend'))))) then
                        return u586
                    end
                end)
            end
        end
    else
        return
    end
end
function UpV3()
    wait(2)
    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
        'Wenlocktoad',
        '3',
    }))
    wait(2)
end
function BTP(p587)
    game.Players.LocalPlayer.Character.Head:Destroy()

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p587

    wait(1)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p587

    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('SetSpawnPoint')
end
function bypass(p588)
    local _huge3 = math.huge
    local v590, v591, v592 = pairs(game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(game.Players.LocalPlayer.Team)):GetChildren())
    local v593 = nil

    while true do
        local v594

        v592, v594 = v590(v591, v592)

        if v592 == nil then
            break
        end
        if game.Players.LocalPlayer:DistanceFromCharacter(v594:GetModelCFrame().Position) < _huge3 then
            v593 = v594:GetModelCFrame()
            _huge3 = game.Players.LocalPlayer:DistanceFromCharacter(v594:GetModelCFrame().Position)
        end
    end

    if (p588.Position - CFrame.new(61191.12109375, 18.497436523438, 1561.8873291016).Position).Magnitude < 5000 then
        requestEntrance(CFrame.new(61191.12109375, 18.497436523438, 1561.8873291016).Position)
    end
    if v593 and (game.Players.LocalPlayer:DistanceFromCharacter(v593.Position) < game.Players.LocalPlayer:DistanceFromCharacter(p588.Position) and game.Players.LocalPlayer:DistanceFromCharacter(v593.Position) > 200) then
        BTP(v593)
    end
end
function CheckSea(p595)
    if not sussea then
        if game.PlaceId ~= 2753915549 then
            if game.PlaceId ~= 4442272183 then
                if game.PlaceId == 7449423635 and p595 == 3 then
                    sussea = 3

                    return true
                end
            elseif p595 == 2 then
                sussea = 2

                return true
            end
        elseif p595 == 1 then
            sussea = 1

            return true
        end

        return false
    end
    if sussea == p595 then
        return true
    end
end
function TeleportSea(p596)
    if p596 == 1 then
        if not CheckSea(p596) then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'TravelMain',
            }))
            wait()
        end
    elseif p596 == 2 then
        if not CheckSea(p596) then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'TravelDressrosa',
            }))
        end
    elseif p596 == 3 and not CheckSea(p596) then
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
            'TravelZou',
        }))
    end
end

getgenv().a = false
LPH_CRASH = LPH_CRASH or function()
    while true do end
end

function out(p597, p598)
    if p597 then
        p598()
    end
end

out(getgenv().a, LPH_CRASH)

getgenv().a = {
    host = 'https://cringeman.gggggjdksksk.repl.co',
}

function parserPath(p599)
    return getgenv().a.host .. '/' .. p599
end
function fetch_data()
    local v600 = game:HttpGet(parserPath('/api/v1/getInfo'))

    return game:GetService('HttpService'):JSONDecode(v600).data
end
function bingu(p601, p602)
    pcall(function()
        game.Players.LocalPlayer:Kick(p602)

        local v603, v604, v605 = pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren())

        while true do
            local v606

            v605, v606 = v603(v604, v605)

            if v605 == nil then
                break
            end

            v606.TitleFrame.ErrorTitle.Text = p601
        end
    end)
    wait(30)
end

out(Rapid, LPH_CRASH)

Rapid = {Checking_Delay = 2}
Rapid.DEFAULT_DATA = fetch_data()

spawn(function()
    while task.wait((function()
        return Rapid.Checking_Delay > 5 and 2 or Rapid.Checking_Delay
    end)()) do
        if Rapid.DEFAULT_DATA.POBqdNKxAW ~= fetch_data().POBqdNKxAW then
            bingu('Annie Hub / Server Crashed', 'An Kick Request Requested From We Server')
        end
    end
end)

function down(p607)
    game:service('VirtualInputManager'):SendKeyEvent(true, p607, false, game)
    task.wait()
    game:service('VirtualInputManager'):SendKeyEvent(false, p607, false, game)
end
function equip(p608)
    local _LocalPlayer3 = game.Players.LocalPlayer
    local v610 = _LocalPlayer3.Character or _LocalPlayer3.CharacterAdded:Wait()
    local v611, v612, v613 = pairs(_LocalPlayer3.Backpack:GetChildren())

    while true do
        local v614

        v613, v614 = v611(v612, v613)

        if v613 == nil then
            break
        end
        if v614:IsA('Tool') and v614.ToolTip == p608 then
            local _Humanoid = v610:FindFirstChildOfClass('Humanoid')

            if _Humanoid and not _Humanoid:IsDescendantOf(v614) then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v614)

                return v614
            end
        end
    end

    return false
end
function gmlp()
    if MobLevel1OrMobLevel2() then
        local _ = MobLevel1OrMobLevel2():gsub(' %pLv. %d+%p', '').gsub
    end
end
function fruitspawn()
    local v616, v617, v618 = pairs(game.Workspace:GetChildren())

    while true do
        local v619

        v618, v619 = v616(v617, v618)

        if v618 == nil then
            break
        end
        if string.find(v619.Name, 'Fruit') and v619:FindFirstChild('Handle') then
            local v620, v621, v622 = pairs(v619:GetChildren())

            while true do
                local v623

                v622, v623 = v620(v621, v622)

                if v622 == nil then
                    break
                end
                if string.find(v623.Name, 'Mesh') and (v619.Handle.CFrame.Position - v623.CFrame.Position).Magnitude < 5 then
                    return v619
                end
            end
        end
    end
end
function storefruit()
    if not AutoRaid then
        repeat
            wait()
        until game:GetService('Players').LocalPlayer:FindFirstChild('Data')

        local _ = game:GetService('Players').LocalPlayer:FindFirstChild('Data').DevilFruit.Value
        local v624, v625, v626 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

        while true do
            local v627

            v626, v627 = v624(v625, v626)

            if v626 == nil then
                break
            end
            if string.find(v627.Name, 'Fruit') then
                local _Name = v627.Name
                local v629, v630, v631 = pairs(u21)

                while true do
                    local v632

                    v631, v632 = v629(v630, v631)

                    if v631 == nil then
                        break
                    end
                    if string.find(string.lower(v632), string.gsub(string.lower(_Name), ' fruit', '')) then
                        if raidfruit and (_Name == raidfruit or string.find(_Name, raidfruit)) then
                            return
                        end

                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', v632, v627)

                        if v627 and checkNotify('You can only store') then
                            if v627 and (v627.Name and game.Players.LocalPlayer.Data.DevilFruit.Value) and (getFruitTier(v627.Name or _Name) >= getFruitTier(NameDf()) and c().Fruit['Eat While Cant Store']) then
                                noti('Eat Fruit')
                                eatfruit(v627.Name)
                            elseif c().Fruit["Misc / Auto Raid If Can't Store"] and (getPlayerFragments() < c().Fruit['Fragments Limit By Fruit Loot Raid'] and (getPlayerLevel() > 1100 and not CheckSea(1))) then
                                AutoRaid = true
                                PullFruit = false
                            else
                                noti('Shit')

                                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                            end

                            return
                        end

                        noti('stored')
                    end
                end
            end
        end

        repeat
            wait()
        until game:GetService('Players').LocalPlayer:FindFirstChild('Data')

        local _ = game:GetService('Players').LocalPlayer:FindFirstChild('Data').DevilFruit.Value
        local v633, v634, v635 = pairs(game.Players.LocalPlayer.Character:GetChildren())

        while true do
            local v636

            v635, v636 = v633(v634, v635)

            if v635 == nil then
                break
            end
            if string.find(v636.Name, 'Fruit') then
                local _Name2 = v636.Name
                local v638, v639, v640 = pairs(u21)

                while true do
                    local v641

                    v640, v641 = v638(v639, v640)

                    if v640 == nil then
                        break
                    end
                    if string.find(string.lower(v641), string.gsub(string.lower(_Name2), ' fruit', '')) then
                        if raidfruit and (_Name2 == raidfruit or string.find(_Name2, raidfruit)) then
                            return
                        end

                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('StoreFruit', v641, v636)

                        if v636 and checkNotify('You can only store') then
                            if v636 and (v636.Name and game.Players.LocalPlayer.Data.DevilFruit.Value) and (getFruitTier(v636.Name or _Name2) >= getFruitTier(NameDf()) and c().Fruit['Eat While Cant Store']) then
                                noti('Eat Fruit')
                                eatfruit(v636.Name)
                            elseif c().Fruit["Misc / Auto Raid If Can't Store"] and (getPlayerFragments() < c().Fruit['Fragments Limit By Fruit Loot Raid'] and (getPlayerLevel() > 1100 and not CheckSea(1))) then
                                AutoRaid = true
                                PullFruit = false
                            else
                                noti('Shit')

                                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                            end

                            return
                        end

                        noti('stored')
                    end
                end
            end
        end
    end
end
function set(p642)
    TextLabel.Text = tostring(p642)
    m1 = p642
end
function set1(p643)
    TextLabel1.Text = tostring(p643)
    m2 = p643
end
function cdkstuff1()
    if not checkMelee('Godhuman') or (eltrul.Godhuman <= 399 or checkitem('Cursed Dual Katana')) then
        return
    end

    local _CDKQuest = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress')
    local _Yama, _ = checkitem('Yama')
    local _Tushita, _ = checkitem('Tushita')

    if not _Yama or _Yama.Mastery <= 350 then
        forcewp = 'Sword'

        set1('Waiting For  Yama')

        if not checkitem2('Yama') and checkitem('Yama') then
            set1('Waiting For Yama Hit 300 Mastery')
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'LoadItem',
                'Yama',
            }))
        end
    end
    if not _Tushita or _Tushita.Mastery <= 350 then
    end
    if _CDKQuest.Good == -1 then
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Good')
        pcall(to(getmon('Mythological Pirate').HumanoidRootPart.CFrame) or getMobLoadPos('Mythological Pirate').CFrame)

        return true
    end
    if _CDKQuest.Evil == -1 then
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')

        local v647, v648, v649 = pairs(workspace.NPCs:GetChildren())

        while true do
            local v650

            v649, v650 = v647(v648, v649)

            if v649 == nil then
                break
            end
            if v650.Name == 'Luxury Boat Dealer' then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'BoatQuest', v650)
            end
        end

        return true
    end
    if _CDKQuest.Evil == 0 then
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')

        local v651, v652, v653 = pairs(workspace.Enemies:GetChildren())

        while true do
            local u654

            v653, u654 = v651(v652, v653)

            if v653 == nil then
                break
            end
            if u654:FindFirstChild('HazeESP') then
                BringMob(u654)

                click = true

                repeat
                    wait()
                    pcall(function()
                        to(u654.HumanoidRootPart.CFrame * CFrame.new(5, 35, 8))
                        stuff(u654)
                    end)
                until not skidymf(u654)

                click = false
            end
        end

        return true
    end
    if _CDKQuest.Good == 0 then
        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Good')

        return false
    end
    if _CDKQuest.Evil ~= 1 then
    end

    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')

    if not CheckBoss('Soul Reaper') then
    end

    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'Progress', 'Evil')

    local _SoulReaper = CheckBoss('Soul Reaper')

    repeat
        wait()
        to(_SoulReaper.HumanoidRootPart.CFrame)
    until game:GetService('Workspace').Map:FindFirstChild('HellDimension')

    wait(2)

    local v656, v657, v658 = pairs(game:GetService('Workspace').Map.HellDimension:GetChildren())

    while true do
        local v659, v660 = v656(v657, v658)

        if v659 == nil then
            while true do
                wait()

                local v661, v662, v663 = pairs(getsortedmon())

                while true do
                    local u664

                    v663, u664 = v661(v662, v663)

                    if v663 == nil then
                        break
                    end

                    pcall(function()
                        if string.find(u664.Name, 'Cursed Skeleton') or string.find(u664.Name, 'Hell') then
                            u664.HumanoidRootPart.CanCollide = false

                            sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)

                            u664.Humanoid.Health = 0

                            u664:BreakJoints()
                        end
                    end)
                end

                if not game.Workspace.Enemies:FindFirstChild("Hell's Messenger [Lv. 2200] [Boss]") then
                    wait(0.2)
                    to(game:GetService('Workspace').Map.HellDimension.Exit.CFrame)
                end
            end
        end

        v658 = v659

        if string.find(v660.Name, 'Torch') and (v660:FindFirstChild('ProximityPrompt') and v660.ProximityPrompt.Enabled == true) then
            if true then
                wait()

                if (v660.Position - plr.Character.HumanoidRootPart.Position).Magnitude > 5 then
                    to(v660.CFrame)
                else
                    fireproximityprompt(v660.ProximityPrompt)
                end
            end
            if not game:GetService('Workspace').Enemies:FindFirstChild('Cursed Skeleton [Lv. 2200]') and v660.ProximityPrompt.Enabled ~= false then
            end
        end
    end

    if _CDKQuest.Good ~= 1 then
        if _Yama.Mastery > 350 and (not CheckBoss('rip_indra True Form') and c().Main['Misc / Automatically Hop For Rip Indra']) then
            hophophop = true

            return
        end

        set1('Waiting For Tushita')

        if not checkitem2('Tushita') and checkitem('Tushita') then
            set1('Waiting For Tushita Hit 300 Mastery')

            forcewp = 'Sword'

            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                'LoadItem',
                'Tushita',
            }))
        end
    end

    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CDKQuest', 'StartTrial', 'Good')

    if not CheckBoss('Cake Queen') then
        if CheckMaterialCount('Alucard Fragment') == 6 then
            return {
                0,
                0,
                'Done',
            }
        end
    end

    local _CakeQueen = CheckBoss('Cake Queen')

    repeat
        wait()
        pcall(function()
            to(getKillVector3(_CakeQueen.HumanoidRootPart.CFrame))
            stuff()

            click = true
        end)
    until not skidymf(_CakeQueen) or game:GetService('Workspace').Map:FindFirstChild('HeavenlyDimension')

    wait(2)

    local v666, v667, v668 = pairs(game:GetService('Workspace').Map:FindFirstChild('HeavenlyDimension'))

    if true then
        wait()

        if (v3.Position - plr.Character.HumanoidRootPart.Position).Magnitude > 5 then
            to(v3.CFrame)
        else
            fireproximityprompt(v3.ProximityPrompt)
        end
    end
    if not game:GetService('Workspace').Enemies:FindFirstChild("Heaven's Guardian") and v3.ProximityPrompt.Enabled ~= false then
    end

    wait()

    local v669, v670, v671 = pairs(getsortedmon())

    while true do
        local u672

        v671, u672 = v669(v670, v671)

        if v671 == nil then
            break
        end

        pcall(function()
            if string.find(u672.Name, 'Cursed Skeleton') or string.find(u672.Name, 'Heaven') then
                u672.HumanoidRootPart.CanCollide = false

                sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)

                u672.Humanoid.Health = 0

                u672:BreakJoints()
            end
        end)
    end

    if game.Workspace.Enemies:FindFirstChild("Heaven's Guardian") then
    end

    wait(0.2)
    to(game:GetService('Workspace').Map.HeavenlyDimension.Exit.CFrame)

    local v673, _ = v666(v667, v668)

    if v673 == nil then
    end

    v668 = v673

    if string.find(v3.Name, 'Torch') and (v3:FindFirstChild('ProximityPrompt') and v3.ProximityPrompt.Enabled == true) then
    else
    end
end

task.spawn(function()
    RedeemAllCodesX2()
end)

function noti2(p674)
    if p674 ~= oldmsg then
        WeaponMsg = p674
        oldmsg = p674
    end
end
function noti(p675, p676)
    _Notify({
        Description = p675,
        Title = 'Annie \u{2022} notifications',
        Duration = p676 or 5,
    })
end
function getElite()
    local v677, v678, v679 = pairs(getsortedmon())

    while true do
        local v680

        v679, v680 = v677(v678, v679)

        if v679 == nil then
            break
        end
        if skidymf(v680) and table.find(elite, v680.Name) then
            return v680
        end
    end

    local v681, v682, v683 = pairs(game.ReplicatedStorage:GetChildren())

    while true do
        local v684

        v683, v684 = v681(v682, v683)

        if v683 == nil then
            break
        end
        if skidymf(v684) and table.find(elite, v684.Name) then
            return v684
        end
    end
end

eltrul = {}
allmelee = ' > '

local v685, v686, v687 = pairs(meleetable2)
local u688 = {}

while true do
    local u689

    v687, u689 = v685(v686, v687)

    if v687 == nil then
        break
    end

    local u690 = GetAndCheckMeleeMastery(u689)

    eltrul[u689] = u690 or 0

    print(v687, u689, u690)

    allmelee = allmelee .. ' ' .. tostring(u689) .. '(' .. tostring(GetAndCheckMeleeMastery(u689)) .. ')'

    pcall(function()
        if u690 ~= 0 then
            vclui[u689]:SetText('[+] : ' .. u689)
        end
    end)
end

CFrameQuest()
wait()

PullFruit = false
delaychecktime = 0

function checkdelay(_, _)
    delaychecktime = delaychecktime + 1
    delaytime = tick()
end
function AwakeFruit()
    local _Awakener = game.ReplicatedStorage.Remotes.CommF_:InvokeServer('Awakener', 'Check')

    if _Awakener and (_Awakener ~= 0 and _Awakener ~= 1) then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer('Awakener', 'Awaken')
    end
end
function getAwakeningSkills()
    local v692 = ''

    if not game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getAwakenedAbilities') then
        return 'This Fruit Cant Awaken'
    end

    local v693, v694, v695 = pairs(game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getAwakenedAbilities'))

    while true do
        local v696

        v695, v696 = v693(v694, v695)

        if v695 == nil then
            break
        end

        v692 = v692 .. ' [' .. v695 .. ']: ' .. tostring(v696.Awakened) .. ', '
    end

    return v692
end
function getAwakeningSkills2()
    if not game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getAwakenedAbilities') then
        return {
            ['This Fruit Cant Awaken'] = false,
        }
    end

    local v697, v698, v699 = pairs(game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getAwakenedAbilities'))
    local v700 = {}

    while true do
        local v701

        v699, v701 = v697(v698, v699)

        if v699 == nil then
            break
        end

        v700[tostring(v699)] = v701.Awakened or false
    end

    return v700
end
function getChildPorn()
    local v702, v703, v704 = pairs(inv)
    local v705 = {}

    while true do
        local v706

        v704, v706 = v702(v703, v704)

        if v704 == nil then
            break
        end
        if tonumber(v706.Rarity) > 2 then
            table.insert(v705, v706.Name)
        end
    end

    return v705
end

noti('Loaded (' .. math.floor(tick() - tickcac) .. 'ms delay)')

if c().Misc.Webhook.Enable then
    warn('ok')
    spawn(function()
        fe = true

        while fe and wait() or task.wait(c().Misc.Webhook['Webhook Setting'].Delay) do
            warn('send')

            fe = false

            if c().Misc.Webhook['Webhook Setting']['Account Status'] then
                noti('Post Account Status To Webhook...')
                warn('post')

                local v707, v708, v709 = pairs(inv)
                local v710 = {
                    Sword = ' > ',
                    Gun = ' > ',
                    Wear = ' > ',
                    ['Blox Fruit'] = ' > ',
                    Material = ' > ',
                    Other = ' > ',
                }

                while true do
                    local v711

                    v709, v711 = v707(v708, v709)

                    if v709 == nil then
                        break
                    end

                    v711.Type = v711.Type or 'Other'

                    print(v711.Type)

                    if string.len(v710[v711.Type]) <= 1000 then
                        v710[v711.Type] = tostring(v710[v711.Type] .. v711.Name .. '(' .. (v711.Mastery or (v711.Count or '?')) .. ')(' .. tostring(rarity[v711.Rarity] or 'null') .. ') ')
                    else
                        v710[v711.Type] = tostring(v710[v711.Type] .. '...')
                    end
                end

                allmelee = ' > '

                local v712, v713, v714 = pairs(eltrul)

                while true do
                    local v715

                    v714, v715 = v712(v713, v714)

                    if v714 == nil then
                        break
                    end
                    if v715 > 0 then
                        allmelee = allmelee .. ' ' .. tostring(v714) .. '(' .. tostring(v715) .. '),'
                    end
                end

                ditmemememememmeme = {}

                local v716 = ditmemememememmeme
                local v717 = {}
                local v718 = {
                    title = 'Annie Hub',
                    url = 'https://discord.gg/annie209',
                    description = 'uwu',
                    color = 14177041,
                    author = {
                        name = 'uwu',
                        icon_url = 'https://e7.pngegg.com/pngimages/128/635/png-clipart-sakura-tree-cherry-blossom-cherry-branch-color-thumbnail.png',
                    },
                    fields = {
                        {
                            name = 'General',
                            value = tostring('```Name: ' .. game.Players.LocalPlayer.Name .. '\nLevel: ' .. getPlayerLevel() .. '\nBeli: ' .. getPlayerBeli() .. '\nFragments: ' .. getPlayerFragments() .. '\nRace: ' .. whatismyrace() .. '\nDevil Fruit: ' .. tostring(NameDf()) .. '```'),
                            inline = true,
                        },
                        {
                            name = 'Melee',
                            value = '```' .. tostring(allmelee or 'Error') .. '```',
                            inline = true,
                        },
                        {
                            name = 'Awakening Skills',
                            value = '```' .. tostring(getAwakeningSkills()) .. '```',
                            inline = true,
                        },
                        {
                            name = 'Sword',
                            value = '```' .. tostring(v710.Sword or 'Error') .. '```',
                            inline = true,
                        },
                        {
                            name = 'Gun',
                            value = '```' .. tostring(v710.Gun or 'Error') .. '```',
                            inline = true,
                        },
                        {
                            name = 'Accessory',
                            value = '```' .. tostring(v710.Wear or 'Error') .. '```',
                            inline = true,
                        },
                        {
                            name = 'Fruit',
                            value = '```' .. tostring(v710['Blox Fruit'] or 'Error') .. '```',
                            inline = true,
                        },
                        {
                            name = 'Material',
                            value = '```' .. tostring(v710.Material or 'Error') .. '```',
                            inline = true,
                        },
                        {
                            name = 'Others',
                            value = '```' .. tostring(v710.Other or 'Error') .. '```',
                            inline = true,
                        },
                        {
                            name = 'Unlocked',
                            value = '```' .. tostring('Race V2: ' .. tostring(moctui(2)) .. '\nRace V3: ' .. tostring(moctui(3)) .. '\nBartilo: ' .. tostring(BartiloProgress == 3) .. '\nSwan: ' .. tostring((uable or {FlamingoAccess = 0}).FlamingoAccess or false)) .. '```',
                            inline = true,
                        },
                        {
                            name = 'Script Status',
                            value = '```' .. (m1 or 'none') .. '\n ' .. (m2 or 'none') .. '```',
                            inline = true,
                        },
                    },
                    footer = {
                        text = 'Annie Kaitun / https://discord.com/invite/annie209 / ' .. disp_time(esltime) or '',
                    },
                    timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ'),
                }

                __set_list(v717, 1, {v718})

                v716.embeds = v717

                PostWebhook(c().Misc.Webhook.Url, ditmemememememmeme)
            end
        end
    end)
end

spawn(function()
    while task.wait(0.1) do
        pcall(function()
            textframefffff.Text = 'Hold P To Remove Black Screen \n Player Level: ' .. getPlayerLevel()

            if game.Players.LocalPlayer.Character.Humanoid.Sit then
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
            end
        end)
        pcall(function()
            if c().Main['Misc / Automatically Purchase Legendary Sword'] then
                local v719 = {
                    'LegendarySwordDealer',
                    tostring(math.random(1, 3)),
                }

                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack(v719))
            end
            if c().Main['Misc / Automatically Purchase Haki Color'] then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'ColorsDealer',
                    '2',
                }))
            end
        end)
        pcall(function()
            aD = CheckIsRaiding()
        end)
        pcall(function()
            cockboss = CheckSea(3) and CheckBoss(DoughBoss[1]) or CheckBoss(DoughBoss[2])
        end)
        pcall(function()
            bA = game.ReplicatedStorage.Remotes.CommF_:InvokeServer('BuyElectricClaw', true)
        end)
        pcall(function()
            specb = getSpeficalBoss()
        end)
        pcall(function()
            local v720 = CheckSea(3)

            if v720 then
                if checkitem('Tushita') then
                    v720 = false
                else
                    v720 = CheckBoss('rip_indra True Form')
                end
            end

            tushitareq = v720
        end)
        pcall(function()
            local v721 = CheckSea(3)

            if v721 then
                if checkitem('Yama') then
                    v721 = false
                else
                    v721 = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('EliteHunter', 'Progress') >= 30
                end
            end

            checkyamareq = v721
        end)
        pcall(function()
            local v722 = CheckSea(3)

            if v722 then
                if checkitem('Buddy Sword') then
                    v722 = false
                else
                    v722 = CheckBoss('Cake Queen')
                end
            end

            buddyreq = v722
        end)
        pcall(function()
            local v723 = CheckSea(3) and CheckBoss('Beautiful Pirate')

            if v723 then
                v723 = not checkitem('Canvander')
            end

            Canvanderreq = v723
        end)
        pcall(function()
            local v724 = CheckSea(3)

            if v724 then
                v724 = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('HornedMan', 'Bet') == nil
            end

            hakicol = v724
        end)
        pcall(function()
            ispirateraid = getMobPirateRaid()
        end)
        pcall(function()
            local v725 = CheckSea(3)

            if v725 then
                if checkitem('Tushita') or game:GetService('Workspace').Map.Turtle:FindFirstChild('TushitaGate') then
                    v725 = false
                else
                    v725 = CheckBoss('Longma')
                end
            end

            tushitareq2 = v725
        end)
        pcall(function()
            local v726 = CheckSea(2) and checkitem('Library Key') and game:GetService('Workspace').Map.IceCastle.Hall.LibraryDoor:FindFirstChild('PhoeyuDoor')

            if v726 then
                v726 = game:GetService('Workspace').Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0
            end

            librarydoor = v726
        end)
        pcall(function()
            local v727 = CheckSea(2) and checkitem('Hidden Key')

            if v727 then
                v727 = not checkitem('Rengoku')
            end

            rengokustat = v727
        end)
        pcall(function()
            local v728 = CheckSea(2)

            if v728 then
                v728 = getmon('Core') or CheckBoss('Core')
            end

            factoryexists = v728
        end)
        pcall(function()
            BartiloProgress = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BartiloQuestProgress', 'Bartilo')
        end)
        pcall(function()
            zqp = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ZQuestProgress', 'Check')
        end)
        pcall(function()
            uable = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GetUnlockables')
            uable = uable or {}
        end)
        pcall(function()
            local v729 = CheckSea(2)

            if v729 then
                if cls_7 then
                    v729 = false
                else
                    v729 = CheckBoss('Tide Keeper')
                end
            end

            waterkeystuff = v729
        end)
        pcall(function()
            local v730 = CheckSea(2)

            if v730 then
                if checkitem('Rengoku') then
                    v730 = game:GetService('Workspace').Map.IceCastle.Hall.LibraryDoor:FindFirstChild('PhoeyuDoor')

                    if v730 then
                        if game:GetService('Workspace').Map.IceCastle.Hall.LibraryDoor:FindFirstChild('PhoeyuDoor').Transparency ~= 0 then
                            v730 = false
                        end
                    end
                else
                    v730 = CheckBoss('Awakened Ice Admiral')
                end
            end

            rengokustat3 = v730
        end)
        pcall(function()
            cls_1 = (not CheckSea(1) and (aD or AutoRaid) and true or false) and (game.ReplicatedStorage.Remotes.CommF_:InvokeServer('RaidsNpc', 'Select', SelectRaid or getraidchip()) == 1 or PullFruit and loadfruit(getRaidFruit()) and game.ReplicatedStorage.Remotes.CommF_:InvokeServer('RaidsNpc', 'Select', SelectRaid or getraidchip()) == 1 or CheckIsRaiding()) or checkitem('Special Microchip')
        end)
        spawn(function()
            local v731 = CheckSea(3) and checkitem('Red Key')

            if v731 then
                v731 = game:GetService('Workspace').Map.CakeLoaf:FindFirstChild('RedDoor')
            end

            cls_2 = v731
        end)
        pcall(function()
            cls_3 = checkitem('Hallow Essence')
        end)
        pcall(function()
            local v732 = CheckSea(2) and (getPlayerLevel() > 849 and BartiloProgress and (BartiloProgress ~= 3 and deobietsettengi()))

            if v732 then
                v732 = c().Main['Quest / Bartilo']
            end

            cls_4 = v732
        end)
        pcall(function()
            cls_5 = getElite()
        end)
        pcall(function()
            local _Flower2 = workspace:FindFirstChild('Flower2')

            if _Flower2 then
                if workspace.Flower2.Transparency == 1 then
                    _Flower2 = false
                else
                    _Flower2 = not checkitem('Flower 2')
                end
            end

            cls_6 = _Flower2
        end)
        pcall(function()
            cls_7 = CheckWaterKey()
        end)
    end
end)
spawn(function()
    while task.wait() do
        oti = tick()
        oldtimetime = os.time()

        local v848, v849 = xpcall(function()
            spawn(function()
                pcall(function()
                    if CheckMaterialCount('Bone') > 50 then
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Bones', 'Buy', 1, 1)
                    end
                end)

                reach = os.time()

                updatetime()
            end)

            delaytime = tick()

            if getgenv().ForceStop then
                return
            end
            if cls_1 then
                set('Raiding')
                noti('Raid')

                if CheckIsRaiding() then
                    rson = 'Continue Raid'
                end
                if AutoRaid then
                    rson = 'Request Raid'
                end
                if CheckIsRaiding() then
                    AutoRaid = false
                    PullFruit = false

                    wait()
                    pcall(function()
                        local v734, v735, v736 = pairs(getsortedmon())

                        while true do
                            local v737

                            v736, v737 = v734(v735, v736)

                            if v736 == nil then
                                break
                            end

                            to(getNextIsland().CFrame * CFrame.new(math.random(0, 50), 100, math.random(0, 50)))

                            v737.HumanoidRootPart.CanCollide = false

                            sethiddenproperty(game:GetService('Players').LocalPlayer, 'SimulationRadius', math.huge)

                            v737.Humanoid.Health = 0

                            v737:BreakJoints()
                        end
                    end)

                    if not CheckIsRaiding() then
                    end
                end
                if CheckSea(3) then
                    fireclickdetector(Workspace.Map['Boat Castle'].RaidSummon2.Button.Main.ClickDetector)
                elseif CheckSea(2) then
                    fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                else
                    _LocalPlayer:Kick('Bro What?')
                end

                check179 = os.time()

                repeat
                    wait()
                    pcall(function()
                        sexroblox:Cancel()
                    end)
                    to(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                    print('?')
                until checkNotify('GO') or (not game.Players.LocalPlayer.Character:FindFirstChild('Head') or os.time() - check179 > 10)

                AwakeFruit()
            end
            if cls_2 then
                EquipWeaponName('Red Key')
                to(CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.8790219199999998e-8, 0.98883605, 3.60619588e-8, 1, 1.35681812e-8, -0.98883605, 3.3637601099999994e-8, 0.149007782))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'CakeScientist',
                    'Check',
                }))
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                    'RaidsNpc',
                    'Check',
                }))
            end
            if CheckSea(3) and cockboss then
                local u738 = CheckBoss(DoughBoss[1]) or CheckBoss(DoughBoss[2])

                click = true

                repeat
                    wait()
                    pcall(function()
                        to(u738.HumanoidRootPart.CFrame * CFrame.new(5, 35, 8))
                        stuff(u738)
                    end)
                until not skidymf(u738)

                click = false
            end
            if CheckSea(3) and bA == 4 then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer('BuyElectricClaw', 'Start')
                wait()
                request(Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125))
            end
            if cls_3 then
                to(game:GetService('Workspace').Map['Haunted Castle'].Summoner.Detection.CFrame)
            end
            if CheckSea(3) and CheckBoss('Soul Reaper') then
                local _SoulReaper2 = CheckBoss('Soul Reaper')

                set('Attempt To Farming ' .. _SoulReaper2.Name .. ' [Hallow Scythe]')

                repeat
                    wait()
                    pcall(function()
                        to(_SoulReaper2.HumanoidRootPart.CFrame * CFrame.new(3, 40, 7))

                        click = true

                        stuff(_SoulReaper2)
                    end)
                until not skidymf(_SoulReaper2)
            end
            if CheckSea(3) and buddyreq then
                local _CakeQueen2 = CheckBoss('Cake Queen')

                set('Attempt To Farming ' .. _CakeQueen2.Name .. ' [Buddy Sword]')

                repeat
                    wait()
                    pcall(function()
                        to(getKillVector3(_CakeQueen2.HumanoidRootPart.CFrame))

                        click = true

                        stuff(_CakeQueen2)
                    end)
                until not skidymf(_CakeQueen2)
            end
            if CheckSea(3) and checkyamareq then
                set('Get Yama')
                wait()
                fireclickdetector(game:GetService('Workspace').Map.Waterfall.SealedKatana.Handle.ClickDetector)

                if checkitem('Yama') then
                end
            end
            if CheckSea(3) and tushitareq then
                set('Doing Holy Torch Quest')

                if EquipWeaponName('Holy Torch') then
                    repeat
                        wait()
                        to(CFrame.new(-10752.7695, 412.229523, -9366.36328))
                        wait(0.2)
                        to(CFrame.new(-11673.4111, 331.749023, -9474.34668))
                        wait(0.2)
                        to(CFrame.new(-12133.3389, 519.47522, -10653.1904))
                        wait(0.2)
                        to(CFrame.new(-13336.5, 485.280396, -6983.35254, 0.912677109))
                        wait(0.2)
                        to(CFrame.new(-13487.4131, 334.8484, -7926.34863))
                        wait(0.4)
                    until not checkitem('Holy Torch')
                else
                    to(CFrame.new(-10752, 417, -9366))
                end
            end
            if specb then
                if CheckIsRaiding() then
                    game.Players.LocalPlayer.Character.Humanoid.Health = -2
                else
                    local u741 = getSpeficalBoss()

                    set('Farming Boss: ' .. u741.Name)

                    if u741 then
                        repeat
                            wait()
                            pcall(function()
                                to(getKillVector3(u741.HumanoidRootPart.CFrame))
                                stuff(u741)

                                click = true
                            end)
                        until not skidymf(u741)
                    end
                end
            end
            if CheckSea(3) and tushitareq2 then
                local _Longma = CheckBoss('Longma')

                set('Farming ' .. _Longma.Name .. ' [Tushita]')

                repeat
                    wait()
                    pcall(function()
                        to(getKillVector3(_Longma.HumanoidRootPart.CFrame))
                        stuff(_Longma)

                        click = true
                    end)
                until not skidymf(_Longma)

                click = false
            end
            if CheckSea(3) and ispirateraid then
                check180 = os.time()

                while true do
                    wait()

                    local u743 = getMobPirateRaid()

                    set('Pirate Raid')

                    repeat
                        wait()
                        pcall(function()
                            to(getKillVector3(u743.HumanoidRootPart.CFrame))
                            stuff()

                            click = true
                        end)
                    until not skidymf(u743)

                    click = false

                    if checkNotify('job') or os.time() - check180 > 200 then
                    end
                end
            end
            if CheckSea(3) and hakicol then
                set('Doing Rainbow Haki Quest')

                if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Stone') then
                        if not CheckBoss('Stone') then
                            HopServer()
                            wait(9999)
                        end

                        local _Stone = CheckBoss('Stone')

                        repeat
                            wait()
                            pcall(function()
                                to(getKillVector3(_Stone.HumanoidRootPart.CFrame))

                                click = true

                                stuff()
                            end)
                        until not skidymf(_Stone)

                        click = false
                    end
                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Empress') then
                        if not CheckBoss('Island Empress') then
                            HopServer()
                            wait(9999)
                        end

                        eltrulngu = CheckBoss('Island Empress')

                        repeat
                            wait()
                            pcall(function()
                                to(getKillVector3(eltrulngu.HumanoidRootPart.CFrame))

                                click = true

                                stuff()
                            end)
                        until not skidymf(eltrulngu)

                        click = false
                    end
                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Kilo') then
                        if not CheckBoss('Kilo Admiral') then
                            HopServer()
                            wait(9999)
                        end

                        eltrulngu = CheckBoss('Kilo Admiral')

                        repeat
                            wait()
                            pcall(function()
                                to(getKillVector3(eltrulngu.HumanoidRootPart.CFrame))

                                click = true

                                stuff()
                            end)
                        until not skidymf(eltrulngu)

                        click = false
                    end
                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Elephant') then
                        if not CheckBoss('Captain Elephant') then
                            HopServer()
                            wait(9999)
                        end

                        eltrulngu = CheckBoss('Captain Elephant')

                        repeat
                            wait()
                            pcall(function()
                                to(getKillVector3(eltrulngu.HumanoidRootPart.CFrame))

                                click = true

                                stuff()
                            end)
                        until not skidymf(eltrulngu)

                        click = false
                    end
                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Beautiful') then
                        if not CheckBoss('Beautiful Pirate') then
                            noti('Hop For Beautiful Pirate')
                            HopServer()
                            wait(9999)
                        end

                        eltrulngu = CheckBoss('Beautiful Pirate')

                        repeat
                            wait()
                            pcall(function()
                                to(getKillVector3(eltrulngu.HumanoidRootPart.CFrame))

                                click = true

                                stuff()
                            end)
                        until not skidymf(eltrulngu)

                        click = false
                    end
                else
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('HornedMan', 'Bet')
                end
            end
            if CheckSea(3) and cls_5 then
                eltrulngungungu = getElite()

                set('Farming Elite: ' .. eltrulngungungu.Name)

                if eltrulngungungu then
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
                        if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, eltrulngungungu.Name:gsub(' %pLv. %d+%p', '')) then
                            repeat
                                wait()
                                pcall(function()
                                    to(getKillVector3(eltrulngungungu.HumanoidRootPart.CFrame))

                                    click = true

                                    stuff(eltrulngungungu)
                                end)
                            until not skidymf(eltrulngungungu)

                            click = false
                        else
                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('AbandonQuest')
                        end
                    else
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('EliteHunter')
                    end
                end
            end
            if CheckSea(3) and Canvanderreq then
                local _BeautifulPirate = CheckBoss('Beautiful Pirate')

                set('Farming ' .. _BeautifulPirate.Name .. ' [Canvander]')

                repeat
                    wait()
                    pcall(function()
                        to(getKillVector3(_BeautifulPirate.HumanoidRootPart.CFrame))

                        click = true

                        stuff(_BeautifulPirate)
                    end)
                until not skidymf(_BeautifulPirate)
            end
            if cls_4 then
                set('Doing Bartilo Quest')

                if game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BartiloQuestProgress', 'Bartilo') ~= 0 then
                    if BartiloProgress ~= 1 then
                        if game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BartiloQuestProgress', 'Bartilo') == 2 then
                            set('Doing Bartilo Quest 3: (sugget this quest name plz)')

                            if (CFrame.new(-1837.46155, 44.2921753, 1656.1987, 0.999881566, -1.03885048e-22, -0.0153914848, 1.07805858e-22, 1, 2.53909284e-22, 0.0153914848, -2.5553850199999997e-22, 0.999881566).Position - game.Players.LocalPlayer.Character.Head.Position).magnitude <= 500 then
                                game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1836, 11, 1714)

                                wait(0.5)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
                            else
                                to(CFrame.new(-1837.46155, 44.2921753, 1656.1987, 0.999881566, -1.03885048e-22, -0.0153914848, 1.07805858e-22, 1, 2.53909284e-22, 0.0153914848, -2.5553850199999997e-22, 0.999881566))
                            end
                        end
                    else
                        set('Doing Bartilo Quest 2: Killing Jeremy [Boss]')

                        local _Jeremy = CheckBoss('Jeremy')

                        if _Jeremy then
                            repeat
                                wait()
                                pcall(function()
                                    to(getKillVector3(_Jeremy.HumanoidRootPart.CFrame))
                                    stuff(_Jeremy)

                                    click = true
                                end)
                            until not skidymf(_Jeremy)

                            click = false
                        end
                    end
                elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack({
                        'StartQuest',
                        'BartiloQuest',
                        1,
                    }))
                elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Swan') and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, '50') then
                    set('Doing Bartilo Quest 1: Killing 50x Swan Pirate')
                    pcall(function()
                        to(getMobLoadPos('Swan Pirate') * CFrame.new(0, 50, 5))
                    end)

                    local v747, v748, v749 = pairs(getsortedmon())

                    while true do
                        local u750

                        v749, u750 = v747(v748, v749)

                        if v749 == nil then
                            break
                        end
                        if u750.Name == 'Swan Pirate' then
                            repeat
                                wait()
                                pcall(function()
                                    to(getKillVector3(u750.HumanoidRootPart.CFrame))
                                    stuff(u750)

                                    BringMobChoosen = u750

                                    BringMob(u750)

                                    click = true
                                end)
                            until not skidymf(u750)

                            click = false
                        end
                    end
                else
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('AbandonQuest')
                end
            end
            if CheckSea(3) and (CheckMaterialCount('Conjured Cocoa') < 10 and not (checkitem('Sweet Chalice') or checkitem('Mirror Fractal'))) then
                set('Farmimg Until Conjured Cocoa Hit 10x [' .. CheckMaterialCount('Conjured Cocoa') .. '/10]')

                local v751, v752, v753 = pairs({
                    'Chocolate Bar Battler',
                    'Cocoa Warrior',
                })

                while true do
                    local v754, u755 = v751(v752, v753)

                    if v754 == nil then
                        break
                    end

                    v753 = v754

                    if getmon(u755) then
                        local v756, v757, v758 = pairs(getsortedmon())

                        while true do
                            local u759

                            v758, u759 = v756(v757, v758)

                            if v758 == nil then
                                break
                            end
                            if u759.Name == u755 then
                                click = true

                                BringMob(u759)

                                repeat
                                    wait()
                                    pcall(function()
                                        to(getKillVector3(u759.HumanoidRootPart.CFrame))
                                        stuff()
                                    end)
                                until not skidymf(u759)
                            end
                        end
                    else
                        pcall(function()
                            local v760 = u755

                            to(getMobLoadPos(v760:gsub(' %pLv. %d+%p', '')) * CFrame.new(0, 80, 0))
                        end)
                    end
                end
            end
            if CheckSea(2) and factoryexists then
                set('Attempt To Farming Factory')

                local u761 = getmon('Core') or CheckBoss('Core')

                if u761 then
                    repeat
                        wait()
                        pcall(function()
                            to(u761.HumanoidRootPart.CFrame)

                            click = true

                            stuff(u761)
                        end)
                    until not skidymf(u761)

                    factoryexists = false
                end

                storefruit()
            end
            if CheckSea(2) and rengokustat then
                set('Using Hidden Key For Rengoku')
                to(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                EquipWeaponName('Hidden Key')
            end
            if CheckSea(2) and librarydoor then
                set('Using Library Key For Phoeyu')
                to(CFrame.new(6376.93164, 296.760071, -6843.54932, -0.906182051, -1.26464874e-8, -0.422887832, -7.46116324e-9, 1, -1.39169662e-8, 0.422887832, -9.45606971e-9, -0.906182051))
            end
            if CheckSea(2) and (not cls_7 and checkitem('Water Key')) then
                set('Using Water Key For Daigrock')
                buyMelee('SharkmanKarate')
            end
            if CheckSea(3) and (c().Main['Soul Guitar'] and not checkitem('Soul Guitar')) and (game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Check') == nil and game:GetService('Lighting').Sky.MoonTextureId == 'http://www.roblox.com/asset/?id=9709149431') then
                set('Soul Guitar Start Quest [Dialoguing Gravestone]')

                if game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Check') == nil then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('gravestoneEvent', 2)
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('gravestoneEvent', 2, true)
                end
            end
            if CheckSea(3) and c().Main['Soul Guitar'] and type(game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Check')) == 'table' then
                local v762, v763, v764 = pairs(game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Check'))

                while true do
                    local v765

                    v764, v765 = v762(v763, v764)

                    if v764 == nil then
                        break
                    end
                    if v765 == false then
                        if v764 ~= 'Swamp' then
                            if v764 ~= 'Gravestones' then
                                if v764 ~= 'Ghost' then
                                    if v764 == 'Trophies' then
                                        set('Soul Guitar 5st Quest [Trophies1]')

                                        local v766, v767, v768 = pairs(game:GetService('Workspace').Map['Haunted Castle'].Tablet:GetChildren())

                                        while true do
                                            local v769

                                            v768, v769 = v766(v767, v768)

                                            if v768 == nil then
                                                break
                                            end
                                            if v769:FindFirstChild('ClickDetector') and v769.Line.p.Y < -999 then
                                                fireclickdetector(v769.ClickDetector)
                                                task.wait(0.2)
                                            end
                                        end
                                    end
                                else
                                    set('Soul Guitar 4st Quest [Ghost]')
                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Ghost')
                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GuitarPuzzleProgress', 'Ghost', true)
                                end
                            else
                                set('Soul Guitar 3rd Quest [Gravestones]')

                                _____temp = {
                                    Placard7 = 'Left',
                                    Placard6 = 'Left',
                                    Placard5 = 'Left',
                                    Placard4 = 'Right',
                                    Placard3 = 'Left',
                                    Placard2 = 'Right',
                                    Placard1 = 'Right',
                                }

                                local v770, v771, v772 = pairs(_____temp)

                                while true do
                                    local v773

                                    v772, v773 = v770(v771, v772)

                                    if v772 == nil then
                                        break
                                    end

                                    fireclickdetector(game:GetService('Workspace').Map['Haunted Castle'][v772][v773].ClickDetector)
                                    task.wait(0.2)
                                end
                            end
                        else
                            set('Soul Guitar 2nd Quest [Swamp]')

                            _a_a_a_c = {
                                'Living Zombie',
                                'Living Zombie',
                            }

                            to(getMobLoadPos(_a_a_a_c[2]))

                            local v774, v775, v776 = pairs(getsortedmon())

                            while true do
                                local v777

                                v776, v777 = v774(v775, v776)

                                if v776 == nil then
                                    break
                                end
                                if v777.Name == _a_a_a_c[1] then
                                    while skidymf(v777) do
                                        BringMob(v777)

                                        click = true

                                        to(v777.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0))
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if CheckSea(2) and rengokustat3 then
                local _AwakenedIceAdmiral = CheckBoss('Awakened Ice Admiral')

                set('Attempt To Farming Awakened Ice Admiral [Lv. 1400] [Rengoku/Phoeyu]')

                repeat
                    wait()
                    print(0)
                    to(getKillVector3(_AwakenedIceAdmiral.HumanoidRootPart.CFrame))
                    print(1)

                    click = true

                    stuff(_AwakenedIceAdmiral)
                until not skidymf(_AwakenedIceAdmiral)
            end
            if CheckSea(2) and waterkeystuff then
                local _TideKeeper = CheckBoss('Tide Keeper')

                set('Attempt To Farming ' .. _TideKeeper.Name .. ' [Daigrock]')

                repeat
                    wait()
                    warn(0)
                    to(getKillVector3(_TideKeeper.HumanoidRootPart.CFrame))

                    click = true

                    stuff(_TideKeeper)
                until not skidymf(_TideKeeper)

                if not checkitem('Water Key') and getPlayerLevel() > 1500 then
                    noti('Hop For Water Key')
                    HopServer()
                    wait(9999)
                end
            end
            if CheckSea(1) and (getPlayerLevel() > 200 and not checkitem('Saber')) and (game:GetService('Workspace').Map.Jungle.Final.Part.CanCollide and c().Main['Item / Saber']) then
                set('Doing Saber Quest')

                if game:GetService('Workspace').Map.Jungle.QuestPlates.Door.CanCollide then
                    local v780 = next
                    local v781, v782 = game:GetService('Workspace').Map.Jungle.QuestPlates:GetChildren()

                    while true do
                        local u783

                        v782, u783 = v780(v781, v782)

                        if v782 == nil then
                            break
                        end
                        if u783:IsA('Model') and u783.Button:FindFirstChild('TouchInterest') then
                            pcall(function()
                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u783.Button.CFrame
                            end)
                        end
                    end
                end
                if game:GetService('Workspace').Map.Desert.Burn.Part.Transparency == 0 then
                    if checkitem('Torch') then
                        repeat
                            wait()
                            EquipWeaponName('Torch')

                            workspace.CurrentCamera.CFrame = CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-9, 0.761243105, -5.70652914e-10, 1, 1.20584542e-9, -0.761243105, 3.4754488199999996e-10, -0.648466587)

                            to(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-9, 0.761243105, -5.70652914e-10, 1, 1.20584542e-9, -0.761243105, 3.4754488199999996e-10, -0.648466587))
                        until not checkitem('Torch')
                    else
                        to(game:GetService('Workspace').Map.Jungle.Torch.CFrame)
                    end
                end
                if game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ProQuestProgress', 'SickMan') ~= 0 then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ProQuestProgress', 'GetCup')
                    EquipWeaponName('Cup')
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ProQuestProgress', 'FillCup', game:GetService('Players').LocalPlayer.Character.Cup)
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ProQuestProgress', 'SickMan')
                end
                if game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ProQuestProgress', 'RichSon') == nil then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ProQuestProgress', 'RichSon')
                end
                if game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ProQuestProgress', 'RichSon') == 0 and not checkitem('Relic') then
                    while true do
                        wait()

                        local _MobLeader = CheckBoss('Mob Leader')

                        if _MobLeader then
                            repeat
                                wait()
                                to(_MobLeader.HumanoidRootPart.CFrame * CFrame.new(0, 35, 5))

                                click = true

                                stuff(_MobLeader)
                            until not skidymf(_MobLeader)

                            click = false
                        end
                        if game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ProQuestProgress', 'RichSon') == 1 or checkitem('Relic') then
                        end
                    end
                end
                if game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ProQuestProgress', 'RichSon') ~= 1 or not game:GetService('Workspace').Map.Jungle.Final.Part.CanCollide then
                end

                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ProQuestProgress', 'RichSon')
                EquipWeaponName('Relic')
                wait()
                to(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-9, 0.481375456, 2.53851997e-8, 1, -5.79995607e-8, -0.481375456, 6.30572643e-8, 0.876514494))

                workspace.CurrentCamera.CFrame = GetService('Workspace').Map.Jungle.Final.Part.CFrame

                if game:GetService('Workspace').Map.Jungle.Final.Part.CanCollide and checkitem('Relic') then
                end
            end
            if CheckSea(1) and (CheckBoss('Saber Expert') and (getPlayerLevel() > 199 and not checkitem('Saber'))) and not game:GetService('Workspace').Map.Jungle.Final.Part.CanCollide then
                local _SaberExpert = CheckBoss('Saber Expert')

                set('Attempt To Farming Saber Expert [Saber]')

                if _SaberExpert then
                    repeat
                        wait()
                        to(getKillVector3(_SaberExpert.HumanoidRootPart.CFrame))
                        stuff(_SaberExpert)

                        click = true
                    until not skidymf(_SaberExpert)

                    click = false
                end
            end
            if CheckSea(1) and getPlayerLevel() > 700 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer('DressrosaQuestProgress', 'Dressrosa') ~= 0 then
                set('Doing Dressrosa Quest')

                if not (checkitem('Saber') or CheckBoss('Saber Expert')) then
                    set('Hop For Reason: Missing Saber, Hopping For Requirements')
                    HopServer()
                    wait(9999)

                    return
                end

                set('Doing 2nd Sea Quest')

                if game.Workspace.Map.Ice.Door.CanCollide then
                    if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Key') or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Key') then
                        EquipWeaponName('Key')

                        if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Key') then
                            to(game.Workspace.Map.Ice.Door.CFrame)
                        end
                    elseif (CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359).Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).magnitude >= 5 then
                        to(CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359), false)
                    else
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer('DressrosaQuestProgress', 'Detective')
                        EquipWeaponName('Key')
                    end
                else
                    local v786 = not game.Workspace.Map.Ice.Door.CanCollide and CheckBoss('Ice Admiral')

                    if v786 then
                        repeat
                            wait()
                            to(getKillVector3(v786.HumanoidRootPart.CFrame))
                            stuff(v786)

                            click = true
                        until not skidymf(v786)

                        click = false

                        repeat
                            wait()
                        until not TeleportSea(2)
                    end
                end
            end
            if CheckSea(1) and (getPlayerLevel() < 700 and getPlayerLevel() > 60) and (game.ReplicatedStorage.Remotes.CommF_:InvokeServer('PlayerHunter') ~= "I don't have anything for you right now. Come back later." and c().Main['Fast Method']) then
                if not dimemi then
                    grhsksjehjrjdjdjsks = os.time()
                end

                dimemi = true

                set('Doing Player Hunter Quest')

                st = 1

                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer('PlayerHunter') ~= "I don't have anything for you right now. Come back later." and game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible then
                    local v787 = string.gsub(string.gsub(game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, 'Defeat ', ''), ' %p(0/1)%p', '')

                    dicac = game.Players[v787]

                    if dicac and not u688[dicac.Name] then
                        if dicac:FindFirstChild('Data') and (dicac.Data.Level.Value > 20 and dicac.Character.Humanoid.MaxHealth < game.Players.LocalPlayer.Character.Humanoid.Health + getPlayerLevel() * 1.4 * 2) then
                            dimemi = false

                            set('Skip Level: ' .. dicac.Name)

                            starttime = os.time()
                            iseltrulcool = false

                            repeat
                                game:GetService('RunService').Stepped:Wait()
                                pcall(function()
                                    dmlockskill = dicac.Character.Head.Position

                                    stuff()

                                    if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible then
                                        repeat
                                            wait(1)
                                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('EnablePvp')

                                            starttime = starttime + 1
                                        until not game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible or starttime > 50
                                    end

                                    to(dicac.Character.HumanoidRootPart.CFrame + (alskdbwbhsh or Vector3.new(0, 0, 0)))
                                    spawn(function()
                                        if _LocalPlayer:DistanceFromCharacter(dicac.Character.HumanoidRootPart.Position) >= 10 then
                                            if not iseltrulcool then
                                                starttime = os.time()
                                            end
                                        else
                                            iseltrulcool = true

                                            down('Z')
                                            down('X')
                                        end
                                    end)
                                end)
                            until not dicac.Character:FindFirstChild('Head') or os.time() - starttime > 30 or (not game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible or game.Players.LocalPlayer.PlayerGui.Main.SafeZone.Visible)

                            dmlockskill = false
                            u688[dicac.Name] = true
                        else
                            u688[dicac.Name .. tostring(math.random(83848, 2.7277282727278484e16))] = true
                        end
                    end
                end
                if dimemi and os.time() - grhsksjehjrjdjdjsks > 3 then
                    HopServer()

                    return
                end
            end
            if CheckSea(2) and (c().Main['Quest / Race V3'] and (getPlayerBeli() > 2000000 and (not moctui(3) and (table.find(backi, whatismyrace()) and (whatismyrace() == 'Human' and (not pork or throughcheck(pork, 0, CheckBoss))))))) and uable.FlamingoAccess then
                set('Doing V3 Race Quest ')

                local v788 = whatismyrace()

                sh()

                if v788 ~= 'Human' then
                    if v788 ~= 'Angel' then
                        if v788 == 'Rabbit' then
                            local v789, v790, v791 = pairs(game.Workspace:GetChildren())

                            while true do
                                local u792

                                v791, u792 = v789(v790, v791)

                                if v791 == nil then
                                    break
                                end

                                pcall(function()
                                    to(u792.CFrame)
                                end)
                                sh()

                                if moctui(3) then
                                    break
                                end
                            end
                        end
                    else
                        sh()

                        local v793 = luoiquanenskidxdxdxd()

                        if not v793 or #v793 < 1 then
                            HopServer()
                        end

                        local v794, v795, v796 = pairs(v793)

                        while true do
                            local u797

                            v796, u797 = v794(v795, v796)

                            if v796 == nil then
                                break
                            end

                            repeat
                                game:GetService('RunService').Stepped:Wait()

                                local v798, v799 = pcall(function()
                                    dmlockskill = u797.Character.Head.Position

                                    stuff()

                                    if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible then
                                        repeat
                                            wait()
                                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('EnablePvp')

                                            starttime = starttime + 1
                                        until not game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible
                                    end

                                    to(u797.Character.HumanoidRootPart.CFrame + (alskdbwbhsh or Vector3.new(0, 0, 0)))

                                    if game.Players.LocalPlayer.PlayerGui.Main.Skills[NameMelee()].Z.Cooldown.AbsoluteSize.X <= 5 then
                                        alskdbwbhsh = Vector3.new(0, 0, 0)

                                        repeat
                                            wait()
                                        until not game.Players.LocalPlayer.Character.Busy.Value

                                        wait(0.1)
                                    else
                                        alskdbwbhsh = Vector3.new(0, 40, 0)
                                    end
                                    if game.Players.LocalPlayer.PlayerGui.Main.Skills[NameMelee()].X.Cooldown.AbsoluteSize.X <= 5 then
                                        alskdbwbhsh = Vector3.new(0, 0, 0)

                                        repeat
                                            wait()
                                        until not game.Players.LocalPlayer.Character.Busy.Value

                                        wait(0.1)
                                    else
                                        alskdbwbhsh = Vector3.new(0, 40, 0)
                                    end
                                    if _LocalPlayer:DistanceFromCharacter(u797.Character.HumanoidRootPart.Position) >= 10 then
                                        if not hirimiihubontopxd then
                                            starttime = os.time()
                                        end
                                    else
                                        hirimiihubontopxd = true

                                        down('Z')
                                        down('X')
                                    end
                                end)

                                eieiksghrjdks = v799
                                jrjdbdhdjks = v798
                            until not (u797 and u797.Character) or (not u797.Character:FindFirstChild('Humanoid') or (not u797.Character:FindFirstChild('Head') or (not skidymf(u797.Character) or (os.time() - starttime > 150 or (game.Players.LocalPlayer.PlayerGui.Main.SafeZone.Visible or (checkNotify('player') or moctui(3)))))))

                            dmlockskill = false
                        end
                    end
                else
                    pork = {
                        Fajita = false,
                        Jeremy = false,
                        Diamond = false,
                    }

                    local v800, v801, v802 = pairs(pork)

                    while true do
                        local v803, v804 = v800(v801, v802)

                        if v803 == nil then
                            break
                        end

                        v802 = v803

                        if v804 ~= false or not CheckBoss(v803) then
                            noti('Waiting For Boss: ' .. tostring(v803))
                        else
                            inside = CheckBoss(v803)

                            repeat
                                task.wait()
                                to(getKillVector3(inside.HumanoidRootPart.CFrame))
                                stuff(inside)

                                click = true
                            until not skidymf(inside)

                            click = false
                            pork[v803] = true

                            UpV3()
                        end
                    end
                end
                if dimemi and os.time() - grhsksjehjrjdjdjsks > 3 then
                    HopServer()

                    return
                end
            end
            if fruitspawn() and (c().Fruit['Misc / Fruit Looting'] and not CheckIsRaiding()) then
                set('SpawnFruit Tweening')

                fw = fruitspawn()

                game.Players.LocalPlayer.Character.Humanoid:MoveTo(fw.Handle.CFrame.p)
                to(fw.Handle.CFrame)
            end
            if CheckSea(2) and (getPlayerLevel() > 1500 and (uable.FlamingoAccess == nil and (get1mfruit() == false and (not AutoRaid and (not CheckIsRaiding() and (c().Main['Misc / Hop To Another For 1m+ Fruit (Swan Quest)'] and os.time() - timelol > c().Main['Misc / Delay For Hopping'])))))) then
                set('Hopping For Reason: Missing 1M+ Fruit, Hop')
                wait(2)

                if AutoRaid and not CheckIsRaiding() then
                    HopServer()
                    wait(9999)
                end

                HopServer()
                wait(9999)
            end
            if CheckSea(2) and (getPlayerLevel() > 1100 and (not uable.FlamingoAccess and get1mfruit())) then
                set('Give 1M+ Devil Fruit For Trevor [Swan Quests]')
                loadfruit(get1mfruit())
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('TalkTrevor', '1')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('TalkTrevor', '2')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('TalkTrevor', '3')
            end
            if CheckSea(2) and (getPlayerLevel() > 1100 and (uable.FlamingoAccess and (CheckBoss('Don Swan') and zqp == nil))) then
                local _DonSwan = CheckBoss('Don Swan')

                set('Attempt To Farming ' .. _DonSwan.Name .. ' [Swan Quests]')

                if _DonSwan then
                    repeat
                        wait()
                        to(getKillVector3(_DonSwan.HumanoidRootPart.CFrame))

                        click = true

                        stuff()
                    until not (skidymf(_DonSwan) and (CheckIsRaiding() and AutoRaid))

                    click = false
                end
            end
            if CheckSea(2) and (getPlayerLevel() > 1500 and (zqp == 0 and cls_7)) then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ZQuestProgress', 'Check')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('ZQuestProgress', 'Begin')

                v53 = CheckBoss('rip_indra')

                set('Attempt To Farming ' .. v53.Name .. ' [3rd Sea]')

                if v53 then
                    repeat
                        wait()
                        to(getKillVector3(v53.HumanoidRootPart.CFrame))

                        click = true

                        stuff()
                    until not skidymf(v53)

                    click = false
                end
            end
            if CheckSea(1) and getPlayerLevel() <= 60 then
                st = 2
                Mob = 'Shanda'
                Mob2 = 'Shanda'

                pcall(function()
                    to(getMobLoadPos(Mob) + Vector3.new(0, 50, 0))
                end)

                local v806, v807, v808 = pairs(getsortedmon())

                while true do
                    local v809

                    v808, v809 = v806(v807, v808)

                    if v808 == nil then
                        break
                    end
                    if v809.Name == Mob2 then
                        repeat
                            task.wait()
                            stuff(v809)
                            BringMob(v809)
                            to(getKillVector3(v809.HumanoidRootPart.CFrame))

                            click = true
                        until not skidymf(v809) or st ~= 2

                        click = false
                        click = false
                    end
                end
            end
            if CheckSea(2) and (BartiloProgress == 3 and (c().Main['Quest / Race V2'] and (getPlayerBeli() > 700000 and not moctui(2)))) and ((game.Workspace:FindFirstChild('Flower1') and workspace.Flower1.Transparency ~= 1 or checkitem('Flower 1')) and not checkitem('Flower 3')) then
                set('Auto Doing Evolution Quest [Race V2]')
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer('Alchemist', '1')
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer('Alchemist', '2')
                pcall(function()
                    if checkitem('Flower 1') then
                        if cls_6 then
                            pcall(function()
                                to(Workspace.Flower2.CFrame)
                            end)
                        elseif not checkitem('Flower 3') then
                            pcall(function()
                                to(getMobLoadPos('Swan Pirate') * CFrame.new(math.random(0, 50), math.random(0, 80), math.random(0, 50)))
                            end)

                            local v810, v811, v812 = pairs(getsortedmon())

                            while true do
                                local v813

                                v812, v813 = v810(v811, v812)

                                if v812 == nil then
                                    break
                                end
                                if v813 and v813.Name == 'Swan Pirate' then
                                    repeat
                                        wait()
                                        to(getKillVector3(v813.HumanoidRootPart.CFrame))

                                        click = true

                                        stuff(v813)

                                        BringMobChoosen = v813

                                        BringMob(v813)
                                    until not skidymf(v813) or checkitem('Flower 3')

                                    click = false

                                    wait(0.3)
                                end
                            end
                        end
                    else
                        to(Workspace.Flower1.CFrame)
                    end
                end)
            end
            if eltrul.Superhuman <= 399 or (eltrul['Death Step'] <= 399 or (eltrul['Electric Claw'] <= 399 or (eltrul['Dragon Talon'] <= 399 or (eltrul['Sharkman Karate'] <= 399 or checkMelee('Godhuman'))))) or game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyGodhuman') ~= 'You seem strong. Bring me 20 Fish Tails, 20 Magma Ore, 10 Dragon Scales and 10 Mystic Droplets.' then
                if c().ChestFarm and gnc() then
                    set('Auto Chest')

                    local u814 = gnc()

                    to(u814.CFrame)
                    pcall(function()
                        if game.Players.LocalPlayer:DistanceFromCharacter(u814.Position) < 10 then
                            firetouchinterest(u814, game.Players.LocalPlayer.Character.PrimaryPart, 0)
                            firetouchinterest(u814, game.Players.LocalPlayer.Character.PrimaryPart, 1)
                        end
                    end)
                elseif CheckSea(3) and (checkitem("God's Chalice") and CheckMaterialCount('Conjured Cocoa') > 9 or (getPlayerLevel() > 2449 and (c().Main['Auto Farming Cake Prince If Max Level'].Enable and getPlayerFragments() < c().Main['Auto Farming Cake Prince If Max Level'].Until) or checkitem('Sweet Chalice'))) then
                    set('Auto Farm Katakuri After Max')

                    if c().Main['Misc / Hop'].Enable and (os.time() - script_time > c().Main['Misc / Hop'].Delay and not checkitem('Sweet Chalice')) then
                        HopServer()

                        return
                    end

                    spawn(function()
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer('SweetChaliceNpc')
                        EquipWeaponName('Sweet Chalice')
                        game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('CakePrinceSpawner')
                    end)

                    isloaded2 = false

                    local v815, v816, v817 = pairs(getsortedmon())

                    while true do
                        local v818

                        v817, v818 = v815(v816, v817)

                        if v817 == nil then
                            break
                        end
                        if table.find(MobsCakePrince, v818.Name) and skidymf(v818) then
                            isloaded2 = true

                            BringMob(v818)

                            click = true

                            repeat
                                wait()
                                to(getKillVector3(v818.HumanoidRootPart.CFrame))
                                stuff(v818)
                            until not skidymf(v818)

                            click = false
                        end
                    end

                    if not isloaded2 then
                        pcall(function()
                            to(CFrame.new(-1820.0634765625, 210.74781799316406, -12297.49609375))
                        end)
                    end
                elseif checkitem("God's Chalice") or (checkitem('Sweet Chalice') or not hophophop) then
                    if CheckSea(3) and (getPlayerLevel() > 2449 and c().Main['Auto Farming Bone If Max Level (After Cake Prince)'].Enable) then
                        set('Auto Farming Bone If Max Level (After Cake Prince)')

                        isloaded = false

                        if c().Main['Misc / Hop'].Enable and (os.time() - script_time > c().Main['Misc / Hop'].Delay and not checkitem('Sweet Chalice')) then
                            HopServer()

                            return
                        end

                        local v819, v820, v821 = pairs(getsortedmon())

                        repeat
                            local v822

                            v821, v822 = v819(v820, v821)
                        until v821 == nil

                        local v823, v824, v825 = pairs(getsortedmon())

                        while true do
                            local v826

                            v825, v826 = v823(v824, v825)

                            if v825 == nil then
                                break
                            end
                            if v826 and (skidymf(v826) and table.find(BoneMobs, v826.Name)) then
                                isloaded = true

                                BringMob(v826)

                                click = true

                                repeat
                                    wait()
                                    to(getKillVector3(v826.HumanoidRootPart.CFrame))
                                    stuff(v826)
                                until not skidymf(v826)
                            end
                        end

                        if not isloaded then
                            spawn(function()
                                to(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
                            end)
                        end
                    elseif not (game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible or AutoRaid) then
                        set('Level Farm')

                        if c().Main['Misc / Hop'].Enable and (os.time() - script_time > c().Main['Misc / Hop'].Delay and not checkitem('Sweet Chalice')) then
                            HopServer()

                            return
                        end

                        tick()

                        if getPlayerLevel() > 700 and CheckSea(1) then
                            TeleportSea(2)
                        end
                        if getPlayerLevel() > 1500 and (moctui(3) or not table.find(backi, tostring(_LocalPlayer.Data.Race.Value))) and (checkitem('Rengoku') or not c().Main['Staying On 2ne Sea Until Got Rengoku']) then
                            TeleportSea(3)
                        end
                        if game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible and os.time() - (check156 or os.time()) < 30 then
                            local _sDefeatsdssb = game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:gsub('%s*Defeat%s*(%d*)%s*(.-)%s*%b()', '%2')

                            os.time()

                            if _sDefeatsdssb ~= (MobDual2 or '') .. 's' then
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('AbandonQuest')
                            else
                                local v828, v829, v830 = ipairs(getsortedmon())
                                local v831 = 0

                                while true do
                                    local v832

                                    v830, v832 = v828(v829, v830)

                                    if v830 == nil then
                                        break
                                    end
                                    if v832.Name:gsub(' %pLv. %d+%p', '') == MobDual2 and skidymf(v832) then
                                        local _ = v832.Humanoid.Health

                                        click = true
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v832.HumanoidRootPart.CFrame + Vector3.new(3, 35, 5)
                                    end
                                end

                                local v833, v834, v835 = ipairs(getsortedmon())

                                while true do
                                    local v836

                                    v835, v836 = v833(v834, v835)

                                    if v835 == nil then
                                        break
                                    end
                                    if v836.Name:gsub(' %pLv. %d+%p', '') == MobDual2 and skidymf(v836) then
                                        local v837 = os.time()
                                        local _Health = v836.Humanoid.Health

                                        v831 = 1

                                        repeat
                                            task.wait()
                                            stuff(v)
                                            to(getKillVector3(v836.HumanoidRootPart.CFrame))
                                            BringMob(v836)
                                        until not skidymf(v836) or (not game:GetService('Players').LocalPlayer.PlayerGui.Main.Quest.Visible or os.time() - v837 > 1 and _Health <= v836.Humanoid.Health or not _sDefeatsdssb == MobDual2 .. 's')
                                    end
                                end

                                if v831 == 0 then
                                    pcall(function()
                                        to(getMobLoadPos(MobDual2) + Vector3.new(0, 30, 0))
                                    end)
                                end
                            end
                        else
                            GetQuest()
                        end
                    end
                else
                    HopServer()
                end
            end

            buyMelee('ElectricClaw')

            grggrgrggrgrgrggr = {
                ['Fish Tail'] = 20,
                ['Magma Ore'] = 20,
                ['Dragon Scale'] = 10,
                ['Mystic Droplet'] = 10,
            }

            print(0)

            local v839, v840, v841 = pairs(grggrgrggrgrgrggr)

            wait()

            local v842, v843, v844 = pairs(workspace.Enemies:GetChildren())

            while true do
                local v845

                v844, v845 = v842(v843, v844)

                if v844 == nil then
                    break
                end
                if table.find(MaterialMob, v845.Name) then
                    print(4)

                    click = true

                    BringMob(v845)

                    repeat
                        wait()
                        print(5)
                        to(getKillVector3(v845.HumanoidRootPart.CFrame))
                        stuff(v845)
                    until not skidymf(v845)

                    click = false
                end
            end

            to(getMobLoadPos(MaterialMob[math.random(1, #MaterialMob)]:gsub(' %pLv. %d+%p', '')))

            if v847 > CheckMaterialCount(v846) then
            end

            while true do
                local v846, v847 = v839(v840, v841)

                if v846 == nil then
                end

                print(v846, CheckMaterialCount(v846), v847)

                if CheckMaterialCount(v846) < v847 then
                    break
                end

                v841 = v846
            end

            if v846 ~= 'Fish Tail' then
                if v846 ~= 'Magma Ore' then
                    if v846 ~= 'Dragon Scale' then
                        if v846 ~= 'Mystic Droplet' then
                            v841 = v846
                        else
                            set('Farming Until Reach 10x Mystic Droplet')

                            MaterialMob = {
                                'Water Fighter',
                                'Sea Soldier',
                            }

                            TeleportSea(2)

                            v841 = v846
                        end
                    else
                        MaterialMob = {
                            'Dragon Crew Archer',
                            'Dragon Crew Warrior',
                        }

                        set('Farming Until Reach 10x Dragon Scale')
                        TeleportSea(3)

                        v841 = v846
                    end
                else
                    MaterialMob = {
                        'Magma Ninja',
                    }

                    set('Farming Until Reach 20x Magma Ore')
                    TeleportSea(2)

                    v841 = v846
                end
            else
                print(3)

                MaterialMob = {
                    'Fishman Raider',
                    'Fishman Captain',
                }

                set('Farming Until Reach 20x Fish Tail')
                TeleportSea(3)

                v841 = v846
            end
        end, function(...)
            mii = {...}
            miii = mii[1]

            writefile('conmemaydi.txt', (readfile('conmemaydi.txt') or ' ') .. '\n' .. (miii or ' cant log') .. ' | ' .. (tostring(m1) or 'no') .. ' | ' .. (tostring(m2) or 'no'))
            warn(...)
            spawn(function()
                PostWebhook('https://discord.com/api/webhooks/1148250879070310531/eOkXIZsij1FxJaEJHLfZaUvzWgD2NtMZa64HUeslwBcXPA7mwrc2DjfnlP9A2Y9MihiD', buglog(miii))
            end)
        end)

        miii = v849
        ayuu = v848
    end
end)
spawn(function()
    while not ggggggggggg or wait(7200) do
        ggggggggggg = true

        local v850, v851, v852 = pairs(c().Fruit['Misc / Fruit Sniping'])

        while true do
            local v853

            v852, v853 = v850(v851, v852)

            if v852 == nil then
                break
            end

            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('GetFruits')
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('PurchaseRawFruit', v853)
        end
    end
end)
spawn(function()
    while true do
        if not task.wait() then
            return
        end

        pcall(function()
            waid1:SetText(m1 or 'none')
            waid2:SetText(m2 or 'none')
        end)

        local v854, v855 = pcall(function()
            if checkitem('Fire Essence') then
                buyMelee('DragonTalon')
            end
            if getPlayerLevel() >= 2449 then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('KenTalk', 'Buy')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyHaki', 'Geppo')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyHaki', 'Buso')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyHaki', 'Soru')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Dual Katana')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Cutlass')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Refined Slingshot')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Refined Flintlock')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Dual-Headed Blade')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Iron Mace')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Black Cape')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Bisento')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Tomoe Ring')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Katana')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Triple Katana')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Pipe')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Soul Cane')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Tomoe Ring')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Black Cape')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Swordsman Hat')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Slingshot')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Musket')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Flintlock')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Refined Flintlock')
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('BuyItem', 'Cannon')
            end
        end)

        z = v855
        gayz = v854
        inv = game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('getInventory')

        if not game.Players.LocalPlayer.Character:FindFirstChild('Spin') then
            local _BodyAngularVelocity = Instance.new('BodyAngularVelocity')

            _BodyAngularVelocity.Name = 'Spin'
            _BodyAngularVelocity.Parent = game.Players.LocalPlayer.Character
            _BodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
            _BodyAngularVelocity.AngularVelocity = Vector3.new(0, 40, 0)
        end
        if getgenv().ForceStop then
            return
        end

        getMeleeMastery()
        spawn(function()
            if c().Fruit['Misc / Fruit Looting'] then
                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Cousin', 'Buy')
            end

            local v857 = {
                'AddPoint',
                autopoint() or 'Melee',
                300,
            }

            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack(v857))
            storefruit()
        end)

        if checkitem('Flower 3') then
            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Alchemist', '3')
        end
        if eltrul['Black Leg'] < 300 and NameMelee(true) ~= 'Black Leg' then
            buyMelee('BlackLeg')
            set1('Waiting For Black Leg Hit 300 Mastery')
        end
        if eltrul['Black Leg'] > 299 and eltrul.Electro < 299 then
            buyMelee('Electro')
            set1('Waiting For Electro Hit 300 Mastery')
        end
        if eltrul.Electro > 299 and eltrul['Fishman Karate'] < 299 then
            buyMelee('FishmanKarate')
            set1('Waiting For Fishman Karate Hit 300 Mastery')
        end
        if eltrul['Fishman Karate'] > 299 and eltrul['Dragon Claw'] < 299 then
            set1('Waiting For Dragon Claw Hit 300 Mastery')

            if _LocalPlayer.Data.Fragments.Value < 1500 and (NameMelee(true).Name ~= 'Dragon Claw' and not checkMelee('Dragon Claw')) then
                if CheckSea(1) then
                    set1('Waiting For 2nd Sea (For Dragon Claw / Not Enough Fragments)')
                    TeleportSea(2)
                else
                    AutoRaid = true
                    PullFruit = true

                    set1('Waiting For Dragon Claw Hit 300 Mastery')
                end
            end

            buyMelee('DragonClaw')
            set1('Waiting For Dragon Claw Hit 300 Mastery')
        end
        if eltrul['Dragon Claw'] > 299 and eltrul.Superhuman < 400 then
            buyMelee('Superhuman')
            set1('Waiting For Superhuman Hit 300 Mastery')
        end
        if eltrul.Superhuman > 399 and eltrul['Death Step'] < 400 then
            print('ok2')

            if eltrul['Black Leg'] >= 400 then
                if checkMelee('DeathStep') then
                    set1('Waiting For Death Step Hit 300 Mastery')
                    buyMelee('DeathStep')
                elseif getPlayerFragments() >= 5000 or (NameMelee() == 'Death Step' or checkMelee('DeathStep')) then
                    set1('Waiting For Player Beli Hit 3M+ [Death Step]')

                    if getPlayerBeli() > 3000000 then
                        buyMelee('DeathStep')
                    end
                else
                    AutoRaid = true
                    PullFruit = true
                end
            else
                buyMelee('BlackLeg')
                set1('Waiting For Black Leg Hit 300 Mastery')
            end
        end
        if eltrul['Death Step'] > 399 and eltrul['Sharkman Karate'] < 400 then
            if eltrul['Fishman Karate'] >= 400 then
                if checkMelee('SharkmanKarate') then
                    buyMelee('SharkmanKarate')
                    set1('Waiting For Sharkman Karare Hit 300 Mastery')
                elseif getPlayerFragments() >= 5000 then
                    set1('Waiting For Beli Hit 3M+ [Sharkman Karare]')

                    if getPlayerBeli() > 3000000 then
                        buyMelee('SharkmanKarate')
                    end
                else
                    AutoRaid = true

                    set1('Auto Raid Until Reach 5k Fragments')

                    PullFruit = true
                end
            else
                buyMelee('FishmanKarate')
                set1('Waiting For Fishman Karate Hit 300 Mastery')
            end
        end
        if eltrul['Sharkman Karate'] > 399 and eltrul['Electric Claw'] < 400 then
            if eltrul.Electro >= 400 then
                if not checkMelee('FishmanKarate') and getPlayerFragments() < 5000 then
                    AutoRaid = true
                    PullFruit = true
                end

                buyMelee('ElectricClaw')
                set1('Waiting For Player Beli Hit 3M+ [Electric Claw]')
            else
                buyMelee('Electro')
                set1('Waiting For Electro Hit 300 Mastery')
            end
        end
        if eltrul['Electric Claw'] > 399 and eltrul['Dragon Talon'] < 400 then
            if eltrul['Dragon Claw'] >= 400 then
                if checkMelee('DragonTalon') or getPlayerFragments() >= 5000 then
                    set1('Waiting For Dragon Talon Requirements [3M+ Beli / Fire Essence]')
                    buyMelee('DragonTalon')
                else
                    AutoRaid = true
                    PullFruit = true

                    set1('Auto Raiding Until Hit 5k Fragments [Dragon Talon]')
                end
            else
                set1('Waiting For Dragon Claw Hit 300 Mastery')
                buyMelee('DragonClaw')
            end
        end
        if eltrul.Superhuman > 399 and (eltrul['Death Step'] > 399 and (eltrul['Electric Claw'] > 399 and (eltrul['Dragon Talon'] > 399 and eltrul['Sharkman Karate'] > 399))) then
            if checkMelee('Godhuman') then
                if eltrul.Godhuman >= 400 then
                    local v858, v859, v860 = pairs(inv)

                    while true do
                        local v861

                        v860, v861 = v858(v859, v860)

                        if v860 == nil then
                            break
                        end
                        if v861.Type == 'Sword' then
                            mas = 0

                            local v862, v863, v864 = pairs(v861.MasteryRequirements)

                            while true do
                                local v865

                                v864, v865 = v862(v863, v864)

                                if v864 == nil then
                                    break
                                end

                                mas = tonumber(v865)
                            end

                            if v861.Mastery < mas then
                                forcewp = 'Sword'

                                if not checkitem2(v861.Name) then
                                    local v866 = {
                                        'LoadItem',
                                        v861.Name,
                                    }

                                    set1('Farming Mastery For ' .. v861.Name .. ' [' .. v861.Mastery .. '/' .. mas .. ']')
                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer(unpack(v866))
                                end

                                break
                            end
                        end
                    end
                else
                    buyMelee('Godhuman')
                end
            else
                buyMelee('ElectricClaw')

                if getPlayerFragments() < 5000 and not checkMelee('Godhuman') then
                    set1('Auto Raid Until Hit 5k Fragments [Godhuman]')

                    AutoRaid = true
                    PullFruit = true
                end

                set1('Waiting For Player Beli Hit 5M+ [Godhuman]')
                buyMelee('Godhuman')
            end
        end
    end
end)

local u867 = debug.getupvalues(require(game:GetService('Players').LocalPlayer.PlayerScripts:WaitForChild('CombatFramework')))[2]
local v868 = require(game:GetService('Players').LocalPlayer.PlayerScripts:WaitForChild('CombatFramework'))
local u869 = getupvalues(v868)[2]
local v870 = require(game:GetService('Players').LocalPlayer.PlayerScripts.CombatFramework.RigController)
local _ = getupvalues(v870)[2]

require(game.ReplicatedStorage.CombatFramework.RigLib)
tick()

function CameraShaker()
    task.spawn(function()
        local u871 = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)

        while wait() do
            pcall(function()
                u871.CameraShakeInstance.CameraShakeState.Inactive = 0
            end)
        end
    end)
end
function CurrentWeapon()
    local u872 = u869.activeController.blades[1]

    if not u872 then
        return game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool').Name
    end

    pcall(function()
        while u872.Parent ~= game.Players.LocalPlayer.Character do
            u872 = u872.Parent
        end
    end)

    return u872 or game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool').Name
end
function getAllBladeHitsPlayers(p873)
    Hits = {}

    local _LocalPlayer4 = game.Players.LocalPlayer
    local v875 = game:GetService('Workspace').Characters:GetChildren()

    for v876 = 1, #v875 do
        local v877 = v875[v876]

        Human = v877:FindFirstChildOfClass('Humanoid')

        if v877.Name ~= game.Players.LocalPlayer.Name then
            if Human then
                if Human.RootPart then
                    if Human.Health > 0 then
                        if _LocalPlayer4:DistanceFromCharacter(Human.RootPart.Position) < p873 + 5 then
                            table.insert(Hits, Human.RootPart)
                        end
                    end
                end
            end
        end
    end

    return Hits
end
function getAllBladeHits(p878)
    Hits = {}

    local _LocalPlayer5 = game.Players.LocalPlayer
    local v880 = game:GetService('Workspace').Enemies:GetChildren()

    for v881 = 1, #v880 do
        Human = v880[v881]:FindFirstChildOfClass('Humanoid')

        if Human then
            if Human.RootPart then
                if Human.Health > 0 then
                    if _LocalPlayer5:DistanceFromCharacter(Human.RootPart.Position) < p878 + 5 then
                        table.insert(Hits, Human.RootPart)
                    end
                end
            end
        end
    end

    return Hits
end

ReturnFunctions = {}

function CurrentWeapon()
    local u882 = u869.activeController.blades[1]

    if not u882 then
        return game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool').Name
    end

    pcall(function()
        while u882.Parent ~= game.Players.LocalPlayer.Character do
            u882 = u882.Parent
        end
    end)

    return u882 or game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool').Name
end
function getAllBladeHitsPlayers(p883)
    Hits = {}

    local _LocalPlayer6 = game.Players.LocalPlayer
    local v885 = game:GetService('Workspace').Characters:GetChildren()

    for v886 = 1, #v885 do
        local v887 = v885[v886]

        Human = v887:FindFirstChildOfClass('Humanoid')

        if v887.Name ~= game.Players.LocalPlayer.Name then
            if Human then
                if Human.RootPart then
                    if Human.Health > 0 then
                        if _LocalPlayer6:DistanceFromCharacter(Human.RootPart.Position) < p883 + 5 then
                            table.insert(Hits, Human.RootPart)
                        end
                    end
                end
            end
        end
    end

    return Hits
end
function lonmemaytofff(p888)
    Hits = {}

    local _LocalPlayer7 = game.Players.LocalPlayer
    local v890 = game:GetService('Workspace').Enemies:GetChildren()

    for v891 = 1, #v890 do
        Human = v890[v891]:FindFirstChildOfClass('Humanoid')

        if Human then
            if Human.RootPart then
                if Human.Health > 0 then
                    if Human.Health ~= Human.MaxHealth then
                        if _LocalPlayer7:DistanceFromCharacter(Human.RootPart.Position) < p888 + 5 then
                            table.insert(Hits, Human.RootPart)
                        end
                    end
                end
            end
        end
    end

    return Hits
end
function AttackFunctgggggion()
    pcall(function()
        if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
            return nil
        end

        local _activeController = u869.activeController

        _activeController.hitboxMagnitude = 55

        if _activeController and _activeController.equipped then
            for _ = 1, 1 do
                local v893 = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(game.Players.LocalPlayer.Character, {
                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                }, 60)

                if #v893 > 0 then
                    local u894 = debug.getupvalue(_activeController.attack, 5)
                    local u895 = debug.getupvalue(_activeController.attack, 6)
                    local u896 = debug.getupvalue(_activeController.attack, 4)
                    local v897 = debug.getupvalue(_activeController.attack, 7)
                    local u898 = (u894 * 798405 + u896 * 727595) % u895
                    local u899 = u896 * 798405

                    (function()
                        u898 = (u898 * u895 + u899) % 1099511627776
                        u894 = math.floor(u898 / u895)
                        u896 = u898 - u894 * u895
                    end)()

                    local v900 = v897 + 1

                    debug.setupvalue(_activeController.attack, 5, u894)
                    debug.setupvalue(_activeController.attack, 6, u895)
                    debug.setupvalue(_activeController.attack, 4, u896)
                    debug.setupvalue(_activeController.attack, 7, v900)

                    local v901, v902, v903 = pairs(_activeController.animator.anims.basic)
                    local v904 = u898

                    while true do
                        local v905

                        v903, v905 = v901(v902, v903)

                        if v903 == nil then
                            break
                        end

                        v905:Play()
                    end

                    if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool') and (_activeController.blades and _activeController.blades[1]) then
                        game:GetService('ReplicatedStorage').RigControllerEvent:FireServer('weaponChange', tostring(CurrentWeapon()))
                        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(v904 / 1099511627776 * 16777215), v900 + 1)
                        game:GetService('ReplicatedStorage').RigControllerEvent:FireServer('hit', v893, 2, '')
                    end
                end
            end
        end
    end)
end

spawn(function()
    while task.wait(c().Misc['Fast Attack Delay']) do
        pcall(function()
            AttackFunctgggggion()

            ot = tick()

            if u867.activeController then
                u867.activeController.timeToNextAttack = math.huge
                u867.activeController.focusStart = 0
                u867.activeController.hitboxMagnitude = 120
                u867.activeController.humanoid.AutoRotate = true
                u867.activeController.increment = 2
            end
        end)
    end
end)
game:GetService('CoreGui').RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(p906)
    if p906.Name == 'ErrorPrompt' and p906:FindFirstChild('MessageArea') and p906.MessageArea:FindFirstChild('ErrorFrame') then
        print([[Unique | Rejoin! omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg skidded omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg omg ]])
        game:GetService('TeleportService'):Teleport(game.PlaceId)
    end
end)
spawn(function()
    local v907 = getrawmetatable(game)
    local ___namecall = v907.__namecall

    setreadonly(v907, false)

    v907.__namecall = newcclosure(function(...)
        local v909 = getnamecallmethod()
        local v910 = {...}

        if tostring(v909) ~= 'FireServer' or (tostring(v910[1]) ~= 'RemoteEvent' or (tostring(v910[2]) == 'true' or (tostring(v910[2]) == 'false' or not dmlockskill))) then
            return ___namecall(...)
        end

        v910[2] = dmlockskill

        return ___namecall(unpack(v910))
    end)
end)