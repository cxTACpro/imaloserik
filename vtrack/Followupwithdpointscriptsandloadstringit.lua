local lastExecutedId = 0
local localid = "192.168.109.1"
local lastPollTime = 0
local POLL_INTERVAL = 0.01
local isExecuting = false
local printCooldown = 0

-- HttpGet with multiple fallbacks
local function httpGet(url)
    local suc, res
    
    -- Try syn.request (Krnl, Synapse, etc.)
    if syn and syn.request then
        suc, res = pcall(syn.request, {Url = url, Method = "GET"})
        if suc and res then return res.Body end
    end
    
    -- Try http.request (some executors)
    if http and http.request then
        suc, res = pcall(http.request, url)
        if suc and res then return res end
    end
    
    -- Try game.HttpGet (Roblox built-in)
    suc, res = pcall(game.HttpGet, game, url)
    if suc and res then return res end
    
    return nil
end

-- Get the latest script ID from server
local function getLastId()
    local res = httpGet("http://" .. localid .. ":2006/dpoint?i=last")
    if res then
        local ok, data = pcall(game.HttpService.JSONDecode, game:GetService("HttpService"), res)
        if ok and data then
            return data.last_id
        end
    end
    return nil
end

-- Fetch a specific script by ID
local function fetchScript(id)
    local res = httpGet("http://" .. localid .. ":2006/dpoint?i=" .. id)
    if res then
        -- Remove the {$id} prefix if it exists
        local prefix = "{$" .. id .. "}"
        if res:sub(1, #prefix) == prefix then
            return res:sub(#prefix + 1)
        end
        return res
    end
    return nil
end

local function executeScript(content, id)
    if not content or #content == 0 then return false end
    local ok, err = pcall(loadstring, content)
    if ok then
        local suc, execErr = pcall(err)
        if not suc then print("Script #" .. id .. " err: " .. tostring(execErr)) end
    else
        error(err)
    end
end

print("Executor started | " .. localid .. ":2006 | " .. POLL_INTERVAL .. "s poll")

getgenv().hbFunc = function(deltaTime)
    if isExecuting then return end
    lastPollTime = lastPollTime + deltaTime
    if lastPollTime >= POLL_INTERVAL then
        isExecuting = true
        lastPollTime = 0
        local lastId = getLastId()
        if lastId and lastId > lastExecutedId then
            for i = lastExecutedId + 1, lastId do
                local content = fetchScript(i)
                if content then executeScript(content, i) end
            end
            lastExecutedId = lastId
        end
        isExecuting = false
    end
end
if not hbConnected12312 then
game:GetService("RunService").Heartbeat:Connect(hbFunc)
end
getgenv().hbConnected12312 = true
