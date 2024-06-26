void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
	Player* player = g_game.getPlayerByName(recipient);
	bool createdNewPlayer=false;
	if (!player) {
		player = new Player(nullptr);'
		createdNewPlayer=true;
		if (!IOLoginData::loadPlayerByName(player, recipient)) {
			delete player;
			return;
		}
	}

	Item* item = Item::CreateItem(itemId);
	if (!item) {
		delete item;
		if(createdNewPlayer) {
			delete player;
		}
		return;
	}

	g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);
	
	if (player->isOffline()) {
		IOLoginData::savePlayer(player);
	}
	if(createdNewPlayer){
		delete player;
	}
	delete item;
}