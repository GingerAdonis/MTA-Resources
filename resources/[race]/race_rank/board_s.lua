addEvent("onRaceStateChanging")
addEventHandler ( "onRaceStateChanging", root, 
	function(newState, old)
		if newState == "PreGridCountdown" then
			triggerClientEvent("serverSendGM", getRootElement(), exports.race:getRaceMode() )
		elseif newState == "NoMap" then
			triggerClientEvent("serverSendGM", getRootElement(), false )
		end

	end
)

addEvent('onPlayerReachCheckpoint')
addEventHandler('onPlayerReachCheckpoint', root,
	function(checkpointNum, timePassed)
		triggerClientEvent('onClientPlayerReachCheckpoint', source, checkpointNum, timePassed)
	end
)

addEvent('onPlayerFinish')
addEventHandler('onPlayerFinish', root,
	function(rank, time)
		triggerClientEvent('onClientPlayerStateChange', source, "finished")
		triggerClientEvent('onClientPlayerReachCheckpoint', source, 0, time)
	end
)

addEvent('onPlayerSetSpecialCountry', true)
addEventHandler('onPlayerSetSpecialCountry', root,
	function(country)
		if country == "" then
			removeElementData(source, "specialCountry")
		else
			setElementData(source, 'specialCountry', country) 
		end	
		triggerClientEvent('onClientPlayerSetSpecialCountry', source, country)
	end
)
