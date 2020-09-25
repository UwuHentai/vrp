vRPCpizza = {}
Tunnel.bindInterface("vrp_pizza",vRPCpizza)
Proxy.addInterface("vrp_pizza",vRPCpizza)
vRPSpizza = Tunnel.getInterfata("vrp_pizza","vrp_pizza")
vRP = Proxy.getInterface("vRP")

local take_job = {25.744394302368,-1347.333984375,29.497032165528}
local pizza = {31.837678909302,-1343.2100830078,29.497024536132}

local JPizza = false

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId(-1)
        local pedc = GetEntityCoords(ped)
        if(Vdist(GetEntityCoords(GetPlayerPed(-1)),take_job[1],take_job[2],take_job[3]) <= 2.0) then
                Draw3DText(pedc.x, pedc.y, pedc.z + 1, "~h~~w~Apasa ~o~'E' ~w~sa te angajezi ! ~w~[~o~JERRY'S PIZZA~w~]", 0.3)
                DrawMarker(42, take_job[1],take_job[2],take_job[3] , 0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
                    if IsControlJustPressed(0, 38) then
                        vRPSpizza.iaJobul()
                        vRPCpizza.JobAdevarat()
                    end
                elseif (JPizza == true) then
                    if(Vdist(GetEntityCoords(GetPlayerPed(-1)),pizza[1],pizza[2],pizza[3]) <= 2.0) then
                        Draw3DText(pedc.x, pedc.y, pedc.z+1, "~h~~w~Apasa ~o~'E' ~w~sa iei ~o~Pizza~w~!", 0.3)
                        DrawMarker(42, pizza[1],pizza[2],pizza[3], 0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
                        if(Vdist(GetEntityCoords(GetPlayerPed(-1)),pizza[1],pizza[2],pizza[3]) <= 1.0) then
                            if IsControlJustPressed(0, 38) then
                                vRPCpizza.takepizza()
                    end
                end
            end
        end
    end
end)

function vRPCpizza.JobAdevarat()
    JPizza = true
end

function vRPCpizza.takepizza()
    local ped = GetPlayerPed(-1)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_PARKING_METER", 0, true)
    Wait(5000)
    ClearPedTasks(ped)
    vRPSpizza.iaPizza()
    Wait(1000)
    JPizza = false
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