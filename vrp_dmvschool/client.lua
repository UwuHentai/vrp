
--configurat si facut asa cum este acum de catre Uwu Hentai!
maxErrors = 5 

local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 200

	result.r = math.floor( math.sin( curtime * frequency + 10 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 12 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 14 ) * 127 + 128 )
	
	return result
end

local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Politist",
    menu_subtitle = "Categorii",
    color_r = 0,
    color_g = 128,
    color_b = 255,
}

local dmvped = {
  {type=4, hash=0xc99f21c4, x=452.16317749023, y=-973.81713867188, z=29.689601898193, a=3374176},
}

local dmvpedpos = {
	{ ['x'] = 452.16317749023, ['y'] = -973.81713867188, ['z'] = 30.689601898193 },
}

--[[Locals]]--

local dmvschool_location = {452.16317749023,-973.81713867188,30.689601898193}

local kmh = 3.6
local VehSpeed = 0

local speed_limit_resi = 50.0
local speed_limit_town = 80.0
local speed_limit_freeway = 120
local speed = kmh

local DTutOpen = false
TestDone = false

RegisterNetEvent('dmv:CheckLicStatus')
AddEventHandler('dmv:CheckLicStatus', function()
--Check if player has completed theory test
	TestDone = true
	theorylock = true
	testlock = true
end)

--[[Functions]]--

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function DrawMissionText2(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function LocalPed()
	return GetPlayerPed(-1)
end

function GetCar() 
	return GetVehiclePedIsIn(GetPlayerPed(-1),false) 
end

function Chat(debugg)
    TriggerEvent("chatMessage", '', { 0, 0x99, 255 }, tostring(debugg))
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

--[[Arrays]]--
onTtest = false
onPtest = false
onTestEvent = 0
theorylock = true
testlock = true
DamageControl = 0
SpeedControl = 0
CruiseControl = 0
Error = 0

function startintro()
		DIntro() 
		theorylock = false
end

function startttest()
        if theorylock then
			DrawMissionText2("~r~Blocat", 5000)			
		else
			TriggerServerEvent('dmv:ttcharge')
		end
end

RegisterNetEvent('dmv:startttest')
AddEventHandler('dmv:startttest', function()
	openGui()
	Menu.hidden = not Menu.hidden
end)

function startptest()
        if testlock then
			DrawMissionText2("~r~Blocat", 5000)
		else
		    TriggerServerEvent('dmv:ptcharge')
		end
end

RegisterNetEvent('dmv:startptest')
AddEventHandler('dmv:startptest', function()
	onTestBlipp = AddBlipForCoord(408.34020996094,-1023.0793457031,29.370031356812)
	N_0x80ead8e2e1d5d52e(onTestBlipp)
	SetBlipRoute(onTestBlipp, 1)
	PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
	onTestEvent = 1
	DamageControl = 1
	SpeedControl = 1
	onPtest = true
	DTut()
end)

function EndDTest()
        if Error > maxErrors then
			drawNotification("Ai picat\nAi acumulat ".. Error.." ~r~Puncte Penalizare")
			onPtest = false
			EndTestTasks()
		else
			TriggerServerEvent('dmv:success')
			onPtest = false
			TestDone = true
			theorylock = false
			testlock = false
			drawNotification("Ai trecut!\nAi acumulat ".. Error.." ~r~Puncte penalizare")	
			EndTestTasks()
		end
end

function EndTestTasks()
		onTestBlipp = nil
		onTestEvent = 0
		DamageControl = 0
		Error = 0
		TaskLeaveVehicle(GetPlayerPed(-1), veh, 0)
		Wait(1000)
		CarTargetForLock = GetPlayersLastVehicle(GetPlayerPed(-1))
		lockStatus = GetVehicleDoorLockStatus(CarTargetForLock)
		SetVehicleDoorsLocked(CarTargetForLock, 2)
		SetVehicleDoorsLockedForPlayer(CarTargetForLock, PlayerId(), false)
		SetEntityAsMissionEntity(CarTargetForLock, true, true)
		Wait(2000)
		Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( CarTargetForLock ) )
		

end


function SpawnTestCar()
	Citizen.Wait(0)
	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('t20')

    RequestModel(vehicle)

