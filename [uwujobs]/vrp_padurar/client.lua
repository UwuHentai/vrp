local wood = {
    {-620.72607421875,5498.39453125,51.310722351074},
    {-591.08654785156,5495.5463867188,53.8994140625},
    {-585.17517089844,5490.515625,55.532028198242},
    {-572.5166015625,5507.5068359375,55.835231781006}
}

local woodcarrys = {
    {-613.48858642578,5513.5634765625,50.496730804443}
}

local woodremake = {
    {-492.79766845703,5345.8500976563,82.604667663574}
}

local createchair = {
    {-476.1120300293,5301.69921875,86.687347412109}
}

local sellchair = {
    {-513.46185302734,5268.3627929688,80.606643676758}
}

local createtable = {
    {-474.19705200195,5306.6948242188,86.686981201172}
}

local selltable = {
    {-512.42626953125,5273.8686523438,80.450462341309}
}

local forestcar = {
    {-837.94342041016,5407.5717773438,34.543998718262}
}

local takejob = {
    {-840.50830078125,5401.6967773438,34.615211486816}
}

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local P = PlayerPedId(-1)
        local PC = GetEntityCoords(P)
        for k, v in pairs(takejob) do
            local dis = GetDistanceBetweenCoords(PC.x, PC.y, PC.z, v[1], v[2], v[3], true)
            if dis < 1 then
                Draw3DText(PC.x, PC.y, PC.z, "~h~~c~Apasa ~g~'DEL' ~c~sa te angajezi ! ~g~(Padurar)", 0.5)
                DrawMarker(1, v[1],v[2],v[3] - 1 , 0, 0, 0, 0, 0, 0, 1.5001,1.5001,0.5001, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
                if dis < 1 then
                    if IsControlJustPressed(0, 178) then 
                        TriggerServerEvent("takejob")
                        SendNUIMessage({transactionType = 'playSound'})
                        announcestring = "~h~~c~Dute si ia-ti ~g~masina!"
                        Wait(5000)
                        announcestring = false
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local P = PlayerPedId(-1)
        local PC = GetEntityCoords(P)
        for k, v in pairs(forestcar) do 
            local dis = GetDistanceBetweenCoords(PC.x, PC.y, PC.z, v[1], v[2], v[3], true)
            if dis < 5 then 
            Draw3DText(PC.x, PC.y, PC.z, "~h~~c~Apasa ~g~'HOME' ~c~sa iti iei masina de ~g~Padurar", 0.5)
            DrawMarker(1, v[1],v[2],v[3] - 1 , 0, 0, 0, 0, 0, 0, 1.5001,1.5001,0.5001, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
            if dis < 1 then
                if IsControlJustPressed(0, 213) then
                    SendNUIMessage({transactionType2 = 'playSound2'})
                    SetNewWaypoint(-609.13958740234,5510.7592773438,49.826019287109)
                    TriggerServerEvent("forestcar")
                    Wait(360000)
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local P = PlayerPedId(-1)
        local PC = GetEntityCoords(P)
        for k, v in pairs(woodcarrys) do
        local dis = GetDistanceBetweenCoords(PC.x, PC.y, PC.z, v[1], v[2], v[3], true)
        if dis < 5 then 
            Draw3DText(PC.x, PC.y, PC.z, "~h~~c~Apasa ~g~'E' ~c~sa asezi ~g~lemnul", 0.5)
            DrawMarker(1, v[1],v[2],v[3] - 1 , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
            if dis < 1 then
                if IsControlJustPressed(0, 38) then
                    ClearPedTasksImmediately(GetPlayerPed(-1))
                    TaskStartScenarioInPlace(P, "WORLD_HUMAN_SUNBATHE", 0, true)
                    Wait(4000)
                    SetNewWaypoint(-492.79766845703,5345.8500976563,82.604667663574)
                    TriggerServerEvent("notifcaredulemnu2")
                    DeleteObject(copac)
                    DeleteObject(cvprop)
                    ClearPedTasks(P)
                    Wait(5000)
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local P = PlayerPedId(-1)
        local PC = GetEntityCoords(P)
        for k, v in pairs(wood) do
        local dis = GetDistanceBetweenCoords(PC.x, PC.y, PC.z, v[1], v[2], v[3], true)
        if dis < 10 then 
            Draw3DText(PC.x, PC.y, PC.z, "~h~~c~Apasa ~g~'E' ~c~sa tai copacul", 0.5)
            DrawMarker(1, v[1],v[2],v[3] - 1 , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
            if dis < 1 then 
                if IsControlJustPressed(0, 38) then
                    while (not HasAnimDictLoaded("melee@large_wpn@streamed_core")) do 
                        RequestAnimDict("melee@large_wpn@streamed_core")
                        Wait(5000)
                    end
                    local axe = CreateObject(GetHashKey("prop_ld_fireaxe"), PC.x, PC.y, PC.z + 0.2,  true,  true, true)
                    AttachEntityToEntity(axe, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.08, -0.4, -0.10, 80.0, -20.0, 175.0, true, true, false, true, 1, true)
                    TaskPlayAnim(GetPlayerPed(-1), "melee@large_wpn@streamed_core", "ground_attack_on_spot", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
                    FreezeEntityPosition(GetPlayerPed(-1),true)
                    Wait(4000)
                    TriggerServerEvent('notifcaredulemnu')
                    DeleteObject(axe)
                    ClearPedTasksImmediately(GetPlayerPed(-1))
                    FreezeEntityPosition(GetPlayerPed(-1),false)
                    woodcarry()
                    Wait(10000)
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local P = PlayerPedId(-1)
        local PC = GetEntityCoords(P)
        for k, v in pairs(woodremake) do 
            local dis = GetDistanceBetweenCoords(PC.x, PC.y, PC.z, v[1], v[2], v[3], true)
            if dis < 10 then
                Draw3DText(PC.x, PC.y, PC.z, "~h~~c~Apasa ~g~'E' ~c~sa pocesezi ~g~lemnul", 0.5)
                DrawMarker(1, v[1],v[2],v[3] - 1 , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
                if dis < 5 then
                    if IsControlJustPressed(0, 38) then
                        TaskStartScenarioInPlace(P, 'PROP_HUMAN_PARKING_METER', 0, true)
                        Wait(1000)
                        ClearPedTasks(P)
                        TriggerServerEvent('startprocess')
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local P = PlayerPedId(-1)
        local PC = GetEntityCoords(P)
        for k, v in pairs(createchair) do 
            local dis = GetDistanceBetweenCoords(PC.x, PC.y, PC.z, v[1], v[2], v[3], true)
            if dis < 5 then
                Draw3DText(PC.x, PC.y, PC.z, "~h~~c~Apasa ~g~'E' ~c~sa faci un ~g~Scaun de Lemn 🪑", 0.5)
                DrawMarker(1, v[1],v[2],v[3] - 1 , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
                if dis < 2 then
                    if IsControlJustPressed(0, 38) then
                        TaskStartScenarioInPlace(P, 'PROP_HUMAN_PARKING_METER', 0, true)
                        Wait(1000)
                        ClearPedTasks(P)
                        TriggerServerEvent('startprocesschair')
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local P = PlayerPedId(-1)
        local PC = GetEntityCoords(P)
        for k, v in pairs(sellchair) do 
            local dis = GetDistanceBetweenCoords(PC.x, PC.y, PC.z, v[1], v[2], v[3], true)
            if dis < 2 then
                Draw3DText(PC.x, PC.y, PC.z, "~h~~c~Apasa ~g~'E' ~c~sa vinzi ~g~Scaunele 🪑", 0.5)
                DrawMarker(1, v[1],v[2],v[3] - 1 , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
                if dis < 2 then
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('sellchair')
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local P = PlayerPedId(-1)
        local PC = GetEntityCoords(P)
        for k, v in pairs(createtable) do 
            local dis = GetDistanceBetweenCoords(PC.x, PC.y, PC.z, v[1], v[2], v[3], true)
            if dis < 2 then
                Draw3DText(PC.x, PC.y, PC.z, "~h~~c~Apasa ~g~'E' ~c~sa faci o ~g~Masa de Lemn 🪑", 0.5)
                DrawMarker(1, v[1],v[2],v[3] - 1 , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
                if dis < 2 then
                    if IsControlJustPressed(0, 38) then
                        TaskStartScenarioInPlace(P, 'PROP_HUMAN_PARKING_METER', 0, true)
                        Wait(1000)
                        ClearPedTasks(P)
                        TriggerServerEvent('startprocesstable')
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local P = PlayerPedId(-1)
        local PC = GetEntityCoords(P)
        for k, v in pairs(selltable) do 
            local dis = GetDistanceBetweenCoords(PC.x, PC.y, PC.z, v[1], v[2], v[3], true)
            if dis < 2 then
                Draw3DText(PC.x, PC.y, PC.z, "~h~~c~Apasa ~g~'E' ~c~sa vinzi ~g~Mesele 🪑", 0.5)
                DrawMarker(1, v[1],v[2],v[3] - 1 , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
                if dis < 2 then
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('selltable')
                    end
                end
            end
        end
    end
end)


function woodcarry()
 	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
 	local copac = GetHashKey("prop_fence_log_01") 
        RequestAnimDict("anim@heists@box_carry@")
        TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
 	    cvprop = CreateObject(GetHashKey('prop_fence_log_01'), x+5,y,z-0.3, false)
 	    AttachEntityToEntity(cvprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, 'prop_fence_log_01', -0.1, 5.0, 0.0, 90.0, 1, 1, 0, 1, 0, 1)
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
        SetTextFont(0)
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
	PushScaleformMovieFunctionParameterString("~c~Te-ai angajat cu ~g~succes~c~! ~g~(Padurar)")
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