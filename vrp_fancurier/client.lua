local CoordonatePachete = {
    {68.97533416748,127.25500488281,79.207374572754}
}

local CoordonateJob = {
    {79.271881103516,111.44087219238,81.168121337891}
}

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local Jucator = PlayerPedId(-1)
        local CoordonateJucator = GetEntityCoords(Jucator)
        for k,v in pairs (CoordonatePachete) do 
            local Distanta = GetDistanceBetweenCoords(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z, v[1], v[2], v[3], true)
            if Distanta < 5 then 
                if (Vdist(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z,v[1],v[2],v[3])) then
                    Draw3DText(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z+1, "~h~~b~Apasa ~w~[E] ~b~ca sa iei coletele!", 0.5)
                    Draw3DText(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z, "~h~~w~[ ~b~Fan Curier ~w~]", 0.5)
                        DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 38, 188, 247, 200, 0, 0, 0, 1, 0, 0, 0)
                        if Distanta < 1 then 
                            if IsControlJustPressed(0, 38) then 
                                local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
                                local pachete = CreateObject(GetHashKey("prop_cs_box_clothes"), x, y, z+0.2,  true,  true, true)
                                TriggerServerEvent('fancurier:notificare')
                                TaskStartScenarioInPlace(Jucator, 'PROP_HUMAN_PARKING_METER', 0, true)
                                AttachEntityToEntity(pachete, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.08, 0, -0.10, 80.0, -20.0, 175.0, true, true, false, true, 1, true)
                                Wait(5000)
                                TriggerServerEvent('fancurier:iacolete')
                                ClearPedTasks(Jucator)
                                DeleteEntity(pachete)
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
        local Jucator = PlayerPedId(-1)
        local CoordonateJucator = GetEntityCoords(Jucator)
        for k,v in pairs (CoordonateJob) do 
            local Distanta = GetDistanceBetweenCoords(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z, v[1], v[2], v[3], true)
            if Distanta < 1 then 
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('fancurier:job')
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
      