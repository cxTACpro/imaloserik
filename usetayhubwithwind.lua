--[[
    usetayhubwithwind.lua
    Drop-in replacement for Tay UI – uses WindUI from local main.lua.
]]

-- Load WindUI (try local main.lua via readfile, then HTTP fallback)
local loadSuccess, WindUI = pcall(function()
    if type(readfile) == "function" and isfile and isfile("main.lua") then
        return loadstring(readfile("main.lua"))()
    end
    return loadstring(game:HttpGet("http://192.168.109.1:8080/main.lua", true))()
end)
if not loadSuccess then
    error("Failed to load WindUI: " .. tostring(WindUI))
end

-- Icon helpers
local iconMap = {
    settings = "settings", home = "home", user = "user", users = "users",
    key = "key", copy = "copy", check = "check", x = "x",
    search = "search", folder = "folder", file = "file",
    download = "download", upload = "upload", trash = "trash-2",
    plus = "plus", minus = "minus", edit = "edit", delete = "trash-2",
    lock = "lock", unlock = "unlock", arrowright = "arrow-right",
    arrowleft = "arrow-left", arrowup = "arrow-up", arrowdown = "arrow-down",
    chevronright = "chevron-right", chevronleft = "chevron-left",
    chevronup = "chevron-up", chevrondown = "chevron-down",
    discord = "discord",
    ["lucide:settings"] = "settings",
}

local function getIcon(name)
    if not name or name == "" then return "" end
    if name:find("rbxassetid://") or name:find("http") then return name end
    return iconMap[name] or name
end

-- helpers for hub's naming conventions
local function getName(cfg)
    return cfg.Name or cfg[1] or cfg.Title or ""
end

local function getCallback(cfg, idx)
    return cfg.Callback or cfg[idx] or function() end
end

local function getDefault(cfg)
    return cfg.Default or cfg[3] or false
end

-- State
local Window = nil
local CurrentTab = nil
local Tabs = {}

local redzlib = {
    Themes = { KW = {} },
    Info = { Version = "1.0" },
    Save = { UISize = {570, 400}, TabSize = 180, Theme = "KW" },
    Icons = iconMap,
}

-- === Window ===
function redzlib:MakeWindow(cfg)
    local title = cfg.Title or cfg[1] or "Tac Hub"
    local sub = cfg.SubTitle or cfg[2] or "by Tùng dz"
    local folder = cfg.SaveFolder or cfg[3] or "TacHub"

    Window = WindUI:CreateWindow({
        Title = title,
        Author = sub,
        Folder = folder,
        Size = UDim2.new(0, 570, 0, 400),
        MinSize = Vector2.new(430, 350),
        MaxSize = Vector2.new(850, 560),
        SideBarWidth = 180,
        NewElements = true,
        HideSearchBar = true,
        ScrollBarEnabled = true,
        Resizable = true,
        Icon = "rbxassetid://3778225",
        IconSize = 22,
        IconThemed = true,
    })

    return {
        MakeTab = function(tc) return redzlib:MakeTab(tc) end,
        SetTheme = function(t) return redzlib:SetTheme(t) end,
        SetScale = function(s) return redzlib:SetScale(s) end,
        GetIcon = getIcon,
        Dialog = function(d) return Window:Dialog(d) end,
        SelectTab = function(idx) Window:SelectTab(idx) end,
        Minimize = function() Window:Toggle() end,
    }
end

