local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_constructor")

RegisterServerEvent('uwu:startANIAMTIEpicammer')
AddEventHandler('uwu:startANIAMTIEpicammer', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Mechanic"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~ai inceput sa lucrezi pe santier ! \n~o~~h~\n[PICAMMER]"})
    end
end)


RegisterServerEvent('uwu:BANIIIpicammer')
AddEventHandler('uwu:BANIIIpicammer', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local bani = math.random(50, 600)
    if vRP.hasGroup({user_id, "Mechanic"}) then
    vRP.giveMoney({user_id, bani})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~te-ai oprit din a mai muci pentru o pauza ! \n~o~~h~\n[PICAMMER]\n~g~\nPLATIT:[" .. bani ..  "LEI]"})
    end
end)

RegisterServerEvent('uwu:startANIAMTIEciocan')
AddEventHandler('uwu:startANIAMTIEciocan', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Mechanic"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~ai inceput sa lucrezi pe santier ! \n~c~~h~\n[CIOCAN]"})
    end
end)

RegisterServerEvent('uwu:BANIIIciocan')
AddEventHandler('uwu:BANIIIciocan', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Mechanic"}) then
    local bani = math.random(50, 400)
    vRP.giveMoney({user_id, bani})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~te-ai oprit din a mai muci pentru o pauza ! \n~c~~h~\n[CIOCAN]\n~g~\nPLATIT:[" .. bani ..  "LEI]"})
    end
end)


RegisterServerEvent('uwu:startANIAMTIEsudat')
AddEventHandler('uwu:startANIAMTIEsudat', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Mechanic"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~ai inceput sa lucrezi pe santier ! \n~w~~h~\n[SUDAT]"})
    end
end)

RegisterServerEvent('uwu:BANIIIsudat')
AddEventHandler('uwu:BANIIIsudat', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Mechanic"}) then
    local bani = math.random(80, 500)
    vRP.giveMoney({user_id, bani})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~te-ai oprit din a mai muci pentru o pauza ! \n~w~~h~\n[SUDAT]\n~g~\nPLATIT:[" .. bani ..  "LEI]"})
    end
end)