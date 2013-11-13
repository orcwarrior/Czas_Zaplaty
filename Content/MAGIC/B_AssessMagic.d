//B_AssessMagic. Wird auf dem Opfer einmalig aufgerufen, wenn die Perception MAGIC (ASSESSMAGIC) aktiviert wird

//FIXME: 	hier müssen für jeden Spruch noch Fallunterscheidungen für MAIN / IMMORTAL Characters
//berücksichtigt werden, die evtl. nicht von den Sprüchen beeinflußt werden sollen!


/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_FIREBOLT()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Firebolt");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

FUNC VOID B_ASSESSMAGIC_HOLYFIRE()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssesMagic_HolyLight");
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
	IF(C_NPCISEVIL(SELF))
	{
		WLD_PLAYEFFECT("VOB_HOLYBURN",SELF,SELF,1,0,0,0);
		IF(C_NPCISORC(SELF))
		{
			VAR INT DMG;DMG=MATH_ROUND(SPL_DAMAGE_HOLYFIRE/3*2);
			WLD_PLAYEFFECT("spellFX_INVISIBLEDMG_Fireball",OTHER,SELF,2,DMG,DAM_MAGIC,TRUE);

		}
		ELSE
		{
			WLD_PLAYEFFECT("spellFX_INVISIBLEDMG_Fireball",OTHER,SELF,2,SPL_DAMAGE_HOLYFIRE,DAM_MAGIC,TRUE);

		};
		NPC_CLEARAIQUEUE(SELF);
		IF(!NPC_ISDEAD(SELF))
		{
			B_FULLSTOP(SELF);
			AI_PLAYANI(SELF,"S_FIRE_VICTIM");
			AI_WAIT(SELF,1);
		};

	};
};

FUNC VOID B_ASSESSMAGIC_CURSE()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Curse");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
	//pri/nt("curse");

};
/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_FIREBALL()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_FireBall");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

//Chaosbolt Moved To RuneSword_Func



/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_FIRESTORM()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Firestorm");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_FIRERAIN()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Firerain");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_CHAINLIGHTNING()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic ...ChainLightning");

	NPC_PERCDISABLE(SELF,PERC_ASSESSCASTER);

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);

	NPC_CLEARAIQUEUE(SELF);
	IF(!NPC_ISDEAD(SELF))
	{
		B_FULLSTOP(SELF);
		AI_STARTSTATE(SELF,ZS_ZAPPED,0,"");
	};
};


/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_THUNDERBOLT()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Thunderbolt");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_THUNDERBALL()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic ...Thunderball");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);

	NPC_CLEARAIQUEUE(SELF);
	IF(!NPC_ISDEAD(SELF))
	{
		AI_STARTSTATE(SELF,ZS_SHORTZAPPED,0,"");
	};
};


