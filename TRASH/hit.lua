local notableModules = {
    game:GetService("ReplicatedStorage").ClientComponents.WeaponToolClient,
    game:GetService("ReplicatedStorage").Modules.Net,
    game:GetService("ReplicatedStorage").Controllers.CombatController,
    game:GetService("ReplicatedStorage").Modules.CombatUtil
}
-- below is a hookfunction with Logger for any function in a module ; it includes arguments.
do
    local ModuleTable = require(game:GetService("ReplicatedStorage").Controllers.CombatController)
    local function parseLogValue(val)
        local t = typeof(val)
        if t == "string" then
            return '"' .. val .. '"'
        elseif t == "Instance" then
            return val:GetFullName() .. " (" .. val.ClassName .. ")"
        elseif t == "Vector3" or t == "Vector2" then
            return t .. "(" .. tostring(val) .. ")"
        elseif t == "CFrame" then
            return "CFrame(Position: " .. tostring(val.Position) .. ")"
        elseif t == "table" then
            -- Safely represent simple tables or fall back to native formatting
            local success, result = pcall(function()
                local items = {}
                for k, v in pairs(val) do
                    table.insert(items, tostring(k) .. ": " .. typeof(v))
                end
                return "Table {" .. table.concat(items, ", ") .. "}"
            end)
            return success and result or "Table (complex/cyclic)"
        else
            return tostring(val) .. " (" .. t .. ")"
        end
    end
    local oldAttack
    oldAttack = hookfunction(ModuleTable.Attack, function(...)
        local args = {...}
        local callingScript = getcallingscript()
        local scriptName = callingScript and callingScript:GetFullName() or "Unknown"
        
        -- Header log
        print("--------------------------------------------------")
        print("[LOGGER] " .. scriptName .. " called Attack()!")
        
        -- Detailed Argument Breakdown
        if #args == 0 then
            print("  Arguments: None")
        else
            print("  Arguments (" .. #args .. "):")
            for index, value in ipairs(args) do
                print(string.format("    [%d] %s", index, parseLogValue(value)))
            end
        end
        print("--------------------------------------------------")
        
        -- Run the original function cleanly
        return oldAttack(...)
    end)
    print("Successfully hooked Attack directly with deep argument logging!")
end
