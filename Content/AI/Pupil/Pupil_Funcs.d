var int Pupil_hungry;
var int Pupil_State;
	const int FOLLOW=0;
	const int WAIT=1;
	
var int force_follow;
var int follow_time_day;
var int follow_time_hour;
var int follow_time_min;
var string Pupil_Old_WP;	
var C_NPC MyWolf;
var int HeroHasPupil;
var string Pupil_Last_WP;
var string WolfName;
//----------------------------------------------------

func void EVT_PUPIL_HUNGRY()
{
Pupil_hungry+=10;
Wld_SendTrigger("PUPIL_HUNGRY");	
//pr/int(concatstrings("HUNGRY: ",inttostring(Pupil_hungry)));
};


func void PupilBugFix()
{
	if(!HeroHasPupil){return;};
	if(force_follow)
	{
		if(Npc_GetDistToPlayer(MyWolf) < 3000)
		{
			force_follow=FALSE;
		};
	}
	else if(Npc_GetDistToPlayer(MyWolf) < 4900)
	{
		Pupil_Last_WP = Npc_GetNearestWP(MyWolf);
	}
	else
	{
		B_ExchangeRoutine(MyWolf,"Wait");
		Pupil_State=WAIT; 
	};
};


func void ScaleWolf(var int str)
{
		var float b; 
		b=IntToFloat(1+((str-60)/600));
		if(FloatToInt(b)>(4/3))
		{
			b=1.333;
		};
		Mdl_SetModelScale(MyWolf,b,b,b);
};

//----------------------------------------------------
const int	Pupil_HP_PER_LEVEL				= 20;	// Lebenspunkte pro Spieler-Stufe
const int	Pupil_STR_PER_LEVEL				= 8;
const int	Pupil_PROT_EB_PER_LEVEL				= 3;
const int	Pupil_PROT_P_PER_LEVEL				= 2;
const int	Pupil_PROT_F_PER_LEVEL				= 2;
const int	Pupil_PROT_M_PER_LEVEL				= 1;
func void Pupil_GiveXP (var int add_xp)
{
	////PrintDebugNpc	(PD_ZS_FRAME,	"B_GiveXP");

	if (MyWolf.level == 0)
	{
		MyWolf.exp_next = 250;
	};
	//----------------------------------------------------------------------------
	if(MyWolf.attribute[ATR_HITPOINTS]>0)
	{	MyWolf.exp = MyWolf.exp + add_xp*2;	};

	//----------------------------------------------------------------------------
	if ( MyWolf.exp >= MyWolf.exp_next ) // ( XP > (500*((hero.level+2)/2)*(hero.level+1)) )
	{
		MyWolf.level = MyWolf.level+1;
		MyWolf.exp_next = MyWolf.exp_next +((MyWolf.level)*250);
		//----------------------------------------------------------------------------
		MyWolf.attribute[ATR_HITPOINTS_MAX] = MyWolf.attribute[ATR_HITPOINTS_MAX]+Pupil_HP_PER_LEVEL;
		MyWolf.attribute[ATR_HITPOINTS] = MyWolf.attribute[ATR_HITPOINTS]+Pupil_HP_PER_LEVEL;
		MyWolf.attribute[ATR_STRENGTH] = MyWolf.attribute[ATR_STRENGTH]+Pupil_STR_PER_LEVEL;	
		
			MyWolf.protection	[PROT_BLUNT]	=	MyWolf.protection	[PROT_BLUNT]+Pupil_PROT_EB_PER_LEVEL;
			MyWolf.protection	[PROT_EDGE]		=	MyWolf.protection	[PROT_EDGE]	+Pupil_PROT_EB_PER_LEVEL;
			MyWolf.protection	[PROT_POINT]	=	MyWolf.protection	[PROT_POINT]+Pupil_PROT_P_PER_LEVEL;
			MyWolf.protection	[PROT_FIRE]		=	MyWolf.protection	[PROT_FIRE] +Pupil_PROT_F_PER_LEVEL;
			MyWolf.protection	[PROT_MAGIC]	=	MyWolf.protection	[PROT_MAGIC]+Pupil_PROT_M_PER_LEVEL;	
		
		ScaleWolf(MyWolf.attribute[ATR_STRENGTH]);
		
		PrintScreen		("Twój pupil osi¹gna³ kolejny poziom!", -1,_YPOS_MESSAGE_LEVELUP+10,"font_old_10_white.tga",_TIME_MESSAGE_LEVELUP);
		Snd_Play		("LevelUp");
	};
};

