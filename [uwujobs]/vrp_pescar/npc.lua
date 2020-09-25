local coordonate = {
    {-1601.0712890625,5206.9931640625,3.3100881576538,"~h~~b~Pescar~w~ din ani 80",20.77,0x174D4245,"a_m_o_tramp_01"}
}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
    
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
      RequestAnimDict("amb@world_human_stand_fishing@idle_a")
      while not HasAnimDictLoaded("amb@world_human_stand_fishing@idle_a") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      local undita = CreateObject(GetHashKey("prop_fishing_rod_01"), -1601.0712890625,5206.9931640625,3.5100881576538,  true,  true, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      AttachEntityToEntity(undita, ped, GetPedBoneIndex(GetPlayerPed(-1), 57005), -0.3, 0.3, -0.0, 90.0, -20.0, 175.0, true, true, false, true, 1, true)
      TaskPlayAnim(ped,"amb@world_human_stand_fishing@idle_a","idle_c", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
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
                DrawText3D(x,y,z+1.95, "~h~~b~Pescar", 1.0, 1)
                DrawText3D(-1599.2501220703,5207.6987304688,4.3100881576538, "~h~Apasa ~b~[E] ~w~sa te angajezi!", 1.0, 1)
                DrawMarker(20, -1599.2501220703,5207.6987304688,3.9100881576538, 0, 0, 0, 0, 0, 0, 0.7001, 0.7001, 0.7001, 147, 147, 147,200, true, true, 0,1)
                DrawMarker(27, -1599.2501220703,5207.6987304688,3.5100881576538, 0, 0, 0, 0, 0, 0, 0.7001, 0.7001, 0.7001, 147, 147, 147,200, false, true, 1,1)
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