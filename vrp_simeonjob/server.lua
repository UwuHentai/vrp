
-- made by Uwu Hentai | Uwu Hentai#4312 
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_simeonjob")

RegisterServerEvent("uwu:simeonda")
AddEventHandler("uwu:simeonda", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})

    local uwubulan = math.random(0, 100)
    local banutiilanbajat = math.random(1, 3000)

    if uwubulan >= 0 and uwubulan <= 29 then
        vRP.giveMoney({user_id, banutiilanbajat})
    elseif uwubulan >=30 and uwubulan <=50 then
        vRP.giveMoney({user_id, banutiilanbajat})
    elseif uwubulan >=51 and uwubulan <=62 then
        vRP.giveMoney({user_id, banutiilanbajat})
    elseif uwubulan >=63 and uwubulan <=74 then
        vRP.giveMoney({user_id, banutiilanbajat})
    elseif uwubulan >=74 and uwubulan <=100 then
        vRP.giveMoney({user_id, banutiilanbajat})
    end
end)