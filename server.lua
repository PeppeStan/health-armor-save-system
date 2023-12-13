--[[
    
██████╗░███████╗██████╗░██████╗░███████╗  ██████╗░██████╗░███████╗███╗░░░███╗██╗██╗░░░██╗███╗░░░███╗
██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██╔════╝████╗░████║██║██║░░░██║████╗░████║
██████╔╝█████╗░░██████╔╝██████╔╝█████╗░░  ██████╔╝██████╔╝█████╗░░██╔████╔██║██║██║░░░██║██╔████╔██║
██╔═══╝░██╔══╝░░██╔═══╝░██╔═══╝░██╔══╝░░  ██╔═══╝░██╔══██╗██╔══╝░░██║╚██╔╝██║██║██║░░░██║██║╚██╔╝██║
██║░░░░░███████╗██║░░░░░██║░░░░░███████╗  ██║░░░░░██║░░██║███████╗██║░╚═╝░██║██║╚██████╔╝██║░╚═╝░██║
╚═╝░░░░░╚══════╝╚═╝░░░░░╚═╝░░░░░╚══════╝  ╚═╝░░░░░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚═╝░╚═════╝░╚═╝░░░░░╚═╝
                                    github.com/PeppeStan
]]
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Event when a player logs out or disconnects
RegisterNetEvent('esx:playerDropped')
AddEventHandler('esx:playerDropped', function(playerId, reason)
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if xPlayer then
        local identifier = xPlayer.getIdentifier()
        local playerPed = GetPlayerPed(playerId)
        local health = GetEntityHealth(playerPed)
        local armor = GetPedArmour(playerPed)

        print("Executing query for logout for player: " .. playerId)
        print("Health: " .. health .. ", Armor: " .. armor .. ", Identifier: " .. identifier)

        MySQL.Async.execute('UPDATE users SET health = @health, armor = @armor WHERE identifier = @identifier', {
            ['@health'] = health,
            ['@armor'] = armor,
            ['@identifier'] = identifier
        })
    else
        print("Player " .. playerId .. " disconnected for reason: " .. reason .. " but xPlayer was not found.")
    end
end)


-- Event when a player logs in
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer then
        local identifier = xPlayer.getIdentifier()
        print(identifier)
        MySQL.Async.fetchAll('SELECT health, armor FROM users WHERE identifier = @identifier', {
            ['@identifier'] = identifier
        }, function(results)
            if #results > 0 then
                local data = results[1]
                if data then
                    local health = data.health
                    local armor = data.armor
                 --   print(health)
                --    print(armor)
                --    TriggerClientEvent('esx:setPlayerHealthArmor', playerId, health, armor)
                end
            end
        end)
    end
end)


