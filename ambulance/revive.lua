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
	local xPlayers = ESX.GetPlayers()
	local AdminsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		local group = xPlayer.getGroup()
		if group == 'admin' or group == 'superadmin' then
			AdminsConnected = AdminsConnected + 1
		end
	end

	if AdminsConnected > 0 then
		TriggerClientEvent('esx:showNotification', source, "Il y a déjà des admins sur le serveur.")
	else
		if args[2] ~= nil then
			TriggerClientEvent('esx_ambulancejob:revive', tonumber(args[2]))
		else
			TriggerClientEvent('esx_ambulancejob:revive', source)
		end
	end
end, {help = _U('revive_help'), params = {{name = 'id'}}})
