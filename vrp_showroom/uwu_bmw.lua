
--Sistem maked by Uwu Hentai#4312

--Uwu Hentai GITHUB - https://github.com/UwuHentai


local uwumasini = {
    {
        {"x5e53","BMW X5",27500},
        {"m2","BMW M2",30000},
        {"m3e46","BMW M3",32000},

        {"x6m","BMW X6M",65000},
        {"I8","BMW I8",110000},
        {"bmwx7","BMW X5M 2019",145000}
    },

    {
        {"440i","BMW M4",38000},
        {"m516","BMW M5",72000},
        {"m6f13","BMW M6",80000}
    },
 
    {
        {"bmwz8","BMW Z8",42000},
        {"bmwe65","BMW Seria 7 E65",48000},
        {"17m760i","BMW Seria 7",62000}
    },

    {
        {"m850","BMW Seria 8 2019",250000},
        {"bmwx7","BMW X7 2019",160000},
        {"t20","Uwu Hentai","Uwu Hentai"}
    }
}

local uwucoord1 = {
    {623.30480957031,637.74938964844,128.91093444824},
    {622.15496826172,634.41339111328,128.91093444824},
    {621.09228515625,631.14813232422,128.91093444824},
    
    {616.30078125,617.79357910156,128.91110229492},
    {615.08422851563,614.73205566406,128.91107177734},
    {613.89166259766,611.47351074219,128.91107177734} 
}

local uwucoord2 = {
    {619.99261474609,628.06561279297,128.91093444824},
    {618.75872802734,624.75592041016,128.91093444824},
    {617.59173583984,621.33081054688,128.91093444824}
}

local sloturi = 0
local deschise = false
local arata_masini_bmw = false

Citizen.CreateThread(function()

    while true do
        Wait(0)
        if Vdist(GetEntityCoords(GetPlayerPed(-1)),622.5126953125,624.95574951172,128.91091918945) < 25.0 then
            DrawMarker(2,622.5126953125,624.95574951172,130.71108703613-0.5,0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501,121,121,121,140,1,0,0,true)
            if Vdist(GetEntityCoords(GetPlayerPed(-1)),622.5126953125,624.95574951172,128.91091918945) < 1.0 then
                if not deschise then
                    end
                if IsControlJustPressed(0,51) then
                    arata_masini_bmw = true
                    TriggerEvent("uwusterge:audi_masini")
                    sloturi = 0
                    uwu_spawn_bmw_veh()
                    deschise = not deschise
                    if not deschise then
                        uwu_sterge_bmw_veh()
                    end
                end 
            end
        end
    end
end)

RegisterNetEvent("uwusterge:bmw_masini")
AddEventHandler("uwusterge:bmw_masini",function()
    arata_masini_bmw = false
    uwu_sterge_bmw_veh()
    deschise = false
end)


Citizen.CreateThread(function()
    while true do
        Wait(0)
        while deschise do
            Wait(0)           
            DrawText3D(633.15930175781,640.84619140625,130.91107177734, "[HENTAI]~w~ NU AI STERS MASINILE DIHANIE! UNDE PLECI?!", 2.5, 1)
            DrawText3D(626.86334228516,623.77600097656,128.91108703613, "Vezi si alte masini Dihanie!\n~w~[~w~ Uwu Hentai SHOWROOM ~w~]", 0.9, 1)
            DrawMarker(42,626.86334228516,623.77600097656,128.91108703613-0.5,0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501,121,121,121,255,0,0,0,true)
            if Vdist(GetEntityCoords(GetPlayerPed(-1)),626.86334228516,623.77600097656,128.91108703613) < 1.0 then
                help("Apasa ~r~[E] ~w~pentru a vedea si restul masinilor!")
                if IsControlJustPressed(0,51) then
                    TriggerEvent("bmw:uwustergetot")
                    uwu_sterge_bmw_veh()
                    uwu_spawn_bmw_veh()
                end
            end
        end
    end
end)

uwustergeveh = {}
uwuspawneazaveh = {}

