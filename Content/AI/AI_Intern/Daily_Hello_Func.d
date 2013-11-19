VAR INT DailyHello_SayingState;
VAR INT DailyHello_HeroAttackersCnt;
//say
VAR INT SAYTIMER;
VAR INT DELAYSAYTIMERACTIVED;//bool
//1
VAR INT SAYDELAY1;
VAR STRING SAYSTRING1;
VAR C_NPC TALKER1;
VAR INT IS_1_ON;//bool
//2
VAR INT SAYDELAY2;
VAR STRING SAYSTRING2;
VAR C_NPC TALKER2;
VAR INT IS_2_ON;//bool
//3
VAR INT SAYDELAY3;
VAR STRING SAYSTRING3;
VAR C_NPC TALKER3;
VAR INT IS_3_ON;//bool
CONST INT ZIVILANQUATSCHDIST=300;
FUNC VOID B_DELAYSAYTIMER()
{
	//if (!C_NpcIsDown(hero)&&!C_NpcIsDown(other))
	//{
	if (C_NpcIsDown(hero))
	{
		DELAYSAYTIMERACTIVED=FALSE;
		return; // Woot?
	}
	if(IS_3_ON==TRUE)
	{
		Npc_ClearAiQueue(hero);
		
		if(C_BodyStateContains(hero,BS_SIT))
		{
			AI_LookAtNpc(hero,other);
		}
		else
		{
			B_SmartTurnToNpc(hero,other);
			AI_OUTPUTSVM(hero,NULL,SAYSTRING3);
			IS_1_ON=FALSE;//bool
		};
	}
	else if(IS_2_ON==TRUE)
	{
		Npc_ClearAiQueue(hero);
		if(C_BodyStateContains(hero,BS_SIT))
		{
			AI_LookAtNpc(hero,other);
		}
		else
		{
			B_SmartTurnToNpc(hero,other);
			AI_OUTPUTSVM(hero,NULL,SAYSTRING2);
			IS_2_ON=FALSE;//bool
		};
	}
	else if(IS_1_ON==TRUE)
	{
		Npc_ClearAiQueue(hero);
		if(C_BodyStateContains(hero,BS_SIT))
		{
			AI_LookAtNpc(hero,other);
		}
		else
		{
			B_SmartTurnToNpc(hero,other);
			AI_OUTPUTSVM(hero,NULL,SAYSTRING1);
			IS_3_ON=FALSE;//bool
		};
	};
};

FUNC VOID B_SAYWITHDELAYINIT(VAR C_NPC WHOSAY/*not using*/,VAR STRING WHAT,VAR INT DELAY)//UseTimeTrigger
{
	// Ork: te magiczne IS_n_ON to poprostu wolne sloty 
	// na jednoczesne opóźnienia gadek hmppf...
	if(IS_1_ON !=TRUE)
	{
		//PrintScreen		("Is_1_On = TRUE", -1,20,"font_old_10_white.tga",1);
		SAYDELAY1=DELAY;
		SAYSTRING1=WHAT;
		IS_1_ON=TRUE;//bool
	}
	else if(IS_1_ON==TRUE)
	{
		SAYDELAY2=DELAY;
		SAYSTRING2=WHAT;
		IS_2_ON=TRUE;//bool
	}
	else if(IS_2_ON==TRUE)
	{
		SAYDELAY3=DELAY;
		SAYSTRING3=WHAT;
		IS_3_ON=TRUE;//bool
	};
	WLD_SENDTRIGGER("SEC2DELAYER");
};

