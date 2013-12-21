//---------------------------------------------------------------------
//	Schwert für den Untoten Ork-Hohepriester (unidentifiziert)
//---------------------------------------------------------------------
INSTANCE Mythrilklinge (C_Item) 
{	
	name 				=	"Przedziwny miecz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	10;
	damagetype			=	DAM_EDGE;
	range    			=  	160;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Przepiêkny miecz.";
	TEXT[1]				=	"Ostrze zdobi¹ prastare runy.";
	TEXT[2]				=	"Mo¿e Xardasowi uda siê je odczytaæ!";
	TEXT[3]				=	"Póki co,lepiej go nie u¿ywaæ.";
	TEXT[4]				=	"";
};

//---------------------------------------------------------------------
//	Schwert für den Untoten Ork-Hohepriester (identifiziert)
//---------------------------------------------------------------------
instance Mythrilklinge01 (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	180;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_01.3DS";

	description			= 	name;
	TEXT[0]				=	"Xardas twierdzi,¿e miecz nazywa siê URIZIEL.";
	TEXT[1]				=	"Jest ponoæ bardzo stary i dysponowa³ niegdyœ";
	TEXT[2]				=	"potê¿n¹ moc¹ magiczn¹,ale j¹ utraci³.";

	TEXT[3]				=	NAME_Damage;				COUNT[3] =	damageTotal;
	TEXT[4] 			=	NAME_Str_needed;			COUNT[4] =	cond_value[2];
	TEXT[5]				=	NAME_Value;					COUNT[5] =	value;
};

//---------------------------------------------------------------------
//	Schwert für den Untoten Ork-Hohepriester (aufgeladen)
//---------------------------------------------------------------------
instance Mythrilklinge02 (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	5000;

//	damageType				=	DAM_EDGE|DAM_FIRE|DAM_MAGIC;//Templer sollten sofort tot sein
	damageType				=	DAM_FIRE|DAM_MAGIC;
//	damageType				=	DAM_MAGIC;
//	damage[DAM_INDEX_EDGE]	=	  1;						//Templer sollten sofort tot sein
	damage[DAM_INDEX_FIRE]	=	 30;
	damage[DAM_INDEX_MAGIC]	=	120;
	//damage[DAM_INDEX_MAGIC]	=	150;

	range    			=  	180;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_02.3DS";
	description			= 	name;
	TEXT[0]				=	"To staro¿ytny miecz Uriziel.";
	TEXT[1]				= 	"Uriziel zosta³ magicznie na³adowany.";
	TEXT[2]				=	NAME_Dam_Magic;			COUNT[2]	=	damage[DAM_INDEX_MAGIC];
	TEXT[3]				=	NAME_Dam_Fire;			COUNT[3]	=	damage[DAM_INDEX_FIRE];
	TEXT[4] 			=	NAME_Str_needed;		COUNT[4]	=	cond_value[2];
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
};

//---------------------------------------------------------------------
//	URIZIEL,mit entferntem Stein
//---------------------------------------------------------------------
instance Mythrilklinge03 (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	180;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_01.3DS";

	description			= 	name;
	TEXT[0]				=	"Magiczny kryszta³ zosta³ usuniêty z miecza.";
	TEXT[1]				=	"Jest to wci¹¿ bardzo potê¿na broñ,choæ";
	TEXT[2]				=	"pozbawiona mocy magicznych.";
	TEXT[3]				=	NAME_Damage;				COUNT[3] =	damageTotal;
	TEXT[4] 			=	NAME_Str_needed;			COUNT[4] =	cond_value[2];
	TEXT[5]				=	NAME_Value;					COUNT[5] =	value;
};

