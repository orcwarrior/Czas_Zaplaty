// Nur für Kap.6 benutzen

instance KDF_406_OTXardas (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Xardas";
	npctype		=	npctype_main;
	guild 		=	GIL_NONE;      
	level 		=	60;
	voice 		=	14;
	id 			=	406;
	flags       =   NPC_FLAG_IMMORTAL;
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 155;
	attribute[ATR_DEXTERITY] 	= 165;
	attribute[ATR_MANA_MAX] 	= 200;
	attribute[ATR_MANA] 		= 200;
	attribute[ATR_HITPOINTS_MAX]= 2400;
	attribute[ATR_HITPOINTS] 	= 2400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",82,1,DMB_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness (self,0);
    	
    Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- Talente --------                                    
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));


	//-------- Spells--------                                    
	CreateInvItems	(self,ItArScrollSummonDemon,20);
	CreateInvItem	(self,ItArRuneFireball);
	
	//-------- inventory --------                                    
	CreateInvItems(self,ItFo_Potion_Health_03,3);
	CreateInvItems(self,ItFo_Potion_Mana_03,3);
	
	CreateInvItem (self,Amulett_der_Erleuchtung);
	CreateInvItem (self,Ring_der_Magie);
	CreateInvItem (self,Ring_der_Erleuchtung);

	//-------------AI-------------
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	// Da gespawnde Gegner nicht auf SC reagieren
	Npc_PercEnable  	(self,PERC_ASSESSENEMY		,B_AssessEnemy				);
	Npc_PercEnable  	(self,PERC_ASSESSFIGHTER		,B_AssessFighter				);
	Npc_PercEnable  	(self,PERC_ASSESSPLAYER		,B_AssessSC					);
	Npc_PercEnable  	(self,PERC_ASSESSDAMAGE		,ZS_ReactToDamage			);
	Npc_PercEnable  	(self,PERC_ASSESSMAGIC		,B_AssessMagic				);
	Npc_PercEnable  	(self,PERC_ASSESSCASTER		,B_AssessCaster	 			);

	//------------- ai -------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_406;
};

FUNC VOID Rtn_start_406 ()
{
	TA_Intercept  (15,00,22,00,"TPL_015");
  	TA_Intercept  (22,00,15,00,"TPL_015");	
};

FUNC VOID Rtn_Drained_406 () 
{
	TA_Drained_YBerion	(23,00,07,00,"TPL_015");
    TA_Drained_YBerion	(07,00,23,00,"TPL_015");	
};
