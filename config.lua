Config = {}

-- AFK Timer Settings
Config.MaxAFKTime = 300 -- Time in seconds before a player is kicked (Default: 5 minutes)
Config.WarningTime = 240 -- Time in seconds before showing a warning (Default: 4 minutes)

-- Messages
Config.KickMessage = "You were kicked for being AFK too long."
Config.WarningMessage = "Warning: You will be kicked in {time} seconds for being AFK!"

-- Admin Exemptions (Steam Hex IDs)
Config.AdminExemptions = {
    "steam:110000112345678", -- Example Admin (Replace with actual Steam Hex IDs)
    "steam:110000109876543"
}

-- Enable Logging
Config.EnableLogging = true -- Logs AFK kicks in the server console

-- Kick Reasons
Config.KickReasons = {
    "AFK for too long",
    "Inactive player removed",
    "AFK detected"
}

-- Choose a random kick reason
function Config.GetRandomKickReason()
    return Config.KickReasons[math.random(#Config.KickReasons)]
end