PROTOTYPE Nameless_Hero(C_NPC)
{
	//-------- primary data --------
	name 			= "Bezimienny";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_RBL; 
	level			= 99;
	voice			= 0;
	id				= 5000;
	flags			= NPC_FLAG_FRIEND|NPC_FLAG_IMMORTAL;
	//------------------------------
	exp				= 666;
	exp_next		= 666;
	lp				= 0;
	//------------------------------
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- abilities --------
	attribute	[ATR_STRENGTH] 	=		200;
	attribute	[ATR_DEXTERITY] =		200;
	attribute	[ATR_MANA_MAX] 	=		50;
	attribute	[ATR_MANA] 		=		50;
	
	protection	[PROT_EDGE]		=		0;
	protection	[PROT_BLUNT]	=		0;
	protection	[PROT_POINT]	=		0;
	protection	[PROT_FIRE]		=		0;
	protection	[PROT_MAGIC]	=		0;	

	attribute	[ATR_HITPOINTS_MAX] 	=	3000;
	attribute	[ATR_HITPOINTS] 		=	3000;

	// Hier noch die Spells anmelden ,für ausgrauen (CreateSpell)

	GuardPerception();
	//-------- senses --------
	senses			=	SENSE_HEAR | SENSE_SEE ;
	senses_range	=	2000;		//SN: am 30.11.00 von 15m auf 20m erhöht (WICHTIG für Profilings!)
	
	Npc_SetTalentValue	(self,NPC_TALENT_1H,1);
	Npc_SetTalentValue	(self,NPC_TALENT_2H,1);
	Npc_SetTalentValue	(self,NPC_TALENT_BOW,1);
	Npc_SetTalentValue	(self,NPC_TALENT_CROSSBOW,1);
	Npc_SetTalentValue	(self,NPC_TALENT_PICKLOCK,100);
	Npc_SetTalentValue	(self,NPC_TALENT_PICKPOCKET,100);
	Npc_SetTalentValue	(self,NPC_TALENT_EVASION,0);
	Npc_SetTalentValue	(self,NPC_TALENT_REGEN_MP,0);
	Npc_SetTalentValue	(self,NPC_TALENT_REGEN_HP,0);
	Npc_SetTalentValue	(self,NPC_TALENT_SMITH,0);	
	Npc_SetTalentValue	(self,NPC_TALENT_ALCHEMY,0);	
	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};

FUNC VOID Rtn_invisible_5000 ()
{
	TA_Stay(01,01,01,00,"INVISIBLE");
};

// ***************************************************************************
// PlayerInstanz LEVEL 7 (Anfang Kapitel 2) 
// ***************************************************************************
INSTANCE Nameless_FirstMeet(Nameless_Hero)//Warta - pojawienie siê trolla
{
	attribute[ATR_STRENGTH] 	=	200;     
	
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);
	Npc_SetTalentValue	(self,NPC_TALENT_2H,100);	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,CRW_ARMOR_H);
	
	//-------- inventory --------
	CreateInvItem		(self,ItMw_2H_Sword_03);
	CreateInvItems  (self,ItAmArrow,100);
	CreateInvItems  (self,ItMiNugget,50);
	CreateInvItems  (self,ItKeLockpick,30);
	CreateInvItems  (self,ItLsTorch,20);
	CreateInvItems	(self,ItFo_Potion_Health_03,20);
	CreateInvItems	(self,ItFo_Potion_Mana_03,20);
};

INSTANCE Nameless_SecondMeet(Nameless_Hero)//Informator & hero,caught in trap
{
	attribute[ATR_STRENGTH] 	=	230;     
	attribute[ATR_MANA_MAX] 	= 1100;
	attribute[ATR_MANA] 		= 1100;
	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,DMB_ARMOR_M);
	
	//-------- talents --------
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);

	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);

	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,1);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_2H_Sword_Heavy_04);
	EquipItem		(self,ItRw_Bow_War_04);
	CreateInvItems  (self,ItAmArrow,100);
	CreateInvItems  (self,ItMiNugget,400);
	CreateInvItems  (self,ItKeLockpick,50);
	CreateInvItems  (self,ItLsTorch,20);
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (6));
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
			
	//-------- Spells --------        
	
	CreateInvItem 		(self,ItArRuneBreathOfDeath);
	CreateInvItem 		(self,ItArRuneThunderball);	
	//------------- ai -------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4120;
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	fight_tactic	=	FAI_HUMAN_MAGE;	
	daily_routine = Rtn_wait_5000;
};

FUNC VOID Rtn_wait_5000 ()
{
	TA_StayNeutral(01,01,01,00,"OW_PATH_1_16_10");
};

FUNC VOID Rtn_follow_5000 ()
{
	TA_FollowPC(01,01,01,00,"XXX");
};

FUNC VOID Rtn_dead_5000 ()
{
	TA_StayNeutral(01,01,01,00,"INVISIBLE2");
};

FUNC VOID Rtn_dead2_5000 ()
{
	TA_StayNeutral(01,01,01,00,"INVISIBLE");
};

INSTANCE Nameless_ThirdMeet(Nameless_Hero)//In Rebel Camp,when RC prepares to defend camp from OC
{
	attribute[ATR_STRENGTH] 	=	200;     
	attribute[ATR_DEXTERITY] 	=	170;     

	//-------- talents --------
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);

	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);

	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,1);
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,DMB_ARMOR_M);	
	//-------- inventory --------
	EquipItem		(self,ItMw_1H_Sword_Bastard_04);
	EquipItem		(self,ItRw_Crossbow_04);
	CreateInvItems  (self,ItAmPoisonBolt,100);
	CreateInvItems  (self,ItMiNugget,400);
	CreateInvItems  (self,ItKeLockpick,50);
	CreateInvItems  (self,ItLsTorch,20);
	//------------- ai -------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_INOR_4120;
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_INOR_4120 ()
{
	TA_NamelessHangAround	(00,01,00,00,"PATH_OC_NC_6_1");
};

