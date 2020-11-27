-- CONFIG --

-- AFK Kick Time Limit (in seconds)
secondsUntilKick = 1100

-- Warn players if 3/4 of the Time Limit ran up
kickWarning = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "Tämä on kuulutus!", {255, 0, 0}, "^1Sinut potkitaan ulos " .. time .. " sekunnin päästä, koska olet ollut liikkumatta liian pitkään. Liiku tai kirjoita /paikalla")
					end

					time = time - 1
				else
					TriggerServerEvent("kickForBeingAnAFKDouchebag")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)

RegisterCommand('paikalla', function(source, args, rawCommand)
	time = secondsUntilKick
	TriggerEvent("chatMessage", "Tämä on kuulutus!", {0, 255, 0}, "^2AFK Timer nollattu!")
end)