
var int SkyDome0_Mesh_Ptr;
var int SkyDome1_Mesh_Ptr;

const int TIME_MIDDAY 		= 0; //12:00
const int TIME_AFTERNOON 	= 1; //17:00
const int TIME_SUNSET 		= 2; //19:12
const int TIME_DUSK 		= 3; //20:24
const int TIME_MIDNIGHT 	= 4; //0:00
const int TIME_DAWN 		= 5; //3:20
const int TIME_SUNRISE 		= 6; //4:30
const int TIME_MORNING 		= 7; //6:00

const int SkyPresetArraySize = TIME_MORNING+1;

var int CURRENT_SKYPRESET;
const int		SKYPRESET_SUNNY = 0;	//Group: Sunny
const int		SKYPRESET_SUNNY2 = 1;
const int		SKYPRESET_FOGGY = 2;	//Group: Foggy
const int		SKYPRESET_FOGGY2 = 3;	
const int		SKYPRESET_NORMAL = 4;	//Group: Normal
const int		SKYPRESET_NORMAL2 = 5;	
const int		SKYPRESET_MAX = 6;//for random preset (at forecast)

const int		SKYPRESET_GROUPSIZE = 2;//sunny/sunny2, etc.

const int		SKYPRESET_START =  SKYPRESET_SUNNY2;//Used in startup

var int DoNotChange_State0;
var int DoNotChange_State1;

var int SkyPreset_ReInit;
var int SkyPreset_DailyFixDone;//reset in story/b_setday - it helps to change texture of skyclouds at moring (sometime it won't blend from dusk/dawn tex to normal one
var int SkyPreset_SetRemainingSkyStatesDone;//bool, reset every TRANS_SMOOTH..
//Parrameters stored for fading


//-----------------------------
// W E A T H E R 
// F O R E C A S T I N G
//-----------------------------

var int DayCount_SamePreset;//counting days of same preset f.e. FOGGY, when preset changes counter reset to 0
var int NextPreset_ID;//Preset that will be set at NextPreset_HH
var int NextPreset_HH;//When NextPreset will be set (from 12 (per midday) through midnight (0:00) till dawn (3:XX))
var int NextPreset_Aplied;//bool
//var int NextPreset_Day;//(At forecasting: wld_Getday+1;


func int GetSkyPreset()
{
	return CURRENT_SKYPRESET;
};


const int TRANS_STEP = 0;
const int TRANS_SMOOTH = 1;
func void SkyPresets_InitSkyController()
{
//	if (!MEM_World.skyControlerOutdoor)//Globals don't inited
//	{
		MEM_InitGlobalInst();
//	};	
//	if(SkyController_Ptr==0)
//	{
		SkyController_Ptr = MEM_InstGetOffset(MEM_SkyController);	
//	};
};

//
 func void SkyPresets_GetSkyDome()//putting it into skydome1_ptr;
 {
 	var int skyptr;
 	SkyPresets_InitSkyController();
	
	if(!SkyDome1_Mesh_Ptr)
	{
		//first init
		skyptr = MEM_SearchVobByName("SKYDOME_LAYER1");//zCVob
		skyptr = MEM_ReadInt(skyptr+184);//zCVisual
		skyptr = MEM_ReadInt(skyptr+84);//zCParticleFx
		skyptr = MEM_ReadInt(skyptr+620);//zCMesh
 		SkyDome1_Mesh_Ptr = skyptr;		
	}
	else if ((SkyDome1_Mesh_Ptr) && (MEM_ReadInt(SkyDome1_Mesh_Ptr) != zCMesh_vtbl))
	{
		//re-init
		skyptr = MEM_SearchVobByName("SKYDOME_LAYER1");//zCVob
		skyptr = MEM_ReadInt(skyptr+184);//zCVisual
		skyptr = MEM_ReadInt(skyptr+84);//zCParticleFx
		skyptr = MEM_ReadInt(skyptr+620);//zCMesh
 		SkyDome1_Mesh_Ptr = skyptr;		
	};
	
	if(!SkyDome0_Mesh_Ptr)
 	{
 		//first init
 		skyptr = MEM_SearchVobByName("SKYDOME_LAYER0");//zCVob
 		skyptr = MEM_ReadInt(skyptr+184);//zCVisual
 		skyptr = MEM_ReadInt(skyptr+84);//zCParticleFx
 		skyptr = MEM_ReadInt(skyptr+620);//zCMesh
  		SkyDome0_Mesh_Ptr = skyptr;		
 	}
 	else if ((SkyDome0_Mesh_Ptr) && (MEM_ReadInt(SkyDome0_Mesh_Ptr) != zCMesh_vtbl))
 	{
 		//re-init
 		skyptr = MEM_InstGetOffset(MEM_SkyController);
 		skyptr = MEM_SearchVobByName("SKYDOME_LAYER1");//zCVob
 		skyptr = MEM_ReadInt(skyptr+184);//zCVisual
 		skyptr = MEM_ReadInt(skyptr+84);//zCParticleFx
 		skyptr = MEM_ReadInt(skyptr+620);//zCMesh
  		SkyDome0_Mesh_Ptr = skyptr;		
 	};	
// 	
 };




//************************************************************
// If new sky preset have to be aplied 
// smoothly put state0 and state1 into 
// this vars. 
// If zCSkyControlles.state0 != DoNotChange_State1
// (It will be meaned that state1->state0->transisted fully)
// They will be changed too (it needed to be added into
// some loop trigger.
// 
// -orc February 03, 2011 11:37:53 PM 
//************************************************************



