--ignore

--maked by Uwu Hentai#4312

uwu = {}
uwu.zone = {
	[""] = {
		Pos   = {},
	},
} 

Citizen.CreateThread(function()
    for k,v in pairs(uwu.zone) do
			local blip = AddBlipForCoord(-1425.6345214844,-3084.6147460938,13.940835952759)
			SetBlipSprite(blip, 369)
			SetBlipScale(blip, 0.8)
			SetBlipColour(blip,48)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Test ~p~[1]~")
			EndTextCommandSetBlipName(blip)
		end
end)

Citizen.CreateThread(function()
    for k,v in pairs(uwu.zone) do
			local blip = AddBlipForCoord( -1070.906250,-2972.122803,13.773568)
			SetBlipSprite(blip, 369)
			SetBlipScale(blip, 0.8) 
			SetBlipColour(blip,48)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Test ~y~[2]")
			EndTextCommandSetBlipName(blip)
		end
end)

