//*************************************
//NSC - Wahrnehmungsreichweiten
//*************************************
//SN: Demnächst wird diese Tabelle mit der HAI_...-Tabelle aus AI_CONSTANTS.D zusammengefaßt!
CONST INT PERC_DIST_CLOSE	=100;
CONST INT PERC_DIST_FLEE	=300;
CONST INT PERC_DIST_DIALOG	=500;
CONST INT PERC_DIST_WATCHFIGHT=600;
CONST INT PERC_DIST_INTERMEDIAT	=1000;
CONST INT PERC_DIST_MAX	=2000;

FUNC VOID NOREACTPERC()
{

	//Wahrnehmungen aktiv
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_NOREACT);

	//SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
	//Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_AssessItem 				);

	//* Wahrnehmungen passiv *
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_NOREACT);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_NOREACT);
	Npc_PercEnable(self,PERC_CATCHTHIEF,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_NOREACT);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,B_NOREACT);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSCALL,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_NOREACT);
	Npc_PercEnable(self,PERC_MOVEMOB,B_NOREACT);
	Npc_PercEnable(self,PERC_MOVENPC,B_NOREACT);

	NPC_SETPERCTIME(self,0);
};

func void B_TalkOnlyPerception()
{
		Npc_PercEnable(self,PERC_ASSESSPLAYER,B_NOREACT);
		Npc_PercEnable(self,PERC_ASSESSENEMY,B_LookAtOther);//attack
		Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_NOREACT);//others damage affect
		
		Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_REACTTODAMAGE);
		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_ASSESSMAGIC);
		Npc_PercEnable(self,PERC_ASSESSCASTER,B_NOREACT);
		Npc_PercEnable(self,PERC_ASSESSTHREAT,B_NOREACT);
		Npc_PercEnable(self,PERC_DRAWWEAPON,B_NOREACT);
 		Npc_PercEnable(self,PERC_ASSESSWARN,B_NOREACT);
		Npc_PercEnable(self,PERC_ASSESSMURDER,B_NOREACT);
		Npc_PercEnable(self,PERC_ASSESSDEFEAT,B_NOREACT);
		Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_LookAtOther);
		Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_NOREACT);
		Npc_PercEnable(self,PERC_CATCHTHIEF,B_NOREACT);
		Npc_PercEnable(self,PERC_ASSESSTHEFT,B_NOREACT);
		Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_NOREACT);
		Npc_PercEnable(self,PERC_OBSERVESUSPECT,B_NOREACT);
		Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_NOREACT);
		Npc_PercEnable(self,PERC_ASSESSTALK,B_ASSESSTALK);
		Npc_PercEnable(self,PERC_ASSESSCALL,B_NOREACT);
		Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_NOREACT);
		Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_NOREACT);
		Npc_PercEnable(self,PERC_MOVEMOB,B_NOREACT);
		Npc_PercEnable(self,PERC_MOVENPC,B_NOREACT);	
};


FUNC VOID B_SETCUTSCENEPERCEPTIONS()
{
 //PrintDebugNpc(PD_ZS_CHECK,self.NAME);
 //PrintDebugNpc(PD_ZS_CHECK,"CutscenePerceptions");

 Npc_PercEnable(self,PERC_ASSESSMAGIC,B_ASSESSMAGIC);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_ASSESSFIGHTER);
 Npc_PercEnable(self,PERC_ASSESSTHEFT,B_ASSESSTHEFT);

 Npc_PercEnable(self,PERC_DRAWWEAPON,B_ASSESSFIGHTER);

 Npc_PercEnable(self,PERC_ASSESSTALK,B_ASSESSTALK);
 Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_REACTTODAMAGE);
 Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CATCHTHIEF);
};

//etc.

//Hier werden die Reichweiten der Wahrnehmungen eingestellt.
//Nur passive machen Sinn, da die Reichweite der aktiven
//durch den senses_range Wert festgelegt ist.


