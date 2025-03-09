local afkTime = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Checks every second
        local playerPed = PlayerPedId()
        
        if IsPedStill(playerPed) then
            afkTime = afkTime + 1
        else
            afkTime = 0 -- Reset if the player moves
        end
        
        -- Show warning before kick
        if afkTime == Config.WarningTime then
            TriggerEvent("chat:addMessage", { args = { "[AFK System]", Config.WarningMessage:gsub("{time}", tostring(Config.MaxAFKTime - Config.WarningTime)) } })
        end

        -- Kick player if AFK too long
        if afkTime >= Config.MaxAFKTime then
            TriggerServerEvent("kickForAFK")
        end
    end
end)
