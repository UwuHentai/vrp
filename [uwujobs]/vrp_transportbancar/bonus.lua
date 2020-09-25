local BONUS = {
    {248.22163391113,222.41012573242,106.28679656982}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(BONUS) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 1 then 
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent("BONUS")
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(BONUS) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 5 then 
                DrawText3D(248.19961547852,222.56156921387,106.28679656982, "~h~Apasa ~y~[E] ~w~ca sa iti iei ~y~BONUSUL~w~!", 1.0, 1)
                DrawMarker(20, 248.19961547852,222.56156921387,105.98688049316, 0, 0, 0, 0, 0, 0, 0.7001, 0.7001, 0.7001, 147, 147, 147,200, true, true, 0,1)
                DrawMarker(27, 248.19961547852,222.56156921387,105.58688049316, 0, 0, 0, 0, 0, 0, 0.7001, 0.7001, 0.7001, 147, 147, 147,200, false, true, 1,1)
            end
        end
    end
end)