local coordonate = {
    {78.595077514648,112.4584274292,80.168190002441,"~h~~w~Sef-ul Sediului",200.77,0x62018559,"s_m_y_airworker"}
}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
      RequestAnimDict("amb@world_human_clipboard@male@base")
      while not HasAnimDictLoaded("amb@world_human_clipboard@male@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"amb@world_human_clipboard@male@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        Citizen.Wait(0)
        for _,v in pairs(coordonate) do
            x = v[1]
            y = v[2]
            z = v[3]
            if(Vdist(pos.x, pos.y, pos.z, x, y, z) < 20.0)then
                DrawText3D(x,y,z+2.10, "~p~"..v[4], 1.2, 1)
                DrawText3D(x,y,z+1.95, "~h~~b~Fan Curier", 1.0, 1)
                DrawText3D(79.106239318848,111.49835968018,81.368121337891, "~h~Apasa ~b~E ~w~sa te angajezi!", 1.0, 1)
                DrawMarker(20, 79.106239318848,111.49835968018,80.800121337891, 0, 0, 0, 0, 0, 0, 0.7001, 0.7001, 0.7001, 147, 147, 147,200, true, true, 0,1)
                DrawMarker(27, 79.106239318848,111.49835968018,80.268121337891, 0, 0, 0, 0, 0, 0, 0.7001, 0.7001, 0.7001, 147, 147, 147,200, false, true, 1,1)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        Citizen.Wait(0)
        for _,v in pairs(coordonate) do
            x = v[1]
            y = v[2]
            z = v[3]
            if(Vdist(pos.x, pos.y, pos.z, x, y, z) < 20.0)then
                DrawText3D(x,y,z+2.10, "~p~"..v[4], 1.2, 1)
                --DrawText3D(78.595077514648,112.4584274292,81.168190002441+1.95, "~h~~b~Fan Curier", 1.0, 1)
            end
        end
    end
end)

function DrawText3D(x,y,z, text, scl, font) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end