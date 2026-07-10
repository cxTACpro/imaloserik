getgenv().c232ounter = 0
HERE_PLAYERNAME=game.Players.LocalPlayer.Name
game:GetService("RunService").RenderStepped:Connect(function(delta)
    if workspace.Characters[HERE_PLAYERNAME].RaceTransformed.Value == true then
        getgenv().c232ounter = getgenv().c232ounter + delta
    end
end)
while wait(1) do
warn(getgenv().c232ounter.."ok2")
end

getgenv().aASDSA = true
while getgenv().aASDSA do
    local url = "http://192.168.109.1:3000/number?s=" .. tostring(getgenv().c232ounter / 60)
    local response = game:HttpGet(url)
    task.wait()
end