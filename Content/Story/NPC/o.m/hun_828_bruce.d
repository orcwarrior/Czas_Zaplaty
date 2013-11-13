instance HUN_828_Bruce (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Bruce";
	Npctype =						NPCTYPE_MAIN;
	guild =							GIL_HUN;      
	level =							20;
	
	voice =							6;
	id =							828;

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12;
	attribute[ATR_HITPOINTS] =		self.level*12;
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	5;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",35,2,HUN_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_RANGED;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);			
   Npc_SetTalentValue(self,NPC_TALENT_1H,55); 	
   Npc_SetTalentValue(self,NPC_TALENT_BOW,85); 	
	
	//-------- inventory --------
	                                    
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,4);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItAt_Teeth_01);		
	EquipItem (self,HUN_MW_03);
	EquipItem (self,HUN_RW_02);
	CreateInvItems (self,ItAmArrow,20);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_828;
};

FUNC VOID Rtn_start_828 ()
{
   TA_SitCampfireSmalltalk	(07,02,10,15,"HC_CAMPFIRE_NO1");//Butch
   TA_SitCampfireEat		(10,15,12,40,"HC_CAMPFIRE_NO1");
   TA_Smith_Sharp			(12,40,14,00,"HC_NO_SHARP");
   TA_PracticeSword		(14,00,16,20,"HelpPoint6");
   TA_SitCampfireG	(22,00,03,00,"HC_CAMPFIRE_NO1");     
   TA_SitCampfireSmalltalk	(18,20,22,00,"HC_CAMPFIRE_NO2");//Gorn
   TA_SitCampfireG	(22,00,03,00,"SIT_FOX");    
   TA_SitCampfireR	(03,00,07,02,"HC_CAMPFIRE_NO2");
};

Func Void Rtn_Alarm_828 ()
{
	TA_KillingGRDs(08,00,07,59,"HC_RANGED5"); 
};

FUNC VOID Rtn_Challenge_828 ()
{	
   TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
   TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};

Func Void Rtn_Fan_828 ()
{
	TA_ChallengeFans(08,00,07,59,"OM_FAN_4"); 
};