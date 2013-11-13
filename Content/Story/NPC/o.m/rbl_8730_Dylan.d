instance RBL_8730_Dylan (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Dylan";
	Npctype =				Npctype_Main;
	guild =					GIL_RBL;      
	level =					18;
	
	voice =					9;
	id =					8730;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		50;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	336;
	attribute[ATR_HITPOINTS] =		336;
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	5;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,32hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Thief",5,2,RBL_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
Npc_SetTalentValue(self,NPC_TALENT_1H,60); 	
Npc_SetTalentValue(self,NPC_TALENT_BOW,61); 	
	

	//-------- inventory --------   
	
	
	EquipItem (self,HUN_MW_03);
	EquipItem	(self,RBL_RW_02);	                           
	CreateInvItems (self,ItKeLockpick,3);		
	CreateInvItems(self,ItMiNugget,500);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItAt_Claws_01);
	CreateInvItems (self,ItAmArrow,120);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_8730;
};

FUNC VOID Rtn_start_8730 ()
{
    TA_Smoke            (20,00,23,00,"PATH_OC_NC_9");
    TA_SitAround	        (23,00,20,00,"HC_NO_END1");

};
FUNC VOID Rtn_Challenge_8730 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_8730 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_2"); 
};
Func Void Rtn_Alarm_8730 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR1"); 
	 
};












