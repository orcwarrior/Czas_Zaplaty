//////////////////////////////////////////////////////////////////////////
//	ZS_ZSINIT
//	=======
//	Automatic Routines inits here. 
//////////////////////////////////////////////////////////////////////////
//PATROL1 varibles
var int GP1_1_IsFree;
var int GP1_2_IsFree;
var int GP1_3_IsFree;
var int GP1_4_IsFree;
var int GP1_5_IsFree;
var int GP1_6_IsFree;

const string GP1_1_WP = "";
const string GP1_2_WP = "";
const string GP1_3_WP = "";
const string GP1_4_WP = "";
const string GP1_5_WP = "";
const string GP1_6_WP = "";

//PATROL2 varibles
var int GP2_1_IsFree;
var int GP2_2_IsFree;
var int GP2_3_IsFree;
var int GP2_4_IsFree;
var int GP2_5_IsFree;
var int GP2_6_IsFree;
var int GP2_7_IsFree;
var int GP2_8_IsFree;
var int GP2_9_IsFree;

const string GP2_1_WP = "";
const string GP2_2_WP = "";
const string GP2_3_WP = "";
const string GP2_4_WP = "";
const string GP2_5_WP = "";
const string GP2_6_WP = "";
const string GP2_7_WP = "";
const string GP2_8_WP = "";
const string GP2_9_WP = "";

//PATROL3 varibles
var int GP3_1_IsFree;
var int GP3_2_IsFree;
var int GP3_3_IsFree;
var int GP3_4_IsFree;
var int GP3_5_IsFree;
var int GP3_6_IsFree;
var int GP3_7_IsFree;
var int GP3_8_IsFree;
var int GP3_9_IsFree;
var int GP3_10_IsFree;
var int GP3_11_IsFree;

const string GP3_1_WP = "";
const string GP3_2_WP = "";
const string GP3_3_WP = "";
const string GP3_4_WP = "";
const string GP3_5_WP = "";
const string GP3_6_WP = "";
const string GP3_7_WP = "";
const string GP3_8_WP = "";
const string GP3_9_WP = "";
const string GP3_10_WP = "";
const string GP3_11_WP = "";

func void TA_AutoRest				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_AutoRest ,				waypoint);};
func void Ta_AutoGrdWork				(var int start_h, var int start_m, var int stop_h, var int stop_m, VAR string waypoint)	{TA_Min		(self,	start_h,start_m, stop_h, stop_m,ZS_AutoGrdWork ,				waypoint);};


func void GuardPatrol1RouteInit(var int point,var int loops)
{
	var int pnt;
	if(loops==23)
	{
		if(pnt==5)//Last loop for 6WP - set all wp as free
		{
			GP1_1_IsFree=TRUE;
			GP1_2_IsFree=TRUE;					
			GP1_3_IsFree=TRUE;		
			GP1_4_IsFree=TRUE;
			GP1_5_IsFree=TRUE;					
			GP1_6_IsFree=TRUE;
		};
	 	return;
	}; 
	pnt=point+1; if (pnt==7){pnt=1;};
	if(point==1)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP1_1_WP);
	}	
	else if(point==2)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP1_2_WP);
	}	
	else if(point==3)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP1_3_WP);
	}	
	else if(point==4)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP1_4_WP);
	}	
	else if(point==5)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP1_5_WP);
	}	
	else if(point==6)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP1_6_WP);
	};	
	GuardPatrol1RouteInit(pnt,loops+1);				
};

func void GuardPatrol2RouteInit(var int point,var int loops)
{
	var int pnt;
	if(loops==23)
	{
		if(pnt==5)//Last loop for 9WP - set all wp as free
		{
			GP2_1_IsFree=TRUE;
			GP2_2_IsFree=TRUE;					
			GP2_3_IsFree=TRUE;		
			GP2_4_IsFree=TRUE;
			GP2_5_IsFree=TRUE;					
			GP2_6_IsFree=TRUE;
			GP2_7_IsFree=TRUE;
			GP2_8_IsFree=TRUE;
			GP2_9_IsFree=TRUE;									
		};
	 	return;
	}; 
	pnt=point+1; if (pnt==10){pnt=1;};
	if(point==1)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP2_1_WP);
	}	
	else if(point==2)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP2_2_WP);
	}	
	else if(point==3)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP2_3_WP);
	}	
	else if(point==4)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP2_4_WP);
	}	
	else if(point==5)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP2_5_WP);
	}	
	else if(point==6)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP2_6_WP);
	}		
	else if(point==7)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP2_7_WP);
	}		
	else if(point==8)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP2_8_WP);
	}
	else if(point==9)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP2_9_WP);
	};		
	GuardPatrol2RouteInit(pnt,loops+1);				
};


