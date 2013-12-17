instance HUN_2615_Abel (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Abel";
	Npctype =						NPCTYPE_MAIN;
	guild =							GIL_HUN;      
	level =							20;
	
	voice =							6;
	id =							2615;

	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12+100;
	attribute[ATR_HITPOINTS] =		self.level*12+100;
	protection	[PROT_BLUNT]		=	25;
	protection	[PROT_EDGE]			=	25;
	protection	[PROT_POINT]		=	5;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",3,2,HUN_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);			
   Npc_SetTalentValue(self,NPC_TALENT_1H,55); 	
   Npc_SetTalentValue(self,NPC_TALENT_BOW,85); 	
	
	//-------- inventory --------
	                                    	
	CreateInvItems(self,ItMiNugget,3);
	CreateInvItems (self,ItFoRice,1);
	CreateInvItems (self,ItFoBeer,1);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItAt_Teeth_01);		
	EquipItem (self,HUN_MW_01);
	EquipItem (self,HUN_RW_01);
	CreateInvItems (self,ItAmArrow,20);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2615;
};

FUNC VOID Rtn_start_2615 ()
{
    TA_BOSS	(07,02,16,15,"HC_WARRIOR16");
    TA_BOSS		(16,16,07,01,"HC_WARRIOR16");

};
// FUNC VOID Rtn_guide2Cavalorn_2615 ()
// {
//     TA_GuidePC		(07,02,16,15,"PATH_OC_NC_3");
//     TA_GuidePC		(16,16,07,01,"PATH_OC_NC_3");

// };
Func Void Rtn_Alarm_2615 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR16"); 
};
Func Void Rtn_Alarm2_2615 ()
{
	 TA_KillingGRDs(08,00,07,59,"OW_PATH_3_01"); 
};

FUNC VOID Rtn_Challenge_2615 ()
{	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_2615 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_4"); 
};
FUNC VOID Rtn_GuideMine_2615()
{	
	TA_FollowCavalorn (18,00,19,00,"OW_OM_ENTRANCE02");
	TA_FollowCavalorn (19,00,18,00,"OW_OM_ENTRANCE02");
};

FUNC VOID Rtn_mourder_2615 ()
{
    TA_BOSS	(07,02,16,15,"ABEL_M");
    TA_BOSS	(16,16,07,01,"ABEL_M");
};
