vRPCarme = {}
Tunnel.bindInterface("vrp_traficantarme",vRPCarme)
Proxy.addInterface("vrp_traficantarme",vRPCarme)
vRPSarme = Tunnel.getInterfata("vrp_traficantarme","vrp_traficantarme")
vRP = Proxy.getInterface("vRP")

local job_arme = {2461.8796386719,1574.7407226562,33.11262512207}
local ia_armele = {2461.2575683594,1589.3774414062,33.035358428955}

local activare_job = false

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if(Vdist(GetEntityCoords(GetPlayerPed(-1)),job_arme[1],job_arme[2],job_arme[3])<2.0) then
            DrawText3D(job_arme[1],job_arme[2],job_arme[3]+1, "~w~[~c~TRAFICANT~w~] Apasa ~c~'E' ~w~sa te angajezi!", 1.0, 1)
            if IsControlJustPressed(0, 38) then
                vRPSarme.arme_job()
                vRPCarme.activare_job()
            end
        elseif (activare_job == true) then
            if(Vdist(GetEntityCoords(GetPlayerPed(-1)),ia_armele[1],ia_armele[2],ia_armele[3])<2.0) then
                DrawText3D(ia_armele[1],ia_armele[2],ia_armele[3]+1, "~w~[~c~TRAFICANT~w~] Apasa ~c~'E' ~w~sa iei armele!", 1.0, 1)
                if IsControlJustPressed(0, 38) then
                    vRPCarme.incepe_animatia()
                    vRPSarme.ia_armele()
                end
            end
        end
    end
end)

function vRPCarme.incepe_animatia()
    local ped = GetPlayerPed(-1)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_PARKING_METER", 0, true)
    Wait(10000)
    ClearPedTasks(ped)
    activare_job = false
end

function vRPCarme.activare_job()
    activare_job = true
end

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
        -- SetTextScale(0.0, 0.55)
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