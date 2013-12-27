var int last_atak;
//***************************************************************************
// Lumber Globals
//***************************************************************************
const int MAX_LUMBER_DAILY = 7;
var int LUMBER_DAYAMOUNT0 ;
var int LUMBER_DAYAMOUNT1 ;
var int LUMBER_DAYAMOUNT2 ;
var int LUMBER_DAYAMOUNT3 ;
var int LUMBER_DAYAMOUNT4 ;
var int LUMBER_DAYAMOUNT5 ;
var int LUMBER_DAYAMOUNT6 ;
var int LUMBER_DAYAMOUNT7 ;
var int LUMBER_DAYAMOUNT8 ;
var int LUMBER_DAYAMOUNT9 ;
var int LUMBER_DAYAMOUNT10;
var int LUMBER_DAYAMOUNT11;
var int LUMBER_DAYAMOUNT12;
var int LUMBER_DAYAMOUNT13;
var int LUMBER_DAYAMOUNT14;
var int LUMBER_DAYAMOUNT15;
var int LUMBER_DAYAMOUNT16;
var int LUMBER_DAYAMOUNT17;
var int LUMBER_DAYAMOUNT18;
var int LUMBER_DAYAMOUNT19;

const int LUMBER_DAILY_MINUS = 4;
//***************************************************************************
// Ore Globals
// DAILY = 156 ORE=15,6=15
//***************************************************************************
var int DAILYMAGICORE;
var int DAILYGOLDORE;
var int DAILYCARBONORE;
var int DAILYIRONORE;
var int DAILYSILVERORE;

var int DAILYMAGICORE_NOW;
var int DAILYGOLDORE_NOW;
var int DAILYCARBONORE_NOW;
var int DAILYIRONORE_NOW;
var int DAILYSILVERORE_NOW;

func void ADD_DAILYLUMBER()
{
   LUMBER_DAYAMOUNT0=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT1=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT2=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT3=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT4=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT5=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT6=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT7=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT8=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT9=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT10=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);
   LUMBER_DAYAMOUNT11=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT12=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT13=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT14=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT15=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT16=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT17=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT18=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);	
   LUMBER_DAYAMOUNT19=Hlp_Random(MAX_LUMBER_DAILY)-Hlp_Random(LUMBER_DAILY_MINUS);		
   
   if(LUMBER_DAYAMOUNT0<1){LUMBER_DAYAMOUNT0=1;};
   if(LUMBER_DAYAMOUNT1<1){LUMBER_DAYAMOUNT1=1;};
   if(LUMBER_DAYAMOUNT2<1){LUMBER_DAYAMOUNT2=1;};
   if(LUMBER_DAYAMOUNT3<1){LUMBER_DAYAMOUNT3=1;};
   if(LUMBER_DAYAMOUNT4<1){LUMBER_DAYAMOUNT4=1;};
   if(LUMBER_DAYAMOUNT5<1){LUMBER_DAYAMOUNT5=1;};
   if(LUMBER_DAYAMOUNT6<1){LUMBER_DAYAMOUNT6=1;};
   if(LUMBER_DAYAMOUNT7<1){LUMBER_DAYAMOUNT7=1;};
   if(LUMBER_DAYAMOUNT8<1){LUMBER_DAYAMOUNT8=1;};
   if(LUMBER_DAYAMOUNT9<1){LUMBER_DAYAMOUNT9=1;};
   if(LUMBER_DAYAMOUNT10<1){LUMBER_DAYAMOUNT10=1;};
   if(LUMBER_DAYAMOUNT11<1){LUMBER_DAYAMOUNT11=1;};
   if(LUMBER_DAYAMOUNT12<1){LUMBER_DAYAMOUNT12=1;};
   if(LUMBER_DAYAMOUNT13<1){LUMBER_DAYAMOUNT13=1;};
   if(LUMBER_DAYAMOUNT14<1){LUMBER_DAYAMOUNT14=1;};
   if(LUMBER_DAYAMOUNT15<1){LUMBER_DAYAMOUNT15=1;};
   if(LUMBER_DAYAMOUNT16<1){LUMBER_DAYAMOUNT16=1;};
   if(LUMBER_DAYAMOUNT17<1){LUMBER_DAYAMOUNT17=1;};
   if(LUMBER_DAYAMOUNT18<1){LUMBER_DAYAMOUNT18=1;};
   if(LUMBER_DAYAMOUNT19<1){LUMBER_DAYAMOUNT19=1;};
};