//Yea, function got lot of args ;P
func void SetSkyState(var int time,
var int polyR,var int polyG, var int polyB,
var int fogR,var int fogG, var int fogB,
var string l0_tex, var int l0_alpha,var int l0_size, var int l0_mspeedx, var int l0_mspeedy,
var string l1_tex, var int l1_alpha,var int l1_size, var int l1_mspeedx, var int l1_mspeedy)
{
	// ************************************************************
	// all of argumenst are normal integers, later converted to
	// zFloat, except *_size *_mspeedx/y
	// ************************************************************
	var int ptr; var int skystateslist; var int hlp; var int i;
	var int l0_zCTexture_ptr;
	var int l1_zCTexture_ptr;
	
	//Get proper zCSkyState:
	skystateslist = MEM_ReadInt(SkyController_Ptr+316);//ZCSkyState Array
 	ptr = MEM_ReadInt(skystateslist+time*4);//ZCSkyState[time]

	
 	//Prevent changing SkyStates that are mixing right now:
 	if (ptr == DoNotChange_State0)
 	{
	 	return;		
 	}
 	else if(ptr == DoNotChange_State1)
 	{
		//Set rain in zCSkyController_Outdoor:
		CustomRainFX_InitRainSkyTime(subf(MEM_ReadInt(ptr),fracf(1,18)),addf(MEM_ReadInt(MEM_ReadInt(skystateslist+time*4+4)),fracf(1,18)),mkf(1),Default_RainTEX,FLAG_INSTANT|FLAG_SKYPRESETRAIN); 	
	 	//..
	 	return;	
 	};
 	
 	//Get *zCTexture Layer0 using internal function
 	if(Str_Len(l0_tex))
 	{
 		CALL_zStringPtrParam(l0_tex);
 		CALL__cdecl (zCTexture__SearchName_offset);
 		l0_zCTexture_ptr = CALL_RetValAsPtr();
 		if(!l0_zCTexture_ptr)//still not loaded? load it now!
 		{
	 		CALL_zStringPtrParam(l0_tex);
 			CALL__cdecl (zCTexture__LoadSingle_offset);
 			l0_zCTexture_ptr = CALL_RetValAsPtr();			 	
 		};
	};	
 	//Get *zCTexture Layer1 using internal function
 	if(Str_Len(l1_tex))
 	{
 		CALL_zStringPtrParam(l1_tex);
 		CALL__cdecl (zCTexture__SearchName_offset);
 		l1_zCTexture_ptr = CALL_RetValAsPtr();
 		if(!l1_zCTexture_ptr)//still not loaded? load it now!
 		{
	 		CALL_zStringPtrParam(l1_tex);
 			CALL__cdecl (zCTexture__LoadSingle_offset);
 			l1_zCTexture_ptr = CALL_RetValAsPtr();			 	
 		};
	};
 	
 	
 	//TODO: When setting fogcolor middle of day, set it to overridecolor property too.
 	

  	//Layer 0:
	MEM_WriteInt(ptr+88,l0_zCTexture_ptr);
 	MEM_WriteString(ptr+92,l0_tex);
  	MEM_WriteInt(ptr+112,mkf(l0_alpha));// alpha	 	
  	MEM_WriteInt(ptr+116,l0_size);		// texscale
  	MEM_WriteInt(ptr+120,l0_mspeedx);	// move speedx
  	MEM_WriteInt(ptr+124,l0_mspeedy);	// move speedy 	
  	//Layer 1:
 	MEM_WriteInt(ptr+152,l1_zCTexture_ptr);
 	MEM_WriteString(ptr+156,l1_tex);
  	MEM_WriteInt(ptr+176,mkf(l1_alpha));// alpha 	
  	MEM_WriteInt(ptr+180,l1_size);		// texscale
	MEM_WriteInt(ptr+184,l1_mspeedx);	// move speedx
  	MEM_WriteInt(ptr+188,l1_mspeedy);	// move speedy  	

  	//Outdoor Poly color/Ambient Lightning
 	MEM_WriteInt(ptr+4,mkf(polyR));//r
 	MEM_WriteInt(ptr+8,mkf(polyG));//g
 	MEM_WriteInt(ptr+12,mkf(polyB));//b

 	//Outdoor Fog color
 	MEM_WriteInt(ptr+16,mkf(fogR));//r
 	MEM_WriteInt(ptr+20,mkf(fogG));//g
 	MEM_WriteInt(ptr+24,mkf(fogB));//b	
 	  	
 //	MEM_WriteInt(ptr+56,0);//??  
 //	MEM_WriteInt(ptr+60,1);//??  	changing colour of skypreset (how it works i dunno);
 //	//MEM_WriteInt(ptr+64,1);//??  	CRASH: zCSkyControler_Outdoor::ApplyStateTexToLayer()+921 byte(s)
 //	MEM_WriteInt(ptr+68,-5000);//??  	crash


};