while not HasModelLoaded(vehicle) do
	Wait(1)
end
colors = table.pack(GetVehicleColours(veh))
extra_colors = table.pack(GetVehicleExtraColours(veh))
plate = math.random(100, 900)
local spawned_car = CreateVehicle(vehicle, 427.96868896484,-1020.6605834961,28.927783966064, true, false)
SetVehicleColours(spawned_car,4,5)
SetVehicleExtraColours(spawned_car,extra_colors[1],extra_colors[2])
SetEntityHeading(spawned_car, 200.64)
SetVehicleOnGroundProperly(spawned_car)
SetPedIntoVehicle(myPed, spawned_car, - 1)
SetModelAsNoLongerNeeded(vehicle)
Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
CruiseControl = 0
DTutOpen = false
SetEntityVisible(myPed, true)
SetVehicleDoorsLocked(GetCar(), 4)
FreezeEntityPosition(myPed, false)
end

function DIntro()
	Citizen.Wait(0)
	local myPed = GetPlayerPed(-1)
	DTutOpen = true
		SetEntityCoords(myPed,449.15548706055,-1048.4569091797,51.373146057129,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#FFFFFF'>DRPCIV Introducere</b> <br /><br />Teoria si practica sunt ambele elemente importante.<br />Aceasta introducere va acoperii toate elementele de baza si te va ajuta sa iei examenul.<br /><br />Informatiile din lectiile de teorie si experienta acumulata vor fi vitale situatiilor intalnite pe drum.<br /><br />Fa-te comod si acorda atentie. Multe din informatiile de aici vor fi necesare testului tau practic si teoretic",
            type = "alert",
            timeout = (8000),
            layout = "center",
            queue = "global"
        })
		Citizen.Wait(8000)
		SetEntityCoords(myPed,449.15548706055,-1048.4569091797,51.373146057129,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#FFFFFF'>Accidente, situatii si catastrofe</b><br /><br /><b style='color:#87CEFA'>Supunerea regulilor</b><br />Toti soferii autovehiculelor sunt obligati sa respecte regulile de circulatie. Neconformarea regulilor de circulatie poate conduce la accidente.<br /><br /> Daca auzi o sirena de politie, trebuie sa tragi pe dreapta.<br />Esti obligat ca intotdeauna sa opresti cand un ofiter de politie iti cere.<br /><br /><b style='color:#87CEFA'>Condusul agresiv</b><br />Un vehicul ce depaseste limita de viteza si nu respecta regulile de circulatie este considerat periculos si catalogat drept condus agresiv.<br />Condusul agresiv duce la accidente grave cu penalizari foarte mari.<br />",
            type = "alert",
            timeout = (8000),
            layout = "center",
            queue = "global"
        })
		Citizen.Wait(8000)
		SetEntityCoords(myPed,449.15548706055,-1048.4569091797,51.373146057129,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#FFFFFF'>Zona rezidentiala</b> <br /><br /> Mentine viteza corespunzatoare - Niciodata nu depasi limita de viteza afisata, incetineste daca traficul este intens.<br /><br />Stai pe mijlocul benzii tale. Niciodata nu condu in zona rezervata pentru parcare.<br /><br />Mentine o distanta sigura - cel putin o lungime de masina la fiecare 20km/h.<br /><br />Limita de viteza in zona rezidentiala este de 50 km/h.<br />",
            type = "alert",
            timeout = (8000),
            layout = "center",
            queue = "global"
        })	
		Citizen.Wait(8000)
		SetEntityCoords(myPed,449.15548706055,-1048.4569091797,51.373146057129,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#FFFFFF'>Zona Rurala</b> <br /><br />Limita de 80 km/h este aplicata pe toate strazile luminate.<br />Conducand mai rapid decat limita impusa este periculos si cauzeaza accidente catastrofice.<br /><br />Trebuie sa reduci mereu viteza cand:<br /><br />&bull; Imparti drumul cu un pieton<br />&bull; Conduci noapte, deoarece iti este mai greu sa vezi<br />&bull; Conditile meteorologice nu sunt prielnice<br /><br />Atentie! Motociclete si vehiculele mari iau mai mult timp sa franeze<br />",
            type = "alert",
            timeout = (8000),
            layout = "center",
            queue = "global"
        })
		Citizen.Wait(8000)
		SetEntityCoords(myPed,449.15548706055,-1048.4569091797,51.373146057129,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#FFFFFF'>Autostrazi</b> <br /><br />Traficul de pe autostrada circula la viteze mari deci ai mai putin timp sa reactionezi.<br />Este important sa-ti folosesti simturile si sa ai o viteza de reactie buna.<br /><br />Verifica traficul si ai grija la viteza ca sa poti tine o distanta sigura.<br /><br />Limita de viteza este de 140 km/h.<br />",
            type = "alert",
            timeout = (8000),
            layout = "center",
            queue = "global"
        })				
		Citizen.Wait(8000)		
		SetEntityCoords(myPed,449.15548706055,-1048.4569091797,51.373146057129,true, false, false,true)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#FFFFFF'>Alcool</b> <br /><br />Consumul de alcool in timp ce conduci este foarte periculos. Reducerea simturilor iti afecteaza stilul in care conduci ducand chiar la unul periculos.Totusi exista o cantitate maxima permisa de alcool in sange.<br /><br />0.08% este cantiatea legala de alcool permis.<br />",
            type = "alert",
            timeout = (8000),
            layout = "center",
            queue = "global"
        })				
		Citizen.Wait(2000)			
		SetEntityCoords(myPed,450.18341064453,-975.93890380859,30.689596176147,true, false, false,true)
		SetEntityVisible(myPed, true)
		FreezeEntityPosition(myPed, false)
		DTutOpen = false
