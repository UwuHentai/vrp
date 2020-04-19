vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vrp_morespawns")

Citizen.CreateThread(function()
  while true do
    Wait(0)
      ShowCursorThisFrame()
      DisableControlAction(0,24,true)
      DisableControlAction(0,47,true)
      DisableControlAction(0,58,true)
      DisableControlAction(0,263,true)
      DisableControlAction(0,264,true)
      DisableControlAction(0,257,true)
      DisableControlAction(0,140,true)
      DisableControlAction(0,141,true)
      DisableControlAction(0,142,true)
      DisableControlAction(0,143,true)
      DisableControlAction(0, 1, true)
      DisableControlAction(0, 2, true)

      DrawRect(0.500, 0.500, 0.500, 0.50, 0, 0, 0, 150)
      drawtxt("~p~Bine ai venit pe Server!",1,1,0.500,0.330,0.70,255,255,255,255)
      drawtxt("~w~Unde vrei sa te spawnezi ?",1,1,0.500,0.390,0.70,255,255,255,255)

      drawtxt("~y~Primarie",3,3,0.380, 0.460,1.10,255,255,255,255)
      drawtxt("~b~Sectia de politie",1,2,0.600, 0.460,1.10,255,255,255,255)
      drawtxt("~r~X",1,2,0.740, 0.260,0.70,255,255,255,255)
      DrawSprite('buletinul', 'buletinul', 0.380, 0.620, 0.100, 0.200, 0, 255, 255, 255, 255)
      DrawSprite('business', 'business', 0.600, 0.620, 0.100, 0.200, 0, 255, 255, 255, 255)
      if isCursorInPosition(0.380, 0.620, 0.10, 0.10) then
          vRP.teleport({-330.10604858398,6154.4223632813,32.313289642334}) -- primarie/spawn
          SetCursorSprite(5)
      else if isCursorInPosition(0.600, 0.460, 0.10, 0.10) then
          vRP.teleport({-439.41207885742,6020.6440429688,31.490114212036}) -- sectie politie
          SetCursorSprite(5)
      else if isCursorInPosition(0.740, 0.260, 0.03, 0.03) then
          SetCursorSprite(5)
              end
           end
        end
    end
end)

function showToolTip(text,r,g,b,a)
  local sx, sy = GetActiveScreenResolution()
  local cx, cy = GetNuiCursorPosition()  
  local cx, cy = ( cx / sx ) - 0.018, ( cy / sy ) + 0.027

  SetTextScale(0.31, 0.31)
  SetTextFont(1)
  SetTextProportional(1)
  SetTextColour(255,255,255, 255)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextEdge(0, 0, 0, 0, 255)
  SetTextEntry("STRING")
  SetTextCentre(1)
  SetTextOutline()
  AddTextComponentString(text)	
  local stringLenght = string.len(text)
  
  local width = stringLenght * 0.0080
  DrawRect(cx, cy + 0.04, width, 0.03, r,g,b,a)
  DrawText(cx, cy + 0.03)
end

function isCursorInPosition ( x, y, width, height )
  local sx, sy = 1920, 1080
  local cx, cy = GetNuiCursorPosition ( )
  local cx, cy = ( cx / sx ), ( cy / sy )
  
  local width = width / 2
  local height = height / 2
  
  if ( cx >= (x - width) and cx <= (x + width) ) and ( cy >= (y - height) and cy <= (y + height) ) then
      return true
  else
      return false
  end
end

function drawtxt(text,font,centre,x,y,scale,r,g,b,a)
    y = y - 0.010
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

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