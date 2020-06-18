local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_fancurier")

local pachete = math.random(1, 5)

RegisterServerEvent('fancurier:notificare')
AddEventHandler('fancurier:notificare', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, 'Fan Curier'}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~b~scanezi cu P.I.O.S-ul pachetele 📦"})
    end
end)

RegisterServerEvent('fancurier:iacolete')
AddEventHandler('fancurier:iacolete', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, 'Fan Curier'}) then
        vRP.giveInventoryItem({user_id, 'pachete', pachete, true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~b~ai pus pachetele in ghiozdan 📦"})
    end
end)

RegisterServerEvent('fancurier:job')
AddEventHandler('fancurier:job', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Fan Curier'})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~te-ai angajat ca  ~b~Fan Curier📦"})
end)