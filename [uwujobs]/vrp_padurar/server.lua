local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
BMclient = Tunnel.getInterface("vRP_basic_menu","vRP_basic_menu")
vRPclient = Tunnel.getInterface("vRP", "vrp_poadurar")

RegisterServerEvent('forestcar')
AddEventHandler('forestcar', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Padurar"}) then
    BMclient.spawnVehicle(player,{'Mesa3'})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~poti spawna cate o masina o data la 6 minute."})
    end
end)

RegisterServerEvent('takejob')
AddEventHandler('takejob', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Padurar'})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~te-ai angajat ca si ~g~Padurar."})
end)

RegisterServerEvent('notifcaredulemnu')
AddEventHandler('notifcaredulemnu', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Padurar'})
    vRP.giveInventoryItem({user_id,"lemnne",1,true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~du ~g~lemnul ~c~la locul lui! ~g~Ai primit ~c~si tu o ~g~bucata!"})
end)

RegisterServerEvent('notifcaredulemnu2')
AddEventHandler('notifcaredulemnu2', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Padurar'})
    vRP.giveInventoryItem({user_id,"lemnne",1,true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~Ai pus ~g~lemnul ~c~cu atenite jos si ai mai ~g~primit ~c~o bucata!"})
end)

RegisterServerEvent('startprocess')
AddEventHandler('startprocess', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Padurar'})
    if vRP.tryGetInventoryItem({user_id,"lemnne",1,true}) then
    vRP.giveInventoryItem({user_id,"lemnpre",2,true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~Ai prelucat ~g~lemnul!"})
    end
end)

RegisterServerEvent('startprocesschair')
AddEventHandler('startprocesschair', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Padurar'})
    if vRP.tryGetInventoryItem({user_id,"lemnpre",5,true}) then
    vRP.giveInventoryItem({user_id,"scaunlemn",1,true})
    local moneychair = math.random(3,6)
    vRP.tryPayment({user_id, moneychair})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~Ai facut un scaun din lemn!"})
    end
end)

RegisterServerEvent("sellchair")
AddEventHandler('sellchair', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.prompt({player, "Cate SCAUNE vinzi?:", "", function(player, data)
        if(data ~= "" and data ~= nil)then
            local money = tonumber(data)
            if money then
                if vRP.tryGetInventoryItem({user_id,"scaunlemn", money,true}) then
                    vRP.giveMoney({user_id, money*10})
                end
            end
        end
    end})
end)

RegisterServerEvent('startprocesstable')
AddEventHandler('startprocesstable', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Padurar'})
    if vRP.tryGetInventoryItem({user_id,"lemnpre",10,true}) then
    vRP.giveInventoryItem({user_id,"masalemn",1,true})
    local moneychair = math.random(8,15)
    vRP.tryPayment({user_id, moneychair})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~Ai facut o masa de lemn!"})
    end
end)

RegisterServerEvent('selltable')
AddEventHandler('selltable', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.prompt({player, "Cate MESE vinzi?:", "", function(player, data)
        if(data ~= "" and data ~= nil)then
            local money = tonumber(data)
            if money then
                if vRP.tryGetInventoryItem({user_id,"masalemn", money,true}) then
                    vRP.giveMoney({user_id, money*20})
                end
            end
        end
    end})
end)