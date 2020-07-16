

---------------------------------------------------------------
--                   Made by Uwu Hentai                      --
--                Don't Try to Repost Or Sell                --
---------------------------------------------------------------


local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "anuntrestart")

RegisterServerEvent('notificareDA')
AddEventHandler('notificareDA', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.notify(player, {"~h~~c~"..GetPlayerName(source).. " ~h~~w~vei fi teleportat ~g~imediat!"})
end)

RegisterServerEvent('notificareNU')
AddEventHandler('notificareNU', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.notify(player, {"~h~~c~"..GetPlayerName(source).. " ~h~~r~nu ~w~vei fi teleporat la ~p~event~w~!"})
end)