func void SkyPresets_SetToday_Foggy(var int trans)
{
 	var int ptr;
 	var int f_foggyskysize; var int f_foggyspeed;
 	var int f_nightskysize; var int f_foggyskysize2;

 	f_foggyskysize = mkf(1);
 	f_foggyskysize2 = fracf(5,4);
 	f_foggyspeed = fracf(1,3);
 	f_nightskysize = fracf(5,4);
	
 	//Midday
	SetSkyState(TIME_MIDDAY,	150,150,157,	120,120,125,
	"SKYDAY_LAYER1_A1.TGA",			255,mkf(1),			0,		0,
	"SKYDAY_FOGGY_LAYER1_NORMAL.TGA",	255,f_foggyskysize,	f_foggyspeed,	f_foggyspeed); 	
	
	//Afternoon
	SetSkyState(TIME_AFTERNOON,	130,130,137,	120,120,125,
	"SKYNIGHT_FOGGY_LAYER0.TGA",			0,f_nightskysize,			0,		0,
	"SKYDAY_FOGGY_LAYER1_NORMAL.TGA",	55,f_foggyskysize,	f_foggyspeed,	f_foggyspeed); 	

	//Sunset
	SetSkyState(TIME_SUNSET,	105,105,120,	90,90,95,
	"SKYNIGHT_FOGGY_LAYER0.TGA",			124,f_nightskysize,			0,		0,
	"SKYNIGHT_FOGGY_LAYER1.TGA",	0,f_foggyskysize,	f_foggyspeed,	f_foggyspeed); 	

	//Dusk
	SetSkyState(TIME_DUSK,	82,95,102,	20,22,40,
	"SKYNIGHT_FOGGY_LAYER0.TGA",			255,f_nightskysize,			0,		0,
	"SKYNIGHT_FOGGY_LAYER1.TGA",	205,f_foggyskysize2,	f_foggyspeed,	f_foggyspeed); 	

	//Midnight
	SetSkyState(TIME_MIDNIGHT,	52,81,100,	22,42,45,
	"SKYNIGHT_FOGGY_LAYER0.TGA",			255,f_nightskysize,			0,		0,
	"SKYNIGHT_FOGGY_LAYER1.TGA",	255,f_foggyskysize2,	f_foggyspeed,	f_foggyspeed); 	

	//Dawn
	SetSkyState(TIME_DAWN,	72,81,100,	32,31,32,
	"SKYNIGHT_FOGGY_LAYER0.TGA",			0,f_nightskysize,			0,		0,
	"SKYDAY_FOGGY_LAYER1_NORMAL.TGA",	0,f_foggyskysize,	f_foggyspeed,	f_foggyspeed); 			
 
	//Sunrise
	SetSkyState(TIME_SUNRISE,	102,51,75,	38,35,37,
	"SKYDAY_FOGGY_LAYER1_NORMAL.TGA",			0,mkf(1),			0,		0,
	"SKYDAY_FOGGY_LAYER1_NORMAL.TGA",	140,f_foggyskysize,	f_foggyspeed,	f_foggyspeed); 	
 	//Midday
	SetSkyState(TIME_MORNING,	120,120,127,	110,110,115,
	"SKYDAY_LAYER1_A1.TGA",			255,mkf(1),			0,		0,
	"SKYDAY_FOGGY_LAYER1_NORMAL.TGA",	255,f_foggyskysize,	f_foggyspeed,	f_foggyspeed); 	
	
 	//If smooth, this part will be done when setting remaining states (when it will be raining)
 	if(trans == TRANS_SMOOTH)
 	{
	 	return;
 	};	
	//Set day fog COLOR [override]
 	ptr = MEM_ReadInt(SkyController_Ptr+1364);
 	MEM_WriteInt(ptr,mkf(105));	 //r
 	MEM_WriteInt(ptr+4,mkf(105));//g
 	MEM_WriteInt(ptr+8,mkf(110));//b

 	MEM_WriteInt(SkyController_Ptr+1388,mkf(1900));
 	MEM_WriteInt(SkyController_Ptr+1392,mkf(12500));
 	
 	MEM_WriteInt(SkyController_Ptr+1532,mkf(50));//sun alpha 
 	MEM_WriteInt(SkyController_Ptr+1520,mkf(200));//sun r 
 	MEM_WriteInt(SkyController_Ptr+1524,mkf(200));//sun g 
 	MEM_WriteInt(SkyController_Ptr+1528,mkf(200));//sun b 
 	 	
 	MEM_WriteInt(SkyController_Ptr+1580,mkf(255));//moon alpha1 
 	
 	MEM_WriteInt(SkyController_Ptr+1584,mkf(185));//moon r
 	MEM_WriteInt(SkyController_Ptr+1588,mkf(255));//moon g
 	MEM_WriteInt(SkyController_Ptr+1592,mkf(205));//moon b
 	
 	MEM_WriteInt(SkyController_Ptr+1596,mkf(155));//moon alpha 2
 	MEM_WriteInt(SkyController_Ptr+1600,mkf(120));//moon size
 	
	
	
};

