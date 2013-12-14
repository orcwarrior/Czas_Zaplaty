CONST INT B_SPRINT_COST_BASE = 520;
CONST INT B_SPRINT_COST_MAXLVLBASEDBONUS = 140;
CONST INT B_SPRINT_COST_REGULARRUN = 230;
CONST INT B_SPRINT_COST_STANDINGBONUS = 120;

instance StaminaBar(oCViewStatusBar) {};

FUNC INT Ani_BodyStateContains(Var C_Npc Slf,Var Int Bodystate)
{
	if((NPC_GETBODYSTATE(SLF)&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS))==(BODYSTATE&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS)))//sowohl bei der Abfrage als auch beim Vergleichswert die höhren Bits ausmaskieren!
	{																//...ja!
		RETURN TRUE;
	}
	else
	{
		RETURN FALSE;
	};
};
// Ustawia alphe dla podanego obiektu oCStatusBar (ptr)
func void oCStatusBar_SetAlpha(var int oCStatusBarSwim_Ptr, var int alpha)
{
	var int hlp;
	MEM_WriteInt(oCStatusBarSwim_Ptr+36,alpha);
	
	hlp = MEM_ReadInt(oCStatusBarSwim_Ptr+276);
	MEM_WriteInt(hlp+36,alpha);
	
	hlp = MEM_ReadInt(oCStatusBarSwim_Ptr+280);
	MEM_WriteInt(hlp+36,alpha);
};
// Aktualizuje wyœwietlan¹ wartoœæ podanego oCStatusBar
func void oCStatusBar_UpdateValue(var int oCStatusBarSwim_Ptr,var int val,var int maxVal)
{
	var int barvalue;
	//300 to jak dobrze myœle max. wartoœæ dla staminabar
	barvalue =  divf(val,maxVal);
	
	CALL_IntParam(barvalue);
	CALL__thiscall (oCStatusBarSwim_Ptr,oCViewStatusBar_SetValue_offset);
	CALL__thiscall (oCStatusBarSwim_Ptr,zCViewStatusBar_Init_offset);	
};
func void oCStatusBar_Initialize(var int oCStatusBarSwim_Ptr)
{
	var int ViewScreen;
	ViewScreen = MEM_Game.array_view[0];
	CALL_IntParam(0);
	CALL_IntParam(oCStatusBarSwim_Ptr);
	CALL__thiscall (ViewScreen,zCView_InsertItem_offset);
	CALL__thiscall (oCStatusBarSwim_Ptr,zCViewStatusBar_Init_offset);		

	CALL_IntParam(mkf(1000));
	CALL_IntParam(0);
	CALL__thiscall (oCStatusBarSwim_Ptr,oCViewStatusBar_SetMaxRange_offset);	
	
	CALL_IntParam(mkf(1000));
	CALL_IntParam(0);
	CALL__thiscall (oCStatusBarSwim_Ptr,oCViewStatusBar_SetRange_offset);				
	Stamina_BarVisible=1;
	CALL__thiscall (oCStatusBarSwim_Ptr,zCViewStatusBar_Init_offset);	
};
func string oCAniCtrl__GetCurrentAniName(var int oCAniCtrl_Ptr)
{
	var int hlp;
	hlp = MEM_ReadInt(oCAniCtrl_Ptr+104);//zCModel 		
	if(hlp) 
	{
		hlp = MEM_ReadInt(hlp+56);//*ActiveAniLayer1			
		if(hlp)
		{
			hlp = MEM_ReadInt(hlp);//*oCAni				
			if(hlp)
			{ 
				return MEM_ReadString(hlp+36); // This will read active ani name(?)
			};//aniname(zstring)
		};
	};
	return "ERROR";
};

