
AddEventHandler('playerConnecting', function()
		local nombrejoinyjoin = GetPlayerName(source)
		TriggerClientEvent('lrp-eed:client:SendAlert', -1, { type = 'cajajoin', text =  nombrejoinyjoin.. ' Ingreso' ,length = 7000})
end)
AddEventHandler('playerDropped', function()
	local nombrejoinyleft = GetPlayerName(source)
		
		TriggerClientEvent('lrp-eed:client:SendAlert', -1, { type = 'cajaleft', text =  nombrejoinyleft.. ' Se Retiro' ,length =7000})


end)
	
RegisterServerEvent('lrp-eed:playerDied')
AddEventHandler('lrp-eed:playerDied',function(killer,reason)
local nombre = GetPlayerName(source)

	if killer == "**Invalid**" then --Can't figure out what's generating invalid, it's late. If you figure it out, let me know. I just handle it as a string for now.
		reason = 2
	end
	if reason == 0 then
	TriggerClientEvent('lrp-eed:client:SendAlert', -1, { type = 'cajamuerte', text =  nombre..'  En estado critico ' ,length = 8000})


	elseif reason == 1 then

	TriggerClientEvent('lrp-eed:client:SendAlert', -1, { type = 'cajamuerte', text =  killer..'  hirio a '..nombre ,length = 8000})

	else

	TriggerClientEvent('lrp-eed:client:SendAlert', -1, { type = 'cajamuerte', text =  nombre..'   En estado critico ' ,length = 8000})

	end
end)