

--Sistem maked by Uwu Hentai#4312

--Uwu Hentai GITHUB - https://github.com/UwuHentai

-- DONT WORK {IN PROGRESS}


local uwumasini = {
    {
        {"mb250","Mercedes Benz V250",35000},
        {"w140s600","Mercedes S600",36000},
        {"macla","Mercedes CLass",40000},
        {"S500W222","Mercedes S500",45000},
        {"g65amg","Mercedes G65",48000},
        {"gl63","Mercedes GL63",52000},
        {"mb300sl","Mercedes 300SL",58000}
    },

    {
        {"c63coupe","Mercedes C63S",63000},
        {"mlbrabus","Mercedes Brabus",66000},
        {"slsamg","Mercedes SLS AMG",72000}
    },
 
    {
        {"gt63s","Mercedes GT63S",80000},
        {"19S650","Maybach S650",64000},
        {"a6tfsi","Audi A6 2019",68500},
    },

    {
        {"rs7","Audi RS7",72000},
        {"sq72016","Audi SQ7",75000},
        {"a8lfsi","Audi A8 2018",125000}
    }
}

local uwucoord1 = {
    {648.31640625,631.97302246094,128.91093444824},
    {647.3037109375,628.79620361328,128.91093444824},
    {645.99029541016,625.91528320313,128.91093444824},

    {641.39392089844,612.90417480469,128.91093444824},
    {640.14178466797,609.447265625,128.91093444824},
    {638.93585205078,606.22351074219,128.91093444824},
    {637.82995605469,602.95513916016,128.91093444824}
}

local uwucoord2 = {
    {644.85339355469,622.64544677734,128.91093444824},
    {643.66217041016,619.54034423828,128.91093444824}, 
    {642.39440917969,616.20343017578,128.91093444824}
}

  
local sloturi = 0
local deschise = false
local arata_masini_merce = false

Citizen.CreateThread(function()
  
    while true do
        Wait(0)
        if Vdist(GetEntityCoords(GetPlayerPed(-1)),646.14001464844,616.38098144531,128.91108703613) < 25.0 then
          DrawMarker(2,646.14001464844,616.38098144531,130.91108703613-0.5,0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501,121,121,121,140,1,0,0,true)
            if Vdist(GetEntityCoords(GetPlayerPed(-1)),646.14001464844,616.38098144531,128.91108703613) < 1.0 then
                if not deschise then
                    help("")
                else
                    help("")
                   
                end
                if IsControlJustPressed(0,51) then
                    arata_masini_merce = true
                    TriggerEvent("uwusterge:bmw_masini")
                    sloturi = 0
                    uwu_spawn_merce_veh()
                    deschise = not deschise
                    if not deschise then
                      uwu_sterge_merce_veh()
                    end
                end 
            end
        end
    end
end)

RegisterNetEvent("uwusterge:merce_masini")
AddEventHandler("uwusterge:merce_masini",function()
    arata_masini_merce = false
    uwu_sterge_merce_veh()
    deschise = false
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        while deschise do
            Wait(0)
            DrawText3D(649.75952148438,615.18695068359,128.91108703613, "Vezi si alte masini Dihanie!\n~w~[~w~ Uwu Hentai SHOWROOM ~w~]", 0.9, 1)
            DrawMarker(42,649.75952148438,615.18695068359,128.91108703613-0.5,0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501,121,121,121,255,0,0,0,true)
            if Vdist(GetEntityCoords(GetPlayerPed(-1)),649.75952148438,615.18695068359,128.91108703613) < 1.0 then
                help("Apasa ~r~[E] ~w~pentru a vedea si restul masinilor!")
                if IsControlJustPressed(0,51) then
                    TriggerEvent("merce:uwustergetot")
                    uwu_sterge_merce_veh()
                    uwu_spawn_merce_veh()
                end
            end
        end
    end
end)

uwustergeveh = {}
uwuspawneazaveh = {}

RegisterNetEvent("uwumerce:informatii")
AddEventHandler("uwumerce:informatii",function(x,y,z,veh,nume,vnume,pret)
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            if arata_masini_merce then
            if Vdist(x,y,z,GetEntityCoords(GetPlayerPed(-1))) < 25.0 then
                DrawText3D(x,y,z+0.65, "Masina ~w~"..nume, 1.0, 1)
                DrawText3D(x,y,z+0.55, "Pret ~w~"..pret.." $", 1.0, 1)
                DrawMarker(36,x,y,z+0.3,0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501,121,121,121,255,0,0,0,true)
            end
        end
            if IsPedInVehicle(GetPlayerPed(-1),veh,true) then
                help("Apasa ~y~[E] ~w~pentru a cumpara masina!")
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

function seteaza_masinile_merce_coord1(sloturi)
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
          SetVehicleEngineOn(vehicle,false,true,true)
          SetVehicleUndriveable(vehicle,true)
          FreezeEntityPosition(vehicle, true)
          SetVehicleNumberPlateText(vehicle, "HENTAI")
          TriggerEvent("uwumerce:informatii",uwucoord1[i][1],uwucoord1[i][2],uwucoord1[i][3]+0.2,vehicle,v[2],v[1],v[3])
      end
  end

  function seteaza_masinile_merce_coord2(sloturi)
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
          SetVehicleEngineOn(vehicle,false,true,true)
          SetVehicleUndriveable(vehicle,true)
          FreezeEntityPosition(vehicle, true)
          SetVehicleNumberPlateText(vehicle, "HENTAI")
          TriggerEvent("uwumerce:informatii",uwucoord2[i][1],uwucoord2[i][2],uwucoord2[i][3]+0.2,vehicle,v[2],v[1],v[3])
      end
  end

  function uwu_spawn_merce_veh()
  
    if sloturi < 1 then
      sloturi = 1
    else
      sloturi = sloturi + 1
    end

    if sloturi > sloturimaxime() then
      sloturi = 1
    end

    seteaza_masinile_merce_coord1(sloturi)

    sloturi = sloturi + 1
    if sloturi > sloturimaxime() then
      sloturi = 1
    end

    seteaza_masinile_merce_coord2(sloturi)

end

function uwu_sterge_merce_veh()
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

RegisterNetEvent('merce:uwustergetot')
AddEventHandler('merce:uwustergetot', function()
    theVehicles = getVehicles()
    for veh in theVehicles do
        if DoesEntityExist(veh) and GetVehicleNumberPlateText(veh) == "HENTAI" then 
            if((GetPedInVehicleSeat(veh, -1)) == false) or ((GetPedInVehicleSeat(veh, -1)) == nil) or ((GetPedInVehicleSeat(veh, -1)) == 0)then
                Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( veh ) )
            end
        end
    end
end)