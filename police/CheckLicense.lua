--[[
----------------------------------------------------------------------------
____________________________________________________________________________

						AUTHOR : El Nelyo

			Verification des permis d'armes/vehicules
			Check license for weapons and vehicles 

[...] : Signifie que vous devez placez ceci dans le menu flic,(je vais pas tout recopier )
[...] : You just have to add these lines in the police menu


Make sure that your license type in user_licenses are  :
Vérifier que vos types permis dans user_licenses sont bien :
- weapon
- dmv
- drive
- drive_bike
- drive_truck
____________________________________________________________________________

---------------------------------------------------------------------------
]]--

--[[server/main.lua]]--

function ShowPermis(source,identifier)
  local _source = source
  local licenses = MySQL.Sync.fetchAll("SELECT * FROM user_licenses where `owner`= @owner",{['@owner'] = identifier})

    for i=1, #licenses, 1 do

        if(licenses[i].type =="weapon")then
         TriggerClientEvent('esx:showNotification',_source,"Permis de port d'arme")
        end
        if(licenses[i].type =="dmv")then
            TriggerClientEvent('esx:showNotification',_source,"Code de la route")
        end
        if(licenses[i].type =="drive")then
            TriggerClientEvent('esx:showNotification',_source,"Permis de conduire")
        end
        if(licenses[i].type =="drive_bike")then
           TriggerClientEvent('esx:showNotification',_source,"Permis moto")
        end
        if(licenses[i].type =="drive_truck")then
          TriggerClientEvent('esx:showNotification',_source,"Permis camion")
        end


    end

end



RegisterServerEvent('esx_policejob:license_see')
AddEventHandler('esx_policejob:license_see', function(target)

  local sourceXPlayer = ESX.GetPlayerFromId(source)
  local targetXPlayer = ESX.GetPlayerFromId(target)

  local identifier = GetPlayerIdentifiers(target)[1]


  TriggerClientEvent('esx:showNotification', sourceXPlayer.source, '~b~'..targetXPlayer.name)
  ShowPermis(source,identifier)




end)






--[[client/main.lua]]
[...]

      {label = 'Voir les permis',            value = 'license_see'},
[...]

    },
  },
    function(data2, menu2)


  local player, distance = ESX.Game.GetClosestPlayer()

    if distance ~= -1 and distance <= 3.0 then

      if data2.current.value == 'license_see' then
              TriggerServerEvent('esx_policejob:license_see', GetPlayerServerId(player))
          end
[...]
