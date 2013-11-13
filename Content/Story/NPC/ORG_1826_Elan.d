instance ORG_1826_Elan (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Elan";
	Npctype =				Npctype_Main;
	guild =					GIL_SLV;      
	level =					20;
	
	voice =					9;
	id =					1826;


	//-------- abilities --------

	attribute[ATR_STRENGTH] 	= 66; 
	attribute[ATR_DEXTERITY] 	= 86; 
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= self.level*12;
	attribute[ATR_HITPOINTS] 	= self.level*12;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,2,HUN_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,1.1);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	CreateInvItems	(self,ItKeLockpick,12);		
	CreateInvItems	(self,ItMiNugget,120);
	CreateInvItems	(self,ItFoRice,8);
	CreateInvItems	(self,ItFoBooze,7);
	CreateInvItems	(self,ItLsTorch,7);
	CreateInvItems	(self,ItFo_Potion_Health_01,7);
	CreateInvItem	(self,ItMi_Stuff_Plate_01);
	CreateInvItem	(self,ItMi_Stuff_Cup_01);
	CreateInvItem	(self,ItFoLoaf);
	CreateInvItem	(self,ItAt_Teeth_01);
	EquipItem 		(self,ItMw_1H_Mace_07);
	CreateInvItem 		(self,ItRw_Bow_Long_02);
	CreateInvItems	(self,ItAmArrow,150);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_1826;
};

FUNC VOID Rtn_Start_1826 ()
{
	TA_Smalltalk		(09,00,11,00,"OCR_OUTSIDE_HUT_1");
	TA_Smalltalk		(11,00,12,00,"OCR_OUTSIDE_HUT_43");
	TA_Smalltalk		(12,00,13,00,"OCR_OUTSIDE_HUT_66");
	TA_Smalltalk		(13,00,14,00,"OCR_OUTSIDE_HUT_22");
	TA_Smalltalk		(14,00,15,00,"OCR_OUTSIDE_HUT_55");
	TA_Smalltalk		(15,00,16,00,"OCR_OUTSIDE_HUT_1");
	TA_Smalltalk		(16,00,17,00,"OCR_OUTSIDE_HUT_54");
	TA_Boss		(17,00,18,00,"OCR_PALISADES_PLATFORM_04");
	TA_Smalltalk		(18,00,19,00,"OCR_OUTSIDE_HUT_66");
	TA_Smalltalk		(19,00,20,00,"OCR_OUTSIDE_HUT_27");
	TA_Smalltalk		(20,00,21,00,"OCR_OUTSIDE_HUT_55");
	TA_Smalltalk		(21,00,22,00,"OCR_OUTSIDE_HUT_1");
	TA_Stand			(22,00,09,00,"OCR_OUTSIDE_HUT_44");
};

FUNC VOID Rtn_gguide_1826 ()
{
	TA_GuidePC (08,00,20,00,"OW_PATH_07_21");
	TA_GuidePC (20,00,08,00,"OW_PATH_07_21"); 
};

FUNC VOID Rtn_tart_1826 ()
{
	TA_Stand (08,00,23,00,"NC_TAVERN_BAR");
	TA_Stand (23,00,08,00,"NC_TAVERN_BAR");
	//TA_Sleep (23,00,08,00,"NC_HUT21_IN"); 
};












