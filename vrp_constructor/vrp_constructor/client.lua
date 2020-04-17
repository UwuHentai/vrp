--[[ local coordHAINESANTIER = {
    {-125.64698791504,-1046.5217285156,27.273559570313}
} --]]

local coordPICAMMER = {
    {-145.41050720215,-1074.4691162109,21.68523979187},
    {-153.37873840332,-1077.8626708984,21.685256958008},
    {-154.97839355469,-1072.5562744141,21.685256958008},
    {-139.65251159668,-1078.2424316406,21.685256958008}
}

local coordCIOCAN = {
    {-143.91076660156,-1033.1829833984,27.273578643799},
    {-146.53503417969,-1034.9237060547,27.273559570313},
    {-147.98002624512,-1031.7637939453,27.273582458496},
    {-145.27687072754,-1030.0443115234,27.291851043701}
}

local coordSUDAT = {
    {-101.57331848145,-998.03100585938,21.411922454834},
    {-95.726432800293,-1001.5670776367,21.27684211731},
    {-90.794204711914,-987.95294189453,21.27684211731},
    {-84.989959716797,-974.986328125,21.27684211731}
}

--[[Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local ped = PlayerPedId(-1)
        local playerCoord = GetEntityCoords(ped)
        for k,v in pairs (coordHAINESANTIER) do 
            local distance = GetDistanceBetweenCoords(playerCoord.x, playerCoord.y, playerCoord.z,v[1],v[2],v[3] , true)
            if distance < 5 then 
                SetPedComponentVariation(ped, 4, 84, 0, 0)
                SetPedComponentVariation(ped, 6, 47, 0, 0)
                if distance > 5 then 
                    ClearAllPedProps(ped)
                end
            end
        end
    end
end)--]]

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local ped = PlayerPedId(-1)
        local playerCoord = GetEntityCoords(ped)
        for k,v in pairs (coordPICAMMER) do 
            local distance = GetDistanceBetweenCoords(playerCoord.x, playerCoord.y, playerCoord.z,v[1],v[2],v[3] , true)
            Draw3DText(-131.66940307617,-1044.5942382813,27.301239013672, "~h~~c~[ CIOCAN ]", 1.5)            
            Draw3DText(-113.45107269287,-1064.4448242188,26.796787261963, "~h~~o~[ PICAMMER ]", 1.5)
            Draw3DText(-104.33605194092,-1018.0464477539,27.264726638794, "~h~~w~[ SUDAT ]", 1.5)
            if distance < 10 then
            if (Vdist(playerCoord.x, playerCoord.y, playerCoord.z,v[1],v[2],v[3])) then
                Draw3DText(playerCoord.x, playerCoord.y, playerCoord.z+1, "~p~Apasa ~o~[E] ~p~ca sa lucrezi!", 0.5)
                Draw3DText(playerCoord.x, playerCoord.y, playerCoord.z, "~h~~o~[ PICAMMER ]", 0.5)
                    DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255,198,30, 200, 0, 0, 0, 1, 0, 0, 0)
                    if distance < 1 then 
                        if IsControlJustPressed(0, 38) then
                            TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CONST_DRILL', 0, true)
                            TriggerServerEvent('uwu:startANIAMTIEpicammer')
                            Wait(15000)
                            ClearPedTasks(ped)
                            CreateMoneyPickups(playerCoord.x, playerCoord.y, playerCoord.z, 500, 3, 0)
                            TriggerServerEvent('uwu:BANIIIpicammer')
                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local ped = PlayerPedId(-1)
        local playerCoord = GetEntityCoords(ped)
        for k,v in pairs (coordCIOCAN) do 
            local distance = GetDistanceBetweenCoords(playerCoord.x, playerCoord.y, playerCoord.z,v[1],v[2],v[3] , true)
            if distance < 15 then
            if (Vdist(playerCoord.x, playerCoord.y, playerCoord.z,v[1],v[2],v[3])) then
                Draw3DText(playerCoord.x, playerCoord.y, playerCoord.z+1, "~p~Apasa ~c~[E] ~p~ca sa lucrezi!", 0.5)
                Draw3DText(playerCoord.x, playerCoord.y, playerCoord.z, "~h~~c~[ CIOCAN ]", 0.5)
                    DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 147,147,147, 200, 0, 0, 0, 1, 0, 0, 0)
                    if distance < 2 then 
                        if IsControlJustPressed(0, 38) then
                            TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_HAMMERING', 0, true)
                            TriggerServerEvent('uwu:startANIAMTIEciocan')
                            Wait(8000)
                            ClearPedTasks(ped)
                            CreateMoneyPickups(playerCoord.x, playerCoord.y, playerCoord.z, 500, 3, 0)
                            TriggerServerEvent('uwu:BANIIIciocan')
                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local ped = PlayerPedId(-1)
        local playerCoord = GetEntityCoords(ped)
        for k,v in pairs (coordSUDAT) do 
            local distance = GetDistanceBetweenCoords(playerCoord.x, playerCoord.y, playerCoord.z,v[1],v[2],v[3] , true)
            if distance < 15 then
            if (Vdist(playerCoord.x, playerCoord.y, playerCoord.z,v[1],v[2],v[3])) then
                Draw3DText(playerCoord.x, playerCoord.y, playerCoord.z+1, "~p~Apasa ~w~[E] ~p~ca sa lucrezi!", 0.5)
                Draw3DText(playerCoord.x, playerCoord.y, playerCoord.z, "~h~~w~[ SUDAT ]", 0.5)
                    DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
                    if distance < 3 then 
                        if IsControlJustPressed(0, 38) then
                            SetPedComponentVariation(ped, 1, 89, 0, 0)
                            TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_WELDING', 0, true)
                            TriggerServerEvent('uwu:startANIAMTIEsudat')
                            Wait(1000)
                            ClearPedTasks(ped)
                            ClearPedProp(ped)
                            CreateMoneyPickups(playerCoord.x, playerCoord.y, playerCoord.z, 500, 3, 0)
                            TriggerServerEvent('uwu:BANIIIsudat')
                        end
                    end
                end
            end
        end
    end
end)



function Draw3DText(x,y,z, text,scl) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(1.0*scale, 2.1*scale)
        SetTextFont(1)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(""..text)
        DrawText(_x,_y)
    end
end