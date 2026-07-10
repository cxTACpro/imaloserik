local PERSIST_FILE = "persisted_script.luau"
local PERSIST_PREFIX = "\x02LSPERSIST\x03"

local function deletePersisted()
    pcall(function() delfile(PERSIST_FILE) end)
end

local function saveScript(content)
    pcall(function() writefile(PERSIST_FILE, content) end)
end

local function runPersistRef(msg)
    local _, _, path = msg:find("^" .. PERSIST_PREFIX .. "(.*)$")
    if path and #path > 0 then
        local ok, content = pcall(function() return readfile(path) end)
        if ok then
            local fn, err = loadstring(content)
            if fn then
                pcall(fn)
            end
        end
    end
end

local ws = WebSocket.connect("ws://192.168.109.1:2004")

ws.OnMessage:Connect(function(message)
    if message:sub(1, #PERSIST_PREFIX) == PERSIST_PREFIX then
        runPersistRef(message)
        return
    end

    deletePersisted()
    saveScript(message)

    local escPath = PERSIST_FILE:gsub("\\", "\\\\"):gsub('"', '\\"')
    ws:Send(PERSIST_PREFIX .. escPath)

    local fn, err = loadstring(message)
    if not fn then
        warn("Loadstring error:", err)
        return
    end
    local ok, result = pcall(fn)
    if not ok then
        warn("Execution error:", result)
    elseif result ~= nil then
        print("Result:", result)
    end
end)

print("WebSocket client connected with persistence")
