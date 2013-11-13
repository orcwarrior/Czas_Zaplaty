//////////////////////////////////////////////////////////////////////////
//	ZS_Teaching
//	===========
//	Der NSC stellt sich auf einen "TEACHING"-Freepoint und gestikuliert
//////////////////////////////////////////////////////////////////////////
func void ZS_Teaching1h()
{	
    //PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teaching1h");
    
	B_SetPerception 	(self);
	AI_SetWalkmode 		(self,	NPC_WALK);	

	//-------- Grobpositionierung --------
	if !(Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP		(self,	self.wp);       
	};
};

func void ZS_Teaching1h_Loop ()
{
    //PrintDebugNpc		(PD_TA_LOOP,	"ZS_Teaching1h_Loop");
	        

	var int guardreaktion;
	guardreaktion = 	Hlp_Random (1000);
	
	if (guardreaktion >= 900)
	{
		AI_PlayAni		(self,"T_DIALOGGESTURE_11");
	}
	else if (guardreaktion >= 800)
	{
	AI_DrawWeapon		(self);
	AI_PlayAni			(self,"T_1HSFREE");
		AI_PlayAni		(self,"T_DIALOGGESTURE_15");
	B_RemoveWeapon		(self);
	}
	else if (guardreaktion >= 700)
	{
		AI_DrawWeapon		(self);
		AI_PlayAni 		(self,"T_DIALOGGESTURE_16");
	B_RemoveWeapon		(self);
	AI_UseMob		(self,"BENCH",1);	
	}
else if (guardreaktion >= 200)
	{
		AI_DrawWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
		AI_PlayAni 		(self,"T_DIALOGGESTURE_1");
		AI_PlayAniBS (self,"T_STAND_2_SIT",BS_SIT);
	
	}
	else if (guardreaktion >= 600)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_18");
		AI_UseMob		(self,"BENCH",1);
			AI_PlayAniBS (self, "R_BENCH_RANDOM_1",BS_SIT);
			AI_PlayAniBS (self, "R_BENCH_RANDOM_4",BS_SIT);
			AI_PlayAniBS (self, "R_BENCH_RANDOM_2",BS_SIT);
	AI_PlayAniBS (self, "R_BENCH_RANDOM_3",BS_SIT);	
	AI_PlayAniBS (self, "R_BENCH_RANDOM_2",BS_SIT);	
	AI_PlayAniBS (self, "R_BENCH_RANDOM_3",BS_SIT);
	AI_PlayAni 		(self,"T_DIALOGGESTURE_1");
	AI_PlayAni 		(self,"T_DIALOGGESTURE_8");
	AI_PlayAni 		(self,"T_DIALOGGESTURE_3");
	AI_PlayAni 		(self,"T_DIALOGGESTURE_14");	
	AI_DrawWeapon		(self);
	B_RemoveWeapon		(self);

	}
	else if (guardreaktion >= 500)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_21");
	}
	else if (guardreaktion >= 400)
	{
	
		AI_PlayAni 		(self,"T_DIALOGGESTURE_20");
	};
	
	AI_Wait				(self,	1);
};


func void ZS_Teach_End ()
{
	//PrintDebugNpc		(PD_TA_FRAME,	"ZS_Teach1h_End");
};

