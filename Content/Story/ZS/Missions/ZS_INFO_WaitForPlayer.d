func void B_TriggerInfoCam()
{
   //    AI_PlayAni (self,"T_HGUARD_2_STAND");	
   //   Npc_ClearAiQueue(self);		
	B_SmartTurnToNpc(self,hero);	
	WLD_SendTrigger("INFO_CAM");
	Global_Cinematic_FORCEANIS=FALSE;
	CinematicReset(2,0);
/*0*/	CinematicDialog(RBL_4064_Info,pc_hero,"W koñcu jesteœ. Urt dobrze ciê opisa³, rzeczywiœcie masz paskudn¹ mordê...","DIA_Infor_First_13_00.WAV",4);
/*1*/	CinematicDialog(pc_hero,RBL_4064_Info,"Nie przyszed³em tu, ¿eby pogadaæ o moim wygl¹dzie. Mów, co siê sta³o w obozie.","DIA_Infor_First_15_01.WAV",5);		
/*2*/	CinematicDialog(RBL_4064_Info,pc_hero,"Stra¿nicy uderz¹ na Obóz Rebeliantów!","DIA_Infor_First_13_02.WAV",3);		
/*3*/	CinematicDialog(pc_hero,RBL_4064_Info,"O kurwa! Muszê ostrzec Ratforda i resztê... Co to za ha³as?","DIA_Infor_First_15_03.WAV",4);		
/*4*/	CinematicDialog(RBL_4064_Info,pc_hero,"Stra¿nicy! Musieli iœæ za mn¹ od obozu.","DIA_Infor_First_13_04.WAV",2);		
/*5*/	CinematicDialog(RBL_4064_Info,pc_hero,"","",9);		
/*6*/	CinematicDialog(RBL_4064_Info,pc_hero,"Uciekaj, postaram siê ich zatrzymaæ jak najd³u¿ej...","DIA_Infor_First_13_05.WAV",3);		
/*7*/	CinematicDialog(Nameless_SecondMeet,pc_hero,"Mo¿e pomogê.","DIA_Infor_First_13_06.WAV",2);		

   Log_CreateTopic(CH3_RBL_OldCampAttack, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_OldCampAttack, LOG_RUNNING);
	B_LogEntry(CH3_RBL_OldCampAttack, "Gomez zaatakuje Obóz Rebeliantów. Wszyscy siê tego spodziewali, ale by³em pewien, ¿e atak nie nast¹pi tak szybko. Muszê ostrzec Ratforda i resztê.");

	Log_SetTopicStatus(CH3_RBL_OldCampInfo, LOG_SUCCESS);
	B_LogEntry(CH3_RBL_OldCampInfo, "Informator Urta powiedzia³ mi, ¿e stra¿nicy uderz¹ na Obóz Rebeliantów. Muszê ostrzec Ratforda!");
   
   Rick_meets_informant = true;
};

func void ZS_INFO_WaitForPlayer()
{	
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	Npc_PercEnable  (self,	PERC_ASSESSTALK, 	B_TriggerInfoCam);
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);
	AI_GotoWP		(self, self.wp);
	
	if (Wld_IsFPAvailable(self,"FP_STAND"))
	{																	


	}
	else
	{
	};
	
};

func void ZS_INFO_WaitForPlayer_loop()
{
	var int zufall;
	zufall = Hlp_Random(1000);
	if (Npc_GetDistToNpc(self,hero)<800)
	{
		B_SmartTurnToNpc(self,hero);
	}
	else
	{
		AI_AlignToFP	(self);
		if (zufall >= 600)
    	{
    		AI_PlayAni (self,"T_SEARCH");
    	};
	};
	
    AI_WAIT(self,1);
};

func void ZS_INFO_WaitForPlayer_end()
{
};	


