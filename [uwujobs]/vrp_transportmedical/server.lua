local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_transportmedical")

local iarba = math.random(1, 5)

RegisterServerEvent('transport:incepeculesul')
AddEventHandler('transport:incepeculesul', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Transport Medical"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~g~ai inceput sa culegi Iarba Medicinala 🌿"})
    end
end)

RegisterServerEvent('transport:primesteiarba')
AddEventHandler('transport:primesteiarba', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Transport Medical"}) then
    vRP.giveInventoryItem({user_id, 'iarbamedicinala', iarba, true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~g~ai cules Iarba Medicinala 🌿"})
    end
end)


RegisterServerEvent('transportmedical:job')
AddEventHandler('transportmedical:job', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Transport Medical'})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~te-ai angajat ca  ~g~Transport Medical"})
end)