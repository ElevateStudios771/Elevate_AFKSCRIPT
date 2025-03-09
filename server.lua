RegisterServerEvent("kickForAFK")
AddEventHandler("kickForAFK", function()
    local _source = source
    local identifiers = GetPlayerIdentifiers(_source)

    -- Check if player is an admin (exempt)
    for _, id in pairs(identifiers) do
        for _, exemptId in pairs(Config.AdminExemptions) do
            if id == exemptId then
                print("[AFK Kick] Admin " .. GetPlayerName(_source) .. " is exempt from AFK kicks.")
                return
            end
        end
    end

    -- Log the AFK kick
    if Config.EnableLogging then
        print("[AFK Kick] " .. GetPlayerName(_source) .. " was kicked for AFK.")
    end

    -- Kick the player
    DropPlayer(_source, Config.GetRandomKickReason())
end)
