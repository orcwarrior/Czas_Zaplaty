instance ORG_855_Wolf (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Wilk";
	Npctype =				Npctype_Main;
	guild =					GIL_SLV;      
	level =					11;
	
	voice =					9;
	id =					855;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		90;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	272;
	attribute[ATR_HITPOINTS] =		272;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",38,1,ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);	
		
	//-------- inventory --------
	CreateInvItem (self, ItMw_1H_Mace_War_01);	
	EquipItem (self, ItMw_1H_Mace_War_01);	
   CreateInvItems (self, ItAmArrow, 20);
   CreateInvItem (self, ItRw_Bow_War_05);
   

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_855;
};

FUNC VOID Rtn_start_855 ()
{
	TA_SitAround 			(01,00,10,30,"NC_PLACE04");
	TA_RoastScavenger 	(10,30,20,30,"NC_PLACE04");
	TA_SitAround		(20,30,01,00,"NC_PLACE04");
};

FUNC VOID Rtn_DRUNK_855 ()
{

    TA_StandAround(08,00,21,00,"NC_TAVERN_BAR");
    TA_StandAround(21,00,08,00,"NC_TAVERN_BAR");
};

FUNC VOID Rtn_NC1_855 ()
{

    TA_Boss (08,00,21,00,"NC_P01_TO_P02_05");
    TA_Boss (21,00,08,00,"NC_P01_TO_P02_05");
};


FUNC VOID Rtn_NC2_855 ()
{

    TA_Boss (08,00,21,00,"NC_KDW_CAVE_ENTRANCE");
    TA_Boss (21,00,08,00,"NC_KDW_CAVE_ENTRANCE");
};






