Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1) 
        if IsControlJustReleased(0, 38) then
            local x, y, z = table.unpack(GetEntityCoords(ped))
            local closestVeh = GetClosestVehicle(x, y, z, 2.0, 0, 4+2+1)
                if IsEntityAVehicle(closestVeh) then
                TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
                TriggerEvent("pNotify:SendNotification", {text = "Cureti masina de Jeg!!", type = "success", timeout = 2000, layout = "centerRight"})
                Wait(10000)
                ClearPedTasks(ped)
                TriggerEvent("pNotify:SendNotification", {text = "Ai curatat masina!", type = "success", timeout = 2000, layout = "centerRight"})
                SetVehicleDirtLevel(closestVeh, 0.0)
            end
        end
    end
end)
