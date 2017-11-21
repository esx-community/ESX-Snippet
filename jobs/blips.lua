--[[
----------------------------------------------------------------------------
____________________________________________________________________________
						
						AUTHOR : ElNelyo

		Affiche que les blips du métier choisi (de esx_jobs uniquement)
		Show only blips for one job ( from esx_jobs)


____________________________________________________________________________
						
---------------------------------------------------------------------------
]]--



--[[ esx_jobs/client/esx_jobs_cl.lua ]]--
function refreshBlips()
    local zones = {}
    local blipInfo = {}
    if PlayerData.job ~= nil then
 
        for jobKey,jobValues in pairs(Config.Jobs) do
            for zoneKey,zoneValues in pairs(jobValues.Zones) do
                if zoneValues.Blip then
                      if PlayerData.job.name == jobKey then
                        local blip = AddBlipForCoord(zoneValues.Pos.x, zoneValues.Pos.y, zoneValues.Pos.z)
                        SetBlipSprite (blip, jobValues.BlipInfos.Sprite)
                        SetBlipDisplay(blip, 4)
                        SetBlipScale  (blip, 1.2)
                        SetBlipColour (blip, jobValues.BlipInfos.Color)
                        SetBlipAsShortRange(blip, true)
                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentString(zoneValues.Name)
                        EndTextCommandSetBlipName(blip)
                        table.insert(JobBlips, blip)
                    end
                end
            end
        end
 
    end
end


-- OR REPLACE 



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    onDuty = false
    myPlate = {} -- loosing vehicle caution in case player changes job.
    isJobVehicleDestroyed = false
    spawner = 0
    deleteBlips()
    refreshBlips()
end)
 

