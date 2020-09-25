local takeJob = {
    {246.44152832031,223.13493347168,106.28688049316}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(takeJob) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 1 then 
                if IsControlJustPressed(0, 38) then 
                    TriggerServerEvent("JOBBancar")
                    announcestring = "~h~~c~Dute si ia-ti ~g~masina!"
                    Wait(5000)
                    announcestring = false
                end
            end
        end
    end
end)

local masinasoferbancar = {
    {258.05960083008,200.39707946777,104.98009490967}
}                

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(masinasoferbancar) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 5 then 
                Draw3DText(v[1], v[2], v[3] + 1.5, "~w~Apasa ~g~[HOME] ~w~ca sa-ti iei ~g~Masina ~w~pentru munca~w~!", 0.6)
                if distance < 1 then 
                    if IsControlJustPressed(0, 212) then 
                        CreateMasinaBanca(249.70054626465,192.13282775879,104.92840576172, 80.0)
                        TriggerServerEvent("masinaNOTI")
                        Wait(1800000)
                    end
                end
            end
        end
    end
end)

local iabanibancii = {
    {260.01763916016,276.59613037109,105.62523651123}
}

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        local vehicle = GetVehiclePedIsIn(ped, false)
        for k,v in pairs(iabanibancii) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 25 then 
                if IsPedInAnyVehicle(ped, true) then
                    DrawMarker(39, 259.91226196289,276.96780395508,107.62523651123 , 0, 0, 0, 0, 0, 0, 2.0001,2.0001,2.0001, 29, 255, 25, 200, 0, 0, 0, 1, 0, 0, 0)
                    if distance < 3 then 
                        if IsControlJustPressed(0, 38) then
                            NPCCaraBanii()
                            SetNewWaypoint(-334.67263793945,-40.31729888916,47.839958190918)
                        end
                    end
                end
            end
        end
    end
end)

local ducebanii1 = {
    {-334.67263793945,-40.31729888916,47.839958190918}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(ducebanii1) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 25 then 
                if IsPedInAnyVehicle(ped, true) then
                    DrawMarker(39, -335.23867797852,-40.469974517822,49.82568359375 , 0, 0, 0, 0, 0, 0, 2.0001,2.0001,2.0001, 29, 255, 25, 200, 0, 0, 0, 1, 0, 0, 0)
                    if distance < 3 then 
                        if IsControlJustPressed(0, 38) then
                            NPCDUCEBANI1()
                            SetNewWaypoint(322.54968261719,-269.51858520508,53.769184112549)
                        end
                    end
                end
            end
        end
    end
end)

local ducebanii2 = {
    {322.54968261719,-269.51858520508,53.769184112549}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(ducebanii2) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 25 then 
                if IsPedInAnyVehicle(ped, true) then
                    DrawMarker(39, 322.54968261719,-269.51858520508,55.769184112549 , 0, 0, 0, 0, 0, 0, 2.0001,2.0001,2.0001, 29, 255, 25, 200, 0, 0, 0, 1, 0, 0, 0)
                    if distance < 3 then 
                        if IsControlJustPressed(0, 38) then
                            NPCDUCEBANI2()
                            SetNewWaypoint(-1215.6606445313,-315.3616027832,37.240684509277)
                        end
                    end
                end
            end
        end
    end
end)

local ducebanii3 = {
    {-1215.6606445313,-315.3616027832,37.240684509277}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(ducebanii3) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 25 then 
                if IsPedInAnyVehicle(ped, true) then
                    DrawMarker(39, -1215.6606445313,-315.3616027832,40.240684509277 , 0, 0, 0, 0, 0, 0, 2.0001,2.0001,2.0001, 29, 255, 25, 200, 0, 0, 0, 1, 0, 0, 0)
                    if distance < 3 then 
                        if IsControlJustPressed(0, 38) then
                            NPCDUCEBANI3()
                            SetNewWaypoint(156.03102111816,-1043.8371582031,29.326168060303)
                        end
                    end
                end
            end
        end
    end
end)

