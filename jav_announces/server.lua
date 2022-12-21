RegisterNetEvent('announce:server', function(default_message, title , icon)
    TriggerClientEvent('announce:client', -1, default_message, title , icon)
end)