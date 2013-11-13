instance HUN_2609_Gestath (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Gestath";
	Npctype =				Npctype_Main;
	guild =					GIL_HUN;      
	level =					20;
	
	voice =					13;
	id =					2609;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		95;
	attribute[ATR_DEXTERITY] =		85;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12 + 100;
	attribute[ATR_HITPOINTS] =		self.level*12 + 100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Psionic",4,3,CRW_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_RANGED;
	
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);		
			
	//-------- inventory --------
	

	EquipItem (self,HUN_MW_04);
	EquipItem	(self,HUN_RW_02);
	CreateInvItems	(self,ItAmArrow,30);
	CreateInvItems	(self,ItAmFireArrow,10);
	
	CreateInvItem	(self,ItFoMutton);
	CreateInvItems	(self,ItMiNugget,12);
	CreateInvItems	(self,ItFo_Potion_Health_01,9);
	CreateInvItems	(self,ItLsTorch,1);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2609;
};
FUNC VOID Rtn_start_2609 ()
{
	TA_Gestath_SuspectHero			(02,00,14,00,"OW_GESTATH");	
	TA_Gestath_SuspectHero			(14,00,02,00,"OW_GESTATH");
};
FUNC VOID Rtn_WAITFORHARPIES_2609 ()
{
	TA_Gestath_Wait4Harpies			(02,00,14,00,"PATH_TO_PLATEAU03");	
	TA_Gestath_Wait4Harpies			(14,00,02,00,"PATH_TO_PLATEAU03");
};

FUNC VOID Rtn_FOLLOW_2609 ()
{
	TA_FollowPC		(02,00,14,00,"PATH_OC_NC_3");	
	TA_FollowPC		(14,00,02,00,"PATH_OC_NC_3");
};

FUNC VOID Rtn_OR_2609 ()
{
	TA_Boss				(14,01,21,20,"WATCHTOWER3_TOP2");//	
	TA_Smalltalk		(21,21,00,30,"PATH_OR1");//gestath with cavalorn     
	TA_Boss				(00,31,02,00,"WATCHTOWER3_TOP2");//	
		
	TA_Stand			(02,01,06,15,"WATCHTOWER3_TOP2");//	
	TA_Smalltalk		(06,16,10,15,"PATH_OR1");//gestath with cavalorn     
	TA_Stand			(10,16,14,00,"WATCHTOWER3_TOP2");//	
		
};

Func Void Rtn_Alarm_2609 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR2"); 
	 
};
Func Void Rtn_Alarm2_2609 ()
{
	 TA_KillingGRDs(08,00,07,59,"OW_PATH_3_01"); 
	 
};

FUNC VOID Rtn_Challenge_2609 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_2609 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_4"); 
};