func void SkyPresets_SetToday_NORMAL(var int trans)
{
 	var int ptr;
 	var int f_NORMALskysize; var int f_NORMALspeed;
 	var int f_nightskysize; var int f_NORMALskysize2;
 	
 	f_NORMALskysize = fracf(10,10);
 	f_NORMALskysize2 = fracf(5,10);
 	f_NORMALspeed = fracf(1,2);
 	 f_nightskysize = fracf(5,4);
 	

 	//Midday
	SetSkyState(TIME_MIDDAY,	245,230,220,	174,166,136,
	"SKYDAY_LAYER0_A1.TGA",			54,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed,
	"SKYDAY_NORMAL_LAYER1_NORMAL.TGA",			151,f_NORMALskysize2,	f_NORMALspeed,	f_NORMALspeed);

 	//Afternoon
	SetSkyState(TIME_AFTERNOON,	245,220,210,	154,132,112,
	"SKYDAY_LAYER0_A1.TGA",			0,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed,
	"SKYDAY_NORMAL_LAYER1_NORMAL.TGA",	207,f_NORMALskysize2,	f_NORMALspeed,	f_NORMALspeed); 	

 	//Sunset
	SetSkyState(TIME_SUNSET,	110,80,55,	135,115,85,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			0,f_nightskysize,			f_NORMALspeed,		f_NORMALspeed,
	"SKYDAY_NORMAL_LAYER1_NORMAL.TGA",	55,f_NORMALskysize2,	f_NORMALspeed,	f_NORMALspeed); 	
 
 	//Dusk
	SetSkyState(TIME_DUSK,	25,25,70,	20,22,36,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			208,f_nightskysize,			0,		0,
	"SKYDAY_NORMAL_LAYER1_NORMAL.TGA",	0,f_NORMALskysize2,	f_NORMALspeed,	f_NORMALspeed); 		
 
 	//Midnite
	SetSkyState(TIME_MIDNIGHT,	10,46,70,	16,25,40,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			205,f_nightskysize,			0,		0,
	"SKYDAY_NORMAL_LAYER1_NORMAL.TGA",	0,f_NORMALskysize2,	f_NORMALspeed,	f_NORMALspeed); //tu moga byc nocne chmury ;p
 
 	//Dawn
	SetSkyState(TIME_DAWN,	88,50,40,	42,32,20,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			105,f_nightskysize,			0,		0,
	"SKYDAY_NORMAL_LAYER1_NORMAL.TGA",	145,f_NORMALskysize2,	f_NORMALspeed,	f_NORMALspeed); 
	
 	//Sunrise
	SetSkyState(TIME_SUNRISE,	100,70,55,	42,32,20,
	"SKYDAY_LAYER0_A1.TGA",	0,f_NORMALskysize,		f_NORMALspeed,		f_NORMALspeed,
	"SKYDAY_NORMAL_LAYER1_NORMAL.TGA",	255,f_NORMALskysize2,	f_NORMALspeed,	f_NORMALspeed);  	
	
 	//Moring
	SetSkyState(TIME_MORNING,	220,212,200,	164,132,112,
	"SKYDAY_LAYER0_A1.TGA",			225,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed,
	"SKYDAY_NORMAL_LAYER1_NORMAL.TGA",	215,f_NORMALskysize2,	f_NORMALspeed,	f_NORMALspeed);  		
 	
	
 	//If smooth, this part will be done when setting remaining states (when it will be raining)
	if(trans == TRANS_SMOOTH)
 	{
	 	return;
 	};

	
	//Set day fog COLOR [override]
 	//MEM_WriteInt(SkyController_Ptr+316);//ZCSkyState Array
 	ptr = MEM_ReadInt(SkyController_Ptr+1364);
 	MEM_WriteInt(ptr,mkf(99));	 //r	95,110,122
 	MEM_WriteInt(ptr+4,mkf(99));//g
 	MEM_WriteInt(ptr+8,mkf(99));//b

 	MEM_WriteInt(SkyController_Ptr+1388,mkf(9000));
 	MEM_WriteInt(SkyController_Ptr+1392,mkf(20000));

 	MEM_WriteInt(SkyController_Ptr+1532,mkf(155));//sun alpha 
 	MEM_WriteInt(SkyController_Ptr+1520,mkf(255));//sun r 
 	MEM_WriteInt(SkyController_Ptr+1524,mkf(252));//sun g 
 	MEM_WriteInt(SkyController_Ptr+1528,mkf(220));//sun b 
 	 	
 	MEM_WriteInt(SkyController_Ptr+1580,mkf(255));//moon alpha1 
 	
 	MEM_WriteInt(SkyController_Ptr+1584,mkf(255));//moon r
 	MEM_WriteInt(SkyController_Ptr+1588,mkf(255));//moon g
 	MEM_WriteInt(SkyController_Ptr+1592,mkf(255));//moon b
 	
 	MEM_WriteInt(SkyController_Ptr+1596,mkf(155));//moon alpha 2
 	MEM_WriteInt(SkyController_Ptr+1600,mkf(100));//moon size
 	
	
};

