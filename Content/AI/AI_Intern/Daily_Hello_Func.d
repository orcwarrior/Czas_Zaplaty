var int DailyHello_HeroAttackersCnt;
//say
var int DELAYSAYTIMERACTIVED;//bool
// So simply, delay value will be decremented till it hit 0
// then it will magically be set to -1, when after actual svm was ran, it will be back to normal => 0
CONST int DailyHero_TimeToSayResponse = -1;
var int DailyHello_sayDelay1;
var int DailyHello_othID1;
var string DailyHello_sayMsg1;
//var int IS_1_ON;//bool <-this is tottaly worthless use, sayDelay and simply decrement it
var int DailyHello_sayDelay2;
var int DailyHello_othID2;
var string DailyHello_sayMsg2;
var int DailyHello_sayDelay3;
var int DailyHello_othID3;
var string DailyHello_sayMsg3;

CONST int ZIVILANQUATSCHDIST=300;

FUNC VOID B_DailyHello__SayResponse(var int npcID,var string msg)
{
	// Some mechanics fine-tunning: now when you can't
	// see that other NPC, you probably pass them, and don't care much
	// so then, hero simply will tell nothing, and yeah -> EXCTACT METHOD
	var C_NPC oth;
	if(npcID > 0)
	{
		oth = Hlp_GetNpc(npcID);
	};
	print_s_i_s_i("Hero resp Say...see: ",Npc_CanSeeNpc(hero,oth),", dawn: ",C_NpcIsDown(hero));
	if(!C_NpcIsDown(hero))
	{
		if(!Hlp_IsValidNpc(oth) || Npc_GetDistToNpc(hero,oth) > 500)
		{
			return;
		};
		Npc_ClearAiQueue(hero);	// what if hero is in ZS_Talk? wont it ruin sth? (Ask)	
		if(Hlp_IsValidNpc(oth)){
			AI_LookAtNpc(hero,oth);
		};
		printdebug_ss("DailyHello: hero SVM to say: ",msg);
		AI_OutputSVM(hero,NULL,msg);
	};	
};

