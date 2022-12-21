ESX = exports.es_extended:getSharedObject()

RegisterCommand(Jobs.AnnounceCommand_on , function()
    SendAnnounceOn()
end)

RegisterCommand(Jobs.AnnounceCommand_off , function()
    SendAnnounceOff()
end)

RegisterCommand(Jobs.AnnounceCommand_2 , function(source , args)
    local player_data = ESX.GetPlayerData()

    local job = player_data.job.name

    local message = table.concat(args, " ")

    if(message == '') then
        ESX.ShowNotification('Debes de poner un mensaje!')
    else
        for k , v in pairs(Jobs.Names) do
            if(Jobs.Names[k].job == job) then
                TriggerServerEvent('announce:server', message , Jobs.Names[k].title , Jobs.Names[k].icon)
            end
        end
    end
end)

function SendAnnounceOn()
    local player_data = ESX.GetPlayerData()

    local job = player_data.job.name

    for k , v in pairs(Jobs.Names) do
        if(Jobs.Names[k].job == job) then
            TriggerServerEvent('announce:server', Jobs.Names[k].default_message , Jobs.Names[k].title , Jobs.Names[k].icon)
        end
    end
end

function SendAnnounceOff()
    local player_data = ESX.GetPlayerData()

    local job = player_data.job.name

    for k , v in pairs(Jobs.Names) do
        if(Jobs.Names[k].job == job) then
            TriggerServerEvent('announce:server', Jobs.Names[k].other_message , Jobs.Names[k].title , Jobs.Names[k].icon)
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