
--Sistem maked by Uwu Hentai#4312

--Uwu Hentai GITHUB - https://github.com/UwuHentai


RegisterCommand('Uwu Hentai', function(veh)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    if veh then
      SetNetworkVehicleAsGhost(veh, true)
    end
  end, false)
  
  
  local uwumasini = {
    {
        {"s1","Audi RS3",24500},
        {"rs3","Audi RS3",35000},
        {"rs4avant","Audi RS4 Avant",41200},
        {"a8fsi","Audi A8",86000},
        {"r8v10","Audi R8",100000},
        {"a8lfsi","Audi A8 2018",125000},
        {"a6avant","Audi A6 Avant",71000}
    },

    {
        {"ttrs","Audi TT RS",42000},
        {"rs5r","Audi RS5",48900},
        {"aaq4","Audi A4",50000}
    },
 
    {
        {"rs6","Audi RS6",58000},
        {"a615","Audi A6",64000},
        {"a6tfsi","Audi A6 2019",68500},
    },

    {
        {"rs7","Audi RS7",72000},
        {"sq72016","Audi SQ7",75000},
        {"a8lfsi","Audi A8 2018",125000}
    }
}
  
  local uwucoord1 = {
    {639.46221923828,635.46936035156,128.91107177734},
    {638.28015136719,632.54077148438,128.91107177734},
    {637.13470458984,629.24072265625,128.91107177734},
    {632.41375732422,615.94073486328,128.91107177734},
    {631.23626708984,612.93133544922,128.91107177734},
    {629.93914794922,609.50347900391,128.91107177734},
    {628.66284179688,605.85852050781,128.91091918945}
}

