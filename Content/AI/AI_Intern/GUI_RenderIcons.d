const string ICON_POISON = "a";
const string ICON_FRIEND_WEAK = "b";
const string ICON_PET_AWAY = "c";
const string ICON_PET_HUNGRY = "d";
const string ICON_RUNE = "e";
var int POISON_TEXT;
func int GUI_RENDERPOISON()
{
	if(HeroIsPoisoned)
	{
		return TRUE;
	}
	else
	{
		return FALSE;	
	};
};
func int GUI_RENDERRUNE()
{
	if (RuneCharge<RuneSWD_flags)
	{
		return TRUE;
	}
	else
	{
		return FALSE;	
	};
};

func int GUI_RENDERPUPILHUNGRY()
{
	if(!HeroHasPupil){return FALSE;};
	
	if (Pupil_hungry>69)
	{
		return TRUE;
	}
	else
	{
		return FALSE;	
	};
};

func int GUI_RENDERPUPILAWAY()
{
	if(!HeroHasPupil){return FALSE;};

	if (Npc_GetDistToPlayer(MyWolf) > 3500)&&(Npc_GetDistToPlayer(MyWolf) < 5000)
	{
		return TRUE;
	}
	else
	{
		return FALSE;	
	};
};

func int GUI_RENDERFRIEND_WEAK()
{
	if (!Npc_IsPlayer(NPCNeedHelp0)||!Npc_IsPlayer(NPCNeedHelp1)||!Npc_IsPlayer(NPCNeedHelp2)||!Npc_IsPlayer(NPCNeedHelp3)||!Npc_IsPlayer(NPCNeedHelp4)||!Npc_IsPlayer(NPCNeedHelp5)||!Npc_IsPlayer(NPCNeedHelp6)||!Npc_IsPlayer(NPCNeedHelp7)||!Npc_IsPlayer(NPCNeedHelp8)||!Npc_IsPlayer(NPCNeedHelp9)||!Npc_IsPlayer(NPCNeedHelp10)||!Npc_IsPlayer(NPCNeedHelp11)||!Npc_IsPlayer(NPCNeedHelp12)||!Npc_IsPlayer(NPCNeedHelp13)||!Npc_IsPlayer(NPCNeedHelp14)||!Npc_IsPlayer(NPCNeedHelp15))
	{
		return TRUE;
	}
	else
	{
		return FALSE;	
	};
};
func void GUI_RENDERICONS()
{
/*
	PrintScreen		(ICON_POISON, 2,88,"FONT_ICON_20_WHITE_HI.tga",2);		
	PrintScreen		(ICON_FRIEND_WEAK, 2,83,"FONT_ICON_20_WHITE_HI.tga",2);		
	PrintScreen		(ICON_PET_AWAY, 2,78,"FONT_ICON_20_WHITE_HI.tga",2);		
	PrintScreen		(ICON_PET_HUNGRY, 2,73,"FONT_ICON_20_WHITE_HI.tga",2);		
	PrintScreen		(ICON_RUNE, 2,68,"FONT_ICON_20_WHITE_HI.tga",2);
*/		
//	return;
	B_CleanUpList();

	if(GUI_DontRenderIcons)
	{ return; };
	
	if(GUI_RENDERPOISON())
	{
		PrintScreen		(ICON_POISON, 2,88,"FONT_ICON_20_WHITE_HI.tga",2);
		if(POISON_TEXT==TRUE){ POISON_TEXT=FALSE; PrintScreen		("Zosta³eœ otruty!", 6,90,"FONT_OLD_10_WHITE.tga",2); };	
	}
	else if(POISON_TEXT==FALSE)//showed
	{
	POISON_TEXT=TRUE;//disable
	};	
	if(GUI_RENDERFRIEND_WEAK())
	{
		PrintScreen		(ICON_FRIEND_WEAK, 2,83,"FONT_ICON_20_WHITE_HI.tga",2);
		if(NewNpcOnList>0){  PrintScreen		(ConcatStrings(B_GetNpcName(NewNpcOnList)," potrzebuje pomocy!"), 6,85,"FONT_OLD_10_WHITE.tga",2); NewNpcOnList=0;};	
	}
	else if(POISON_TEXT==FALSE)//showed
	{
	POISON_TEXT=TRUE;//disable
	};		
	if(GUI_RENDERRUNE())
	{
		PrintScreen		(ICON_RUNE, 2,68,"FONT_ICON_20_WHITE_HI.tga",2);	
	};	
	if(GUI_RENDERPUPILHUNGRY())
	{
	PrintScreen		(ICON_PET_HUNGRY, 2,73,"FONT_ICON_20_WHITE_HI.tga",2);				
	};
	if(GUI_RENDERPUPILAWAY())
	{
	PrintScreen		(ICON_PET_AWAY, 2,78,"FONT_ICON_20_WHITE_HI.tga",2);		
	};

			
};