FUNC VOID INITPERCEPTIONS()
{

	PERC_SETRANGE(PERC_ASSESSMURDER,HAI_DIST_RANGED);
	PERC_SETRANGE(PERC_ASSESSDEFEAT,HAI_DIST_RANGED);
	PERC_SETRANGE(PERC_ASSESSDAMAGE,PERC_DIST_FLEE);
	PERC_SETRANGE(PERC_ASSESSOTHERSDAMAGE,PERC_DIST_INTERMEDIAT);	//SN: Wird von der Menschen-AI nicht verwendet!
	PERC_SETRANGE(PERC_ASSESSTHREAT,HAI_DIST_RANGED);
	PERC_SETRANGE(PERC_ASSESSREMOVEWEAPON,PERC_DIST_MAX);
	PERC_SETRANGE(PERC_OBSERVEINTRUDER,HAI_DIST_OBSERVEINTRUDER);
	PERC_SETRANGE(PERC_ASSESSFIGHTSOUND,HAI_DIST_HELPATTACKEDCHARGES);	//SN: siehe AI_CONSTANTS.D
	PERC_SETRANGE(PERC_ASSESSQUIETSOUND,PERC_DIST_INTERMEDIAT);	//MH: geändert, 500 macht NSCs/Monster zu schwach
	PERC_SETRANGE(PERC_ASSESSWARN,3000);
	PERC_SETRANGE(PERC_CATCHTHIEF,HAI_DIST_CATCHTHIEF);
	PERC_SETRANGE(PERC_ASSESSTHEFT,HAI_DIST_ASSESSTHEFT);
	PERC_SETRANGE(PERC_ASSESSCALL,PERC_DIST_INTERMEDIAT);
	PERC_SETRANGE(PERC_ASSESSTALK,PERC_DIST_DIALOG);
	PERC_SETRANGE(PERC_ASSESSMAGIC,HAI_DIST_RANGED);
	PERC_SETRANGE(PERC_ASSESSSTOPMAGIC,HAI_DIST_RANGED);
	PERC_SETRANGE(PERC_MOVEMOB,PERC_DIST_DIALOG);
	PERC_SETRANGE(PERC_MOVENPC,PERC_DIST_DIALOG);
	PERC_SETRANGE(PERC_DRAWWEAPON,HAI_DIST_MELEE);
	PERC_SETRANGE(PERC_OBSERVESUSPECT,PERC_DIST_DIALOG);
	PERC_SETRANGE(PERC_NPCCOMMAND,2000);
	PERC_SETRANGE(PERC_ASSESSCASTER,HAI_DIST_ASSESSCASTER);
	PERC_SETRANGE(PERC_ASSESSSURPRISE,PERC_DIST_DIALOG);
	PERC_SETRANGE(PERC_ASSESSENTERROOM,HAI_DIST_ACTIONRANGE);
	PERC_SETRANGE(PERC_ASSESSUSEMOB,HAI_DIST_DETECTUSEMOB);
	Npc_PercEnable(self,PERC_NPCCOMMAND,B_CHECKSHEATH);

};

