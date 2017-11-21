
--[[
----------------------------------------------------------------------------
____________________________________________________________________________
						
						AUTHOR : Stivicx

			Notifications avec images
			Display images with notifications
		

____________________________________________________________________________
						
---------------------------------------------------------------------------
]]--



--[[Client side]]--
function Notification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage("CHAR_WADE", "CHAR_WADE", true, 1, "~y~Tatouer :~s~", ""); --- Here for changed your notification
    DrawNotification(false, true);
end

RegisterNetEvent('esx_tatoo:showNotification')
AddEventHandler('esx_tatoo:showNotification', function(notify)
    Notification(notify)
end)

--[[Server side]]--
TriggerClientEvent("esx_tatoo:showNotification", _source, "~g~Vous avez finalisé votre tatouage.")