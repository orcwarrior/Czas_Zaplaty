func int GetTeam(var C_NPC slf)
{
	var int instance;
	instance = Hlp_GetInstanceID(slf);
	
if
(instance == Hlp_GetInstanceID(NPC_tm1ld))||
(instance == Hlp_GetInstanceID(NPC_tm1m1))||
(instance == Hlp_GetInstanceID(NPC_tm1m2))||
(instance == Hlp_GetInstanceID(NPC_tm1m3))
{
return 1;	
}
else if
(instance == Hlp_GetInstanceID(NPC_tm2ld))||
(instance == Hlp_GetInstanceID(NPC_tm2m1))||
(instance == Hlp_GetInstanceID(NPC_tm2m2))||
(instance == Hlp_GetInstanceID(NPC_tm2m3))
{
return 2;	
}
else{ return 0;};
	
		
};

func int B_ChallFoundErrors()
{
	if NPC_tm1ld == NPC_tm1m1 || NPC_tm1ld == NPC_tm1m2 || NPC_tm1ld == NPC_tm1m3 || NPC_tm1m1 == NPC_tm1m2 || NPC_tm1m1 == NPC_tm1m3 || NPC_tm1m2 == NPC_tm1m3 ||/*END TEAM A*/ NPC_tm2ld == NPC_tm2m1 || NPC_tm2ld == NPC_tm2m2 || NPC_tm1ld == NPC_tm2m3 || NPC_tm2m1 == NPC_tm2m2 || NPC_tm2m1 == NPC_tm2m3 || NPC_tm2m2 == NPC_tm2m3
	{ return 1;}
	else if NPC_tm1ld == NPC_tm2ld || NPC_tm1ld == NPC_tm2m1 || NPC_tm1ld == NPC_tm2m2 || NPC_tm1ld == NPC_tm2m3	{ return 1;}
	else if NPC_tm1m1 == NPC_tm2ld || NPC_tm1m1 == NPC_tm2m1 || NPC_tm1m1 == NPC_tm2m2 || NPC_tm1m1 == NPC_tm2m3	{ return 1;}
	else if NPC_tm1m2 == NPC_tm2ld || NPC_tm1m2 == NPC_tm2m1 || NPC_tm1m2 == NPC_tm2m2 || NPC_tm1m2 == NPC_tm2m3	{ return 1;}
	else if NPC_tm1m3 == NPC_tm2ld || NPC_tm1m3 == NPC_tm2m1 || NPC_tm1m3 == NPC_tm2m2 || NPC_tm1m3 == NPC_tm2m3	{ return 1;}
	else if NPC_tm2ld == NPC_tm1ld || NPC_tm2ld == NPC_tm1m1 || NPC_tm2ld == NPC_tm1m2 || NPC_tm2ld == NPC_tm1m3	{ return 1;}
	else if NPC_tm2m1 == NPC_tm1ld || NPC_tm2m1 == NPC_tm1m1 || NPC_tm2m1 == NPC_tm1m2 || NPC_tm2m1 == NPC_tm1m3	{ return 1;}
	else if NPC_tm2m2 == NPC_tm1ld || NPC_tm2m2 == NPC_tm1m1 || NPC_tm2m2 == NPC_tm1m2 || NPC_tm2m2 == NPC_tm1m3	{ return 1;}
	else if NPC_tm2m3 == NPC_tm1ld || NPC_tm2m3 == NPC_tm1m1 || NPC_tm2m3 == NPC_tm1m2 || NPC_tm2m3 == NPC_tm1m3	{ return 1;}
	else {return 0;};	
};

