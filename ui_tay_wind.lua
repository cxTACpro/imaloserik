--[[
    ui_tay_wind.lua  —  Drop‑in replacement for ui_tay.txt
    Exact same redzlib API surface, powered by WindUI/main.lua internally.
]]

-- ── Load WindUI (local main.lua via readfile, then HTTP fallback) ──────────
local WindUI = (function()
    local ok, lib = pcall(function()
        if type(readfile) == "function" and isfile and isfile("main.lua") then
            return loadstring(readfile("main.lua"))()
        end
        return loadstring(game:HttpGet("http://192.168.109.1:8080/main.lua", true))()
    end)
    if not ok then error("Failed to load WindUI: " .. tostring(lib), 0) end
    return lib
end)()

-- ── Icon helpers ───────────────────────────────────────────────────────────
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

-- ── Helpers for hub's naming conventions ──────────────────────────────────
local function getName(cfg)     return cfg.Name or cfg[1] or cfg.Title or "" end
local function getDesc(cfg)     return cfg.Desc or cfg.Description or "" end

-- ── State ─────────────────────────────────────────────────────────────────
local Window      = nil   -- WindUI window object
local CurrentTab  = nil   -- WindUI tab object (current)
local Tabs        = {}    -- list of WindUI tabs

-- ── redzlib library table ─────────────────────────────────────────────────
local redzlib = {
    Themes = { KW = {} },
    Info = { Version = "1.0" },
    Save = { UISize = {570, 400}, TabSize = 180, Theme = "KW" },
    Icons = iconMap,
}

-- ==========================================================================
-- MakeWindow
-- ==========================================================================
function redzlib:MakeWindow(cfg)
    local title = cfg.Title or cfg.Name or cfg[1] or "Tac Hub"
    local sub   = cfg.SubTitle or cfg[2] or "by Tùng dz"
    local folder = cfg.SaveFolder or cfg[3] or "TacHub"

    local windWindow = WindUI:CreateWindow({
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
        IgnoreAlerts = true,  -- skip "Close Window?" dialog; immediately destroy
        KeySystem = nil,
    })

    Window = windWindow

    local lib = {}
    function lib:MakeTab(tc)       return redzlib:MakeTab(tc) end
    function lib:SetTheme(t)       return redzlib:SetTheme(t) end
    function lib:SetScale(s)       return redzlib:SetScale(s) end
    function lib:GetIcon(n)        return getIcon(n) end
    function lib:Minimize()        if windWindow then windWindow:Toggle() end end
    function lib:SelectTab(idx)    if windWindow then windWindow:SelectTab(idx) end end
    function lib:Dialog(d)
        if windWindow then
            return windWindow:Dialog({
                Title = d.Title or d[1] or "Dialog",
                Content = d.Text or d[2] or "",
                Buttons = d.Options or d[3] or {},
            })
        end
    end
    function lib:Set(t, st) end -- no‑op, kept for compat
    function lib:AddMinimizeButton(_) return {} end

    return lib
end

