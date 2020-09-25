local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRPclient = Tunnel.getInterface("vRP", "vrp_hacker")

vRP = Proxy.getInterface("vRP")

vRPShacker = {}
Tunnel.bindInterface("vrp_hacker",vRPShacker)
Proxy.addInterface("vrp_hacker",vRPShacker)
vRPChacker = Tunnel.getInterface("vrp_hacker","vrp_hacker")

function vRPShacker.checkJob()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    
    if vRP.hasGroup({user_id, "Hacker"})then
        vRPChacker.startjob(player,{})
    else
        vRPclient.notify(vRP.getUserSource({user_id}), {"~g~[HACKER] ~r~Trebuie sa detii job-ul de HACKER pentru a putea sparge ATM-urile."})
    end

end

function vRPShacker.hack_sniper()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    
    if vRP.hasGroup({user_id, "sniperpedro45+1"})then
        da_sniper(player, choice)
    else
        vRPclient.notify(vRP.getUserSource({user_id}), {"~l~[~w~SNIPER~l~] ~w~Nu ai acces la ~c~SNIPER~w~!"})
    end

end

function da_sniper(player, choice)
    user_id = vRP.getUserId({player})
    if vRP.hasGroup({user_id, "sniperpedro45+1"}) then
        vRPclient.giveWeapons(player,{{
            ["WEAPON_HEAVYSNIPER"] = {ammo=100}
        }})
        vRPclient.notify(player, {"~l~[~w~SNIPER~l~] ~w~Ai primit ~c~SNIPER~w~!"})
    else
        vRPclient.notify(player, {"~l~[~w~SNIPER~l~] ~w~Nu ai acces la ~c~SNIPER~w~!"})
        return
    end
end

function vRPShacker.getMoney(amount)
    local user_id = vRP.getUserId({source})
    local user_source = vRP.getUserSource({user_id})
    if vRP.tryGetInventoryItem({user_id,"Skimmer",1,true}) then 
        vRP.giveMoney({user_id, amount,"true"})
    else
        vRPclient.notify(vRP.getUserSource({user_id}), {"~w~[HACKER] ~r~Trebuie sa ai un Skimmer."})
    end
end

function vRPShacker.iaJobul()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Hacker'})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~te-ai angajat ca ~g~Hacker 🖥️"})
end

function vRPShacker.iaSkimmere()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Hacker"})then
        vRP.giveInventoryItem({user_id, 'Skimmer', 1, true})
        vRPclient.notify(player, {GetPlayerName(source).. " ~h~~p~ai luat un ~r~Skimmer ~p~din sertar"}) 
    else
        vRPclient.notify(vRP.getUserSource({user_id}), {"~g~[HACKER] ~r~Trebuie sa detii job-ul de HACKER pentru a putea lua SKIMMERE."})
    end
end




