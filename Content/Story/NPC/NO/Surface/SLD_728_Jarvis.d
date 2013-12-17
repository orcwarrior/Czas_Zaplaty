instance SLD_728_Jarvis (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Jarvis";
	Npctype =				Npctype_Main;
	guild =					GIL_SLV;       
	level =					16;
	flags =					NPC_FLAG_IMMORTAL;
	
	voice =					8;
	id =					728;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		75;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	232;
	attribute[ATR_HITPOINTS] =		232;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",53,1,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
   fight_tactic	=	FAI_HUMAN_MASTER; 
			
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);

	//-------- inventory --------                                    

	EquipItem (self,ItMw_1H_Sword_06);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,15);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,6);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Mug_01);
		
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_728;
	
	//-------------Misions-------------------
};

FUNC VOID Rtn_oldstart_728 ()
{
	TA_Stand (08,00,20,00,"NC_PATH_JARVIS");
	TA_Stand (20,00,08,00,"NC_PATH_JARVIS");
};

FUNC VOID Rtn_start_728 ()
{
	TA_Stand (08,00,20,00,"WP_CIRCLE_01");
	TA_Stand (20,00,08,00,"WP_CIRCLE_01");
};

FUNC VOID Rtn_HIDE_728 () //OW_PATH_225
{
	TA_Stand (08,00,20,00,"OW_PATH_227_IN2");
	TA_Stand (20,00,08,00,"OW_PATH_227_IN2");
};

FUNC VOID Rtn_GO_728 () //OW_PATH_225
{
	TA_Stand (08,00,20,00,"LOCATION_19_03_PATH_RUIN6");
	TA_Stand (20,00,08,00,"LOCATION_19_03_PATH_RUIN6");
};

FUNC VOID Rtn_GUARD_728 () //OW_PATH_225
{
	TA_Stand (08,00,20,00,"LOCATION_19_03_PATH_RUIN6");
	TA_Stand (20,00,08,00,"LOCATION_19_03_PATH_RUIN6");
};

FUNC VOID Rtn_GUARD1_728 () //OW_PATH_225
{
	TA_Stand (08,00,20,00,"OW_PATH_225");
	TA_Stand (20,00,08,00,"OW_PATH_225");
};

/**************************
FUNC VOID Rtn_check_2600 () 
{ 
Ta_GuidePC (0,00,12,00,"OW_PATH_167"); 
Ta_GuidePC (12,00,0,00,"OW_PATH_167"); 
}; 
FUNC VOID Rtn_WaitTony_2600 () 
{ 
TA_Stay(0,00,12,00,"OW_PATH_166"); 
TA_Stay (12,00,0,00,"OW_PATH_166"); 
}; 


*****************************/
FUNC VOID Rtn_JOIN_728 () 
{ 
   TA_GuidePC (0,00,12,00,"LOCATION_19_03_PATH_RUIN6"); 
   TA_GuidePC (12,00,0,00,"LOCATION_19_03_PATH_RUIN6"); 
}; 


