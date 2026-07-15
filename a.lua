repeat wait() until game:IsLoaded()
local module = loadstring(game:HttpGet("http://192.168.109.1:8080/FifaModule.lua"))()
local CollectionService = game:GetService("CollectionService")
local nextChest
local notif = game:GetService("StarterGui")
local _=CollectionService:GetTagged("_ChestTagged")
local chests = {}
for i,v in pairs(_) do
   if v:FindFirstChildWhichIsA("TouchTransmitter") then
      chests[v] = v
   end
end
for i,v in next, workspace.ChestModels:GetChildren() do
   if v:FindFirstChildWhichIsA("TouchTransmitter") then
      chests[v] = v.RootPart
   end
end
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour

local FileSuccess = pcall(function()
   AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServersssssssssssssssssssssssssssssssssssssss.json"))
end)
if not FileSuccess then
   table.insert(AllIDs, actualHour)
   writefile("NotSameServersssssssssssssssssssssssssssssssssssssss.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
local function TPReturner()
   local Site
   if foundAnything == "" then
      Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
   else
      Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
   end
   local ID = ""
   if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
      foundAnything = Site.nextPageCursor
   end
   local num = 0
   for i, v in pairs(Site.data) do
      local Possible = true
      ID = tostring(v.id)
      if tonumber(v.maxPlayers) > tonumber(v.playing) then
         for _, Existing in pairs(AllIDs) do
            if num ~= 0 then
               if ID == tostring(Existing) then
                  Possible = false
               end
            else
               if tonumber(actualHour) ~= tonumber(Existing) then
                  local delFile = pcall(function()
                     delfile("NotSameServersssssssssssssssssssssssssssssssssssssss.json")
                     AllIDs = {}
                     table.insert(AllIDs, actualHour)
                  end)
               end
            end
            num = num + 1
         end
         if Possible == true then
            table.insert(AllIDs, ID)
            wait()
            pcall(function()
               writefile("NotSameServersssssssssssssssssssssssssssssssssssssss.json", game:GetService('HttpService'):JSONEncode(AllIDs))
               wait()
               game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer("teleport", ID)
            end)
            wait(3.7)
         end
      end
   end
end
local function ServerHop()
   task.spawn(function()
      while task.wait() do
         pcall(function()
            TPReturner()
            if foundAnything ~= "" then
               TPReturner()
            end
         end)
      end
   end)
end
function tpChest(c)
   local char  = Player.Character or Player.CharacterAdded:Wait()
   local hrp = char:FindFirstChild("HumanoidRootPart")
   if c and not module.playerHas(nil,"Fist of Darkness") then
      char.Humanoid.Sit = false
      module.VG.Tween(hrp,c,300,Vector3.new(0,1,0),true)
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
wait(4)
while true do
   wait()
   CCcount = 0
   for i,v in next, chests do
      CCcount += 1
   end
   if CCcount == 0 and not module.playerHas(nil,"Fist of Darkness") then
      print("C collector: No chests found, hopping server...")
      notif:SetCore("SendNotification", {Title="Chest Collector", Text="No chests found, hopping server...", Duration=3})
      ServerHop()
      break
   end
   local ok,err = pcall(tpChest,nextChest)
   if err then
      print("C collector:",err)
      notif:SetCore("SendNotification", {Title="Chest Error", Text=tostring(err), Duration=3})
   end
   if module.playerHas(nil,"Fist of Darkness") then
      print("C collector: Fist of Darkness found, stopping.")
      notif:SetCore("SendNotification", {Title="Chest Collector", Text="Fist of Darkness found, stopping", Duration=5})
      break
   end
end