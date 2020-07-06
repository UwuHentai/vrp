

---------------------------------------------------------------
--                   Made by Uwu Hentai                      --
--                Don't Try to Repost Or Sell                --
---------------------------------------------------------------




    Citizen.CreateThread(function()
            while true do
                Wait(0)
                RegisterCommand("arestart",function()
                SendNUIMessage({transactionType60 = 'playSound60'}) 
                announcestring = "~h~~r~60 SECUNDE"
                Wait(5000)
                announcestring = false
                Wait(30000)
                SendNUIMessage({transactionType30 = 'playSound30'}) 
                announcestring = "~h~~r~30 SECUNDE"
                Wait(5000)
                announcestring = false
                Wait(15000)
                SendNUIMessage({transactionType15 = 'playSound15'}) 
                announcestring = "~h~~r~15 SECUNDE"
                Wait(5000)
                announcestring = false
                Wait(5000)
                SendNUIMessage({transactionType10 = 'playSound10'})
                announcestring = "~h~~r~10 SECUNDE"
                Wait(5000)
                announcestring = false
                Wait(5000)
                SendNUIMessage({transactionType5 = 'playSound5'}) 
                announcestring = "~h~~r~5 SECUNDE"
                Wait(5000)
                announcestring = false
                Wait(5000)
                SendNUIMessage({transactionTyperestart = 'playSoundrestart'}) 
                announcestring = "~h~~r~RESTART!!"
                Wait(5000)
                announcestring = false
                TriggerServerEvent("restart")
        end)
    end
end)

--      HACKER GEO START      --    https://github.com/HackerGeo-sp1ne/vRP_Welcome

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("[ ~c~SERVER RESTART ~w~]")
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
