local hasJob = false

local SpawnBoat = {
    {-1604.796875,5257.076171875,2.0767457485199}
}

local LocPescuit = {
    {-1804.0288085938,5358.0737304688,1.5221494436264}
}

local takejob = {
    {-1599.2501220703,5207.6987304688,4.3100881576538}
}

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(takejob) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 1 then
                if IsControlJustPressed(0, 38) then 
                    TriggerServerEvent("pescarJOB")
                    PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
                    announcestring = "~h~~c~Dute si ia-ti ~b~barca!"
                    Wait(5000)
                    announcestring = false
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(SpawnBoat) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 5 then 
                Draw3DText(-1604.796875,5257.076171875,2.0767457485199, "~w~Apasa ~g~[HOME] ~w~ca sa-ti iei ~b~Baraca de Pescar~w~!", 0.6)
                if distance < 1 then 
                    if IsControlJustPressed(0, 212) then
                        if hasJob == false then
                            CreateBoat(-1603.3681640625,5259.2421875,-0.47483804821968, 25.0)
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
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(LocPescuit) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 280 then 
                DrawMarker(1, -1804.0288085938,5358.0737304688,1.5221494436264 , 0, 0, 0, 0, 0, 0, 100.0001,100.0001,5.0001, 224, 151, 4, 200, 0, 0, 0, 1, 0, 0, 0)
                if distance < 55 then 
                    if IsControlJustPressed(0, 38) then
                        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_FISHING", 0, true)
                        Wait(15000)
                        ClearPedTasks(ped)
                        TriggerServerEvent("primestesomn")
                        TriggerServerEvent("primestepisica")
                    end
                end
            end
        end
    end
end)

function CreateBoat(x,y,z,heading) 
	local hash = GetHashKey("Suntrap")
    local n = 0
    while not HasModelLoaded(hash) and n < 500 do
        RequestModel(hash)
        Citizen.Wait(10)
        n = n+1
    end
    if HasModelLoaded(hash) then
        veh = CreateVehicle(hash,x,y,z,heading,true,false)
		SetVehicleNumberPlateText(veh,"HENTAI")
    end    
end

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
	PushScaleformMovieFunctionParameterString("~c~Te-ai angajat cu ~b~succes~c~! ~b~(Pescar)")
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