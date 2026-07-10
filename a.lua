local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/cxTACpro/imaloserik/refs/heads/main/FifaModule.lua"))()
local nextChest
local notif = game:GetService("StarterGui")

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