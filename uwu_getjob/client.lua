_c_skin_change = {}
Tunnel.bindInterface("uwu_getjob",_c_skin_change)
Proxy.addInterface("uwu_getjob",_c_skin_change)
_s_skin_change = Tunnel.getInterfata("uwu_getjob","uwu_getjob")
vRP = Proxy.getInterface("vRP")

local _zone_padurar = {
	{-841.15301513672,5401.4609375,34.615211486816}
}

Citizen.CreateThread(function()
	while true do
		Wait(0)
		RegisterCommand("getjob",function()
			local _jucator = GetPlayerPed()
			local _c_jucator = GetEntityCoords(_jucator)
			for k,v in pairs(_zone_padurar) do
				local _dis = GetDistanceBetweenCoords(_c_jucator.x, _c_jucator.y, _c_jucator.z, v[1], v[2], v[3], true)
				if _dis < 3 then		
					_c_skin_change.padurar()
				end
			end
		end)
	end
end)

function _c_skin_change.padurar()
	_s_skin_change.padurar()
end


local _zone_fancurier = {
	{78.98885345459,111.63941955566,81.168174743652}
}

Citizen.CreateThread(function()
	while true do
		Wait(0)
		RegisterCommand("getjob",function()
			local _jucator = GetPlayerPed()
			local _c_jucator = GetEntityCoords(_jucator)
			for k,v in pairs(_zone_fancurier) do
				local _dis = GetDistanceBetweenCoords(_c_jucator.x, _c_jucator.y, _c_jucator.z, v[1], v[2], v[3], true)
				if _dis < 3 then		
					_c_skin_change.fancurier()
				end
			end
		end)
	end
end)

function _c_skin_change.fancurier()
	_s_skin_change.fancurier()
end
