--[[
----------------------------------------------------------------------------
____________________________________________________________________________

                  AUTHOR : Serse Dio Re

 If you want to rob a shop you have to be armed!
 Vous devez être armé pour braquer une superette 


____________________________________________________________________________

---------------------------------------------------------------------------
]]--
 --esx_holdup_cl.lua under "if IsControlJustReleased(1, 51) then" (in my esx_holdup line 119)

local weaponStealeableList = {453432689, 1593441988, 584646201, 2578377531, 324215364, 736523883, 4024951519, 3220176749, 2210333304, 2937143193, 2634544996, 2144741730, 487013001} -- https://www.se7ensins.com/forums/threads/weapon-and-explosion-hashes-list.1045035/ weapon's codes
for i=1, #weaponStealeableList do
    if GetCurrentPedWeapon(GetPlayerPed(-1), weaponStealeableList[i], false) then
       haveWeapon = true
	end
end

if(haveWeapon)then
	TriggerServerEvent('esx_holdup:rob', k)
else
	ESX.ShowNotification("You must be armed to start the robbery!") -- Here for changed your notification
end
