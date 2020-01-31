RegisterNetEvent('lrp-eed:client:SendAlert')
AddEventHandler('lrp-eed:client:SendAlert', function(data)
	SendAlert(data.type, data.text, data.length, data.style)
end)


function SendAlert(type, text, length, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = length,
		style = style
	})
end













Citizen.CreateThread(function()
    -- main loop thing
	alreadyDead = false
    while true do
        Citizen.Wait(50)
		local playerPed = GetPlayerPed(-1)
		if IsEntityDead(playerPed) and not alreadyDead then
			killer = GetPedKiller(playerPed)
			killername = false
			for id = 0, 64 do
				if killer == GetPlayerPed(id) then
					killername = GetPlayerName(id)
				end				
			end
			if killer == playerPed then
				TriggerServerEvent('lrp-eed:playerDied',0,0)
			elseif killername then
				TriggerServerEvent('lrp-eed:playerDied',killername,1)
			else
				TriggerServerEvent('lrp-eed:playerDied',0,2)
			end
			alreadyDead = true
		end
		if not IsEntityDead(playerPed) then
			alreadyDead = false
		end
	end
end)