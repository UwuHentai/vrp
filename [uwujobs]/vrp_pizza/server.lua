local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_pizza")

vRPSpizza = {}
Tunnel.bindInterface("vrp_pizza",vRPSpizza)
Proxy.addInterface("vrp_pizza",vRPSpizza)
vRPCpizza = Tunnel.getInterface("vrp_pizza","vrp_pizza")

function vRPSpizza.iaJobul()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, "Jerry's Pizza"})
    vRPclient.notify(player, {"~w~[~o~JERRY'S PIZZA~w~] ~h~~w~Te-ai angajat cu ~g~succes~w~!"})
end

function vRPSpizza.iaPizza()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.tryPayment({user_id, 200}) then
        vRP.giveInventoryItem({user_id, 'pizzaquatrofro', 10, true})
        vRP.giveInventoryItem({user_id, 'pizzamargherita', 10, true})
        vRP.giveInventoryItem({user_id, 'Pizza Diavola', 10, true})
        vRPclient.notify(player, {"~w~[~o~JERRY'S PIZZA~w~] ~h~~w~Ai luat ~o~Pizza ~w~din cuptor"}) 
    else
        vRPclient.notify(vRP.getUserSource({user_id}), {"~w~[~o~JERRY'S PIZZA~w~] ~r~Nu ai destui bani pentru a cumpara si livra ~o~Pizza~w~!"})
    end
end