func void Pupil_DeathXP(var int multipler)
{
	////PrintDebugNpc		(PD_ZS_FRAME,	"B_DeathXP");
	//PRINTGlobals		(PD_ZS_CHECK);
	
	if	C_NpcIsHuman(self)
	&&	Npc_WasInState(self, ZS_Unconscious)
	{
		////PrintDebugNpc	(PD_ZS_CHECK,	"...Opfer ist bewußtloser Mensch!");
		// SN: keine XP für Finishing-Move!!!
	}
	else
	{
		////PrintDebugNpc	(PD_ZS_CHECK,	"...Opfer ist entweder nicht bewußtlos oder kein Mensch!");
		Pupil_GiveXP ((self.level * XP_PER_LEVEL_DEAD) / multipler);
	};
};
func void Pupil_UnconciousXP(var int multipler)
{
	////PrintDebugNpc	(PD_ZS_FRAME,	"B_UnconciousXP");
	//PRINTGlobals	(PD_ZS_CHECK);
		
	//-------- Erfahrung nur beim ersten Sieg über Menschen --------
	if	!C_NpcIsHuman(self)
	||	!Npc_GetAivar(self,AIV_WASDEFEATEDBYSC)
	{
		////PrintDebugNpc	(PD_ZS_CHECK,	"...erster Sieg!");
		Pupil_GiveXP ((self.level * XP_PER_LEVEL_DEAD) / multipler);		// die vollen XP beim Sieg vergeben, da finishing-Move keine XPs mehr ergibt!
	};
};

	
	
	
func void ScaleWolfFatness(var int hungry)
{
		var float a;
		a=IntToFloat((50-hungry)/50);//od -1 do 1
		Mdl_SetModelFatness(MyWolf,a);
};

func void Smooth_ScaleWolfFatness(var int last_hungry,var int hungry)
{
	if(hungry>0){hungry=0;};
	var int a;
	a=last_hungry-hungry;
	if(last_hungry>hungry)
	{
	ScaleWolfFatness(last_hungry-(a/4));
	ScaleWolfFatness(last_hungry-(a/2));	
	ScaleWolfFatness(last_hungry-(3*a/4));	
	}
	else
	{
	ScaleWolfFatness(last_hungry+(a/4));
	AI_Wait(MyWolf,0.2);
	ScaleWolfFatness(last_hungry+(a/2));	
	AI_Wait(MyWolf,0.2);
	ScaleWolfFatness(last_hungry+(3*a/4));	
	AI_Wait(MyWolf,0.2);
	};	
	ScaleWolfFatness(hungry);			
};


func void Use_Comander()
{
	if(HeroHasPupil)&&(!Npc_IsDead(MyWolf))&&(Npc_GetDistToPlayer(MyWolf)<5001)
	{
		if(Pupil_State==FOLLOW)
		{

			B_ExchangeRoutine(MyWolf,"WAIT");
			AI_StartState (MyWolf, ZS_Pupil_Wait, 0, "");
			Pupil_State=WAIT;
			force_follow=FALSE;
		}
		else
		{

			Pupil_Old_WP=Pupil_Last_WP;
			Pupil_Last_WP=Npc_GetNearestWP(hero);
// 			follow_time_day=Wld_GetDay();
// 			follow_time_hour=Wld_GetHour();
// 			follow_time_min=Wld_GetMin();
			Npc_ClearAiQueue(self);
			AI_StandUp(self);
			Npc_ExchangeRoutine(MyWolf,"FOLLOW");
			AI_StartState (MyWolf, ZS_Pupil_FollowPlayer, 0, "");
			force_follow=TRUE;
			Pupil_State=FOLLOW; 
		};
	};

};

INSTANCE Pupil_Comander (C_ITEM)
{

	name 				=	"Róg";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MISSION;

	value 				=	9;

	visual 				=	"ItMi_Alarmhorn_01.3DS";
	material 			=	MAT_WOOD;
	on_state[1]			=	Use_Comander;
	scemeName			=	"HORN";

	description			= name;
	TEXT[0]				= "Mój wilk reaguje na jego dŸwiêk.";
	////COUNT[0]		= ;
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	//TEXT[2]			= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;	
		
};