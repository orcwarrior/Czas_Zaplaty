//////////////////////////////////////////////////////////////////////////
//B_SPELLDEATHXP
//==============
//Verwundet den NSC und berücksichtigt dabei den prot Rüstschutz
//'self' ist der zu verwundende NSC
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_SPELLDEATHXP(VAR C_Npc SLF,VAR INT MULTIPLER)
{
	////PrintDebugNpc(PD_ZS_FRAME,"B_DeathXP");
	//PRINTGlobals(PD_ZS_CHECK);

	IF	(slf.guild<GIL_SEPERATOR_HUM)
	&&	Npc_WASINSTATE(SLF,ZS_UNCONSCIOUS)
	{
		////PrintDebugNpc(PD_ZS_CHECK,"...Opfer ist bewußtloser Mensch!");
		//SN: keine XP für Finishing-Move!!!
	}
	ELSE
	{
		////PrintDebugNpc(PD_ZS_CHECK,"...Opfer ist entweder nicht bewußtlos oder kein Mensch!");
		B_GIVEXP((SLF.LEVEL * XP_PER_LEVEL_DEAD)/ MULTIPLER);
	};
};

//////////////////////////////////////////////////////////////////////////
//B_SpellHurtNpc
//==============
//Verwundet den NSC und berücksichtigt dabei den prot Rüstschutz
//'self' ist der zu verwundende NSC
//////////////////////////////////////////////////////////////////////////
FUNC VOID B_SPELLHURTNpc(VAR C_Npc SLF,VAR C_Npc ATTACKER,VAR INT DAMAGE,VAR INT DAMTYP)
{
	////PrintDebugNpc(PD_ZS_FRAME,"B_SpellHurtNpc");
	VAR INT DMG;
	/*if(damtyp==DAM_BARRIER)
	{
	PRINT("BARRIER");
	dmg = slf.protection[PROT_BARRIER];		
	}
	else if(damtyp==DAM_BLUNT)
	{
	PRINT("BLUNT");		
	dmg = slf.protection[PROT_BLUNT];		
	}
	else if(damtyp==DAM_EDGE)
	{
	PRINT("EDGE");		
	dmg = slf.protection[PROT_EDGE];		
	}
	else if(damtyp==DAM_FIRE)
	{
	PRINT("FIRE");	
	if(damage>30)&&(!Npc_IsDead(self))
	{
	Ai_PlayAni (slf,"S_FIRE_VICTIM");	
	};		
	dmg = slf.protection[PROT_FIRE];		
	}
	else if(damtyp==DAM_FLY)
	{
	PRINT("FLY");	
	if(Npc_CanSeeNpcFreeLOS(slf,attacker))&&(!Npc_IsDead(slf))
	{		
	B_FullStop 		(slf);
	Ai_PlayAni (slf,"s_FallB");		
	Ai_WAiT(slf,1);	
	B_FullStop 		(slf);						
	}
	else if(!Npc_CanSeeNpcFreeLOS(slf,attacker))&&(!Npc_IsDead(slf))
	{		
	B_FullStop 		(slf);		
	Ai_PlayAni (slf,"s_Fall");	
	Ai_WAiT(slf,1);		
	B_FullStop 		(slf);									
	};		
	dmg = slf.protection[PROT_FLY];		
	}	
	else if(damtyp==DAM_MAGIC)
	{
	PRINT("MAGIC");			
	dmg = slf.protection[PROT_MAGIC];		
	}
	else if(damtyp==DAM_POINT)
	{
	PRINT("POINT");			
	dmg = slf.protection[PROT_POINT];		
	}
	else if(damtyp==DAM_FALL)
	{
	PRINT("FALL");				
	dmg = slf.protection[PROT_FALL];		
	}	
	else
	{
	PRINT("MAGIC");				
	dmg = slf.protection[PROT_MAGIC];		
	};	*/
	DMG=DAMAGE-DMG;
	IF(DMG < 0)
	{
		DMG=0;
	};
	VAR INT HPMINUS;
	HPMINUS=DMG*2;
	//hpminus=hpminus-(hpminus%1);
	//Print(IntToString(slf.attribute[ATR_HITPOINTS]));
	WLD_PLAYEFFECT("spellFX_INVISIBLEDMG_Fireball",ATTACKER,SLF,2,DAMAGE,DAMTYP,TRUE);
	//slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS]-hpminus;
	//Print(IntToString(dmg));
	IF	Npc_ISDEAD(SLF)
	{
		IF	Npc_ISPLAYER(ATTACKER)
		||((attacker.guild<GIL_SEPERATOR_HUM) && Npc_GetAivar(ATTACKER,AIV_PARTYMEMBER))
		||((attacker.guild>GIL_SEPERATOR_HUM) && Npc_GetAivar(ATTACKER,AIV_MM_PARTYMEMBER))
		{
			B_SPELLDEATHXP(SLF,1);	//vergibt XP an SC
		};
	};
};
//*******************************************************
//****  R U N E S W O R D   A S S E S S M A G I C   *****
//****  R U N E S W O R D   A S S E S S M A G I C   *****
//****  R U N E S W O R D   A S S E S S M A G I C   *****
//*******************************************************

// Moved from assessMagic
/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_STUNINGBALL()
{

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);

	//kein Freezen von SLEEPER, DEMON, GOLEM, SWAMPSHARK, TROLL und wenn Opfer in BS_SWIM oder BS_DIVE
	//FIXME: MInecrawlerqueeen ist GIL_MINECRAWLER! Andere Gilde geben, damit auch sie nicht gefreezt werden kann?!
	IF(!((SELF.GUILD	==GIL_PUPIL)||
(SELF.GUILD==GIL_DEMON)||
(SELF.GUILD==GIL_GOLEM)||
(SELF.GUILD==GIL_SWAMPSHARK)||
(SELF.GUILD==GIL_TROLL)))&&
(!(C_BODYSTATECONTAINS(SELF,BS_SWIM))||(C_BODYSTATECONTAINS(SELF,BS_DIVE)))
	{
		NPC_CLEARAIQUEUE(SELF);
		AI_STARTSTATE(SELF,ZS_STUNED,0,"");
	};
};


