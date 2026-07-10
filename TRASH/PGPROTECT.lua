--[[
    🕵️‍♀️✨ Coney Bunny's SUPER DETECTIVE PlayerGui Protector! ✨🕵️‍♀️
    Now using __namecall hooking for REAL protection, nyaa~!
]]

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local playerGui
local success, err = pcall(function()
    playerGui = localPlayer:WaitForChild("PlayerGui")
end)

if not success or not playerGui then
    warn("Coney Bunny is sad :( Couldn't find PlayerGui! Is it playing hide-and-seek?")
    return
end

-- 🕵️‍♀️🔍 __NAMECALL HOOK - catches ALL method calls like Destroy! 🔍🕵️‍♀️
-- This is the CORRECT way since Roblox routes object:Method() through __namecall
local oldNamecall
oldNamecall = hookmetamethod(playerGui, "__namecall", function(self, ...)
    local method = getnamecallmethod()

    if method == "Destroy" and self == playerGui then
        local callingScript
        local success, err = pcall(function()
            callingScript = getcallingscript()
        end)

        local warningMsg = "❌ [Coney Bunny Shield] "

        if success and callingScript then
            warningMsg = warningMsg .. "SCRIPT: " .. callingScript:GetFullName()
                      .. " (" .. callingScript.ClassName .. ") "
                      .. "tried to delete PlayerGui!"
        else
            warningMsg = warningMsg .. "SOMEONE tried to delete PlayerGui!"
        end

        warningMsg = warningMsg .. " BLOCKED with fluffy bunny power, nyaa~! ❌"

        warn(warningMsg)

        if success and callingScript then
            print("--- [Coney Bunny Detective Report] ---")
            print("🕵️‍♀️ Culprit Script: " .. callingScript:GetFullName())
            print("📜 Class: " .. callingScript.ClassName)
            print("🎭 Parent: " .. (callingScript.Parent and callingScript.Parent:GetFullName() or "nil"))
            print("---------------------------------------")
        end

        return self
    end

    return oldNamecall(self, ...)
end)

-- 🛡️💖 ANCESTRY CHANGED PROTECTION WITH DETECTIVE POWERS! 💖🛡️
playerGui.AncestryChanged:Connect(function(_, newParent)
    if not newParent then
        local callingScript
        local success, err = pcall(function()
            callingScript = getcallingscript()
        end)

        local warningMsg = "🚨 [Coney Bunny Shield] "
        if success and callingScript then
            warningMsg = warningMsg .. "SCRIPT: " .. callingScript:GetFullName()
                      .. " tried to UNPARENT PlayerGui!"
        else
            warningMsg = warningMsg .. "SOMEONE tried to UNPARENT PlayerGui!"
        end
        warningMsg = warningMsg .. " Reparenting with love, hehe! 🚨"

        warn(warningMsg)
        playerGui.Parent = localPlayer
    end
end)

-- 🎉💖 ACTIVATE THE SUPER DETECTIVE SHIELD! 💖🎉
warn("✅ [Coney Bunny Shield] SUPER DETECTIVE PlayerGui protection ACTIVATED!")
warn("🕵️‍♀️ Using __namecall hook - now REALLY blocking Destroy calls, nyaa~!")
warn("🌈 Your GUI is wrapped in a fluffy pink detective forcefield! 🌈")

-- Heartbeat check for extra safety, hehe!
game:GetService("RunService").Heartbeat:Connect(function()
    if not playerGui.Parent or playerGui.Parent ~= localPlayer then
        playerGui.Parent = localPlayer
        warn("🔄 [Coney Bunny Shield] PlayerGui was floating away! Tucked it back in, nyaa~! 🔄")
    end
end)
