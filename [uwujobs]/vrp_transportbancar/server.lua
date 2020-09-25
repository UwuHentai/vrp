local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_transportbancar")

RegisterServerEvent('JOBBancar')
AddEventHandler('JOBBancar', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.addUserGroup({user_id, 'Sofer Bancar'})
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~te-ai angajat ca  ~g~Sofer Bancar 🌐"})
end)


RegisterServerEvent('masinaNOTI')
AddEventHandler('masinaNOTI', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Sofer Bancar"}) then
    vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~poti ~g~scoate masina ~c~o data la ~r~30 ~c~de ~r~minute~c~! 🌐"})
    end
end)

RegisterServerEvent("dabaniibancii")
AddEventHandler("dabaniibancii", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "Sofer Bancar"}) then
        if vRP.giveInventoryItem({user_id, 'banibancii', 100000, true}) then
            vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~ai ~g~primit~c~ banii! ~w~( Mai asteapta umpic ) 🌐"})
        end
    end
end)

RegisterServerEvent('iabaniibancii')
AddEventHandler('iabaniibancii', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, 'Sofer Bancar'}) then 
        if vRP.tryGetInventoryItem({user_id,"banibancii",50000,true}) then
            vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~Ai dus banii cu ~g~succes~c~!! "})
        end
    end
end)

RegisterServerEvent('bonusbanutiFINAL')
AddEventHandler('bonusbanutiFINAL', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, 'Sofer Bancar'}) then 
        vRP.giveInventoryItem({user_id,"fisabonus",1,true}) 
        vRPclient.notify(player, {GetPlayerName(source).. " ~h~~c~acuma intoarce-te sa iti iei ~y~bonusul ~c~de ~g~banuti ~c~de la banca! 🌐"})
    end
end)

local bonus = 5000

RegisterServerEvent('BONUS')
AddEventHandler('BONUS', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, 'Sofer Bancar'}) then 
        if vRP.tryGetInventoryItem({user_id,"fisabonus",1,true}) then 
            vRP.giveBankMoney({user_id,bonus})
            vRPclient.notify(player, {GetPlayerName(source).. " ~h~~o~Felicitari~c~! Ai primit un ~y~bonus ~c~in~g~ valoare ~c~de: ~y~"..bonus.." ~c~de ~g~LEI~c~ 🌐"})
        end
    end
end)
