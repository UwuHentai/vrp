local CoordonateiarbaMedicinala = {
    {2220.5502929688,5578.3188476563,53.712795257568},
    {2223.087890625,5578.1245117188,53.714649200439},
    {2225.3305664063,5577.9428710938,53.709774017334},
    {2227.4482421875,5577.8071289063,53.705261230469},
    {2227.2805175781,5575.5849609375,53.643321990967},
    {2225.3247070313,5575.7661132813,53.631294250488},
    {2222.9333496094,5576.099609375,53.636260986328},
    {2220.4790039063,5576.130859375,53.603397369385}
}

local CoordonateJob = {
    {2218.9455566406,5613.8325195313,54.697425842285}
}

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local Jucator = PlayerPedId(-1)
        local CoordonateJucator = GetEntityCoords(Jucator)
        for k,v in pairs (CoordonateiarbaMedicinala) do 
            local distance = GetDistanceBetweenCoords(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z,v[1],v[2],v[3] , true)
            if distance < 10 then
            if (Vdist(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z,v[1],v[2],v[3])) then
                Draw3DText(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z+1, "~h~~g~Apasa ~w~[E] ~g~ca sa lucrezi!", 0.5)
                Draw3DText(CoordonateJucator.x, CoordonateJucator.y, CoordonateJucator.z, "~h~~w~[ ~g~Transport Medical ~w~]", 0.5)
                    DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 112, 239, 93, 200, 0, 0, 0, 1, 0, 0, 0)
                    if distance < 1 then 
                        if IsControlJustPressed(0, 38) then
                            TaskStartScenarioInPlace(Jucator, 'PROP_HUMAN_PARKING_METER', 0, true)
                            Wait(8000)
                            TriggerServerEvent("transport:primesteiarba")
                            ClearPedTasks(Jucator)
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
                    TriggerServerEvent('transportmedical:job')
                    PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
                    announcestring = "~h~~c~Dute si livreaza ~g~iarba medicinala!"
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
	PushScaleformMovieFunctionParameterString("~c~Te-ai angajat cu ~g~succes~c~! ~g~(Transport Medical)")
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