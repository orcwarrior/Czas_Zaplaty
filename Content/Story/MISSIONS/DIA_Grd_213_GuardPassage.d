//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		Grd_213_Torwache
//	Lager:		OldCamp		
//	Durchgang:	Inneres Tor zur Burg (linke Wache)
//	Uhrzeit:	24h
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	Nähert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////
const string	Grd_213_CHECKPOINT		= "OCC_GATE_INSIDE";
var int first_warn;

instance Info_Grd_213_FirstWarn (C_INFO)
{
	npc			= Grd_213_Torwache;
	nr			= 1;
	condition	= Info_Grd_213_FirstWarn_Condition;
	information	= Info_Grd_213_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_Grd_213_FirstWarn_Condition()
{
	if (//(Npc_GetAivar(hero,AIV_GUARDPASSAGE_STATUS)== AIV_GPS_BEGIN)
   (!first_warn)
	&& (Npc_GetAivar(self,AIV_PASSGATE)	!= TRUE) 
	&&	(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	))
	{
		return TRUE;
	};
};

func void Info_Grd_213_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Grd_213_FirstWarn_Info_07_01"); //STÓJ!
	AI_Output (hero, self,"Info_Grd_213_FirstWarn_Info_15_02"); //Co siê dzieje?
	AI_Output (self, hero,"Info_Grd_213_FirstWarn_Info_07_03"); //Nie wolno Ci wejœæ do zamku. Spadaj!

	Npc_SetAivar(hero,AIV_LASTDISTTOWP,  Npc_GetDistToWP(hero,Grd_213_CHECKPOINT));
	Npc_SetAivar(hero,AIV_GUARDPASSAGE_STATUS,	 AIV_GPS_FIRSTWARN);	
	
   if(NPC_HasItems(hero,ItWr_FletcherFake_Letter_01))||(NPC_HasItems(hero,ItWr_FletcherFake_Letter_02))
	{
		B_StopProcessInfos(self);
	};
   
   first_warn = true;
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_Grd_213_LastWarn (C_INFO)
{
	npc			= Grd_213_Torwache;
	nr			= 1;
	condition	= Info_Grd_213_LastWarn_Condition;
	information	= Info_Grd_213_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Grd_213_LastWarn_Condition()
{
	if ((Npc_GetAivar(hero,AIV_GUARDPASSAGE_STATUS) == AIV_GPS_FIRSTWARN)
	&& (Npc_GetAivar(self,AIV_PASSGATE)	!= TRUE) 
	&&	(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) 
	&& (Npc_GetDistToWP(hero,Grd_213_CHECKPOINT) < (Npc_GetAivar(hero,AIV_LASTDISTTOWP)-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) 
	{
		return TRUE;
	};
};

func int Info_Grd_213_LastWarn_Info()
{
	AI_Output (self, hero,"Info_Grd_213_LastWarn_07_01"); //Og³uch³eœ? Jeszcze jeden krok, a nakarmiê Tob¹ robaki!

	Npc_SetAivar(hero,AIV_LASTDISTTOWP,  Npc_GetDistToWP (hero,Grd_213_CHECKPOINT));
	Npc_SetAivar(hero,AIV_GUARDPASSAGE_STATUS,	 AIV_GPS_LASTWARN);	
	
	if(NPC_HasItems(hero,ItWr_FletcherFake_Letter_01))||(NPC_HasItems(hero,ItWr_FletcherFake_Letter_02))
	{
		B_StopProcessInfos(self);
	};
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Grd_213_Attack (C_INFO)
{
	npc			= Grd_213_Torwache;
	nr			= 1;
	condition	= Info_Grd_213_Attack_Condition;
	information	= Info_Grd_213_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Grd_213_Attack_Condition()
{
	if ((Npc_GetAivar(hero,AIV_GUARDPASSAGE_STATUS) == AIV_GPS_LASTWARN)
	&& (Npc_GetAivar(self,AIV_PASSGATE)	!= TRUE) 
	&&	(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) 
	&& (Npc_GetDistToWP(hero,Grd_213_CHECKPOINT) < (Npc_GetAivar(hero,AIV_LASTDISTTOWP)-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) 
	{
		return TRUE;
	};
};

func int Info_Grd_213_Attack_Info()
{
	Npc_SetAivar(hero,AIV_LASTDISTTOWP,  0);
	Npc_SetAivar(hero,AIV_GUARDPASSAGE_STATUS,	 AIV_GPS_PUNISH);	
	
	B_FullStop(self);	
	B_StopProcessInfos(self);					//dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert(self, other);
	B_SetAttackReason(self, AIV_AR_INTRUDER);
	B_StartAfterDialogFight(self,other,false);
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance Grd_213_Torwache_WELCOME (C_INFO)
{
	npc				= Grd_213_Torwache;
	condition		= Grd_213_Torwache_WELCOME_Condition;
	information		= Grd_213_Torwache_WELCOME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jestem pos³añcem z Nowego Obozu, przynoszê list od Fletchera.";
};

FUNC int  Grd_213_Torwache_WELCOME_Condition()
{	
	if (NPC_HasItems(hero, ItWr_FletcherFake_Letter_01)) || (NPC_HasItems(hero, ItWr_FletcherFake_Letter_02))
	{
		return TRUE;
	};
};

func void  Grd_213_Torwache_WELCOME_Info()
{
	AI_Output (other, self,"Grd_213_Torwache_WELCOME_Info_15_01"); //Jestem pos³añcem z Nowego Obozu, przynoszê list od Fletchera.
	AI_Output (self, other,"Grd_213_Torwache_WELCOME_Info_07_02"); //Dobrze, w takim razie mo¿esz przejœæ.
	Npc_SetAivar(self,AIV_PASSGATE,  1);
	B_StopProcessInfos(self);
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Grd_213_EXIT (C_INFO)
{
	npc			= Grd_213_Torwache;
	nr			= 999;
	condition	= Info_Grd_213_EXIT_Condition;
	information	= Info_Grd_213_EXIT_Info;
	permanent	= 1;
	description	= DIALOG_ENDE;
};                       

FUNC INT Info_Grd_213_EXIT_Condition()
{	
	return 1;
};

FUNC VOID Info_Grd_213_EXIT_Info()
{
	B_StopProcessInfos(self);
};
