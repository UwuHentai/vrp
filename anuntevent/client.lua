vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("anuntrestart")

local meniu = false

RegisterNetEvent("meniu")
AddEventHandler(
    "meniu",
    function()
        meniu = not meniu
    end
)

Citizen.CreateThread(
    function()
        while true do
            Wait(0)
            RegisterCommand("event",function()
                SendNUIMessage({transactionTyperestart = 'playSoundrestart'})
                announcestring = "Imediat vei fi intrebat daca ~g~vrei ~w~sau ~r~nu~w~ sa vi la ~p~event~w~!"
                Wait(5000)
                announcestring = false
                meniu = not meniu
            end)
            if meniu then
                        ShowCursorThisFrame() --Astea de aici in jos iti blocheaza movement-ul
                        DisableControlAction(0, 24, true)
                        DisableControlAction(0, 47, true)
                        DisableControlAction(0, 58, true)
                        DisableControlAction(0, 263, true)
                        DisableControlAction(0, 264, true)
                        DisableControlAction(0, 257, true)
                        DisableControlAction(0, 140, true)
                        DisableControlAction(0, 141, true)
                        DisableControlAction(0, 142, true)
                        DisableControlAction(0, 143, true)
                        DisableControlAction(0, 1, true)
                        DisableControlAction(0, 2, true)
                        DrawRect(0.500, 0.500, 0.300, 0.200, 200, 200, 200, 100)
                        drawtxt("💝~h~~c~ VI LA EVENT?? 💝", 1, 1, 0.500, 0.420, 0.70, 46, 163, 152, 255)

                        drawtxt("~h~~g~DA", 1, 1, 0.420, 0.500, 0.70, 46, 163, 152, 255)
                        drawtxt("~h~~r~NU", 1, 1, 0.580, 0.500, 0.70, 46, 163, 152, 255)

                        if isCursorInPosition(0.420, 0.500, 0.10, 0.10) and IsControlJustPressed(0, 18) then
                            TriggerServerEvent("notificareDA")
                            Wait(1000)
                            vRP.teleport({114.96028137207,-1078.3465576172,29.192371368408})
                            meniu = false
                        end

                        if isCursorInPosition(0.580, 0.500, 0.10, 0.10) and IsControlJustPressed(0, 18) then
                            TriggerServerEvent("notificareNU")
                            meniu = false
                        end

            end
        end
    end
)

function drawtxt(text, font, centre, x, y, scale, r, g, b, a)
    y = y - 0.010
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function isCursorInPosition(x, y, width, height)
    local sx, sy = 1920, 1080
    local cx, cy = GetNuiCursorPosition()
    local cx, cy = (cx / sx), (cy / sy)

    local width = width / 2
    local height = height / 2

    if (cx >= (x - width) and cx <= (x + width)) and (cy >= (y - height) and cy <= (y + height)) then
        return true
    else
        return false
    end
end

--      HACKER GEO START      --    https://github.com/HackerGeo-sp1ne/vRP_Welcome

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("[ ~p~SERVER EVENT ~w~]")
    PushScaleformMovieFunctionParameterString(announcestring)
	PopScaleformMovieFunctionVoid()
    return scaleform
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if announcestring then      
            scaleform = Initialize("mp_big_message_freemode")
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
        end
    end
end)

RegisterNetEvent("startinfo")
AddEventHandler("startinfo", function()
end)

--      HACKER GEO END      --   