-- === Tab ===
function redzlib:MakeTab(cfg)
    local tab = Window:Tab({
        Title = cfg.Title or cfg[1] or "Tab",
        Icon = getIcon(cfg.Icon or cfg[2] or ""),
        ShowTabTitle = true,
    })
    CurrentTab = tab
    table.insert(Tabs, tab)

    return {
        Tab = tab,
        AddDiscordInvite = function(d) return redzlib:AddDiscordInvite(d) end,
        AddParagraph = function(p) return redzlib:AddParagraph(p) end,
        AddSection = function(s) return redzlib:AddSection(s) end,
        AddButton = function(b) return redzlib:AddButton(b) end,
        AddToggle = function(t) return redzlib:AddToggle(t) end,
        AddDropdown = function(d) return redzlib:AddDropdown(d) end,
        AddSlider = function(s) return redzlib:AddSlider(s) end,
        AddTextBox = function(t) return redzlib:AddTextBox(t) end,
        Enable = function() Window:SelectTab(#Tabs) end,
        Disable = function() tab.UIElements.Main.Visible = false end,
        Destroy = function() tab.UIElements.Main:Destroy() end,
    }
end

-- === Section (accepts string or table) ===
function redzlib:AddSection(cfg)
    local title
    if type(cfg) == "string" then
        title = cfg
    else
        title = cfg.Title or cfg[1] or "Section"
    end
    local section = CurrentTab:Section({
        Title = title,
        Box = true,
        Opened = true,
        Expandable = true,
    })
    return {
        Visible = function(v) section.ElementFrame.Visible = v end,
        Destroy = function() section:Destroy() end,
        Set = function(t) section:SetTitle(t) end,
    }
end

-- === Discord Invite ===
function redzlib:AddDiscordInvite(cfg)
    local title = cfg.Name or cfg.Title or cfg[1] or "Discord"
    local desc = cfg.Description or cfg.Desc or cfg[2] or ""
    local invite = cfg.Invite or cfg[3] or ""
    local tag = CurrentTab:Tag({
        Title = title .. " | " .. invite,
        Icon = "discord",
        Color = Color3.fromHex("#5865F2"),
        Radius = 999,
    })
    if tag and tag.TagFrame then
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text = ""
        btn.Parent = tag.TagFrame
        btn.MouseButton1Click:Connect(function()
            if setclipboard then setclipboard(invite) end
        end)
    end
    return {
        Visible = function(v) if tag and tag.TagFrame then tag.TagFrame.Visible = v end end,
        Destroy = function() if tag then tag:Destroy() end end,
        SetDesc = function(d) if tag then tag:SetTitle(d) end end,
    }
end

-- === Paragraph ===
function redzlib:AddParagraph(cfg)
    local para = CurrentTab:Paragraph({
        Title = cfg.Title or cfg[1] or "Paragraph",
        Desc = cfg.Desc or cfg.Text or cfg[2] or "",
    })
    return {
        Visible = function(v) para.ElementFrame.Visible = v end,
        Destroy = function() para:Destroy() end,
        SetTitle = function(t) para:SetTitle(t) end,
        SetDesc = function(d) para:SetDesc(d) end,
        Set = function(t, d)
            if t then para:SetTitle(t) end
            if d then para:SetDesc(d) end
        end,
    }
end

-- === Button (hub uses Name, not Title) ===
function redzlib:AddButton(cfg)
    local btn = CurrentTab:Button({
        Title = getName(cfg),
        Desc = cfg.Desc or cfg.Description or "",
        Icon = "mouse-pointer-click",
        Justify = "Between",
        Callback = getCallback(cfg, 2),
    })
    return {
        Visible = function(v) btn.ElementFrame.Visible = v end,
        Destroy = function() btn:Destroy() end,
        Callback = function(f) btn.Callback = f end,
        Set = function(t, d)
            if t then btn:SetTitle(t) end
            if d then btn:SetDesc(d) end
        end,
    }
end

-- === Toggle (hub uses Name, sometimes Title) ===
function redzlib:AddToggle(cfg)
    local toggle = CurrentTab:Toggle({
        Title = getName(cfg),
        Desc = cfg.Desc or cfg.Description or "",
        Value = getDefault(cfg),
        Type = "Toggle",
        Callback = function(v)
            if cfg[4] then _G[cfg[4]] = v end
            getCallback(cfg, 3)(v)
        end,
    })
    return {
        Visible = function(v) toggle.ElementFrame.Visible = v end,
        Destroy = function() toggle:Destroy() end,
        Callback = function(f) toggle.Callback = f end,
        Set = function(v) toggle:Set(v) end,
        Get = function() return toggle.Value end,
    }
end

-- === Dropdown (hub uses Name) ===
function redzlib:AddDropdown(cfg)
    local opts = {}
    for _, o in ipairs(cfg.Options or cfg[2] or {}) do
        table.insert(opts, { Title = tostring(o), Desc = "", Icon = "" })
    end
    local dd = CurrentTab:Dropdown({
        Title = getName(cfg),
        Desc = cfg.Desc or cfg.Description or "",
        Values = opts,
        Value = cfg.Default or cfg[3] or (opts[1] and opts[1].Title) or "",
        Multi = cfg.Multi or cfg.MultiSelect or false,
        Callback = function(v)
            if cfg[5] then _G[cfg[5]] = v end
            getCallback(cfg, 4)(v)
        end,
    })
    return {
        Visible = function(v) dd.ElementFrame.Visible = v end,
        Destroy = function() dd:Destroy() end,
        Callback = function(f) dd.Callback = f end,
        Select = function(v) dd:Select(v) end,
        Refresh = function(newOpts)
            local windOpts = {}
            for _, o in ipairs(newOpts) do
                table.insert(windOpts, { Title = tostring(o), Desc = "", Icon = "" })
            end
            dd:Refresh(windOpts)
        end,
        Set = function(v) dd:Select(v) end,
    }
end

-- === Slider ===
function redzlib:AddSlider(cfg)
    local slider = CurrentTab:Slider({
        Title = getName(cfg),
        Desc = cfg.Desc or cfg.Description or "",
        Value = {
            Min = cfg.Min or cfg.MinValue or cfg[2] or 0,
            Max = cfg.Max or cfg.MaxValue or cfg[3] or 100,
            Default = cfg.Default or cfg[5] or 0,
        },
        Step = cfg.Increase or cfg[4] or 1,
        IsTextbox = true,
        IsTooltip = true,
        Callback = function(v)
            if cfg[7] then _G[cfg[7]] = v end
            getCallback(cfg, 6)(v)
        end,
        Icons = { From = "minus", To = "plus" },
        Width = 180,
    })
    return {
        Visible = function(v) slider.ElementFrame.Visible = v end,
        Destroy = function() slider:Destroy() end,
        Callback = function(f) slider.Callback = f end,
        Set = function(v) slider:Set(v) end,
        Get = function() return slider.Value.Default end,
        SetMin = function(v) slider:SetMin(v) end,
        SetMax = function(v) slider:SetMax(v) end,
    }
end

-- === TextBox (hub uses Name, ClearOnFocus, Placeholder) ===
function redzlib:AddTextBox(cfg)
    local tb = CurrentTab:Input({
        Title = getName(cfg),
        Desc = cfg.Desc or cfg.Description or "",
        Value = cfg.Default or cfg[2] or "",
        Placeholder = cfg.Placeholder or cfg.PlaceholderText or cfg[5] or "Enter text...",
        Type = "Input",
        ClearTextOnFocus = cfg.ClearOnFocus or cfg.ClearText or cfg[3] or false,
        Callback = function(v)
            if cfg[6] then _G[cfg[6]] = v end
            getCallback(cfg, 4)(v)
        end,
    })
    return {
        Visible = function(v) tb.ElementFrame.Visible = v end,
        Destroy = function() tb:Destroy() end,
        Callback = function(f) tb.Callback = f end,
        Set = function(v) tb:Set(v) end,
        Get = function() return tb.Value end,
        SetPlaceholder = function(t) tb:SetPlaceholder(t) end,
    }
end

-- === Theme & Scale ===
function redzlib:SetTheme(t)
    local map = { KW = "Dark", Dark = "Dark", Light = "Light" }
    local theme = map[t] or "Dark"
    if Window then Window:SetTheme(theme) end
    WindUI:SetTheme(theme)
end

function redzlib:SetScale(s)
    if Window then Window:SetUIScale(s) end
end

return redzlib
