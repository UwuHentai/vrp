-- SEMINTE --

local CoordonateSeminte = {
    {355.72009277344,6483.4443359375,29.0905418396},
    {355.63388061523,6480.3701171875,29.31206703186},
    {355.52194213867,6477.6821289063,29.507194519043},
    {358.11511230469,6483.25,29.077909469604},
    {358.16900634766,6480.2475585938,29.295896530151},
    {358.27172851563,6477.6958007813,29.482894897461}
}

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local Jucator = PlayerPedId(-1)
        local CoordonateJucator = GetEntityCoords(Jucator)
        for k,v in pairs (CoordonateSeminte) do 
            local Distanta = GetDistanceBetweenCoords(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z, v[1], v[2], v[3], true)
            if Distanta < 3 then 
                if (Vdist(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z,v[1],v[2],v[3])) then
                    Draw3DText(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z+1, "~h~~r~Apasa ~w~[E] ~r~ca sa coectezi semintele!", 0.5)
                    Draw3DText(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z, "~h~~w~[ ~r~Traficant de Droguri ~w~]", 0.5)
                        DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255, 30, 30, 200, 0, 0, 0, 1, 0, 0, 0)
                        if Distanta < 1 then 
                            if IsControlJustPressed(0, 38) then
                                TriggerServerEvent('traficant:iarbaia')
                                TaskStartScenarioInPlace(Jucator, 'PROP_HUMAN_PARKING_METER', 0, true)
                                Wait(1000)
                                TriggerServerEvent('traficant:primesteiarba')
                                ClearPedTasks(Jucator)
                            end
                        end
                    end
                end
            end
        end
    end)

-- COCAINA --

local CoordonateCocaina = {
    {-631.41986083984,-230.09942626953,38.059093475342}
}

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local Jucator = PlayerPedId(-1)
        local CoordonateJucator = GetEntityCoords(Jucator)
        for k,v in pairs (CoordonateCocaina) do 
            local Distanta = GetDistanceBetweenCoords(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z, v[1], v[2], v[3], true)
            if Distanta < 1 then 
                if (Vdist(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z,v[1],v[2],v[3])) then
                    Draw3DText(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z+1, "~h~~r~Apasa ~w~[E] ~r~ca sa procuri Praful de Cocaina!", 0.5)
                    Draw3DText(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z, "~h~~w~[ ~r~Traficant de Droguri ~w~]", 0.5)
                        DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255, 30, 30, 200, 0, 0, 0, 1, 0, 0, 0)
                        if Distanta < 1 then 
                            if IsControlJustPressed(0, 38) then
                                TriggerServerEvent('traficant:cocainaia')
                                TaskStartScenarioInPlace(Jucator, 'PROP_HUMAN_PARKING_METER', 0, true)
                                Wait(1000)
                                TriggerServerEvent('traficant:primestecocaina')
                                ClearPedTasks(Jucator)
                            end
                        end
                    end
                end
            end
        end
    end)

-- PRAF XANAX --

local CoordonatePrafXanax = {
    {1984.1688232422,3049.7143554688,47.215045928955}
}

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local Jucator = PlayerPedId(-1)
        local CoordonateJucator = GetEntityCoords(Jucator)
        for k,v in pairs (CoordonatePrafXanax) do 
            local Distanta = GetDistanceBetweenCoords(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z, v[1], v[2], v[3], true)
            if Distanta < 1 then 
                if (Vdist(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z,v[1],v[2],v[3])) then
                    Draw3DText(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z+1, "~h~~r~Apasa ~w~[E] ~r~ca sa procuri Praf Xanax!", 0.5)
                    Draw3DText(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z, "~h~~w~[ ~r~Traficant de Droguri ~w~]", 0.5)
                        DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255, 30, 30, 200, 0, 0, 0, 1, 0, 0, 0)
                        if Distanta < 1 then 
                            if IsControlJustPressed(0, 38) then
                                TriggerServerEvent('traficant:xanaxia')
                                TaskStartScenarioInPlace(Jucator, 'PROP_HUMAN_PARKING_METER', 0, true)
                                Wait(1000)
                                TriggerServerEvent('traficant:xanaxprimeste')
                                ClearPedTasks(Jucator)
                            end
                        end
                    end
                end
            end
        end
    end)

local CoordonateJob = {
    {434.10592651367,6472.736328125,28.370734786987}
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
                    TriggerServerEvent('traficant:droguri')
                    PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
                    announcestring = "~h~~c~Dute si vinde ~r~drogurile!"
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

--      HACKER GEO START      --    https://github.com/HackerGeo-sp1ne/vRP_Welcome

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~c~Te-ai angajat cu ~r~succes~c~! ~r~(Traficant de Droguri)")
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