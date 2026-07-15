repeat wait() until game:IsLoaded()
local module = loadstring(game:HttpGet("http://192.168.109.1:8080/FifaModule.lua"))()
local WindUI = loadstring(game:HttpGet("http://192.168.109.1:8080/main.lua"))()

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local CollectionService = game:GetService("CollectionService")
local notif = game:GetService("StarterGui")

local nextChest = nil
local chests = {}
local enabled = true

local _ = CollectionService:GetTagged("_ChestTagged") or CollectionService:GetTagged("WorldChest")
for i, v in pairs(_) do
   if v:FindFirstChildWhichIsA("TouchTransmitter") and v:IsDescendantOf("workspace") then
      chests[v] = v
   end
end
for i, v in next, workspace.ChestModels:GetChildren() do
   if v:FindFirstChildWhichIsA("TouchTransmitter") then
      chests[v] = v.RootPart
   end
end

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour

local FileSuccess = pcall(function()
   AllIDs = game:GetService('HttpService'):JSONDecode(readfile("Lb2as143.json"))
end)
if not FileSuccess then
   table.insert(AllIDs, actualHour)
   writefile("Lb2as143.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end

local function TPReturner()
   local Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/'..PlaceID..'/servers/Public?sortOrder=Asc&limit=100'..(foundAnything~="" and '&cursor='..foundAnything or "")))
   foundAnything = Site.nextPageCursor or ""
   for i,v in pairs(Site.data) do if tonumber(v.maxPlayers)>tonumber(v.playing) then local ID, Possible = tostring(v.id), true for _,Existing in pairs(AllIDs) do if ID==tostring(Existing) then Possible = false end end if Possible then table.insert(AllIDs, ID) wait() pcall(function() writefile("Lb2as143.json", game:GetService('HttpService'):JSONEncode(AllIDs)) wait() game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer("teleport", ID) end) wait(3.7) end end end
end
local function ServerHop()
   task.spawn(function() while task.wait() do pcall(function() TPReturner() if foundAnything ~= "" then TPReturner() end end) end end)
end

function tpChest(c)
   local char = Player.Character or Player.CharacterAdded:Wait()
   local hrp = char:FindFirstChild("HumanoidRootPart")
   if c and enabled and not module.playerHas(nil,"Fist of Darkness") then
      char.Humanoid.Sit = false
      module.VG.Tween(hrp, c, 300, Vector3.new(0,1,0), true)
      if chests[c] then
         chests[c] = nil
      end
   end
   nextChest = module.VG.GetNearestXToBasePart(hrp, chests)
end

task.spawn(function()
   pcall(function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
   end)
end)

-- GUI
local w = WindUI:CreateWindow({
   Title = "Chest Collector",
   Author = "by you",
   Folder = "ChestCollector",
   Size = UDim2.new(0, 500, 0, 400),
   MinSize = Vector2.new(400, 300),
   MaxSize = Vector2.new(700, 500),
   SideBarWidth = 160,
   NewElements = true,
   HideSearchBar = true,
   Resizable = true,
   Theme = "Dark",
})

local main = w:Tab({
   Title = "Main",
   Icon = "lucide:sword",
   ShowTabTitle = true,
})

local cfg = main:Section({
   Title = "Controls",
   Box = true,
   Opened = true,
})

cfg:Toggle({
   Title = "Enabled",
   Desc = "Enable or disable chest tweening",
   Value = true,
   Callback = function(v)
      enabled = v
   end,
   Flag = "enabled",
})

cfg:Button({
   Title = "Disable Tween",
   Desc = "Instantly disable the tween",
   Callback = function()
      enabled = false
   end,
})

cfg:Button({
   Title = "Enable Tween",
   Desc = "Instantly enable the tween",
   Callback = function()
      enabled = true
   end,
})

local chestCount = main:ProgressBar({
   Title = "Chests Found",
   Value = { Min = 0, Max = 100, Default = 0 },
   DisplayMode = "Value",
   ShowValue = true,
   Width = 160,
})

wait(4)

while true do
   wait()
   local CCcount = 0
   for i, v in next, chests do
      CCcount += 1
   end
   chestCount:Set(CCcount)
   if CCcount == 0 and not module.playerHas(nil,"Fist of Darkness") then
      if enabled then
         print("C collector: No chests found, hopping server...")
         notif:SetCore("SendNotification", {Title="Chest Collector", Text="No chests found, hopping server...", Duration=3})
         ServerHop()
         break
      end
   end
   if enabled then
      local ok, err = pcall(tpChest, nextChest)
      if err then
         print("C collector:", err)
         notif:SetCore("SendNotification", {Title="Chest Error", Text=tostring(err), Duration=3})
      end
   end
   if module.playerHas(nil,"Fist of Darkness") then
      print("C collector: Fist of Darkness found, stopping.")
      notif:SetCore("SendNotification", {Title="Chest Collector", Text="Fist of Darkness found, stopping", Duration=5})
      break
   end
end
