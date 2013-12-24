/*************************************************************************
**	Dirk Prototype		(aka DragonSnapper)								**
*************************************************************************/

PROTOTYPE Mst_Default_Dirk(C_Npc)			
{
	name							=	"Sztyletnik";
	guild							=	GIL_SNAPPER;
	level							=	50;
//--------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	230;
	attribute	[ATR_DEXTERITY]		=	200;
	
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------------
	protection	[PROT_BLUNT]		=	160;
	protection	[PROT_EDGE]			=	160;
	protection	[PROT_POINT]		=	80;
	protection	[PROT_FIRE]			=	120;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	55;
//--------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//--------------------------------------------------------------
	fight_tactic					=	FAI_SNAPPER;
//--------------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1400);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1200);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 4);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------
func void Set_Dirk_Visuals()
{
	Mdl_SetVisual			(self,	"DRAGONSNAPPER.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"RAZOR_DEMON_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
/*************************************************************************
**	Dirk    															**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

INSTANCE Dirk (Mst_Default_Dirk)
{
	Set_Dirk_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  9);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  60);
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_DIRK);
	B_SetMonsterLevel();	
};





/*************************************************************************
**	Missions    															**
*************************************************************************/
func void ZS_MisDirk()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_MisDirk");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessSc	);
	Npc_SetPercTime		(self,	1);
	self.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable  	(self,	PERC_ASSESSCASTER		,	B_AssessCaster	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 		);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob			);		
	Ai_Wait(self,2);	
	Ai_PlayAni(self,"T_WARN");		
	Ai_Wait(self,2);
};
func int ZS_MisDirk_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_MisDirk_Loop");
	//PRINTGlobals		(PD_MST_DETAIL);

	//-------- SC-Meister folgen ! --------
	if (Npc_GetDistToNpc(self,hero) > HAI_DIST_FOLLOWPC)
	{
		if	!C_BodyStateContains(self, BS_SWIM)
		{	
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_GotoNpc		(self,	hero);
	}
	else
	{
		B_SmartTurnToNpc(self,	hero);
	};
	
	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};
func void ZS_MisDirk_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPijakB_End");


};
INSTANCE Pacho_Monster (Mst_Default_Dirk)
{
	name							=	"Potwór";	
	Set_Dirk_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  55);
	B_SetMonsterLevel();	
	start_aistate				= ZS_MisDirk;
	
	level							=	40;
//--------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	280;
	attribute	[ATR_DEXTERITY]		=	200;
	
	attribute	[ATR_HITPOINTS_MAX]	=	230;
	attribute	[ATR_HITPOINTS]		=	230;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	25;
	protection	[PROT_MAGIC]		=	0;
//--------------------------------------------------------------
	
};