//////////////////////////////////////////////////////////////////////////
//GuardPerception
//===================
//NSCs mit diesem Set haben erhöhte Aufmerksamkeit da sie aktive
//Wahrnehmungen aktiviert haben. Sie müssen als "Warner" für die
//passiv wahrnehmenden 'OccupiedPerception'-NSCs fungieren. Da es Wachen sind
//werden sie für den Watchfight nicht Ihre Posten verlassen
//////////////////////////////////////////////////////////////////////////
FUNC VOID GUARDPERCEPTION()
{

	INITPERCEPTIONS();
	

	//Wahrnehmungen aktiv
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_ASSESSENEMY);//attack
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_ASSESSSC);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_ASSESSFIGHTER);//others damage affect

	//SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
	//Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_AssessItem 				);

	//* Wahrnehmungen passiv *
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_REACTTODAMAGE);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_ASSESSMAGIC);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_ASSESSCASTER);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_ASSESSFIGHTER);
 	Npc_PercEnable(self,PERC_ASSESSWARN,B_ASSESSWARN);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_ASSESSMURDER);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_ASSESSDEFEAT);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_ASSESSFIGHTSOUND);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_ASSESSQUIETSOUND);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CATCHTHIEF);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_ASSESSTHEFT);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_ASSESSSURPRISE);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,B_OBSERVESUSPECT);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_OBSERVEINTRUDER);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_ASSESSTALK);
	Npc_PercEnable(self,PERC_ASSESSCALL,ZS_REACTTOCALL);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_ASSESSUSEMOB);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_ASSESSENTERROOM);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MOVEMOB);
	Npc_PercEnable(self,PERC_MOVENPC,B_MOVENPC);

	Npc_PercEnable(self,PERC_NPCCOMMAND,B_CHECKSHEATH);

	NPC_SETPERCTIME(self,0.5);
	
	//Aivar: Talk Only
	if((self.flags & NPC_FLAG_TALKONLY) != 0)
	{
		B_TalkOnlyPerception();
	};	
};
//////////////////////////////////////////////////////////////////////////
//BATTLEPERCEPTION
//===================
// Trying to simplify it at most
// its possible.
//////////////////////////////////////////////////////////////////////////
FUNC VOID BATTLEPERCEPTION()
{


	//Wahrnehmungen aktiv
	NPC_PERCDISABLE(self,PERC_ASSESSPLAYER);
	Npc_PercEnable(self,PERC_ASSESSENEMY,SIMPLE_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,SIMPLE_ASSESSFIGHTER);

	//SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
	//Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_AssessItem 				);

	//* Wahrnehmungen passiv *
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,SIMPLE_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_ASSESSMAGIC);
	Npc_PercEnable(self,PERC_ASSESSCASTER,SIMPLE_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,SIMPLE_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_DRAWWEAPON,SIMPLE_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSWARN,SIMPLE_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSMURDER,SIMPLE_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,SIMPLE_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,SIMPLE_FIGHTSOUND);
	NPC_PERCDISABLE(self,PERC_ASSESSQUIETSOUND);
	NPC_PERCDISABLE(self,PERC_CATCHTHIEF);
	NPC_PERCDISABLE(self,PERC_ASSESSTHEFT);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,SIMPLE_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,SIMPLE_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,SIMPLE_ASSESSFIGHTER);
	NPC_PERCDISABLE(self,PERC_ASSESSTALK);
	NPC_PERCDISABLE(self,PERC_ASSESSCALL);
	NPC_PERCDISABLE(self,PERC_ASSESSUSEMOB);
	NPC_PERCDISABLE(self,PERC_MOVEMOB);
	NPC_PERCDISABLE(self,PERC_ASSESSENTERROOM);
	NPC_PERCDISABLE(self,PERC_MOVENPC);

	Npc_PercEnable(self,PERC_NPCCOMMAND,B_CHECKSHEATH);

	NPC_SETPERCTIME(self,1);
};
//////////////////////////////////////
//HunGuardPerc
/////////////////////////////////////
FUNC VOID HUNGUARDPERC()
{
   INITPERCEPTIONS();
	//Wahrnehmungen aktiv
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_ASSESSENEMY);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_ASSESSSC);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_ASSESSFIGHTER);

	//SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
	//Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_AssessItem 				);

	//* Wahrnehmungen passiv *
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_REACTTODAMAGE);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_ASSESSMAGIC);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_ASSESSFIGHTSOUND);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_ASSESSQUIETSOUND);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CATCHTHIEF);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_ASSESSTHEFT);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_ASSESSSURPRISE);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,B_NOREACT);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_NOREACT);
	Npc_PercEnable(self,PERC_ASSESSCALL,ZS_REACTTOCALL);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_ASSESSUSEMOB);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_ASSESSENTERROOM);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MOVEMOB);
	Npc_PercEnable(self,PERC_MOVENPC,B_MOVENPC);

	Npc_PercEnable(self,PERC_NPCCOMMAND,B_CHECKSHEATH);

	NPC_SETPERCTIME(self,0.5);
	//Aivar: Talk Only
	if((self.flags & NPC_FLAG_TALKONLY) != 0)
	{
		B_TalkOnlyPerception();

	};		
};
//////////////////////////////////////////////////////////////////////////
//ObservingPerception
//===================
//NSCs mit diesem Set haben erhöhte Aufmerksamkeit da sie aktive
//Wahrnehmungen aktiviert haben. Sie müssen als "Warner" für die
//passiv wahrnehmenden 'OccupiedPerception'-NSCs fungieren.
//////////////////////////////////////////////////////////////////////////
FUNC VOID OBSERVINGPERCEPTION()
{

	//Wahrnehmungen aktiv
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_ASSESSENEMY);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_ASSESSSC);
	//Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_AssessItem 				);

	//* Wahrnehmungen passiv *
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_REACTTODAMAGE);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_ASSESSMAGIC);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_ASSESSCASTER);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_ASSESSWARN);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_ASSESSMURDER);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_ASSESSDEFEAT);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_ASSESSFIGHTSOUND);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_ASSESSQUIETSOUND);//erst mal raus, weil beklauen sonst unmöglich wird
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CATCHTHIEF);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_ASSESSTHEFT);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_ASSESSSURPRISE);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,B_OBSERVESUSPECT);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_OBSERVEINTRUDER);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_ASSESSTALK);
	Npc_PercEnable(self,PERC_ASSESSCALL,ZS_REACTTOCALL);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_ASSESSUSEMOB);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_ASSESSENTERROOM);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MOVEMOB);
	Npc_PercEnable(self,PERC_MOVENPC,B_MOVENPC);

	Npc_PercEnable(self,PERC_NPCCOMMAND,B_CHECKSHEATH);

	NPC_SETPERCTIME(self,1);
	//Aivar: Talk Only
	if((self.flags & NPC_FLAG_TALKONLY) != 0)
	{
		B_TalkOnlyPerception();
	};		
};