end

function DTut()
	Citizen.Wait(0)
	local myPed = GetPlayerPed(-1)
	DTutOpen = true
		SetEntityCoords(myPed,450.95901489258,-975.29425048828,30.689594628799,true, false, false,true)
	    SetEntityHeading(myPed, 314.39)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#FFFFFF'>DRPCIV Instructor:</b> <br /><br /> Iti pregatim masina de teste.Intre timp citeste cateva lucruri importante.<br /><br /><b style='color:#87CEFA'>Limita viteza:</b><br />- Acorda atentie traficului, stai sub <b style='color:#A52A2A'>limita de</b> viteza<br /><br />- Pana acum ar trebui sa stii bazele, oricum o sa iti amintim cand <b style='color:#DAA520'>intri/iesi</b> dintr-o zona cu limita impusa",
            type = "alert",
            timeout = (8000),
            layout = "center",
            queue = "global"
        })
		Citizen.Wait(8000)
		TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#FFFFFF'>DRPCIV Instructor:</b> <br /><br /> Foloseste <b style='color:#DAA520'>Pilotul automat</b> pentru a evita <b style='color:#87CEFA'>depasirea limitei</b>, activeaza-l apasand tasta <b style='color:#20B2AA'>X</b> de pe tastatura.<br /><br /><b style='color:#87CEFA'>Evaluare:</b><br />- Incearca sa nu depasesti limita de viteza sau sa faci accident. O sa primesti <b style='color:#A52A2A'>Puncte penalizare</b> de fiecare data cand nu respecti aceste reguli.<br /><br />- Prea multe <b style='color:#A52A2A'>Puncte penalizare</b> acumulate vor rezulta in a <b style='color:#A52A2A'>Pica</b> testul",
            type = "alert",
            timeout = (8000),
            layout = "center",
            queue = "global"
        })
		Citizen.Wait(1)
		SpawnTestCar()
		DTutOpen = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
		local ped = GetPlayerPed(-1)
		if HasEntityCollidedWithAnything(veh) and DamageControl == 1 then
		TriggerEvent("pNotify:SendNotification",{
            text = "Vehiculul a fost <b style='color:#B22222'>avariat!</b><br /><br />Ai grija!",
            type = "alert",
            timeout = (2000),
            layout = "bottomCenter",
            queue = "global"
        })			
			Citizen.Wait(1000)
			Error = Error + 1	
		elseif(IsControlJustReleased(1, 23)) and DamageControl == 1 then
			drawNotification("Nu poti sa iesi din vehicul pe parcursul testului")
    	end
		
	if onTestEvent == 1 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 408.34020996094,-1023.0793457031,29.370031356812, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
			DrawMarker(42,408.34020996094,-1023.0793457031,29.370031356812-0.5,0, 0, 0, 0, 0, 0, 0.5,0.5,0.5,uwuhentai.r, uwuhentai.g, uwuhentai.b,200,1,0,0,true)
		else 
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(402.35562133789,-985.5263671875,29.397932052612)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
		    DrawMissionText2("Inainteaza catre urmatorul punct!", 5000)
			onTestEvent = 2
		end
	end
	
	if onTestEvent == 2 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),402.35562133789,-985.5263671875,29.397932052612, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,402.35562133789,-985.5263671875,29.397932052612,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(408.94961547852,-878.2705078125,29.357221603394)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
		    DrawMissionText2("Inainteaza catre urmatorul punct!", 5000)
			onTestEvent = 3		
		end
	end
	
	if onTestEvent == 3 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),408.94961547852,-878.2705078125,29.357221603394, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,408.94961547852,-878.2705078125,29.357221603394,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(314.94470214844,-854.15209960938,29.16569519043)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
		    DrawMissionText2(" ~r~Opreste~s~ pentru un pieton ~y~care traverseaza", 5000)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
			Citizen.Wait(4000)
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false) -- Freeze Entity
			DrawMissionText2("~g~Foarte bine!~s~ sa continuam drumul!", 5000)
			onTestEvent = 4
		end
	end	
	
		if onTestEvent == 4 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),314.94470214844,-854.15209960938,29.16569519043, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,314.94470214844,-854.15209960938,29.16569519043,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(200.71800231934,-827.57885742188,30.764354705811)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
		    DrawMissionText2("~r~Opreste-te~s~ si verifica ~y~STANGA~s~ intainte sa intrii in trafic", 5000)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
			Citizen.Wait(6000)
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false) -- Freeze Entity
			DrawMissionText2("~g~Super!~s~ Acum fa ~y~DREAPTA~s~ si alegeti banda", 5000)
			drawNotification("Zona: ~y~Oras\n~s~Limita de viteza: ~y~80 km/h\n~s~Puncte penalizare: ~y~".. Error.."/"..maxErrors)
			SpeedControl = 2
			onTestEvent = 5
			Citizen.Wait(4000)
		end
	end	
	
		if onTestEvent == 5 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),200.71800231934,-827.57885742188,30.764354705811, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,200.71800231934,-827.57885742188,30.764354705811,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(105.27336120605,-971.30157470703,29.160488128662)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
		    DrawMissionText2("Ai grija la ~y~semafor~s~ !", 5000)
			onTestEvent = 6
		end
	end	

		if onTestEvent == 6 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),105.27336120605,-971.30157470703,29.160488128662, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,105.27336120605,-971.30157470703,29.160488128662,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(-3.9760534763336,-953.30859375,29.231357574463)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			onTestEvent = 7
		end
	end		
		
	
		if onTestEvent == 7 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-3.9760534763336,-953.30859375,29.231357574463, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,-3.9760534763336,-953.30859375,29.231357574463,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(110.76319122314,-591.52435302734,31.435436248779)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
		    DrawMissionText2("Asigurate ca opresti pentru vehiculele cu prioritate !", 5000)
			onTestEvent = 8
		end
	end			
	
		if onTestEvent == 8 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),110.76319122314,-591.52435302734,31.435436248779, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,110.76319122314,-591.52435302734,31.435436248779,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(326.0830078125,-660.62982177734,29.049734115601)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			onTestEvent = 9
		end
	end			
	
		if onTestEvent == 9 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),326.0830078125,-660.62982177734,29.049734115601, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,326.0830078125,-660.62982177734,29.049734115601,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(449.04733276367,-532.94366455078,28.056009292603)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			onTestEvent = 10
		end
	end		

		if onTestEvent == 10 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),449.04733276367,-532.94366455078,28.056009292603, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,449.04733276367,-532.94366455078,28.056009292603,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(903.2236328125,161.95851135254,73.849655151367)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
		    DrawMissionText2("E timpul sa mergem pe autostrata !", 5000)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			drawNotification("Zona: ~y~Autostrada\n~s~Limita de viteza: ~y~120 km/h\n~s~Puncte penalizare: ~y~".. Error.."/"..maxErrors)
			onTestEvent = 11
			SpeedControl = 3
			Citizen.Wait(4000)
		end
	end		

		if onTestEvent == 11 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),903.2236328125,161.95851135254,73.849655151367, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,903.2236328125,161.95851135254,73.849655151367,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(810.71520996094,201.91744995117,80.734298706055)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			onTestEvent = 12
		end
	end
	
		if onTestEvent == 12 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),810.71520996094,201.91744995117,80.734298706055, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,810.71520996094,201.91744995117,80.734298706055,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(593.24426269531,237.59690856934,102.70091247559)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			onTestEvent = 13
		end
	end	
	
		if onTestEvent == 13 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),593.24426269531,237.59690856934,102.70091247559, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,593.24426269531,237.59690856934,102.70091247559,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(209.54621887207,-1412.8677978516,29.652387619019)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			onTestEvent = 14
		end
	end	
	
		if onTestEvent == 14 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),593.24426269531,237.59690856934,102.70091247559, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,593.24426269531,237.59690856934,102.70091247559,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(431.47827148438,-1020.58203125,28.854772567749)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			DrawMissionText2("Intram in oras!", 5000)
			drawNotification("~r~Incetineste!\n~s~Zona: ~y~Oras\n~s~Limita de viteza: ~y~80 km/h\n~s~Puncte penalizare: ~y~".. Error.."/"..maxErrors)
			onTestEvent = 15
		end
	end		
	
		if onTestEvent == 15 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),431.47827148438,-1020.58203125,28.854772567749, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,431.47827148438,-1020.58203125,28.854772567749,0, 0, 0, 0, 0, 0, 0.75, 0.75, 0.75, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(463.06259155273,-1019.647644043,27.674098968506)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
		    DrawMissionText2("Buna treaba! Acum parcheaza masina in garaj!", 5000)
			drawNotification("Zona: ~y~Oras\n~s~Limita de viteza: ~y~80 km/h\n~s~Puncte penalizare: ~y~".. Error.."/"..maxErrors)
			SpeedControl = 2
			onTestEvent = 16
		end
	end		

		if onTestEvent == 16 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),463.06259155273,-1019.647644043,27.674098968506, true) > 4.0001 then
			local uwuhentai = RGBRainbow( 1 )
		   DrawMarker(42,463.06259155273,-1019.647644043,27.674098968506,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, uwuhentai.r, uwuhentai.g, uwuhentai.b, 200, 1, 0, 2, 1, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			EndDTest()
		end
	end		
end
end)

