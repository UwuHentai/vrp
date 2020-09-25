vRPChacker = {}
Tunnel.bindInterface("vrp_hacker",vRPChacker)
Proxy.addInterface("vrp_hacker",vRPChacker)
vRPShacker = Tunnel.getInterfata("vrp_hacker","vrp_hacker")
vRP = Proxy.getInterface("vRP")

local meniu = false

RegisterNetEvent("meniu")
AddEventHandler("meniu",function()
    meniu = not meniu
end)

local show = false

RegisterNetEvent("show")
AddEventHandler("show",function()
    show = not show
end)

muiehyp3 = true

local ATMs = {
    {33.232,-1347.849, 29.497},
    {129.216,-1292.347, 29.269},
    {287.645,-1282.646,29.659},
    {289.012,-1256.545,29.440},
    {295.839,-895.640,29.217},
    {-302.408,-829.945,32.417},
    {5.134,-919.949,29.557},
    {937.814,-941.209,44.410},
    {1077.692,-775.796,58.218},
    {1139.018,-469.886,66.789},
    {1168.975,-457.241,66.641},
    {1153.884,-326.540,69.245},
    {381.2827,323.2518,103.270},
    {-164.568,233.5066,94.919},
    {-1409.39,-99.2603,52.473},
    {-2072.41,-316.959,13.345},
    {-1305.40,-706.240,25.352},
    {-538.225,-854.423,29.234},
    {-711.156,-818.958,23.768},
    {-717.614,-915.880,19.268},
    {-526.566,-1222.90,18.434},
    {-256.831,-719.646,33.444},
    {-203.548,-861.588,30.205},
    {112.4102,-776.162,31.427},
    {112.9290,-818.710,31.386},
    {119.9000,-883.826,31.191},
    {-846.304,-340.402,38.687},
    {-56.1935,-1752.53,29.452},
    {-261.692,-2012.64,30.121},
    {-273.001,-2025.60,30.197},
    {24.589, -946.056, 29.357},
    {-254.112, -692.483, 33.616},
    {-1570.197, -546.651, 34.955},
    {-1415.909, -211.825, 46.500},
    {-1430.112, -211.014, 46.500}
}

local totalMoney = 0

function vRPChacker.startjob()
    totalMoney = 0
end

local job_started = false

RegisterCommand("hacker", function(source)
    if vRPShacker.checkJob() then 
        vRPChacker.startjob()
    end
end)

RegisterCommand("sniper", function()
    vRPShacker.hack_sniper()
end)

Citizen.CreateThread(
    function()
        while muiehyp3 do
            Wait(0)
            local ped = GetPlayerPed(-1)
            local pedc = GetEntityCoords(ped)
            for k,v in pairs(ATMs) do
                local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
                if distance < 2 then
                    if (job_started == true) then
                    drawtxt("~w~Apasa ~g~[ALT] ~w~pentru a ~g~Sparge Bancomatul", 1, 1, 0.500, 0.900, 0.40, 255, 0, 0, 255)
                    DrawMarker(29, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 255, 0, 0, 200, 0, 0, 0, 1, 0, 0, 0)
                    if IsControlJustPressed(0, 19) then
                        meniu = not meniu
                    end
                        if meniu then
                            ShowCursorThisFrame()
                            DisableControlAction(0, 24, true)
                            DisableControlAction(0, 47, true)
                            DisableControlAction(0, 58, true)
                            DisableControlAction(0, 263, true)
                            DisableControlAction(0, 264, true)
                            DisableControlAction(0, 257, true)
                            DisableControlAction(0, 140, true)
                            DisableControlAction(0, 141, true)
                            DisableControlAction(0, 142, true)
                            DisableControlAction(0, 143, true)
                            DisableControlAction(0, 1, true)
                            DisableControlAction(0, 2, true)

                            DrawRect(0.500, 0.500, 0.200, 0.200, 0,0,0, 100)

                            drawtxt("~w~[ ~r~Iesi~w~ ]", 1, 1, 0.500, 0.620, 0.50, 255, 0, 0, 255)
                            DrawRect(0.500, 0.627, 0.050, 0.035, 0,0,0, 100)

                            
                            drawtxt("~c~Skimmer", 1, 1, 0.500, 0.530, 0.80, 255, 0, 0, 255)
                            DrawSprite('buletinul', 'buletinul', 0.500, 0.470, 0.100, 0.100, 0, 255, 255, 255, 255)
                            if IsControlJustPressed(0, 18) and isCursorInPosition(0.500, 0.530, 0.10, 0.10) then 
                                exports["progbars"]:StartProg(30000,"")
                                TaskStartScenarioInPlace(ped, "PROP_HUMAN_PARKING_METER", 0, true)
                                TriggerServerEvent("takeskimmer") 
                                FreezeEntityPosition(ped, true)
                                Wait(30000)
                                FreezeEntityPosition(ped, false)
                                ClearPedTasks(ped)
                                SendNUIMessage({transactionTyperestart = 'playSoundrestart'})
                                meniu = false
                                exports["progbars"]:CloseProg()
                                money = math.random(2500, 5000)
                                vRPShacker.getMoney({money})
                                totalMoney = totalMoney + money
                                vRPChacker.terminaJob(totalMoney)
                            end
                        end
                            

                    if IsControlJustPressed(0, 18) and isCursorInPosition(0.500, 0.620, 0.10, 0.10) then 
                        meniu = false
                    end
                end
            end
        end
    end
end)


