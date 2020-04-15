local coordonate = {
    {90.988441467285,6361.8251953125,30.225801467896,"Colectare",380.77,0xC99F21C4,"a_m_y_business_01"}
}

local coords = {
    {94.622116088867,6364.3051757813,30.375873565674,"Marcel",360.77,0xF06B849D,"s_m_m_autoshop_02"},
    {94.570198059082,6365.466796875,30.375873565674,"Mitrut",180.77,0x62CC28E2,"s_m_y_armymech_01"}
}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)

Citizen.CreateThread(function()

    for _,v in pairs(coords) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
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
                DrawText3D(x,y,z+1.95, "~w~Ce bureti ai?", 1.0, 1)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        Citizen.Wait(0)
        for _,v in pairs(coords) do
            x = v[1]
            y = v[2]
            z = v[3]
            if(Vdist(pos.x, pos.y, pos.z, x, y, z) < 20.0)then
                DrawText3D(x,y,z+2.10, "~p~"..v[4], 1.2, 1)
                DrawText3D(94.622116088867,6364.3051757813,30.375873565674+1.95, "~w~Unde puneam Hribi?", 1.0, 1)
                DrawText3D(94.570198059082,6365.466796875,30.375873565674+1.95, "~w~In depozitu numarul 69", 1.0, 1)
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