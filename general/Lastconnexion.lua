
--[[
----------------------------------------------------------------------------
____________________________________________________________________________

                        AUTHOR : ElNelyo

            Permet de définir la dernière date de connexion dun joueur
           Register the last connexion from a player (date format)

--ALTER TABLE `users` ADD `lastconnexion` DATETIME NULL DEFAULT NULL;
____________________________________________________________________________

---------------------------------------------------------------------------
]]--



--es_extended \ client \ main.lua

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  TriggerServerEvent("esx:updateConnexion")
end)



--es_extended\server\main.lua


RegisterServerEvent('esx:updateConnexion')
AddEventHandler('esx:updateConnexion', function()
  local xPlayer        = ESX.GetPlayerFromId(source)
  local ostime = os.date('%c', os.time())
  print("Lastconnexion - updated "..ostime.." on "..xPlayer.identifier)

  MySQL.Async.execute(
        'UPDATE users SET lastconnexion = NOW() WHERE identifier = @identifier',
        {
          ['@identifier'] = xPlayer.identifier,
        },


        function()

        end


    )
end)
