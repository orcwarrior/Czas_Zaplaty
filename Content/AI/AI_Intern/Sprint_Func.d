
instance StaminaBar(oCViewStatusBar) {};

FUNC INT Ani_BodyStateContains(Var C_Npc Slf,Var Int Bodystate)
{
	IF((NPC_GETBODYSTATE(SLF)&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS))==(BODYSTATE&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS)))//sowohl bei der Abfrage als auch beim Vergleichswert die höhren Bits ausmaskieren!
	{																//...ja!
		RETURN TRUE;
	}
	ELSE
	{
		RETURN FALSE;
	};
};

func void oCStatusBar_SetAlpha(var int ptr, var int alpha)
{
 	PRINTDEBUG_s_i("oCStatusBar_SetAlpha; ptr=",ptr);	
	var int hlp;
	MEM_WriteInt(ptr+36,alpha);
 	PRINTDEBUG_s_i("oCStatusBar_SetAlpha2; ptr=",ptr);	
	
	hlp = MEM_ReadInt(ptr+276);
	MEM_WriteInt(hlp+36,alpha);
 	PRINTDEBUG_s_i("oCStatusBar_SetAlpha3; ptr=",ptr);	
	
	hlp = MEM_ReadInt(ptr+280);
	MEM_WriteInt(hlp+36,alpha);
};

func void sprint_off(var int swimbar)
{
   SPRINTENABLED = false; 
   //	prin/t("Disable"); 
   MDL_REMOVEOVERLAYMDS(HERO,"HUMANS_SPRINT.MDS");

   oCStatusBar_SetAlpha(swimbar,0);

   Stamina_BarVisible = FALSE;
};

FUNC VOID B_SPRINTER()
{
 	var int barvalue; var int hlp;
	var ocnpc hiro;
	hiro = hlp_getnpc(pc_hero);			
		
   var int swimbar; swimbar = MEM_ReadInt (MEMINT_oGame_Pointer_Address);
   swimbar = MEM_ReadInt(swimbar+144);//game.swimBar			
	//Show DiveBar Bugfix		
	If(Ani_BodyStateContains(hero,BS_DIVE))
	{
      if(Stamina_BarVisible==FALSE)
		{
         Stamina_BarVisible=TRUE;	
         oCStatusBar_SetAlpha(swimbar,255);
		};
	};
   
	if (Sprint_UpClicked>0)//clicked one time, decrease wait time for another click
	{
		Sprint_UpClicked-=1;
	};
	//Switch sprint on/off?
	if (InfoManager_HasFinished()) && (Sprint_UpClicked == -1)&&(!Npc_IsDead(hero))
	{
		Sprint_UpClicked = 0;//Reset
			
		if(SPRINTENABLED)
		{ 
			sprint_off(swimbar);
		}
		else 
		{ 
			SPRINTENABLED=2; 
			//	pri/nt("Enable");
		 	oCStatusBar_SetAlpha(swimbar,255);
		};
	};
   
	if(SPRINTENABLED)
	{
		if(!hlp_StrCmp(Sprint_ReInited,"YES"))
		{
			Stamina_BarVisible = false;
		};
	
      var int anictrl; var int iswalking; var int isstanding; var string L1Ani;
		anictrl = hiro.anictrl;
 		CALL__thiscall (anictrl,oCAniCtrl_Human_IsWalking_offset);			
 		iswalking = CALL_GetResult();
  		CALL__thiscall (anictrl,oCAniCtrl_Human_IsStanding_offset);			
 		isstanding = CALL_GetResult();		
	
 		//Now, its much more safety ;P
 		hlp = MEM_ReadInt(anictrl+104);//zCModel
 		
      if(hlp)
      {
			hlp = MEM_ReadInt(hlp+56);//*ActiveAniLayer1
			
         if(hlp)
			{
				hlp = MEM_ReadInt(hlp);//*oCAni
				
            if(hlp)
            { 
               L1Ani = MEM_ReadString(hlp+36);
            };//aniname(zstring)
			};
		};
 		
      if (iswalking)
      && ((Ani_BodyStateContains(hero,BS_HIT)&& Hlp_StrCmp(L1Ani,"S_1HRUNL")) || Ani_BodyStateContains(hero,BS_JUMP) 
         || Ani_BodyStateContains(hero,BS_RUN))
		&& (!isstanding)
		{  //hero is runing

			hiro.divectr=subf(hiro.divectr,mkf(522));	
			
			var int ptr; ptr = swimbar;
			MEM_WriteInt(ptr+252,mulf(fracf(SPRINTTIME,MAXSPRINTTIME),hiro.divetime));		
			
         IF(SPRINTENABLED==2)//make sprinting
			{
				MDL_APPLYOVERLAYMDS(HERO,"HUMANS_SPRINT.MDS");
				SPRINTENABLED = TRUE;
  				//pri/nt("sprint again");  	
			}
			ELSE IF(gf(mkf(-5000),hiro.divectr))
			{
				//PLAY TIRED ANI AND WAIT
				//TODO: UP
				AI_Wait(hero, 0.1);
            sprint_off(swimbar);
 				//AI_PlayAni(hero,"T_RUN_2_WALK");
            
				AI_SetWalkmode(hero,NPC_WALK);
				MEM_InsertKeyEvent(KEY_CAPITAL);
			};
		}
		ELSE
		{
// 			//hero is regenerating AUTOMATIC BY dive regenerate
// 			if(sprinttime<MAXSPRINTTIME)
// 			{	SPRINTTIME=SPRINTTIME+2; };
		};
		
		//show "swimbar"

		printdebug("sus0");
		var int ViewScreen;
		ViewScreen = MEM_Game.array_view[0];
		printdebug("sus1");
      
		if(Stamina_BarVisible==false)
		{
         CALL_IntParam(0);
         CALL_IntParam(swimbar);
         CALL__thiscall (ViewScreen,zCView_InsertItem_offset);
         CALL__thiscall (swimbar,zCViewStatusBar_Init_offset);		

         CALL_IntParam(mkf(1000));
         CALL_IntParam(0);
         CALL__thiscall (swimbar,oCViewStatusBar_SetMaxRange_offset);	
 		
         CALL_IntParam(mkf(1000));
         CALL_IntParam(0);
         CALL__thiscall (swimbar,oCViewStatusBar_SetRange_offset);			
		
         Stamina_BarVisible=1;
	   };
      
 		CALL__thiscall (swimbar,zCViewStatusBar_Init_offset);	

 		barvalue = hiro.divectr;
  		hlp = mkf(300);
  		barvalue =  divf(barvalue,hlp);
 		
		CALL_IntParam(barvalue);
		CALL__thiscall (swimbar,oCViewStatusBar_SetValue_offset);	
		
		if(!hlp_StrCmp(Sprint_ReInited,"YES"))
		{
			//print("Sprint Re-init");//budzis ty by³
			oCStatusBar_SetAlpha(swimbar,255);
		};		
	}
	else
	{
		//hero is regenerating
		if(hiro.divectr<MAXSPRINTTIME)
		{
         barvalue = hiro.divectr;
         hlp = mkf(300);
         barvalue =  divf(barvalue,hlp);
 		
         CALL_IntParam(barvalue);
         CALL__thiscall (swimbar,oCViewStatusBar_SetValue_offset);
         CALL__thiscall (swimbar,zCViewStatusBar_Init_offset);	
 		}
 		else
 		{
	 		Stamina_BarVisible=0;
 		
		 	oCStatusBar_SetAlpha(swimbar,0);
 		};
	};
	Sprint_ReInited = "YES";
};