//////////////////////////////////////////////////////////////////////////
//OccupiedPerception
//==================
//Dieses Set beschränkt sich auf passive Wahrnehmungen. Gedacht für
//normale Charaktere, die mit etwas beschäftigt sind.
//WICHTIG: occupied-NSCs verlassen sich darauf, daß sie von anderen
//Charakteren mit 'ObservingPerception' gewarnt werden!!!
//////////////////////////////////////////////////////////////////////////
FUNC VOID OCCUPIEDPERCEPTION()
{

	//Wahrnehmungen passiv
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_REACTTODAMAGE);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_ASSESSMAGIC);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_ASSESSCASTER);
//Npc_PercEnable		(self,  PERC_ASSESSSTOPMAGIC	,   ZS_AssessStopMagic			);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_ASSESSWARN);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_ASSESSMURDER);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_ASSESSDEFEAT);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_ASSESSFIGHTSOUND);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_ASSESSTHEFT);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CATCHTHIEF);
	//Npc_PercEnable  	(self, 	PERC_OBSERVEINTRUDER	,	B_OccupiedObserveIntruder	);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_ASSESSSURPRISE);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,B_OBSERVESUSPECT);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_ASSESSTALK);
	Npc_PercEnable(self,PERC_ASSESSCALL,ZS_REACTTOCALL);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_ASSESSUSEMOB);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_ASSESSENTERROOM);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MOVEMOB);
	Npc_PercEnable(self,PERC_MOVENPC,B_MOVENPC);

	Npc_PercEnable(self,PERC_NPCCOMMAND,B_CHECKSHEATH);
	//Aivar: Talk Only
	if((self.flags & NPC_FLAG_TALKONLY) != 0)
	{
		B_TalkOnlyPerception();
	};		
};

//////////////////////////////////////////////////////////////////////////
//DeepSleepPerception
//===================
//Minimalste Wahrnehmungen während eines tiefen Schlafes. Diese Jungs
//wachen wirklich nur Schaden am eigenen Körper auf.
//////////////////////////////////////////////////////////////////////////
FUNC VOID DEEPSLEEPPERCEPTION()
{
	//Wahrnehmungen passiv
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_REACTTODAMAGE);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_TOSSANDTURN);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_TOSSANDTURN);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_TOSSANDTURN);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_TOSSANDTURN);
	Npc_PercEnable(self,PERC_ASSESSCALL,B_TOSSANDTURN);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_ASSESSMAGIC);

	Npc_PercEnable(self,PERC_NPCCOMMAND,B_CHECKSHEATH);
};

