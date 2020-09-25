local coordonate = {
    {-841.52624511719,5401.1430664063,33.615169525146,"Padurar Veteran",300.77,0x62018559,"s_m_y_airworker"}
}

local coords = {
    {-835.01062011719,5407.1186523438,33.56135559082,"Ion",360.77,0xF06B849D,"s_m_m_autoshop_02"},
    {-622.26403808594,5506.5903320313,50.245101928711,"Mircea",220.77,0xF06B849D,"s_m_m_autoshop_02"},
    {-493.06298828125,5343.9516601563,81.604934692383,"Andrei",300.77,0xF06B849D,"s_m_m_autoshop_02"},
    {-472.41253662109,5309.1123046875,85.716926574707,"Mitica",360.77,0xF06B849D,"s_m_m_autoshop_02"},
    {-476.18896484375,5299.1606445313,85.713081359863,"Ionut",130.77,0xF06B849D,"s_m_m_autoshop_02"},
    {-513.43969726563,5274.4809570313,79.397262573242,"Daniel",230.77,0xF06B849D,"s_m_m_autoshop_02"},
    {-514.38580322266,5267.9111328125,79.503433227539,"Viorel",290.77,0xF06B849D,"s_m_m_autoshop_02"}
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
                DrawText3D(x,y,z+2.10, "~h~~c~"..v[4], 1.2, 1)
                DrawText3D(x,y,z+1.95, "~w~Te angajezi?", 1.0, 1)
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
                DrawText3D(x,y,z+2.10, "~h~~c~"..v[4], 1.2, 1)
                DrawText3D(-835.01062011719,5407.1186523438,33.56135559082+1.95, "Ia-ti masina de acolo!", 1.0, 1)
                DrawText3D(-622.26403808594,5506.5903320313,50.245101928711+1.95, "Sunt cu ochii pe tine!", 1.0, 1)
                DrawText3D(-493.06298828125,5343.9516601563,81.604934692383+1.95, "Aici procesezi lemnele neprelucrate!!", 1.0, 1)
                DrawText3D(-472.41253662109,5309.1123046875,85.716926574707+1.95, "Procura Mese de Lemn!", 1.0, 1)
                DrawText3D(-476.18896484375,5299.1606445313,85.713081359863+1.95, "Procura Scaune de Lemn!", 1.0, 1)
                DrawText3D(-513.43969726563,5274.4809570313,79.397262573242+1.95, "Vinde Mese de Lemn!", 1.0, 1)
                DrawText3D(-514.38580322266,5267.9111328125,79.503433227539+1.95, "Vinde Scaune de Lemn!", 1.0, 1)
            
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