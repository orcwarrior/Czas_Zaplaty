instance SLV_907_Lares (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Lares";
	Npctype =				Npctype_Main;
	guild =					GIL_SLV;      
	level =					15;
	
	voice =					11;
	id =					907;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		144;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2 ,"Hum_Head_Pony",87,4,-1);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;		
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);

	//------- Inventory ---------

	CreateInvItems (self,ItFoRice,1);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItFoLoaf);
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_907;
};

FUNC VOID Rtn_start_907 ()
{
	TA_Sleep		(20,10,07,10,"NC_PATH_PEASANT3");
	TA_PickRice		(07,10,20,10,"NC_PATH82");
};

FUNC VOID Rtn_NC1_907 ()
{
	TA_StandAround		(20,10,07,10,"NC_PATH53");
	TA_StandAround		(07,10,20,10,"NC_PATH53");
};


FUNC VOID Rtn_NC2_907 ()
{
   TA_Boss		(21,00,07,00,"NC_RICELORD");
	TA_Boss		(07,00,21,00,"NC_RICELORD");
};

FUNC VOID Rtn_NC3_907 ()
{
   TA_Smalltalk		(21,00,07,00,"OW_PATH_1_5_B");
	TA_Smalltalk		(07,00,21,00,"OW_PATH_1_5_B");
};