//////////////////////////////////////////////////////////////////////////
//	ZS_MIS_INFO_TRAP
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_MIS_INFO_TRAP()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_MIS_INFO_TRAP");
	AI_SetWalkmode  	(self, 	NPC_RUN);	
	
	if(Npc_IsDead(hero)){return;};	

	AI_WAIT(self,1);	
	if (self.id == 2732)
	{
		AI_ReadyRangedWeapon(self);		
		
	}
	else
	{
		AI_ReadyMeleeWeapon(self);		
	};
};

func void ZS_MIS_INFO_TRAP_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_MIS_INFO_TRAP_Loop");
	//PrintGlobals		(PD_MST_DETAIL);

	AI_Wait				(self,	2);
	AI_GotoWP (self, "OW_PATH_1_16_7");
	var c_npc infor;
	infor = Hlp_GetNpc(RBL_4064_Info);
			if (self.id == 2732)
 	{
		AI_WAIT(self,4);
		Npc_SetTarget(self,infor); 			
		
		Npc_SetAivar(infor,AIV_INVINCIBLE,false);
		AI_StartState		(self,	ZS_Attack, 0, "");
		NPC_ExchangeRoutine(self,"follow");	
		return;		 	
 	}
 	else
 	{
	AI_WAIT(self,1);
	AI_GotoWP (self, "OW_PATH_1_16_8");	
	AI_WAIT(self,3);	
	AI_WAITMS(self,600);	
	AI_GotoWP (self, hero.wp);	
	B_ExchangeRoutine(self,"follow");	 	
 	};

	
};

func void ZS_MIS_INFO_TRAP_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_MIS_INFO_TRAP_End");

	self.senses =		hero.senses;

};