-- ==========================================================================
-- MakeTab
-- ==========================================================================
function redzlib:MakeTab(cfg)
    if not Window then error("MakeWindow must be called first", 2) end

    local tab = Window:Tab({
        Title = getName(cfg),
        Icon = getIcon(cfg.Icon or cfg[2] or ""),
        ShowTabTitle = true,
    })
    CurrentTab = tab
    table.insert(Tabs, tab)

    local t = {}
    function t:AddDiscordInvite(d)  return redzlib:AddDiscordInvite(d, tab) end
    function t:AddParagraph(p)      return redzlib:AddParagraph(p, tab) end
    function t:AddSection(s)        return redzlib:AddSection(s, tab) end
    function t:AddButton(b)         return redzlib:AddButton(b, tab) end
    function t:AddToggle(tg)        return redzlib:AddToggle(tg, tab) end
    function t:AddDropdown(d)       return redzlib:AddDropdown(d, tab) end
    function t:AddSlider(s)         return redzlib:AddSlider(s, tab) end
    function t:AddTextBox(tb)       return redzlib:AddTextBox(tb, tab) end
    function t:Enable()             if Window then Window:SelectTab(#Tabs) end end
    function t:Disable()
        pcall(function() tab.UIElements.Main.Visible = false end)
    end
    function t:Destroy()
        pcall(function() tab.UIElements.Main:Destroy() end)
    end
    t.Cont = tab.UIElements and tab.UIElements.ContainerFrame
    return t
end

-- ==========================================================================
-- AddSection  (accepts string or table)
-- ==========================================================================
function redzlib:AddSection(cfg, tab)
    tab = tab or CurrentTab
    if not tab then error("No tab available", 2) end

    local title
    if type(cfg) == "string" then
        title = cfg
    else
        title = cfg.Title or cfg.Name or cfg[1] or cfg.Section or "Section"
    end

    local section = tab:Section({
        Title = title,
        Box = true,
        Opened = true,
        Expandable = true,
    })

    local s = {}
    function s:Visible(v)
        pcall(function() if section.ElementFrame then section.ElementFrame.Visible = v end end)
    end
    function s:Destroy()
        pcall(function() section:Destroy() end)
    end
    function s:Set(t)
        if t and section.SetTitle then section:SetTitle(t) end
    end
    return s
end

-- ==========================================================================
-- AddDiscordInvite
-- ==========================================================================
function redzlib:AddDiscordInvite(cfg, tab)
    tab = tab or CurrentTab
    if not tab then error("No tab available", 2) end

    local title = cfg.Name or cfg.Title or cfg[1] or "Discord"
    local invite = cfg.Invite or cfg[3] or ""

    local tag
    if tab.Tag then
        tag = tab:Tag({
            Title = title .. " | " .. invite,
            Icon = "discord",
            Color = Color3.fromHex("#5865F2"),
            Radius = 999,
        })
    else
        tag = Window:Tag({
            Title = title .. " | " .. invite,
            Icon = "discord",
            Color = Color3.fromHex("#5865F2"),
            Radius = 999,
        })
    end

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

    local d = {}
    function d:Destroy()
        pcall(function() if tag then tag:Destroy() end end)
    end
    function d:Visible(v)
        pcall(function()
            if tag and tag.TagFrame then tag.TagFrame.Visible = v end
        end)
    end
    return d
end

-- ==========================================================================
-- AddParagraph
-- ==========================================================================
function redzlib:AddParagraph(cfg, tab)
    tab = tab or CurrentTab
    if not tab then error("No tab available", 2) end

    local para = tab:Paragraph({
        Title = cfg.Title or cfg[1] or "Paragraph",
        Desc  = cfg.Desc or cfg.Text or cfg[2] or "",
    })

    local p = {}
    function p:Visible(v)
        pcall(function() if para.ElementFrame then para.ElementFrame.Visible = v end end)
    end
    function p:Destroy()
        pcall(function() para:Destroy() end)
    end
    function p:SetTitle(t)
        if t and para.SetTitle then para:SetTitle(t) end
    end
    function p:SetDesc(d)
        if d and para.SetDesc then para:SetDesc(d) end
    end
    function p:Set(t, d)
        if t and para.SetTitle then para:SetTitle(t) end
        if d and para.SetDesc then para:SetDesc(d) end
    end
    return p
end

-- ==========================================================================
-- AddButton  (hub uses Name, not Title)
-- ==========================================================================
function redzlib:AddButton(cfg, tab)
    tab = tab or CurrentTab
    if not tab then error("No tab available", 2) end

    local btn = tab:Button({
        Title    = getName(cfg),
        Desc     = cfg.Desc or cfg.Description or "",
        Icon     = "mouse-pointer-click",
        Justify  = "Between",
        Callback = cfg.Callback or cfg[2] or function() end,
    })

    local b = {}
    function b:Visible(v)
        pcall(function() if btn.ElementFrame then btn.ElementFrame.Visible = v end end)
    end
    function b:Destroy()
        pcall(function() btn:Destroy() end)
    end
    function b:Callback(f)
        if type(f) == "function" then btn.Callback = f end
    end
    function b:Set(t, d)
        if t and type(t) == "string" and btn.SetTitle then btn:SetTitle(t) end
        if d and btn.SetDesc then btn:SetDesc(d) end
    end
    return b
end

-- ==========================================================================
-- AddToggle  (hub uses Name, sometimes Title)
-- ==========================================================================
function redzlib:AddToggle(cfg, tab)
    tab = tab or CurrentTab
    if not tab then error("No tab available", 2) end

    local flag = cfg.Flag or cfg[4]
    local callback = cfg.Callback or cfg[3] or function() end
    local default  = cfg.Default or cfg[2] or false

    local toggle = tab:Toggle({
        Title = getName(cfg),
        Desc  = cfg.Desc or cfg.Description or "",
        Value = default,
        Type  = "Toggle",
        Callback = function(v)
            if flag then _G[flag] = v end
            callback(v)
        end,
    })

    local tg = {}
    function tg:Visible(v)
        pcall(function() if toggle.ElementFrame then toggle.ElementFrame.Visible = v end end)
    end
    function tg:Destroy()
        pcall(function() toggle:Destroy() end)
    end
    function tg:Callback(f)
        if type(f) == "function" then toggle.Callback = f end
    end
    function tg:Set(v)
        if type(v) == "boolean" then
            pcall(function() toggle:Set(v) end)
        elseif type(v) == "string" then
            if toggle.SetTitle then toggle:SetTitle(v) end
        elseif type(v) == "function" then
            toggle.Callback = v
        end
    end
    function tg:Get()
        return toggle.Value
    end
    return tg
end

-- ==========================================================================
-- AddDropdown  (hub uses Name)
-- ==========================================================================
function redzlib:AddDropdown(cfg, tab)
    tab = tab or CurrentTab
    if not tab then error("No tab available", 2) end

    local opts = {}
    for _, o in ipairs(cfg.Options or cfg[2] or {}) do
        table.insert(opts, { Title = tostring(o), Desc = "", Icon = "" })
    end

    local callback = cfg.Callback or cfg[4] or function() end
    local flag     = cfg.Flag or cfg[5]

    local dd = tab:Dropdown({
        Title  = getName(cfg),
        Desc   = getDesc(cfg),
        Values = opts,
        Value  = cfg.Default or cfg[3] or (opts[1] and opts[1].Title) or "",
        Multi  = cfg.Multi or cfg.MultiSelect or false,
        Callback = function(v)
            if flag then _G[flag] = v end
            callback(v)
        end,
    })

    local d = {}
    function d:Visible(v)
        pcall(function() if dd.ElementFrame then dd.ElementFrame.Visible = v end end)
    end
    function d:Destroy()
        pcall(function() dd:Destroy() end)
    end
    function d:Callback(f)
        if type(f) == "function" then dd.Callback = f end
    end
    function d:Select(opt)
        if dd.Select then pcall(function() dd:Select(opt) end) end
    end
    function d:Refresh(newOpts)
        local windOpts = {}
        for _, o in ipairs(newOpts) do
            table.insert(windOpts, { Title = tostring(o), Desc = "", Icon = "" })
        end
        if dd.Refresh then pcall(function() dd:Refresh(windOpts) end) end
    end
    function d:Set(val)
        if type(val) == "table" then
            local windOpts = {}
            for _, o in ipairs(val) do
                table.insert(windOpts, { Title = tostring(o), Desc = "", Icon = "" })
            end
            if dd.Refresh then pcall(function() dd:Refresh(windOpts) end) end
        elseif type(val) == "function" then
            dd.Callback = val
        end
    end
    return d
end

-- ==========================================================================
-- AddSlider
-- ==========================================================================
function redzlib:AddSlider(cfg, tab)
    tab = tab or CurrentTab
    if not tab then error("No tab available", 2) end

    local callback = cfg.Callback or cfg[6] or function() end
    local flag     = cfg.Flag or cfg[7]

    local slider = tab:Slider({
        Title = getName(cfg),
        Desc  = getDesc(cfg),
        Value = {
            Min     = cfg.Min or cfg.MinValue or cfg[2] or 0,
            Max     = cfg.Max or cfg.MaxValue or cfg[3] or 100,
            Default = cfg.Default or cfg[5] or 0,
        },
        Step = cfg.Increase or cfg[4] or 1,
        IsTextbox = true,
        IsTooltip = true,
        Callback = function(v)
            if flag then _G[flag] = v end
            callback(v)
        end,
        Icons = { From = "minus", To = "plus" },
        Width = 180,
    })

    local s = {}
    function s:Visible(v)
        pcall(function() if slider.ElementFrame then slider.ElementFrame.Visible = v end end)
    end
    function s:Destroy()
        pcall(function() slider:Destroy() end)
    end
    function s:Callback(f)
        if type(f) == "function" then slider.Callback = f end
    end
    function s:Set(v)
        if type(v) == "number" then
            pcall(function() slider:Set(v) end)
        elseif type(v) == "function" then
            slider.Callback = v
        elseif type(v) == "string" then
            if slider.SetTitle then slider:SetTitle(v) end
        end
    end
    function s:Get()
        return slider.Value and slider.Value.Default
    end
    function s:SetMin(v)
        pcall(function() if slider.SetMin then slider:SetMin(v) end end)
    end
    function s:SetMax(v)
        pcall(function() if slider.SetMax then slider:SetMax(v) end end)
    end
    return s
end

-- ==========================================================================
-- AddTextBox  (hub uses Name, ClearOnFocus, Placeholder)
-- ==========================================================================
function redzlib:AddTextBox(cfg, tab)
    tab = tab or CurrentTab
    if not tab then error("No tab available", 2) end

    local callback = cfg.Callback or cfg[4] or function() end

    local tb = tab:Input({
        Title    = getName(cfg),
        Desc     = getDesc(cfg),
        Value    = cfg.Default or cfg[2] or "",
        Placeholder = cfg.Placeholder or cfg.PlaceholderText or cfg[5] or "Input",
        Type     = "Input",
        ClearTextOnFocus = cfg.ClearOnFocus or cfg.ClearText or cfg[3] or false,
        Callback = function(v)
            callback(v)
        end,
    })

    local t = {}
    function t:Visible(v)
        pcall(function() if tb.ElementFrame then tb.ElementFrame.Visible = v end end)
    end
    function t:Destroy()
        pcall(function() tb:Destroy() end)
    end
    function t:Callback(f)
        if type(f) == "function" then tb.Callback = f end
    end
    function t:Set(v)
        if tb.Set then pcall(function() tb:Set(v) end) end
    end
    function t:Get()
        return tb.Value
    end
    -- For hubs that hook :OnChanging (e.g. direct assignment)
    t.OnChanging = false
    return t
end

-- ==========================================================================
-- Theme & Scale
-- ==========================================================================
function redzlib:SetTheme(t)
    local map = { KW = "Dark", Dark = "Dark", Light = "Light" }
    local theme = map[t] or "Dark"
    if Window then pcall(function() Window:SetTheme(theme) end) end
    pcall(function() WindUI:SetTheme(theme) end)
end

function redzlib:SetScale(s)
    if Window then pcall(function() Window:SetUIScale(s) end) end
end

-- ==========================================================================
-- Export
-- ==========================================================================
return redzlib
