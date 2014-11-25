
/********************

Ork to ma byæ jaszczurka,zmieñ mu wygl¹d i co tam trzeba
**********************/

instance Liz_4092_Hesstad (Mst_Default_Draconian)
{
	//-------- primary data --------
	
	name 		=	"Hesstad";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	90;
	voice 		=	11;
	id 			=	4092;
	spawnDelay	=	NPC_FLAG_BRAVE;
	
	//-------- abilities --------
	attribute	[ATR_STRENGTH]		=	250;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	700;
	attribute	[ATR_HITPOINTS]		=	700;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_POINT]		=	110;
	protection	[PROT_FIRE]			=	120;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	90;

	//-------- visuals --------
	// 				animations
	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);
	Set_Draconian2_Visuals();	
	
	Npc_SetAivar(self, AIV_IMPORTANT, TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
                   
   Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	//-------- inventory --------
	EquipItem (self, ItMw_Draco_03);	
	
	B_SetMonsterLevel();	
	senses 			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4092;
};


FUNC VOID Rtn_START_4092 ()
{
	TA_Stay(07,00,20,00,"PATH_NEW_AROUND_PSI21");
	TA_Stay(20,00,07,00,"PATH_NEW_AROUND_PSI21");
};

FUNC VOID Rtn_GD1_4092 ()
{
	Ta_GuidePC(07,00,20,00,"OW_ORC_PATH");
	Ta_GuidePC(20,00,07,00,"OW_ORC_PATH");
};

FUNC VOID Rtn_GD2_4092 ()
{
	Ta_GuidePC(07,00,20,00,"OW_ORC_PATH_06_1");
	Ta_GuidePC(20,00,07,00,"OW_ORC_PATH_06_1");
};

FUNC VOID Rtn_GD3_4092 ()
{
	Ta_GuidePC(07,00,20,00,"OW_ORC_SHAMAN_ROOM2");
	Ta_GuidePC(20,00,07,00,"OW_ORC_SHAMAN_ROOM2");
};

FUNC VOID Rtn_GD4_4092 ()
{
	Ta_GuidePC(07,00,20,00,"OW_ORC_BOSS2");
	Ta_GuidePC(20,00,07,00,"OW_ORC_BOSS2");
};

FUNC VOID Rtn_GD5_4092 ()
{
	Ta_GuidePC(07,00,20,00,"ORC_ELDER");
	Ta_GuidePC(20,00,07,00,"ORC_ELDER");
};

FUNC VOID Rtn_GO_4092 ()
{
	TA_Stay(07,00,20,00,"WP_INTRO_WI05");
	TA_Stay(20,00,07,00,"WP_INTRO_WI05");
};
