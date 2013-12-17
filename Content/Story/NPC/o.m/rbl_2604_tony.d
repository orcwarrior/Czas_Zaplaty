instance RBL_2604_Tony (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Tony";
	Npctype =				Npctype_Main;
	guild =					GIL_RBL;      
	level =					17;
	
	voice =					8;
	id =					2604;
	flags =					NPC_FLAG_IMMORTAL|NPC_FLAG_FRIEND;
	
	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		40;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12-50;
	attribute[ATR_HITPOINTS] =		self.level*12;
	protection	[PROT_BLUNT]		=	20;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Bald",43 ,2,RBL_ARMOR_M);
		//Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Psionic",24 ,2,GRD_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	
	//-------- inventory --------   
	EquipItem 	(self,RBL_MW_02);
	EquipItem (self,RBL_RW_02);	                                 
	CreateInvItems (self,ItKeLockpick,2);		
	CreateInvItems(self,ItMiNugget,13);
	CreateInvItems (self,ItFoRice,2);
	CreateInvItems (self,ItFo_Potion_Health_02,3);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItAt_Teeth_01);
	CreateInvItem (self,ItFoBooze);
//	CreateInvItems (self,ItAmArrow,20);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2604;
};
FUNC VOID Rtn_start_2604 ()
{
   Ta_Stand (0,00,12,00,"OW_HUN_SMALLCAMP"); 
   Ta_Stand (12,00,0,00,"OW_HUN_SMALLCAMP"); 
};

FUNC VOID Rtn_TalkToHero_2604 ()
{
   TA_LookForPlayer	 (0,00,12,00,"OW_PATH_166"); 
   TA_LookForPlayer (12,00,0,00,"OW_PATH_166"); 
};
		
FUNC VOID Rtn_GuideOR_2604 ()
{
   Ta_GuidePC (0,00,12,00,"OW_PATH_OC_NC4"); 
   Ta_GuidePC (12,00,0,00,"OW_PATH_OC_NC4"); 
};

FUNC VOID Rtn_OR_2604 ()
{
   Ta_Stand (0,00,12,00,"OM_WATCHTOWER01_TOP_1"); 
   Ta_Stand (12,00,0,00,"OM_WATCHTOWER01_TOP_1"); 
};

Func Void Rtn_REST_2604 ()
{
   TA_Sleep(01,00,07,59,"OM_WATCHTOWER01_ON2_1"); 
	TA_Sleep(08,00,00,59,"OM_WATCHTOWER01_ON2_1"); 	 
};

FUNC VOID Rtn_GuideSentry_2604 ()
{
   Ta_Stand (02,50,19,45,"OM_WATCHTOWER01_TOP_1"); 
   Ta_Stand (19,45,02,50,"WITAMYWHC"); 
};

Func Void Rtn_Alarm_2604 ()
{
   TA_KillingGRDs(08,00,07,59,"HC_RANGED1");  
};

FUNC VOID Rtn_Challenge_2604 ()
{		
   TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};

Func Void Rtn_Fan_2604 ()
{
   TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};

FUNC VOID Rtn_meeting_2604 ()
{
   Ta_Stand (04,00,22,00,"TONY_M"); 
   Ta_Stand (22,00,04,00,"TONY_M"); 
};

FUNC VOID Rtn_mourder_2604 ()
{
   Ta_Stand (04,00,22,00,"OM_WATCHTOWER01_TOP_1"); 
   Ta_Stand (22,00,04,00,"TONY_M"); 
};