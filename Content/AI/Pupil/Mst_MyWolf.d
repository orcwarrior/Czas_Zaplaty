/*************************************************************************
**	Wolf Prototype		August 27, 2007 - Moved here												**
*************************************************************************/
func void Set_Wolf_Visuals()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

PROTOTYPE Mst_Default_Wolf(C_Npc)			
{
	name							=	"Wilk";
	guild							=	GIL_WOLF;
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_WOLF);
	level							=	10;
//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	55;
	attribute	[ATR_DEXTERITY]		=	45;
	
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	exp								=	0;
	
//-----------------------------------------------------------
	protection	[PROT_BLUNT]		=	35;
	protection	[PROT_EDGE]			=	35;
	protection	[PROT_POINT]		=	15;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	5;
//-----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//-----------------------------------------------------------
	fight_tactic					=	FAI_WOLF;
//-----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PACKHUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1500);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1200);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
// Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  2);		
//-----------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

 Npc_SetAivar(self,AIV_MM_RoamStart, 	 OnlyRoutine);	
   Set_Wolf_Visuals();
};
//-----------------------------------------------------------

func void Set_WolfPupil_Visuals()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body2",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_ApplyOverlayMDS			(self,"WOLF_PUPIL.mds");
};

instance My_Wolf(Mst_Default_Wolf)
{
   name                            =       "Bia³y kie³";
   guild                           =       GIL_PUPIL;
   level                           =       0;

   attribute       [ATR_STRENGTH]          =       80;
   attribute       [ATR_DEXTERITY]         =       50;
   attribute       [ATR_HITPOINTS_MAX]     =       180;
   attribute       [ATR_HITPOINTS]         =       180;
  
   protection      [PROT_BLUNT]            =       40;
   protection      [PROT_EDGE]                     =       40;
   protection      [PROT_POINT]            =       20;
   protection      [PROT_FIRE]                     =       20;
   protection      [PROT_FLY]                      =       0;
   protection      [PROT_MAGIC]            =       10;
  
   Npc_SetAivar(self,AIV_MM_DistToMaster,  300);//maksymalne oddalenie siê od PC_hero
   Npc_SetAivar(self,AIV_MM_PARTYMEMBER,   TRUE);//dodawanie doœ z zabitych przez wilka
   start_aistate                                   = ZS_MM_SummonedByPC;//chodzenie za postaci¹ i zabijanie
   //Npc_SetAivar(self,AIV_MM_TimeLooseHP,         1);//czas po których przyjaciel zginie pobawic siê z tym trzeba narazie wy³¹czam
      
   Set_WolfPupil_Visuals();

   Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
   Npc_SetToFistMode(self);
};