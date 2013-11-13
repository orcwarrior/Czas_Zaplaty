instance SLD_709_Cord (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Cord";
	Npctype =						Npctype_Main;
	guild =							GIL_SLV;       
	level =							18;
	
	voice =							14;
	id =							709;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		180;
	attribute[ATR_DEXTERITY] =		75;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	456;
	attribute[ATR_HITPOINTS] =		456;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,49hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",104 ,1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

	CreateInvItem (self,Cords_Spalter);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,23);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoLoaf,7);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,15);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,8);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_709;
};

FUNC VOID Rtn_NC2_709 ()
{
   TA_Sleep	(21,00,07,00,"NC_HUT09_IN");
	TA_Boss		(07,00,21,00,"NC_WATERFALL_TOP01_MOVEMENT");
};

FUNC VOID Rtn_FMTaken_709 ()
{	
	TA_Stay		(00,00,23,00,"OW_PATH_075");    
	TA_Stay		(23,00,24,00,"OW_PATH_075");     
};	

FUNC VOID Rtn_start_709 ()
{
   TA_Boss		(21,00,07,00,"LOCATION_19_03_ENTRANCE_HARPYE2");
	TA_Boss		(07,00,21,00,"LOCATION_19_03_ENTRANCE_HARPYE2");
};

FUNC VOID Rtn_NC1_709 ()
{
   TA_Boss		(21,00,07,00,"NC_RICELORD");
	TA_Boss		(07,00,21,00,"NC_RICELORD");
};

FUNC VOID Rtn_TRAP_709 ()
{
   TA_Boss		(21,00,07,00,"FP_ROAM_OW_SNAPPER_OW_ORC_MOVE");
	TA_Boss		(07,00,21,00,"FP_ROAM_OW_SNAPPER_OW_ORC_MOVE");
};

FUNC VOID Rtn_NC3_709 ()
{
   TA_Boss		(21,00,07,00,"OW_PATH_1_5_13");
	TA_Boss		(07,00,21,00,"OW_PATH_1_5_13");
};
