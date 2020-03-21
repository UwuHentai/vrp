
-- made by Uwu Hentai | Uwu Hentai#4312
local geamuri = {
    "prop_bollard_02a"
}

local geamuri2 = {}

Citizen.CreateThread(function()
    Wait(100)
    while true do
        local timpdeasteptat = 1000
        local jucator = PlayerPedId()
        local jucatorCoord = GetEntityCoords(jucator)
        
        for i = 1, #geamuri do
            local x = GetClosestObjectOfType(jucatorCoord, 2.0, GetHashKey(geamuri[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                entity = x
                geam = GetEntityCoords(entity)
        if DoesEntityExist(entity) <= 1.5 then
            timpdeasteptat = 5
            DrawText3D(geam.x, geam.y, geam.z + 1.5, '~b~[SIMEON] ~w~Spala-mi si mie geamurile! Nu moka stai linistit!')  
            if IsControlJustReleased(0, 38) then
                if not geamuri2[entity] then
                    geamuri2[entity] = true
                    OpenTrashCan()
                else
                    notify("~b~[SIMEON] ~o~Mai ai de sters nu te opri!")
                        end
                    end
                end
            end
        end
        Citizen.Wait(timpdeasteptat)
    end
end)

function OpenTrashCan()
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_BUM_WASH", 0, true) -- SITE ANIMATII : https://gtaforums.com/topic/796181-list-of-scenarios-for-peds/
            Wait(10000)
            TriggerServerEvent("uwu:simeonda")
    ClearPedTasks(PlayerPedId())
end

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

DrawText3D = function(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local scale = 0.45
   
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0150, 0.030 + factor , 0.030, 66, 66, 66, 150)
	end
end