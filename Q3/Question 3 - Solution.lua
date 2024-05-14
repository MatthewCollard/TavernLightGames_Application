function RemoveMemberFromParty(playerId, membername) -- changed name to be more appropriate with the action taken

	local player = Player(playerId) -- made player a local variable
	if not player then
		pdump("Player not found") -- returns if player does not exist
		return
	end
	
	local party = player:getParty()
	if not party then
		print("Player is not in a party") -- returns if player is not in a party
		return
	end
	
	for _,member in pairs(party:getMembers()) do -- removed variable k, changed v to member to make more sense
		if member:getName() == membername then
			party:removeMember(membername) -- removes member
		end
	end
end