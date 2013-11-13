CONST INT LP_PER_LEVEL	=10;	//Lernpunkte pro Spieler-Stufe
CONST INT HP_PER_LEVEL	=12;	//Lebenspunkte pro Spieler-Stufe
CONST INT XP_PER_LEVEL_UNCONSCIOUS	=5;	//Erfahrungspunkte für das Besiegen eines Gegners (pro Level Gegners)
CONST INT XP_PER_LEVEL_DEAD	=10;	//Erfahrungspunkte für das Töten eines Gegners (pro Level Gegners)

FUNC VOID B_GIVEXP(VAR INT ADD_XP)
{
	////PrintDebugNpc(PD_ZS_FRAME,"B_GiveXP");

	IF(HERO.LEVEL==0)
	{
		HERO.EXP_NEXT=500;
	};
	//----------------------------------------------------------------------------
	HERO.EXP=HERO.EXP + ADD_XP;//*2; WHAT THE FUCK??? 2???

	//----------------------------------------------------------------------------
	VAR STRING MSG;
	MSG=NAME_XPGAINED;
	MSG=CONCATSTRINGS(MSG,INTTOSTRING(ADD_XP));
	PutMsg(MSG,"font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_XPGAINED,"");

	//----------------------------------------------------------------------------
	IF(HERO.EXP >=HERO.EXP_NEXT)//( XP > (500*((hero.level+2)/2)*(hero.level+1)) )
	{
		HERO.LEVEL=HERO.LEVEL+1;
		HERO.EXP_NEXT=HERO.EXP_NEXT +((HERO.LEVEL+1)*300) + 500; //zmienione przez Adanosa 2012-03-08
      HERO.EXP_NEXT=HERO.EXP_NEXT-(HERO.EXP_NEXT%500); //zmienione przez Adanosa 2012-03-08
		HERO.ATTRIBUTE[ATR_HITPOINTS_MAX]=HERO.ATTRIBUTE[ATR_HITPOINTS_MAX]+HP_PER_LEVEL;
		HERO.ATTRIBUTE[ATR_HITPOINTS]=HERO.ATTRIBUTE[ATR_HITPOINTS]+HP_PER_LEVEL;
		HERO.LP=HERO.LP + LP_PER_LEVEL;	//+ hero.level;
      
		IF(TALENT_QUICK_LERNING==1)
		{
         HERO.LP=HERO.LP + 1;
		}
		ELSE IF(TALENT_QUICK_LERNING==2)
		{
         HERO.LP=HERO.LP + 3;
		};
      
		PrintScreen		(NAME_LevelUp, -1,_YPOS_MESSAGE_LEVELUP,"font_old_20_white.tga",3);//by³o _TIME_MESSAGE_LEVELUP budzis
		Snd_Play		("LevelUp");
		//PutMsg(NAME_LEVELUP,"font_default.tga",RGBAToZColor(255,200,100,255),_TIME_MESSAGE_LEVELUP,"LevelUp.wav");
	};
};

FUNC VOID B_DEATHXP(VAR INT MULTIPLER)//multipiler? eh, divider -_-
{
	////PrintDebugNpc(PD_ZS_FRAME,"B_DeathXP");
	//PRINTGlobals(PD_ZS_CHECK);
	IF	C_NpcIsHuman(self)
	&&	NPC_WASINSTATE(SELF,ZS_UNCONSCIOUS)
	{
		////PrintDebugNpc(PD_ZS_CHECK,"...Opfer ist bewußtloser Mensch!");
		//SN: keine XP für Finishing-Move!!!
	}
	ELSE
	{
		////PrintDebugNpc(PD_ZS_CHECK,"...Opfer ist entweder nicht bewußtlos oder kein Mensch!");
		B_GIVEXP((SELF.LEVEL * XP_PER_LEVEL_DEAD)/ MULTIPLER);
	};
};
FUNC VOID B_UNCONCIOUSXP(VAR INT MULTIPLER)
{
	////PrintDebugNpc(PD_ZS_FRAME,"B_UnconciousXP");
	//PRINTGlobals(PD_ZS_CHECK);

	//-------- Erfahrung nur beim ersten Sieg über Menschen --------
	IF	!C_NpcIsHuman(self)
	||	!Npc_GetAivar(SELF,AIV_WASDEFEATEDBYSC)
	{
		////PrintDebugNpc(PD_ZS_CHECK,"...erster Sieg!");
		B_GIVEXP((SELF.LEVEL * XP_PER_LEVEL_DEAD)/ MULTIPLER);	//die vollen XP beim Sieg vergeben, da finishing-Move keine XPs mehr ergibt!
	};
};
func void B_DamageSysGiveXP(var c_npc vict, var int multipler)
{
	if(C_NpcIsHuman(vict))&&(Npc_GetAivar(vict,AIV_XPGIVEN)==false)
	{
	Npc_SetAivar(vict,AIV_XPGIVEN,true);
	B_GIVEXP((vict.LEVEL * XP_PER_LEVEL_DEAD)/ MULTIPLER);	
	}
	else if(!C_NpcIsHuman(vict))&&(Npc_GetAivar(vict,AIV_MM_XPGIVEN)==false)
	{
	Npc_SetAivar(vict,AIV_MM_XPGIVEN,true);
	B_GIVEXP((vict.LEVEL * XP_PER_LEVEL_DEAD)/ MULTIPLER);			
	};	
};

FUNC VOID B_NPCXP(var c_npc slf, VAR INT MULTIPLER)//multipiler? eh, divider -_-
{
	////PrintDebugNpc(PD_ZS_FRAME,"B_DeathXP");
	//PRINTGlobals(PD_ZS_CHECK);
	IF	(C_NpcIsHuman(slf)&&NPC_WASINSTATE(slf,ZS_UNCONSCIOUS))
	
	{
		////PrintDebugNpc(PD_ZS_CHECK,"...Opfer ist bewußtloser Mensch!");
		//SN: keine XP für Finishing-Move!!!
	}
	ELSE
	{
		////PrintDebugNpc(PD_ZS_CHECK,"...Opfer ist entweder nicht bewußtlos oder kein Mensch!");
		B_GIVEXP((slf.LEVEL * XP_PER_LEVEL_DEAD)/ MULTIPLER);
	};
};