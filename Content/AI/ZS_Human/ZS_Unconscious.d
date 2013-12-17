//Funkcja warunkowa
// -false oCNpc slf bêdzie odrazu martwy
// -true oCNpc slf upadnie na ziemie
// warunki dowolne
// obawiam siê ze moga wydarzyæ siê wypadki gdy oth nie jest wcale
// oCNPC a jedynie cymœ zupe³nie losowym, wiec lepiej u¿ywaæ tego ostro¿nie!
func int  Npc_CanBeUnconscious(var oCNpc slf,var oCNpc oth)
{

	if((slf.variousFlags & NPC_FLAG_INSTANTDEATH) != false)
	||((oth.variousFlags & NPC_FLAG_KILLER) != false)
	||(self.guild == GIL_TPL)//skeleton archer (TPL) dead instantly
	{
		return FALSE;
	};
	return TRUE;	
};

//Hook caled before oCNpc_DropUnconscious
func void HOOK_PREUNCONSCIOUS()
{
	var oCNpc npc; var oCNpc oth;

	//ECX to oCNPC wiec ECX+0x100 to C_NPC (taki cast nie dzia³a, caloœæ oparta na oCNPC
	MEM_AssignContentInst (npc,GetECX());	
	MEM_AssignContentInst (oth,GetESP()+128);	
	
	//Npc_ClearAiQueue(self) -> but in oCNPC way ;-)
	CALL__thiscall (MEM_InstToPtr(npc), oCNpc__ClearEM_offset);
	CALL__thiscall (npc.anictrl, oCAniCtrl_Human_StopTurnAnis_offset);
	
	if(Npc_CanBeUnconscious(npc,oth))
	{//Npc Normalnie upada na ziemie
	MEM_WriteInt(HookEngine_Hook_PreUnconscious_JmpAdress,7630776+6);	
	}
	else
	{//Npc odrazu umiera (7630776 = 1 arg. wywolania HookEngine w Startup + 6 = 2 arg. wywo³ania
	MEM_WriteInt(HookEngine_Hook_PreUnconscious_JmpAdress,7632080);	
	};
		
};


func void ZS_Unconscious ()
{	

	Npc_PercDisable(Self,PERC_NPCCOMMAND);	
	
	B_RemoveMobItems(self);
	
	//PrintDebugNpc		(PD_ZS_FRAME, "ZS_Unconscious" );		
	if ((self.flags&NPC_FLAG_INSTANTDEATH) != 0)// ||((other.flags & NPC_FLAG_KILLER) == NPC_FLAG_KILLER)
	{
 		var int ptr;    var int othptr;
 		ptr = oCNpc_GetPointer(self);
 		othptr   = oCNpc_GetPointer(OTHER);
 		if(self.id==2770)&&(ptr)//OR Attack GRD - make them unaimable
 		{
			MEM_WriteInt(ptr+160,0);//npc.type offset	
 		};	
 		//PrintDebugNpc	(PD_ZS_CHECK, "...NSC ertrinkt!" );		
		return;	
	};				
	C_ZSInit();
	Npc_PercEnable  	(self , PERC_ASSESSMAGIC,		B_AssessMagic				);	
//DUALFIX


	if(DualBugfix)&&(Npc_IsPlayer(self))
	{
		B_PrintDebug("FIX");
		//AI_PlayAni( self, "T_DUALLIEFIX");		
		DualBugfix=FALSE;	
		
		var int i; var int id;
		Npc_GetInvItem(hero,LSWD_ID);
		id = Hlp_GetInstanceID(item);
		i=Npc_HasItems(hero,id); 
		Npc_RemoveInvItems(hero,id,i); 
		if(i==1)
		{
		CreateInvItem(hero,id);		
		}
		else{ CreateInvItems(hero,id,i); };
		D_0();


	};


	Mdl_ApplyRandomAni	( self, "S_WOUNDED","T_WOUNDED_TRY");
	Mdl_ApplyRandomAniFreq	( self, "S_WOUNDED", 8);
	if(!C_NpcISHuman(self))
	{
		Npc_SetAivar(self,AIV_PLUNDERED,  FALSE);
	};
	if(self.guild == GIL_TPL)
	{
		Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");							
	//	AI_PlayAni( self, "T_WOUNDEDB_2_DEADB");	
	//	AI_PlayAni( self, "S_DEADB");	
		Npc_ClearAIQueue(self);					
		B_KillNpc(self);	
		AI_StartState 		(self, ZS_Dead, 0, "");		
	};
	//SN 24.09.00: für die PublisherDemo auskommentiert, da die Animationen noch nicht toll sind (Absprache mit Alex) -> wenn bessere Animationen da sind, wieder einkommentieren!
	// They're fuckin awesome O_O
	Mdl_ApplyRandomAni	( self, "S_WOUNDEDB","T_WOUNDEDB_TRY");
	Mdl_ApplyRandomAniFreq	( self, "S_WOUNDEDB", 8);
	
	if (Npc_CanSeeNpc 	(self, other)  &&  self.guild < GIL_SEPERATOR_ORC )
	{
		//PrintDebugNpc	(PD_ZS_CHECK, "...NSC kann Täter sehen!" );
		if (!Npc_IsPlayer	( self))
		{				
			B_AssessAndMemorize(NEWS_DEFEAT, NEWS_SOURCE_WITNESS, self, other, self);
		};
	};

	C_StopLookAt 		(self);
	AI_StopPointAt 		(self);

	if (C_BodyStateContains(self, BS_SWIM))
	{
		//PrintDebugNpc	(PD_ZS_CHECK, "...NSC ertrinkt!" );				
		AI_StartState	(self,	ZS_Dead,	0,	"");
		return;
	};

	//-------- Erfahrungspunkte für den Spieler ? --------
	if	(Npc_IsPlayer   (other))
	{
		//exp points GIVEN in DamageSystem_Func!!!
		if(!Npc_IsInFightMode(other,FMODE_MELEE))
		{
		B_UnconciousXP(1);
		};
		if(HeroHasPupil)
		{
			Pupil_UnconciousXP(2);		
		};
		Npc_SetAivar(self, AIV_WASDEFEATEDBYSC ,  TRUE);	// vergibt XP an SC
	};
	if(C_NpcIsHuman  (other) && Npc_GetAivar(other,AIV_PARTYMEMBER))||(C_NpcIsMonster(other) && Npc_GetAivar(other,AIV_MM_PARTYMEMBER))
	{
		B_UnconciousXP(2);
		Npc_SetAivar(self, AIV_WASDEFEATEDBYSC ,  TRUE);
		if(HeroHasPupil)&&(CmpNpc(MyWolf,other))
		{
			Pupil_UnconciousXP(1);		
		}
		else if(HeroHasPupil)
		{
			Pupil_UnconciousXP(2);			
		};		
	};				


	if ( Npc_IsPlayer	(self ) )
	{
		//PrintDebugNpc	(PD_ZS_CHECK, "...SC besiegt!" );				
		Npc_SetAivar(other, AIV_HASDEFEATEDSC ,  TRUE);
	};
	
	
	//special react to damage: 
	//(for hero it's done in damage system)
	if (!Npc_IsPlayer(other))
	{
		B_SpecialCombatDamageReaction(self,other);
	};
};
	
