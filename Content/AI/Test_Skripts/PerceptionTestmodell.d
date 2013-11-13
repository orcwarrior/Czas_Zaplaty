//########################################################################
//##
//##	Perception_Testmodell													
//##
//########################################################################
instance Perception_Testmodell (Npc_Default)
{
	//-------- primary data --------
	name =							"Perception_Testmodell";
	guild =							GIL_NONE;
	level =							10;
	voice =							11;//15;
	id =							2221;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		29;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		20;
	attribute[ATR_MANA] =			20;
	attribute[ATR_HITPOINTS_MAX] =	148;
	attribute[ATR_HITPOINTS] =		148;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 82, 1, DMB_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	

 	//-------- Talente -------- 
	//Npc_LearnFightTalent (self, TAL_1H_SWORD2);
	//Npc_LearnFightTalent (self, TAL_1H_AXE2);		
			
	//-------- inventory --------
	CreateInvItem	(self, ALL_MW_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 4);
	
	//-------- ai ----------
	start_aistate = ZS_PTM_Hangaround;
	fight_tactic	=	FAI_HUMAN_STRONG;
    wp="A2";
	Npc_SetPermAttitude(self, ATT_NEUTRAL);
 
};

func void ZS_PTM_Hangaround ()
{
// 	////PrintDebugNpc	(PD_ZS_FRAME,	"ZS_PTM_Hangaround");
// 	InitPerceptions();
// 	// * Wahrnehmungen aktiv *
// 	Npc_PercEnable  	(self,	PERC_ASSESSPLAYER		,	B_PTM_AssessPlayer		);	
// 	Npc_PercEnable  	(self,	PERC_ASSESSENEMY		,	B_PTM_AssessEnemy		);	
// 	Npc_PercEnable  	(self,	PERC_ASSESSFIGHTER		,	B_PTM_AssessFighter		);	
// 	Npc_PercEnable  	(self,	PERC_ASSESSBODY			,	B_PTM_AssessBody		);	
// 	Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_PTM_AssessItem		);	
// 	Npc_SetPercTime		(self,	0.5);
// 	
// 	// * Wahrnehmungen passiv *
// 	Npc_PercEnable  	(self,	PERC_ASSESSMURDER		,	B_PTM_AssessMurder		);	
// 	Npc_PercEnable  	(self,	PERC_ASSESSDEFEAT		,	B_PTM_AssessDefeat		);
// 	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_PTM_AssessDamage		);
// 	Npc_PercEnable  	(self,	PERC_ASSESSOTHERSDAMAGE	,	B_PTM_AssessOhtersDamage);
// 	Npc_PercEnable  	(self,	PERC_ASSESSTHREAT		,	B_PTM_AssessThreat		);
// 	Npc_PercEnable  	(self,	PERC_ASSESSREMOVEWEAPON	,	B_PTM_AssessRemoveWeapon);
// 	Npc_PercEnable  	(self,	PERC_OBSERVEINTRUDER	,	B_PTM_ObserveIntruder	);
// 	//Npc_PercEnable  	(self,	PERC_ASSESSFIGHTSOUND	,	B_PTM_AssessFightSound	);
// 	Npc_PercEnable  	(self,	PERC_ASSESSQUIETSOUND	,	B_PTM_AssessQuietSound	);
// 	Npc_PercEnable  	(self,	PERC_ASSESSWARN			,	B_PTM_AssessWarn		);
// 	Npc_PercEnable  	(self,	PERC_CATCHTHIEF			,	B_PTM_CatchThief		);
// 	Npc_PercEnable  	(self,	PERC_ASSESSTHEFT		,	B_PTM_AssessTheft		);
// 	Npc_PercEnable  	(self,	PERC_ASSESSCALL			,	B_PTM_AssessCall		);
// 	Npc_PercEnable  	(self,	PERC_ASSESSTALK			,	B_AssessTalk		);
// 	Npc_PercEnable  	(self,	PERC_ASSESSGIVENITEM	,	B_PTM_AssessGivenItem	);
// 	Npc_PercEnable  	(self,	PERC_ASSESSFAKEGUILD	,	B_PTM_AssessFakeGuild	);
// 	Npc_PercEnable  	(self,	PERC_MOVEMOB			,	B_PTM_MoveMob			);	
// 	Npc_PercEnable  	(self,	PERC_MOVENPC			,	B_PTM_MoveNpc			);	
// 	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			,	B_PTM_DrawWeapon		);
// 	Npc_PercEnable  	(self,	PERC_OBSERVESUSPECT		,	B_PTM_ObserveSuspect	);
// 	Npc_PercEnable  	(self,	PERC_NPCCOMMAND			,	B_PTM_NpcCommand	);
// 	Npc_PercEnable  	(self,	PERC_ASSESSMAGIC		,	B_PTM_AssessMagic		);
// 	Npc_PercEnable  	(self,	PERC_ASSESSSTOPMAGIC	,	B_PTM_AssessStopMagic	);
// 	Npc_PercEnable  	(self,	PERC_ASSESSCASTER		,	B_PTM_AssessCaster		);
// 	Npc_PercEnable  	(self,	PERC_ASSESSSURPRISE		,	B_PTM_AssessSurprise	);
// 	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_PTM_AssessEnterRoom	);
// 	Npc_PercEnable  	(self,	PERC_ASSESSUSEMOB		,	B_PTM_AssessUseMob		);
// 	//GuardPerceptions();
};

