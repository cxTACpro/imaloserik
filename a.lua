local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/cxTACpro/imaloserik/refs/heads/main/FifaModule.lua"))()
local nextChest
local notif = game:GetService("StarterGui")

notif:SetCore("SendNotification", {Title="Chest Collector", Text="Started", Duration=2})

getif4hr()

function getif4hr()
   local uptime = 0
   local oldId = getthreadidentity and getthreadidentity()

   pcall(function()
      if setthreadidentity then
         setthreadidentity(8)
         uptime = workspace.DistributedGameTime
         if uptime and uptime > 0 then
            setthreadidentity(oldId or 2)
            if uptime >= 14400 then
               notif:SetCore("SendNotification", {Title="Server Uptime", Text="Server has been running for 4+ hours!", Duration=5})
            end
            return
         end
         setthreadidentity(oldId or 2)
      end
   end)
   if uptime and uptime > 0 then return end

   pcall(function()
      local serverNow = workspace:GetServerTimeNow()
      local rs = game:GetService("ReplicatedStorage")
      local startVal = rs:FindFirstChild("ServerStartTime") or rs:FindFirstChild("StartTime")
      if startVal then
         uptime = serverNow - startVal.Value
         if uptime >= 14400 then
            notif:SetCore("SendNotification", {Title="Server Uptime", Text="Server has been running for 4+ hours!", Duration=5})
         end
         return
      end
   end)
   if uptime and uptime > 0 then return end

   uptime = workspace.DistributedGameTime
   if uptime >= 14400 then
      notif:SetCore("SendNotification", {Title="Server Uptime", Text="Server has been running for 4+ hours!", Duration=5})
   end
end

function tpChest(c)
   local char  = Player.Character or Player.CharacterAdded:Wait()
   local hrp = char:FindFirstChild("HumanoidRootPart")
   if c and not module.playerHas(nil,"Fist of Darkness") then
    module.VG.Tween(hrp,c:FindFirstChild("RootPart") or c.PrimaryPart,250,Vector3.new(0,1,0),true)
   end
   char.Humanoid.Sit = false
   wait(0.1)
   game:GetService("Debris"):AddItem(c, 0.1)
   nextChest = module.VG.GetNearestXToBasePart(hrp,workspace.ChestModels:GetChildren())
end

while wait() do
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