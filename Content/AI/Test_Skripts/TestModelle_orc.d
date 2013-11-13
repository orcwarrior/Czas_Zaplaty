/*************************************************************************
**																		**
**		TESTMODELLE_ORC.D												**
**		===================												**
**																		**
**		nieruchomy 														**
**		- No Focus NPC + Routine											**
**		works with: Demon															**
*************************************************************************/
instance nieruchomy(Npc_Default)
{
	name							=	"Eksponat";
	guild							=	GIL_SHADOWBEAST;
	Npc_SetAivar(self,AIV_MM_REAL_ID, 	6546);
	level							=	40;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	110;
	attribute	[ATR_DEXTERITY]		=	110;
	
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	50;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
//---------------------------------------------------------
	fight_tactic					=	FAI_SHADOWBEAST;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1500);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1300);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 4);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_TestNoFocus;

 Npc_SetAivar(self,AIV_MM_RoamStart, 	 OnlyRoutine);
//-------------------------------------------------------------
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};	
  
func void B_MakeFocus()
{
	//	INFO
	self.attribute	[ATR_HITPOINTS]		=	self.attribute	[ATR_HITPOINTS_MAX];
	self.name							=	"Suprise Muthafucka!";

	self.fight_tactic					=	FAI_SHADOWBEAST;

	B_StandUP(self);
	Mdl_ApplyOverlayMds(self,"Shadow.mds");	
	Npc_SetToFistMode(self);	
	Npc_ClearAiQueue(self);	
    AI_StartState				(self,ZS_MM_AllScheduler,1,"");
   	self.start_aistate				= ZS_MM_AllScheduler;	
 	//Npc_SetToFistMode(self);
  		
};	

func void ZS_TestNoFocus ()
{
//	Npc_PercEnable  ( self, PERC_ASSESSTALK	    , B_AssessTalk 		 );		
//	Npc_PercEnable  ( self, PERC_ASSESSGIVENITEM, ZS_AssessGivenItem );		
	Npc_PercEnable  ( self, PERC_ASSESSTALK	    , B_MakeFocus	 );		
	
	//
	//	LOOK AT PLAYER
	//
	self.attribute	[ATR_HITPOINTS]		=	0;
	
};	

	//----------------------------------------------------------------	
	//----------------------------------------------------------- LOOP	
	//----------------------------------------------------------------	
func void ZS_TestNoFocus_Loop ()
{
	if(Npc_GetDistToPlayer(self)>400)
	{
	B_MakeFocus();	
	};
};

	//----------------------------------------------------------------	
	//----------------------------------------------------------- EXIT	
	//----------------------------------------------------------------	
func void ZS_TestNoFocus_End ()
{
};

	