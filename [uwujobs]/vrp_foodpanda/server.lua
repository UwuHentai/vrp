local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_foodpanda")

    -- COCA COLA -

local cocacola = math.random(1, 3)

RegisterServerEvent('food:pandacocacola')
AddEventHandler('food:pandacocacola', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Food Panda"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~iei ~r~Coca Cola ~p~de pe raft "})
    end
end)

RegisterServerEvent('food:pandacocacolap')
AddEventHandler('food:pandacocacolap', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Food Panda"}) then
    vRP.giveInventoryItem({user_id, 'cocacola', cocacola, true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~ai luat ~r~Coca Cola ~p~de pe raft"})
    vRP.tryPayment({user_id,6})
    end
end)

    -- CARTOFI --

local cartofi = math.random(1, 3)

RegisterServerEvent('food:pandacartofi')
AddEventHandler('food:pandacartofi', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Food Panda"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~iei ~o~Cartofii ~p~de pe raft "})
    end
end)

RegisterServerEvent('food:pandacartofip')
AddEventHandler('food:pandacartofip', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Food Panda"}) then
    vRP.giveInventoryItem({user_id, 'cartofiprajiti', cartofi, true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~ai luat ~o~Cartofii ~p~de pe raft"})
    vRP.tryPayment({user_id,10})
    end
end)

    -- MC PUISOR --

local puisor = math.random(1, 3)

RegisterServerEvent('food:pandamcpuisor')
AddEventHandler('food:pandamcpuisor', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Food Panda"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~iei ~o~Mc Puisor-ul ~p~de pe raft "})
    end
end)

RegisterServerEvent('food:pandamcpuisorp')
AddEventHandler('food:pandamcpuisorp', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Food Panda"}) then
    vRP.giveInventoryItem({user_id, 'mcpuisor', puisor, true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~ai luat ~o~Mc Puisor-ul ~p~de pe raft"})
    vRP.tryPayment({user_id,20})
    end
end)

    -- CIPSURI LAY'S --

local cipsuri = math.random(1, 3)

RegisterServerEvent('food:pandalays')
AddEventHandler('food:pandalays', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Food Panda"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~iei ~r~Cispurile Lay's ~p~de pe raft "})
    end
end)

RegisterServerEvent('food:pandalaysp')
AddEventHandler('food:pandalaysp', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Food Panda"}) then
    vRP.giveInventoryItem({user_id, 'cipsurilays', cipsuri, true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~ai luat ~r~Cispurile Lay's ~p~de pe raft"})
    vRP.tryPayment({user_id,6})
    end
end)

    -- JOB --
RegisterServerEvent('foodpanda:job')
AddEventHandler('foodpanda:job', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Food Panda'})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~g~te-ai angajat ca ~p~Food Panda"})
end)