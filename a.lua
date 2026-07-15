local desiredTeam = "Marines"
repeat wait(1) until game:IsLoaded()
task.spawn(function() while task.wait(1) do pcall(function() if not Player.Team or Player.Team.Name ~= desiredTeam then ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam2", desiredTeam) end end) end end)

local module = loadstring(game:HttpGet("http://192.168.109.1:8080/FifaModule.lua"))()
local WindUI_OK, WindUI = pcall(function() return loadstring(game:HttpGet("http://192.168.109.1:8080/main.lua"))() end)
local chestCount, w
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local CollectionService = game:GetService("CollectionService")
local notif = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local nextChest = nil
local chests = {}
local enabled = true
local noclip = true
local currentTween = nil

local _ = CollectionService:GetTagged("_ChestTagged") or CollectionService:GetTagged("WorldChest")
for i, v in pairs(_) do
   if v:FindFirstChildWhichIsA("TouchTransmitter") and v:IsDescendantOf(workspace) then
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
      if currentTween then currentTween:Cancel() end
      if (hrp.Position - c.Position).Magnitude < 20 then hrp.CFrame = CFrame.new(c.Position + Vector3.new(0,1,0)) else char.Humanoid.Sit = false; currentTween = module.VG.Tween(hrp, c, 220, Vector3.new(0,1,0), true) end
      chests[c] = nil
   end
   nextChest = module.VG.GetNearestXToBasePart(hrp, chests)
end

task.spawn(function() while task.wait(1) do pcall(function() if not Player.Team or Player.Team.Name ~= desiredTeam then ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", desiredTeam) end end) end end)

if WindUI_OK then
   w = WindUI:CreateWindow({
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

   local enabledToggle = cfg:Toggle({
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
         if currentTween then currentTween:Cancel() currentTween = nil end
         enabledToggle:Set(false)
      end,
   })

   cfg:Button({
      Title = "Enable Tween",
      Desc = "Instantly enable the tween",
      Callback = function()
         enabled = true
         enabledToggle:Set(true)
      end,
   })

   chestCount = main:ProgressBar({
      Title = "Chests Found",
      Value = { Min = 0, Max = 86, Default = 0 },
      DisplayMode = "Value",
      ShowValue = true,
      Width = 90,
   })

   main:Toggle({
      Title = "Noclip",
      Desc = "Walk through walls",
      Value = true,
      Callback = function(v)
         noclip = v
      end,
      Flag = "noclip",
   })

   local teamSec = main:Section({
      Title = "Team",
      Box = true,
      Opened = true,
   })

   teamSec:Button({
      Title = "Set Pirate Team",
      Desc = "Switch to Pirates",
      Callback = function()
         desiredTeam = "Pirates"
         pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", "Pirates") end)
      end,
   })

   teamSec:Button({
      Title = "Set Marine Team",
      Desc = "Switch to Marines",
      Callback = function()
         desiredTeam = "Marines"
         pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", "Marines") end)
      end,
   })
end

local SG = Instance.new("ScreenGui")
SG.Name = "ChestToggle"
SG.ResetOnSpawn = false
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SG.Parent = Player:WaitForChild("PlayerGui")

local toggleBtn = Instance.new("ImageButton")
toggleBtn.Size = UDim2.fromOffset(50, 50)
toggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleBtn.BackgroundTransparency = 0.3
toggleBtn.Image = "rbxassetid://4679349813"
toggleBtn.ImageColor3 = Color3.fromRGB(255, 200, 200)
toggleBtn.AutoButtonColor = false
toggleBtn.Parent = SG

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = toggleBtn

local btnStroke = Instance.new("UIStroke")
btnStroke.Color = Color3.fromRGB(60, 60, 60)
btnStroke.Thickness = 1.5
btnStroke.Parent = toggleBtn

local dragging, dragStart, startPos
toggleBtn.InputBegan:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
      dragging = true
      dragStart = input.Position
      startPos = toggleBtn.Position
   end
end)
toggleBtn.InputChanged:Connect(function(input)
   if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
      local delta = input.Position - dragStart
      toggleBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
   end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
      dragging = false
   end
end)

toggleBtn.MouseButton1Click:Connect(function()
   if WindUI_OK and w then
      w:Toggle()
   end
end)

task.spawn(function()
   while task.wait() do
      pcall(function()
         if noclip then
            local char = Player.Character
            if char then
               for _, v in pairs(char:GetDescendants()) do
                  if v:IsA("BasePart") then
                     v.CanCollide = false
                  end
               end
            end
         end
      end)
   end
end)

wait(4)

while true do
   wait()
   local CCcount = 0
   for i, v in next, chests do
      CCcount += 1
   end
   if WindUI_OK then chestCount:Set(CCcount) end
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
