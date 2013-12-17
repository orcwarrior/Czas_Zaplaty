instance Grd_205_Scorpio (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Skorpion";
	npctype		=	npctype_main;
	guild 		=	GIL_HUN;
	level 		=	25;
	voice 		=	13;
	id 			=	205;
	flags			= NPC_FLAG_IMMORTAL;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 90;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 620;
	attribute[ATR_HITPOINTS] 	= 620;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",18,2,GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_Ranged;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,HUN_MW_01);
	EquipItem	(self,GRD_RW_02);	
	CreateInvItems	(self,ItMiNugget,13);
	CreateInvItems	(self,ItAmBolt,32);	
	CreateInvItems	(self,ItFo_Potion_Health_02,5);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_205;
};

FUNC VOID Rtn_start_205 ()
{
	TA_Stand		(10,00,12,00,"LOCATION_16_IN");	
	TA_Stand		(12,00,10,00,"LOCATION_16_IN");	
};

FUNC VOID Rtn_OR_205 ()
{
	TA_Smalltalk		(14,00,16,00,"WATCHTOWER2_TOP2"); //Pacho	
	TA_Boss				(16,00,00,00,"WATCHTOWER2_TOP2");
	TA_SitAround		(00,00,02,00,"WATCHTOWER2_TOP1");	
	TA_Smalltalk	(02,00,04,00,"WATCHTOWER2_TOP2"); //Pacho
	TA_Sleep		(04,00,10,00,"WATCHTOWER2_AT2_2");
	TA_Stand		(10,00,12,00,"WATCHTOWER2_AT1_4");	
	TA_SitAround	(12,00,14,00,"WATCHTOWER2_AT1_4");		
};
FUNC VOID Rtn_pachotreasure_205 ()
{
	TA_FollowPc		(21,10,21,09,"OW_PATH_BLOODFLY01_MOVEMENT");
};
FUNC VOID Rtn_FOLLOW_205 ()
{
	TA_FollowPC		(02,00,14,00,"PATH_OC_NC_3");	
	TA_FollowPC		(14,00,02,00,"PATH_OC_NC_3");
};
func void Rtn_Bannished_205 ()
{
	TA_Stay	(07,00,20,00,"OW_CAVALORN_01");
	TA_Stay	(20,00,07,00,"OW_CAVALORN_01");
};
FUNC VOID Rtn_pachotressurewait4hero_205 ()
{
	TA_Stand		(21,10,21,09,"SPAWN_OW_LURKER_RIVER2_BEACH3");
};
Func Void Rtn_Alarm_205 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR15"); 
	 
};