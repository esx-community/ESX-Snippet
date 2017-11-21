--[[
----------------------------------------------------------------------------
____________________________________________________________________________
						
						AUTHOR : Jager Bom

			Autoriser /revive pour les médics si aucun admin en ville 
			Allow /revive if no admin online

						
____________________________________________________________________________
						
---------------------------------------------------------------------------
]]--


TriggerEvent('es:addGroupCommand', 'revivea', 'user', function(source, args, user)
    local source = source
    local admin = 0
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.group == 'admin' or xPlayer.group == 'superadmin'  then
            admin = admin + 1
        end
    end

if(admin >= 1)then
  if args[2] ~= nil then
    TriggerClientEvent('esx_ambulancejob:revive', tonumber(args[2]))
  else
    TriggerClientEvent('esx_ambulancejob:revive', source)
  end
  end

end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Il y a déjà des admins sur le serveur.")
end, {help = _U('revive_help'), params = {{name = 'id'}}})