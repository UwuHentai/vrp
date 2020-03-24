local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 200

	result.r = math.floor( math.sin( curtime * frequency + 10 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 12 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 14 ) * 127 + 128 )
	
	return result
end

local fontId

Citizen.CreateThread(function()
	RegisterFontFile('out')
	fontId = RegisterFontId('Funny')
end)


local coordonate = { 
    {631.18646240234,622.04052734375,127.91108703613,"~w~Reprezentant ~c~[AUDI]",70.77,0xC99F21C4,"a_m_y_business_01", 1.0, 1},
    {622.5126953125,624.95574951172,127.91091918945,"~w~Reprezentant ~c~[BMW]",250.77,0xC99F21C4,"a_m_y_business_01", 1.0, 1},
    {218.86000061035,-457.77774047852,43.347183227539,"~w~Apasa ~c~[E] ~w~sa deschizi un cadou!",250.77,0x4E8F95A2,"a_c_husky", 1.0, 1}

}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
  
      RequestAnimDict("amb@world_human_partying@female@partying_cellphone@base")
      while not HasAnimDictLoaded("amb@world_human_partying@female@partying_cellphone@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
    end
end)

Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        Citizen.Wait(0)
        for _,v in pairs(coordonate) do
            x = v[1]
            y = v[2]
            z = v[3]
            if(Vdist(pos.x, pos.y, pos.z, x, y, z) < 20.0)then
                DrawText3D(x,y,z+2.10, "~p~"..v[4], 1.2, 1)
                DrawText3D(631.18646240234,622.04052734375,127.91108703613 +1.95, "~w~Salut, nu ai fata de ~c~BMW, ~w~cumpara un ~c~AUDI~w~! ~c~[E]", 0.75, 1)
                DrawText3D(622.5126953125,624.95574951172,127.91091918945 +1.95, "~w~Salut, nu ai fata de ~c~AUDI, ~w~cumpara un ~c~BMW~w~! ~c~[E]", 0.75, 1)
                DrawText3D(218.86000061035,-457.77774047852,43.347183227539 +1.95, "~w~Salut, i-a zi ~c~BO$$ ~w~crei sa deschizi un ~c~cadou?~w~! ~c~[E]", 0.75, 1)
            end
        end
    end
end)


function DrawText3D(x,y,z, text, scl, fontId) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(fontId)
        SetTextProportional(1)
        local uwuhentai = RGBRainbow( 1 )
        SetTextColour( uwuhentai.r, uwuhentai.g, uwuhentai.b, 255 )
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

--[[ENJOY]]--