func int ZS_Unconscious_Loop ()
{	
	//PrintDebugNpc( PD_ZS_LOOP, "ZS_Unconscious_Loop" );	
	if (Npc_GetStateTime (self) > 10+Hlp_Random(HAI_TIME_UNCONSCIOUS))
	{
		//PrintDebugNpc( PD_ZS_CHECK, "...Schleifen-Ende" );				
		return 1;
	};
	
	AI_Wait			(self,	1.0);
};

func void ZS_Unconscious_End ()
{	
	//PrintDebugNpc( PD_ZS_FRAME, "ZS_Unconscious_End" );
	
	//-------- Bewußtloser ist ein ORK --------
	if ( C_NpcIsOrc(self) &&  !Npc_IsPlayer(self) )
	{
		//PrintDebugNpc(PD_ZS_FRAME, "ZS_Unconscious_End: Me, Orc -> temp-HOSTILE" );
		AI_StandUp( self );
		Npc_PerceiveAll ( self);
		if	( Wld_DetectItem (self, ITEM_KAT_NF) || Wld_DetectItem (self, ITEM_KAT_FF) )
		{
			//PrintDebugNpc( PD_ZS_CHECK, "ZS_Unconscious_End: Me, Orc -> Waffe aufheben" );
			if	Npc_CanSeeItem(self,item)
			{
				AI_TakeItem ( self, item );
			};
		};
		Npc_SetTempAttitude( self, ATT_HOSTILE );
		AI_ContinueRoutine( self );
		return;
	};

	//-------- Temporäre Attitüde werden wieder zurückgesetzt --------
	if (!Npc_IsPlayer(self))
	{
		B_ResetTempAttitude(self);
	};

	//-------- Aufstehen & Umsehen ! --------
	AI_StandUp 		(self);
	AI_StopLookAt	(self);

	//-------- den eigenen Besieger anquatschen ! -------- 
	if (Npc_HasNews 	(self,	NEWS_DEFEAT, other, self) 	&&
		!Npc_IsInState	(other,	ZS_Unconscious)				&&
		!Npc_IsDead		(other)									)
	{
		//PrintDebugNpc( PD_ZS_CHECK, "...NSC kann den Attackierer noch sehen und der ist bei Bewußtsein!" );				
		AI_Quicklook ( self, other);
		if (C_AmIStronger ( self, other))
		{
			B_Say ( self, other, "$YOULLBESORRYFORTHIS");
		}
		else if (Npc_GetPermAttitude(self,other)!=ATT_HOSTILE)
		{
			B_Say ( self, other,  "$YESYES");
		};
	};

	//-------- fallgelassene Waffe aufheben... --------
	if (!Npc_IsPlayer	(self ) )
	{
		B_RegainDroppedWeapon(self);
	};
	//-------- Heilen ! --------
	AI_StartState			(self,	ZS_HealSelf,	1,	"");
};

