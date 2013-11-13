instance PIR_2612_JackAlligator (Npc_Default)
{
	//-------- primary data --------
	
	name 			=		"Jack Aligator";
	npctype 		= 		NPCTYPE_FRIEND;
	guild 			=		GIL_PIR;
	level 			=		30;
	voice 			=		13;
	id 				=		2612;
	spawnDelay=NPC_FLAG_BRAVE;	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	85;
	attribute[ATR_DEXTERITY] 		= 	95;
	attribute[ATR_MANA_MAX] 		= 	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX]	= 	400;
	attribute[ATR_HITPOINTS] 		= 	400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,3 ,"Hum_Head_Bald",100,0,PIR_ARMOR_M);

	B_Scale (self);

	//-------- Talente -------

	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);			
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);			
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);			
	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);			
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,2);		
		
	//-------- inventory --------
	CreateInvItem (self,Itmw_Pir_02);
	CreateInvItem (self,ItRw_Bow_Long_03);	
	
	//CreateInvItem (self,ItFoSoup);
	//CreateInvItem (self,ItMiJoint);
	//CreateInvItem (self,ItLsTorch);
	CreateInvItem (self,ItFoSoup);
 
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2612;
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//------------- //MISSION-------------------
};

FUNC VOID Rtn_start_2612 ()
{
	TA_Stand(01,00,05,00,"OW_WATERFALLCAVE_2");
   TA_Stand(05,00,01,00,"OW_WATERFALLCAVE_2");
};

FUNC VOID Rtn_FOLLOW_2612 ()
{
	TA_FollowPC(02,00,14,00,"PATH_OC_NC_3");	
	TA_FollowPC(14,00,02,00,"PATH_OC_NC_3");
};

FUNC VOID Rtn_OR_2612 ()
{
	Ta_SitCampfireEat(08,00,14,00,"SPAWN_TALL_PATH_BANDITOS2_03"); 
	Ta_Boss(14,00,19,00,"SMOE_CIPHER"); 
	TA_Stand(19,00,02,00,"SMOE_CIPHER");
	TA_SitAround(08,00,14,00,"TAVERN_BARX");	
};	

FUNC VOID Rtn_Alarm_2612 ()
{
	TA_KillingGRDs(08,00,07,59,"HC_WARRIOR14"); 
};

Func Void Rtn_Alarm2_2612()
{
	TA_KillingGRDs(08,00,07,59,"OW_PATH_3_01"); 
};

FUNC VOID Rtn_TRAP_2603 () 
{ 
   Ta_Guard (0,00,12,00,"HIDDEOUT13"); 
   Ta_Guard (12,00,0,00,"HIDDEOUT13"); 
};

FUNC VOID Rtn_DEFEND_2603 () 
{ 
   Ta_Guard (0,00,12,00,"OCC_CONVOY_01"); 
   Ta_Guard (12,00,0,00,"OCC_CONVOY_01"); 
};

FUNC VOID Rtn_Follow2_2603 () 
{ 
   Ta_FollowPC (0,00,12,00,"HIDDEOUT1"); 
   Ta_FollowPC (12,00,0,00,"HIDDEOUT1"); 
};