----Theory Test NUI Operator

-- ***************** Open Gui and Focus NUI
function openGui()
  onTtest = true
  SetNuiFocus(true)
  SendNUIMessage({openQuestion = true})
end

-- ***************** Close Gui and disable NUI
function closeGui()
  SetNuiFocus(false)
  SendNUIMessage({openQuestion = false})
end

-- ***************** Disable controls while GUI open
Citizen.CreateThread(function()
  while true do
    if onTtest then
      local ply = GetPlayerPed(-1)
      local active = true
      DisableControlAction(0, 1, active) -- LookLeftRight
      DisableControlAction(0, 2, active) -- LookUpDown
      DisablePlayerFiring(ply, true) -- Disable weapon firing
      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
      DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
      if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
        SendNUIMessage({type = "click"})
      end
    end
    Citizen.Wait(0)
  end
end)

-- ***************** NUI Callback Methods
-- Callbacks pages opening
RegisterNUICallback('question', function(data, cb)
  SendNUIMessage({openSection = "question"})
  cb('ok')
end)

-- Callback actions triggering server events
RegisterNUICallback('close', function(data, cb)
  -- if question success
  closeGui()
  cb('ok')
  DrawMissionText2("~b~Ai trecut testul, Acum poti sa mergi la testul practic", 2000)	
  theorylock = true
  testlock = false
  onTtest = false
end)

