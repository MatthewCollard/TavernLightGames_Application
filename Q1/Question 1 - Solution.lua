local function releaseStorage(uid) -- changed from player to uid since there is a delay in addEvent, and player might have changed since/ 
	local player = Player(uid)
	player:setStorageValue(1000, -1)
end

function onLogout(player)
	if player:getStorageValue(1000) == 1 then
		addEvent(releaseStorage, 1000, player:getId()) --gets the player id and sends it to release storage
	end
	return true
end