func void SkyPresets_SetToday_NORMAL2(var int trans)
{
 	var int ptr;
 	var int f_NORMALskysize; var int f_NORMALspeed;
 	var int f_nightskysize;
 	
 	f_NORMALskysize = fracf(9,10);
 	f_NORMALspeed = fracf(1,2);
 	f_nightskysize = fracf(5,4);
 	

 	//Midday
	SetSkyState(TIME_MIDDAY,	195,210,220,	100,100,100,
	"SKYDAY_NORMAL2_LAYER1_NORMAL.TGA",			254,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed,
	"SKYDAY_NORMAL2_LAYER1_DUSK.TGA",			1,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed);

 	//Afternoon
	SetSkyState(TIME_AFTERNOON,	190,202,210,	97,97,97,
	"SKYDAY_NORMAL2_LAYER1_NORMAL.TGA",			50,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed,
	"SKYDAY_NORMAL2_LAYER1_DUSK.TGA",	177,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed); 	

 	//Sunset
	SetSkyState(TIME_SUNSET,	120,80,55,	135,115,85,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			0,f_nightskysize,			f_NORMALspeed,		f_NORMALspeed,
	"SKYDAY_NORMAL2_LAYER1_DUSK.TGA",	255,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed); 	
 
 	//Dusk
	SetSkyState(TIME_DUSK,	61,61,90,	20,22,36,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			238,f_nightskysize,			0,		0,
	"SKYDAY_NORMAL2_LAYER1_DUSK.TGA",	0,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed); 		
 
 	//Midnite
	SetSkyState(TIME_MIDNIGHT,	50,70,90,	16,25,40,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			255,f_nightskysize,			0,		0,
	"SKYDAY_NORMAL2_LAYER1_DUSK.TGA",	0,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed); //tu moga byc nocne chmury ;p
 
 	//Dawn
	SetSkyState(TIME_DAWN,	95,60,60,	42,32,20,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			125,f_nightskysize,			0,		0,
	"SKYDAY_NORMAL2_LAYER1_DUSK.TGA",	115,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed); 
	
 	//Sunrise
	SetSkyState(TIME_SUNRISE,	100,70,55,	42,32,20,
	"SKYDAY_NORMAL2_LAYER1_NORMAL.TGA",	0,f_NORMALskysize,		f_NORMALspeed,		f_NORMALspeed,
	"SKYDAY_NORMAL2_LAYER1_DUSK.TGA",	255,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed);  	
	
 	//Moring
	SetSkyState(TIME_MORNING,	190,202,210,	98,98,98,
	"SKYDAY_NORMAL2_LAYER1_NORMAL.TGA",			255,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed,
	"SKYDAY_NORMAL2_LAYER1_DUSK.TGA",	25,f_NORMALskysize,	f_NORMALspeed,	f_NORMALspeed);  		
 	
	
 	//If smooth, this part will be done when setting remaining states (when it will be raining)
	if(trans == TRANS_SMOOTH)
 	{
	 	return;
 	};

	
	//Set day fog COLOR [override]
 	//MEM_WriteInt(SkyController_Ptr+316);//ZCSkyState Array
 	ptr = MEM_ReadInt(SkyController_Ptr+1364);
 	MEM_WriteInt(ptr,mkf(99));	 //r	95,110,122
 	MEM_WriteInt(ptr+4,mkf(99));//g
 	MEM_WriteInt(ptr+8,mkf(99));//b

 	MEM_WriteInt(SkyController_Ptr+1388,mkf(8500));
 	MEM_WriteInt(SkyController_Ptr+1392,mkf(18000));

 	MEM_WriteInt(SkyController_Ptr+1532,mkf(155));//sun alpha 
 	MEM_WriteInt(SkyController_Ptr+1520,mkf(255));//sun r 
 	MEM_WriteInt(SkyController_Ptr+1524,mkf(252));//sun g 
 	MEM_WriteInt(SkyController_Ptr+1528,mkf(220));//sun b 
 	 	
 	MEM_WriteInt(SkyController_Ptr+1580,mkf(255));//moon alpha1 
 	
 	MEM_WriteInt(SkyController_Ptr+1584,mkf(255));//moon r
 	MEM_WriteInt(SkyController_Ptr+1588,mkf(255));//moon g
 	MEM_WriteInt(SkyController_Ptr+1592,mkf(255));//moon b
 	
 	MEM_WriteInt(SkyController_Ptr+1596,mkf(155));//moon alpha 2
 	MEM_WriteInt(SkyController_Ptr+1600,mkf(100));//moon size
 	
	
};

func void SkyPresets_SetToday_Sunny(var int trans)
{
 	var int ptr;
 	var int f_sunnyskysize; var int f_sunnyspeed; 
 	var int f_nightskysize; 
 	
 	f_sunnyskysize = fracf(7,10);
 	f_sunnyspeed = fracf(2,5);
 	f_sunnyspeed = fracf(20,51);
 	f_nightskysize = fracf(5,4);
 	

 	//Midday
	SetSkyState(TIME_MIDDAY,	255,255,255,	180,180,185,
	"SKYDAY_SUNNY_LAYER1_NORMAL.TGA",			255,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed,
	"SKYDAY_SUNNY_LAYER1_DUSK.TGA",			0,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed);

 	//Afternoon
	SetSkyState(TIME_AFTERNOON,	212,176,120,	175,155,100,
	"SKYDAY_SUNNY_LAYER1_NORMAL.TGA",			50,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed,
	"SKYDAY_SUNNY_LAYER1_DUSK.TGA",	177,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed); 	

 	//Sunset
	SetSkyState(TIME_SUNSET,	140,87,60,	145,105,65,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			0,f_nightskysize,			f_sunnyspeed,		f_sunnyspeed,
	"SKYDAY_SUNNY_LAYER1_DUSK.TGA",	255,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed); 	
 
 	//Dusk
	SetSkyState(TIME_DUSK,	65,65,100,	20,22,36,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			238,f_nightskysize,			0,		0,
	"SKYDAY_SUNNY_LAYER1_DUSK.TGA",	0,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed); 		
 
 	//Midnite
	SetSkyState(TIME_MIDNIGHT,	50,72,100,	16,25,41,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			255,f_nightskysize,			0,		0,
	"SKYDAY_SUNNY_LAYER1_DUSK.TGA",	0,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed); //tu moga byc nocne chmury ;p
 
 	//Dawn
	SetSkyState(TIME_DAWN,	110,50,60,	42,32,20,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			125,f_nightskysize,			0,		0,
	"SKYDAY_SUNNY_LAYER1_DUSK.TGA",	115,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed); 
	
 	//Sunrise
	SetSkyState(TIME_SUNRISE,	120,79,55,	42,32,20,
	"SKYDAY_SUNNY_LAYER1_NORMAL.TGA",	0,f_sunnyskysize,		f_sunnyspeed,		f_sunnyspeed,
	"SKYDAY_SUNNY_LAYER1_DUSK.TGA",	255,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed);  	
	
 	//Moring
	SetSkyState(TIME_MORNING,	202,202,200,	155,155,125,
	"SKYDAY_SUNNY_LAYER1_NORMAL.TGA",			255,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed,
	"SKYDAY_SUNNY_LAYER1_DUSK.TGA",	25,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed);  		
 	
	
 	//If smooth, this part will be done when setting remaining states (when it will be raining)
	if(trans == TRANS_SMOOTH)
 	{
	 	return;
 	};

	
	//Set day fog COLOR [override]
 	//MEM_WriteInt(SkyController_Ptr+316);//ZCSkyState Array
 	ptr = MEM_ReadInt(SkyController_Ptr+1364);
 	MEM_WriteInt(ptr,mkf(190));	 //r
 	MEM_WriteInt(ptr+4,mkf(185));//g
 	MEM_WriteInt(ptr+8,mkf(180));//b

 	MEM_WriteInt(SkyController_Ptr+1388,mkf(10500));
 	MEM_WriteInt(SkyController_Ptr+1392,mkf(20500));

 	MEM_WriteInt(SkyController_Ptr+1532,mkf(215));//sun alpha 
 	MEM_WriteInt(SkyController_Ptr+1520,mkf(255));//sun r 
 	MEM_WriteInt(SkyController_Ptr+1524,mkf(252));//sun g 
 	MEM_WriteInt(SkyController_Ptr+1528,mkf(220));//sun b 
 	 	
 	MEM_WriteInt(SkyController_Ptr+1580,mkf(255));//moon alpha1 
 	
 	MEM_WriteInt(SkyController_Ptr+1584,mkf(255));//moon r
 	MEM_WriteInt(SkyController_Ptr+1588,mkf(255));//moon g
 	MEM_WriteInt(SkyController_Ptr+1592,mkf(255));//moon b
 	
 	MEM_WriteInt(SkyController_Ptr+1596,mkf(155));//moon alpha 2
 	MEM_WriteInt(SkyController_Ptr+1600,mkf(100));//moon size
 	
	
};

