

---------------------------------------------------------------
--                   Made by Uwu Hentai                      --
--                Don't Try to Repost Or Sell                --
---------------------------------------------------------------


local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
BMclient = Tunnel.getInterface("vRP_basic_menu","vRP_basic_menu")
vRPclient = Tunnel.getInterface("vRP", "anuntrestart")

RegisterServerEvent('restart')
AddEventHandler('restart', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.kick({source,"SERVER-UL REMAKE SI-A DAT RESTART!"})
end)