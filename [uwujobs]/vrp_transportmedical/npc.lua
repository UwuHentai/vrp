local coordonate = {
    {2221.0073242188,5614.4482421875,53.714241027832,"~h~~w~Medic Veteran",100.77,0xD47303AC,"s_m_m_doctor_01"}
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
                DrawText3D(x,y,z+1.95, "~h~~g~Transport Medical", 1.0, 1)
                DrawText3D(2218.9484863281,5613.841796875,54.697486877441, "~h~Apasa ~g~E ~w~sa te angajezi!", 1.0, 1)
                DrawMarker(20, 2218.9484863281,5613.841796875,54.307486877441, 0, 0, 0, 0, 0, 0, 0.7001, 0.7001, 0.7001, 147, 147, 147,200, true, true, 0,1)
                DrawMarker(27, 2218.9484863281,5613.841796875,53.907486877441, 0, 0, 0, 0, 0, 0, 0.7001, 0.7001, 0.7001, 147, 147, 147,200, false, true, 1,1)
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