FUNC VOID Rtn_followGYD_5000 ()
{
	Ta_GuidePC (0,00,12,00,"OW_PATH_198_ORCGRAVEYARD8"); 
   Ta_GuidePC (12,00,0,00,"OW_PATH_198_ORCGRAVEYARD8");
};

INSTANCE Nameless_ThirdMeetGYD(Nameless_Hero)//In Rebel Camp,when RC prepares to defend camp from OC
{
	attribute[ATR_STRENGTH] 	=	200;     
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	id = 4121;
	//-------- talents --------
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
					Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);

	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);

	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,1);
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,DMB_ARMOR_M);	
	//-------- inventory --------
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));	
	CreateInvItem 		(self,ItArRuneBreathOfDeath);
	CreateInvItem 		(self,ItArRuneThunderball);		
	CreateInvItem 		(self,ItArRuneHolyfire);
	CreateInvItem 		(self,ItArRuneCurse);
	CreateInvItem 		(self,ItArRuneCurse);
	
	EquipItem		(self,ItMw_1H_Sword_Bastard_04);
	EquipItem		(self,ItRw_Crossbow_04);
	CreateInvItems  (self,ItAmBolt,100);
	CreateInvItems  (self,ItMiNugget,400);
	CreateInvItems  (self,ItKeLockpick,50);
	CreateInvItems  (self,ItLsTorch,20);
	CreateInvItem	(self,ItArRuneLight);
	//------------- ai -------------
	/*B_InitNPCAddins(self);*/		
	daily_routine = RTN_FOLLOWGYDIN_4121;
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	senses_range	=	3000;		//
	fight_tactic	= FAI_HUMAN_MULTI;
};

FUNC VOID RTN_FOLLOWGYDIN_4121 ()
{
	TA_FollowPC			(01,01,01,00,"GRYD_002");
};

FUNC VOID Rtn_INVISIBLEGRYD_4121 ()
{	
	TA_Stand(23,00,08,00,"GRYD_073");	
	TA_Stand(23,00,08,00,"GRYD_073");
};

INSTANCE Nameless_FourthMeet(Nameless_Hero)
{
	attribute[ATR_STRENGTH] 	=	130;     

	//-------- talents --------
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
					Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);

	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);

	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,1);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_1H_Sword_Bastard_04);
	EquipItem		(self,ItRw_Crossbow_04);
	CreateInvItems  (self,ItAmBolt,100);
	CreateInvItems  (self,ItMiNugget,400);
	CreateInvItems  (self,ItKeLockpick,50);
	CreateInvItems  (self,ItLsTorch,20);
	//------------- ai -------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4120;
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_4120 ()
{
	TA_STAND			(06,00,08,00,"WP");	
	TA_STAND			(08,00,06,00,"WP");	
};

// ***************************************************************************
INSTANCE Nameless_Temple(Nameless_Hero)
{
	//-------- primary data --------
	name 			= "Bezimienny";
	Npctype			= Npctype_Main;
	guild			= GIL_NONE; //
	level			= 77;
	voice			= 15;
	id				= 4121;

		//------------------------------

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	380;     
	attribute[ATR_DEXTERITY] 	=	220;     
	attribute[ATR_MANA_MAX] 	=	250;
	attribute[ATR_MANA] 		=	250;
	attribute[ATR_HITPOINTS_MAX]=	3580;    
	attribute[ATR_HITPOINTS] 	=	3580;    
	
//---- talents --------
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,2);
	
   Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0, ORE_ARMOR_H);	
	//-------- inventory --------
	EquipItem		(self,Mythrilklinge02);
	EquipItem		(self,ItRw_Crossbow_04);
	CreateInvItems  (self,ItAmBolt,500);
	CreateInvItems  (self,ItMiNugget,5400);
	CreateInvItems  (self,ItKeLockpick,50);
	CreateInvItems  (self,ItLsTorch,20);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4121;
};

FUNC VOID Rtn_Start_4121 ()
{
	TA_Stand 	 (23,00,08,00,"TPL_012");
	TA_Stand 	 (23,00,08,00,"TPL_012");
};

FUNC VOID Rtn_INVISIBLE_4121 ()
{	
	TA_Stand(23,00,08,00,"TPL_058");	
	TA_Stand(23,00,08,00,"TPL_058");
};