func void ZS_AoEDamage ()
{
	PrintDebugNpc			(PD_ZS_FRAME,"ZS_AoEDamage");
//	C_ZSInit				();
	Npc_PercEnable(Self,PERC_NPCCOMMAND,B_CHECKSHEATH);
	
//	Npc_PercEnable  		(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);	
//	Npc_PercEnable  		(self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
//	Npc_PercEnable  		(self,	PERC_ASSESSMAGIC		,	B_AssessMagic		);
//	Npc_PercEnable  		(self,	PERC_ASSESSCASTER		,	B_AssessCaster	);
};

func int ZS_AoEDamage_Loop ()
{
	var C_NPC runenow;	
	runenow				=	Hlp_GetNpc(RuneSword_Now);	
	
	PrintDebugNpc				(PD_ZS_LOOP,	"ZS_Upset_Loop");
//	B_HurtNpc(self,hero,runenow.weapon,runenow.npctype);
	return 					LOOP_END;
};

func void ZS_AoEDamage_End ()
{	
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_Upset_End" );
};