func void SkyPresets_SetToday_Sunny2(var int trans)
{
 	var int ptr;
 	var int f_sunnyskysize; var int f_sunnyspeed; 
 	var int f_nightskysize;
 	
 	f_sunnyskysize = fracf(6,9);
 	f_sunnyspeed = fracf(2,5);
 	f_sunnyspeed = fracf(20,51);
 	f_nightskysize = fracf(5,4);
 	

 	//Midday
	SetSkyState(TIME_MIDDAY,	255,255,255,	180,180,185,
	"SKYDAY_SUNNY2_LAYER1_NORMAL.TGA",			255,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed,
	"SKYDAY_SUNNY2_LAYER1_DUSK.TGA",			0,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed);

 	//Afternoon
	SetSkyState(TIME_AFTERNOON,	255,235,225,	180,150,125,
	"SKYDAY_SUNNY2_LAYER1_NORMAL.TGA",			80,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed,
	"SKYDAY_SUNNY2_LAYER1_DUSK.TGA",	107,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed); 	

 	//Sunset
	SetSkyState(TIME_SUNSET,	140,87,60,	145,105,65,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			0,f_nightskysize,			f_sunnyspeed,		f_sunnyspeed,
	"SKYDAY_SUNNY2_LAYER1_DUSK.TGA",	255,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed); 	
 
 	//Dusk
	SetSkyState(TIME_DUSK,	65,65,100,	10,30,36,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			168,f_nightskysize,			0,		0,
	"SKYDAY_SUNNY2_LAYER1_DUSK.TGA",	0,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed); 		
 
 	//Midnite
	SetSkyState(TIME_MIDNIGHT,	50,72,100,	16,25,40,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			255,f_nightskysize,			0,		0,
	"SKYDAY_SUNNY2_LAYER1_DUSK.TGA",	0,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed); //tu moga byc nocne chmury ;p
 
 	//Dawn
	SetSkyState(TIME_DAWN,	110,50,60,	42,32,20,
	"SKYNIGHT_SUNNY_LAYER0.TGA",			125,f_nightskysize,			0,		0,
	"SKYDAY_SUNNY2_LAYER1_DUSK.TGA",	115,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed); 
	
 	//Sunrise
	SetSkyState(TIME_SUNRISE,	120,79,55,	42,32,20,
	"SKYDAY_SUNNY2_LAYER1_NORMAL.TGA",	0,f_sunnyskysize,		f_sunnyspeed,		f_sunnyspeed,
	"SKYDAY_SUNNY2_LAYER1_DUSK.TGA",	255,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed);  	
	
 	//Moring
	SetSkyState(TIME_MORNING,	202,202,200,	155,155,125,
	"SKYDAY_SUNNY2_LAYER1_NORMAL.TGA",			255,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed,
	"SKYDAY_SUNNY2_LAYER1_DUSK.TGA",	25,f_sunnyskysize,	f_sunnyspeed,	f_sunnyspeed);  		
 	
	
 	//If smooth, this part will be done when setting remaining states (when it will be raining)
	if(trans == TRANS_SMOOTH)
 	{
	 	return;
 	};

	
	//Set day fog COLOR [override]
 	//MEM_WriteInt(SkyController_Ptr+316);//ZCSkyState Array
 	ptr = MEM_ReadInt(SkyController_Ptr+1364);
 	MEM_WriteInt(ptr,mkf(190));	 //r
 	MEM_WriteInt(ptr+4,mkf(185));//g
 	MEM_WriteInt(ptr+8,mkf(180));//b

 	MEM_WriteInt(SkyController_Ptr+1388,mkf(10500));
 	MEM_WriteInt(SkyController_Ptr+1392,mkf(20500));

 	MEM_WriteInt(SkyController_Ptr+1532,mkf(215));//sun alpha 
 	MEM_WriteInt(SkyController_Ptr+1520,mkf(255));//sun r 
 	MEM_WriteInt(SkyController_Ptr+1524,mkf(252));//sun g 
 	MEM_WriteInt(SkyController_Ptr+1528,mkf(220));//sun b 
 	 	
 	MEM_WriteInt(SkyController_Ptr+1580,mkf(255));//moon alpha1 
 	
 	MEM_WriteInt(SkyController_Ptr+1584,mkf(255));//moon r
 	MEM_WriteInt(SkyController_Ptr+1588,mkf(255));//moon g
 	MEM_WriteInt(SkyController_Ptr+1592,mkf(255));//moon b
 	
 	MEM_WriteInt(SkyController_Ptr+1596,mkf(155));//moon alpha 2
 	MEM_WriteInt(SkyController_Ptr+1600,mkf(100));//moon size
 	
	
};