func void B_ChallengeRespawn()
{
	var int addguardrnd;
	addguardrnd = Hlp_Random 			(100);
	var int addguard;
	

	if (guardsadded < maxguards - addguard)
	{
		//"spawn guardów 
		if (addguardrnd > 92)
		{
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			guardsadded = guardsadded + 6;
		}
		else if (addguardrnd > 78)
		{
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			guardsadded = guardsadded + 5;
		}
		else if (addguardrnd > 60)
		{
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			guardsadded = guardsadded + 4;
		}			
		else if (addguardrnd > 45)
		{
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			guardsadded = guardsadded + 3;
		}	
		else if (addguardrnd > 25)
		{
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			guardsadded = guardsadded + 2;                                 
		}		
		else
		{
			Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE04");
			guardsadded = guardsadded + 1;
		};	
		var int Grdclass;
		Grdclass = Hlp_Random 			(3);
		var C_NPC GuardChanged;
		GuardChanged = Hlp_GetNpc				(GRD_2700_Gardist);
	};
}; 

//////////////////////////////////////////////////////////////////////////
//        B_TimeChallenge
//           
//
//
//////////////////////////////////////////////////////////////////////////
var string msg;
var int guardtimer;

func void B_TimeChallenge()
{
	//
	var C_NPC Bucz_xP;
// 	Rodney = Hlp_GetNpc(PIR_2602_Rodney);
// 	Hank = Hlp_GetNpc(PIR_2601_Hank);
// 	Angus = Hlp_GetNpc(PIR_2600_Angus);
// 	Bucz_xP = Hlp_GetNpc(ORG_851_Butch);
// 	Bruce = Hlp_GetNpc(ORG_828_Bruce);
// 	Cipher = Hlp_GetNpc(ORG_873_Cipher);
// 	Garry = Hlp_GetNpc(Stt_2605_Garry);
// 	Rodney = Hlp_GetNpc(PIR_2602_Rodney);
	//
	if (GRDChallenge == TRUE)
	{
	if (guardsinchallenge - guardskilled > 0)
	{
		spawntime = Hlp_Random 			(30);
		timeactived == TRUE;
		msg = IntToString (guardtimer);
		PrintScreen (msg, -1, guardtimer*2,"font_old_10_white.tga",1);
		guardtimer = guardtimer+1;
		//Test Ende	
		/////////////////////////////--END--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	};
	Wld_SendTrigger ("TIMEGUARD");
	if (guardtimer >= spawntime+15)
	{

		//PrintScreen ("startrespawn", -1, x,"font_old_10_white.tga",1);
		B_ChallengeRespawn();
		guardtimer = 1;
	};
};
};
func void B_SetTodayChallenge()
{
//	prin/t("SendingEvents");
		Wld_SetObjectRoutine (14,00,"EVT_CHALANGE",1);
		Wld_SetObjectRoutine (18,00,"EVT_CHALANGE_END",1);		
};
func void B_SetChallengers(var int TeamA,var int TeamB)
{

	var int rnd;
	rnd = Hlp_Random(5);
				NPC_tm1ld = Hlp_GetNpc(PC_Hero);
				NPC_tm1m1 = Hlp_GetNpc(PIR_2601_Hank);
				NPC_tm1m2 = Hlp_GetNpc(PIR_2602_Rodney);
				NPC_tm1m3 = Hlp_GetNpc(PIR_2612_JackAlligator);
//
//TODO:Someone oth	NPC_tm2m1 = Hlp_GetNpc(Org_851_Butch);
				NPC_tm2m2 = Hlp_GetNpc(HUN_828_Bruce);
				NPC_tm2m3 = Hlp_GetNpc(HUN_859_Aidan);
				NPC_tm2ld = Hlp_GetNpc(HUN_858_Quentin);

	B_SetChallengers(Team_A,Team_B);	
};
//////////////////////////////////////////////////////////////////////////
//	B_SetTodayChallenge
//	=================
// 1="Krwawe Kordelasy"
// 2="Wœciek³e Groty"
// 3="Poszukiwacze Wiedzy"
// 4="Unknw"
//////////////////////////////////////////////////////////////////////////
func void B_SetTodayChallengeTeams()
{
		Team_A_Name = "Krwawe Kordelasy";
		Team_B_Name = "Wœciek³e Groty";
	B_SetChallengers(Team_A,Team_B);
};
//////////////////////////////////////////////////////////////////////////
//	B_ShowKils
//	=================
//	This Func Show Kills of Challengers
//	And some infos about guards spawned and guards left
//////////////////////////////////////////////////////////////////////////
func void B_ShowKills()
{
	//////////////////////////
	var string msg1;
	var string msg2;
	var string msg3;
	var string msg4;
	var string msg5;
	var string msg6;
	//////////////////////////////
	var string tmname1;
	var string tmname2;	
	tmname1 = ConcatStrings("'",Team_A_Name);
	tmname1 = ConcatStrings(Team_A_Name,"' Zabi³y: ");	
	tmname2 = ConcatStrings("'",Team_B_Name);
	tmname2 = ConcatStrings(Team_B_Name,"' Zabi³y: ");		
	msg1 = concatstrings(tmname1,inttostring(TeamAKills));
	msg2 = concatstrings(tmname2,inttostring(TeamBKills));
	msg3 = concatstrings("W poblizu jest: ",inttostring(guardsadded));
	msg4 = concatstrings(msg3,"Stra¿ników , Pozosta³o:");
	msg5 = concatstrings(msg4,inttostring(guardsinchallenge - guardskilled));
	//msg6 = concatstrings("Czas: ",inttostring(x));

	PrintScreen(concatstrings(msg2,"  Stra¿ników"), 3,2,"FONT_OLD_10_WHITE.TGA",8);
	PrintScreen(concatstrings(msg1,"  Stra¿ników"), 70,2,"FONT_OLD_10_WHITE.TGA",8);
	PrintScreen(concatstrings(msg5,"  Stra¿ników"), -1,85,"FONT_OLD_10_WHITE.TGA",8);
	//PrintScreen (msg6, -1, -1,"font_old_10_white.tga",5);
};





func void B_INIT_Challenge(var int tm1ld,var int tm1m1,var int tm1m2,var int tm1m3,var int tm2ld,var int tm2m1,var int tm2m2,var int tm2m3)
{
	guardsinchallenge = 20+Hlp_Random(20);
	GRDChallenge = TRUE;
	//Wld_SendUnTrigger("SURFACE_2_OLDMINE");
	///////////////////////////////////////////////////////////////////
	NPC_tm1ld = Hlp_GetNpc(tm1ld);
	NPC_tm1m1 = Hlp_GetNpc(tm1m1);
	NPC_tm1m2 = Hlp_GetNpc(tm1m2);
	NPC_tm1m3 = Hlp_GetNpc(tm1m3);
	NPC_tm2ld = Hlp_GetNpc(tm2ld);
	NPC_tm2m1 = Hlp_GetNpc(tm2m1);
	NPC_tm2m2 = Hlp_GetNpc(tm2m2);
	NPC_tm2m3 = Hlp_GetNpc(tm2m3);
	///////////////////////////////////////////////////////////////////
	var C_NPC a;
	var C_NPC b;
	var C_NPC c;
	var C_NPC d;
	var C_NPC e;
	var C_NPC f;
	var C_NPC g;
	var C_NPC h;
	var C_NPC i;
	var C_NPC j;
	var C_NPC k;
	var C_NPC l;
	var C_NPC m;
	var C_NPC n;
	var C_NPC o;
	var C_NPC p;
	var C_NPC r;
	var C_NPC s;
	var C_NPC t;
	var C_NPC u;
	var C_NPC w;
	var C_NPC v;
	var C_NPC x;
	var C_NPC a2;
	var C_NPC a3;
	var C_NPC a4;
	var C_NPC a5;	
	a	=	Hlp_GetNpc(MAG_1330_BaalParvez);
//	b	=	Hlp_GetNpc(MAG_4021_Cortez);
	c	=	Hlp_GetNpc(mag_1604_Leren);
	d	=	Hlp_GetNpc(RBL_1331_BaalTaran);
//	e	=	Hlp_GetNpc(Org_851_Butch);
	g	=	Hlp_GetNpc(RBL_311_Fisk);
	i	=	Hlp_GetNpc(RBL_2605_Garry);
	k	=	Hlp_GetNpc(RBL_1331_BaalTaran);
	l	=	Hlp_GetNpc(HUN_336_Cavalorn);
	m	=	Hlp_GetNpc(HUN_818_Ratford);
	n	=	Hlp_GetNpc(HUN_858_Quentin);
	o	=	Hlp_GetNpc(HUN_819_Drax);
	p	=	Hlp_GetNpc(HUN_859_Aidan);
	r	=	Hlp_GetNpc(HUN_828_Bruce);
	s	=	Hlp_GetNpc(RBL_331_Fingers);
	t	=	Hlp_GetNpc(HUN_729_Kharim);
	u	=	Hlp_GetNpc(HUN_1422_GorHanis);
	w	=	Hlp_GetNpc(PIR_2601_Hank);
	v	=	Hlp_GetNpc(PIR_2602_Rodney);
	f	=	Hlp_GetNpc(PIR_2600_Angus);	
	if(Know_JackAlligator)
	{
	x	=	Hlp_GetNpc(PIR_2612_JackAlligator);	
	};
	if(NC_ARRIVED)
	{
	j	=	Hlp_GetNpc(RBL_8730_Dylan);
	};	
	if(PSI_ARRIVED)
	{
	a2	=	Hlp_GetNpc(RBL_1332_BaalKagan);
	a3	=	Hlp_GetNpc(RBL_1333_BaalIsidro);	
	a4	=	Hlp_GetNpc(RBL_2331_Zex);
	a5	=	Hlp_GetNpc(RBL_2402_Terry);
	};	
	B_ExchangeRoutine(a,"fan");	
	B_ExchangeRoutine(b,"fan");
	B_ExchangeRoutine(c,"fan");
	B_ExchangeRoutine(d,"fan");	
	B_ExchangeRoutine(e,"fan");	    					
	B_ExchangeRoutine(f,"fan");   
	B_ExchangeRoutine(g,"fan");	    					
	B_ExchangeRoutine(h,"fan"); 
	B_ExchangeRoutine(i,"fan");	
	B_ExchangeRoutine(j,"fan");
	B_ExchangeRoutine(k,"fan");
	B_ExchangeRoutine(l,"fan");	
	B_ExchangeRoutine(m,"fan");	    					
	B_ExchangeRoutine(n,"fan");   
	B_ExchangeRoutine(o,"fan");	    					
	B_ExchangeRoutine(p,"fan"); 	
	B_ExchangeRoutine(r,"fan");	    					
	B_ExchangeRoutine(s,"fan");   
	B_ExchangeRoutine(t,"fan");	
	B_ExchangeRoutine(u,"fan"); 	
	B_ExchangeRoutine(w,"fan");	    					
	B_ExchangeRoutine(v,"fan"); 
	if(Know_JackAlligator == TRUE)
	{
		B_ExchangeRoutine(x,"fan"); 
	};		
	if(NC_ARRIVED)
	{
		B_ExchangeRoutine(j,"fan"); 
	};	
	if(PSI_ARRIVED)
	{
		B_ExchangeRoutine(a2,"fan"); 
		B_ExchangeRoutine(a3,"fan"); 
		B_ExchangeRoutine(a4,"fan"); 
		B_ExchangeRoutine(a5,"fan"); 
	};
	///////////////////////////////////////////////////////////////////
	B_ExchangeRoutine(NPC_tm1m1,"challenge");		
	B_ExchangeRoutine(NPC_tm1m2,"challenge");
	B_ExchangeRoutine(NPC_tm1m3,"challenge");		
	B_ExchangeRoutine(NPC_tm2ld,"challenge");
	B_ExchangeRoutine(NPC_tm2m1,"challenge");
	B_ExchangeRoutine(NPC_tm2m2,"challenge");
	B_ExchangeRoutine(NPC_tm2m3,"challenge");
};
func void B_CHALLENGEEND()
{
//	pri/nt("challstop");	
	guardsadded = 0;
	guardskilled = 0;
	TeamBKills	=	0;
	TeamAKills	=	0;
	NPC_tm1ld = Hlp_GetNpc(Ebr_100_Gomez);
	NPC_tm2ld = Hlp_GetNpc(Ebr_100_Gomez);
	GRDChallenge = FALSE;
	//Wld_SendTrigger("SURFACE_2_OLDMINE");
	///////////////////////////////////////////////////////////////////
	var C_NPC a;
	var C_NPC b;
	var C_NPC c;
	var C_NPC d;
	var C_NPC e;
	var C_NPC f;
	var C_NPC g;
	var C_NPC h;
	var C_NPC i;
	var C_NPC j;
	var C_NPC k;
	var C_NPC l;
	var C_NPC m;
	var C_NPC n;
	var C_NPC o;
	var C_NPC p;
	var C_NPC r;
	var C_NPC s;
	var C_NPC t;
	var C_NPC u;
	var C_NPC w;
	var C_NPC v;
	var C_NPC x;
	var C_NPC a2;
	var C_NPC a3;
	var C_NPC a4;
	var C_NPC a5;	
	a	=	Hlp_GetNpc(MAG_1330_BaalParvez);
//	b	=	Hlp_GetNpc(MAG_4021_Cortez);
	c	=	Hlp_GetNpc(mag_1604_Leren);
	d	=	Hlp_GetNpc(RBL_1331_BaalTaran);
//	e	=	Hlp_GetNpc(Org_851_Butch);
	g	=	Hlp_GetNpc(RBL_311_Fisk);
	i	=	Hlp_GetNpc(RBL_2605_Garry);
	k	=	Hlp_GetNpc(RBL_1331_BaalTaran);
	l	=	Hlp_GetNpc(HUN_336_Cavalorn);
	m	=	Hlp_GetNpc(HUN_818_Ratford);
	n	=	Hlp_GetNpc(HUN_858_Quentin);
	o	=	Hlp_GetNpc(HUN_819_Drax);
	p	=	Hlp_GetNpc(HUN_859_Aidan);
	r	=	Hlp_GetNpc(HUN_828_Bruce);
	s	=	Hlp_GetNpc(RBL_331_Fingers);
	t	=	Hlp_GetNpc(HUN_729_Kharim);
	u	=	Hlp_GetNpc(HUN_1422_GorHanis);
	w	=	Hlp_GetNpc(PIR_2601_Hank);
	v	=	Hlp_GetNpc(PIR_2602_Rodney);
	f	=	Hlp_GetNpc(PIR_2600_Angus);	
	if(Know_JackAlligator)
	{
	x	=	Hlp_GetNpc(PIR_2612_JackAlligator);	
	};
	if(NC_ARRIVED)
	{
	j	=	Hlp_GetNpc(RBL_8730_Dylan);
	};	
	if(PSI_ARRIVED)
	{
	a2	=	Hlp_GetNpc(RBL_1332_BaalKagan);
	a3	=	Hlp_GetNpc(RBL_1333_BaalIsidro);	
	a4	=	Hlp_GetNpc(RBL_2331_Zex);
	a5	=	Hlp_GetNpc(RBL_2402_Terry);
	};	
	B_ExchangeRoutine(a,"start");	
	B_ExchangeRoutine(b,"start");
	B_ExchangeRoutine(c,"start");
	B_ExchangeRoutine(d,"start");	
	B_ExchangeRoutine(e,"start");	    					
	B_ExchangeRoutine(f,"start");   
	B_ExchangeRoutine(g,"start");	    					
	B_ExchangeRoutine(h,"start"); 
	B_ExchangeRoutine(i,"start");	
	B_ExchangeRoutine(j,"start");
	B_ExchangeRoutine(k,"start");
	B_ExchangeRoutine(l,"start");	
	B_ExchangeRoutine(m,"start");	    					
	B_ExchangeRoutine(n,"start");   
	B_ExchangeRoutine(o,"start");	    					
	B_ExchangeRoutine(p,"start"); 	
	B_ExchangeRoutine(r,"start");	    					
	B_ExchangeRoutine(s,"start");   
	B_ExchangeRoutine(t,"start");	
	B_ExchangeRoutine(u,"start"); 	
	B_ExchangeRoutine(w,"start");	    					
	B_ExchangeRoutine(v,"start"); 
	if(Know_JackAlligator == TRUE)
	{
		B_ExchangeRoutine(x,"start"); 
	};		
	if(NC_ARRIVED)
	{
		B_ExchangeRoutine(j,"start"); 
	};	
	if(PSI_ARRIVED)
	{
		B_ExchangeRoutine(a2,"start"); 
		B_ExchangeRoutine(a3,"start"); 
		B_ExchangeRoutine(a4,"start"); 
		B_ExchangeRoutine(a5,"start"); 
	};
	///////////////////////////////////////////////////////////////////
	AI_EquipBestMeleeWeapon		(NPC_tm1m2);
	AI_EquipBestRangedWeapon	(NPC_tm1m2);
	AI_EquipBestMeleeWeapon		(NPC_tm1m1);
	AI_EquipBestRangedWeapon	(NPC_tm1m1);
	AI_EquipBestMeleeWeapon		(NPC_tm1m3);
	AI_EquipBestRangedWeapon	(NPC_tm1m3);
	AI_EquipBestMeleeWeapon		(NPC_tm1ld);
	AI_EquipBestRangedWeapon	(NPC_tm1ld);
	AI_EquipBestMeleeWeapon		(NPC_tm2ld);
	AI_EquipBestRangedWeapon	(NPC_tm2ld);	 
	AI_EquipBestMeleeWeapon		(NPC_tm2m1);
	AI_EquipBestRangedWeapon	(NPC_tm2m1);
};
func void B_Check_Challenge()
{
	var string tmname;
	if (guardskilled < guardsinchallenge)&&(self.guild == GIL_DMB)&&(GRDChallenge == TRUE)//if (teraz_trwa zadanie&&self.guild==ci_ktorych_zabijamy)
	{
			guardskilled = guardskilled+1;
			guardsadded = guardsadded-1;
			if (Hlp_GetinstanceID(NPC_tm1ld) == Hlp_GetinstanceID(other)||Hlp_GetinstanceID(NPC_tm1m2) == Hlp_GetinstanceID(other)||Hlp_GetinstanceID(NPC_tm1m1) == Hlp_GetinstanceID(other)||Hlp_GetinstanceID(NPC_tm1m3) == Hlp_GetinstanceID(other))
			{
				TeamAKills = TeamAKills+1;
				B_ShowKills();
				tmname = ConcatStrings("'",Team_A_Name);
				tmname = ConcatStrings(tmname,"'");				
				PrintScreen(ConcatStrings(tmname," Zabi³y kolejnego Stra¿nika!!!"), -1,55,"FONT_OLD_10_WHITE.TGA",3);
			}
			else if (Hlp_GetinstanceID(NPC_tm2ld) == Hlp_GetinstanceID(other)||Hlp_GetinstanceID(NPC_tm2m2) == Hlp_GetinstanceID(other)||Hlp_GetinstanceID(NPC_tm2m1) == Hlp_GetinstanceID(other)||Hlp_GetinstanceID(NPC_tm2m3) == Hlp_GetinstanceID(other))
			{
				TeamBKills = TeamBKills+1;
				B_ShowKills();
				tmname = ConcatStrings("'",Team_B_Name);
				tmname = ConcatStrings(tmname,"'");				
				PrintScreen(ConcatStrings(tmname," Zabi³y kolejnego Stra¿nika!!!"), -1,45,"FONT_OLD_10_WHITE.TGA",3);
			};
	};	
	
	if (guardskilled >= guardsinchallenge)
	{
		//challengestate == 0;
		///////////////////////////////////////////////////////////////////

		PrintScreen("Zawody zakoñczone!!!", -1,55,"FONT_OLD_20_WHITE.TGA",2);
		GRDChallenge = FALSE;
		if (TeamBKills > TeamAKills)
		{
			tmname = ConcatStrings("Zwyciêzc¹ s¹ '",Team_B_Name);
			tmname = ConcatStrings(tmname,"' ");	
			PrintScreen(concatstrings(tmname,"!"), -1,65,"FONT_OLD_20_WHITE.TGA",5); 
		}
		else  if (TeamAKills > TeamBKills)
		{
			tmname = ConcatStrings("Zwyciêzc¹ s¹ '",Team_A_Name);
			tmname = ConcatStrings(tmname,"' ");	
			PrintScreen(concatstrings(tmname,"!"), -1,65,"FONT_OLD_20_WHITE.TGA",5); 
		}
		else//Draw
		{
			PrintScreen("Remis!", -1,75,"FONT_OLD_20_WHITE.TGA",5); 
		};
		B_CHALLENGEEND();
	};
};
func void EVT_SENDCHALLANGE()
{
	//	PR/INT("CHALLENGEEND");	
	//	B_CHALLENGEEND();		
		B_INIT_Challenge(Hlp_GetInstanceID(NPC_tm1ld),Hlp_GetInstanceID(NPC_tm1m1),Hlp_GetInstanceID(NPC_tm1m2),Hlp_GetInstanceID(NPC_tm1m3),Hlp_GetInstanceID(NPC_tm2ld),Hlp_GetInstanceID(NPC_tm2m1),Hlp_GetInstanceID(NPC_tm2m2),Hlp_GetInstanceID(NPC_tm2m3));
		B_TimeChallenge();		
	//	PRI/NT("CHALLENGEEND");	
	//	B_CHALLENGEEND();

};
func void B_CreateHelpBook()
{
var string msg;
msg = concatstrings("Pierwsza grupa: ",NPC_tm1ld.name);	
msg = concatstrings(msg,",");
msg = concatstrings(msg,NPC_tm1m1.name);
msg = concatstrings(msg,",");
msg = concatstrings(msg,NPC_tm1m2.name);
msg = concatstrings(msg,",");
msg = concatstrings(msg,NPC_tm1m3.name);
msg = concatstrings(msg,"||Druga Grupa: ");
msg = concatstrings(msg,NPC_tm2ld.name);	
msg = concatstrings(msg,",");
msg = concatstrings(msg,NPC_tm2m1.name);
msg = concatstrings(msg,",");
msg = concatstrings(msg,NPC_tm2m2.name);
msg = concatstrings(msg,",");
msg = concatstrings(msg,NPC_tm2m3.name);	
msg = concatstrings(msg,"Team_A==");
msg = concatstrings(msg,IntToString(Team_A));
msg = concatstrings(msg,",");
msg = concatstrings(msg,"Team_B==");
msg = concatstrings(msg,IntToString(Team_B));

		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
						Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga", 	0 		); 				
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 10, 20, 0   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Tutaj Znajdziesz Informacje na temat polowania");
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, msg);					
					Doc_Show		( nDocID );
};
instance challbook(C_ITEM)
{
	name 					=	"zawody";
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;
//	weight					=	1;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			=	B_CreateHelpBook;
};