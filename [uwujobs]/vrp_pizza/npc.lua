local coordonate = {
    {24.108381271362,-1347.365234375,28.497032165528,"~h~~o~Jerry's Pizza Manager",280.77,0x0703F106,"csb_anita"}
}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
      RequestAnimDict("amb@world_human_clipboard@male@base")
      while not HasAnimDictLoaded("amb@world_human_clipboard@male@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"amb@world_human_clipboard@male@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)
