
//New
func void TA_Cook				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_Cook,				waypoint);};
func void TA_RoastScavenger		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_RoastScavenger,		waypoint);};
func void TA_Guard				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_Guard,				waypoint);};
func void TA_RepairHut			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_RepairHut,			waypoint);};
func void TA_Sleep				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_Sleep,				waypoint);};
func void TA_Listen				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_Listen,				waypoint);};
func void TA_Babe_Sweep			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_Babe_Sweep,			waypoint);};
func void TA_Bathing_Babe		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_Bathing_Babe,		waypoint);};
func void TA_Babe_SitAround		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_Babe_SitAround,		waypoint);};
func void TA_Babe_Dance			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_Babe_Dance,			waypoint);};
func void TA_Babe_Sleep			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_Babe_Sleep,			waypoint);};
func void TA_Babe_Fan			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_Babe_Fan,			waypoint);};
func void TA_PotionAlchemy		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_PotionAlchemy ,		waypoint);};
func void TA_HerbAlchemy		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_HerbAlchemy ,		waypoint);};
func void TA_Preach				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Preach ,				waypoint);};
func void TA_Pray				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Pray ,				waypoint);};
func void TA_PlayTune			(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m,ZS_PlayTune,			waypoint);};
func void TA_Teaching			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Teaching ,			waypoint);};
func void TA_Teaching1h			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Teaching1h ,			waypoint);};
func void TA_CookForMe			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_CookForMe ,			waypoint);};
func void TA_Saw		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Saw ,			waypoint);};
func void TA_TakeBarrel				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_TakeBarrel ,			waypoint);};
func void TA_BarrelTransport		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_BarrelTransport ,			waypoint);};

func void TA_SlaveRest(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	
{
	var int h_dif; 
	var int tmp_h; var int tmp_m;
	var int tmp2_h; var int tmp2_m;
	if(start_h>stop_h)
	{ h_dif=24-start_h+stop_h; }
	else
	{ h_dif=stop_h-start_h;};
	if(h_dif>2)
	{
	tmp_m=start_m+20+Hlp_Random(20);
	tmp_h=start_h;	
	if(tmp_m>59)
	{
		tmp_m-=60;
		tmp_h=start_h+1;
	};
	TA_Min 	(self,	start_h,start_m, tmp_h, tmp_m,ZS_SitCampfire,			waypoint);
	
	tmp2_m=stop_m-20-Hlp_Random(20);
	tmp2_h=stop_h;	
	if(tmp2_m<0)
	{
		tmp2_m+=60;
		tmp2_h=stop_h-1;
	};	
	TA_Min 	(self,	tmp_h,tmp_m, tmp2_h, tmp2_m,ZS_Sleep,			waypoint);
	TA_Min 	(self,	tmp2_h,tmp2_m, stop_h, stop_m,ZS_SitCampfire,			waypoint);
		
	}
	else
	{//Straight goto sleep not much time!
	TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_Sleep,			waypoint);
	};
};


func void TA_Brooming		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Brooming ,			waypoint);};


/////////////////////////////////////////////////////////////////////////
func void TA_FAHunting			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_MCHunting ,			waypoint);};
func void TA_MCHunting			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_MCHunting ,			waypoint);};
func void TA_GuardPassage		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_GuardPassage ,		waypoint);};
func void TA_GuardPatrol		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_GuardPatrol ,		waypoint);};
func void TA_Smoke				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Smoke ,				waypoint);};
func void TA_WalkAround			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_WalkAround ,			waypoint);};
func void TA_WashSelf			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint) {TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_WashSelf ,			waypoint);};
func void TA_ReadBook			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_ReadBook ,			waypoint);};
func void TA_PracticeMagic		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_PracticeMagic ,		waypoint);};
func void TA_BodyGuard			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_BodyGuard ,			waypoint);};
func void TA_PickOre			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_PickOre ,			waypoint);};
func void TA_PickRice			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_PickRice ,			waypoint);};
func void TA_Smith_Anvil		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Smith_Anvil ,		waypoint);};
func void TA_Smith_Cool			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Smith_Cool ,			waypoint);};
func void TA_Smith_Sharp		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Smith_Sharp ,		waypoint);};
func void TA_Smith_Fire			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Smith_Fire ,			waypoint);};
func void TA_PracticeBow		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_PracticeBow ,		waypoint);};
func void TA_PracticeSword		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_PracticeSword ,		waypoint);};
func void TA_PracticeSwordBB		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_PracticeSword ,		waypoint);};
func void TA_JACKIL			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_PracticeSword ,		waypoint);};
func void TA_JACKGETWEPON			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_PracticeSword ,		waypoint);};
func void TA_RunToWP			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_RunToWP,	waypoint);};
//*********************************************
//     Arena
//*********************************************
//func void TA_FightJudge			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_FightJudge ,		waypoint);};
//func void TA_1stFight			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_1stFight ,		waypoint);};
//func void TA_2ndFight			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_2ndFight ,		waypoint);};
//func void ZS_TellAboutFightH		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_TellAboutFightH ,		waypoint);};