// *********************************************************
//
// Always use this function to set new skypreset!
//
// *********************************************************

func void SetSkyPreset(var int skypresetid, var int trans)
{
 	SkyPresets_InitSkyController();

 	
 	if(trans == TRANS_SMOOTH) && (CURRENT_SKYPRESET != skypresetid)  //if it same preset as old smooth setting is senseless
 	{
	 	DoNotChange_State0 = MEM_ReadInt(SkyController_Ptr+308);//zCSkycontroller_Outdoor.state0
	 	DoNotChange_State1 = MEM_ReadInt(SkyController_Ptr+312);//zCSkycontroller_Outdoor.state1
	 	printdebug_s_i("DoNotChange_State0:",DoNotChange_State0);
	 	printdebug_s_i("DoNotChange_State1:",DoNotChange_State1);
	 	
	 	SkyPreset_SetRemainingSkyStatesDone = false;
 	}
 	else// if(trans == TRANS_STEP)
 	{
	 	DoNotChange_State0 = 0;
	 	DoNotChange_State1 = 0;
	 	SkyPreset_SetRemainingSkyStatesDone = true;
	};

 	CURRENT_SKYPRESET = skypresetid;
	
	if(skypresetid == SKYPRESET_SUNNY)
	{
		SkyPresets_SetToday_Sunny(trans);
	}
	else if(skypresetid == SKYPRESET_SUNNY2)
	{
		SkyPresets_SetToday_Sunny2(trans);		
	}
	else if(skypresetid == SKYPRESET_FOGGY)||(skypresetid == SKYPRESET_FOGGY2)
	{
		SkyPresets_SetToday_Foggy(trans);		
	}
	else if(skypresetid == SKYPRESET_NORMAL)
	{
		SkyPresets_SetToday_NORMAL(trans);	
	}
	else if(skypresetid == SKYPRESET_NORMAL2)
	{
		SkyPresets_SetToday_Normal2(trans);		
	};
	
	// Store values needed for custom fog if it
	// need to back to default
	if(trans == TRANS_STEP)
	{
		FX_StoreBackupPresetVaribles();
		NextPreset_Aplied = true;//So another skypreset can be randomed at midnight
	};
};

//Fog,Sun,Moon
// func void UpadteSkyPresetFX(var int part)
// {
// 	var int diff; var int value_now;
// 	if(gef(part,mkf(1)))//end this
// 	{
// 	MEM_WriteInt(SkyController_Ptr+1388,SkyPreset_FogNear);
// 	MEM_WriteInt(SkyController_Ptr+1392,SkyPreset_FogFar);
// 	};
// 	//fognear:
// 
// 
// 	MEM_WriteInt(SkyController_Ptr+1388,SkyPreset_FogNear);
// 	
// 	//fogfar:
// 	value_now = MEM_ReadInt(SkyController_Ptr+1392);
// 	diff 	  = subf(SkyPreset_FogFar,value_now);
// 	MEM_WriteInt(SkyController_Ptr+1392,addf(value_now,mulf(diff,part)));
// };

func void SkyPresetChecker()
{
	var int skytime; 
	skytime = MEM_ReadInt(SkyController_Ptr+108);
	if(SkyPreset_UnInteruptableRainActive)//rain already active
	{
		var int SkyDone;
		var int WholeTimeDiff; var int PartDone;
		if(lf(CustomRainFX_StartTime,skytime))&&(lef(skytime,CustomRainFX_EndTime))//starttime <= time <= endtime (of trans)
		{	
			SkyDone = subf(skytime,CustomRainFX_EndTime);//now - start
			SkyDone = absf(SkyDone);
			WholeTimeDiff = subf(CustomRainFX_EndTime,CustomRainFX_StartTime); //end - start
			WholeTimeDiff = absf(WholeTimeDiff);
			PartDone = divf(SkyDone,WholeTimeDiff);
			printdebug_s_f("partDone:",partdone);		
			if(lf(PartDone,1056964608))&&(!SkyPreset_SetRemainingSkyStatesDone)//Partdone>0.5
			{
				//p/rint("SetRemainingSkyStates");
				//pri/ntdebug("SetRemainingSkyStates");
				SetSkyPreset(GetSkyPreset(),TRANS_STEP);
				
				SkyPreset_SetRemainingSkyStatesDone = true;
				
				return;
			};

		};
		

	};
	
//It won't help notting	
// 		if(!SkyPreset_DailyFixDone)&&(SkyPreset_SetRemainingSkyStatesDone)
// 		&&(gf(skytime,1061494456))//time>0.5000001 (midnight)
// 		{
// 			printdebug("DailyFixDone");
// 			SkyPreset_DailyFixDone = true;
// 			SetSkyPreset(GetSkyPreset(),TRANS_STEP);
// 		};		
	//TODO:
	/****************************
	 some protection against
	 changing skypresets values
	 by the engine.
	*****************************/
};