RegisterNUICallback('kick', function(data, cb)
  closeGui()
  cb('ok')
  DrawMissionText2("~r~Ai picat testul, poti incerca in alta zi", 2000)	
  onTtest = false
  theorylock = false
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and not TestDone and not onPtest then
		DrawMissionText2("~r~Conduci fara licenta", 2000)			
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		CarSpeed = GetEntitySpeed(GetCar()) * speed
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and SpeedControl == 1 and CarSpeed >= speed_limit_resi then
		TriggerEvent("pNotify:SendNotification",{
            text = "Ai incalcat limita! <b style='color:#B22222'>Incetineste!</b><br /><br />Conduci intr-o zona de <b style='color:#DAA520'>50 km/h</b>!",
            type = "alert",
            timeout = (2000),
            layout = "bottomCenter",
            queue = "global"
        })
			Error = Error + 1	
			Citizen.Wait(10000)
		elseif(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and SpeedControl == 2 and CarSpeed >= speed_limit_town then
		TriggerEvent("pNotify:SendNotification",{
            text = "Ai incalcat limita! <b style='color:#B22222'>Incetineste!</b><br /><br />Conduci intr-o zona de <b style='color:#DAA520'>80 km/h</b>!",
            type = "alert",
            timeout = (2000),
            layout = "bottomCenter",
            queue = "global"
        })
			Error = Error + 1
			Citizen.Wait(10000)
		elseif(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and SpeedControl == 3 and CarSpeed >= speed_limit_freeway then
		TriggerEvent("pNotify:SendNotification",{
            text = "Ai incalcat limita! <b style='color:#B22222'>Incetineste!</b><br /><br />Conduci intr-o zona de <b style='color:#DAA520'>120 km/h</b>!",
            type = "alert",
            timeout = (2000),
            layout = "bottomCenter",
            queue = "global"
        })
			Error = Error + 1
			Citizen.Wait(10000)
		end
	end
end)


local speedLimit = 0
Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 0 )   
        local ped = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(ped, false)
        local vehicleModel = GetEntityModel(vehicle)
        local speed = GetEntitySpeed(vehicle)
        local inVehicle = IsPedSittingInAnyVehicle(ped)
        local float Max = GetVehicleMaxSpeed(vehicleModel)
        if ( ped and inVehicle and DamageControl == 1 ) then
            if IsControlJustPressed(1, 73) then
                if (GetPedInVehicleSeat(vehicle, -1) == ped) then
                    if CruiseControl == 0 then
                        speedLimit = speed
                        SetEntityMaxSpeed(vehicle, speedLimit)
						drawNotification("~y~Pilot automat: ~g~activat\n~s~Viteza maxima ".. math.floor(speedLimit*3.6).."kmh")
						Citizen.Wait(1000)
				        DisplayHelpText("Ajusteaza viteza maxima cu ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ ")
						PlaySound(-1, "COLLECTED", "HUD_AWARDS", 0, 0, 1)
                        CruiseControl = 1
                    else
                        SetEntityMaxSpeed(vehicle, Max)
						drawNotification("~y~Pilot automat: ~r~Dezactivat")						
                        CruiseControl = 0
                    end
                else
				    drawNotification("Trebuie sa conduci ca sa poti face asta")						
                end
            elseif IsControlJustPressed(1, 27) then
                if CruiseControl == 1 then
                    speedLimit = speedLimit + 0.45
                    SetEntityMaxSpeed(vehicle, speedLimit)
					PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
					DisplayHelpText("Viteza maxima ajustata la ".. math.floor(speedLimit*3.6).. "kmh")
                end
            elseif IsControlJustPressed(1, 173) then
                if CruiseControl == 1 then
                    speedLimit = speedLimit - 0.45
                    SetEntityMaxSpeed(vehicle, speedLimit)
					PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)	
					DisplayHelpText("Viteza maxima ajustata la ".. math.floor(speedLimit*3.6).. "kmh")
                end
            end
        end
    end