// ********************************************
// In Extremo
// ********************************************
func void TA_IEPYMONTE			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_IEPYMONTE ,			waypoint);};
func void TA_IEFLEX				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_IEFLEX ,				waypoint);};
func void TA_IELUTTER			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_IELUTTER ,			waypoint);};
func void TA_IEPFEIFFER			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_IEPFEIFFER ,			waypoint);};
func void TA_IEFLAIL			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_IEFLAIL ,			waypoint);};
func void TA_IETHOMAS			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_IETHOMAS ,			waypoint);};
func void TA_IEUNICORN			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_IEUNICORN ,			waypoint);};
func void TA_Charlotte_Dance	(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_Charlotte_Dance,	waypoint);};
func void TA_Firespit			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_Firespit,			waypoint);};
func void TA_WatchInExtremo		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_WatchInExtremo,		waypoint);};


func void TA_Ebr_HangAround		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Ebr_HangAround ,		waypoint);};
func void TA_TestHangAround		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_TestHangAround ,		waypoint);};
func void TA_TestGotoWP			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_TestGotoWP ,			waypoint);};

func void TA_Meditate			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Meditate ,			waypoint);};
func void TA_Speech				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Speech	 ,			waypoint);};


func void TA_Position			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Position ,			waypoint);};
func void TA_GuidePC			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_GuidePC ,			waypoint);};

func void TA_FollowPCWEzwany			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_FollowPC ,			waypoint);};
func void TA_FollowPC			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_FollowPC ,			waypoint);};
func void TA_GuardPalisade		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_GuardPalisade,		waypoint);};
func void TA_TestBully			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_TestBully,			waypoint);};
func void TA_Orepile			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Orepile,				waypoint);};
func void TA_Walk			    (var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Walk,				waypoint);};
func void TA_MineBellows	    (var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_MineBellows,			waypoint);};
func void TA_PickStonesWall	    (var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_PickStonesWall,			waypoint);};
func void TA_PickStonesGround	    (var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_PickStonesGround,			waypoint);};

func void TA_Smalltalk			(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_Smalltalk,			waypoint);};
func void TA_HSmalltalk			(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_Smalltalk,			waypoint);};
func void TA_Boss				(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_Boss,				waypoint);};
func void TA_Stand				(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_Stand,				waypoint);};
func void TA_SitCampfire		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_SitCampfire,			waypoint);};
func void TA_SitCampfireA		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_SitCampfireA,			waypoint);};
func void TA_SitCampfireG		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_SitCampfireG,			waypoint);};
func void TA_SitCampfireR		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_SitCampfireR,			waypoint);};
func void TA_SitCampfireM		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_SitCampfireM,			waypoint);};
func void TA_SitCampfireT		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_SitCampfireT,			waypoint);};
func void TA_SitCampfireSmalltalk		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_SitCampfireSmalltalk,			waypoint);};
func void TA_SitCampfireSmalltalkHC_1		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_SitCampfireSmalltalkHC_1,			waypoint);};


func void TA_LookForPlayer		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_LookForPlayer,			waypoint);};

func void TA_SitCampfireEat		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_SitCampfireEat,			waypoint);};
func void TA_ArenaSpectator		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_ArenaSpectator,		waypoint);};
func void TA_SittingDuck		(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_SittingDuck,			waypoint);};

//func void TA_GuardItems			(var int start_h, var int start_m, var int stop_h, var int stop_m, var string waypoint)	{TA_Min 	(self,	start_h,start_m, stop_h, stop_m,ZS_GuardItems,			waypoint);};


// ********************************************
//   TAs von Mike
// ********************************************

func void TA_HerbShop			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_HerbShop ,			waypoint);};
// für Fortuno im ST


// ********************************************
//   TAs von Stefan Nyul für Drehkreuzwachen
// ********************************************
func void TA_GuardWheelOpen		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_GuardWheelOpen,		waypoint);};
func void TA_GuardWheelClosed	(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_GuardWheelClosed,	waypoint);};

// ********************************************
//   SN: Neue/Umbenannte TAs
// ********************************************
func void TA_StandAround		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_StandAround,		waypoint);};
func void TA_SitAround			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_SitAround,			waypoint);};
func void TA_Stay				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_Stay,				waypoint);};
func void TA_StayNeutral		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_StayNeutral,		waypoint);};


func void TA_Preach_YBerion		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Preach_YBerion ,		waypoint);};
func void TA_Drained_YBerion	(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_Drained_YBerion,	waypoint);};


// *********************************************
//		SK: Neuer TA für den Orc in der FM
// *********************************************
func void TA_WaitForRescue	(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_WaitForRescue,	waypoint);};


