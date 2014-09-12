func void B_STORY_HunterCampBack2Live()
{
	if(GrdAttackNow > 0)//grdAttack
	{
      GrdNumSpawned = 0;
      GrdsInAttack = 0;
      GrdAttackNow = 0;		
	}
	else if (GRDChallenge == TRUE)
	{
		GRDChallenge = FALSE;		
	};
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
	var C_NPC w;
	var C_NPC v;
	var C_NPC x;
	var C_NPC a2;
	var C_NPC a3;
	var C_NPC a4;
	var C_NPC a5;	
	a	=	Hlp_GetNpc(MAG_1330_BaalParvez);
	b	=	Hlp_GetNpc(PC_MAGE);
	c	=	Hlp_GetNpc(mag_1604_Leren);
	d	=	Hlp_GetNpc(RBL_1331_BaalTaran);
	e	=	Hlp_GetNpc(HUN_309_Whistler);
	g	=	Hlp_GetNpc(RBL_311_Fisk);
	h	=	Hlp_GetNpc(HUN_2615_Abel);
	i	=	Hlp_GetNpc(RBL_2605_Garry);
	k	=	Hlp_GetNpc(RBL_1332_BaalKagan);//Taran->Kagan
	l	=	Hlp_GetNpc(HUN_336_Cavalorn);
	m	=	Hlp_GetNpc(HUN_818_Ratford);
	n	=	Hlp_GetNpc(HUN_858_Quentin);
	o	=	Hlp_GetNpc(HUN_819_Drax);
	p	=	Hlp_GetNpc(HUN_859_Aidan);
	r	=	Hlp_GetNpc(RBL_2604_Tony);
	s	=	Hlp_GetNpc(RBL_331_Fingers);
	w	=	Hlp_GetNpc(PIR_2601_Hank);
	v	=	Hlp_GetNpc(PIR_2602_Rodney);
	f	=	Hlp_GetNpc(PIR_2600_Angus);	
	x	=	Hlp_GetNpc(PIR_2612_JackAlligator);	
	
	j	=	Hlp_GetNpc(RBL_2613_Vam);

	a2	=	Hlp_GetNpc(RBL_2614_Fox);
	a3	=	Hlp_GetNpc(RBL_2618_Hark);	
	a4	=	Hlp_GetNpc(RBL_2619_Cup);
	a5	=	Hlp_GetNpc(RBL_4011_Leaf);

	var ocnpc npc;var int npc_id;
	
	B_ExchangeRoutine(a,"start");	
	B_ExchangeRoutine(b,"start");
	B_ExchangeRoutine(c,"start");	
	B_ExchangeRoutine(d,"start");	
	B_ExchangeRoutine(e,"start");	    					
	B_ExchangeRoutine(f,"InHC");//PIR_2600_Angus);	   
	B_ExchangeRoutine(g,"start");	    					
	B_ExchangeRoutine(h,"start"); 
   
   if (garry_out)
   {
      B_ExchangeRoutine(i,"LumberMill");	
   }
   else
   {
      B_ExchangeRoutine(i,"start");	
   };
   
	B_ExchangeRoutine(j,"start");
	B_ExchangeRoutine(k,"start");		
	B_ExchangeRoutine(l,"start");
   B_ExchangeRoutine(m,"AfterFight");   					
	B_ExchangeRoutine(n,"start"); 
	B_ExchangeRoutine(o,"start");   					
	B_ExchangeRoutine(p,"start");		
	B_ExchangeRoutine(r,"OR");	 					
	B_ExchangeRoutine(s,"start");	    		
	B_ExchangeRoutine(w,"InHC");//PIR_2601_Hank);  					
	B_ExchangeRoutine(v,"Mage");//PIR_2602_Rodney);	
	
   npc_id=Hlp_GetinstanceID(a);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130;   	
   npc_id=Hlp_GetinstanceID(b);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 
   npc_id=Hlp_GetinstanceID(c);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 
   npc_id=Hlp_GetinstanceID(d);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 	
   npc_id=Hlp_GetinstanceID(e);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 		
   npc_id=Hlp_GetinstanceID(f);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 	
   npc_id=Hlp_GetinstanceID(g);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 	
   npc_id=Hlp_GetinstanceID(h);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 
   npc_id=Hlp_GetinstanceID(i);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 		
   npc_id=Hlp_GetinstanceID(j);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 	
   npc_id=Hlp_GetinstanceID(k);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 	
   npc_id=Hlp_GetinstanceID(l);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 		
   npc_id=Hlp_GetinstanceID(m);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 	  	
   npc_id=Hlp_GetinstanceID(n);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130;  	
   npc_id=Hlp_GetinstanceID(o);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 	 
   npc_id=Hlp_GetinstanceID(p);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130;  
   npc_id=Hlp_GetinstanceID(r);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 	 
   npc_id=Hlp_GetinstanceID(s);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130;   
   npc_id=Hlp_GetinstanceID(w);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 	  
   npc_id=Hlp_GetinstanceID(v);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130;    
	
	if(Know_JackAlligator == TRUE) 
	{
		B_ExchangeRoutine(x,"OR"); 
		npc_id=Hlp_GetinstanceID(x);
		npc=Hlp_GetNpc(npc_id);
		npc._zCVob_type = 130;  
	};				
	   
	if(Know_PachoAndScorpio == TRUE)
	{
		x	=	Hlp_GetNpc(Grd_224_Pacho);	
		B_ExchangeRoutine(x,"OR"); 	
		npc_id=Hlp_GetinstanceID(x);
		npc=Hlp_GetNpc(npc_id);
		npc._zCVob_type = 130;    
		x	=	Hlp_GetNpc(Grd_205_Scorpio);	
		B_ExchangeRoutine(x,"OR"); 
		npc_id=Hlp_GetinstanceID(x);
		npc=Hlp_GetNpc(npc_id);
		npc._zCVob_type = 130;    
	};
			
	if(Know_Gestath == TRUE)
	{
		x	=	Hlp_GetNpc(hun_2609_Gestath);			
		B_ExchangeRoutine(x,"OR"); 
		npc_id=Hlp_GetinstanceID(x);
		npc=Hlp_GetNpc(npc_id);
		npc._zCVob_type = 130;    
	};					
	if(Know_Carlson == TRUE)
	{
		//AIDAN - second routine
		B_ExchangeRoutine(p,"CarlsonArrived"); 
		npc_id=Hlp_GetinstanceID(p);
		npc=Hlp_GetNpc(npc_id);
		npc._zCVob_type = 130;  
		x	=	Hlp_GetNpc(RBL_2617_Carlson);	
		B_ExchangeRoutine(x,"OR"); 
		npc_id=Hlp_GetinstanceID(x);
		npc=Hlp_GetNpc(npc_id);
		npc._zCVob_type = 130;  
	};		
		
	if(!hanis_trust)//kharim isn't banned
	{
      npc=Hlp_GetNpc(HUN_729_Kharim);
      npc._zCVob_type = 130;  	
      B_ExchangeRoutine(npc,"start");
	}
	else
	{
      npc=Hlp_GetNpc(HUN_1422_GorHanis);
      npc._zCVob_type = 130;  	
      B_ExchangeRoutine(npc,"start");
	};	
		
   B_ExchangeRoutine(j,"start"); 
   B_ExchangeRoutine(a2,"start"); 
   B_ExchangeRoutine(a3,"start"); 
   B_ExchangeRoutine(a4,"start"); 
   B_ExchangeRoutine(a5,"start");
   
   npc_id=Hlp_GetinstanceID(j);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130;  
   npc_id=Hlp_GetinstanceID(a2);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130;  
   npc_id=Hlp_GetinstanceID(a3);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130;  
   npc_id=Hlp_GetinstanceID(a4);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130;  
   npc_id=Hlp_GetinstanceID(a5);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130;  
   
//TH Back to "start" state or continue it
   if(kira_help!=1)
   { 
      return; 
   };
   
   a = Hlp_GetNpc(Non_4020_Tablor);
   npc_id=Hlp_GetinstanceID(a);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 	
   B_ExchangeRoutine(a,"start");
   a = Hlp_GetNpc(Non_4021_Bukhart);
   npc_id=Hlp_GetinstanceID(a);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 
   B_ExchangeRoutine(a,"start");
   a = Hlp_GetNpc(Non_4022_Postronek);
   npc_id=Hlp_GetinstanceID(a);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 
   B_ExchangeRoutine(a,"start");
   a = Hlp_GetNpc(Non_4023_Korth);
   npc_id=Hlp_GetinstanceID(a);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 
   B_ExchangeRoutine(a,"PreStart");
   a = Hlp_GetNpc(Non_4024_Snow);
   npc_id=Hlp_GetinstanceID(a);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 
   B_ExchangeRoutine(a,"start");
   a = Hlp_GetNpc(Non_4025_Kron);
   npc_id=Hlp_GetinstanceID(a);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 
   B_ExchangeRoutine(a,"start");
   a = Hlp_GetNpc(Non_4026_Nikolas);
   npc_id=Hlp_GetinstanceID(a);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 
   B_ExchangeRoutine(a,"start");
   a = Hlp_GetNpc(Non_4027_Kira);
   npc_id=Hlp_GetinstanceID(a);
   npc=Hlp_GetNpc(npc_id);
   npc._zCVob_type = 130; 
   B_ExchangeRoutine(a,"start");	

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