--[[
----------------------------------------------------------------------------
____________________________________________________________________________
                        
                        AUTHOR : ReedY

            Régule le trafic pnj
            FixTraffic - manage your traffic
        

____________________________________________________________________________

---------------------------------------------------------------------------
]]--

Citizen.CreateThread(function()
	--SetGarbageTrucks(false) -- set garbage trucks randomly spawning
	--SetRandomBoats(false) -- set random boats spawning in the water

	--SetCreateRandomCops(false) -- set random cops walking/driving around
	--SetCreateRandomCopsNotOnScenarios(false) -- set random cops (not in a scenario) from spawning
	--SetCreateRandomCopsOnScenarios(false) -- set random cops (in a scenario) from spawning

	while true do
		Citizen.Wait(10)
		local playerCoords = GetEntityCoords(PlayerPedId())

		-- These natives have to be called every frame
		SetVehicleDensityMultiplierThisFrame(0.3) -- set traffic density 
		SetPedDensityMultiplierThisFrame(0.2) -- set npc/ai peds density
		SetRandomVehicleDensityMultiplierThisFrame(1.0) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.)
		SetParkedVehicleDensityMultiplierThisFrame(1.0) -- set random parked vehicles (parked car scenarios)
		SetScenarioPedDensityMultiplierThisFrame(2.0, 2.0) -- set random npc/ai peds or scenario peds

		--ClearAreaOfVehicles(playerCoords, 1000, false, false, false, false, false)
		--RemoveVehiclesFromGeneratorsInArea(playerCoords.x - 500.0, playerCoords.y - 500.0, playerCoords.z - 500.0, playerCoords.x + 500.0, playerCoords.y + 500.0, playerCoords.z + 500.0)
	end
end)