// *********************************************
//	TF: Neue TAs für Orctempel 
// *********************************************
func void TA_HostileGuard				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_HostileGuard,			waypoint);};
func void TA_AlignGuard					(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_AlignGuard,				waypoint);};
func void TA_Intercept					(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_Intercept,				waypoint);};
func void TA_InterceptMadCorKalom		(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_InterceptMadCorKalom,	waypoint);};
func void TA_OTMeditate					(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_OTMeditate ,			waypoint);};
func void TA_Sleeper					(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_Sleeper ,				waypoint);};

func void TA_Explore					(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_Explore ,				waypoint);};
func void TA_Drunk					(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_Drunk ,				waypoint);};


// *********************************************
//    SK: Xardas spezial Buchlese TA 
// *********************************************

func void TA_ReadBook_Xardas			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_ReadBook_Xardas,		waypoint);};

// *********************************************
//    Mission 
// *********************************************
func void TA_Bukhart_Steal			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_Bukhart_Steal,		waypoint);};
func void TA_FollowKira			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_FollowKira,		waypoint);};
func void TA_FollowAngus	(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_FollowAngus,				waypoint);};
func void TA_FollowCavalorn	(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_FollowCavalorn,				waypoint);};
func void TA_GuideToMine	(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_GuideToMine,				waypoint);};



func void TA_DukeFollowPC	(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,  start_h,start_m, stop_h, stop_m, ZS_DukeFollowPC,				waypoint);};
func void TA_Ratford_SpeechToMages				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Speech	 ,			waypoint);};

func void TA_Cavalorn_RytualKatrakanat				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Cavalorn_RytualKatrakanat	 ,			waypoint);};
func void TA_Ratford_RytualKatrakanat				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Ratford_RytualKatrakanat	 ,			waypoint);};
func void TA_Leren_RytualKatrakanat				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Leren_RytualKatrakanat	 ,			waypoint);};

func void TA_Katrakanat_Chase				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Katrakanat_Chase	 ,			waypoint);};
func void TA_Ratford_Kat_GotoPC				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Ratford_Kat_GotoPC	 ,			waypoint);};


func void TA_MM_MonsterTalk				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_MM_MonsterTalk	 ,			waypoint);};
func void TA_Mis_NovPanic				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Mis_NovPanic	 ,			waypoint);};
func void TA_Mis_PanicJump				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Mis_PanicJump	 ,			waypoint);};
func void TA_Mis_PanicFire			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Mis_PanicFire	 ,			waypoint);};
func void TA_MIS_GuardChatchHero			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_MIS_GuardChatchHero	 ,			waypoint);};
func void TA_MIS_ChaseHero			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_MIS_ChaseHero	 ,			waypoint);};
func void TA_MIS_ChaseHeroCloseGate			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_MIS_ChaseHeroCloseGate	 ,			waypoint);};
func void TA_MIS_GuardHeadshoot			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_MIS_GuardHeadshoot	 ,			waypoint);};
func void TA_MIS_TryToCloseSthGate			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_MIS_TryToCloseSthGate	 ,			waypoint);};
func void TA_Babe_VelayaDance			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Babe_VelayaDance	 ,			waypoint);};
func void TA_Tony_GuideToSentry			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Tony_GuideToSentry	 ,			waypoint);};
func void TA_INFO_WaitForPlayer			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_INFO_WaitForPlayer	 ,			waypoint);};
func void TA_GhostStay			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_GhostStay	 ,			waypoint);};
func void TA_NamelessHangAround			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_NamelessHangAround	 ,			waypoint);};
func void TA_Mis_RodneyatLeren			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Mis_RodneyatLeren	 ,			waypoint);};
func void TA_RodericGuide			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_RodericGuide	 ,			waypoint);};
func void TA_TH_ENFORCES			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_TH_ENFORCES	 ,			waypoint);};
func void TA_Kam_Bully			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Kam_Bully	 ,			waypoint);};
func void TA_Gestath_Wait4Harpies			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Gestath_Wait4Harpies	 ,			waypoint);};
func void TA_Gestath_SuspectHero			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Gestath_SuspectHero	 ,			waypoint);};
func void TA_Mis_UrtChangeArmor			(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_Mis_UrtChangeArmor	 ,			waypoint);};



///////////////////////////////////////////////////
//	ORCWARRIOR:Special for weapon group(meatbug)
//////////////////////////////////////////////////
//func void TA_WeaponIsEquiped(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_WeaponIsEquiped ,				waypoint);};
/////////////////////////////////
//OTHERS
func void TA_KillingGRDs					(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_GRDAttacking	 ,				waypoint);};

//func void TA_KillingGRDs					(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_KillingGRDs	 ,				waypoint);};
func void TA_ChallengeTragets					(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_ChallengeTragets	 ,				waypoint);};
func void TA_ChallengeFans					(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m, ZS_ChallengeFans	 ,				waypoint);};	