local RunService = game:GetService("RunService")
local textLabel = script.Parent -- Assumes script is inside a TextLabel

-- Center the label on screen - Use brackets or correct syntax
textLabel.Position = UDim2.new(0.5, 0, 0.5, 0) -- Center of the screen
textLabel.AnchorPoint = Vector2.new(0.5, 0.5) -- Anchor at center of label

-- Optional: Make it look better
textLabel.Size = UDim2.new(0, 300, 0, 50) -- Fixed size
textLabel.BackgroundTransparency = 1 -- Make background transparent
textLabel.TextScaled = true -- Scale text to fit

-- Function to format raw seconds into Hours:Minutes:Seconds
local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)
    
    return string.format("%02d:%02d:%02d", hours, minutes, secs)
end

-- Continuously update the UI using the Heartbeat frame loop
RunService.Heartbeat:Connect(function()
    -- DistributedGameTime returns the exact server uptime in seconds
    local serverUptime = workspace.DistributedGameTime
    textLabel.Text = "Server Age: " .. formatTime(serverUptime)
end)