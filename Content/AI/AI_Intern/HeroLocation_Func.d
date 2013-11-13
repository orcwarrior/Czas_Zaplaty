func string GetHeroLocation()
{
	if(Npc_GetDistToWP(hero,"HC_PRACTICE1")< 4500)
	||(Npc_GetDistToWP(hero,"OW_PATH_047")< 4000)
	||(Npc_GetDistToWP(hero,"PATH_OC_NC_4")< 4500)
	||(Npc_GetDistToWP(hero,"OW_PATH_OC_NC5")< 3000)
	{
		
		return "OR";	
	}
	else if(Npc_GetDistToWp(hero,"OCC_CELLAR_HALLWAY_FRONT")< 9000)
	{
		return "OC";	
		
	};
	return "UNKNOWN";
};