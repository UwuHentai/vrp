local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRPclient = Tunnel.getInterface("vRP", "uwu_getjob")

vRP = Proxy.getInterface("vRP")

_s_skin_change = {}
Tunnel.bindInterface("uwu_getjob",_s_skin_change)
Proxy.addInterface("uwu_getjob",_s_skin_change)
_c_skin_change = Tunnel.getInterface("uwu_getjob","uwu_getjob")

function _s_skin_change.padurar()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.addUserGroup({user_id, "Padurar"}) then
        _c_skin_change.padurar(player,{})
    end
end

function _s_skin_change.fancurier()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.addUserGroup({user_id, "Fan Curier"}) then
        _c_skin_change.fancurier(player,{})
    else
        vRPclient.notify(vRP.getUserSource({user_id}), {"[~b~Notificare~w~] Nici un job in apropriere!!"})
    end
end

function _s_skin_change.offDuty_check()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    
    if vRP.hasPermission({user_id, "admin.tickets"}) then
        _c_skin_change.offDuty(player,{})
        vRPclient.notify(vRP.getUserSource({user_id}), {"[~b~Notificare~w~] Ai iesit din Duty!!"})
    end
end