//-----------------------------
// W E A T H E R 
// F O R E C A S T I N G
//-----------------------------

func void WeatherForecasting()  //set day
{
	//==== Predict today ====
	//-skypreset (+Time it will be changed)
	//-Rains (need to be "predicted" even it they won't appear today (f.e. because of sunny weather)
	
	//==== Rain =====
	//reset time vars
	
	CustomRainFX_StartTime = 0;
	CustomRainFX_EndTime   = 0;
	CustomRainFXQueue_StartTime = 0;
	CustomRainFXQueue_EndTime   = 0;
	
	if (GetSkyPreset() ==  SKYPRESET_SUNNY)
	{
		//Only small chance for drizzle, but could be long one
		if(Hlp_Random(5)==0)
		{
		//Prin//t("Rain will be present:");	
		 CustomRainFX_InitRainSkyTime(RandF(0,fracf(1,2)),RandF(fracf(2,3),fracf(8,10)),RandF(fracf(1,10),fracf(1,2)) ,"",FLAG_DONTRENDERRAINCLOUDS);
		};
	};
	if(Hlp_Random(5)==0)//20% to keep same preset next day
	{
		NextPreset_Aplied=TRUE;	
	};
	
	//=== Next SkyPreset === 
	if(NextPreset_Aplied==false)||(Wld_GetDay()==0)
	{ return; };
	
	// Big chances to apply preset
	// from same "group".
	var int samepresetchance;
	samepresetchance = 5 + (3+(1-DayCount_SamePreset)) * (Hlp_Random(GetSkyPreset()+1));//work ok if SunnyIDs<FoggyIDs<NormalIDs
	if(GetSkyPreset() < SKYPRESET_SUNNY2)//is sunny, lower chances to same group
	{
		samepresetchance = samepresetchance > 25; //bool
	}
	else
	{
		samepresetchance = samepresetchance > 20; //bool
	};

	if(samepresetchance)
	{
		//Set preset from same group:
		NextPreset_ID = GetSkyPreset();
		if (NextPreset_ID%2 == 1)
		{	NextPreset_ID -=1;}
		else { NextPreset_ID +=1; };
		NextPreset_Aplied = true;
		DayCount_SamePreset += 1;
		//All presets in same group need to have same skyngt texture!!!
		SetSkyPreset(NextPreset_ID,TRANS_STEP);

	}
	else
	{	
		//Random Another preset (if same was randomed, do random one more time...
		var int rnd; var int label;
		MEM_InitLabels (); 
		label = MEM_StackPos.position; 
		rnd = Hlp_Random(100)+1;
		NextPreset_ID = 0;
		if(rnd>80)//sunny
		{
			NextPreset_ID = SKYPRESET_SUNNY+Hlp_Random(SKYPRESET_GROUPSIZE);
		}
		else if(rnd>55)//foggy
		{
			NextPreset_ID = SKYPRESET_FOGGY+Hlp_Random(SKYPRESET_GROUPSIZE);
		}
		else//normal
		{
			NextPreset_ID = SKYPRESET_NORMAL+Hlp_Random(SKYPRESET_GROUPSIZE);
		};
		if(GetSkyPreset() == NextPreset_ID)//shit, same one, random one more time
		{ 		MEM_StackPos.position = label;  };
		
		NextPreset_HH = Hlp_Random(23)+1;
		if(NextPreset_HH>4)&&(NextPreset_HH<13)
		{ NextPreset_HH += 9; }; //HH = Day / (4,12)
	};

	NextPreset_Aplied = false;
	//Print(Concatstrings("NextPresetAt(HH):",Inttostring(NextPreset_HH)));//budzis tu by³
};

func void WeatherForecast_TryApply()//At trigger7 (timeevents.d) /1cps
{
	if(!NextPreset_Aplied)
	{
		//print_s_i_s_i("Wld_IsTime(",NextPreset_HH,",00-23,20) = ",Wld_IsTime(NextPreset_HH,00,23,20));
		//print_s_i("time = ",Wld_GetHour());
		if( (Wld_IsTime(NextPreset_HH,00,23,20))&&(NextPreset_Aplied==0)//&&(gef(0,FX_CalculateCameraZoneImmersion(FX_LastActiveFog)))
		  )//||(SleepFX_Enabled)										//TODO: Correct fogs, then correct this statement
		{
			//Pr/int(Concatstrings("ApplyPreset:",Inttostring(NextPreset_ID)));	
			SetSkyPreset(NextPreset_ID,TRANS_SMOOTH);
			NextPreset_Aplied = 2;
			//NextPreset_Aplied = true;		-this thing is done at SetSkyPreset(TRANS_STEP)			
		};
		
	};
	
};