local coordJOB = {
    {1273.0008544922,-1711.7641601562,54.771430969238}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(coordJOB) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 1 then
                Draw3DText(pedc.x, pedc.y, pedc.z+1, "~w~Apasa ~g~[E] ~w~ca sa iei job-ul de ~g~HACKER!", 0.2)
                DrawMarker(42, v[1],v[2],v[3]-0.5 , 0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501, 11, 253, 3, 200, 0, 0, 0, 1, 0, 0, 0)
                if distance < 1 then 
                    if IsControlJustPressed(0, 38) then 
                        vRPShacker.iaJobul()
                    end
                end
            end
        end
    end
end)

local coordSKIMMER = {
    {1275.6262207031,-1710.5267333984,54.771495819092}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        local pedc = GetEntityCoords(ped)
        for k,v in pairs(coordSKIMMER) do
            local distance = GetDistanceBetweenCoords(pedc.x, pedc.y, pedc.z, v[1], v[2], v[3], true)
            if distance < 1 then
                Draw3DText(pedc.x, pedc.y, pedc.z+1, "~w~Apasa ~g~[E] ~w~ca sa iei SKIMMERE!", 0.2)
                DrawMarker(42, v[1],v[2],v[3]-0.5 , 0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501, 11, 253, 3, 200, 0, 0, 0, 1, 0, 0, 0)
                if distance < 1 then 
                    if IsControlJustPressed(0, 38) then 
                        TaskStartScenarioInPlace(ped, "PROP_HUMAN_PARKING_METER", 0, true)
                        vRPShacker.iaSkimmere()
                        Wait(1000)
                        ClearPedTasks(ped)
                    end
                end
            end
        end
    end
end)

function vRPChacker.startjob()
    job_started = true
end


function vRPChacker.terminaJob(totalMoney)
    tura1 = false
    tura2 = false
    job_started = false
    vRPChacker.job(totalMoney)
    totalMoney = 0
end

function vRPChacker.setTotalMoney(amount)
    totalMoney = totalMoney + amount
end


function drawtxt(text, font, centre, x, y, scale, r, g, b, a)
    y = y - 0.010
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function isCursorInPosition(x, y, width, height)
    local sx, sy = 1920, 1080
    local cx, cy = GetNuiCursorPosition()
    local cx, cy = (cx / sx), (cy / sy)

    local width = width / 2
    local height = height / 2

    if (cx >= (x - width) and cx <= (x + width)) and (cy >= (y - height) and cy <= (y + height)) then
        return true
    else
        return false
    end
end


function drawHudText(x,y ,width,height,scale, text, r,g,b,a, outline, font, center)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextCentre(center)
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

local alpha = 255

function vRPChacker.job(suma)
	arataRespect = not arataRespect
	TriggerEvent('InteractSound_CL:PlayOnOne', 'pass', 0.15)
	Citizen.CreateThread(function()
		while true do
			if alpha <= 5 then
				alpha = 180
				break
			end		
			if(arataRespect)then
				drawHudText(0.5, 0.40, 0,0, 2.0, "MISSION PASSED!", 255, 183, 0, alpha, 1, 7, 1)
				drawHudText(0.5, 0.50, 0,0, 1.2, "RESPECT +", 255, 255, 255, alpha, 1, 7, 1)
				drawHudText(0.5, 0.55, 0,0, 1.3, "$" ..suma .."", 255, 255, 255, alpha, 1, 7, 1)
			end
			SetTimeout(5000, function()
				alpha = alpha -1
			end)
			Citizen.Wait(0)
    end
    SetTimeout(4000, function()
		  arataRespect = false
      alpha = 255
    end)
	end)
end

function DrawImage3D(name1, name2, x, y, z, width, height, rot, r, g, b, alpha) 
        local onScreen,_x,_y=World3dToScreen2d(x,y,z)
        local px,py,pz=table.unpack(GetGameplayCamCoords())
        local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, true)
    
        if onScreen then
        local width = (1/dist)*width
        local height = (1/dist)*height
        local fov = (1/GetGameplayCamFov())*100
        local width = width*fov
        local height = height*fov
    
        local CoordFrom = GetEntityCoords(PlayerPedId(), true)
            local RayHandle = StartShapeTestRay(CoordFrom.x, CoordFrom.y, CoordFrom.z, x, y, z, -1, PlayerPedId(), 0)
            local _, _, _, _, object = GetShapeTestResult(RayHandle)
        if(object == 0) or (object == nil)then
        DrawSprite(name1, name2, _x, _y, width, height, rot, r, g, b, alpha)
        end
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