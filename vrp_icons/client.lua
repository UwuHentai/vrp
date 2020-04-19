icons = {
	{"buletinul", "buletinul", "buletin",0,0,0, 0.18, 0.20},
	{"business", "business", "business",0,0,0, 0.23, 0.25}
}

function loadAllIcons()
	for i, v in pairs(icons) do
		local txd = CreateRuntimeTxd(v[1])
		CreateRuntimeTextureFromImage(txd, v[2], "icons/"..v[3]..".png")
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local jucator = GetPlayerPed(-1)
        local pos = GetEntityCoords(jucator, true)
		for i,v in pairs(icons) do
			if v[4] ~= 0 then
				if Vdist(pos.x,pos.y,pos.z,v[4],v[5],v[6]) < 15.0 then
					DrawImage3D(v[1], v[2], v[4], v[5], v[6]+1.0, v[7], v[8], 0.0, 255, 255, 255, 255)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	loadAllIcons()
end)

function DrawImage3D(name1, name2, x, y, z, width, height, rot, r, g, b, alpha) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, true)
	
    if onScreen then
		local width = (1/dist)*width
		local height = (1/dist)*height
		local fov = (1/GetGameplayCamFov())*100
		local width = width*fov
		local height = height*fov
	
		local CoordFrom = GetEntityCoords(PlayerPedId(), true)
        local RayHandle = StartShapeTestRay(CoordFrom.x, CoordFrom.y, CoordFrom.z, x, y, z, -1, PlayerPedId(), 0)
        local _, _, _, _, object = GetShapeTestResult(RayHandle)
		if(object == 0) or (object == nil)then
			DrawSprite(name1, name2, _x, _y, width, height, rot, r, g, b, alpha)
		end
	end
end
