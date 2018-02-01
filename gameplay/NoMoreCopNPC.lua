--[[
----------------------------------------------------------------------------
____________________________________________________________________________
                  AUTHOR : Anthony Roe
                  Disable the spawning of NPC cops
                  Désactive le spawn des PNJ flics
____________________________________________________________________________
---------------------------------------------------------------------------
]]--

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local myCoords = GetEntityCoords(GetPlayerPed(-1))
        ClearAreaOfCops(myCoords.x, myCoords.y, myCoords.z, 100.0, 0)
    end
end)
