//////////////////////////////////////////////////////////////////////////
//	ZS_AssessMurder
//	===============
//	Wird ausschließlich durch
//
//	- PERC_ASSESSMURDER
//
//	angesprungen. Folgende Voraussetzungen müssen erfüllt sein:
//
//	- keine!
//
//	Macht folgendes:
//	1.	Mord von Monster
//		->	ZS_AssessMonster
//	2.	Mord an Monster
//		->	ignorieren
//	3.	Mord ohne Monsterbeteiligung
//		->	News-Eintrag generieren
//		->	Wachen, deren Schützlinge besiegt wurden 	-> ZS_ProclaimAndPunish
//		->	war das Opfer ein Freund					-> B_AssessEnemy
//		->	Wenn ANGRY/HOSTILE zum Mordopfer 			-> spöttischer Kommentar
//////////////////////////////////////////////////////////////////////////
FUNC VOID ZS_AssessMurder ()
{	

	////PrintDebugInt			(PD_ZS_FRAME,	"ZS_AssessMurder" );	

	C_ZSInit				();
	
	Npc_PercEnable  		(self,	PERC_ASSESSENEMY	,	B_AssessEnemy		);

	Npc_PercEnable  		(self,	PERC_ASSESSDAMAGE	,	ZS_ReactToDamage 	);
	Npc_PercEnable  		(self,	PERC_ASSESSMAGIC	,	B_AssessMagic		);
	Npc_PercEnable  		(self,	PERC_ASSESSSURPRISE	,  	ZS_AssessSurprise	);
	Npc_PercEnable(Self,PERC_NPCCOMMAND,B_CHECKSHEATH);

	//PRINTGlobals			(PD_ZS_CHECK);
	//PRINTAttitudes		 	(PD_ZS_CHECK);
	if (Npc_CanSeeNpcFreeLOS(self,other) || Npc_CanSeeNpcFreeLOS(self,victim))
	{
		//-------- Mord von Monster ! --------
		if (!C_NpcIsHuman(other))
		{
			////PrintDebugInt		(PD_ZS_CHECK,	"...Mord von Monster!");
			Npc_SetTarget		(self,	other);
			
			Npc_GetTarget		( self);
			AI_StartState		(self,	ZS_AssessMonster,	0,	"");
			return;
		}
	
		//-------- Mord an Monster ! --------
		else if (!C_NpcIsHuman(victim))
		{
			////PrintDebugInt		(PD_ZS_CHECK,	"...Mord an Monster!");
			B_WhirlAround 		(self,	victim);
			return;
		};

	
		////PrintDebugInt		(PD_ZS_CHECK,	"ZS_AssessMurder/Npc_CanSeeNpc" );

		//-------- Morden Sehen & Merken ! --------
		B_WhirlAround 		(self,	other);
		B_AssessAndMemorize	(NEWS_MURDER,	NEWS_SOURCE_WITNESS,	self,	other,	victim);

		//-------- Schützling einer Wache wurde umgehauen ! --------
		if (C_ChargeWasAttacked(self, victim, other))
		{ 
			////PrintDebugInt	(PD_ZS_CHECK,	"...NSC ist Wache und ein Schützling wurde gemordet!");
			B_DrawWeapon	(self,	other);
			AI_StartState 	(self,  ZS_ProclaimAndPunish, 0, "");
			return;
		};
	
		//-------- führte Mordbewertung in B_AssessAndMemorize zu HOSTILE ? --------
		if (Npc_GetAttitude(self,other)==ATT_HOSTILE)
		{
			////PrintDebugInt	(PD_ZS_CHECK,	"...hostile zum Mörder!");
			B_Say			(self,	other,	"$HEKILLEDHIM");	//MH: von B_AssessAndMemorize hierhin kopiert, weil sonst IMMER der Spruch kam!
			B_AssessEnemy	();
		}
		else
		{
			//---- Abneigung gegen Mordopfer ? --------
			if ((Npc_GetAttitude (self,victim) == ATT_ANGRY) || (Npc_GetAttitude (self,victim) == ATT_HOSTILE))
			{
				////PrintDebugInt(PD_ZS_CHECK,	"...angry/hostile zu Opfer!");
				B_Say 		(self,	other,	"$YEAHWELLDONE");
				C_StopLookAt(self);
			};
		};
	};
};
