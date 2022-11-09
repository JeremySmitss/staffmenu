RegisterCommand("staffmenu", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "staffmenu") then
        TriggerClientEvent("chatMessage", source, "Output message! Permissions passed!")
    else
        TriggerClientEvent("chatMessage", source, "^1Insufficient Permissions.")
    end
end)