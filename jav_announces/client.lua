ESX = exports.es_extended:getSharedObject()

RegisterCommand(Jobs.AnnounceCommand , function()
    SendAnnounce()
end)

function SendAnnounce()
    local player_data = ESX.GetPlayerData()

    local job = player_data.job.name

    for k , v in pairs(Jobs.Names) do
        if(Jobs.Names[k].job == job) then
            TriggerServerEvent('announce:server', Jobs.Names[k].default_message , Jobs.Names[k].title , Jobs.Names[k].icon)
        end
    end
end

RegisterNetEvent('announce:client' , function(default_message , title , icon)
    SendNUIMessage({
        action = 'show:announce',
        title = title,
        message = default_message,
        icon = icon,
        time = Jobs.AnnounceTime
    })
end)