FUNC VOID B_CLEARPERCEPTIONS()
{
	//------ Aktive Wahrnehmungen der Perception_Set_Normal und Minimal disablen -------
	NPC_PERCDISABLE(self,PERC_ASSESSPLAYER);
	NPC_PERCDISABLE(self,PERC_ASSESSENEMY);

	//------ Aktive Wahrnehmungen, die von Monstern benutzt werden disablen ------
	NPC_PERCDISABLE(self,PERC_ASSESSBODY);

	//------ Passive Wahrnehmungen der Perception_Set_Normal und Minimal disablen -------
//Npc_PercDisable  	(self, 	PERC_ASSESSMAGIC		);
	NPC_PERCDISABLE(self,PERC_ASSESSDAMAGE);
	NPC_PERCDISABLE(self,PERC_ASSESSMURDER);
	NPC_PERCDISABLE(self,PERC_ASSESSTHEFT);
	NPC_PERCDISABLE(self,PERC_ASSESSUSEMOB);
	NPC_PERCDISABLE(self,PERC_ASSESSENTERROOM);
	NPC_PERCDISABLE(self,PERC_ASSESSTHREAT);
	NPC_PERCDISABLE(self,PERC_DRAWWEAPON);
	NPC_PERCDISABLE(self,PERC_ASSESSFIGHTSOUND);
	NPC_PERCDISABLE(self,PERC_ASSESSQUIETSOUND);
	NPC_PERCDISABLE(self,PERC_ASSESSWARN);
	NPC_PERCDISABLE(self,PERC_ASSESSTALK);
	NPC_PERCDISABLE(self,PERC_MOVEMOB);

	//------ Wahrnehmungen disablen, die sonstwo benutzt werden ------
	NPC_PERCDISABLE(self,PERC_ASSESSOTHERSDAMAGE);	//wird i.d.R. nur von Monster-AI benutz (einige ZS) und lokal in ZS_WatchFight
	NPC_PERCDISABLE(self,PERC_ASSESSSTOPMAGIC);	//wird in einigen ZS_Magic lokal benutzt und aus Spell_ProcessMana_Release versendet
	NPC_PERCDISABLE(self,PERC_ASSESSSURPRISE);

	//------ Wahrnehmungen, dich nicht von der AI benutzt werden ------
	//Npc_PercDisable  	(self, 	PERC_ASSESSFIGHTER		);
	//Npc_PercDisable  	(self, 	PERC_ASSESSITEM			);
	//Npc_PercDisable  	(self, 	PERC_OBSERVEINTRUDER	);
	//Npc_PercDisable  	(self, 	PERC_ASSESSREMOVEWEAPON	);
	//Npc_PercDisable  	(self, 	PERC_CATCHTHIEF			);
	//Npc_PercDisable  	(self, 	PERC_ASSESSDEFEAT		);
	//Npc_PercDisable  	(self, 	PERC_ASSESSCALL			);
	//Npc_PercDisable  	(self, 	PERC_MOVENPC			);
	//Npc_PercDisable  	(self, 	PERC_ASSESSCASTER		);
	//Npc_PercDisable  	(self, 	PERC_NPCCOMMAND			);
	//Npc_PercDisable  	(self, 	PERC_OBSERVESUSPECT		);
};

//////////////////////////////////////////////////////////////////////////
//LightSleepPerception
//====================
//Unruhiger Schlaf, der von der geringsten Störung unterbrochen wird.
//////////////////////////////////////////////////////////////////////////

