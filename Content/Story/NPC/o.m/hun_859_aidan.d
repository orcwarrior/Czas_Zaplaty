instance HUN_859_Aidan (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Aidan";
	Npctype =				Npctype_Main;
	guild =					GIL_HUN;      
	level =					24;
	
	voice =					13;
	id =					859;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		115;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",9,1,HUN_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	

	EquipItem (self,RBL_MW_02);
	EquipItem	(self,HUN_RW_03);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItFoMutton);
	CreateInvItems	(self,ItMiNugget,20);
	CreateInvItems	(self,ItFo_Potion_Health_01,29);
	CreateInvItems	(self,ItLsTorch,11);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_859;
};

FUNC VOID Rtn_start_859 ()
{
	TA_Sleep	(22,30,07,55,"HC_AIDANHUT_INSIDE");
    TA_washSelf	(07,55,08,20,"SPAWN_OW_BLOODFLY_12");
	TA_SitCampfireEat		(08,20,09,00,"SPAWN_TALL_PATH_BANDITOS_02_04");

	TA_Smith_Fire	(09,00,09,10,"OM_SMITH_01");
	TA_Smith_Anvil	(09,10,09,20,"OM_SMITH_02");
	TA_Smith_Fire	(09,20,09,30,"OM_SMITH_01");
	TA_Smith_Anvil	(09,30,09,40,"OM_SMITH_02");
	TA_Smith_Cool	(09,40,09,50,"OM_SMITH_01");
	TA_Smith_Anvil	(09,50,10,00,"OM_SMITH_02");

	TA_Smith_Fire	(10,00,10,10,"OM_SMITH_01");
	TA_Smith_Anvil	(10,10,10,20,"OM_SMITH_02");
	TA_Smith_Fire	(10,20,10,30,"OM_SMITH_01");
	TA_Smith_Anvil	(10,30,10,40,"OM_SMITH_02");
	TA_Smith_Cool	(10,40,10,50,"OM_SMITH_01");
	TA_Smith_Anvil	(10,50,11,00,"OM_SMITH_02");    
          
	TA_Smith_Fire	(11,00,11,10,"OM_SMITH_01");
	TA_Smith_Anvil	(11,10,11,20,"OM_SMITH_02");
	TA_Smith_Fire	(11,20,11,30,"OM_SMITH_01");
	TA_Smith_Anvil	(11,30,11,40,"OM_SMITH_02");
	TA_Smith_Cool	(11,40,11,50,"OM_SMITH_01");
	TA_Smith_Anvil	(11,50,12,00,"OM_SMITH_02");


	TA_Smith_Anvil	(12,00,12,10,"OM_SMITH_02");
	TA_Smith_Cool	(12,10,12,20,"OM_SMITH_01");
	TA_Smith_Fire	(12,20,12,30,"OM_SMITH_01");
	TA_Smith_Anvil	(12,30,12,40,"OM_SMITH_02");
	TA_Smith_Cool	(12,40,12,50,"OM_SMITH_01");
	TA_Smith_Anvil	(12,50,13,00,"OM_SMITH_02");
          
	TA_Smith_Fire	(13,00,13,10,"OM_SMITH_01");
	TA_Smith_Anvil	(13,10,13,20,"OM_SMITH_02");
	TA_Smith_Fire	(13,20,13,30,"OM_SMITH_01");
	TA_Smith_Anvil	(13,30,13,40,"OM_SMITH_02");
	TA_Smith_Cool	(13,40,13,50,"OM_SMITH_01");
	TA_Smith_Anvil	(13,50,14,00,"OM_SMITH_02");
       
    TA_Stand        (14,00,15,00,"HC_AIDANHUT_OUTSIDE");

	TA_Smith_Fire	(15,00,15,10,"OM_SMITH_01");
	TA_Smith_Anvil	(15,40,15,50,"OM_SMITH_02");
	TA_Smith_Fire	(15,50,16,00,"OM_SMITH_01");
	TA_Smith_Anvil	(16,00,16,10,"OM_SMITH_02");


	TA_Smith_Fire	(15,00,15,10,"OM_SMITH_01");
	TA_Smith_Anvil	(15,10,15,20,"OM_SMITH_02");
	TA_Smith_Fire	(15,20,15,30,"OM_SMITH_01");
	TA_Smith_Anvil	(15,30,15,40,"OM_SMITH_02");
	TA_Smith_Cool	(15,40,15,50,"OM_SMITH_01");
 	TA_Smith_Anvil	(15,50,16,00,"OM_SMITH_02");

	TA_Smith_Fire	(16,00,16,10,"OM_SMITH_01");
	TA_Smith_Anvil	(16,10,16,20,"OM_SMITH_02");
	TA_Smith_Fire	(16,20,16,30,"OM_SMITH_01");
	TA_Smith_Anvil	(16,30,16,40,"OM_SMITH_02");
	TA_Smith_Cool	(16,40,16,50,"OM_SMITH_01");
	TA_Smith_Anvil	(16,50,17,00,"OM_SMITH_02");
	TA_Smalltalk	(17,00,18,00,"PATH_OR1");//with cavalorn 
	TA_Smith_Fire	(18,00,18,10,"OM_SMITH_01");
	TA_Smith_Anvil	(18,10,18,20,"OM_SMITH_02");
	TA_Smith_Fire	(18,20,18,30,"OM_SMITH_01");
	TA_Smith_Anvil	(18,30,18,40,"OM_SMITH_02");
	TA_Smith_Cool	(18,40,18,50,"OM_SMITH_01");
	TA_Smith_Anvil	(18,50,19,00,"OM_SMITH_02");
	TA_Smith_Fire	(19,00,19,10,"OM_SMITH_01");
	TA_Smith_Anvil	(19,10,19,20,"OM_SMITH_02");
	TA_Smith_Fire	(19,20,19,30,"OM_SMITH_01");
	TA_Smith_Anvil	(19,30,19,40,"OM_SMITH_02");
	TA_Smith_Cool	(19,40,19,50,"OM_SMITH_01");
	TA_Smith_Anvil	(19,50,20,00,"OM_SMITH_02");
	TA_Smith_Fire	(20,00,20,10,"OM_SMITH_01");
	TA_Smith_Anvil	(20,10,20,20,"OM_SMITH_02");
	TA_Smith_Fire	(20,20,20,30,"OM_SMITH_01");
	TA_Smith_Anvil	(20,30,20,40,"OM_SMITH_02");
	TA_Smith_Cool	(20,40,20,50,"OM_SMITH_01");
	TA_Smith_Anvil	(20,50,21,00,"OM_SMITH_02");
    TA_Stand        (21,00,21,30,"HC_AIDANHUT_OUTSIDE");
	TA_Smith_Fire	(21,30,21,40,"OM_SMITH_01");
	TA_Smith_Cool	(21,40,21,50,"OM_SMITH_01");
	TA_Smith_Anvil	(21,50,22,00,"OM_SMITH_02");
	TA_Smalltalk		(22,00,22,30,"FISKSMALLTALK");//Aidan	
};
FUNC VOID Rtn_CarlsonArrived_859 ()
{
	TA_Sleep	(22,30,07,55,"HC_AIDANHUT_INSIDE");
    TA_washSelf	(07,55,09,00,"SPAWN_OW_BLOODFLY_12");

	TA_Smith_Anvil	(09,00,09,10,"OM_SMITH_01");
	TA_Smith_Fire	(09,10,09,20,"OM_SMITH_02");
	TA_Smith_Cool	(09,20,09,30,"OM_SMITH_01");
	TA_Smith_Fire	(09,30,09,40,"OM_SMITH_02");
	TA_Smith_Anvil	(09,40,09,50,"OM_SMITH_01");
	TA_Smith_Cool	(09,50,10,00,"OM_SMITH_02");

	TA_Smith_Anvil	(10,00,10,10,"OM_SMITH_01");
	TA_Smith_Fire	 (10,10,10,20,"OM_SMITH_02");
	TA_Smith_Cool	 (10,20,10,30,"OM_SMITH_01");
	TA_Smith_Fire	 (10,30,10,40,"OM_SMITH_02");
	TA_Smith_Anvil	(10,40,10,50,"OM_SMITH_01");
	TA_Smith_Cool	 (10,50,11,00,"OM_SMITH_02");    
          
	TA_Smith_Anvil	(11,00,11,10,"OM_SMITH_01");
	TA_Smith_Fire	 (11,10,11,20,"OM_SMITH_02");
	TA_Smith_Cool	 (11,20,11,30,"OM_SMITH_01");
	TA_Smith_Fire	 (11,30,11,40,"OM_SMITH_02");
	TA_Smith_Anvil	(11,40,11,50,"OM_SMITH_01");
	TA_Smith_Cool	 (11,50,12,00,"OM_SMITH_02");


	TA_Smith_Anvil		(12,00,12,10,"OM_SMITH_02");
	TA_Smith_Fire	 	(12,10,12,20,"OM_SMITH_01");
	TA_Smith_Cool	 	(12,20,12,30,"OM_SMITH_01");
	TA_Smith_Fire	 	(12,30,12,40,"OM_SMITH_02");
	TA_Smith_Anvil		(12,40,12,50,"OM_SMITH_01");
	TA_Smith_Cool	 	(12,50,13,00,"OM_SMITH_02");
          
	TA_Smith_Anvil	(13,00,13,10,"OM_SMITH_01");
	TA_Smith_Fire	 (13,10,13,20,"OM_SMITH_02");
	TA_Smith_Cool	 (13,20,13,30,"OM_SMITH_01");
	TA_Smith_Fire	 (13,30,13,40,"OM_SMITH_02");
	TA_Smith_Anvil	(13,40,13,50,"OM_SMITH_01");
	TA_Smith_Cool	 (13,50,14,00,"OM_SMITH_02");
           
	TA_Smith_Anvil		(14,00,13,10,"OM_SMITH_01");
	TA_Smith_Fire	 	(14,10,13,20,"OM_SMITH_02");
	TA_Smith_Cool	 	(14,20,13,30,"OM_SMITH_01");
	TA_Smith_Fire	 	(14,30,13,40,"OM_SMITH_02");
	TA_Smith_Anvil		(14,40,13,50,"OM_SMITH_01");
	TA_Smith_Cool	 	(14,50,15,00,"OM_SMITH_02");      

	TA_Smith_Anvil	(15,00,15,10,"OM_SMITH_01");
	TA_Smith_Fire	 (15,10,15,20,"OM_SMITH_02");
	TA_Smith_Cool	 (15,20,15,30,"OM_SMITH_01");
	TA_Smith_Fire	 (15,30,15,40,"OM_SMITH_02");
	TA_Smith_Anvil	(15,40,15,50,"OM_SMITH_01");
 	TA_Smith_Cool	 (15,50,16,00,"OM_SMITH_02");

	TA_Smith_Anvil	(16,00,16,10,"OM_SMITH_01");
	TA_Smith_Fire	 (16,10,16,20,"OM_SMITH_02");
	TA_Smith_Cool	 (16,20,16,30,"OM_SMITH_01");
	TA_Smith_Fire	 (16,30,16,40,"OM_SMITH_02");
	TA_Smith_Anvil	(16,40,16,50,"OM_SMITH_01");
	TA_Smith_Cool	 (16,50,17,00,"OM_SMITH_02");
	TA_STAND		(17,00,18,00,"OM_SMITH_01");//with cavalorn 
	TA_Smith_Anvil	(18,00,18,10,"OM_SMITH_01");
	TA_Smith_Fire	 (18,10,18,20,"OM_SMITH_02");
	TA_Smith_Cool	 (18,20,18,30,"OM_SMITH_01");
	TA_Smith_Fire	 (18,30,18,40,"OM_SMITH_02");
	TA_Smith_Anvil	(18,40,18,50,"OM_SMITH_01");
	TA_Smith_Cool	 (18,50,19,00,"OM_SMITH_02");
	TA_Smith_Anvil	(19,00,19,10,"OM_SMITH_01");
	TA_Smith_Fire	 (19,10,19,20,"OM_SMITH_02");
	TA_Smith_Cool	 (19,20,19,30,"OM_SMITH_01");
	TA_Smith_Fire	 (19,30,19,40,"OM_SMITH_02");
	TA_Smith_Anvil	(19,40,19,50,"OM_SMITH_01");
	TA_Smith_Cool	 (19,50,20,00,"OM_SMITH_02");
	TA_Smith_Anvil	(20,00,20,10,"OM_SMITH_01");
	TA_Smith_Fire	 (20,10,20,20,"OM_SMITH_02");
	TA_Smith_Cool	 (20,20,20,30,"OM_SMITH_01");
	TA_Smith_Fire	 (20,30,20,40,"OM_SMITH_02");
	TA_Smith_Anvil	(20,40,20,50,"OM_SMITH_01");
	TA_Smith_Cool	 (20,50,21,00,"OM_SMITH_02");
    TA_Stand        (21,00,21,30,"GARRY_SIT");
	TA_Smith_Sharp	(21,30,21,40,"OM_SMITH_01");
	TA_Smith_Anvil	(21,40,21,50,"OM_SMITH_01");
	TA_Smith_Fire	(21,50,22,00,"OM_SMITH_02");
	TA_Smalltalk		(22,00,22,30,"FISKSMALLTALK");//Aidan	

};
Func Void Rtn_Alarm_859 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR2"); 
	 
};

FUNC VOID Rtn_Challenge_859 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_859 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_4"); 
};

FUNC VOID Rtn_mourder_859 ()
{
Ta_Stand (0,00,12,00,"AIDAN_M"); 
Ta_Stand (12,00,0,00,"AIDAN_M"); 
};