
--[[
----------------------------------------------------------------------------
____________________________________________________________________________
                        
                        AUTHOR : RayZen
                Animation lors d'un saut en véhicule
                Animation during a vehicle jump
        
____________________________________________________________________________
                        
---------------------------------------------------------------------------
]]--

function sortieveh()
  RequestAnimSet("move_m@injured")
  while not HasAnimSetLoaded("move_m@injured") do
    Citizen.Wait(0)
  end

  if IsPedJumpingOutOfVehicle(GetPlayerPed(-1)) then
  --Citizen.Wait(3000)
  SetPedMotionBlur(GetPlayerPed(-1), true)
  SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
  Citizen.Wait(5000)
  --TriggerEvent('esx:showNotification', 'Vous êtes blésser aller voir un médecin au plus vite')
  TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#1E90FF'>Vous êtes blésser aller voir un médecin au plus vite</b>",
            type = "error",
            timeout = (15000),
            layout = "bottomRight",
            queue = "global"
  })
  Citizen.Wait(300000)
  ResetPedMovementClipset(GetPlayerPed(-1), 0)
  SetPedMotionBlur(GetPlayerPed(-1), false)
 end

end


Citizen.CreateThread(function()
    while true do
      sortieveh()
      Citizen.Wait(0)
    end
end)