///////////////////////////////////////////////////////////////////////////////
///                  check hello
//  ======================
// npc target saying "hello" everday to hero
// using with trigger script and event
//////////////////////////////////////////////////////////////////////////////
// Ork: Komentarz orginalny :D pewnie z ~2006-7
func void b_checkhello(var c_npc trgtnpc)
{
	if(wld_getday()<3)
	{
		//Ork: Tymczasowo wylaczam [TESTY]
		//return;
	};
	var int hellosayizer;//i'm a king in random name'ing :p
	var int sayvariantizer;//like up :d
	hellosayizer=hlp_random(2);
	sayvariantizer=hlp_random(3);
	var int hello_othsayizer;
	hello_othsayizer=hlp_random(50);

	var int othtrgt;
	othtrgt=npc_gettarget(trgtnpc);

	var c_npc othtrgtnpc;
	othtrgtnpc=hlp_getnpc(othtrgt);

	var int reacttoplayer;
	reacttoplayer=npc_getpermattitude(trgtnpc,hero);
	if(DailyHello_SayingState != 0)
	{
		if(DailyHello_HeroAttackersCnt==false)
		{
			////printdebugnpc(pd_zs_detail,"check hello");
			if(hlp_isvalidnpc(trgtnpc))
			{
				if((c_npcishuman(trgtnpc))&&(!c_npcisdown(trgtnpc)&&(!npc_isinstate(trgtnpc,zs_talk))))//not unconcious and dead
				{
					//printscreen           (trgtnpc.name,30,40,"font_old_10_white.tga",2);
					//printscreen           ("react to hero: ",10,40,"font_old_10_white.tga",2);
					//printscreen           (inttostring(npc_getpermattitude(trgtnpc,hero)),10,90,"font_old_10_white.tga",2);

					if(hellosayizer==1)
					{

						if((npc_canseenpc(trgtnpc,hero))&&(npc_getdisttonpc(trgtnpc,hero)< 380))
						{
							//printscreen           ("dist to player < 250",50,40,"font_old_10_white.tga",2);
							if(npc_getaivar(trgtnpc,AIV_HELLOSAYED) < day)
							{
								npc_setaivar(trgtnpc,AIV_HELLOSAYED,day);
								if(C_BodyStateContains(trgtnpc,bs_sit))
								{
									ai_lookatnpc(trgtnpc,hero);
								}
								else
								{
									Npc_ClearAiQueue(trgtnpc);
									b_smartturntonpc(trgtnpc,hero);
									//printscreen           ("start saying",50,40,"font_old_10_white.tga",2);
									if(C_BodyStateContains(trgtnpc,bs_iteminteract)||C_BodyStateContains(trgtnpc,bs_mobinteract)||C_BodyStateContains(trgtnpc,bs_mobinteract_interrupt))
									{
										Npc_ClearAiQueue(trgtnpc);
										B_StandUp(trgtnpc);
										Npc_ClearAiQueue(trgtnpc);
									};

									if(reacttoplayer==att_neutral)
									{
										ai_outputsvm(trgtnpc,null,"$whatdoyouwant");
										if(npc_getaivar(trgtnpc,aiv_wasdefeatedbysc)==true)
										{
											if(sayvariantizer==1)
											{
												B_SayWithDelayInit(hero,"$youwannafoolme",5);
											}
											else if(sayvariantizer==2)
											{
												B_SayWithDelayInit(hero,"$youstillnothaveenough",5);
											}
											else if(sayvariantizer==3)
											{
												B_SayWithDelayInit(hero,"$lookingfortroubleagain",5);
											};
										}
										else if(npc_getaivar(trgtnpc,aiv_hasdefeatedsc)==true)
										{
											if(sayvariantizer==1)
											{
												B_SayWithDelayInit(hero,"$youdefeatedmewell",5);
											}
											else if(sayvariantizer==2)
											{
												B_SayWithDelayInit(hero,"$letsforgetourlittlefight",5);
											}
											else if(sayvariantizer==3)
											{
												B_SayWithDelayInit(hero,"$yesyes",5);
											};
										};
									}
									else if(reacttoplayer==att_angry)
									{
										ai_outputsvm(trgtnpc,null,"$getoutofhere");
										if(npc_getaivar(trgtnpc,aiv_wasdefeatedbysc)==true)
										{
											if(sayvariantizer==1)
											{
												B_SayWithDelayInit(hero,"$youwannafoolme",2);
											}
											else if(sayvariantizer==2)
											{
												B_SayWithDelayInit(hero,"$youstillnothaveenough",2);
											}
											else if(sayvariantizer==3)
											{
												B_SayWithDelayInit(hero,"$lookingfortroubleagain",2);
											};
										}
										else if(npc_getaivar(trgtnpc,aiv_hasdefeatedsc)==true)
										{
											if(sayvariantizer==1)
											{
												B_SayWithDelayInit(hero,"$youdefeatedmewell",2);
											}
											else if(sayvariantizer==2)
											{
												B_SayWithDelayInit(hero,"$letsforgetourlittlefight",2);
											}
											else if(sayvariantizer==3)
											{
												B_SayWithDelayInit(hero,"$yesyes",2);
											};
										};
									}
									else if(reacttoplayer==att_friendly)
									{
										B_StandUp(trgtnpc);
										Npc_ClearAiQueue(trgtnpc);
										ai_outputsvm(trgtnpc,null,"$friendlygreetings");
										B_SayWithDelayInit(hero,"$friendlygreetings",5);
									}
									else if(reacttoplayer==att_hostile)
									{
										ai_outputsvm(trgtnpc,null,"$diemortalenemy");
										ai_outputsvm(trgtnpc,null,"$nowwait");
										if(npc_hasreadiedmeleeweapon(trgtnpc))
										{
											B_SayWithDelayInit(hero,"$weapondown",2);
										}
										else if(npc_hasreadiedrangedweapon(trgtnpc))
										{
											if(npc_gettarget(trgtnpc)==hlp_getinstanceid(hero))
											{
												B_SayWithDelayInit(hero,"$watchyouraim",2);
											};
										};
										if(sayvariantizer==1)
										{
											B_SayWithDelayInit(hero,"$nowwaitintruder",2);
										}
										else if(sayvariantizer==2)
										{
											B_SayWithDelayInit(hero,"$nowwait",2);
										}
										else if(sayvariantizer==3)
										{
											B_SayWithDelayInit(hero,"$diemonster",2);
										};

										npc_settarget(trgtnpc,hero);
										ai_startstate(trgtnpc,zs_attack,1,"");
									};//att_hostile
								};//bs
							};//hellosayed
						};//(npc_getdisttonpc(hero,trgtnpc) < 250)
					};//hellosayizer == 1
				};//c_npcishuman
			};//isvaildnpc
		};
	};
	wld_sendtrigger("hellotrriger");//stupid mistake :d ("rr")
};
