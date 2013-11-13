func void ZS_SitCampfireEat()
{

	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	
	if (!C_BodyStateContains(self, BS_SIT))
	{
		AI_StandUp		(self);				
		AI_SetWalkmode 	(self,NPC_WALK);
		AI_GotoWP		(self, self.wp);
		
		if (Wld_IsFPAvailable(self,"FP_CAMPFIRE"))
		{																	
			AI_GotoFP (self, "FP_CAMPFIRE");
		}
		else
		{
			AI_StartState(self, ZS_Stand, 0, "");
		};
		
		Npc_SetAivar(self,AIV_HANGAROUNDSTATUS,  1);
		AI_PlayAniBS (self,"T_STAND_2_SIT",BS_SIT);
	};
	AI_AlignToFP( self );				//Richte Dich aus
};

func int ZS_SitCampfireEat_loop()
{
	var int zufall;
var int ReactToPlayer;	
var int Say_Greet;
	zufall = Hlp_Random(100);
	
	if (zufall >= 90)
	{
	B_PlayItemRandoms 	(self);	
	}
	else if (zufall >= 80)
	{
	B_ChooseJoint		(self);	
	
	}
	else if (zufall >= 70)	
	{
		B_EatSmall 	(self);	
	}
		else if (zufall >= 60)	
	{
		B_EatHuge 	(self);	
	}
			else if (zufall >= 55)	
	{
		B_EatHuge 	(self);	
	}
			else if (zufall >= 50)	
	{
		B_ThrowApple 	(self);	
	}
				else if (zufall >= 45)	
	{
		B_DrinkBottle 	(self);	
	}
				else if (zufall >= 40)	
	{
		B_ChooseCheese 	(self);	
	}	

	else if (zufall >= 20)
	{
// 	if(Wld_IsTime (04,00,10,11)&&(AwakeVoicePlayed == FALSE))
// 	{
// 	AwakeVoicePlayed = TRUE;
// 	AI_OutputSVM				(self, NULL, "$AWAKE");
// 	};
	}
	else if (zufall >= 0)
	{
	B_PlayItemRandoms 	(self);	
	};
	AI_Wait		(self, 1);	
	return				LOOP_CONTINUE;
	
	
};
	

func void ZS_SitCampfireEat_end()
{
	AI_PlayAni(self,"T_SIT_2_STAND");	
};