--[[
----------------------------------------------------------------------------
____________________________________________________________________________
						
						AUTHOR : Soig

			Plus aucune armes droppées par les PNJ
			Peds wont drop weapons no more
		

____________________________________________________________________________
						
---------------------------------------------------------------------------
]]--

function SetWeaponDrops()
	local handle, ped = FindFirstPed()
	local finished = false

	repeat
		if not IsEntityDead(ped) then
			SetPedDropsWeaponsWhenDead(ped, false)
		end
		finished, ped = FindNextPed(handle)
	until not finished

	EndFindPed(handle)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		SetWeaponDrops()
	end
end)