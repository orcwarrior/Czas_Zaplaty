prototype Nekromanta(C_Npc)
{
   //-------- primary data --------
	
	name 		=	"Nekromanta";
	npctype		=	NPCTYPE_FRIEND;
	guild 		=	GIL_SLV;      
	level 		=	50;
	voice 		=	14;
	id 			=	1700;
	flags       =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 55;
	attribute[ATR_DEXTERITY] 	= 65;
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	attribute[ATR_HITPOINTS_MAX]= 1400;
	attribute[ATR_HITPOINTS] 	= 1400;
    PROTECTION[PROT_EDGE]	=100;
	PROTECTION[PROT_BLUNT]	=100;
	PROTECTION[PROT_POINT]	=100;
	PROTECTION[PROT_MAGIC]	=100;
	protection[PROT_FIRE]		= 9999;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",97,1,DMB_ARMOR_M);

	B_Scale(self);
	Mdl_SetModelFatness(self,0);
    	
   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- talents --------                                    
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  6);
	Npc_SetTalentSkill(self,HACK_NPC_TALENT_MAGE,6);			

	CreateInvItem		(self,itarrunebreathofdeath);
	
	//-------- inventory --------                                    
	//CreateInvItems		(self,ItFo_Potion_Health_03,3);
	//CreateInvItems		(self,ItFo_Potion_Mana_03,3);
	
	//CreateInvItem 			(self,Amulett_der_Erleuchtung);
	//CreateInvItem 			(self,Ring_der_Magie);
	//CreateInvItem 			(self,Ring_der_Erleuchtung);

	//------------- ai -------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_1700;
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

	SENSES_RANGE	=2000;	//SN: am 30.11.00 von 15m auf 20m erhöht (WICHTIG für Profilings!)

	NPC_SETTALENTVALUE(SELF,NPC_TALENT_1H,0);
	NPC_SETTALENTVALUE(SELF,NPC_TALENT_2H,0);
	NPC_SETTALENTVALUE(SELF,NPC_TALENT_BOW,0);
	NPC_SETTALENTVALUE(SELF,NPC_TALENT_CROSSBOW,0);
	NPC_SETTALENTVALUE(SELF,NPC_TALENT_PICKLOCK,100);
	NPC_SETTALENTVALUE(SELF,NPC_TALENT_PICKPOCKET,100);
	NPC_SETTALENTVALUE(SELF,NPC_TALENT_EVASION,0);
	NPC_SETTALENTVALUE(SELF,NPC_TALENT_REGEN_MP,0);
	NPC_SETTALENTVALUE(SELF,NPC_TALENT_REGEN_HP,0);
	NPC_SETTALENTVALUE(SELF,NPC_TALENT_SMITH,0);
	NPC_SETTALENTVALUE(SELF,NPC_TALENT_ALCHEMY,0);

 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,999);
};

instance DMB_1700_Necro (Nekromanta)
{
};
FUNC VOID Rtn_HIDE_1700 ()
{
	TA_Stand(06,00,08,00,"NECRO_START");	
	TA_Stand(08,00,06,00,"NECRO_START");	
};
FUNC VOID Rtn_start_1700 ()
{
	TA_Stand(06,00,08,00,"NECRO_LAVA");	
	TA_Stand(08,00,06,00,"NECRO_LAVA");	
};
FUNC VOID Rtn_TESTPASSED_1700 ()
{
	TA_Stand(06,00,08,00,"ESCAPE_DARKMAGE");	
	TA_Stand(08,00,06,00,"ESCAPE_DARKMAGE");	
};

instance DMB_1701_NecroInNecroloc (Nekromanta)
{
   id 			=	1701;
   daily_routine = Rtn_start_1701;
};

instance DMB_1701_NecroInNecroloc_mirror (Nekromanta)
{
   id 			=	1701;
};

FUNC VOID Rtn_start_1701 ()
{
	TA_Stand(06,00,08,00,"NECRO_CENTER");	
	TA_Stand(08,00,06,00,"NECRO_CENTER");	
};

instance DMB_1703_NecroInWorld (Nekromanta)
{
   id 			=	1703;
   daily_routine = Rtn_AfterDeadsBeast_1703;
};

FUNC VOID Rtn_AfterDeadsBeast_1703 ()
{
	TA_Stay (22,00,08,00,"PSI_TEMPLE_IN_1");
   TA_Stay (08,00,22,00,"PSI_TEMPLE_IN_1");
};

FUNC VOID Rtn_RITUAL_1703 ()
{
   TA_Stay (22,00,08,00,"PATH_NEW_AROUND_PSI25");
   TA_Stay (08,00,22,00,"PATH_NEW_AROUND_PSI25");
};

FUNC VOID Rtn_RITUAL1_1703 ()
{
   TA_PracticeMagic (22,00,08,00,"PATH_NEW_AROUND_PSI25");
   TA_PracticeMagic (08,00,22,00,"PATH_NEW_AROUND_PSI25");
};

FUNC VOID Rtn_HIDE_1703 ()
{
	TA_StayNeutral(13,00,01,00,"INVISIBLE");
   TA_StayNeutral(01,00,13,00,"INVISIBLE");
};