func void ZS_PTM_Hangaround_Loop ()
{
	////PrintDebugNpc	(PD_ZS_LOOP,	"ZS_PTM_Hangaround_Loop");
	AI_WAIT(self,1);
};

func void ZS_PTM_Hangaround_End ()
{
	////PrintDebugNpc	(PD_ZS_FRAME,	"ZS_PTM_Hangaround_End");
};

// func void B_PTM_AssessPlayer		()	{			//PRINTGlobals(PD_ZS_DETAIL);	};
// func void B_PTM_AssessEnemy			()	{			//PRINTGlobals(PD_ZS_DETAIL);	};
// func void B_PTM_AssessFighter		()	{	    	//PRINTGlobals(PD_ZS_DETAIL);	};
// func void B_PTM_AssessBody			()	{			//PRINTGlobals(PD_ZS_DETAIL);	};
// func void B_PTM_AssessItem			()	{			//PRINTGlobals(PD_ZS_DETAIL);	};
// 	                                                                                                 
//                                                                                                      
// func void B_PTM_AssessMurder		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessDefeat		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessDamage		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessOhtersDamage	()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessThreat		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessRemoveWeapon	()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_ObserveIntruder		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessFightSound	()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessQuietSound	()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessWarn			()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_CatchThief			()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessTheft			()	{	//PRINTGlobals(PD_ZS_FRAME);	};//B_AssessTheft();};
// func void B_PTM_AssessCall			()	{	//PRINTGlobals(PD_ZS_FRAME);	
// 											/*AI_SetWalkmode(self, NPC_WALK);
// 											AI_GotoWP	 (self, "WP_START");	*/												 			};
// func void B_PTM_AssessTalk			()	{ /*IT WAS NEEDED*/ B_AssessTalk();	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessGivenItem		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessFakeGuild		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_MoveMob				()	{	//PRINTGlobals(PD_ZS_FRAME);	B_MoveMob();};
// func void B_PTM_MoveNpc			    ()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_DrawWeapon			()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_ObserveSuspect		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_NpcCommand			()	{ pri/nt(concatstrings("NPCCOMAND-",self.name));	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessMagic			()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessStopMagic		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessCaster		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessSurprise		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessEnterRoom		()	{	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessUseMob		()	{	//PRINTGlobals(PD_ZS_FRAME);	};//B_AssessUseMob();};




