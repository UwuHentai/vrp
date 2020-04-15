MySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_culege")


RegisterServerEvent('uwu:culege')
AddEventHandler('uwu:culege',function()
	local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.notify(player, {"~p~Culegi ~o~bureteii!"})
end)

RegisterServerEvent('uwu:primeste')
AddEventHandler('uwu:primeste', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.giveInventoryItem({user_id,"hrib", math.random(1, 2),true})
    vRP.giveInventoryItem({user_id,"galbiori", math.random(1, 5),true})
    vRP.giveInventoryItem({user_id,"rascov", math.random(1, 5),true})
    vRP.giveInventoryItem({user_id,"gheba", math.random(1, 4),true})
    vRPclient.notify(player, {'~p~Ai gasit ☝🏼!'})
end)

RegisterServerEvent("uwu:vinde")
AddEventHandler("uwu:vinde", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})

    vRP.prompt({player, "Cate morti vrei sa vinzi?:", "", function(player, data)
        if(data ~= "" and data ~= nil)then
            local howmuch = tonumber(data)
            if howmuch then
                if vRP.tryGetInventoryItem({user_id,"hrib", howmuch,true}) then
                    vRP.giveMoney({user_id, howmuch*20})
                else
                    vRPclient.notify(player, {"~p~Ai vandut ~o~Hribii!"})
                end

                if vRP.tryGetInventoryItem({user_id,"galbiori", howmuch,true}) then
                    vRP.giveMoney({user_id, howmuch*5})
                else
                    vRPclient.notify(player, {"~p~Ai vandut ~o~Galbiorii!"})
                end

                if vRP.tryGetInventoryItem({user_id,"rascov", howmuch,true}) then
                    vRP.giveMoney({user_id, howmuch*10})
                else
                    vRPclient.notify(player, {"~p~Ai vandut ~o~Rascovii!"})
                end

                if vRP.tryGetInventoryItem({user_id,"gheba", howmuch,true}) then
                    vRP.giveMoney({user_id, howmuch*15})
                else
                    vRPclient.notify(player, {"~p~Ai vandut ~o~Ghebele!"})
                end
            end
        end
    end})
end)