func void GuardPatrol3RouteInit(var int point,var int loops)
{
	var int pnt;
	if(loops==23)
	{
		if(pnt==1)//Last loop for 9WP - set all wp as free
		{
			GP3_1_IsFree=TRUE;
			GP3_2_IsFree=TRUE;					
			GP3_3_IsFree=TRUE;		
			GP3_4_IsFree=TRUE;
			GP3_5_IsFree=TRUE;					
			GP3_6_IsFree=TRUE;
			GP3_7_IsFree=TRUE;
			GP3_8_IsFree=TRUE;
			GP3_9_IsFree=TRUE;			
			GP3_10_IsFree=TRUE;
			GP3_11_IsFree=TRUE;									
		};
	 	return;
	}; 
	pnt=point+1; if (pnt==12){pnt=1;};
	if(point==1)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP3_1_WP);
	}	
	else if(point==2)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP3_2_WP);
	}	
	else if(point==3)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP3_3_WP);
	}	
	else if(point==4)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP3_4_WP);
	}	
	else if(point==5)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP3_5_WP);
	}	
	else if(point==6)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP3_6_WP);
	}		
	else if(point==7)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP3_7_WP);
	}		
	else if(point==8)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP3_8_WP);
	}
	else if(point==9)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP3_9_WP);
	}
	else if(point==10)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP3_10_WP);
	}		
	else if(point==11)
	{
		TA_GuardPalisade	(loops,00,loops+1,00,GP3_11_WP);
	};	
			
	GuardPatrol3RouteInit(pnt,loops+1);				
};