func void Reset_DailyOre()
{
	DAILYMAGICORE_NOW   = DAILYMAGICORE; 
	DAILYGOLDORE_NOW    = DAILYGOLDORE;  
	DAILYCARBONORE_NOW  = DAILYCARBONORE;
	DAILYIRONORE_NOW    = DAILYIRONORE;  
   DAILYSILVERORE_NOW	= DAILYSILVERORE;
};

func void b_storysetgrddayattack()
{
	var int rnd1;
	var int rnd2;
	var int rnd3;
	var int rnd4;
	var string grdamountstr;
	GRDDIFICULTALL = Hlp_Random(100) + (hero.level * 2) + Hlp_Random(3 * hero.level);
	GRDATTACKSAMOUNT = Hlp_Random(2);
	GRDDIFICULT1ST = 150 + GRDDIFICULTALL;
	rnd1 = Hlp_Random(6);
	Wld_SetObjectRoutine(0 + rnd1,Hlp_Random(60),"GRDS_TRIGGER_1",1);
	grdamountstr = ConcatStrings("GRDS_TRIGGER_1 == ",IntToString(1 + rnd1));
};

func void b_clearhuntaivs()
{
// to do: remove
};

func void b_setday()
{
	DAY = DAY + 1;
	if(DAY > 6)
	{
		WEEKDAY = WEEKDAY + 1;
	};
	if(DAY == 6)
	{
		WEEK = 1;
		WEEKDAY = PON;
		WEEKTYPE = Hlp_Random(3);
	};
	if(WEEKDAY == ND)
	{
		WEEKTYPE = Hlp_Random(3);
	};

	if(WORLD_CURRENT == WORLD_WORLDZEN)
	{
		LastDayIn_WORLDZEN = DAY;
	}	
	else if(WORLD_CURRENT == WORLD_FREEMINE)
	{
		LastDayIn_FREEMINE = DAY;
	}	
	else if(WORLD_CURRENT == WORLD_OGY)
	{
		LastDayIn_OGY = DAY;
	}	
	else if(WORLD_CURRENT == WORLD_MONSTARYDUNGEONZEN)
	{
		LastDayIn_MONSTARYDUNGEONZEN = DAY;
	}	
	else if(WORLD_CURRENT == WORLD_CATACOMBS)
	{
		LastDayIn_CATACOMBS = DAY;
	};	
// 	else if(WORLD_CURRENT == WORLD_DREAM01)
// 	{
// 		LastDayIn_PSIDREAM = DAY;
// 	};
};

func void b_settodayevents()
{
	return;
	var int rnd;
	//TEMPORARY OFF
	if (last_atak+2+Hlp_Random(4)!=999/*>=Wld_GetDay()*/)&&(!TODAY_ARE_CHALLENGE)&&(Kapitel>3)
	{
		TODAY_ARE_CHALLENGE = FALSE;
		b_storysetgrddayattack();
		last_atak=Wld_GetDay();
	};
};

func void b_storychangeday()
{
	Wld_SendUnTrigger("GRDS_TRIGGER_1");
	printdebug("HELLO NEW DAY!");
	b_setday();
	b_settodayevents();
	Respawn_ChangeDay();
	Reset_DailyOre();//add daily ore amounts
	WeatherForecasting();	
	ADD_DAILYLUMBER();//"dodaæ" drewno do bali
	GRDSINATTACK = 0;
	SkyPreset_DailyFixDone = false;
};

func void DayShift(var int nday)
{
	if(nDay>LAST_DAY)
	{
      DAY=nDay;
      b_storychangeday();
	};
	LAST_DAY = nDay;	
};