
--uwu hentai sign

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_regulament")

masina = true
variabila = false


RegisterNUICallback("exit", function(data)
  SetNuiFocus(false, false)
end)

RegisterCommand("cursor", function(raw, args)
  if masina == true then 
  SetNuiFocus(true, true)
  masina = true
  else
    SetNuiFocus(false, false)
    masina = false
  end
end)

function notify(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true,false)
end

Citizen.CreateThread(function()
  while masina do
      Citizen.Wait(0)
      if(IsControlJustReleased(1, 82))then 
        SetNuiFocus(true, true)
        notify("~r~Apasa pe iconta si vei avea copiat in clipboard discord-ul nostru.")
      end
  end
end)  

local show = false
local cooldown = 0

function openGui()
  if show == false then
    show = true
    SetNuiFocus(true, true)
    SendNUIMessage(
      {
        show = true,
      }
    )
  end
end

function closeGui()
  show = false
  SetNuiFocus(false)
  SendNUIMessage({show = false})
end

RegisterNetEvent("uwuhentai:openGui")
AddEventHandler(
  "uwuhentai:openGui",
  function()
    if cooldown > 0 ~= nil then
      openGui()
    else
      TriggerServerEvent("uwuhentai:openGui")
    end
  end
)
RegisterNetEvent("uwuhentai:closeGui")
AddEventHandler(
  "uwuhentai:closeGui",
  function()
    closeGui()
  end
)

RegisterNUICallback(
  "close",
  function(data)
    closeGui()
  end
)

Citizen.CreateThread(
  function()
    while true do
      Citizen.Wait(0)
      if IsControlPressed(0, Config.OpenMenu) then
        TriggerEvent("uwuhentai:openGui")
      end
    end
  end
)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    if cooldown > 0 then 
      cooldown = cooldown - 1
    end
  end
end)

