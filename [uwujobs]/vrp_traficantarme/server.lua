local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_traficantarme")

vRPSarme = {}
Tunnel.bindInterface("vrp_traficantarme",vRPSarme)
Proxy.addInterface("vrp_traficantarme",vRPSarme)
vRPCarme = Tunnel.getInterface("vrp_traficantarme","vrp_traficantarme")

function vRPSarme.arme_job()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, "Traficant de Arme"})
    vRPclient.notify(player, {"~w~[~c~TRAFICANT~w~] ~h~~w~Te-ai angajat cu ~g~succes~w~!"})
end

function vRPSarme.ia_armele()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.tryPayment({user_id, 200}) then
        vRP.giveInventoryItem({user_id, 'AK47', 5, true})
        vRP.giveInventoryItem({user_id, 'M4A1', 5, true})
        vRPclient.notify(player, {"~w~[~c~TRAFICANT~w~] ~h~~w~Ai luat ~c~Armele ~w~din depozit"}) 
    else
        vRPclient.notify(vRP.getUserSource({user_id}), {"~w~[~c~TRAFICANT~w~] ~r~Nu ai destui bani pentru a cumpara si livra ~c~Armele~w~!"})
    end
end