// Ork: 'Queue' - huehuehhue XD
FUNC VOID B_DailyHello_AddResponseToQueue(var int msgListener/*not using*/,var string WHAT,var int DELAY)//UseTimeTrigger
{
	// Ork: te magiczne IS_n_ON to poprostu wolne sloty 
	// na jednoczesne opóźnienia gadek hmppf...
	
	// ehh screw it
	// if(!Hlp_IsValidNpc(msgListener))
	// { msgListener = Npc_GetTarget(hero); };
	if(DailyHello_sayDelay1 == 0)
	{		
		Print("Hero resp at:1");
		DailyHello_othID1 	= msgListener;
		DailyHello_sayMsg1	= WHAT;
		DailyHello_sayDelay1= DELAY;
	}
	else if(DailyHello_sayDelay2 == 0)
	{
		Print("Hero resp at:2");
		DailyHello_othID2 	= msgListener;
		DailyHello_sayMsg2	= WHAT;
		DailyHello_sayDelay2= DELAY;
	}
	else if(DailyHello_sayDelay3 == 0)
	{
		Print("Hero resp at:3");
		DailyHello_othID3 	= msgListener;
		DailyHello_sayMsg3	= WHAT;
		DailyHello_sayDelay3= DELAY;
	};
};
Func void B_DailyHello__ResponseUpdate()
{
	if(DailyHello_sayDelay1 > 0)
	{
		DailyHello_sayDelay1-=1;
		if(DailyHello_sayDelay1==0) { B_DailyHello__SayResponse(DailyHello_othID1,DailyHello_sayMsg1);};
	}
	else if(DailyHello_sayDelay2 > 0)
	{
		DailyHello_sayDelay2-=1;
		if(DailyHello_sayDelay2==0) { B_DailyHello__SayResponse(DailyHello_othID2,DailyHello_sayMsg2);};
	}
	else if(DailyHello_sayDelay3 > 0)
	{
		DailyHello_sayDelay3-=1;
		if(DailyHello_sayDelay3==0) { B_DailyHello__SayResponse(DailyHello_othID3,DailyHello_sayMsg3);};
	};
};
///////////////////////////////////////////////////////////////////////////////
///                  check hello
//  ======================
// npc target saying "hello" everday to hero
// using with trigger script and event
//////////////////////////////////////////////////////////////////////////////
// Ork: Komentarz orginalny :D pewnie z ~2006-7
func void B_DailyHello_Update()//(var c_npc trgtnpc)// <-poprostu getTarget
{
	if(wld_getday()<3)
	{
		//Ork: Tymczasowo wylaczam [TESTY]
		//return;
	};
	// Update'uj odpowiedzi bohatera:
	B_DailyHello__ResponseUpdate();
	var int helloSayizer;//i'm a king in random name'ing :p
	var int sayVariant;//like up :d
	helloSayizer=hlp_random(7);
	sayVariant=hlp_random(3);
	var int otherSayVariant; // To jest nie uzywane ?!
	otherSayVariant=hlp_random(50);

	
	Npc_GetTarget(hero);
	if(!Hlp_IsValidNpc(other)) { return; }; // nothing to do on here
	
	// var int othtrgt;
	// othtrgt=npc_gettarget(other);
	// var c_npc othtrgtnpc;
	// othtrgtnpc=hlp_getnpc(othtrgt);

	var int tempAtt2Player; // Ork: A moze raczej temp attitude?
	tempAtt2Player=Npc_GetTempAttitude(other,hero);
	//if(DailyHello_HeroAttackersCnt==false)
	//{
		if((c_npcishuman(other))&& (!c_npcisdown(other)&&(!npc_isinstate(other,zs_talk))))//not unconcious and dead
		{
			if((npc_canseenpc(other,hero))&&(npc_getdisttonpc(other,hero)< 380))
			{
				if(npc_getaivar(other,AIV_HELLOSAYED) < day)
				{
					npc_setaivar(other,AIV_HELLOSAYED,day);
					// Some randomness plus less of getting angry of player
					// by constantly saying stuff, another thing, NPCs with all attitudes
					// can say hello to hero, but most likely they say it when they're friends (4/7) and only 1/7 if they hostile.
					var int dontCareBoutHero;
					dontCareBoutHero = helloSayizer + (tempAtt2Player+1)/2; // rnd + (0;1;1;2)
					if(dontCareBoutHero < 5)
					{ return; }
					
					if(C_BodyStateContains(other,bs_sit))
					{
						AI_LookAtNpc(other,hero);
					}
					else
					{
						Npc_ClearAiQueue(other);
						B_SmartTurnToNpc(other,hero);
						//printscreen           ("start saying",50,40,"font_old_10_white.tga",2);
						if(C_BodyStateContains(other,bs_iteminteract)||C_BodyStateContains(other,bs_mobinteract)||C_BodyStateContains(other,bs_mobinteract_interrupt))
						{
							Npc_ClearAiQueue(other);
							B_StandUp(other);
							Npc_ClearAiQueue(other);
						};
						if(tempAtt2Player==att_neutral)
						{
							AI_OutputSVM(other,null,"$whatdoyouwant");
							if(npc_getaivar(other,aiv_wasdefeatedbysc)==true)
							{
								if(sayVariant==1)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$youwannafoolme",3);
								}
								else if(sayVariant==2)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$youstillnothaveenough",3);
								}
								else if(sayVariant==3)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$lookingfortroubleagain",3);
								};
							}
							else if(npc_getaivar(other,aiv_hasdefeatedsc)==true)
							{
								if(sayVariant==1)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$youdefeatedmewell",3);
								}
								else if(sayVariant==2)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$letsforgetourlittlefight",3);
								}
								else if(sayVariant==3)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$yesyes",3);
								};
							};
						}
						else if(tempAtt2Player==att_angry)
						{
							AI_OutputSVM(other,null,"$getoutofhere");
							if(npc_getaivar(other,aiv_wasdefeatedbysc)==true)
							{
								if(sayVariant==1)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$youwannafoolme",3);
								}
								else if(sayVariant==2)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$youstillnothaveenough",3);
								}
								else if(sayVariant==3)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$lookingfortroubleagain",3);
								};
							}
							else if(npc_getaivar(other,aiv_hasdefeatedsc)==true)
							{
								if(sayVariant==1)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$youdefeatedmewell",3);
								}
								else if(sayVariant==2)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$letsforgetourlittlefight",3);
								}
								else if(sayVariant==3)
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$yesyes",3);
								};
							};
						}
						else if(tempAtt2Player==att_friendly)
						{
							B_StandUp(other);
							Npc_ClearAiQueue(other);
							AI_OutputSVM(other,null,"$friendlygreetings");
							if(Hlp_Random(2)!=0) {return; };
							B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$friendlygreetings",2);
						}
						else if(tempAtt2Player==att_hostile)
						{
							AI_OutputSVM(other,null,"$diemortalenemy");
							AI_OutputSVM(other,null,"$nowwait");
							if(npc_hasreadiedmeleeweapon(other))
							{
								B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$weapondown",3);
							}
							else if(npc_hasreadiedrangedweapon(other))
							{
								if(npc_gettarget(other)==hlp_getinstanceid(hero))
								{
									B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$watchyouraim",3);
								};
							};
							if(sayVariant==1)
							{
								B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$nowwaitintruder",2);
							}
							else if(sayVariant==2)
							{
								B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$nowwait",2);
							}
							else if(sayVariant==3)
							{
								B_DailyHello_AddResponseToQueue(Hlp_GetInstanceID(other),"$diemonster",2);
							};
							// Lepiej zeby AI (nawet kulejące) samo w sobie sie zajelo takimi sprawami:
							// npc_settarget(other,hero);
							// ai_startstate(other,zs_attack,1,""); 
						};//att_hostile
					};//bs
				};//hellosayed
			};//(npc_getdisttonpc(hero,other) < 250)
		};//c_npcishuman	
	//};
};