FUNC VOID LIGHTSLEEPPERCEPTION()
{
	//Wahrnehmungen passiv
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_REACTTODAMAGE);
	Npc_PercEnable(self,PERC_ASSESSWARN,ZS_WAKEUP);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,ZS_WAKEUP);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CATCHTHIEF);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_SLEEPQUIETSOUND);
	Npc_PercEnable(self,PERC_ASSESSTALK,ZS_WAKEUP);
	Npc_PercEnable(self,PERC_ASSESSCALL,ZS_WAKEUP);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_ASSESSMAGIC);

	Npc_PercEnable(self,PERC_NPCCOMMAND,B_CHECKSHEATH);

};

FUNC VOID B_SETPERCEPTION(VAR C_NPC self)
{

//if (self.npctype == npctype_Ambient)
//{
//OccupiedPerception();
//}
//else
//{
		OBSERVINGPERCEPTION();
//};
};


FUNC VOID Npc_SetGuardPerception(var c_npc slf)
{

	INITPERCEPTIONS();
	

	//Wahrnehmungen aktiv
	Npc_PercEnable(slf,PERC_ASSESSENEMY,B_ASSESSENEMY);//attack
	Npc_PercEnable(slf,PERC_ASSESSPLAYER,B_ASSESSSC);
	Npc_PercEnable(slf,PERC_ASSESSFIGHTER,B_ASSESSFIGHTER);//others damage affect

	//SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
	//Npc_PercEnable  	(slf,	PERC_ASSESSITEM			,	B_AssessItem 				);

	//* Wahrnehmungen passiv *
	Npc_PercEnable(slf,PERC_ASSESSDAMAGE,ZS_REACTTODAMAGE);
	Npc_PercEnable(slf,PERC_ASSESSMAGIC,B_ASSESSMAGIC);
	Npc_PercEnable(slf,PERC_ASSESSCASTER,B_ASSESSCASTER);
	Npc_PercEnable(slf,PERC_ASSESSTHREAT,B_ASSESSFIGHTER);
	Npc_PercEnable(slf,PERC_DRAWWEAPON,B_ASSESSFIGHTER);
 	Npc_PercEnable(slf,PERC_ASSESSWARN,B_ASSESSWARN);
	Npc_PercEnable(slf,PERC_ASSESSMURDER,ZS_ASSESSMURDER);
	Npc_PercEnable(slf,PERC_ASSESSDEFEAT,ZS_ASSESSDEFEAT);
	Npc_PercEnable(slf,PERC_ASSESSFIGHTSOUND,B_ASSESSFIGHTSOUND);
	Npc_PercEnable(slf,PERC_ASSESSQUIETSOUND,B_ASSESSQUIETSOUND);
	Npc_PercEnable(slf,PERC_CATCHTHIEF,ZS_CATCHTHIEF);
	Npc_PercEnable(slf,PERC_ASSESSTHEFT,B_ASSESSTHEFT);
	Npc_PercEnable(slf,PERC_ASSESSSURPRISE,ZS_ASSESSSURPRISE);
	Npc_PercEnable(slf,PERC_OBSERVESUSPECT,B_OBSERVESUSPECT);
	Npc_PercEnable(slf,PERC_OBSERVEINTRUDER,B_OBSERVEINTRUDER);
	Npc_PercEnable(slf,PERC_ASSESSTALK,B_ASSESSTALK);
	Npc_PercEnable(slf,PERC_ASSESSCALL,ZS_REACTTOCALL);
	Npc_PercEnable(slf,PERC_ASSESSUSEMOB,B_ASSESSUSEMOB);
	Npc_PercEnable(slf,PERC_ASSESSENTERROOM,B_ASSESSENTERROOM);
	Npc_PercEnable(slf,PERC_MOVEMOB,B_MOVEMOB);
	Npc_PercEnable(slf,PERC_MOVENPC,B_MOVENPC);

	Npc_PercEnable(slf,PERC_NPCCOMMAND,B_CHECKSHEATH);

	NPC_SETPERCTIME(slf,0.5);
	
	//Aivar: Talk Only
// 	if((slf.flags & NPC_FLAG_TALKONLY) != 0)
// 	{
// 		B_TalkOnlyPerception();
// 	};	
};