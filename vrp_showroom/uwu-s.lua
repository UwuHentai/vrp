
--Sistem maked by Uwu Hentai#4312

--Uwu Hentai GITHUB - https://github.com/UwuHentai


local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

MySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_showroom")
Gclient = Tunnel.getInterface("vRP_garages","vRP_showroom")


MySQL.createCommand("vRP/showroom_columns", [[
ALTER TABLE vrp_user_vehicles ADD IF NOT EXISTS veh_type varchar(255) NOT NULL DEFAULT 'default' ;
ALTER TABLE vrp_user_vehicles ADD IF NOT EXISTS vehicle_plate varchar(255) NOT NULL;
]])
MySQL.query("vRP/showroom_columns")

MySQL.createCommand("vRP/add_custom_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,vehicle_plate,veh_type) VALUES(@user_id,@vehicle,@vehicle_plate,@veh_type)")


RegisterServerEvent("buy_car")
AddEventHandler("buy_car",function(vname,price,veh_type)

  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  local plate = "B "..generateNumarInmatriculare("DDDDDD")

  MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vname}, function(masini, affected)
    if #masini > 0 then
      vRPclient.notify(player,{"~c~[HENTAI] ~w~AI DEJA MASINA ASTA DIHANIE!"})
    elseif  vRP.tryFullPayment({user_id,price}) then
      vRP.getUserIdentity({user_id, function(identity)
        MySQL.query("vRP/add_custom_vehicle", {user_id = user_id, vehicle = vname, vehicle_plate = plate, veh_type = veh_type})
    end})
    vRPclient.notify(player,{"~c~[HENTAI] ~w~ AI PLATIT~r~"..price.."$."})
		else
      vRPclient.notify(player,{"~c~[HENTAI] ~w~NU AI DESTUI BANI DIHANIE!"})
    end
	end)
end)


function generateNumarInmatriculare(format) 
  local abyte = string.byte("A")
  local zbyte = string.byte("0")

  local number = ""
  for i=1,#format do
    local char = string.sub(format, i,i)
    if char == "D" then number = number..string.char(zbyte+math.random(0,9))
    elseif char == "L" then number = number..string.char(abyte+math.random(0,25))
    else number = number..char end
  end

  return number
end