FUNC VOID B_ASSESSMAGIC_METEOR()
{
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};
FUNC VOID B_ASSESSMAGIC_ICECUBE()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic ...IceCube oder IceWave");
	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);

	//kein Freezen von SLEEPER, DEMON, GOLEM, SWAMPSHARK, TROLL und wenn Opfer in BS_SWIM oder BS_DIVE
	//FIXME: MInecrawlerqueeen ist GIL_MINECRAWLER! Andere Gilde geben, damit auch sie nicht gefreezt werden kann?!
	IF(!((SELF.GUILD	==GIL_PUPIL)||
(SELF.GUILD==GIL_DEMON)||
(SELF.GUILD==GIL_GOLEM)||
(SELF.GUILD==GIL_SWAMPSHARK)||
(SELF.GUILD==GIL_TROLL)))
	{
		NPC_PERCDISABLE(SELF,PERC_ASSESSCASTER);
		NPC_CLEARAIQUEUE(SELF);
		AI_STARTSTATE(SELF,ZS_MAGICFREEZE,0,"");
	};
};
/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_FEAR()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Fear");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);

	//Immunität für SLEEPER, TROLL, SWAMPSHARK, DEMON, SKELETONS, ZOMBIES, GOLEM
	IF((SELF.GUILD	==GIL_PUPIL)||
(SELF.GUILD==GIL_TROLL)||
(SELF.GUILD==GIL_SWAMPSHARK)||
(SELF.GUILD==GIL_DEMON)||
(SELF.GUILD==GIL_GOLEM)||
(SELF.GUILD==GIL_SKELETON)||
(SELF.GUILD==GIL_ZOMBIE))
	{
		////PrintDebugNpc(PD_MAGIC,"...Ziel immun!");
	}
	ELSE
	{
		////PrintDebugNpc(PD_MAGIC,"...Ziel NICHT immun!");
		NPC_CLEARAIQUEUE(SELF);
		NPC_SETTARGET(SELF,OTHER);
		IF(C_NPCISHUMAN(SELF))
		{
			AI_STARTSTATE(SELF,ZS_FLEE,0,"");
		}
		ELSE IF(C_NPCISMONSTER(SELF))
		{
			AI_STARTSTATE(SELF,ZS_MM_FLEE,0,"");
		};
	};
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_MASSDEATH()
{
	////PrintDebugNpc(PD_MAGIC,"B_Assessmagic_Massdeath");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_DESTROYUNDEAD()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Destroyundead");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_WINDFIST()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Windfist");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_STORMFIST()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Stormfist");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_CHARM()
{
	////PrintDebugNpc(PD_ZS_CHECK,"B_AssessMagic Charm");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);

	NPC_CLEARAIQUEUE(SELF);	//alle AI Befehle entfernen

	IF(!NPC_ISINSTATE(SELF,ZS_UNCONSCIOUS))
	{
		////PrintDebugNpc(PD_ZS_CHECK,"...NSC ist ein Mensch bei bewußtsein!");

		NPC_SETTEMPATTITUDE(SELF,ATT_FRIENDLY);
		B_FULLSTOP(SELF);

		IF(NPC_ISINSTATE(SELF,ZS_ATTACK))
		{
			B_SAYOVERLAY(SELF,OTHER,"$LetsForgetOurLittleFight");
		}
		ELSE
		{
			B_SAY(SELF,OTHER,"$FriendlyGreetings");
		};
		AI_CONTINUEROUTINE(SELF);
	};

};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_PYROKINESIS()
{
	////PrintDebugNpc(PD_MAGIC,"...Pyrokinesis");
	NPC_CLEARAIQUEUE(SELF);
	NPC_PERCDISABLE(SELF,PERC_ASSESSCASTER);

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
	IF(!NPC_ISDEAD(SELF)&& !NPC_ISINSTATE(SELF,ZS_UNCONSCIOUS))
	{
		////PrintDebugNpc(PD_MAGIC,"...weder bewußtlos noch tot!");
		AI_STARTSTATE(SELF,ZS_PYRO,0,"");
	};
};

FUNC VOID B_ASSESSMAGIC_THUNDER()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Thunder");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

//THAT is CURSE!!!
FUNC VOID B_ASSESSMAGIC_WEAKNESS()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Weakness");

	//Damit andere NSCs den Angriff wahrnehmen können
	
    add_Curse(self, self);	
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};
/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_BERZERK()
{
	////PrintDebugNpc(PD_MAGIC,"...Berzerk");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);

	//FIXME: was soll mit Immortals/Main chars.  passieren?
	NPC_CLEARAIQUEUE(SELF);

	IF(!NPC_ISDEAD(SELF)&& !NPC_ISINSTATE(SELF,ZS_UNCONSCIOUS))
	{
		AI_STARTSTATE(SELF,ZS_BERZERK,0,"");
	};
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_BREATHOFDEATH()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_Breathofdeath");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_NEW1()
{
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic_New1");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_SHRINK()
{
	////PrintDebugNpc(PD_MAGIC,"...Shrink");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);

	NPC_CLEARAIQUEUE(SELF);
	AI_STARTSTATE(SELF,ZS_MAGICSHRINK,0,"");
};

/*******************************************************************************************/
FUNC VOID B_ASSESSMAGIC_CONTROL()
{
	////PrintDebugNpc(PD_MAGIC,"...Control");

	//Damit andere NSCs den Angriff wahrnehmen können
	NPC_SENDPASSIVEPERC(SELF,PERC_ASSESSFIGHTSOUND,SELF,OTHER);
};


FUNC VOID B_ASSESSMAGIC()
{
	//TODO
	//if other has multicast
	//assesmagic was send
	//if freeze last time was multicasted=true
	//send multicast magic freeze
	
	//Who's using runesword?
	VAR C_NPC user;
	user=HLP_GETNPC(RuneSwd_User);
	//PRINTGlobals(PD_MAGIC);
	////PrintDebugNpc(PD_MAGIC,"B_AssessMagic");
	
	//Warn: Right now only hero can "use" RuneSwd
	//partially fixed
	VAR C_ITEM READYWEAP;
	READYWEAP=NPC_GETREADIEDWEAPON(user);
	printdebug(concatstrings("AssesMagic casted by ",other.name));
	//pri/nt("ASSESS MAGIC => INITED ### @@@@");
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
			)
	{
	//pr/int("ASSESS MAGIC => RUNE SWORD ### @@@@");
		B_ASSESSMAGIC_RUNESWD();
	};
	IF(NPC_GETACTIVESPELL(OTHER)==SPL_FIREBOLT){	B_ASSESSMAGIC_FIREBOLT();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_STUNINGBALL){	B_ASSESSMAGIC_STUNINGBALL();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_METEOR){	B_ASSESSMAGIC_METEOR();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_FIREBALL){	B_ASSESSMAGIC_FIREBALL();	}

	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_FIRESTORM){	B_ASSESSMAGIC_FIRESTORM();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_FIRERAIN){	B_ASSESSMAGIC_FIRERAIN();	}

	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_CHAINLIGHTNING){	B_ASSESSMAGIC_CHAINLIGHTNING();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_THUNDERBOLT){	B_ASSESSMAGIC_THUNDERBOLT();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_THUNDERBALL){	B_ASSESSMAGIC_THUNDERBALL();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_ICECUBE){	B_ASSESSMAGIC_ICECUBE();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_ICEWAVE){	B_ASSESSMAGIC_ICECUBE();	}

	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_MASSDEATH){	B_ASSESSMAGIC_MASSDEATH();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_DESTROYUNDEAD){	B_ASSESSMAGIC_DESTROYUNDEAD();	}

	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_WINDFIST){	B_ASSESSMAGIC_WINDFIST();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_STORMFIST){	B_ASSESSMAGIC_STORMFIST();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_CHARM){	B_ASSESSMAGIC_CHARM();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_FEAR){	B_ASSESSMAGIC_FEAR();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_PYROKINESIS){	B_ASSESSMAGIC_PYROKINESIS();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_BERZERK){	B_ASSESSMAGIC_BERZERK();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_BREATHOFDEATH){	B_ASSESSMAGIC_BREATHOFDEATH();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_NEW1){	B_ASSESSMAGIC_NEW1();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_CONTROL){	B_ASSESSMAGIC_CONTROL();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_SHRINK){	B_ASSESSMAGIC_SHRINK();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_HOLYFIRE){	B_ASSESSMAGIC_HOLYFIRE();	}

	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_THUNDER){	B_ASSESSMAGIC_THUNDER();	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_WEAKNESS){	B_ASSESSMAGIC_WEAKNESS();	}

	//Folgende Sprüche brauchen keinen B_AssessMagic weil sie nicht auf einen NSC wirken:

	//( Npc_GetActiveSpell 	(other) == SPL_LIGHT		)			{	B_AssessMagic_Light();			}
	//( Npc_GetActiveSpell 	(other) == SPL_TELEPORT1	)			{	B_AssessMagic_TELEPORT1();		}
	//( Npc_GetActiveSpell 	(other) == SPL_TELEPORT2	)			{	B_AssessMagic_TELEPORT2();		}
	//( Npc_GetActiveSpell 	(other) == SPL_TELEPORT3	)			{	B_AssessMagic_TELEPORT3();		}
	//( Npc_GetActiveSpell 	(other) == SPL_TELEPORT4	)			{	B_AssessMagic_TELEPORT4();		}
	//( Npc_GetActiveSpell 	(other) == SPL_TELEPORT5	)			{	B_AssessMagic_TELEPORT5();		}
	//( Npc_GetActiveSpell 	(other) == SPL_HEAL 		)			{	B_AssessMagic_Heal();			}
	//( Npc_GetActiveSpell 	(other) == SPL_TRANSFORM	) 			{	B_AssessMagic_Transform();		}
	//( Npc_GetActiveSpell 	(other) == SPL_SUMMONDEMON  ) 			{	B_AssessMagic_SummonDemon();	}
	//( Npc_GetActiveSpell 	(other) == SPL_SUMMONSKELETON) 			{	B_AssessMagic_SummonSkeleton();	}
	//( Npc_GetActiveSpell 	(other) == SPL_SUMMONGOLEM  ) 			{	B_AssessMagic_SummonGolem();	}
	//( Npc_GetActiveSpell 	(other) == SPL_ARMYOFDARKNESS) 			{	B_AssessMagic_ArmyOfDarkness();	}
	//( Npc_GetActiveSpell 	(other) == SPL_TELEKINESIS  ) 			{	B_AssessMagic_Telekinesis();	}

	//ALWAYS LAST
	//TODO:
	//Bugfix when hero change spell it will still treat like chaosbolt bounces
	ELSE IF(GLOB_FIREWALL_BOUNCES==9){	B_ASSESSMAGIC_FIREWALL(9);	}
	ELSE IF(GLOB_FIREWALL_BOUNCES==8){	B_ASSESSMAGIC_FIREWALL(8);	}
	ELSE IF(GLOB_FIREWALL_BOUNCES==7){	B_ASSESSMAGIC_FIREWALL(7);	}
	ELSE IF(GLOB_FIREWALL_BOUNCES==6){	B_ASSESSMAGIC_FIREWALL(6);	}
	ELSE IF(GLOB_FIREWALL_BOUNCES==5){	B_ASSESSMAGIC_FIREWALL(5);	}
	ELSE IF(GLOB_FIREWALL_BOUNCES==4){	B_ASSESSMAGIC_FIREWALL(4);	}
	ELSE IF(GLOB_FIREWALL_BOUNCES==3){	B_ASSESSMAGIC_FIREWALL(3);	}
	ELSE IF(GLOB_FIREWALL_BOUNCES==2){	B_ASSESSMAGIC_FIREWALL(2);	}
	ELSE IF(GLOB_FIREWALL_BOUNCES==1){	B_ASSESSMAGIC_FIREWALL(1);	}
	ELSE IF(NPC_GETACTIVESPELL(OTHER)==SPL_FIREWALL && GLOB_FIREWALL_BOUNCES==0){	B_ASSESSMAGIC_FIREWALL(0);	};

};

//Anmeldung der AssessMagic-Wahrnehmung, wenn der Player NICHT zustandsgesteuert ist
CONST FUNC PLAYER_PERC_ASSESSMAGIC=B_ASSESSMAGIC;	