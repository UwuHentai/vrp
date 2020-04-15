local coordonate = {
  {-488.9875793457,5776.8051757813,45.154369354248},
  {-475.92651367188,5786.4775390625,48.910209655762},
  {-471.84631347656,5792.8315429688,50.006954193115},
  {-453.24127197266,5798.14453125,51.570419311523},
  {-445.82806396484,5801.8344726563,52.236480712891},
  {-448.35745239258,5807.4438476563,50.943939208984}
}

Citizen.CreateThread(function ()--
while true do
  Wait(1)
  local ped = GetPlayerPed(-1)
      local coords = GetEntityCoords(ped)
      for k,v in pairs (coordonate) do
          local distanta = GetDistanceBetweenCoords(coords.x, coords.y, coords.z,v[1],v[2],v[3] , true)
          if distanta < 15 then
              DrawMarker(42, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 0.5001,0.5001,0.5001, 147,147,147, 100, 0, 0, 0, 1, 0, 0, 0)
              if distanta < 2 then
                  text("~p~Apasa ~INPUT_CONTEXT~ pentru a culege ~o~bureteii")
                  if IsControlJustPressed(0,38) then
                    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
                      TriggerServerEvent('uwu:culege')
                      Wait(12000)
                      ClearPedTasks(ped)
                      TriggerServerEvent('uwu:primeste')
                  end
              end
          end
      end
end
end)

function text(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local plm = {
  {90.988441467285,6361.8251953125,31.225801467896}
}

Citizen.CreateThread(function()
  while true do 
    Wait(0)
    local ped = GetPlayerPed(-1)
      local coordonateVINDE = GetEntityCoords(ped)
      for k,v in pairs (plm) do
        local distantaVINDE = GetDistanceBetweenCoords(coordonateVINDE.x, coordonateVINDE.y, coordonateVINDE.z, v[1], v[2], v[3],true)
         if distantaVINDE < 2 then
          text("~p~Apasa ~INPUT_CONTEXT~ pentru a vinde ~o~bureteii")
          if IsControlJustPressed(0,38) then
            TriggerServerEvent('uwu:vinde')
          end
        end
      end
    end
end)