local uwucoord2 = {
    {635.8857421875,625.70532226563,128.91107177734},
    {634.71936035156,622.57489013672,128.91107177734}, 
    {633.56060791016,619.57238769531,128.91107177734}
}
  
  local sloturi = 0
  local deschise = false
  local arata_masini_audi = false
  
  Citizen.CreateThread(function()
  
      while true do
          Wait(0)
          if Vdist(GetEntityCoords(GetPlayerPed(-1)),631.18646240234,622.04052734375,128.91108703613) < 25.0 then
            DrawMarker(2,631.18646240234,622.04052734375,130.71108703613-0.5,0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501,121,121,121,140,1,0,0,true)
              if Vdist(GetEntityCoords(GetPlayerPed(-1)),631.18646240234,622.04052734375,128.91108703613) < 1.0 then
                  if not deschise then
                      help("")
                  else
                      help("")
                     
                  end
                  if IsControlJustPressed(0,51) then
                      arata_masini_audi = true
                      TriggerEvent("uwusterge:bmw_masini")
                      sloturi = 0
                      uwu_spawn_audi_veh()
                      deschise = not deschise
                      if not deschise then
                        uwu_sterge_audi_veh()
                      end
                  end 
              end
          end
      end
  
  end)
  
  RegisterNetEvent("uwusterge:audi_masini")
  AddEventHandler("uwusterge:audi_masini",function()
      arata_masini_audi = false
      uwu_sterge_audi_veh()
      deschise = false
  end)
  
  Citizen.CreateThread(function()
      while true do
          Wait(0)
          while deschise do
              Wait(0)
              DrawText3D(626.86334228516,623.77600097656,128.91108703613, "Vezi si alte masini Dihanie!\n~w~[~w~ Uwu Hentai SHOWROOM ~w~]", 0.9, 1)
              DrawMarker(42,626.86334228516,623.77600097656,128.91108703613-0.5,0, 0, 0, 0, 0, 0, 0.2501,0.2501,0.2501,121,121,121,255,0,0,0,true)
              if Vdist(GetEntityCoords(GetPlayerPed(-1)),626.86334228516,623.77600097656,128.91108703613) < 1.0 then
                  help("Apasa ~r~[E] ~w~pentru a vedea si restul masinilor!")
                  if IsControlJustPressed(0,51) then
                      TriggerEvent("audi:uwustergetot")
                      uwu_sterge_audi_veh()
                      uwu_spawn_audi_veh()
                  end
              end
          end
      end
  end)
  
  uwustergeveh = {}
  uwuspawneazaveh = {}
  
  
  RegisterNetEvent("uwuaudi:informatii")
  AddEventHandler("uwuaudi:informatii",function(x,y,z,veh,nume,vnume,pret)
      Citizen.CreateThread(function()
          while true do
              Wait(0)
              if arata_masini_audi then
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
  
  function seteaza_masinile_audi_coord1(sloturi)
    uwuspawneazaveh = uwumasini[sloturi]
  
      for i,v in pairs(uwuspawneazaveh) do
          RequestModel( v[1] )
          while ( not HasModelLoaded( v[1] ) ) do
              Citizen.Wait( 1 )
          end
          local vehicle = CreateVehicle(v[1], uwucoord1[i][1],uwucoord1[i][2],uwucoord1[i][3], 70.0, false, false)
          table.insert(uwustergeveh, vehicle)
          SetVehicleOnGroundProperly(vehicle)
          SetVehicleColours(vehicle, 121, 121)
          RollDownWindow(vehicle, 0)
          RollDownWindow(vehicle, 1)
          SetVehicleEngineOn(vehicle,false,true,true)
          SetVehicleUndriveable(vehicle,true)
          FreezeEntityPosition(vehicle, true)
          SetVehicleNumberPlateText(vehicle, "HENTAI")
          TriggerEvent("uwuaudi:informatii",uwucoord1[i][1],uwucoord1[i][2],uwucoord1[i][3]+0.2,vehicle,v[2],v[1],v[3])
      end
  end
  
  function seteaza_masinile_audi_coord2(sloturi)
    uwuspawneazaveh = uwumasini[sloturi]
  
      for i,v in pairs(uwuspawneazaveh) do
          RequestModel( v[1] )
          while ( not HasModelLoaded( v[1] ) ) do
              Citizen.Wait( 1 )
          end
          local vehicle = CreateVehicle(v[1], uwucoord2[i][1],uwucoord2[i][2],uwucoord2[i][3], 70.0, false, false)
          table.insert(uwustergeveh, vehicle)
          SetVehicleOnGroundProperly(vehicle)
          SetVehicleColours(vehicle, 121, 121)
          RollDownWindow(vehicle, 0)
          RollDownWindow(vehicle, 1)
          SetVehicleEngineOn(vehicle,false,true,true)
          SetVehicleUndriveable(vehicle,true)
          FreezeEntityPosition(vehicle, true)
          SetVehicleNumberPlateText(vehicle, "HENTAI")
          TriggerEvent("uwuaudi:informatii",uwucoord2[i][1],uwucoord2[i][2],uwucoord2[i][3]+0.2,vehicle,v[2],v[1],v[3])
      end
  end
  
  function uwu_spawn_audi_veh()
  
      if sloturi < 1 then
        sloturi = 1
      else
        sloturi = sloturi + 1
      end
  
      if sloturi > sloturimaxime() then
        sloturi = 1
      end
  
      seteaza_masinile_audi_coord1(sloturi)
  
      sloturi = sloturi + 1
      if sloturi > sloturimaxime() then
        sloturi = 1
      end
  
      seteaza_masinile_audi_coord2(sloturi)
  
  end
  
  function uwu_sterge_audi_veh()
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
  
  RegisterNetEvent('audi:uwustergetot')
  AddEventHandler('audi:uwustergetot', function()
      theVehicles = getVehicles()
      for veh in theVehicles do
          if DoesEntityExist(veh) and GetVehicleNumberPlateText(veh) == "HENTAI" then 
              if((GetPedInVehicleSeat(veh, -1)) == false) or ((GetPedInVehicleSeat(veh, -1)) == nil) or ((GetPedInVehicleSeat(veh, -1)) == 0)then
                  Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( veh ) )
              end
          end
      end
  end)
  