local ducebanii4 = {
    {156.03102111816,-1043.8371582031,29.326168060303}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(ducebanii4) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 25 then 
                if IsPedInAnyVehicle(ped, true) then
                    DrawMarker(39, 156.03102111816,-1043.8371582031,32.326168060303 , 0, 0, 0, 0, 0, 0, 2.0001,2.0001,2.0001, 29, 255, 25, 200, 0, 0, 0, 1, 0, 0, 0)
                    if distance < 3 then 
                        if IsControlJustPressed(0, 38) then
                            NPCDUCEBANI4()
                            TriggerServerEvent("bonusbanutiFINAL")
                            SetNewWaypoint(246.44152832031,223.13493347168,106.28688049316)
                        end
                    end
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

function CaraBanii()
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
    local banii = GetHashKey("prop_money_bag_01")
       RequestAnimDict("anim@heists@box_carry@")
       TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
        banutii = CreateObject(GetHashKey('prop_money_bag_01'), x+5,y,z-0.3, false)
        AttachEntityToEntity(banutii, ped, GetPedBoneIndex(ped,  28422), 0.0, 'prop_money_bag_01', -0.1, 5.0, 0.0, 90.0, 1, 1, 0, 1, 0, 1)
end      

function CreateMasinaBanca(x,y,z,heading) 
	local hash = GetHashKey("Stockade")
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

--      HACKER GEO START      --    https://github.com/HackerGeo-sp1ne/vRP_Welcome

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~c~Te-ai angajat cu ~g~succes~c~! ~g~(Sofer Bancar)")
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

function NPCCaraBanii()
    ped = CreatePed(4, "s_m_y_airworker",267.84469604492,270.50738525391,105.63439178467, 3374176, false, true)
    SetEntityInvincible(ped, true)
    TaskGoStraightToCoord(ped, 262.56521606445,276.10763549805,105.62525939941  , 2.0, 5.0, 5.0, 5.0)
    CaraBanii()
    Wait(4000)
    DeleteObject(banutii)
    ClearPedTasks(ped)
    TriggerServerEvent("dabaniibancii")
    TaskGoStraightToCoord(ped, 267.84469604492,270.50738525391,105.63439178467  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    CaraBanii()
    TaskGoStraightToCoord(ped, 262.56521606445,276.10763549805,105.62525939941  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    ClearPedTasks(ped)
    DeleteObject(banutii)
    TriggerServerEvent("dabaniibancii")
    TaskGoStraightToCoord(ped, 267.84469604492,270.50738525391,105.63439178467  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    TaskGoStraightToCoord(ped, 267.84469604492,270.50738525391,105.63439178467  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    CaraBanii()
    TaskGoStraightToCoord(ped, 262.56521606445,276.10763549805,105.62525939941  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    DeleteObject(banutii)
    ClearPedTasks(ped)
    TriggerServerEvent("dabaniibancii")
    TaskGoStraightToCoord(ped, 267.84469604492,270.50738525391,105.63439178467  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    CaraBanii()
    TaskGoStraightToCoord(ped, 262.56521606445,276.10763549805,105.62525939941  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    DeleteObject(banutii)
    ClearPedTasks(ped)
    TriggerServerEvent("dabaniibancii")
    TaskGoStraightToCoord(ped, 267.84469604492,270.50738525391,105.63439178467  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    DeleteEntity(ped)
end

function NPCDUCEBANI1()
    ped = CreatePed(4, "s_m_y_airworker",-349.52667236328,-39.084480285645,49.024440765381, 3374176, false, true)
    SetEntityInvincible(ped, true)
    TaskGoStraightToCoord(ped, -336.36090087891,-43.649448394775,47.826694488525  , 2.0, 5.0, 5.0, 5.0)
    DeleteObject(banutii)
    Wait(4000)    
    CaraBanii()
    TriggerServerEvent("iabaniibancii")
    TaskGoStraightToCoord(ped, -349.52667236328,-39.084480285645,49.024440765381  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    TaskGoStraightToCoord(ped, -336.36090087891,-43.649448394775,47.826694488525  , 2.0, 5.0, 5.0, 5.0)
    DeleteObject(banutii)
    ClearPedTasks(ped)
    Wait(4000)    
    CaraBanii()
    TriggerServerEvent("iabaniibancii")
    TaskGoStraightToCoord(ped, -349.52667236328,-39.084480285645,49.024440765381  , 2.0, 5.0, 5.0, 5.0)
    CaraBanii()
    Wait(4000)
    DeleteObject(banutii)
    DeleteEntity(ped)
end


function NPCDUCEBANI2()
    ped = CreatePed(4, "s_m_y_airworker",314.45819091797,-278.40029907227,54.170783996582, 3374176, false, true)
    SetEntityInvincible(ped, true)
    TaskGoStraightToCoord(ped, 317.95516967773,-267.90203857422,53.766807556152  , 2.0, 5.0, 5.0, 5.0)
    DeleteObject(banutii)
    Wait(4000)    
    CaraBanii()
    TriggerServerEvent("iabaniibancii")
    TaskGoStraightToCoord(ped, 314.45819091797,-278.40029907227,54.170783996582  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    TaskGoStraightToCoord(ped, 317.95516967773,-267.90203857422,53.766807556152  , 2.0, 5.0, 5.0, 5.0)
    DeleteObject(banutii)
    ClearPedTasks(ped)
    Wait(4000)    
    CaraBanii()
    TriggerServerEvent("iabaniibancii")
    TaskGoStraightToCoord(ped, 314.45819091797,-278.40029907227,54.170783996582  , 2.0, 5.0, 5.0, 5.0)
    DeleteObject(banutii)
    Wait(4000)
    DeleteEntity(ped)
end

function NPCDUCEBANI3()
    ped = CreatePed(4, "s_m_y_airworker",-1213.5516357422,-329.2473449707,37.790725708008, 3374176, false, true)
    SetEntityInvincible(ped, true)
    TaskGoStraightToCoord(ped, -1220.08203125,-317.83203125,37.556327819824  , 2.0, 5.0, 5.0, 5.0)
    DeleteObject(banutii)
    Wait(4000)    
    CaraBanii()
    TriggerServerEvent("iabaniibancii")
    TaskGoStraightToCoord(ped, -1213.5516357422,-329.2473449707,37.790725708008  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    TaskGoStraightToCoord(ped, -1220.08203125,-317.83203125,37.556327819824  , 2.0, 5.0, 5.0, 5.0)
    DeleteObject(banutii)
    ClearPedTasks(ped)
    Wait(4000)    
    CaraBanii()
    TriggerServerEvent("iabaniibancii")
    TaskGoStraightToCoord(ped, -1213.5516357422,-329.2473449707,37.790725708008  , 2.0, 5.0, 5.0, 5.0)
    CaraBanii()
    Wait(4000)
    DeleteObject(banutii)
    Wait(1000)
    DeleteEntity(ped)
end


function NPCDUCEBANI4()
    ped = CreatePed(4, "s_m_y_airworker",152.94735717773,-1036.5998535156,29.33212852478, 3374176, false, true)
    SetEntityInvincible(ped, true)
    TaskGoStraightToCoord(ped, 157.6688079834,-1038.9437255859,29.23853302002  , 2.0, 5.0, 5.0, 5.0)
    DeleteObject(banutii)
    Wait(4000)    
    CaraBanii()
    TriggerServerEvent("iabaniibancii")
    TaskGoStraightToCoord(ped, 152.94735717773,-1036.5998535156,29.33212852478  , 2.0, 5.0, 5.0, 5.0)
    Wait(4000)
    TaskGoStraightToCoord(ped, 157.6688079834,-1038.9437255859,29.23853302002  , 2.0, 5.0, 5.0, 5.0)
    DeleteObject(banutii)
    ClearPedTasks(ped)
    Wait(4000)    
    CaraBanii()
    TriggerServerEvent("iabaniibancii")
    TaskGoStraightToCoord(ped, 152.94735717773,-1036.5998535156,29.33212852478  , 2.0, 5.0, 5.0, 5.0)
    CaraBanii()
    Wait(4000)
    DeleteObject(banutii)
    Wait(1000)
    DeleteEntity(ped)
end