// B_Sprint 'Private' functions
const int B_SPRINT_RUNSTATE_OTHER 	= 0;
const int B_SPRINT_RUNSTATE_RUN 	= 1;
const int B_SPRINT_RUNSTATE_JUMPRUN = 2;
func int Sprint__NpcRunState(var C_NPC npc)
{
	var int iswalking; var int isstanding;
	var oCNpc _oCNpc;
	_oCNpc = hlp_getnpc(npc);
	CALL__thiscall (_oCNpc.anictrl,oCAniCtrl_Human_IsWalking_offset);	iswalking = CALL_GetResult();	
	CALL__thiscall (_oCNpc.anictrl,oCAniCtrl_Human_IsStanding_offset);	isstanding = CALL_GetResult();		

	var string L1Ani;	
	// Get Current Ani
	L1Ani = oCAniCtrl__GetCurrentAniName(_oCNpc.anictrl);
	if(Hlp_StrCmp(L1Ani,"ERROR")) { return false;};
	if (iswalking) // Hero is walking
	&& ( (Ani_BodyStateContains(npc,BS_HIT)&& Hlp_StrCmp(L1Ani,"S_1HRUNL")) 
	|| Ani_BodyStateContains(npc,BS_RUN) )
	&& (!isstanding) // Not walking, so hero is runing
	{
		return B_SPRINT_RUNSTATE_RUN;
	}
	else if(Hlp_StrCmp(L1Ani,"T_RUNR_2_JUMP"))||(Hlp_StrCmp(L1Ani,"T_RUNL_2_JUMP"))
	{
		return B_SPRINT_RUNSTATE_JUMPRUN;
	};
	return B_SPRINT_RUNSTATE_OTHER;
};
func int Sprint__CalculateSprintCost(var int runState)
{
	var int cost;
	if(runState == B_SPRINT_RUNSTATE_RUN) 
	{ 
		cost = B_SPRINT_COST_BASE; 
		var int lvlBonus; lvlBonus = hero.level * 3;
		if(lvlBonus > B_SPRINT_COST_MAXLVLBASEDBONUS) { lvlBonus = B_SPRINT_COST_MAXLVLBASEDBONUS; };
		cost = cost - lvlBonus;
	}
	else if(runState == B_SPRINT_RUNSTATE_JUMPRUN) 
	{ cost = B_SPRINT_COST_REGULARRUN; };
	return cost;
};
func void Sprint__TurnOff(var int oCStatusBarSwim_Ptr)
{
	SPRINTENABLED = false; 
	MDL_REMOVEOVERLAYMDS(HERO,"HUMANS_SPRINT.MDS");
};
func void Sprint__DivingBugfix(var int oCStatusBarSwim_Ptr)
{
	if(Ani_BodyStateContains(hero,BS_DIVE))
	{
		if(Stamina_BarVisible==FALSE)
		{
			Stamina_BarVisible=TRUE;	
			oCStatusBar_SetAlpha(oCStatusBarSwim_Ptr,255);
		};
	};
};
FUNC VOID Sprint_Update()
{
	var int barvalue; var int hlp; var ocnpc hiro;
	hiro = hlp_getnpc(pc_hero);			
	var int swimbar; swimbar = MEM_ReadInt (MEMINT_oGame_Pointer_Address);
	swimbar = MEM_ReadInt(swimbar+144);//game.swimBar			
	//Show DiveBar Bugfix		
	Sprint__DivingBugfix(swimbar);

	if (Sprint_UpClicked>0)//clicked one time, decrease wait time for another click
	{
		Sprint_UpClicked-=1;
	};
	// Keyevent: Sprint Toggled - enable or disable
	if (InfoManager_HasFinished()) && (Sprint_UpClicked == -1)&&(!Npc_IsDead(hero))
	{
		Sprint_UpClicked = 0;//Reset			
		if(SPRINTENABLED)
		{ 
			Sprint__TurnOff(swimbar);
		}
		else 
		{ 	// Enable Sprint:
			SPRINTENABLED=TRUE; 
			oCStatusBar_SetAlpha(swimbar,255);			
			Mdl_ApplyOverlayMDS(HERO,"HUMANS_SPRINT.MDS");
		};
	};	
	if(SPRINTENABLED)
	{
		var int runState; runState = Sprint__NpcRunState(hero);
		Print_s_i("runState: ",runState);
		if (runState) // Not walking, so hero is runing
		{  
			var int cost; 
			cost = Sprint__CalculateSprintCost(runState);			
			hiro.divectr=subf(hiro.divectr,mkf(cost)); // take some stamina for sprinting
			
			var int ptr; ptr = swimbar;
			MEM_WriteInt(ptr+252,mulf(fracf(SPRINTTIME,MAXSPRINTTIME),hiro.divetime)); // off:252 | Update Bar value(?)			
			if(SPRINTENABLED==2)
			{// Ork: Sprint was just enabled, set mds
				SPRINTENABLED = TRUE;
			}
			else if(gf(mkf(-5000),hiro.divectr))
			{	// PLAY TIRED ANI AND WAIT
				// TODO: UP
				AI_Wait(hero, 0.1);
				Sprint__TurnOff(swimbar); // Ork: Pasek sprintu wy³aczamy dopiero pe³nym zregenerowaniu [NEW]
				oCStatusBar_SetAlpha(swimbar,255);	
				AI_SetWalkmode(hero,NPC_WALK);
				MEM_InsertKeyEvent(KEY_CAPITAL);
			};
		}else
		{
			hiro.divectr=addf(hiro.divectr,mkf(B_SPRINT_COST_STANDINGBONUS)); // some regenerating bonus	
		};
		//show "swimbar"
		if(Stamina_BarVisible==false)
		{ 
			oCStatusBar_Initialize(swimbar);
		};		
		CALL__thiscall (swimbar,zCViewStatusBar_Init_offset);	
		//Params: Bar, curValue, maxValue
		oCStatusBar_UpdateValue(swimbar,hiro.divectr,mkf(300));
		
		if(!hlp_StrCmp(Sprint_ReInited,"YES"))
		{
			//budzis ty by³
			oCStatusBar_SetAlpha(swimbar,255);
		};		
	}
	else // SPRINTENABLED==FALSE
	{
		//hero is regenerating
		if (Sprint__NpcRunState(hero) != B_SPRINT_RUNSTATE_OTHER)
		{ // take some stamina for RUNNING/JUMP-RUNNING (it will results as slower stamina raising on runing)
			hiro.divectr=subf(hiro.divectr,mkf(B_SPRINT_COST_REGULARRUN)); 
		}else
		{
			hiro.divectr=addf(hiro.divectr,mkf(B_SPRINT_COST_STANDINGBONUS)); // some regenerating bonus	
		};
		if(hiro.divectr<MAXSPRINTTIME)
		{// Params: Bar, curValue, maxValue
			oCStatusBar_UpdateValue(swimbar,hiro.divectr,mkf(300));
		}
		else
		{
			Stamina_BarVisible=0; 		
			oCStatusBar_SetAlpha(swimbar,0);
		};
	};
	Sprint_ReInited = "YES";
};