local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_transportmedical")

-- SEMINTE --

local seminte = math.random(1, 3)

RegisterServerEvent('traficant:iarbaia')
AddEventHandler('traficant:iarbaia', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Traficant de Droguri"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~r~ai inceput sa culegi Seminte 🌿"})
    end
end)

RegisterServerEvent('traficant:primesteiarba')
AddEventHandler('traficant:primesteiarba', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Traficant de Droguri"}) then
    vRP.giveInventoryItem({user_id, 'seminte', seminte, true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~r~ai cules Semintele 🌿"})
    end
end)

-- COCAINA -- 

local prafcocaina = math.random(1, 3)

RegisterServerEvent('traficant:cocainaia')
AddEventHandler('traficant:cocainaia', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Traficant de Droguri"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~r~ai inceput sa procuri Praf-ul de Cocaina 💊"})
    end
end)

RegisterServerEvent('traficant:primestecocaina')
AddEventHandler('traficant:primestecocaina', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Traficant de Droguri"}) then
    vRP.giveInventoryItem({user_id, 'prafcocaina', prafcocaina, true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~r~ai procurat Praf-ul de cocaina 💊"})
    end
end)

-- XANAX PRAF --

local prafxanax = math.random(1, 6)

RegisterServerEvent('traficant:xanaxia')
AddEventHandler('traficant:xanaxia', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Traficant de Droguri"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~r~ai inceput sa procuri Praf pentru Xanax ⚗️"})
    end
end)

RegisterServerEvent('traficant:xanaxprimeste')
AddEventHandler('traficant:xanaxprimeste', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Traficant de Droguri"}) then
    vRP.giveInventoryItem({user_id, 'prafxanax', prafxanax, true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~r~ai procurat Praf-ul pentru Xanax ⚗️"})
    end
end)

RegisterServerEvent('traficant:droguri')
AddEventHandler('traficant:droguri', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Traficant de Droguri'})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~te-ai angajat ca  ~r~Traficant de Droguri"})
end)