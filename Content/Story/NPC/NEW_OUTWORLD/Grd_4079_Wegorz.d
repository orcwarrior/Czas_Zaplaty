instance Grd_2519_Wegorz (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Wêgorz";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	50;
	voice 		=	11;
	id 			=	2519;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 125;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 420;
	attribute[ATR_HITPOINTS] 	= 420;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",24,1,EBR_ARMOR_H2);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);

	Mdl_SetModelScale(self,1.1,1.1,1.1);

	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    

	EquipItem	(self,GRD_MW_04);
	CreateInvItems(self,ItFo_Potion_Health_03,4);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_2519;
};

FUNC VOID Rtn_Start_2519 ()
{
	TA_Guard		    (07,00,20,00,"PATH_CASTLE_TO_WATERFALL");
	TA_Guard		    (20,00,07,00,"PATH_CASTLE_TO_WATERFALL");
};

FUNC VOID Rtn_Attack_2519 ()
{
	TA_HostileGuard		    (07,00,20,00,"NEWPATH_4");
	TA_HostileGuard		    (20,00,07,00,"NEWPATH_4");
};

FUNC VOID Rtn_HIDE_2519 ()
{
	TA_Guard	(00,00,06,00,"WP_INTRO_WI05");
	TA_Guard	(06,00,24,00,"WP_INTRO_WI05");
};

FUNC VOID Rtn_OR3_2519 ()
{
	TA_Guard	(00,00,06,00,"OW_PATH_TEMPELRUIN06");
	TA_Guard	(06,00,24,00,"OW_PATH_TEMPELRUIN06");
};

FUNC VOID Rtn_OR4_2519 ()
{
	TA_Guard	(00,00,06,00,"OW_PATH_TEMPELRUIN06");
	TA_Guard	(06,00,24,00,"OW_PATH_TEMPELRUIN06");
};

FUNC VOID Rtn_RIT_2519 ()
{
	TA_HostileGuard(07,00,20,00,"RIT1");
	TA_HostileGuard(20,00,07,00,"RIT1");
};