//RuneSWORD AssesMagic
/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_FIREBOLT()
{
	////PrintDebugNpc(PD_MAGIC,"B_assessMagicRuneSWD_Firebolt");
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(RUNE_SLF,PERC_ASSESSFIGHTSOUND,RUNE_SLF,other);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_FIREBALL()
{
	////PrintDebugNpc(PD_MAGIC,"B_assessMagicRuneSWD_FireBall");
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(RUNE_SLF,PERC_ASSESSFIGHTSOUND,RUNE_SLF,other);
};

/*******************************************************************************************/

FUNC VOID B_ASSESSMAGICRUNESWD_HOLYFIRE(var c_npc attacker,var c_npc target)
{
	////PrintDebugNpc(PD_MAGIC,"B_AssesMagic_HolyLight")Npc_SetAivar(;
	NPC_SENDPASSIVEPERC(target,PERC_ASSESSFIGHTSOUND,target,OTHER);
	IF((target.GUILD >=GIL_ZOMBIE)&&(target.GUILD <=GIL_SKELETON))||(Npc_GetAivar(target,AIV_MM_REAL_ID)==ID_SKELETONMAGE)||(Npc_GetAivar(target,AIV_MM_REAL_ID)==ID_SKELETONRANGER)
	||((target.FIGHT_TACTIC==FAI_HUMAN_MAGE)&&((target.GUILD==GIL_DEMON)||(target.GUILD==GIL_UNDEADORC)))
	||(target.GUILD > GIL_SEPERATOR_ORC)
	//Same as NpcIsEvil
	{
		Npc_ClearAiQueue(target);
		WLD_PLAYEFFECT("VOB_HOLYBURN",target,target,1,0,0,0);
		Snd_Play3D 	(target,"MFX_HOLYFIRE_COLLIDE");
		IF(target.GUILD > GIL_SEPERATOR_ORC)
		{
			VAR INT DMG;DMG=(SPL_DAMAGE_HOLYFIRE - SPL_DAMAGE_HOLYFIRE % 3)/3*2;
			WLD_PLAYEFFECT("spellFX_INVISIBLEDMG_Fireball",attacker,target,2,DMG,DAM_MAGIC,TRUE);

		}
		ELSE
		{
			WLD_PLAYEFFECT("spellFX_INVISIBLEDMG_Fireball",attacker,target,2,SPL_DAMAGE_HOLYFIRE,DAM_MAGIC,TRUE);

		};
		IF(!NPC_ISDEAD(target))
		{
			Npc_ClearAiQueue(target);
			AI_StandUp(target);
			AI_PLAYANI(target,"S_FIRE_VICTIM");
			AI_WAIT(target,1);
		};

	};
};
/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_FIRESTORM()
{
	////PrintDebugNpc(PD_MAGIC,"B_assessMagicRuneSWD_Firestorm");
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(RUNE_SLF,PERC_ASSESSFIGHTSOUND,RUNE_SLF,other);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_FIRERAiN()
{
	////PrintDebugNpc(PD_MAGIC,"B_assessMagicRuneSWD_FirerAin");
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(self,PERC_ASSESSFIGHTSOUND,self,hero);
	VAR C_Npc RUNENOW;
	RUNENOW	=HLP_GETNpc(RUNESWORD_NOW);
	NAMEPOSY=NAMEPOSY+4;
	B_SPELLHURTNpc(self,hero,RUNESWD_VOICE,RUNESWD_NpcTYPE);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_CHAiNLIGHTNING(var c_npc slf)
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic ...ChainLightning");

	NPC_PERCDISABLE(slf,PERC_ASSESSCASTER);

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(slf,PERC_ASSESSFIGHTSOUND,SELF,OTHER);

	NPC_CLEARAIQUEUE(slf);
	IF(!NPC_ISDEAD(slf))
	{
		Ai_StandUpQuick(self);
		AI_STARTSTATE(slf,ZS_SHORTZAPPED,0,"");
	};
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_THUNDERBOLT()
{
	////PrintDebugNpc(PD_MAGIC,"B_assessMagicRuneSWD_Thunderbolt");
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(RUNE_SLF,PERC_ASSESSFIGHTSOUND,RUNE_SLF,other);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_THUNDERBALL()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic ...Thunderball");
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(self,PERC_ASSESSFIGHTSOUND,RUNE_SLF,other);

	Npc_ClearAiQueue(self);
	IF(!Npc_ISDEAD(self))
	{
		Ai_StandUpQuick(self);
		Ai_STARTSTATE(self,ZS_SHORTZAPPED,0,"");
	};
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_ICECUBE(var c_npc slf)
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic ...IceCube oder IceWave");
	//Damit andere NSCs den Angriff wahrnehmen können
	//Npc_SENDPASSIVEPERC(RUNE_SLF,PERC_ASSESSFIGHTSOUND,RUNE_SLF,other);
	//kein Freezen von SLEEPER, DEMON, GOLEM, SWAMPSHARK, TROLL und wenn Opfer in BS_SWIM oder BS_DIVE
	//FIXME: MInecrawlerqueeen ist GIL_MINECRAWLER! Andere Gilde geben, damit auch sie nicht gefreezt werden kann?!
 	IF(!((slf.GUILD == GIL_PUPIL)||
 	(slf.GUILD==GIL_DEMON)||
 	(slf.GUILD==GIL_GOLEM)||
 	(slf.GUILD==GIL_SWAMPSHARK)||
 	(slf.GUILD==GIL_TROLL)))
 	{
// 		//B_CLEARPERCEPTIONS();
 		IF(!C_Npcisdown(slf))
 		{
		NPC_PERCDISABLE(SLF,PERC_ASSESSCASTER);
		NPC_CLEARAIQUEUE(SLF);
		AI_STARTSTATE(SLF,ZS_MAGICFREEZE,0,"");
 		};
 	};
};
/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_MASSDEATH()
{
	////PrintDebugNpc(PD_MAGIC,"B_assessMagicRuneSWD_Massdeath");
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(RUNE_SLF,PERC_ASSESSFIGHTSOUND,RUNE_SLF,other);
};


/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_StuningBall()
{

	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,RUNE_SLF,OTHER);
	IF((SELF.GUILD!=GIL_PUPIL)&&
	(SELF.GUILD!=GIL_DEMON)&&
	(SELF.GUILD!=GIL_GOLEM)&&
	(SELF.GUILD!=GIL_SWAMPSHARK)&&
	(SELF.GUILD!=GIL_TROLL))
	{
		NPC_CLEARAIQUEUE(SELF);
		AI_STARTSTATE(SELF,ZS_STUNED,0,"");
		AI_ContinueRoutine(self);
	};
};
/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_DESTROYUNDEAD()
{
	////PrintDebugNpc(PD_MAGIC,"B_assessMagicRuneSWD_Destroyundead");
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(RUNE_SLF,PERC_ASSESSFIGHTSOUND,RUNE_SLF,other);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_WINDFIST()
{
	////PrintDebugNpc(PD_MAGIC,"B_assessMagicRuneSWD_Windfist");
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(RUNE_SLF,PERC_ASSESSFIGHTSOUND,RUNE_SLF,other);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_STORMFIST()
{
	////PrintDebugNpc(PD_MAGIC,"B_assessMagicRuneSWD_Stormfist");
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(RUNE_SLF,PERC_ASSESSFIGHTSOUND,RUNE_SLF,other);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_CHARM()
{
	////PrintDebugNpc(PD_ZS_CHECK,"B_AssessMagic Charm");

	//DISABLED!
	Npc_SENDPASSIVEPERC(self,PERC_ASSESSFIGHTSOUND,RUNE_SLF,other);

	Npc_ClearAiQueue(self);	//alle Ai Befehle entfernen

	IF(!Npc_ISINSTATE(self,ZS_UNCONSCIOUS))
	{
		////PrintDebugNpc(PD_ZS_CHECK,"...NSC ist ein Mensch bei bewußtsein!");

		Npc_SETTEMPATTITUDE(self,ATT_FRIENDLY);
		Npc_ClearAiQueue(self);
		Ai_StandUpQuick(self);
		// 		IF(Npc_ISINSTATE(self,ZS_ATTACK))
		// 		{
		// 			B_SAYOVERLAY(self,other,"$LetsForgetOurLittleFight");
		// 		}
		// 		ELSE
		// 		{
		// 			B_SAY(self,other,"$FriendlyGreetings");
		// 		};
		Ai_CONTINUEROUTINE(self);
	};
};

/*******************************************************************************************
	M O V E D   F R O M   A S S E S S M A G I C . D
/*******************************************************************************************/

VAR INT NPC_FIREWALL_ORGIN;//
VAR INT GLOB_FIREWALL_BOUNCES;
CONST INT GLOB_FIREWALL_MAX_BOUNCES=6;

FUNC VOID B_ASSESSMAGIC_FIREWALL_rec(VAR INT BOUNCES,var c_npc slf,var c_npc attacker)
{

	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_FireWall");
	VAR C_NPC CASTER;
	GLOB_FIREWALL_BOUNCES=BOUNCES+1;

	//Damit andere NSCs den Angriff wahrnehmen können

	IF(BOUNCES==1)&&(!NPC_ISPLAYER(slf))&&(NPC_ISDEAD(slf))
	{
		HERO.EXP-=slf.LEVEL*30;

	}
	ELSE IF(!NPC_ISPLAYER(slf))&&(NPC_ISDEAD(slf))
	{
		HERO.EXP-=slf.LEVEL*10;
	};
	IF(NPC_ISDEAD(slf))&&(!NPC_ISPLAYER(attacker))&&(NPC_ISPLAYER(CASTER))
	{
		//TODO: THIS FUCKING THING STINK LIKE A HELL!
		Npc_SetAivar(slf,AIV_DEALDAY,7654);

	};
	CASTER=HLP_GETNPC(NPC_FIREWALL_ORGIN);
	//ofender - slf
	//victim - attacker
	NPC_MEMORYENTRY(MIRROR_MEMORY,2,slf,2,attacker);
	VAR C_NPC OTH;
	VAR INT P;
	OTH=NPC_GETNEWSVICTIM(MIRROR_MEMORY,NPC_HASNEWS(MIRROR_MEMORY,2,NULL,NULL));
	NPC_PERCEIVEALL(slf);
	WLD_DETECTNPC(slf,-1,NOFUNC,-1);

	P=0;
	// 	PRINTSCREEN(CONCATSTRINGS("1-",attacker.NAME),10+(GLOB_FIREWALL_BOUNCES*5),25+(P*3),_STR_FONT_ONSCREEN,5);
	P+=1;

	IF(NPC_ISPLAYER(other))||(NPC_ISDEAD(other))||(CMPNPC(OTH,other))//last trgt=next trgt
	{
		NPC_PERCEIVEALL(slf);
		WLD_DETECTNPCEX(slf,-1,NOFUNC,slf.GUILD,0);
		// 		PRINTSCREEN(CONCATSTRINGS("2-",attacker.NAME),10+(GLOB_FIREWALL_BOUNCES*5),25+(P*3),_STR_FONT_ONSCREEN,5);
		P+=1;
	};
	IF(NPC_ISPLAYER(other))||(NPC_ISDEAD(other))||(CMPNPC(OTH,other))
	{
		NPC_PERCEIVEALL(slf);
		WLD_DETECTNPCEX(slf,-1,ZS_ATTACK,-1,0);
		// 		PRINTSCREEN(CONCATSTRINGS("3-",attacker.NAME),10+(GLOB_FIREWALL_BOUNCES*5),25+(P*3),_STR_FONT_ONSCREEN,5);
		P+=1;
	};
	IF(NPC_ISPLAYER(other))||(CMPNPC(OTH,other))
	{
		NPC_PERCEIVEALL(slf);
		WLD_DETECTNPCEX(slf,-1,ZS_DEAD,-1,0);
		// 		PRINTSCREEN(CONCATSTRINGS("4-",attacker.NAME),10+(GLOB_FIREWALL_BOUNCES*5),25+(P*3),_STR_FONT_ONSCREEN,5);
		P+=1;
	};
	IF(CMPNPC(OTH,other))
	{
		NPC_PERCEIVEALL(slf);
		WLD_DETECTNPCEX(slf,-1,NOFUNC,slf.GUILD+1,0);
		// 		PRINTSCREEN(CONCATSTRINGS("5-",attacker.NAME),10+(GLOB_FIREWALL_BOUNCES*5),25+(P*3),_STR_FONT_ONSCREEN,5);
		P+=1;
		NPC_PERCEIVEALL(slf);
		WLD_DETECTNPCEX(slf,-1,NOFUNC,slf.GUILD-1,0);
		// 		PRINTSCREEN(CONCATSTRINGS("6-",attacker.NAME),10+(GLOB_FIREWALL_BOUNCES*5),25+(P*3),_STR_FONT_ONSCREEN,5);
		P+=1;
	};
	//Damit andere NSCs den Angriff wahrnehmen können

	//

	IF((GLOB_FIREWALL_BOUNCES!=GLOB_FIREWALL_MAX_BOUNCES)&&(!CMPNPC(OTH,other)))||((NPC_ISPLAYER(other))&&(NPC_ISPLAYER(slf)))
	{
		NPC_PERCDISABLE(other,PERC_ASSESSDAMAGE);
		NPC_PERCDISABLE(slf,PERC_ASSESSDAMAGE);
		NPC_PERCDISABLE(other,PERC_ASSESSCASTER);
		NPC_PERCDISABLE(slf,PERC_ASSESSCASTER);
		NPC_PERCENABLE(other,PERC_ASSESSMAGIC,B_ASSESSMAGIC);
		NPC_PERCENABLE(slf,PERC_ASSESSMAGIC,B_ASSESSMAGIC);

		NPC_CLEARAIQUEUE(slf);
		WLD_PLAYEFFECT("spellFX_FireWall",slf,other,1,3*SPL_DAMAGE_FIREWALL,DAM_MAGIC,TRUE);
	}
	ELSE IF(GLOB_FIREWALL_BOUNCES!=GLOB_FIREWALL_MAX_BOUNCES)
	{
		NPC_CLEARAIQUEUE(slf);
		WLD_PLAYEFFECT("spellFX_FireWall",slf,other,1,3*SPL_DAMAGE_FIREWALL,DAM_MAGIC,TRUE);

	}
	ELSE
	{
		GLOB_FIREWALL_BOUNCES=0;
	};
	IF(!NPC_ISDEAD(slf))
	{
		//B_FullStop 		(slf);
		AI_WAIT(slf,1);
		//AI_StartState	(slf, ZS_MultiMissled, 0, "");
	};
	//Attack hero
	NPC_SENDPASSIVEPERC(slf,PERC_ASSESSFIGHTSOUND,slf,CASTER);

};


//original func used by assesMagic too
func void B_ASSESSMAGIC_FIREWALL(VAR INT BOUNCES)
{
 	B_ASSESSMAGIC_FIREWALL_rec(BOUNCES,self,other);	
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_SLEEP()
{
	////PrintDebugNpc(PD_MAGIC,"...Sleep");
	Npc_ClearAiQueue(self);
	Npc_PERCDISABLE(self,PERC_ASSESSCASTER);
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(self,PERC_ASSESSFIGHTSOUND,self,other);
	IF(!Npc_ISDEAD(self)&& !Npc_ISINSTATE(self,ZS_UNCONSCIOUS))
	{
		////PrintDebugNpc(PD_MAGIC,"...weder bewußtlos noch tot!");
		Ai_STARTSTATE(self,ZS_MAGICSLEEP,1,"");
	};
};
/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_PYROKINESIS(var c_npc slf)
{
	////PrintDebugNpc(PD_MAGIC,"...Pyrokinesis");
	Npc_ClearAiQueue(slf);
	Npc_PERCDISABLE(slf,PERC_ASSESSCASTER);
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(slf,PERC_ASSESSFIGHTSOUND,slf,other);
	IF(!Npc_ISDEAD(slf)&& !Npc_ISINSTATE(slf,ZS_UNCONSCIOUS))
	{
		////PrintDebugNpc(PD_MAGIC,"...weder bewußtlos noch tot!");
		Npc_ClearAiQueue(slf);
		Ai_StandUpQuick(slf);
		Ai_STARTSTATE(slf,ZS_PyroRS,0,"");
	};
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGICRUNESWD_BREATHOFDEATH()
{
	////PrintDebugNpc(PD_MAGIC,"B_assessMagicRuneSWD_Breathofdeath");
	//Damit andere NSCs den Angriff wahrnehmen können
	Npc_SENDPASSIVEPERC(self,PERC_ASSESSFIGHTSOUND,self,other);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_RUNESWD()
{

	VAR C_Npc RUNENOW;
	RUNENOW	=HLP_GETNpc(RUNESWORD_NOW);
// 	IF(RUNESWD_EXP==ITARRUNEFIREBOLT){	B_ASSESSMAGICRUNESWD_FIREBOLT();	}
// 	ELSE IF(RUNESWD_EXP==ITARRUNEFIREBALL){	B_ASSESSMAGICRUNESWD_FIREBALL();	}
// 	ELSE IF(RUNESWD_EXP==ITARRUNEFIRESTORM){	B_ASSESSMAGICRUNESWD_FIRESTORM();	}
// 	ELSE IF(RUNESWD_EXP==ITARRUNEFIRERAiN){	B_ASSESSMAGICRUNESWD_FIRERAiN();	}

// Reason: no assesMagic sent
//	ELSE IF(RUNESWD_EXP==ITARRUNEHOLYFIRE){	B_ASSESSMAGICRUNESWD_HOLYFIRE();	}
	IF(RUNESWD_EXP==RuneID_ICECUBE			){	B_ASSESSMAGICRUNESWD_ICECUBE(self);	}
	ELSE IF(RUNESWD_EXP==RuneID_ICEWAVE)	{	B_ASSESSMAGICRUNESWD_ICECUBE(self);	}
	ELSE IF(RUNESWD_EXP==RuneID_StuningBall){	B_ASSESSMAGIC_STUNINGBALL();	}
	ELSE IF(RUNESWD_EXP==RuneID_Sleep)		{	B_ASSESSMAGICRUNESWD_SLEEP();	}
	
	ELSE IF(RUNESWD_EXP==RuneID_Chainlightning){	B_ASSESSMAGICRUNESWD_CHAiNLIGHTNING(self);	}
	ELSE IF(RUNESWD_EXP==RuneID_THUNDERBALL){	B_ASSESSMAGICRUNESWD_THUNDERBALL();	}

	ELSE IF(RUNESWD_EXP==ITARRUNEDESTROYUNDEAD){	B_ASSESSMAGICRUNESWD_DESTROYUNDEAD();	}

	ELSE IF(RUNESWD_EXP==ITARRUNEWINDFIST){	B_ASSESSMAGICRUNESWD_WINDFIST();	}
	ELSE IF(RUNESWD_EXP==ITARRUNESTORMFIST){	B_ASSESSMAGICRUNESWD_STORMFIST();	}
	//else if (RuneSWD_exp==ItArRuneCharm) 		{	B_assessMagicRuneSWD_Charm			();	}
	//else if (RuneSWD_exp==ItArRuneSleep) 		{	B_assessMagicRuneSWD_Sleep			();	}
	ELSE IF(RUNESWD_EXP==ITARRUNEBREATHOFDEATH){	B_ASSESSMAGICRUNESWD_BREATHOFDEATH();	};
	

};


//*******************************************************
//****  R U N E S W O R D  R U N E S  H A N D L E  ******
//****  R U N E S W O R D  R U N E S  H A N D L E  ******
//****  R U N E S W O R D  R U N E S  H A N D L E  ******
//*******************************************************
//runesword runes handle

func int RS_HasRSInInventory()
{
	var int ret;
	ret = 0;
   
	if ((Npc_HasItems(hero,ItMw_1H_RuneSWD_01)) || (Npc_HasItems(hero,ItMw_1H_RuneSWD_DARK)) || (Npc_HasItems(hero,ItMw_1H_RuneSWD_FIRE))
   || (Npc_HasItems(hero,ItMw_1H_RuneSWD_LIGHT)) || (Npc_HasItems(hero,ItMw_1H_RuneSWD_WATER)))
	{
		ret = 1;
	}
	else if(Npc_HasItems(hero,ItMw_1H_RuneSWD_PSI))
	{
		ret = 2;
	};	
	
	if ((Npc_HasItems(hero,ItMw_2h_RuneSWD_01)) || (Npc_HasItems(hero,ItMw_2h_RuneSWD_DARK)) || (Npc_HasItems(hero,ItMw_2h_RuneSWD_FIRE))
   || (Npc_HasItems(hero,ItMw_2h_RuneSWD_LIGHT)) || (Npc_HasItems(hero,ItMw_2h_RuneSWD_WATER)) || (Npc_HasItems(hero,ItMw_2h_RuneSWD_PSI)))
	{
		ret = 2;
	};
		
	return ret;	
};

func VOID EVT_RUNESWD_CHARGING()
{
	if(RuneCharge<RuneChargeMax)
	{
		RuneCharge=RuneCharge+2;
		if(RuneCharge>=RuneChargeMax)
		{
			RuneCharge=RuneChargeMax;	
		};	
	};
};

func void RUNESWD_DMG_TRIGGER_FUNC()
{
	var C_Npc runenow;
	runenow				=	Hlp_GetNpc(RuneSword_Now);	
	//B_SpellHurtNpc (RUNE_SLF,RUNE_ATTACKER,RuneSWD_voice,RuneSWD_Npctype);
};
// Called by B_SpecialCombatDamageReaciton
func void B_SpecialDmg_RuneSword(var C_Npc slf,var C_Npc attacker)
{
	var C_ITEM readyweap;
	readyweap = Npc_GetReadiedWeapon(attacker);	
	RuneSwdSendAssesMagic=TRUE;	
	if (
			(
				(Hlp_IsItem(readyweap,ItMw_1H_RuneSWD_01))||
				(Hlp_IsItem(readyweap,ItMw_1H_RuneSWD_FIRE))||
				(Hlp_IsItem(readyweap,ItMw_1H_RuneSWD_DARK))||
				(Hlp_IsItem(readyweap,ItMw_1H_RuneSWD_LIGHT))||
				(Hlp_IsItem(readyweap,ItMw_1H_RuneSWD_WATER))||
				(Hlp_IsItem(readyweap,ItMw_1H_RuneSWD_PSI))
				
				)
			||//OR 2H
			(
				(Hlp_IsItem(readyweap,ItMw_2H_RuneSWD_01))||
				(Hlp_IsItem(readyweap,ItMw_2H_RuneSWD_FIRE))||
				(Hlp_IsItem(readyweap,ItMw_2H_RuneSWD_DARK))||
				(Hlp_IsItem(readyweap,ItMw_2H_RuneSWD_LIGHT))||
				(Hlp_IsItem(readyweap,ItMw_2H_RuneSWD_WATER))||
				(Hlp_IsItem(readyweap,ItMw_2H_RuneSWD_PSI))
				)
			)//&&((C_BodyStateContAins(slf,BS_STUMBLE))||(C_BodyStateContAins(slf,BS_STUMBLE))||(C_BodyStateContAins(slf,BS_STUMBLE)))
	{
//		if(slf.attribute[ATR_HITPOINTS]>0)
//		{							
			//slf.attribute[ATR_HITPOINTS]+=40;
			if (Npc_GetBodyState(hero)==32794)&&(DontSendCritical!=TRUE)/*&&(!C_NpcIsDown(self))*/&&(RuneCharge-RuneSWD_flags>0)&&(Hlp_Random(100)<RuneSwdCriticalChance)&&(RuneSWD_exp!=0)&&(RuneSWD_exp!=RuneID_Light)//&&(Critical_LastHitID!=HeroDamage_DamageID
			{
				RuneCharge=RuneCharge-RuneSWD_flags;	
				Critical_LastHitID=HeroDamage_DamageID;
				RuneSwd_User = Hlp_GetInstanceID(attacker);
				
				print("Critical!");
				
				/*AoE*/						if (RuneSWD_exp==RuneID_Firestorm)	{RuneSwdSendAssesMagic=FALSE; 	attacker.flags			= Npc_FLAG_IMMORTAL; Wld_PlayEffect(RuneSWD_slot, attacker, slf, 1, RuneSWD_voice, RuneSWD_Npctype, 0);	attacker.flags			= 0;} 
				
				/*ZSDmgOnAssesMagic*/		else if (RuneSWD_exp==RuneID_Thunderball)	{B_SpellHurtNpc (slf,attacker,RuneSWD_voice,RuneSWD_Npctype); Wld_PlayEffect(RuneSWD_slot, attacker, slf, 0, 1, RuneSWD_Npctype, 1);} 
				/*ZSDmgOnAssesMagic*/		else if (RuneSWD_exp==RuneID_Thunder)	{B_SpellHurtNpc (slf,attacker,RuneSWD_voice,RuneSWD_Npctype); Wld_PlayEffect(RuneSWD_slot, slf, slf, 0, 1, RuneSWD_Npctype, 1);} 
				/*ZSDmgOnAssesMagic*/		else if (RuneSWD_exp==RuneID_Icecube)	{ B_SpellHurtNpc (slf,attacker,RuneSWD_voice,RuneSWD_Npctype); Wld_PlayEffect(RuneSWD_slot, attacker, slf, 0, 1, RuneSWD_Npctype, 1); B_ASSESSMAGICRUNESWD_ICECUBE(slf);} 
				/*ZSDmgOnAssesMagic*/		else if (RuneSWD_exp==RuneID_FireWall)		
				{
					npc_firewall_orgin=Hlp_GetInstanceID(attacker);
					glob_firewall_bounces=0;
					B_SpellHurtNpc (slf,attacker,RuneSWD_voice,RuneSWD_Npctype); 
					B_ASSESSMAGIC_FIREWALL_rec(0,slf,attacker);		
					Wld_PlayEffect(RuneSWD_slot, attacker, slf, 0, 1, RuneSWD_Npctype, 1);
				} 
				/*NoDmg*/else if (RuneSWD_exp==RuneID_StuningBall)	
            {	
               Wld_PlayEffect(RuneSWD_slot, attacker, slf, 1, 1, 2, 1);
            } 
				/*AoE*/else if (RuneSWD_exp==RuneID_IceWave)	
            {
               Wld_PlayEffect(RuneSWD_slot, attacker, slf, 1, RuneSWD_voice, RuneSWD_Npctype, 1);
            } 
				/*AoE*/else if (RuneSWD_exp==RuneID_Meteor)		
            {	
					Wld_PlayEffect(RuneSWD_slot, attacker, slf, 2, RuneSWD_voice, RuneSWD_Npctype, 1);	
					Wld_PlayEffect("spellFX_Meteor_REDGLOW",attacker,slf,2,0,200,1);	
					Wld_PlayEffect("spellFX_Meteor_SMOKE",attacker,slf,2,1,DAM_FLY,1);	
					//Wld_PlayEffect("spellFX_INVISIBLEDMG_Fireball", attacker, slf, 2, 200, DAM_FIRE, TRUE);			 	
				} 
				//life drain
				else if (RuneSWD_exp==RuneID_LifeDrain)		
            {
					Wld_PlayEffect(RuneSWD_slot, slf, slf, 0, 0, 0, 0);	
					Wld_PlayEffect("spellFX_LifeDrain_INCOME",attacker,attacker,2,0,0,0);
               
					const int hp_stole = 75;
					const int hp_income = 37;
               
					if(attacker.attribute[ATR_HITPOINTS]+hp_income<=attacker.attribute[ATR_HITPOINTS_MAX])
					{
                  attacker.attribute[ATR_HITPOINTS]+=hp_income;
               }
					else if(attacker.attribute[ATR_HITPOINTS]+hp_income>attacker.attribute[ATR_HITPOINTS_MAX])
					{
                  attacker.attribute[ATR_HITPOINTS]=attacker.attribute[ATR_HITPOINTS_MAX];
               };		
					
					if(slf.attribute[ATR_HITPOINTS]-hp_stole>=1)
					{
                  slf.attribute[ATR_HITPOINTS]-=hp_stole;
               }
					else if(slf.attribute[ATR_HITPOINTS]-hp_stole<1)
					{
                  slf.attribute[ATR_HITPOINTS]=1; Npc_ClearAiQueue(slf);
               };					
				} /*SpecialDmgOnAssesMagic*/
				else if (RuneSWD_exp==RuneID_Destroyundead)
            {	
               if(C_Npcisundead(slf))	
					{
                  B_SpellHurtNpc (slf,attacker,RuneSWD_voice,RuneSWD_Npctype); 
                  Wld_PlayEffect(RuneSWD_slot, slf, attacker, 0, 1, RuneSWD_Npctype, 1);
               };	
            } //ItArRuneThunder	/*AoE*/						
            else if (RuneSWD_exp==RuneID_Stormfist)	
            {
               RuneSwdSendAssesMagic=FALSE; 	
               attacker.flags	= Npc_FLAG_IMMORTAL; 
               Wld_PlayEffect(RuneSWD_slot, attacker, attacker, 1, RuneSWD_voice, RuneSWD_Npctype, 0);	
               attacker.flags	= 0;
             } 
//Disabled, problem with working/*NoDMG*/					else if (RuneSWD_exp==RuneID_Sleep) 		{Wld_PlayEffect(RuneSWD_slot, slf, attacker, 0, 1, DAM_MAGIC, 0);	}
				/*NormalDmgOnAssesMagic*/	else if (RuneSWD_exp==RuneID_Windfist)		{ RuneSwdSendAssesMagic=FALSE; 	 B_SpellHurtNpc (slf,attacker,RuneSWD_voice,RuneSWD_Npctype); B_SpellHurtNpc (slf,attacker,RuneSWD_voice,RuneSWD_Npctype);  Wld_PlayEffect(RuneSWD_slot, slf, slf, 1, 0, RuneSWD_Npctype, 0);		/*B_AssessMagic_Windfist			();	*/} 		
				/*NoDMG*/					else if (RuneSWD_exp==RuneID_Heal) 		{ return;}
				/*AoE*/						else if (RuneSWD_exp==RuneID_FireRain)		{RuneSwdSendAssesMagic=FALSE; 	attacker.flags			= Npc_FLAG_IMMORTAL; Wld_PlayEffect(RuneSWD_slot, attacker, attacker, 1, RuneSWD_voice, RuneSWD_Npctype, 0);	attacker.flags			= 0;} 			
				/*ZSDmgOnAssesMagic*/	else if (RuneSWD_exp==RuneID_Chainlightning)
				{
					B_SpellHurtNpc (slf,attacker,RuneSWD_voice,RuneSWD_Npctype); 
					Wld_PlayEffect(RuneSWD_slot, slf, slf, 0, 1, RuneSWD_Npctype, 0); 
					B_ASSESSMAGICRUNESWD_CHAiNLIGHTNING(slf);
				} 
				/*ItArRuneHolyFire*/		else if (RuneSWD_exp==RuneID_HolyFire) 		
            {
					B_ASSESSMAGICRUNESWD_HOLYFIRE(attacker,slf);	RuneSwdSendAssesMagic=FALSE;	
					Wld_PlayEffect(RuneSWD_slot, slf, slf, 0, 1, RuneSWD_Npctype, 1);
				}
				/*ZSDmgOnAssesMagic*/	else if (RuneSWD_exp==RuneID_Pyrokinesis) 		{ B_AssessMagicRuneSWD_Pyrokinesis	(slf);	RuneSwdSendAssesMagic=FALSE;	Wld_PlayEffect(RuneSWD_slot, slf, slf, 0, 1, RuneSWD_Npctype, 1);}
				/*ZSDmgOnAssesMagic*/	else if (RuneSWD_exp==RuneID_Curse) 		{RuneSwdSendAssesMagic=FALSE;	Wld_PlayEffect(RuneSWD_slot, slf, slf, 0, 1, RuneSWD_Npctype, 1);  add_Curse(slf, slf);}
				else	
				{
					Wld_PlayEffect(RuneSWD_slot, attacker, slf, 0, 1, RuneSWD_Npctype, 1);
					B_SpellHurtNpc (slf,attacker,RuneSWD_voice,RuneSWD_Npctype);
				};
				//BugFiX
				
				DontSendCritical=TRUE;
			};
//		}; // Hitpoints > 0
	};
};

func void RS_ExchangeSwd_Part1(var int Type)
{
	var int tmp_RUNE_SWD_EQUIPED;
	tmp_RUNE_SWD_EQUIPED = RUNE_SWD_EQUIPED;
   
	if(RUNE_SWD_EQUIPED==1)
	{
		if(Npc_HasItems(hero,ItMw_1H_RuneSWD_01))
		{
			Npc_RemoveInvItem(hero,ItMw_1H_RuneSWD_01);
		}
		if(Npc_HasItems(hero,ItMw_1H_RuneSWD_DARK))
		{
			Npc_RemoveInvItem(hero,ItMw_1H_RuneSWD_DARK);			
		};		
		if(Npc_HasItems(hero,ItMw_1H_RuneSWD_FIRE))
		{
			Npc_RemoveInvItem(hero,ItMw_1H_RuneSWD_FIRE);			
		};
		if(Npc_HasItems(hero,ItMw_1H_RuneSWD_LIGHT))
		{
			Npc_RemoveInvItem(hero,ItMw_1H_RuneSWD_LIGHT);			
		};
		if(Npc_HasItems(hero,ItMw_1H_RuneSWD_WATER))
		{
			Npc_RemoveInvItem(hero,ItMw_1H_RuneSWD_WATER);			
		};
		if(Npc_HasItems(hero,ItMw_1H_RuneSWD_PSI))
		{
			Npc_RemoveInvItem(hero,ItMw_1H_RuneSWD_PSI);			
		};					
	}
	else if(RUNE_SWD_EQUIPED==2)
	{
		if(Npc_HasItems(hero,ItMw_2h_RuneSWD_01))
		{
			Npc_RemoveInvItem(hero,ItMw_2h_RuneSWD_01);
		};
		if(Npc_HasItems(hero,ItMw_2h_RuneSWD_DARK))
		{
			Npc_RemoveInvItem(hero,ItMw_2h_RuneSWD_DARK);			
		};		
		if(Npc_HasItems(hero,ItMw_2h_RuneSWD_FIRE))
		{
			Npc_RemoveInvItem(hero,ItMw_2h_RuneSWD_FIRE);			
		};
		if(Npc_HasItems(hero,ItMw_2h_RuneSWD_LIGHT))
		{
			Npc_RemoveInvItem(hero,ItMw_2h_RuneSWD_LIGHT);			
		};
		if(Npc_HasItems(hero,ItMw_2h_RuneSWD_WATER))
		{
			Npc_RemoveInvItem(hero,ItMw_2h_RuneSWD_WATER);			
		};
		if(Npc_HasItems(hero,ItMw_2h_RuneSWD_PSI))
		{
			Npc_RemoveInvItem(hero,ItMw_2h_RuneSWD_PSI);			
		};				
	};
	RUNE_SWD_EQUIPED = tmp_RUNE_SWD_EQUIPED;

	if(RUNE_SWD_EQUIPED==1)
	{
		if(Type==0)
		{
			CreateInvItem(hero,ItMw_1H_RuneSWD_01);		
			B_EquipItem(hero,ItMw_1H_RuneSWD_01);	
		}
		else if(Type==1)
		{
			CreateInvItem(hero,ItMw_1H_RuneSWD_DARK);		
			B_EquipItem(hero,ItMw_1H_RuneSWD_DARK);		
		}
		else if(Type==2)
		{
			CreateInvItem(hero,ItMw_1H_RuneSWD_FIRE);		
			B_EquipItem(hero,ItMw_1H_RuneSWD_FIRE);		
		}	
		else if(Type==3)
		{
			CreateInvItem(hero,ItMw_1H_RuneSWD_LIGHT);		
			B_EquipItem(hero,ItMw_1H_RuneSWD_LIGHT);	
		}	
		else if(Type==4)
		{
			CreateInvItem(hero,ItMw_1H_RuneSWD_WATER);		
			B_EquipItem(hero,ItMw_1H_RuneSWD_WATER);								
		}	
		else if(Type==5)
		{
			CreateInvItem(hero,ItMw_1H_RuneSWD_PSI);		
			B_EquipItem(hero,ItMw_1H_RuneSWD_PSI);		
		}	
		else if(Type==6)
		{
			CreateInvItem(hero,ItMw_1H_RuneSWD_PSI);		
			B_EquipItem(hero,ItMw_1H_RuneSWD_PSI);								
		}	
		else
		{
			CreateInvItem(hero,ItMw_1H_RuneSWD_WATER);		
			B_EquipItem(hero,ItMw_1H_RuneSWD_WATER);					
		};
	}	
	else if(RUNE_SWD_EQUIPED==2)
	{
		if(Type==0)
		{
			CreateInvItem(hero,ItMw_2H_RuneSWD_01);		
			B_EquipItem(hero,ItMw_2H_RuneSWD_01);	
		}
		else if(Type==1)
		{
			CreateInvItem(hero,ItMw_2H_RuneSWD_DARK);		
			B_EquipItem(hero,ItMw_2H_RuneSWD_DARK);		
		}
		else if(Type==2)
		{
			CreateInvItem(hero,ItMw_2H_RuneSWD_FIRE);		
			B_EquipItem(hero,ItMw_2H_RuneSWD_FIRE);		
		}	
		else if(Type==3)
		{
			CreateInvItem(hero,ItMw_2H_RuneSWD_LIGHT);		
			B_EquipItem(hero,ItMw_2H_RuneSWD_LIGHT);	
		}	
		else if(Type==4)
		{
			CreateInvItem(hero,ItMw_2H_RuneSWD_WATER);		
			B_EquipItem(hero,ItMw_2H_RuneSWD_WATER);								
		}	
		else if(Type==5)
		{
			CreateInvItem(hero,ItMw_2H_RuneSWD_PSI);		
			B_EquipItem(hero,ItMw_2H_RuneSWD_PSI);		
		}	
		else if(Type==6)
		{
			CreateInvItem(hero,ItMw_2H_RuneSWD_PSI);		
			B_EquipItem(hero,ItMw_2H_RuneSWD_PSI);								
		}	
		else
		{
			CreateInvItem(hero,ItMw_2H_RuneSWD_WATER);		
			B_EquipItem(hero,ItMw_2H_RuneSWD_WATER);					
		};
	};		
};

//Changing runeID => ItemID 
func int RuneIDtoItemID(var int RuneID)
{	
	if(RuneID==RuneID_Light	 	 ) { return ItArRuneLight; }     
	else if(RuneID==RuneID_FireBolt	 	 ) { return ItArRuneFireBolt; }  
	else if(RuneID==RuneID_ThunderBolt	 ) { return ItArRuneThunderBolt; } 

	else if(RuneID==RuneID_Sleep	 	 ) { return ItArRuneSleep; }     
	else if(RuneID==RuneID_WindFist	 	 ) { return ItArRuneWindFist; }  
	else if(RuneID==RuneID_Heal	 		 ) { return ItArRuneHeal; }     
	else if(RuneID==RuneID_StuningBall	 ) { return ItArRuneStuningBall; } 

	else if(RuneID==RuneID_IceCube	 	 ) { return ItArRuneIceCube; }   
	else if(RuneID==RuneID_ThunderBall	 ) { return ItArRuneThunderBall; } 
	else if(RuneID==RuneID_Charm		 ) { return ItArRuneCharm; }      
	else if(RuneID==RuneID_Pyrokinesis	 ) { return ItArRunePyrokinesis; } 
	else if(RuneID==RuneID_FireBall	 	 ) { return ItArRuneFireBall; }  
	else if(RuneID==RuneID_FireWall	 	 ) { return ItArRuneFireWall; }  
	else if(RuneID==RuneID_LifeDrain	 ) { return ItArRuneLifeDrain; }   
	else if(RuneID==RuneID_Curse	 	 ) { return ItArRuneCurse; }     

	else if(RuneID==RuneID_ChainLightning) { return ItArRuneChainLightning; } 
	else if(RuneID==RuneID_FireStorm	 ) { return ItArRuneFireStorm; }   
	else if(RuneID==RuneID_stormfist	 ) { return ItArRunestormfist; }   
	else if(RuneID==RuneID_destroyundead ) { return ItArRunedestroyundead; } 
	else if(RuneID==RuneID_HolyFire	 	 ) { return ItArRuneHolyFire; }  

	else if(RuneID==RuneID_IceWave	 	 ) { return ItArRuneIceWave; }   
	else if(RuneID==RuneID_FireRain	 	 ) { return ItArRuneFireRain; }  
	else if(RuneID==RuneID_Thunder	 	 ) { return ItArRuneThunder; }   

	else if(RuneID==RuneID_BreathofDeath ) { return ItArRuneBreathofDeath; } 
	else if(RuneID==RuneID_Meteor	 	 ) { return ItArRuneMeteor; };    
		
	return 0;	
};

const int runeManaToRuneSwdMana_Scale = 4;
// f.e if rune mana needed = 40 then rswd mana = 40/4 = 10;
func void RS_TransferToUsingRune(var C_Npc rune)
{
	//check conditions:
	var int needed_circle;
	needed_circle = RuneIDtoItemID(rune.exp);
	Npc_GetInvItem(hero,needed_circle);
	needed_circle = item.mag_circle;
   
	if(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE)<needed_circle)&&(!TALENT_RUNESWORDUSING)
	{
      G_CanNotCast(true,needed_circle,Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE));
      return;	
	};
	
	if(RuneSWD_exp!=0)//Some rune equiped
	{
		CreateInvItem(hero,RuneIDtoItemID(RuneSWD_exp));			
	};
   
	RuneSWD_name		=	"";
	RuneSWD_slot		=	"";
	RuneSWD_spawnPoint	=	"";
	RuneSWD_wp			=	"";
	RuneSWD_exp 			= 	0;
	RuneSWD_flags		=	0;
	RuneSWD_voice		=	0;
	RuneSWD_lp			=	0;
	RuneSWD_Npctype		=	0;
	//assigment new atributes
	RuneSWD_exp 		= 	rune.exp;
	RuneSWD_name		=	rune.name;
	RuneSWD_slot		=	rune.slot;	
	RuneSWD_spawnPoint	=	rune.spawnpoint;
	RuneSWD_wp			=	rune.wp;
	RuneSWD_flags		=	rune.flags/runeManaToRuneSwdMana_Scale;	
	RuneSWD_flags 		= 	RuneSWD_flags - (RuneSWD_flags%1);
	RuneSWD_voice		=	rune.voice;
	RuneSWD_lp			=	rune.lp;	
	RuneSWD_Npctype		=	rune.Npctype;
	Npc_RemoveInvItem(hero,RuneIDtoItemID(rune.exp));	
	
	RS_ExchangeSwd_Part1(RuneSWD_lp);
};

func void RS_PrintActualRuneAttribs()
{
	printdebug_s_i("Runesword_Rune.exp = ",RuneSWD_exp);
	printdebug_ss("Runesword_Rune.name = ",RuneSWD_name);
	printdebug_ss("Runesword_Rune.slot = ",RuneSWD_slot);
	printdebug_ss("Runesword_Rune.spawnPoint = ",RuneSWD_spawnPoint);
	printdebug_ss("Runesword_Rune.wp = ",RuneSWD_wp);
	printdebug_s_i("Runesword_Rune.flags = ",RuneSWD_flags);
	printdebug_s_i("Runesword_Rune.voice = ",RuneSWD_voice);
	printdebug_s_i("Runesword_Rune.lp = ",RuneSWD_lp);
	printdebug_s_i("Runesword_Rune.Npctype = ",RuneSWD_Npctype);
};

func void RS_PlayAuraOnSwdReady(var int RuneType)//On Equip
{
	if(RUNE_SWD_EQUIPED==1)
	{
		if(RuneType==0)
		{
			//Neutral, no VFX	
		}
		else if(RuneType==1)
		{
			Wld_PlayEffect("ItemFX_DarkAura1HReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_DarkAura1H_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_DarkAura1H_3_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_DarkAura1H_4_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
		}
		else if(RuneType==2)
		{
			Wld_PlayEffect("ItemFX_FireAura1HReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_FireAura1H_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_FireAura1H_3_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_FireAura1H_4_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);						
		}	
		else if(RuneType==3)
		{
			Wld_PlayEffect("ItemFX_LightAura1HReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_LightAura1H_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);							
			Wld_PlayEffect("ItemFX_LightAura1H_3_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);							
		}	
		else if(RuneType==4)
		{					
			Wld_PlayEffect("ItemFX_WaterAura1HReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_WaterAura1H_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WaterAura1H_3_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_WaterAura1H_4_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
		}	
		else if(RuneType==5)
		{
			Wld_PlayEffect("ItemFX_WindAura1HReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);	
			Wld_PlayEffect("ItemFX_WindAura1H_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WindAura1H_3_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			
		}	
		else if(RuneType==6)
		{					
			Wld_PlayEffect("ItemFX_PSIAura1hReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);				
			Wld_PlayEffect("ItemFX_PSIAura1h_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);				
		}	
		else if(RuneType==7)
		{						
			Wld_PlayEffect("ItemFX_HEALAura1hReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_WaterAura1H_4_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
		};
	}	
	else if(RUNE_SWD_EQUIPED==2)
	{
		if(RuneType==0)
		{
			//Neutral, no VFX	
		}
		else if(RuneType==1)
		{
			Wld_PlayEffect("ItemFX_DarkAura2HReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);	
			Wld_PlayEffect("ItemFX_DarkAura2H_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_DarkAura2H_3_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);						
			Wld_PlayEffect("ItemFX_DarkAura2H_4_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);						
		}
		else if(RuneType==2)
		{
			Wld_PlayEffect("ItemFX_FireAura2HReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);	
			Wld_PlayEffect("ItemFX_FireAura2H_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_FireAura2H_3_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);	
			Wld_PlayEffect("ItemFX_FireAura2H_4_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);								
			
		}	
		else if(RuneType==3)
		{
			Wld_PlayEffect("ItemFX_LightAura2HReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_LightAura2H_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_LightAura2H_3_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			
		}	
		else if(RuneType==4)
		{						
			Wld_PlayEffect("ItemFX_WaterAura2HReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_WaterAura2H_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WaterAura2H_3_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WaterAura2H_4_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			
		}	
		else if(RuneType==5)
		{
			Wld_PlayEffect("ItemFX_WindAura2HReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);	
			Wld_PlayEffect("ItemFX_WindAura2H_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WindAura2H_3_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			
		}	
		else if(RuneType==6)
		{				
			Wld_PlayEffect("ItemFX_PSIAura2hReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_PSIAura2h_2_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
		}	
		else if(RuneType==7)
		{						
			Wld_PlayEffect("ItemFX_HEALAura2hReady", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_WaterAura2H_4_Ready", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
		};
	};														
};
func void RS_PlayAuraOnSwdEquip(var int RuneType)//On Equip
{
	if(RUNE_SWD_EQUIPED==1)
	{
		if(RuneType==0)
		{
			//Neutral, no VFX	
		}
		else if(RuneType==1)
		{
			Wld_PlayEffect("ItemFX_DarkAura1HEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_DarkAura1H_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_DarkAura1H_3_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_DarkAura1H_4_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
		}
		else if(RuneType==2)
		{
			Wld_PlayEffect("ItemFX_FireAura1HEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_FireAura1H_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_FireAura1H_3_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);					
			Wld_PlayEffect("ItemFX_FireAura1H_4_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);					
		}	
		else if(RuneType==3)
		{
			Wld_PlayEffect("ItemFX_LightAura1HEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_LightAura1H_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_LightAura1H_3_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
		}	
		else if(RuneType==4)
		{					
			Wld_PlayEffect("ItemFX_WaterAura1HEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WaterAura1H_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WaterAura1H_3_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);					
			Wld_PlayEffect("ItemFX_WaterAura1H_4_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);					
		}	
		else if(RuneType==5)
		{
			Wld_PlayEffect("ItemFX_WindAura1HEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);	
			Wld_PlayEffect("ItemFX_WindAura1H_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WindAura1H_3_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			
		}	
		else if(RuneType==6)
		{					
			Wld_PlayEffect("ItemFX_PSIAura1hEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);					
			Wld_PlayEffect("ItemFX_PSIAura1h_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);					
		}	
		else if(RuneType==7)
		{					
			Wld_PlayEffect("ItemFX_HEALAura1hEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);					
			Wld_PlayEffect("ItemFX_WaterAura1H_4_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);					
		};
	}	
	else if(RUNE_SWD_EQUIPED==2)
	{
		if(RuneType==0)
		{
			//Neutral, no VFX	
		}
		else if(RuneType==1)
		{
			Wld_PlayEffect("ItemFX_DarkAura2HEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_DarkAura2H_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_DarkAura2H_3_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);						
			Wld_PlayEffect("ItemFX_DarkAura2H_4_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);						
			
		}
		else if(RuneType==2)
		{
			Wld_PlayEffect("ItemFX_FireAura2HEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_FireAura2H_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_FireAura2H_3_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_FireAura2H_4_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);					
			
		}	
		else if(RuneType==3)
		{
			Wld_PlayEffect("ItemFX_LightAura2HEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);		
			Wld_PlayEffect("ItemFX_LightAura2H_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_LightAura2H_3_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			
		}	
		else if(RuneType==4)
		{						
			Wld_PlayEffect("ItemFX_WaterAura2HEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WaterAura2H_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WaterAura2H_3_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WaterAura2H_4_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			
		}	
		else if(RuneType==5)
		{
			Wld_PlayEffect("ItemFX_WindAura2HEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);	
			Wld_PlayEffect("ItemFX_WindAura2H_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);	
			Wld_PlayEffect("ItemFX_WindAura2H_3_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);	
		}	
		else if(RuneType==6)
		{				
			Wld_PlayEffect("ItemFX_PSIAura2hEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);					
			Wld_PlayEffect("ItemFX_PSIAura2h_2_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);					
		}	
		else if(RuneType==7)
		{						
			Wld_PlayEffect("ItemFX_HEALAura2hEquip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
			Wld_PlayEffect("ItemFX_WaterAura2H_4_Equip", hero, hero, 1, 0, DAM_MAGIC, FALSE);			
		};
	};														
};

func void RS_Heal()
{
	var C_Npc runenow;
	runenow		=	Hlp_GetNpc(RuneSword_Now);	
	if(RuneCharge>=2)&&(hero.attribute[ATR_HITPOINTS]+10<=hero.attribute[ATR_HITPOINTS_MAX])&&(hero.attribute[ATR_HITPOINTS]>1)
	{
		RuneCharge=RuneCharge-2;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS]+10;
		Wld_PlayEffect("RuneSwd_hero_HealAura", hero, hero, 1, 0, DAM_MAGIC, FALSE);				
	};
};
func void RuneSwdUnEquip()
{
	RUNE_SWD_EQUIPED=FALSE;
};

func void RuneSwd1hUse()
{
	// 	MOBSIDIALOG=RUNESWD1HDIALOG;
	// 	Rune_dialog=RuneSwd_SetRuneAndEquip;			
	// 	hero_Important=TRUE;	
	// 	B_ProcessInfos (hero);
	RUNE_SWD_EQUIPED = 1;
};

func void RuneSwd2hUse()
{
	RUNE_SWD_EQUIPED = 2;
};

FUNC VOID EVT_TRIGGER3 ()
{//SWORD VFX EFFECT
	var C_ITEM weap; var int ready;
	if(Npc_HasEquippedMeleeWeapon(hero))
	{
		weap = Npc_GetEquippedMeleeWeapon(hero);	
		ready=0;
	};	
	if(Npc_HasReadiedMeleeWeapon(hero))
	{
		weap = Npc_GetReadiedWeapon(hero);	
		ready=1;	
	};
	if(Hlp_IsValidItem(weap))&&(weap.makingmob==1010)
	{
		// TODO: Correct it		
		// 		if	(Hlp_IsItem(weap,ItMw_1H_RuneSWD_01))
		// 		{
		// 			RUNE_SWD_EQUIPED=1;
		// 		}
		// 		else if	(Hlp_IsItem(weap,ItMw_2H_RuneSWD_01))
		// 		{
		// 			RUNE_SWD_EQUIPED=2;
		// 		}	
		// 		else {
		// 			Wld_SendTrigger("TIMETRIGGER3");
		// 			return;};
		if (RuneSWD_exp==ItArRuneHeal) 		{ RS_Heal();};
		
		weap.TEXT[0]	= ConcatStrings(ConcatStrings("Szansa na krytyczne uderzenie: ",IntToString(RuneSwdCriticalChance)),"%");		 																													
		weap.TEXT[1]	= ConcatStrings("U¿ywana runa: ",RuneSWD_name);		
		weap.TEXT[4] 	= ConcatStrings("£adunek: ",ConcatStrings(IntToString(RuneCharge),"/40"));		
		if(ready){ RS_PlayAuraOnSwdReady(RuneSWD_lp); }
		else  	 { RS_PlayAuraOnSwdEquip(RuneSWD_lp); };
		
		DontSendCritical=FALSE;
	};
	//Wld_SendTrigger("TIMETRIGGER3");		
};

func void RuneSwd_Equip_RuneChoice()
{
	Info_ClearChoices		(Rune_dialog);	
	Info_AddChoice		(Rune_dialog,"KONIEC."									,RuneSwd_Equip_End);	
	
	if(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) >= 1)||(TALENT_RUNESWORDUSING)
	{	
		Info_AddChoice		(Rune_dialog,"Kr¹g 1." ,RuneSwd_Equip_RuneChoice_1);
	};
	if(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) >= 2)||(TALENT_RUNESWORDUSING)
	{
		Info_AddChoice		(Rune_dialog,"Kr¹g 2." ,RuneSwd_Equip_RuneChoice_2);	
	};
	if(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) >= 3)||(TALENT_RUNESWORDUSING)
	{
		Info_AddChoice		(Rune_dialog,"Kr¹g 3." ,RuneSwd_Equip_RuneChoice_3);	
	};			
	if(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) >= 4)||(TALENT_RUNESWORDUSING)
	{
		Info_AddChoice		(Rune_dialog,"Kr¹g 4." ,RuneSwd_Equip_RuneChoice_4);		
	};
	if(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) >= 5)||(TALENT_RUNESWORDUSING)
	{
		Info_AddChoice		(Rune_dialog,"Kr¹g 5." ,RuneSwd_Equip_RuneChoice_5);		
	};
	if(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) >= 6)
	{
		Info_AddChoice		(Rune_dialog,"Kr¹g 6." ,RuneSwd_Equip_RuneChoice_6);		
	};
};

func void RuneSwd_Equip_End()
{
	MOBSIDIALOG=NONE;
	Npc_SetAivar(hero,AiV_INVINCIBLE,FALSE);	
	Ai_StopProcessInfos (hero);	
};

func void RuneSwd_Equip_RuneChoice_1()
{
	Info_ClearChoices		(Rune_dialog);		
	Info_AddChoice		(Rune_dialog,"KONIEC."									,RuneSwd_Equip_End);		
	Info_AddChoice		(Rune_dialog,DIALOG_BACK									,RuneSwd_Equip_RuneChoice);		
	
	if(Npc_HasItems(hero,itarrunelight))
	{	
		Info_AddChoice		(Rune_dialog,"Œwiat³o." ,RuneSwd_Equip_RuneChoice_Light);	
	};	
	if(Npc_HasItems(hero,itarruneThunderBolt))
	{	
		Info_AddChoice		(Rune_dialog,"Sopel lodu." ,RuneSwd_Equip_RuneChoice_ThunderBolt);	
	};	
	if(Npc_HasItems(hero,itarruneFireBolt))
	{	
		Info_AddChoice		(Rune_dialog,"Ognisty pocisk." ,RuneSwd_Equip_RuneChoice_FireBolt);	
	};					
};

func void RuneSwd_Equip_RuneChoice_2()
{
	Info_ClearChoices		(Rune_dialog);		
	Info_AddChoice		(Rune_dialog,"KONIEC.",RuneSwd_Equip_End);		
	Info_AddChoice		(Rune_dialog,DIALOG_BACK									,RuneSwd_Equip_RuneChoice);		
	
	if(Npc_HasItems(hero,itarrunesleep))
	{	
		Info_AddChoice		(Rune_dialog,"Sen." ,RuneSwd_Equip_RuneChoice_Sleep);	
	};	
	if(Npc_HasItems(hero,itarruneWindFist))
	{	
		Info_AddChoice		(Rune_dialog,"Uderzenie wiatru." ,RuneSwd_Equip_RuneChoice_WindFist);	
	};	
	if(Npc_HasItems(hero,itarruneHeal))
	{	
		Info_AddChoice		(Rune_dialog,"Uzdrowienie." ,RuneSwd_Equip_RuneChoice_Heal);	
	};		
};

func void RuneSwd_Equip_RuneChoice_3()
{
	Info_ClearChoices		(Rune_dialog);		
	Info_AddChoice		(Rune_dialog,"KONIEC.",RuneSwd_Equip_End);		
	Info_AddChoice		(Rune_dialog,DIALOG_BACK									,RuneSwd_Equip_RuneChoice);			
	if(Npc_HasItems(hero,itarrunepyrokinesis))
	{	
		Info_AddChoice		(Rune_dialog,"Pirokineza." ,RuneSwd_Equip_RuneChoice_pyrokinesis);	
	};	
	if(Npc_HasItems(hero,itarrunecharm))
	{	
		Info_AddChoice		(Rune_dialog,"Urok." ,RuneSwd_Equip_RuneChoice_charm);	
	};	
	if(Npc_HasItems(hero,itarruneicecube))
	{	
		Info_AddChoice		(Rune_dialog,"Bry³a lodu." ,RuneSwd_Equip_RuneChoice_icecube);	
	};	
	if(Npc_HasItems(hero,itarrunethunderball))
	{	
		Info_AddChoice		(Rune_dialog,"Piorun kulisty." ,RuneSwd_Equip_RuneChoice_thunderball);	
	};	
	if(Npc_HasItems(hero,ItArRuneFireball))
	{	
		Info_AddChoice		(Rune_dialog,"Kula ognia." ,RuneSwd_Equip_RuneChoice_Fireball);	
	};			
};

func void RuneSwd_Equip_RuneChoice_4()
{
	Info_ClearChoices		(Rune_dialog);		
	Info_AddChoice		(Rune_dialog,"KONIEC.",RuneSwd_Equip_End);		
	Info_AddChoice		(Rune_dialog,DIALOG_BACK									,RuneSwd_Equip_RuneChoice);			
	if(Npc_HasItems(hero,itarrunechAinlightning))
	{	
		Info_AddChoice		(Rune_dialog,"Grom." ,RuneSwd_Equip_RuneChoice_chAinlightning);	
	};	
	if(Npc_HasItems(hero,itarrunefirestorm))
	{	
		Info_AddChoice		(Rune_dialog,"Ognista burza." ,RuneSwd_Equip_RuneChoice_firestorm);	
	};	
	if(Npc_HasItems(hero,itarrunedestroyundead))
	{	
		Info_AddChoice		(Rune_dialog,"Œmieræ o¿ywieñcom." ,RuneSwd_Equip_RuneChoice_destroyundead);	
	};	
	if(Npc_HasItems(hero,itarrunestormfist))
	{	
		Info_AddChoice		(Rune_dialog,"Uderzenie burzy." ,RuneSwd_Equip_RuneChoice_stormfist);	
	};	
};

func void RuneSwd_Equip_RuneChoice_5()
{
	Info_ClearChoices		(Rune_dialog);		
	Info_AddChoice		(Rune_dialog,"KONIEC.",RuneSwd_Equip_End);		
	Info_AddChoice		(Rune_dialog,DIALOG_BACK									,RuneSwd_Equip_RuneChoice);			
	if(Npc_HasItems(hero,itarrunefirerAin))
	{	
		Info_AddChoice		(Rune_dialog,"Deszcz ognia." ,RuneSwd_Equip_RuneChoice_firerAin);	
	};	
	if(Npc_HasItems(hero,itarruneicewave))
	{	
		Info_AddChoice		(Rune_dialog,"Lodowa fala." ,RuneSwd_Equip_RuneChoice_icewave);	
	};	
};
func void RuneSwd_Equip_RuneChoice_6()
{
	Info_ClearChoices		(Rune_dialog);		
	Info_AddChoice		(Rune_dialog,"KONIEC.",RuneSwd_Equip_End);	
	Info_AddChoice		(Rune_dialog,DIALOG_BACK									,RuneSwd_Equip_RuneChoice);					
	if(Npc_HasItems(hero,ItArRuneBreathOfDeath))
	{	
		Info_AddChoice		(Rune_dialog,"Tchnienie œmierci." ,RuneSwd_Equip_RuneChoice_breathofdeath);	
	};	
};
///////////////////////////////////////
// R U N E S   D I A L O G S
///////////////////////////////////////
///////////////////////////////////////
// C I R C L E   I
///////////////////////////////////////
func void RuneSwd_Equip_RuneChoice_Light()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_light);
	RS_TransferToUsingRune(runeNpc);
};
func void RuneSwd_Equip_RuneChoice_FireBolt()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_FireBolt);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_ThunderBolt()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_ThunderBolt);
	RS_TransferToUsingRune(runeNpc);	
};
///////////////////////////////////////
// C I R C L E   II
///////////////////////////////////////
func void RuneSwd_Equip_RuneChoice_WindFist()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_WindFist);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_Sleep()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_Sleep);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_Heal()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_Heal);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_StuningBall()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_StuningBall);
	RS_TransferToUsingRune(runeNpc);	
};
///////////////////////////////////////
// C I R C L E   III
///////////////////////////////////////
func void RuneSwd_Equip_RuneChoice_pyrokinesis()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_pyrokinesis);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_charm()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_charm);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_thunderball()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_thunderball);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_Fireball()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_FireBall);
	RS_TransferToUsingRune(runeNpc);	
};

func void RuneSwd_Equip_RuneChoice_icecube()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_icecube);
	RS_TransferToUsingRune(runeNpc);	
};

func void RuneSwd_Equip_RuneChoice_LifeDrain()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_LifeDrain);
	RS_TransferToUsingRune(runeNpc);	
};

func void RuneSwd_Equip_RuneChoice_Curse()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_Curse);
	RS_TransferToUsingRune(runeNpc);	
};

///////////////////////////////////////
// C I R C L E   IV
///////////////////////////////////////
func void RuneSwd_Equip_RuneChoice_chAinlightning()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_chAinlightning);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_firestorm()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_firestorm);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_destroyundead()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_destroyundead);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_stormfist()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_stormfist);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_HolyFire()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_HolyFire);
	RS_TransferToUsingRune(runeNpc);	
};

func void RuneSwd_Equip_RuneChoice_FireWall()//Chaotic Bolt
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_FireWall);
	RS_TransferToUsingRune(runeNpc);	
};
///////////////////////////////////////
// C I R C L E   V
///////////////////////////////////////
func void RuneSwd_Equip_RuneChoice_firerAin()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_firerAin);
	RS_TransferToUsingRune(runeNpc);	
};
func void RuneSwd_Equip_RuneChoice_icewave()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_icewave);
	RS_TransferToUsingRune(runeNpc);	
};

func void RuneSwd_Equip_RuneChoice_Thunder()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_Thunder);
	RS_TransferToUsingRune(runeNpc);	
};
///////////////////////////////////////
// C I R C L E   VI
///////////////////////////////////////
func void RuneSwd_Equip_RuneChoice_breathofdeath()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_breathofdead);
	RS_TransferToUsingRune(runeNpc);	
};

func void RuneSwd_Equip_RuneChoice_Meteor()
{
	var c_Npc runeNpc;
	runeNpc=Hlp_GetNpc(RuneSword_Meteor);
	RS_TransferToUsingRune(runeNpc);	
};





//DIALOG
//DIALOG
//DIALOG
//DIALOG
//DIALOG
//DIALOG
//DIALOG
INSTANCE RuneSwd_SetRuneAndEquip (C_INFO)
{
	Npc				= PC_hero;
	condition		= RuneSwd2h_SetRuneAndEquip_Condition;
	information		= RuneSwd2h_SetRuneAndEquip_Info;
	important		= 0;
	permanent		= 1;
	description		= "Wybierz runê."; 
};

FUNC INT RuneSwd2h_SetRuneAndEquip_Condition()
{	
	if(MOBSIDIALOG == RUNESWD1hDIALOG)||(MOBSIDIALOG == RUNESWD2hDIALOG)
	{
		return 1;
	};
};

func void RuneSwd2h_SetRuneAndEquip_Info ()
{
	if((hero.attribute[ATR_STRENGTH]>=90)&&(MOBSIDIALOG == RUNESWD1hDIALOG))
	{
		RUNE_SWD_EQUIPED=1;																
		RuneSwd_Equip_RuneChoice();
	}
	else if((hero.attribute[ATR_STRENGTH]>=105)&&(MOBSIDIALOG == RUNESWD2hDIALOG))
	{
		RUNE_SWD_EQUIPED=2;																
		RuneSwd_Equip_RuneChoice();
	}
	else
	{
		if(MOBSIDIALOG == RUNESWD1hDIALOG)
		{
			G_CanNotUse(TRUE,ATR_STRENGTH,90);				
		}
		else
		{
			G_CanNotUse(TRUE,ATR_STRENGTH,105);	
		};
	};	
};


INSTANCE RuneSwd_Equip (C_INFO)
{
	Npc				= PC_hero;
	condition		= RuneSwd_Equip_Condition;
	information		= RuneSwd_Equip_Info;
	important		= 0;
	permanent		= 1;
	description		= "Dob¹dŸ miecza."; 
};

FUNC INT RuneSwd_Equip_Condition()
{	
	if(MOBSIDIALOG == RUNESWD2hDIALOG)||(MOBSIDIALOG == RUNESWD1hDIALOG)
	{
		return 1;
	};
};

func void RuneSwd_Equip_Info ()
{
	if(hero.attribute[ATR_STRENGTH]>=90)&&(MOBSIDIALOG == RUNESWD1hDIALOG)
	{
		RUNE_SWD_EQUIPED=1;	
	}
	else if(hero.attribute[ATR_STRENGTH]>=105)&&(MOBSIDIALOG == RUNESWD2hDIALOG)
	{
		RUNE_SWD_EQUIPED=2;		
		
	}	
	else
	{
		if(MOBSIDIALOG == RUNESWD1hDIALOG)
		{
			G_CanNotUse(TRUE,ATR_STRENGTH,90);				
		}
		else
		{
			G_CanNotUse(TRUE,ATR_STRENGTH,105);	
		};
	};	
};


INSTANCE RuneSwd1h_UnEquip (C_INFO)
{
	Npc				= PC_hero;
	condition		= RuneSwd1h_UnEquip_Condition;
	information		= RuneSwd1h_UnEquip_Info;
	important		= 0;
	permanent		= 1;
	description		= "Usuñ runê."; 
};

FUNC INT RuneSwd1h_UnEquip_Condition()
{	
	var C_Npc runenow;
	runenow				=	Hlp_GetNpc(RuneSword_Now);		
	if(MOBSIDIALOG == RUNESWD1hDIALOG)&&(RuneSWD_exp!=0)
	{
		return 1;
	};
};

func void RuneSwd1h_UnEquip_Info ()
{	
	var C_Npc runenow;
	runenow				=	Hlp_GetNpc(RuneSword_Now);	
	//CreateInvItem(hero,RuneSWD_exp);			
	RuneSWD_name		=	"";
	RuneSWD_slot		=	"";
	RuneSWD_spawnPoint	=	"";
	RuneSWD_wp			=	"";
	RuneSWD_exp 			= 	0;
	RuneSWD_flags		=	0;
	RuneSWD_lp			=	0;
	MOBSIDIALOG=NONE;
	hero_Important=FALSE;	
	RS_ExchangeSwd_Part1(0);	
	Ai_StopProcessInfos (hero);		
};


INSTANCE RuneSwd2h_UnEquip (C_INFO)
{
	Npc				= PC_hero;
	condition		= RuneSwd2h_UnEquip_Condition;
	information		= RuneSwd2h_UnEquip_Info;
	important		= 0;
	permanent		= 1;
	description		= "Usuñ runê."; 
};

FUNC INT RuneSwd2h_UnEquip_Condition()
{	
	var C_Npc runenow;
	runenow				=	Hlp_GetNpc(RuneSword_Now);		
	if(MOBSIDIALOG == RUNESWD2hDIALOG)&&(RuneSWD_exp!=0)
	{
		return 1;
	};
};

func void RuneSwd2h_UnEquip_Info ()
{	
	var C_Npc runenow;
	runenow				=	Hlp_GetNpc(RuneSword_Now);	
	//CreateInvItem(hero,RuneSWD_exp);			
	RuneSWD_name		=	"";
	RuneSWD_slot		=	"";
	RuneSWD_spawnPoint	=	"";
	RuneSWD_wp			=	"";
	RuneSWD_exp 			= 	0;
	RuneSWD_flags		=	0;
	RuneSWD_lp			=	0;
	MOBSIDIALOG=NONE;
	hero_Important=FALSE;	
	RS_ExchangeSwd_Part1(0);	
	Ai_StopProcessInfos (hero);		
};