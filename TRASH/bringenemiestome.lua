local FFM = loadstring(game:HttpGet("http://192.168.109.1:8081/FifaModule.lua"))()
FFM.VG.AntiAdonis()
getgenv().jd = function()
        for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            local enemyHumanoidRootPart = enemy:FindFirstChild("HumanoidRootPart")
            if enemyHumanoidRootPart and enemyHumanoidRootPart.ReceiveAge == 0 then
                enemy.Humanoid.Health = 0
                enemy.Humanoid.WalkSpeed = 0
            end
        end
    end
while wait(0.1) do
    pcall(getgenv().jd)
end