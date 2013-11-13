//***************************************************************************
// Magic Ore
//***************************************************************************
const string _STR_I_DUNNO_MINNING = "Nie znam siê na górnictwie";

Func void ORE_COND ()
{
	if(!TALENT_MINING)&&(Npc_IsPlayer(self))
	{
		PutMsg(_STR_I_DUNNO_MINNING,"font_default.tga",RGBAToZColor(255,100,100,255),2*8,"");
		B_StopUseMob	(self,"ORE");
		return;
	};
};

FUNC void ORE_S1 ()
{
	var int rnd; rnd=Hlp_Random(DAILYMAGICORE_NOW);
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	//p/rint(inttostring(DAILYMAGICORE_NOW));
	if(rnd>10)
	{
		DAILYMAGICORE+=5;
	};
	if(DAILYMAGICORE_NOW<=0)
	{
		if(!Hlp_Random(5))
		{
			CreateInvItems(self,ItMiNugget,1);
			PutMsg("Wydobyto: Bry³kê rudy.","font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		}
		else
		{
			PutMsg("Nie uda³o siê wydobyæ rudy.","font_default.tga",RGBAToZColor(255,100,100,255),8,"");
		};

		AI_Wait(self,2);
	}
	else if(rnd>=10)
	{
		DAILYMAGICORE_NOW-=rnd;
		rnd=(rnd/10)-((rnd/10)%1);
		//var float wajttajm; wajttajm=IntToFloat(rnd);
		CreateInvItems(self,ItMiNugget,rnd);
		PutMsg(ConcatStrings("Wydobyto: ",ConcatStrings(IntTostring(rnd)," Bry³ek rudy.")),"font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		//
		AI_Wait(self,3);
	}
	else
	{
		DAILYMAGICORE_NOW-=5;
		PutMsg("Nie uda³o siê wydobyæ rudy.","font_default.tga",RGBAToZColor(255,100,100,255),8,"");
		AI_Wait(self,2);
	};
};

//***************************************************************************
// Iron Ore
//***************************************************************************
Func void Iron_S0 ()
{
	if(!TALENT_MINING)&&(Npc_IsPlayer(self))
	{
		PutMsg(_STR_I_DUNNO_MINNING,"font_default.tga",RGBAToZColor(255,100,100,255),2*8,"");
		B_StopUseMob	(self,"OREIRON");
		return;
	};
};

FUNC void Iron_S1 ()
{
	var int rnd; rnd=Hlp_Random(DAILYIRONORE_NOW);
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	//p/rint(inttostring(DAILYIRONORE_NOW));
	if(rnd>10)
	{
		DAILYIRONORE+=5;
	};
	if(DAILYIRONORE_NOW<=0)
	{
		if(!Hlp_Random(5))
		{
			CreateInvItems(self,ItMa_ironore,1);
			PutMsg("Wydobyto: Bry³kê ¿elaza.","font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		}
		else
		{
			PutMsg("Nie uda³o siê wydobyæ rudy ¿elaza.","font_default.tga",RGBAToZColor(255,100,100,255),8,"");

		};

      AI_Wait(self,2);
	}
	else if(rnd>=10)
	{
		DAILYIRONORE_NOW-=rnd;
		rnd=(rnd/10)-((rnd/10)%1);
		//var float wajttajm; wajttajm=IntToFloat(rnd);
		CreateInvItems(self,ItMa_ironore,rnd);
		PutMsg(ConcatStrings("Wydobyto: ",ConcatStrings(IntTostring(rnd)," Bry³ek ¿elaza.")),"font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		//
		AI_Wait(self,3);
	}
	else
	{
		 DAILYIRONORE_NOW-=5;
		 PutMsg("Nie uda³o siê wydobyæ rudy ¿elaza.","font_default.tga",RGBAToZColor(255,100,100,255),8,"");
		 AI_Wait(self,2);
	};
};

//***************************************************************************
// Carbon Ore
//***************************************************************************
Func void Carbon_S0 ()
{
	if(!TALENT_MINING)&&(Npc_IsPlayer(self))
	{
		PutMsg(_STR_I_DUNNO_MINNING,"font_default.tga",RGBAToZColor(255,100,100,255),2*8,"");
		B_StopUseMob	(self,"ORECARBON");
		return;
	};
};
FUNC void Carbon_S1 ()
{
	var int rnd; rnd=Hlp_Random(DAILYCARBONORE_NOW);
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	//p/rint(inttostring(DAILYCARBONORE_NOW));
	if(rnd>10)
	{
		DAILYCARBONORE+=5;

	};
	if(DAILYCARBONORE_NOW<=0)
	{
		if(!Hlp_Random(5))
		{
			 CreateInvItems(self,ItMa_carbon,1);
			 PutMsg("Wydobyto: Bry³kê wêgla.","font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		}
		else
		{
			PutMsg("Nie uda³o siê wydobyæ bry³ek wêgla.","font_default.tga",RGBAToZColor(255,100,100,255),8,"");

		};
			 AI_Wait(self,2);

	}
	else if(rnd>=10)
	{
		DAILYCARBONORE_NOW-=rnd;
		rnd=(rnd/10)-((rnd/10)%1);
		//var float wajttajm; wajttajm=IntToFloat(rnd);
		CreateInvItems(self,ItMa_carbon,rnd);
    	 PutMsg(ConcatStrings("Wydobyto: ",ConcatStrings(IntTostring(rnd)," Bry³ek wêgla.")),"font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		//
		AI_Wait(self,3);
	}
	else
	{
		 DAILYCARBONORE_NOW-=5;
		 PutMsg("Nie uda³o siê wydobyæ bry³ek wêgla.","font_default.tga",RGBAToZColor(255,100,100,255),8,"");
		 AI_Wait(self,2);
	};

};

//***************************************************************************
// Gold Ore
//***************************************************************************
Func void Gold_S0 ()
{

	if(!TALENT_MINING)&&(Npc_IsPlayer(self))
	{
		PutMsg(_STR_I_DUNNO_MINNING,"font_default.tga",RGBAToZColor(255,100,100,255),2*8,"");
		B_StopUseMob	(self,"OREGOLD");
		return;
	};
};
FUNC void Gold_S1 ()
{
	var int rnd; rnd=Hlp_Random(DAILYGOLDORE_NOW);
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	//p/rint(inttostring(DAILYGOLDORE_NOW));
	if(rnd>10)
	{
		DAILYGOLDORE+=5;

	};
	if(DAILYGOLDORE_NOW<=0)
	{
		if(!Hlp_Random(5))
		{
			 CreateInvItems(self,ItMa_goldore,1);
			 PutMsg("Wydobyto: Bry³kê z³ota.","font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		}
		else
		{
		 PutMsg("Nie uda³o siê wydobyæ z³ota.","font_default.tga",RGBAToZColor(255,100,100,255),8,"");

		};
			 AI_Wait(self,2);

	}
	else if(rnd>=10)
	{
		DAILYGOLDORE_NOW-=rnd;
		rnd=(rnd/10)-((rnd/10)%1);
		//var float wajttajm; wajttajm=IntToFloat(rnd);
		CreateInvItems(self,ItMa_goldore,rnd);
  	    PutMsg(ConcatStrings("Wydobyto: ",ConcatStrings(IntTostring(rnd)," Bry³ek z³ota.")),"font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		//
		AI_Wait(self,3);
	}
	else
	{
		 DAILYGOLDORE_NOW-=5;
		 PutMsg("Nie uda³o siê wydobyæ z³ota.","font_default.tga",RGBAToZColor(255,100,100,255),8,"");
		 AI_Wait(self,2);
	};

};

//***************************************************************************
// Silver Ore
//***************************************************************************
Func void Silver_S0 ()
{
	if(!TALENT_MINING)&&(Npc_IsPlayer(self))
	{
		PutMsg(_STR_I_DUNNO_MINNING,"font_default.tga",RGBAToZColor(255,100,100,255),2*8,"");
		B_StopUseMob	(self,"ORESILVER");
		return;
	};
};
FUNC void Silver_S1 ()
{
	var int rnd; rnd=Hlp_Random(DAILYSILVERORE_NOW);
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	//p/rint(inttostring(DAILYSILVERORE_NOW));
	if(rnd>10)
	{
		DAILYSILVERORE+=5;

	};
	if(DAILYSILVERORE_NOW<=0)
	{
		if(!Hlp_Random(5))
		{
			 CreateInvItems(self,ItMa_silverore,1);
			 PutMsg("Wydobyto: Bry³kê srebra.","font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		}
		else
		{
		 PutMsg("Nie uda³o siê wydobyæ bry³ek srebra.","font_default.tga",RGBAToZColor(255,100,100,255),8,"");

		};
			 AI_Wait(self,2);

	}
	else if(rnd>=10)
	{
		DAILYSILVERORE_NOW-=rnd;
		rnd=(rnd/10)-((rnd/10)%1);
		//var float wajttajm; wajttajm=IntToFloat(rnd);
		CreateInvItems(self,ItMa_silverore,rnd);
  	    PutMsg(ConcatStrings("Wydobyto: ",ConcatStrings(IntTostring(rnd)," Bry³ek srebra.")),"font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		//
		AI_Wait(self,3);
	}
	else
	{
		 DAILYSILVERORE_NOW-=5;
		 PutMsg("Nie uda³o siê wydobyæ bry³ek srebra.","font_default.tga",RGBAToZColor(255,100,100,255),8,"");
		 AI_Wait(self,2);
	};
};