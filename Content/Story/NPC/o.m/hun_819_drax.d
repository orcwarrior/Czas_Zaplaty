instance HUN_819_Drax (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Drax";
	Npctype =				Npctype_Main;	
	guild =					GIL_HUN;      
	level =					17;

	
	voice =					7;
	id =					819;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		110;
	attribute[ATR_DEXTERITY] =		95;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12+110;
	attribute[ATR_HITPOINTS] =		self.level*12+110;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",39,2,HUN_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);		
	
	fight_tactic	=	FAI_HUMAN_RANGED;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	
	//-------- inventory --------   
	EquipItem (self,HUN_MW_01);
	EquipItem (self,HUN_RW_02);	                                 
	CreateInvItems (self,ItKeLockpick,2);		
	CreateInvItems(self,ItMiNugget,417);
	CreateInvItems (self,ItFoRice,6);
	CreateInvItems (self,ItFoBooze,2);
	CreateInvItems (self,ItLsTorch,3);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Claws_01);
	CreateInvItems (self,ItAmArrow,100);
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_prestart_819;

};

FUNC VOID Rtn_prestart_819 ()
{
    TA_Boss				(05,00,16,00,"PRACTICEPATH");   
    TA_Boss				(16,01,04,59,"PRACTICEPATH");       	
};
FUNC VOID Rtn_start_819 ()
{
	
	TA_Sleep			(02,30,09,00,"HC_HUT_DRAX_INDOOR"); 		
    TA_Boss				(09,00,16,00,"OM_SHOP_01");   		
	TA_Smalltalk		(16,00,17,00,"OM_SHOP_01");//Vam    
	TA_Smalltalk		(17,00,18,00,"OM_SHOP_01");//ratford
	TA_Smalltalk		(18,00,19,00,"OM_SHOP_01");//Baal Taran
	TA_Boss				(19,00,22,00,"OM_SHOP_01");
	TA_Smalltalk		(22,00,22,30,"FISKSMALLTALK");//Aidan
    TA_Stand	(22,30,01,30,"TAVERNE1");	    	
  	TA_Stand	(01,30,02,30,"DRAX_SHOP_PATCH");	  
};
FUNC VOID Rtn_PREPARATION_819 ()
{
	
	TA_Sleep			(03,30,06,00,"HC_HUT_DRAX_INDOOR"); 		
    TA_Boss				(06,00,07,00,"HC_HUT_DRAX_OUTDOOR"); 
	TA_RepairHut		(07,00,08,00,"HC_PALISADE_REPAIR_2");
    TA_PRACTICESWORD	(08,00,03,30,"HC_PRACTICE4"); 
     		  
};

// FUNC VOID Rtn_start_819 ()
// {
// 	TA_Stay	(07,30,08,00,"OW_PATH_1_3");
// 	TA_Stay	(08,00,07,30,"OW_PATH_1_3");
// };

FUNC VOID Rtn_112_819 ()
{
	TA_Stay	(07,30,08,00,"OW_PATH_1_3");
	TA_Stay	(08,00,07,30,"OW_PATH_1_3");
};

FUNC VOID Rtn_Start1_819 ()
{
	TA_Walk (08,01,13,51,"OW_PATH_1_3"); 
	TA_Walk (13,51,08,01,"OW_PATH_1_3"); 
};
Func Void Rtn_Alarm_819 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_RANGED2"); 
	 
};


FUNC VOID Rtn_Challenge_819 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_819 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_4"); 
};