end)

----Theory Test NUI Operator

-- ***************** Open Gui and Focus NUI
function openGui()
  onTtest = true
  SetNuiFocus(true)
  SendNUIMessage({openQuestion = true})
end

-- ***************** Close Gui and disable NUI
function closeGui()
  SetNuiFocus(false)
  SendNUIMessage({openQuestion = false})
end

-- ***************** Disable controls while GUI open
Citizen.CreateThread(function()
  while true do
    if onTtest then
      local ply = GetPlayerPed(-1)
      local active = true
      DisableControlAction(0, 1, active) -- LookLeftRight
      DisableControlAction(0, 2, active) -- LookUpDown
      DisablePlayerFiring(ply, true) -- Disable weapon firing
      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
      DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
      if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
        SendNUIMessage({type = "click"})
      end
    end
    Citizen.Wait(0)
  end
end)

Citizen.CreateThread(function()
  while true do
    if DTutOpen then
      local ply = GetPlayerPed(-1)
      local active = true
	  SetEntityVisible(ply, false)
	  FreezeEntityPosition(ply, true)
      DisableControlAction(0, 1, active) -- LookLeftRight
      DisableControlAction(0, 2, active) -- LookUpDown
      DisablePlayerFiring(ply, true) -- Disable weapon firing
      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
      DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
    end
    Citizen.Wait(0)
  end
end)

