instance RBL_331_Fingers (Npc_Default)
{//NOW RBL!!
	//-------- primary data --------
	name 			=		"R¹czka";
	npctype			=		npctype_Main;
	guild 			=		GIL_RBL;
	level 			=		7;
	
	flags			=       NPC_FLAG_TALKONLY;//after first dialog,flag will dispear
	voice 			=		9;
	id 				=		331;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	55;
	attribute[ATR_DEXTERITY] 		=	90;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_HITPOINTS_MAX]	=	124;
	attribute[ATR_HITPOINTS] 		=	124;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",56,1,RBL_ARMOR_H);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_RANGED; 

	//-------- Talente -------- 

	Npc_SetTalentSkill 	( self,NPC_TALENT_BOW,2 );
	Npc_SetTalentSkill 	( self,NPC_TALENT_1H,1 );	
		
	//-------- inventory --------
	
	EquipItem	( self,HUN_MW_01);
	EquipItem	( self,HUN_RW_01);
	
	CreateInvItems	(self,ItAmArrow,18);
	CreateInvItems	(self,ItKeLockpick,8);
	CreateInvItems	(self,ItFoBeer,2);
	CreateInvItems	(self,ITKE_GOMEZ_01,1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_prestart_331;

	// //MISSION[0] = Mis_1_OC_Fingers_TeachLockpick;
};
FUNC VOID Rtn_prestart_331 ()
{
	TA_Stand	(23,00,07,00,"RACZKA_CHATA_DOOR");        
	TA_Stand	(07,01,22,59,"RACZKA_CHATA_DOOR");             
	     
};
FUNC VOID Rtn_afterPanic_331 ()
{
	TA_Smoke	(23,00,07,00,"PATH_OR22");        
	TA_Smoke	(07,01,22,59,"PATH_OR22");             
	     
};
FUNC VOID Rtn_start_331 ()
{
	TA_Sleep	(23,00,07,00,"RACZKA_SLEEP");             
	TA_Boss		(07,00,08,00,"RACZKA_CHATA_DOOR");
    TA_SitAround    (08,00,15,30,"CHATA_RACZKA");
    TA_Smalltalk	(15,30,19,30,"HELPPOINT6");
    TA_Stand        (19,30,23,00,"TAVERNE10");
};
FUNC VOID Rtn_PREPARATION_331 ()
{
	
	TA_Sleep	(02,00,07,00,"RACZKA_SLEEP");             
	TA_Boss		(07,00,08,00,"RACZKA_CHATA_DOOR");
	TA_RepairHut			(08,00,12,05,"HC_PALISADE_REPAIR_2");
	TA_STAND			(12,05,13,00,"OW_PATH_OC_NC4");
	TA_RepairHut			(13,00,02,00,"HC_PALISADE_REPAIR_2");
     		  
};
FUNC VOID Rtn_Alarm_331 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_RANGED5"); 
	 
};

FUNC VOID Rtn_mourder_331 ()
{
Ta_Stand (0,00,12,00,"FIN_M"); 
Ta_Stand (12,00,0,00,"FIN_M"); 
};