RegisterNetEvent("uwubmw:informatii")
AddEventHandler("uwubmw:informatii",function(x,y,z,veh,nume,vnume,pret)
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            if arata_masini_bmw then
                if Vdist(x,y,z,GetEntityCoords(GetPlayerPed(-1))) < 25.0 then
                    DrawText3D(x,y,z+0.65, "Masina ~w~"..nume, 1.0, 1)
                    DrawText3D(x,y,z+0.55, "Pret ~w~"..pret.." $", 1.0, 1)
                    DrawMarker(36,x,y,z+0.3,0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501,121,121,121,255,0,0,0,true)
                end
            end
                if IsPedInVehicle(GetPlayerPed(-1),veh,true) then
                    help("Apasa ~r~[E] ~w~pentru a cumpara masina!")
                    if IsControlJustPressed(0,51) then
                        TriggerServerEvent("buy_car", vnume, pret, "masina")
                    end
                end
                if Vdist(GetEntityCoords(GetPlayerPed(-1)),-44.827156066895,-1098.8873291016,26.422372817993) < 1.0 then
                    if IsControlJustPressed(0,51) then
                        break
                    end
                end
                if not deschise then
                    break
                end
            end
        end)
    end)
function seteaza_masinile_bmw_coord1(sloturi)
    uwuspawneazaveh = uwumasini[sloturi]

    for i,v in pairs(uwuspawneazaveh) do
        RequestModel( v[1] )
        while ( not HasModelLoaded( v[1] ) ) do
            Citizen.Wait( 1 )
        end
        local vehicle = CreateVehicle(v[1], uwucoord1[i][1],uwucoord1[i][2],uwucoord1[i][3], 250.77, false, false)
        table.insert(uwustergeveh, vehicle)
        SetVehicleOnGroundProperly(vehicle)
        SetVehicleColours(vehicle, 121, 121)
        RollDownWindow(vehicle, 0)
        RollDownWindow(vehicle, 1)
        SetVehicleEngineOn(vehicle,true,true,true)
        SetVehicleUndriveable(vehicle,true)
        FreezeEntityPosition(vehicle, true)
        SetVehicleNumberPlateText(vehicle, "HENTAI")
        TriggerEvent("uwubmw:informatii",uwucoord1[i][1],uwucoord1[i][2],uwucoord1[i][3]+0.2,vehicle,v[2],v[1],v[3])
    end
end

function seteaza_masinile_bmw_coord2(sloturi)
    uwuspawneazaveh = uwumasini[sloturi]

    for i,v in pairs(uwuspawneazaveh) do
        RequestModel( v[1] )
        while ( not HasModelLoaded( v[1] ) ) do
            Citizen.Wait( 1 )
        end
        local vehicle = CreateVehicle(v[1], uwucoord2[i][1],uwucoord2[i][2],uwucoord2[i][3], 250.77, false, false)
        table.insert(uwustergeveh, vehicle)
        SetVehicleOnGroundProperly(vehicle)
        SetVehicleColours(vehicle, 121, 121)
        RollDownWindow(vehicle, 0)
        RollDownWindow(vehicle, 1)
        SetVehicleEngineOn(vehicle,true,true,true)
        SetVehicleLights(vehicle, true)
        SetVehicleUndriveable(vehicle,true)
        FreezeEntityPosition(vehicle, true)
        SetVehicleNumberPlateText(vehicle, "HENTAI")
        TriggerEvent("uwubmw:informatii",uwucoord2[i][1],uwucoord2[i][2],uwucoord2[i][3]+0.2,vehicle,v[2],v[1],v[3])
    end
end

function uwu_spawn_bmw_veh()

    if sloturi < 1 then
        sloturi = 1
    else
        sloturi = sloturi + 1
    end

    if sloturi > sloturimaxime() then
        sloturi = 1
    end

    seteaza_masinile_bmw_coord1(sloturi)

    sloturi = sloturi + 1
    if sloturi > sloturimaxime() then
        sloturi = 1
    end

    seteaza_masinile_bmw_coord2(sloturi)

end

function uwu_sterge_bmw_veh()
    for i,v in pairs(uwustergeveh) do
        DeleteVehicle(v)
    end
    uwustergeveh = {}
end

function sloturimaxime()
    local a = 0
    for i,v in pairs(uwumasini) do
        a = a + 1
    end

    return a
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
        SetTextColour( 121,121,121,255 )
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

function help(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


local enumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle = nil
	end
}

local function getEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end
    
		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, enumerator)
    
		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next
  
		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function getVehicles()
  return getEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

RegisterNetEvent('bmw:uwustergetot')
AddEventHandler('bmw:uwustergetot', function()
    theVehicles = getVehicles()
    for veh in theVehicles do
        if DoesEntityExist(veh) and GetVehicleNumberPlateText(veh) == "VEHSHOP" then 
            if((GetPedInVehicleSeat(veh, -1)) == false) or ((GetPedInVehicleSeat(veh, -1)) == nil) or ((GetPedInVehicleSeat(veh, -1)) == 0)then
                Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( veh ) )
            end
        end
    end
end)