-- ***************** NUI Callback Methods
-- Callbacks pages opening
RegisterNUICallback('question', function(data, cb)
  SendNUIMessage({openSection = "question"})
  cb('ok')
end)

-- Callback actions triggering server events
RegisterNUICallback('close', function(data, cb)
  -- if question success
  closeGui()
  cb('ok')
  DrawMissionText2("~b~Ai trecut testul, acum poti trece la cel practic", 2000)	
  theorylock = true
  testlock = false
  onTtest = false
end)

RegisterNUICallback('kick', function(data, cb)
    closeGui()
    cb('ok')
    DrawMissionText2("~r~Ai picat testul, il mai dai in alta zi ", 2000)	
    onTtest = false
end)

---------------------------------- DMV PED ----------------------------------

Citizen.CreateThread(function()

  RequestModel(GetHashKey("a_m_y_business_01"))
  while not HasModelLoaded(GetHashKey("a_m_y_business_01")) do
    Wait(1)
  end

  RequestAnimDict("mini@strip_club@idles@bouncer@base")
  while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
    Wait(1)
  end

 	    -- Spawn the DMV Ped
  for _, item in pairs(dmvped) do
    dmvmainped =  CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
    SetEntityHeading(dmvmainped, 137.71)
    FreezeEntityPosition(dmvmainped, true)
	SetEntityInvincible(dmvmainped, true)
	SetBlockingOfNonTemporaryEvents(dmvmainped, true)
    TaskPlayAnim(dmvmainped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)

local talktodmvped = true
--DMV Ped interaction
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(dmvpedpos) do
			if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 1.0)then
				DisplayHelpText("Apasa ~INPUT_CONTEXT~ sa interactionezi cu ~y~NPC")
				if(IsControlJustReleased(1, 38))then
						if talktodmvped then
						    Notify("~b~Bine ai venit la ~h~Scoala DRPCIV!")
						    Citizen.Wait(500)
							DMVMenu()
							Menu.hidden = false
							talktodmvped = false
						else
							talktodmvped = true
						end
				end
				Menu.renderGUI(options)
			end
		end
	end
end)

------------
------------ DRAW MENUS
------------
function DMVMenu()
	ClearMenu()
    options.menu_title = "Scoala DRPCIV"
	Menu.addButton("Obtine o licenta de condus","VehLicenseMenu",nil)
    Menu.addButton("Inchide","CloseMenu",nil) 
end

function VehLicenseMenu()
    ClearMenu()
    options.menu_title = "Licenta vehicul"
	Menu.addButton("Introducere    GRATIS","startintro",nil)
	Menu.addButton("Test Teoretic    200RON","startttest",nil)
	Menu.addButton("Test Practic    500RON","startptest",nil)
    Menu.addButton("Inapoi","DMVMenu",nil) 
end

function CloseMenu()
		Menu.hidden = true
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, true)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

----------------
----------------blip
----------------



Citizen.CreateThread(function()
	pos = dmvschool_location
	local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
	SetBlipSprite(blip,408)
	SetBlipColour(blip,11)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('DMV School')
	EndTextCommandSetBlipName(blip)
	SetBlipAsShortRange(blip,true)
	SetBlipAsMissionCreatorBlip(blip,true)
end)