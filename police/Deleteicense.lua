--[[
----------------------------------------------------------------------------
____________________________________________________________________________

						AUTHOR : El Nelyo

			Supprimer permis Armes/ Véhicules pour le menu police
			Delete licences from police menu

[...] : Signifie que vous devez placez ceci dans le menu flic,(je vais pas tout recopier )
[...] : You just have to add these lines in the police menu

____________________________________________________________________________

---------------------------------------------------------------------------
]]--

--[[client/main.lua]]--

[...]
              {label = 'Retirer permis Arme',            value = 'license_weapon_remove'},
              {label = 'Retirer permis Moto',            value = 'license_moto_remove'},
              {label = 'Retirer permis Camion',            value = 'license_camion_remove'},
              {label = 'Retirer permis Voiture',            value = 'license_voiture_remove'},
              {label = 'Retirer Code',            value = 'license_code_remove'}
            },
          },
          function(data2, menu2)


            local player, distance = ESX.Game.GetClosestPlayer()

            if distance ~= -1 and distance <= 3.0 then

            if data2.current.value == 'license_weapon_remove' then
                  TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'weapon')

              end

              if data2.current.value == 'license_moto_remove' then
                  TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'drive_bike')

              end
              if data2.current.value == 'license_camion_remove' then
                  TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'drive_truck')

              end
              if data2.current.value == 'license_voiture_remove' then
                  TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'drive')

              end
                if data2.current.value == 'license_code_remove' then
                  TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'dmv')

              end
[...]









--[[server/main.lua]]--

function deleteLicense(owner, license)
    MySQL.Sync.execute("DELETE FROM user_licenses WHERE `owner` = @owner AND `type` = @license", {
        ['@owner'] = owner,
        ['@license'] = license,
    })
    print('Permis suppr - '..owner)
    print('Permis suppr - '..license)

end



RegisterServerEvent('esx_policejob:deletelicense')
AddEventHandler('esx_policejob:deletelicense', function(target, license)
  local text = ""
  local sourceXPlayer = ESX.GetPlayerFromId(source)
  local targetXPlayer = ESX.GetPlayerFromId(target)

  if(license =="weapon")then
    text= "Permis de port d'arme"
  end
  if(license =="dmv")then
    text = "Code de la route"
  end
  if(license =="drive")then
    text= "Permis de conduire"
  end
  if(license =="drive_bike")then
    text= "Permis moto"
  end
  if(license =="drive_truck")then
    text="Permis camion"
  end

  TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~supprimé ~w~ : '..text..' de ~b~'..targetXPlayer.name )
  TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~r~' .. sourceXPlayer.name .. ' vous a retiré : '.. text)


  local identifier = GetPlayerIdentifiers(target)[1]



  deleteLicense(identifier,license)




end)