func void ZS_ZSINIT(var C_NPC slf)
{
		var string wp;	
	if(Npc_GetAivar(self,AIV_ZSTYPE) == TA_OMC_GATEGUARD)
	{

		wp = self.slot;
		TA_Stand	(06,00,21,00,wp);
		TA_Stand	(21,00,06,00,wp);
	}
	else if(Npc_GetAivar(self,AIV_ZSTYPE) == TA_OMC_GUARD)
	{
		wp = self.slot;
		TA_AutoRest	(00,00,07,00,wp);
		wp = self.spawnPoint;
		Ta_AutoGrdWork	(07,01,23,59,wp);		
	}
		else if(Npc_GetAivar(self,AIV_ZSTYPE) == TA_OMC_WORKER)
	{
		wp = self.slot;
		TA_AutoRest	(03,00,06,00,wp);
		wp = self.spawnPoint;
		Ta_PickOre	(06,01,02,59,wp);		
	}
		else if(Npc_GetAivar(self,AIV_ZSTYPE) == TA_ONEPOSITION)
	{
		wp = self.slot;
		var int rnd; rnd = Hlp_Random(3); 
		TA_AutoRest	(23-rnd,40,06+rnd,00,wp);
		wp = self.spawnPoint;
		Ta_Stand	(06+rnd,01,23-rnd,39,wp);		
	}
		else if(Npc_GetAivar(self,AIV_ZSTYPE) == TA_NO_GUARDPATROL1)
	{
		if(GP1_1_IsFree)
		{
			 GP1_1_IsFree=FALSE;
			 GuardPatrol1RouteInit(1,0);
		}
		else if(GP1_2_IsFree)
		{
			 GP1_2_IsFree=FALSE;	
			 GuardPatrol1RouteInit(2,0);
		}		
		else if(GP1_3_IsFree)
		{
			 GP1_3_IsFree=FALSE;	
			 GuardPatrol1RouteInit(3,0);
		}		
		else if(GP1_4_IsFree)
		{
			 GP1_4_IsFree=FALSE;	
			 GuardPatrol1RouteInit(4,0);
		}		
		else if(GP1_5_IsFree)
		{
			 GP1_5_IsFree=FALSE;	
			 GuardPatrol1RouteInit(5,0);
		}		
		else if(GP1_6_IsFree)
		{
			 GP1_6_IsFree=FALSE;	
			 GuardPatrol1RouteInit(6,0);
		};						   
	}
		else if(Npc_GetAivar(self,AIV_ZSTYPE) == TA_NO_GUARDPATROL2)
	{
		if(GP2_1_IsFree)
		{
			 GP2_1_IsFree=FALSE;
			 Guardpatrol2RouteInit(1,0);
		}
		else if(GP2_2_IsFree)
		{
			 GP2_2_IsFree=FALSE;	
			 Guardpatrol2RouteInit(2,0);
		}		
		else if(GP2_3_IsFree)
		{
			 GP2_3_IsFree=FALSE;	
			 Guardpatrol2RouteInit(3,0);
		}		
		else if(GP2_4_IsFree)
		{
			 GP2_4_IsFree=FALSE;	
			 Guardpatrol2RouteInit(4,0);
		}		
		else if(GP2_5_IsFree)
		{
			 GP2_5_IsFree=FALSE;	
			 Guardpatrol2RouteInit(5,0);
		}	
		else if(GP2_6_IsFree)
		{
			 GP2_6_IsFree=FALSE;	
			 Guardpatrol2RouteInit(6,0);
		}		
		else if(GP2_7_IsFree)
		{
			 GP2_7_IsFree=FALSE;	
			 Guardpatrol2RouteInit(7,0);
		}		
		else if(GP2_8_IsFree)
		{
			 GP2_8_IsFree=FALSE;	
			 Guardpatrol2RouteInit(8,0);
		}				
		else if(GP2_9_IsFree)
		{
			 GP2_9_IsFree=FALSE;	
			 Guardpatrol2RouteInit(9,0);
		};						   
	}			
	
	else if(Npc_GetAivar(self,AIV_ZSTYPE) == TA_NO_GUARDPATROL3)
	{
		if(GP3_1_IsFree)
		{
			 GP3_1_IsFree=FALSE;
			 Guardpatrol3RouteInit(1,0);
		}
		else if(GP3_2_IsFree)
		{
			 GP3_2_IsFree=FALSE;	
			 Guardpatrol3RouteInit(2,0);
		}		
		else if(GP3_3_IsFree)
		{
			 GP3_3_IsFree=FALSE;	
			 Guardpatrol3RouteInit(3,0);
		}		
		else if(GP3_4_IsFree)
		{
			 GP3_4_IsFree=FALSE;	
			 Guardpatrol3RouteInit(4,0);
		}		
		else if(GP3_5_IsFree)
		{
			 GP3_5_IsFree=FALSE;	
			 Guardpatrol3RouteInit(5,0);
		}	
		else if(GP3_6_IsFree)
		{
			 GP3_6_IsFree=FALSE;	
			 Guardpatrol3RouteInit(6,0);
		}		
		else if(GP3_7_IsFree)
		{
			 GP3_7_IsFree=FALSE;	
			 Guardpatrol3RouteInit(7,0);
		}		
		else if(GP3_8_IsFree)
		{
			 GP3_8_IsFree=FALSE;	
			 Guardpatrol3RouteInit(8,0);
		}	
		else if(GP3_9_IsFree)
		{
			 GP3_9_IsFree=FALSE;	
			 Guardpatrol3RouteInit(9,0);
		}		
		else if(GP3_10_IsFree)
		{
			 GP3_10_IsFree=FALSE;	
			 Guardpatrol3RouteInit(10,0);
		}						
		else if(GP3_11_IsFree)
		{
			 GP3_11_IsFree=FALSE;	
			 Guardpatrol3RouteInit(11,0);
		};						   
	};								
};
func void Rtn_autoinit()
{
	ZS_ZSINIT(self);
};		