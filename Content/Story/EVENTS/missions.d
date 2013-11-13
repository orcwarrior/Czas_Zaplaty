func void EVT_TP_CASLEOUT()
{
	AI_Teleport(hero,"HIDDEOUT1");
	PrintScreen("Jesteœ poza zamkiem!",-1,-1,"font_old_20_white.tga",3);
};

func void EVT_TP_CASLEIN()
{
	AI_Teleport(hero,"HIDDEOUT10");
	PrintScreen("Wróci³eœ do zamku!",-1,-1,"font_old_20_white.tga",3);
};

func void EVT_TP_DUNGEON()
{
	if (Npc_KnowsInfo (hero,DIA_Cavalorn_CastleIn1))
	{
      AI_Teleport(hero,"HIDDEOUT10");
      PrintScreen("Odnalaz³eœ podziemia!",-1,-1,"font_old_20_white.tga",3);
	};
};