// func void B_PTM_AssessPlayer		()	{	Print("B_PTM_AssessPlayer"		);	//PRINTGlobals(PD_ZS_DETAIL);	};
// func void B_PTM_AssessEnemy			()	{	Print("B_PTM_AssessEnemy"			);	//PRINTGlobals(PD_ZS_DETAIL);	};
// func void B_PTM_AssessFighter		()	{	Print("B_PTM_AssessFighter"	    );	//PRINTGlobals(PD_ZS_DETAIL);	};
// func void B_PTM_AssessBody			()	{	Print("B_PTM_AssessBody"			);	//PRINTGlobals(PD_ZS_DETAIL);	};
// func void B_PTM_AssessItem			()	{	Print("B_PTM_AssessItem"			);	//PRINTGlobals(PD_ZS_DETAIL);	};
// 	                                                                                                 
//                                                                                                      
// func void B_PTM_AssessMurder		()	{	Print("B_PTM_AssessMurder"	   	);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessDefeat		()	{	Print("B_PTM_AssessDefeat"		);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessDamage		()	{	Print("B_PTM_AssessDamage"		);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessOhtersDamage	()	{	Print("B_PTM_AssessOhtersDamage"	);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessThreat		()	{	Print("B_PTM_AssessThreat"		);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessRemoveWeapon	()	{	Print("B_PTM_AssessRemoveWeapon"	);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_ObserveIntruder		()	{	Print("B_PTM_ObserveIntruder"		);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessFightSound	()	{	Print("B_PTM_AssessFightSound"	);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessQuietSound	()	{	Print("B_PTM_AssessQuietSound"	);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessWarn			()	{	Print("B_PTM_AssessWarn"			);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_CatchThief			()	{	Print("B_PTM_CatchThief"			);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessTheft			()	{	Print("B_PTM_AssessTheft"			);	//PRINTGlobals(PD_ZS_FRAME);	};//B_AssessTheft();};
// func void B_PTM_AssessCall			()	{	Print("B_PTM_AssessCall"			);	//PRINTGlobals(PD_ZS_FRAME);	
// 											/*AI_SetWalkmode(self, NPC_WALK);
// 											AI_GotoWP	 (self, "WP_START");	*/												 			};
// func void B_PTM_AssessTalk			()	{	Print("B_PTM_AssessTalk"			); /*IT WAS NEEDED*/ B_AssessTalk();	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessGivenItem		()	{	PrintScreen	("B_PTM_AssessGivenItem",30,30,_STR_FONT_ONSCREEN,2);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessFakeGuild		()	{	Print("B_PTM_AssessFakeGuild"		);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_MoveMob				()	{	Print("B_PTM_MoveMob"				);	//PRINTGlobals(PD_ZS_FRAME);	B_MoveMob();};
// func void B_PTM_MoveNpc			    ()	{	Print("B_PTM_MoveNpc"			    );	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_DrawWeapon			()	{	Print("B_PTM_DrawWeapon"			);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_ObserveSuspect		()	{	Print("B_PTM_ObserveSuspect"		);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_NpcCommand			()	{	Print("B_PTM_NpcCommand"			);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessMagic			()	{	Print("B_PTM_AssessMagic"			);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessStopMagic		()	{	Print("B_PTM_AssessStopMagic"		);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessCaster		()	{	Print("B_PTM_AssessCaster"		);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessSurprise		()	{	Print("B_PTM_AssessSurprise"		);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessEnterRoom		()	{	Print("B_PTM_AssessEnterRoom"		);	//PRINTGlobals(PD_ZS_FRAME);	};
// func void B_PTM_AssessUseMob		()	{	Print("B_PTM_AssessUseMob"		);	//PRINTGlobals(PD_ZS_FRAME);	};//B_AssessUseMob();};

//-----------------------------------------------------------------
// EXIT FOX
//-----------------------------------------------------------------
INSTANCE DIA_Perception_Testmodell_Exit (C_INFO)
{
	npc			= Perception_Testmodell;
	nr			= 999;
	condition	= DIA_Perception_Testmodell_Exit_Condition;
	information	= DIA_Perception_Testmodell_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Perception_Testmodell_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Perception_Testmodell_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//-----------------------------------------------------------------
// FOX TRADE
//-----------------------------------------------------------------
instance _TRADE(C_INFO)
{
	npc				= Perception_Testmodell;
	condition		= Perception_Testmodell_TRADE_Condition;
	information		= Perception_Testmodell_TRADE_Info;
	//important		= 1;
	permanent		= 1;
	trade 			= 1;
	nr				= 998;
	description		= "(handel)";
};

FUNC int  Perception_Testmodell_TRADE_Condition()
{
	return 1;

};
func void  Perception_Testmodell_TRADE_Info()
{

	
};