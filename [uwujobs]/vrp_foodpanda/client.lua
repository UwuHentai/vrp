local CoordonateCocaCola = {
    {-54.626586914063,-1748.6550292969,29.421005249023}
}

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local Jucator = PlayerPedId(-1)
        local JucatorCoord = GetEntityCoords(Jucator)
        for k,v in pairs(CoordonateCocaCola) do
            local distanta = GetDistanceBetweenCoords(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, v[1], v[2], v[3], true)
            if distanta < 1 then
                if (Vdist(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, v[1], v[2], v[3])) then 
                    Draw3DText(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z+1, "~h~~s~Apasa ~w~[E] ~s~ca sa iei ~r~CocaCola!", 0.5)
                    Draw3DText(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, "~h~~w~[ ~s~Food Panda ~w~]", 0.5)
                    DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 224, 4, 4, 200, 0, 0, 0, 1, 0, 0, 0)
                        if distanta < 1 then 
                            if IsControlJustPressed(0, 38) then 
                                TriggerServerEvent('food:pandacocacola')
                                TaskStartScenarioInPlace(Jucator, 'PROP_HUMAN_PARKING_METER', 0, true)
                                Wait(3000)
                                TriggerServerEvent('food:pandacocacolap')
                                ClearPedTasks(Jucator)
                            end
                        end
                    end
                end
            end
        end
    end)

local CoordonateCartofi = {
    {-52.361415863037,-1747.7270507813,29.421005249023}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local Jucator = GetPlayerPed(-1)
        local JucatorCoord = GetEntityCoords(Jucator)
        for k,v in pairs(CoordonateCartofi) do 
            local distanta = GetDistanceBetweenCoords(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, v[1], v[2], v[3], true)
            if distanta < 1 then
                if (Vdist(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, v[1], v[2], v[3])) then 
                    Draw3DText(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z+1, "~h~~s~Apasa ~w~[E] ~s~ca sa iei ~o~Cartofi Prajiti!", 0.5)
                    Draw3DText(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, "~h~~w~[ ~s~Food Panda ~w~]", 0.5)
                    DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 224, 151, 4, 200, 0, 0, 0, 1, 0, 0, 0)
                        if distanta < 1 then 
                            if IsControlJustPressed(0, 38) then 
                                TriggerServerEvent('food:pandacartofi')
                                TaskStartScenarioInPlace(Jucator, 'PROP_HUMAN_PARKING_METER', 0, true)
                                Wait(3000)
                                TriggerServerEvent('food:pandacartofip')
                                ClearPedTasks(Jucator)
                            end
                        end
                    end
                end
            end
        end
    end)

local CoordonateCipsuriLays = {
    {-48.407722473145,-1753.7052001953,29.421005249023}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local Jucator = GetPlayerPed(-1)
        local JucatorCoord = GetEntityCoords(Jucator)
        for k,v in pairs(CoordonateCipsuriLays) do 
            local distanta = GetDistanceBetweenCoords(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, v[1], v[2], v[3], true)
            if distanta < 1 then
                if (Vdist(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, v[1], v[2], v[3])) then 
                    Draw3DText(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z+1, "~h~~s~Apasa ~w~[E] ~s~ca sa iei ~r~Cipsuri Lay's!", 0.5)
                    Draw3DText(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, "~h~~w~[ ~s~Food Panda ~w~]", 0.5)
                    DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 224, 4, 4, 200, 0, 0, 0, 1, 0, 0, 0)
                        if distanta < 1 then 
                            if IsControlJustPressed(0, 38) then 
                                TriggerServerEvent('food:pandalays')
                                TaskStartScenarioInPlace(Jucator, 'PROP_HUMAN_PARKING_METER', 0, true)
                                Wait(3000)
                                TriggerServerEvent('food:pandalaysp')
                                ClearPedTasks(Jucator)
                            end
                        end
                    end
                end
            end
        end
    end) 

local CoordonateMcPuisor = {
    {-50.296760559082,-1749.5465087891,29.421005249023}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local Jucator = GetPlayerPed(-1)
        local JucatorCoord = GetEntityCoords(Jucator)
        for k,v in pairs(CoordonateMcPuisor) do 
            local distanta = GetDistanceBetweenCoords(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, v[1], v[2], v[3], true)
            if distanta < 1 then
                if (Vdist(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, v[1], v[2], v[3])) then 
                    Draw3DText(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z+1, "~h~~s~Apasa ~w~[E] ~s~ca sa iei ~o~Mc Puisor!", 0.5)
                    Draw3DText(JucatorCoord.x, JucatorCoord.y, JucatorCoord.z, "~h~~w~[ ~s~Food Panda ~w~]", 0.5)
                    DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 224, 151, 4, 200, 0, 0, 0, 1, 0, 0, 0)
                        if distanta < 1 then 
                            if IsControlJustPressed(0, 38) then 
                                TriggerServerEvent('food:pandamcpuisor')
                                TaskStartScenarioInPlace(Jucator, 'PROP_HUMAN_PARKING_METER', 0, true)
                                Wait(3000)
                                TriggerServerEvent('food:pandamcpuisorp')
                                ClearPedTasks(Jucator)
                            end
                        end
                    end
                end
            end
        end
    end) 

local CoordonateJob = {
    {-43.553218841553,-1750.2573242188,29.421014785767}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local Jucator = PlayerPedId(-1)
        local CoordonateJucator = GetEntityCoords(Jucator)
        for k,v in pairs (CoordonateJob) do 
            local Distanta = GetDistanceBetweenCoords(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z, v[1], v[2], v[3], true)
            if Distanta < 1 then 
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('foodpanda:job')
                    PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
                    announcestring = "~h~~c~Dute si livreaza ~p~mancarea!"
                    Wait(5000)
                    announcestring = false
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
        SetTextColour(255, 92, 225, 255)
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

--      HACKER GEO START      --    https://github.com/HackerGeo-sp1ne/vRP_Welcome

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~c~Te-ai angajat cu ~p~succes~c~! ~p~(Food Panda)")
    PushScaleformMovieFunctionParameterString(announcestring)
	PopScaleformMovieFunctionVoid()
    return scaleform
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if announcestring then
            scaleform = Initialize("mp_big_message_freemode")
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
        end
    end
end)

--      HACKER GEO END      --   