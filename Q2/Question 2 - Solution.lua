function printSmallGuildNames(memberCount)
-- this method is supposed to print names of all guilds that have less than memberCount max members
	local selectGuildQuery = "SELECT 'name' FROM 'guilds' WHERE 'max_members' < %d;"
	local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
	if resultId ~= false then -- checks to see if the result is empty
		repeat -- loops until there are no more results
			local guildName = result.getString(resultId, "name") --gets name from resultId
			print(guildName) -- prints
		until not result.next(resultId)
		result.free(resultId) -- releases resources
	end
end