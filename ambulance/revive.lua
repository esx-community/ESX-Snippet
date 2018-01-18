--[[
----------------------------------------------------------------------------
____________________________________________________________________________
						
						AUTHOR : Jager Bom

			Autoriser /revive pour les médics si aucun admin en ville 
			Allow /revive if no admin online

						
____________________________________________________________________________
						
---------------------------------------------------------------------------
]]--


local AdminsConnected = 0
function CountAdmins()

	local xPlayers = ESX.GetPlayers()
	AdminsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin' then
			AdminsConnected = AdminsConnected + 1
			
		end
	end
	SetTimeout(5000, CountAdmins)
end

CountAdmins()

TriggerEvent('es:addGroupCommand', 'revivea', 'user', function(source, args, user)
	if AdminsConnected > 0 then
		TriggerClientEvent('esx:showNotification', source, "Il y a déjà des admins sur le serveur.")
	return
	end
	
	if args[2] ~= nil then
		TriggerClientEvent('esx_ambulancejob:revive', tonumber(args[2]))
	else
		TriggerClientEvent('esx_ambulancejob:revive', source)
	end
end, {help = _U('revive_help'), params = {{name = 'id'}}})
