local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_pescar")

RegisterServerEvent('primestesomn')
AddEventHandler('primestesomn', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Pescar"}) then
    vRP.giveInventoryItem({user_id, 'somn', 1, true})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~g~bravo ai prins un ~b~Somn 🎣"})
    end
end)

local Pisica = math.random(0, 1)

RegisterServerEvent('primestepisica')
AddEventHandler('primestepisica', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
        if vRP.hasGroup({user_id, "Pescar"}) then
            if vRP.giveInventoryItem({user_id, 'pisicademare', Pisica, true}) then
                vRPclient.notify(player, {GetPlayerName(source).. " ~h~~g~bravo ai prins o ~b~Pisica de Mare 🎣"})
        end
    end
end)

RegisterServerEvent('pescarJOB')
AddEventHandler('pescarJOB', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Pescar'})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~te-ai angajat ca  ~b~Pescar🎣"})
end)