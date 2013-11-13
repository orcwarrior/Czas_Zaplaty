INSTANCE DB_AURA	(CFx_Base_Proto)
{
		visname_S 			= "PFX_DB_AURA";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		sendAssessMagic		= 1;
		emTrjOriginNode 	= "BIP01";
		emtrjdynupdatedelay = 0.1;
		emFXLifeSpan    =	999;	
		emtrjloopmode_s = "NONE";
		emtrjeasefunc_s = "LINEAR";
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emadjustshptoorigin = 1;//1	
		lightPresetname   		= "FIRE";			
};

INSTANCE LH_TRAIL	(CFx_Base)
{
	visName_S				= "P_WEAPONTRAIL";
	emTrjOriginNode			= "ZS_LEFTHAND";
	emTrjTargetNode			= "ZS_LEFTHAND";
	emTrjTargetRange		= 0;
	emTrjTargetAzi			= 0;
	emTrjTargetElev			= 0;
	emTrjNumKeys			= 1;
	emTrjNumKeysVar			= 0;
	emTrjAngleElevVar		= 0;
	emTrjAngleHeadVar		= 0;
	emTrjKeyDistVar			= 0;
	emTrjEaseVel			= 1000;
	emTrjDynUpdateTargetOnly= 0;
	emActionCollDyn_S		= "";		
	emActionCollStat_S		= "";		
	emFXCollStat_S			= "";
	emFXCollDyn_S			= "";
	emFXCollStatAlign_S		= "";		
	emFXCollDynAlign_S		= "";
	emCheckCollision		= 0;
	emInvestNextKeyDuration	= 1;
	emFlyGravity			= 0;
	emSelfRotVel_S			= "0 0 0";
	lightPresetName			= "";
	sfxID					= "";
	sendAssessMagic			= 0;
	secsPerDamage			= -1;	
	
  	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";     
	emtrjloopmode_s = "LINEAR";  
	emtrjeasefunc_s = "LINEAR";
	emFXCreatedOwnTrj 	= 1;	
	emFXTriggerDelay	= 0.02;
	emfxlifespan = 1;	
 	emadjustshptoorigin = 1;//1	
	emTrjDynUpdateDelay		= 10;	
	//emFXCreate_S	= "BugfixFX";
	
};
		INSTANCE LH_TRAIL_KEY_OPEN	(C_ParticleFXEmitKey)
		{
				pfx_lspPartAvg = 2;
		};
INSTANCE spellFX_FireGolemSpawn	(CFx_Base_Proto)
{
		visname_S 			= "INVOCATION_RED";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01";
		lightpresetname		= "REDAMBIENCE";
    	sfxid				= "MFX_Firerain_INVEST";
		//emFXCreate_S			= "FX_EarthQuake";
    	
     	sfxisambient		= 1;
};

INSTANCE spellFX_Mis_TransZombie	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_STUNINGBALL_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "COLLIDE CREATEONCE";
     	emFXCollDyn_S	   		= "spellFX_StuningBall_COLLIDEFX";
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20;
				
		lightPresetname   		= "AURA";
		
		// quadmark
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "40 40";
		userString[2]			= "MUL";
				
		
		};

		INSTANCE spellFX_Mis_TransZombiel_KEY_OPEN	(C_ParticleFXEmitKey)
		{
				lightrange = 0.0001;
		};
		
		INSTANCE spellFX_Mis_TransZombie_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_StuningBall_INIT";
				lightrange = 0.0001;
		};
		
		INSTANCE spellFX_Mis_TransZombie_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "mfx_StuningBall_cast";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "MFX_STUNINGBALL_Cast";
	 			lightrange 				= 200;
	 			emCheckCollision 		= 1;
	 			
		};

		INSTANCE spellFX_Mis_TransZombie_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	visname_S 				= "";		
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
	 			sfxid					= "MFX_STUNINGBALL_Collide";
};


INSTANCE spellFX_Mis_tritera_Adanos_Curse	(CFx_Base_Proto)
{
		visname_S 			= "PFX_MIS_TRI_ADANOS_CURSE";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		sendAssessMagic		= 1;
		emAdjustShpToOrigin = 1;
		sfxid				= "MFX_Icecube_Target";
		emFXLifeSpan    =	5;	
		
		
};
INSTANCE spellFX_Mis_tritera_Adanos_I(CFx_Base_Proto)
{
		visname_S 				= "PFX_MIS_TRI_ADANOS_INIT";		
		emTrjOriginNode 		= "Bip01";
		emFXLifeSpan    =	10;	
		
};
INSTANCE spellFX_Mis_tritera_Innos_I(CFx_Base_Proto)
{
		visname_S 				= "PFX_MIS_TRI_INNOS_INIT";		
		emTrjOriginNode 		= "Bip01";
		emFXLifeSpan    =	10;	
		
};
INSTANCE spellFX_Mis_tritera_Beliar_I(CFx_Base_Proto)
{
		visname_S 				= "PFX_MIS_TRI_BELIAR_INIT";		
		emTrjOriginNode 		= "Bip01";
		emFXLifeSpan    =	10;	
		
};

INSTANCE KATRAKANAT_WHITE_BLEND(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "0.5";
	userString[1]	=	"255 255 255 20";
	userString[2]	=	"0.5";
	visAlphaBlendFunc_S = "ADD";
	emFXLifeSpan    =	0.5;	
};
INSTANCE spellFX_KatrakanatPiece(CFx_Base_Proto)
{
				visName_S		= "KATRAKANAT_PIECE_FIRE";
				sfxid			= "Torch_Enlight";
				sfxisambient	= 1;
				emTrjOriginNode 		= "Bip01";
				emFXLifeSpan    =	15;	
		lightPresetName 		= "FIRESMALL";
								
};
INSTANCE spellFX_Katrakanat_Hero	(CFx_Base_Proto)
{
		visname_S 				= "RITUAL_KATRAKANAT_PFX_CIRCLE_HERO";		
		emTrjOriginNode 		= "Bip01";
		emFXLifeSpan    =	21;	
		
};
INSTANCE spellFX_KATRAKANAT_MAGE_HAND	(CFx_Base_Proto)
{
		visname_S 				= "KATRAKANAT_MAGE_HAND";		
		emTrjOriginNode 		= "ZS_LEFTHAND";
		emFXLifeSpan    =	8;	
		
};
INSTANCE spellFX_KATRAKANAT_MAGE_INCOVATION	(CFx_Base_Proto)
{
		visname_S 			= "INVOCATION_WHITE_TO_BRIGHT_BLUE";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01";
		lightpresetname		= "WHITEBLEND";
    	sfxid				= "MFX_Firerain_INVEST";
		emFXCreate_S			= "FX_EarthQuake";
    	
     	sfxisambient		= 1;
};
INSTANCE spellFX_KATRAKANAT_DEMON_SPAWN	(CFx_Base_Proto)
{
		visname_S 			= "INVOCATION_BLACK";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01";
		lightpresetname		= "WHITEBLEND";
    	sfxid				= "MFX_Firerain_INVEST";
		//emFXCreate_S			= "FX_EarthQuake";
    	
     	sfxisambient		= 1;
};
INSTANCE spellFX_Katrakanat_Statue	(CFx_Base_Proto)
{
		visname_S 				= "RITUAL_KATRAKANAT_PFX_ALTAR";
		lightPresetName 		= "REDAMBIENCE";
		sfxid					= "MFX_Firerain_INVEST";
		sfxisambient			= 1;
		emFXCreate_S			= "FX_EarthQuake";
		emFXLifeSpan    =	25;			
};
INSTANCE AuraFx_01	(CFx_Base_Proto)
{

		visname_S 		= "TEST_AURA";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emselfrotvel_s = "0 0 0";
		emFXLifeSpan   = 1;
		emtrjdynupdatedelay 	= 0.01;

};
INSTANCE V_MR_INSERT_PRE	(CFx_Base_Proto)
{
		visname_S 				= "MR_INSERT_PRE";
		lightPresetName 		= "REDAMBIENCE";
		emFXLifeSpan    =	25;			
};
INSTANCE V_MR_INSERT_BOOM	(CFx_Base_Proto)
{
		visname_S 				= "MR_INSERT_BOOM";
		lightPresetName 		= "REDAMBIENCE";
		emFXLifeSpan    =	25;			
};
INSTANCE V_MR_INSERT_LOOP	(CFx_Base_Proto)
{
		visname_S 				= "MR_INSERT_LOOP";
		lightPresetName 		= "REDAMBIENCE";
};

//STATUES
instance RED_EYE_L	(CFx_Base_Proto)
{
		visname_S 		= "RED_EYE_L";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01 HEAD";
		emtrjdynupdatedelay 	= 0.1;
	
		//sendAssessMagic	= 1;
};
instance RED_EYE_R	(CFx_Base_Proto)
{
		visname_S 		= "RED_EYE_R";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01 HEAD";
		emtrjdynupdatedelay 	= 0.1;
	
		//sendAssessMagic	= 1;
};
instance RED_FACE	(CFx_Base_Proto)
{
		visname_S 		= "RED_FACE";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01 HEAD";
		emtrjdynupdatedelay 	= 0.1;
	
		//sendAssessMagic	= 1;
};

INSTANCE DarkMage_STOPLAVA		(CFx_Base_Proto)
{
		visname_S 				= "MFX_MassDeath_CAST";		
		emTrjOriginNode 		= "BIP01 R Foot";
		emActionCollDyn_S		= "CREATEONCE";
     	emFXCollDyn_S			= "";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     	emCheckCollision		= 1;
     	LightPresetName			= "REDAMBIENCE";
     	sfxid					= "MFX_Massdeath_Cast";
		sfxisambient			= 1;
};
INSTANCE DarkMage_STOPLAVA_BLEND(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "5";
	userString[1]	=	"0 0 0 20";
	userString[2]	=	"1";
	visAlphaBlendFunc_S = "BLEND";
	emFXLifeSpan    =	5;	
};
INSTANCE LAVA_BLEND(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "30";
	userString[1]	=	"255 140 0 190";
	userString[2]	=	"3";
	emFXLifeSpan    =	5;
};
INSTANCE DREAM_BLEND2(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "25";
 	visAlpha			= 0.9;		
	userString[1]	=	"255 255 255 20";
	userString[2]	=	"1";
	visAlphaBlendFunc_S = "BLEND";
	emFXLifeSpan    =	-1;	
};
INSTANCE DREAM_BLEND(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "10";
	userString[1]	=	"250 250 255 0.5";
	userString[2]	=	"15";
	visAlphaBlendFunc_S = "BLEND";
	
	/*
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "10";
	userString[1]	=	"0 0 0 20";
	userString[2]	=	"3";
	visAlphaBlendFunc_S = "ADD";
	emFXLifeSpan    =	10;	
	//storm
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "10";
	userString[1]	=	"0 0 0 120";
	userString[2]	=	"3";
	visAlphaBlendFunc_S = "BLEND";
	emFXLifeSpan    =	10;
	//sleep
 	visName_S      		= "screenblend.scx";
 	userString[0]     	= "100000000000";
 	userString[1]     	= "0 0 0 255";
 	userString[2]     	= "0";
 	visAlphaBlendFunc_S = "BLEND";
 	///joint
 		emFXTriggerDelay	= 6;						// achtung, zeitdauer ist hier skaliert mit dem time scaler
	emFXLifeSpan    	= 30;						// achtung, zeitdauer ist hier skaliert mit dem time scaler
 	visName_S      		= "morph.fov";
 	userString[0]     	= "0.8";
 	userString[1]     	= "1.0";
 	userString[2]		= "120";
 	userString[3]		= "90";
 	//slowmotion
 	 visName_S      		= "time.slw";
 	userString[0]     	= "0.5";
 	userString[1]     	= "1.0";
 	emFxCreate_s		= "FOV_MORPH2";
	emFXLifeSpan    	= 15;						// achtung, zeitdauer ist hier skaliert mit dem time scaler
	emFXTriggerDelay	= 3;						// achtung, zeitdauer ist hier skaliert mit dem time scaler
	*/
};

INSTANCE FX_Spawn_Katrakanat		(CFx_Base_Proto)
{
		visname_S 				= "MFX_MassDeath_CAST";		
		emTrjOriginNode 		= "BIP01 R Foot";
		emActionCollDyn_S		= "CREATEONCE";
     	emFXCollDyn_S			= "spellFX_MassDeath_Target";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     	LightPresetName			= "REDAMBIENCE";
     	sfxid					= "MFX_Massdeath_Cast";
		sfxisambient			= 1;
};
/*
INSTANCE DEMENTOR_FX(CFx_Base_Proto)
{
// userstring 0: screenblend loop duration
// userstring 1: screenblend color
// userstring 2: screenblend in/out duration
// userstring 3: screenblend texture
// userstring 4: tex ani fps
visName_S = "screenblend.scx";
emfxcreate_s = "FOV_MORPH1";
userString[0] = "100000000000";
userString[1] = "0 0 0 100";
userString[2] = "0.5";
userString[3] = "ScreenFX_Dem_a0";
userString[4] = "8";
visAlphaBlendFunc_S = "BLEND";
sfxid = "Dementhor_Talk";
sfxisambient = 1;

}; 


INSTANCE SPELLFX_nachtsicht (CFX_BASE_PROTO)
{

// userstring 0: screenblend loop duration
// userstring 1: screenblend color
// userstring 2: screenblend in/out duration
// userstring 3: screenblend texture
// userstring 4: tex ani fps
visName_S = "screenblend.scx";
emfxcreate_s = "FOV_MORPH1";
userString[0] = "100000000000";
userString[1] = "0 0 0 100";
userString[2] = "0.5";
userString[3] = "ScreenFX_Dem_a0";
userString[4] = "8";
visAlphaBlendFunc_S = "BLEND";
sfxid = "Dementhor_Talk";
sfxisambient = 1;
lightpresetname = "JUSTRED";
//emselfrotvel_s = "0 0 50";
//lightpresetname = "JUSTRED";
//lightrange = 3500;

};
INSTANCE CONTROL_CASTBLEND(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "0.5";
	userString[1]	=	"255 255 255 255";
	userString[2]	=	"0.5";
	emFXLifeSpan    =	0.6;
}; */
//******************************
//  FIRE SWD AURA
//******************************
//1H
//1H
//1H
//1H
//1H
//1H
INSTANCE ItemFX_FireAura1HEquip	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_1HSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 10;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	lightPresetname   		= "FIRESMALLSWD";	
	
};	
INSTANCE ItemFX_FireAura1H_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_1HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	
	emTrjTargetNode			= "";
	emTrjTargetRange		= 0;
	emTrjTargetAzi			= 0;
	emTrjTargetElev			= 0;
	emTrjNumKeys			= 0;
	emTrjNumKeysVar			= 0;
	emTrjAngleElevVar		= 0;
	emTrjAngleHeadVar		= 0;
	emTrjKeyDistVar			= 0;
	emTrjDynUpdateTargetOnly= 0;
	emCheckCollision		= 0;
	emInvestNextKeyDuration		= 0;
	emFlyGravity			= 0;
	emFXCreatedOwnTrj 	= 1;	
};		
INSTANCE ItemFX_FireAura1H_3_Equip	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_1HSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 10;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	
	emTrjTargetNode			= "";
	emTrjTargetRange		= 0;
	emTrjTargetAzi			= 0;
	emTrjTargetElev			= 0;
	emTrjNumKeys			= 0;
	emTrjNumKeysVar			= 0;
	emTrjAngleElevVar		= 0;
	emTrjAngleHeadVar		= 0;
	emTrjKeyDistVar			= 0;
	emTrjDynUpdateTargetOnly= 0;
	emCheckCollision		= 0;
	emInvestNextKeyDuration	= 0;
	emFlyGravity			= 0;
	emFXCreatedOwnTrj 		= 1;	
};
INSTANCE ItemFX_FireAura1H_4_Equip	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_1HSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	
	emTrjTargetNode			= "";
	emTrjTargetRange		= 0;
	emTrjTargetAzi			= 0;
	emTrjTargetElev			= 0;
	emTrjNumKeys			= 0;
	emTrjNumKeysVar			= 0;
	emTrjAngleElevVar		= 0;
	emTrjAngleHeadVar		= 0;
	emTrjKeyDistVar			= 0;
	emTrjDynUpdateTargetOnly= 0;
	emCheckCollision		= 0;
	emInvestNextKeyDuration		= 0;
	emFlyGravity			= 0;
	emFXCreatedOwnTrj 	= 1;	

};
INSTANCE ItemFX_FireAura1HReady	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_1HSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
		lightPresetname   		= "FIRESMALLSWD";	
};	
INSTANCE ItemFX_FireAura1H_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_1HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};	
INSTANCE ItemFX_FireAura1H_3_Ready	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_1HSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};	
INSTANCE ItemFX_FireAura1H_4_Ready	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_1HSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};	
//2H
//2H
//2H
//2H
//2H
//2H
INSTANCE ItemFX_FireAura2HEquip	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_2HSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 0.99;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	lightPresetname   		= "FIRESMALLSWD";	
};	
INSTANCE ItemFX_FireAura2H_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_2HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};		
INSTANCE ItemFX_FireAura2H_3_Equip	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_2HSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_FireAura2H_4_Equip	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_2HSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_FireAura2HReady	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_2HSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 0.99;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
		lightPresetname   		= "FIRESMALLSWD";	
};	
INSTANCE ItemFX_FireAura2H_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_2HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};	
INSTANCE ItemFX_FireAura2H_3_Ready	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_2HSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};	
INSTANCE ItemFX_FireAura2H_4_Ready	(CFx_Base_Proto)
{

    visname_S 				= "FIRERUNE_2HSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};	
////////////////////////////////
//  W A T E R   A U R A
////////////////////////////////
//2h
//2h
//2h

INSTANCE ItemFX_WaterAura2HReady	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_2HSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WaterAura2H_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_2HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WaterAura2H_3_Ready	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_2HSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	lightPresetname   		= "AURASWD";	
};
INSTANCE ItemFX_WaterAura2H_4_Ready	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_2HSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};

INSTANCE ItemFX_WaterAura2HEquip	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_2HSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WaterAura2H_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_2HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WaterAura2H_3_Equip	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_2HSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	lightPresetname   		= "AURASWD";	
};
INSTANCE ItemFX_WaterAura2H_4_Equip	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_2HSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
//1h
//1h
//1h

INSTANCE ItemFX_WaterAura1hReady	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_1hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WaterAura1h_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_1hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WaterAura1h_3_Ready	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_1hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WaterAura1h_4_Ready	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_1hSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	lightPresetname   		= "AURASWD";	
};

INSTANCE ItemFX_WaterAura1hEquip	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_1hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	lightPresetname   		= "AURASWD";	
};
INSTANCE ItemFX_WaterAura1h_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_1hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WaterAura1h_3_Equip	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_1hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WaterAura1h_4_Equip	(CFx_Base_Proto)
{

    visname_S 				= "WATERRUNE_1hSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
////////////////////////////////
// L I G H T  S W D
////////////////////////////////
//2h
//2h
//2h
INSTANCE ItemFX_LightAura2hEquip	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_2hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	lightPresetname   		= "LIGHTSWD";	
};
INSTANCE ItemFX_LightAura2h_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_2hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_LightAura2h_3_Equip	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_2hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_LightAura2hReady	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_2hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	lightPresetname   		= "LIGHTSWD";	
};
INSTANCE ItemFX_LightAura2h_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_2hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_LightAura2h_3_Ready	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_2hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
//1h
//1h
//1h
INSTANCE ItemFX_LightAura1hEquip	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_1hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	lightPresetname   		= "LIGHTSWD";	
};
INSTANCE ItemFX_LightAura1h_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_1hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_LightAura1h_3_Equip	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_1hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_LightAura1hReady	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_1hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	lightPresetname   		= "LIGHTSWD";	
};
INSTANCE ItemFX_LightAura1h_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_1hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_LightAura1h_3_Ready	(CFx_Base_Proto)
{

    visname_S 				= "LIGHTRUNE_1hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
////////////////////////////////
// W I N D  S W D
////////////////////////////////
//2h
//2h
//2h
INSTANCE ItemFX_WINDAura2hEquip	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_2hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "GREENSWD";	
};
INSTANCE ItemFX_WINDAura2h_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_2hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WINDAura2h_3_Equip	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_2hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WINDAura2hReady	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_2hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "GREENSWD";	
};
INSTANCE ItemFX_WINDAura2h_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_2hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WINDAura2h_3_Ready	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_2hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
//1h
//1h
//1h
INSTANCE ItemFX_WINDAura1hEquip	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_1hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "GREENSWD";	
};
INSTANCE ItemFX_WINDAura1h_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_1hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WINDAura1h_3_Equip	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_1hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WINDAura1hReady	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_1hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "GREENSWD";	
};

INSTANCE ItemFX_WINDAura1h_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_1hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_WINDAura1h_3_Ready	(CFx_Base_Proto)
{

    visname_S 				= "WINDRUNE_1hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
////////////////////////////////
// P S I O N I C  S W D
////////////////////////////////
//2h
//2h
//2h
INSTANCE ItemFX_PSIAura2hEquip	(CFx_Base_Proto)
{

    visname_S 				= "PSIRUNE_2HSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "GREENSWD";	
};
INSTANCE ItemFX_PSIAura2h_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "PSIRUNE_2HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_PSIAura2hReady	(CFx_Base_Proto)
{

    visname_S 				= "PSIRUNE_2HSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "GREENSWD";	
};
INSTANCE ItemFX_PSIAura2h_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "PSIRUNE_2HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
//1H
//1H
//1H
INSTANCE ItemFX_PSIAura1HEquip	(CFx_Base_Proto)
{

    visname_S 				= "PSIRUNE_1HSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "GREENSWD";	
};
INSTANCE ItemFX_PSIAura1H_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "PSIRUNE_1HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_PSIAura1HReady	(CFx_Base_Proto)
{

    visname_S 				= "PSIRUNE_1HSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "GREENSWD";	
};
INSTANCE ItemFX_PSIAura1H_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "PSIRUNE_1HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
////////////////////////////////
// H E A L I N G  S W D
////////////////////////////////
//2h
//2h
//2h
INSTANCE ItemFX_HEALAura2hEquip	(CFx_Base_Proto)
{

    visname_S 				= "HEALRUNE_2hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "AURASWD";	
};
INSTANCE ItemFX_HEALAura2hReady	(CFx_Base_Proto)
{

    visname_S 				= "HEALRUNE_2hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "AURASWD";	
};
//1h
//1h
//1h
INSTANCE ItemFX_HEALAura1hEquip	(CFx_Base_Proto)
{

    visname_S 				= "HEALRUNE_1hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "AURASWD";	
};
INSTANCE ItemFX_HEALAura1hReady	(CFx_Base_Proto)
{

    visname_S 				= "HEALRUNE_1hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "AURASWD";	
};
instance RuneSwd_Hero_HealAura	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "MFX_Hero_HealAura";
		emTrjOriginNode 	= "BIP01";
		visAlpha			= 1;
	    emFXCreate_S	 	= "RuneSwd_Hero_HealAura_START";
		emfxlifespan = 1;	    
		emtrjmode_s 		= "FIXED";
};
instance RuneSwd_Hero_HealAura_START		(CFx_Base_Proto)			// HEAL START wird im 1. Invest-Key getriggert. Säule aus dem Boden.
{
		visname_S 			= "MFX_Hero_HealAura_START";
		//sfxID			  	= "RuneFX_Heal_CAST";
		//sfxisambient		= 1;
		emfxlifespan = 1;		
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 R FOOT";
};
////////////////////////////////
// D A R K  S W D
////////////////////////////////
//2h
//2h
//2h
INSTANCE ItemFX_DARKAura2hReady	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_2hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "DARKSWD";	
};
INSTANCE ItemFX_DARKAura2h_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_2HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_DARKAura2h_3_Ready	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_2HSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_DARKAura2h_4_Ready	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_2HSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_DARKAura2hEquip	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_2hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "DARKSWD";	
};
INSTANCE ItemFX_DARKAura2h_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_2HSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_DARKAura2h_3_Equip	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_2HSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_DARKAura2h_4_Equip	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_2HSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_LONGSWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
//1h
//1h
//1h
INSTANCE ItemFX_DARKAura1hReady	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_1hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "DARKSWD";	
};
INSTANCE ItemFX_DARKAura1h_2_Ready	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_1hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_DARKAura1h_3_Ready	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_1hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_DARKAura1h_4_Ready	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_1hSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_DARKAura1hEquip	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_1hSWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "DARKSWD";	
};
INSTANCE ItemFX_DARKAura1h_2_Equip	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_1hSWORD_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_DARKAura1h_3_Equip	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_1hSWORD_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE ItemFX_DARKAura1h_4_Equip	(CFx_Base_Proto)
{

    visname_S 				= "DARKRUNE_1hSWORD_4";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_SWORD";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
//******************************
//  SWAMP FOG
//******************************
INSTANCE VFX_Swamp_Fog	(CFx_Base_Proto)
{
    visname_S 				= "Swamp_Fog";
	visalpha = 1;
	visalphablendfunc_s = "NONE";
	emtrjmode_s = "FIXED";
	emTrjOriginNode 		= "BIP01";	
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 1.01;
	emfxlifespan = 1.02;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 0;//1	
};	

//******************************
//  MAGIC SWORD
//******************************
INSTANCE ItemFX_Aura	(CFx_Base_Proto)
{

     visname_S 				= "MAGIC_SWORD";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.02;
	emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1
	
				
		lightPresetname   		= "AURASWD";	
};		
		INSTANCE ItemFX_Aura_OPEN (C_ParticleFXEmitKey)
		{
			visName_S 				= "MAGIC_SWORD";
			pfx_ppsValue = 0.05;
			pfx_scTime = 1;
			lightrange		= 100;
		};

INSTANCE itemFX_DAM	(CFx_Base_Proto)
{

     	visname_S 				= "MAGIC_SWORD_DAM_COLIDE";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "COLLIDE CREATEONCE";
     	emFXCollStat_S	   		= "spellFX_Firebolt_COLLIDEFX";
     	emFXCollDyn_S	   		= "spellFX_Firebolt_SENDPERCEPTION";
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		emfxlifespan = 0.9;		
				
		lightPresetname   		= "AURASWD";	
};

INSTANCE itemFX_DAM_2	(CFx_Base_Proto)
{

     	visname_S 				= "MAGIC_SWORD_DAM_COLIDE_2";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "COLLIDE CREATEONCE";
     	emFXCollStat_S	   		= "spellFX_Firebolt_COLLIDEFX";
     	emFXCollDyn_S	   		= "spellFX_Firebolt_SENDPERCEPTION";
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		emfxlifespan = 1;		
				
		lightPresetname   		= "AURASWD";	
};

INSTANCE itemFX_DAM_ICE	(CFx_Base_Proto)
{

     	visname_S 				= "MAGIC_SWORD_DAM_COLIDE_ICE";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "COLLIDE CREATEONCE";
     	emFXCollStat_S	   		= "spellFX_Firebolt_COLLIDEFX";
     	emFXCollDyn_S	   		= "spellFX_Firebolt_SENDPERCEPTION";
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		emfxlifespan = 1;		
				
		lightPresetname   		= "AURASWD";	
};
// *****************************
// 	R U N E   S W D   D M G
// *****************************



INSTANCE spellFX_INVISIBLEDMG_Fireball(CFx_Base_Proto)
{

     	visname_S 				= "MFX_INVISIBLEDMG_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01 HEAD";
     	emtrjtargetnode 		= "BIP01";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		//emFXCollStat_S	   		= "spellFX_Fireball_COLLIDE";
		emFXCollDyn_S     		= "spellFX_INVISIBLEDMG_Fireball_SENDPERCEPTION";
		emFXCollStatAlign_S		= "COLLISIONNORMAL";
		emFXCreatedOwnTrj 		= 0; 
		emTrjTargetRange	 	= 0;
		emTrjTargetElev 		= 0;

		emTrjDynUpdateDelay		= 20000;
		userString[0]			= "";
		userString[1]			= "1 1";
		//userString[2]			= "MUL";
		lightPresetname   		= "";	


		};
		
		INSTANCE spellFX_INVISIBLEDMG_fireball_KEY_OPEN (C_ParticleFXEmitKey)
		{
				//lightrange		= 0.01;
		};
		

		INSTANCE spellFX_INVISIBLEDMG_fireball_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_INVISIBLEDMG_INIT";
				//lightrange		= 0.01;
		};
		
		INSTANCE spellFX_INVISIBLEDMG_FireBall_KEY_CAST (C_ParticleFXEmitKey)
		{
				lightrange				= 0;
				visname_S 				= "MFX_INVISIBLEDMG_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 12400.;
	 			//sfxid					= "MFX_Fireball_Cast";
	 			//sfxisambient			= 1;
	 			emCheckCollision 		= 1;
	 			
		};
		INSTANCE spellFX_INVISIBLEDMG_FireBall_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
};
instance spellFX_INVISIBLEDMG_Fireball_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_INVISIBLEDMG_COLLIDE1";
		visAlpha			= 1;
		emTrjOriginNode		= "BIP01";
		emtrjmode_s 		= "FIXED";
};
// *****************************
// 			S L E E P E R
// *****************************



INSTANCE spellFX_SLEEPER_Fireball(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Fireball_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01 JAWS";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Fireball_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Fireball_SENDPERCEPTION";
		emFXCollStatAlign_S		= "COLLISIONNORMAL";
		emFXCreatedOwnTrj 		= 0; 
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "100 100";
		userString[2]			= "MUL";
		lightPresetname   		= "FIRESMALL";	
		
		};
		
		INSTANCE spellFX_SLEEPER_fireball_KEY_OPEN (C_ParticleFXEmitKey)
		{
				lightrange		= 0.01;
		};
		

		INSTANCE spellFX_SLEEPER_fireball_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Fireball_INIT";
				lightrange		= 0.01;
		};
		
		INSTANCE spellFX_SLEEPER_fireball_KEY_INVEST_1 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST";
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST1";
				lightrange		= 150;
				sfxid			= "MFX_Fireball_invest1";
				sfxisambient	= 1;
		}								;
		INSTANCE spellFX_SLEEPER_fireball_KEY_INVEST_2 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST_L2";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST2";
				sfxid			= "MFX_Fireball_invest2";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_SLEEPER_fireball_KEY_INVEST_3 (C_ParticleFXEmitKey)
		{
				visname_S 	= "MFX_Fireball_INVEST_L3";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST3";
				sfxid			= "MFX_Fireball_invest3";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_SLEEPER_fireball_KEY_INVEST_4 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST_L4";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST4";
				sfxid			= "MFX_Fireball_invest4";
				sfxisambient	= 1;
		};		
		INSTANCE spellFX_SLEEPER_FireBall_KEY_CAST (C_ParticleFXEmitKey)
		{
				lightrange				= 200;
				visname_S 				= "MFX_Fireball_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "MFX_Fireball_Cast";
	 			sfxisambient			= 1;
	 			emCheckCollision 		= 1;
		};
		INSTANCE spellFX_SLEEPER_FireBall_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
};


	
//////////////////////////////////////
//	
// 	Visual Effects
//	Instance-Definitions 
//	
//////////////////////////////////////

// visual effects config instance
// WICHTIG: 
// die Parameter der Keys verändern die effekte/visuals nur wenn ein Wert ungleich NULL angegeben wird,
// ausser bei INTEGER Variablen. Das heisst wenn ein KEY benutzt wird und ein Parameter den FX/das Visual ändern
// soll, so muss dieser bei Floats leicht von 0 verschieden sein (z.B. 0.000001).
//
// Parameter der Keys wirken sich immer nur auf den ersten definierten PFX aus, bei Multi-PFX's nicht auf die Childs


///   													XXXXXXXXXXXXXXXXX
///   													XX  L I G H T  XX
///   													XXXXXXXXXXXXXXXXX

// [EDENFELD] Die spellFX_Light_ACTIVE Instanz muss als Child mit eigener Trajectory an die Haupt spellFX_Light Instanz 
// gehängt werden, und darf erst beim Casten ein Visual bekommen.
// nur so kann getestet werden, ob ein etwaiges gecastetes Licht noch aktiv ist. Vorher wurde die spellFX_Light_ACTIVE
// Instanz über die emCreateFXID Variable getriggert. Die so erzeugten Effekte haben dann aber keinen Bezug mehr zum Licht Spell.

INSTANCE spellFX_Light(CFx_Base_Proto)
{
		visname_S 			= "MFX_Light_INIT";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		
		emFXCreate_S 		= "spellFX_Light_ACTIVE";
		emFXCreatedOwnTrj 	= 1;
		
		};

		INSTANCE spellFX_Light_KEY_CAST (C_ParticleFXEmitKey)
		{
				pfx_ppsIsLoopingChg = 1;

};


INSTANCE spellFX_Light_ACTIVE	(CFx_Base_Proto)
{
		visname_S 			= "";
		visAlpha			= 1;
		emtrjmode_s 		= "FOLLOW TARGET";
     	emtrjeasevel 		= 0.;
     	emtrjmode_s 			= "FIXED";     	
		emTrjOriginNode 		= "BIP01 HEAD";
		emtrjloopmode_s 	= "HALT";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.4;
		emTrjTargetRange	= 1.2;
		emTrjTargetElev 	= 89;
		lightPresetname 	= "JUSTWHITE";

	emadjustshptoorigin = 1;//1
		};
		
		INSTANCE spellFX_Light_ACTIVE_KEY_OPEN (C_ParticleFXEmitKey)
		{
			lightRange 		= 0.01;
		};
		
		INSTANCE spellFX_Light_ACTIVE_KEY_INIT(C_ParticleFXEmitKey)
		{
			lightRange 		= 0.01;
		};
		
		INSTANCE spellFX_Light_ACTIVE_KEY_CAST 	(C_ParticleFXEmitKey)
		{
				visName_S		= "MFX_Light_ORIGIN";
				lightRange		= 1000;
				sfxid			= "MFX_Light_CAST";
				sfxisambient	= 1;
				emtrjeasevel 	= 1400.;
};
///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E B O L T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Firebolt	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Firebolt_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "COLLIDE CREATEONCE";
     	emFXCollStat_S	   		= "spellFX_Firebolt_COLLIDEFX";
     	emFXCollDyn_S	   		= "spellFX_Firebolt_SENDPERCEPTION";
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
				
		lightPresetname   		= "FIRESMALL";
		
		// quadmark
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "40 40";
		userString[2]			= "MUL";
				
		
		};

		INSTANCE spellFX_Firebolt_KEY_OPEN	(C_ParticleFXEmitKey)
		{
				lightrange = 0.0001;
		};
		
		INSTANCE spellFX_Firebolt_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Firebolt_INIT";
				lightrange = 0.0001;
		};
		
		INSTANCE spellFX_Firebolt_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "mfx_firebolt_cast";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "Torch_Enlight";
	 			lightrange 				= 200;
	 			emCheckCollision 		= 1;
		};

		INSTANCE spellFX_Firebolt_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	visname_S 				= "";		
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
	 			sfxid		  			= "TORCH_ENLIGHT";
};

instance spellFX_Firebolt_COLLIDEFX		(CFx_Base_Proto)
{
		visname_S 			= "MFX_Firebolt_Collide";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		lightPresetname   	= "FIRESMALL";
};

instance spellFX_Firebolt_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Firebolt_Collide";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		lightPresetname   	= "FIRESMALL";
		sendassessmagic		= 1;
};





instance runeFX_Firebolt_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Firebolt_Collide";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		lightPresetname   	= "FIRESMALL";
	 	sfxid		  			= "TORCH_ENLIGHT";		
		sendassessmagic		= 1;
};
///   			XXXXXXXXXXXXXXX
///   			XX C U R S E XX
///   			XXXXXXXXXXXXXXX


INSTANCE SpellFX_Weakness	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Curse_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
    	
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "COLLIDE CREATEONCE";
     	emFXCollStat_S	   		= "SpellFX_Weakness_COLLIDEFX";
     	emFXCollDyn_S	   		= "SpellFX_Weakness_SENDPERCEPTION";
		emTrjTargetRange	 	= 40;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		emFXCreatedOwnTrj 		= 1; 				
		lightPresetname   		= "FIRESMALL";
		
		// quadmark
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "40 40";
		userString[2]			= "MUL";
				
		
		};

		INSTANCE SpellFX_Weakness_KEY_OPEN	(C_ParticleFXEmitKey)
		{
				lightrange = 0.0001;
		};
		
		INSTANCE SpellFX_Weakness_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Curse_INIT";
				lightrange = 0.0001;
				emcreatefxid		= "SpellFX_Weakness_INITFOG";
		};
		
		INSTANCE SpellFX_Weakness_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_CURSE_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 900.;
	 			sfxid					= "MFX_Curse_Collide";
	 			lightrange 				= 200;
	 			emCheckCollision 		= 1;
				emcreatefxid		= "SpellFX_Weakness_CASTDOTS";
	 			
	 			
	 			
		};

		INSTANCE SpellFX_Weakness_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	visname_S 				= "";		
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
	 			sfxid		  			= "MFX_Curse_Cast";
};

instance SpellFX_Weakness_INITFOG	(CFx_Base_Proto)
{
		visname_S 			= "MFX_CURSE_INIT_FOG";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode		= "ZS_RIGHTHAND";		
};

instance SpellFX_Weakness_CASTDOTS	(CFx_Base_Proto)
{
		visname_S 			= "MFX_CURSE_CAST_DOTS";
		emFXCreatedOwnTrj 	= 1;	
		emtrjmode_s 			= "TARGET";
	 	emtrjeasevel 			= 700.;
		emCheckCollision 		= 1;	
};

instance SpellFX_Weakness_COLLIDEFX		(CFx_Base_Proto)
{
		visname_S 			= "MFX_CURSE_COLLIDE1";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode		= "BIP01";		
		lightPresetname   	= "FIRESMALL";		
};

instance SpellFX_Weakness_COLLIDE2	(CFx_Base_Proto)
{
		visname_S 			= "MFX_CURSE_COLLIDE2";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode		= "ZS_RIGHTHAND";		
};
instance SpellFX_Weakness_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_CURSE_COLLIDE1";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode		= "BIP01";		
		lightPresetname   	= "FIRESMALL";
		sendassessmagic		= 1;
		emFXCreate_S		= "SpellFX_Weakness_COLLIDE2";		
};
///   			XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   			XX S T U N I N G   B A L L XX
///   			XXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_StuningBall	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_STUNINGBALL_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "COLLIDE CREATEONCE";
     	emFXCollStat_S	   		= "spellFX_StuningBall_COLLIDEFX";
     	emFXCollDyn_S	   		= "spellFX_StuningBall_SENDPERCEPTION";
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20;
				
		lightPresetname   		= "AURA";
		
		// quadmark
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "40 40";
		userString[2]			= "MUL";
				
		
		};

		INSTANCE spellFX_StuningBall_KEY_OPEN	(C_ParticleFXEmitKey)
		{
				lightrange = 0.0001;
		};
		
		INSTANCE spellFX_StuningBall_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_StuningBall_INIT";
				lightrange = 0.0001;
		};
		
		INSTANCE spellFX_StuningBall_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "mfx_StuningBall_cast";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "MFX_STUNINGBALL_Cast";
	 			lightrange 				= 200;
	 			emCheckCollision 		= 1;
	 			
		};

		INSTANCE spellFX_StuningBall_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	visname_S 				= "";		
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
	 			sfxid					= "MFX_STUNINGBALL_Collide";
};

instance spellFX_StuningBall_COLLIDEFX		(CFx_Base_Proto)
{
		visname_S 			= "MFX_STUNINGBALL_COLLIDE2";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode		= "BIP01";		
		lightPresetname   	= "FIRESMALL";
};

instance spellFX_StuningBall_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_StuningBall_Collide";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode		= "BIP01";		
		lightPresetname   	= "FIRESMALL";
		sendassessmagic		= 1;
};

///   			XXXXXXXXXXXXXXXXX
///   			XX M E T E O R XX
///   			XXXXXXXXXXXXXXXXX


INSTANCE spellFX_Meteor	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Meteor_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
		
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
// // 		emTrjTargetRange	 	= 20;
// // 		emTrjTargetElev 		= 0;
 		emTrjDynUpdateDelay		= 1;
     	emFXInvestOrigin_S 		= "spellFX_Meteor_INVESTGLOW";	
  		emFXCollStat_S	   		= "spellFX_Meteor_COLLIDEFX";
 		emFXCollDyn_S     		= "spellFX_Meteor_SENDPERCEPTION";	    	
		lightPresetname   		= "AURA";
		//emSelfRotVel_S			= "179";
		
		// quadmark
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "400 400";
		userString[2]			= "MUL";
				
		
		};

		INSTANCE spellFX_Meteor_KEY_OPEN	(C_ParticleFXEmitKey)
		{
				lightrange = 0.0001;
		};
		
		INSTANCE spellFX_Meteor_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Meteor_INIT";
				lightrange = 0.0001;
		};
		
		INSTANCE spellFX_Meteor_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "mfx_Meteor_cast";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1200.;//szybkosc pocisku
	 			sfxid					= "MFX_Meteor_Cast";
	 			lightrange 				= 200;
	 			emCheckCollision 		= 1;
	 			emSelfRotVel_S			= "179";
	 			
	 			
		};

		INSTANCE spellFX_Meteor_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	visname_S 				= "";		
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
	 			sfxid		  			= "MFX_Meteor_Collide";
	 			
};
INSTANCE spellFX_Meteor_INVESTGLOW	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Meteor_INVEST";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
		emAdjustShpToOrigin 		= 1;
		emtrjmode_s 			= "none";
		lightPresetName 		= "REDAMBIENCE";
		sfxid					= "MFX_Meteor_Invest";
		sfxisambient			= 1;
};
INSTANCE spellFX_Meteor_REDGLOW	(CFx_Base_Proto)
{

	
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "COLLIDE CREATEONCE";
// 		emTrjTargetRange	 	= 20;
 //		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 1;



		
// 		// quadmark
// 		userString[0]			= "fireballquadmark.tga";
// 		userString[1]			= "40 40";
// 		userString[2]			= "MUL";
				
		
		};

		INSTANCE spellFX_Meteor_REDGLOW_KEY_OPEN	(C_ParticleFXEmitKey)
		{
		};
		
		INSTANCE spellFX_Meteor_REDGLOW_KEY_INIT (C_ParticleFXEmitKey)
		{

		};
		
		INSTANCE spellFX_Meteor_REDGLOW_KEY_CAST(C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_METEOR_CAST_REDGLOW";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1350.;//szybkosc pocisku
	 			emCheckCollision 		= 1;
	 			
	 			
		};
INSTANCE spellFX_Meteor_SMOKE	(CFx_Base_Proto)
{

	
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "COLLIDE CREATEONCE";
 		emTrjTargetRange	 	= 20;
 		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 2;
 		emFXCollDyn_S     		= "spellFX_Meteor_SENDPERCEPTION2";	    	
				
		
		// quadmark
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "40 40";
		userString[2]			= "MUL";
				
		
		};

		INSTANCE spellFX_Meteor_SMOKE_KEY_OPEN	(C_ParticleFXEmitKey)
		{
		};
		
		INSTANCE spellFX_Meteor_SMOKE_KEY_INIT (C_ParticleFXEmitKey)
		{

		};
		
		INSTANCE spellFX_Meteor_SMOKE_KEY_CAST(C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_METEOR_CAST_SMOKE";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1000.;//szybkosc pocisku
	 			emCheckCollision 		= 1;
	 			
	 			
		};		
		
		
instance spellFX_Meteor_COLLIDEFX		(CFx_Base_Proto)
{
		visname_S 			= "MFX_METEOR_COLLIDE";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		lightPresetname   	= "FIRESMALL";
								
};
		
instance spellFX_Meteor_SENDPERCEPTION2		(CFx_Base_Proto)
{
		visname_S 			= "MFX_METEOR_GROUND";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
				
		lightPresetname   	= "FIRESMALL";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "BOUNCE";
		//emFXCollStat_S	   		= "spellFX_Firestorm_COLLIDE";		// [Edenfeld] Wenn einkommentiert, erzeugt sehr viele VFX -> nicht sichtbar/Performance Probs.
		//emFXCollDyn_S     		= "spellFX_Firespell_HUMANBURN";	// [Edenfeld] NSC Feuerschaden wird in der spell_params.d festgelegt, hier unnötig, (ausser für Item Collisionen und _ZUSÄTZLICHEN_ Effekten unabhängig vom Feuerschaden - ja ehrlich es ist wahr!)
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		emCheckCollision		= 1;			
		sendassessmagic		= 1;
								
};


instance spellFX_Meteor_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_METEOR_COLLIDE";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
				
		lightPresetname   	= "FIRESMALL";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "BOUNCE";
		//emFXCollStat_S	   		= "spellFX_Firestorm_COLLIDE";		// [Edenfeld] Wenn einkommentiert, erzeugt sehr viele VFX -> nicht sichtbar/Performance Probs.
		//emFXCollDyn_S     		= "spellFX_Firespell_HUMANBURN";	// [Edenfeld] NSC Feuerschaden wird in der spell_params.d festgelegt, hier unnötig, (ausser für Item Collisionen und _ZUSÄTZLICHEN_ Effekten unabhängig vom Feuerschaden - ja ehrlich es ist wahr!)
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		emCheckCollision		= 1;			
		sendassessmagic		= 1;
};




///   			XXXXXXXXXXXXXXXXXXXXXXXXXXX
///   			XX  L I F E   D R A I N  XX
///   			XXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_LifeDrain(CFx_Base_Proto)
{
		visname_S 			= "MFX_LifeDrain_INIT";
		emtrjmode_s 		= "TARGET";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjnumkeys 		= 2;
		emtrjnumkeysvar 	= 1;
		emtrjangleelevvar 	= 2.;
		emtrjangleheadvar 	= 0.;
		emtrjeasefunc_s 	= "LINEAR";
		emtrjloopmode_s 	= "HALT";
		emtrjdynupdatedelay = 0.;
		emFXInvestOrigin_S 	= "spellFX_LifeDrain_ORIGIN";
		//emFXInvestTarget_S 	= "spellFX_Telekinesis_TARGET";
		//lightPresetname 	= "POISON";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
};

INSTANCE spellFX_LifeDrain_KEY_INIT (C_ParticleFXEmitKey)
{
		visname_s			= "MFX_LifeDrain_INIT";
		emtrjeasevel	  	= 0.01;
};

INSTANCE spellFX_LifeDrain_KEY_INVEST_1	(C_ParticleFXEmitKey)
{
		visname_s			= "MFX_LifeDrain_INIT_SPARKS";
		emtrjeasevel	  	= 2000;
		sfxid				= "MFX_LIFEDRAIN_LOOP";
		sfxisambient		= 1;
};


INSTANCE spellFX_LifeDrain_KEY_CAST	(C_ParticleFXEmitKey)
{
		visname_s			= "";
		
};

instance spellFX_LifeDrain_COLLIDE		(CFx_Base_Proto)
{
		visname_S 			= "MFX_LifeDrain_Collide1";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode		= "BIP01";
		lightPresetname   	= "FIRESMALL";	
};


INSTANCE spellFX_LifeDrain_Origin		(CFx_Base_Proto)
{
		visname_S 			= "MFX_LIFEDRAIN_BRIDGE";
		
		emtrjmode_s 		= "TARGET LINE";
		emtrjeasevel	  	= 0.0001;
		emTrjOriginNode 	= "BIP01 R Hand";
		emtrjdynupdatedelay = 0.;
		emFXCreate_S		= "SpellFX_Weakness_Cast";		
		lightPresetname 	= "AURA";
		sfxid				= "MFX_LIFEDRAIN_LOOP";
		sfxisambient		= 1;
		sendAssessMagic		= 1;
		
};

instance spellFX_LifeDrain_INCOME	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "MFX_LifeDrain_INCOME";
		emTrjOriginNode 	= "BIP01";
		visAlpha			= 1;
// 	    emFXCreate_S	 	= "spellFX_Heal_START";
		emtrjmode_s 		= "FIXED";
};


///   											XXXXXXXXXXXXXXXXXXXXXXXX
///   											XX  H O L Y   F I R E XX
///   											XXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_HOLYFIRE (CFx_Base_Proto)
{

     	visname_S 				= "MFX_HOLYFIRE_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Fireball_COLLIDE";
		emFXCollDyn_S     		= "spellFX_HOLYFIRE_SENDPERCEPTION";
		emFXCollStatAlign_S		= "COLLISIONNORMAL";
	
		emFXCreatedOwnTrj 		= 1; 
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 1;
		emTrjDynUpdateDelay		= 1;
		lightPresetname   		= "LIGHTSWD";	

		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "100 100";
		userString[2]			= "MUL";
		
			};
		
		INSTANCE spellFX_HOLYFIRE_KEY_OPEN (C_ParticleFXEmitKey)
		{
				lightrange		= 0.01;
		};
		

		INSTANCE spellFX_HOLYFIRE_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_HOLYFIRE_INIT";
				lightrange		= 0.01;
		};
		
		INSTANCE spellFX_HOLYFIRE_KEY_INVEST_1(C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_HOLYFIRE_INVEST";
				lightrange		= 150;
		}								;

		INSTANCE spellFX_HOLYFIRE_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_HOLYFIRE_CAST";	
				emCreateFXID 		= "spellFX_HOLYFIRE_CAST2";
				//emFXCreatedOwnTrj 	= 1;	
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 700.;
	 			sfxid					= "MFX_HolyFire_Cast";
	 			lightrange 				= 200;
	 			emCheckCollision 		= 1;
		};
		INSTANCE spellFX_HOLYFIRE_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
				//visname_S 				= "MFX_HOLYFIRE_COLLIDE";					
		     	pfx_flygravity_s		= "0 0 0";
		     	emtrjeasevel 			= 0.000001;
	 			sfxid					= "MFX_HolyFire_Collide";
		     	
	  };

		INSTANCE spellFX_HOLYFIRE_CAST2 (CFx_Base_Proto)
		{
				visname_S 				= "MFX_HOLYFIRE_CAST2";	
				emFXCreatedOwnTrj 	= 1;	
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 700.;
	 			emCheckCollision 		= 1;
		};

// KOLLISION MIT DYNAMISCHER WELT:  WOHL PERCEPTION

instance spellFX_HOLYFIRE_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_HOLYFIRE_COLLIDE";
		visAlpha			= 1;
		emTrjOriginNode		= "BIP01";
		emtrjmode_s 		= "FIXED";
		lightPresetname   	= "FIRESMALL";	
		sendAssessMagic		= 1;
};




INSTANCE VOB_HOLYBURN			(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 FIRE";
	visname_S 			= "MFX_HOLYFIRE_BURN";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD1";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	lightpresetname		= "LIGHTSWD";
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD1	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R UPPERARM";
	visname_S 			= "MFX_HOLYFIRE_BURN";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD2";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD2	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L UPPERARM";
	visname_S 			= "MFX_HOLYFIRE_BURN";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD3";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD3	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L HAND";
	visname_S 			= "MFX_HOLYFIRE_BURN";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD4";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD4	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R HAND";
	visname_S 			= "MFX_HOLYFIRE_BURN";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD5";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD5	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L FOOT";
	visname_S 			= "MFX_HOLYFIRE_BURN";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD6";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD6	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R FOOT";
	visname_S 			= "MFX_HOLYFIRE_BURN";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD7";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD7			(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 FIRE";
	visname_S 			= "MFX_HOLYFIRE_GLOW";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD8";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	lightpresetname		= "FIRESMALL";
	sfxid				= "MFX_HOLYFIRE_GLOW";
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD9	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R UPPERARM";
	visname_S 			= "MFX_HOLYFIRE_GLOW";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD10";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD10	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L UPPERARM";
	visname_S 			= "MFX_HOLYFIRE_GLOW";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD11";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD11	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L HAND";
	visname_S 			= "MFX_HOLYFIRE_GLOW";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD12";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD12	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R HAND";
	visname_S 			= "MFX_HOLYFIRE_GLOW";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD13";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD13	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L FOOT";
	visname_S 			= "MFX_HOLYFIRE_GLOW";
	emFXCreate_S 		= "VOB_HOLYBURN_CHILD14";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_HOLYBURN_CHILD14	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R FOOT";
	visname_S 			= "MFX_HOLYFIRE_GLOW";
//	emFXCreate_S 		= "VOB_HOLYBURN_CHILD7";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};


///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  T H U N D E R  XX
///   													XXXXXXXXXXXXXXXXXXXXX
INSTANCE spellFX_Thunder	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Thunder_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.1;
				
		emFXInvestOrigin_S 	= "spellFX_Thunder_ORIGIN";
     	emtrjtargetnode 		= "BIP01";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Fireball_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Thunder_TARGET";
		emFXCollStatAlign_S		= "COLLISIONNORMAL";
	
		emFXCreatedOwnTrj 		= 0; 
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;		
		};
		
		INSTANCE spellFX_Thunder_KEY_INIT	(C_ParticleFXEmitKey)
		{
				visname_S				= "MFX_Thunder_INIT";

		};
		
		INSTANCE spellFX_Thunder_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_Thunder_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			lightrange 				= 200;
	 			emCheckCollision 		= 1;
	 			pfx_visAlphaStart		= 0;
		};
		INSTANCE spellFX_Thunder_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     //	visname_S 				= "";		
		     //	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
};

INSTANCE spellFX_Thunder_INIT_GLOW	(CFx_Base_Proto)
{
		visname_S 		= "MFX_Thunder_INVEST_GLOW";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
	
};
INSTANCE spellFX_Thunder_INVEST_HACK	(CFx_Base_Proto)
{
		//visname_S 		= "";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L Hand";
		emTrjTargetNode 	= "Bip01 L Hand";
		emtrjdynupdatedelay 	= 0;
		emFXCreate_S		= "spellFX_Thunder_INVEST_L";
		emFXCreatedOwnTrj	= 1;		
		
};
INSTANCE spellFX_Thunder_INVEST_HACK2	(CFx_Base_Proto)
{
		//visname_S 		= "";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
		emFXCreate_S		= "spellFX_Thunder_INIT_GLOW";
		emFXCreatedOwnTrj	= 1;		
		
};
INSTANCE spellFX_Thunder_INVEST_L	(CFx_Base_Proto)
{
		visname_S 		= "MFX_Thunder_INVEST";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L Hand";
		emTrjTargetNode 	= "Bip01 L Hand";
		emtrjdynupdatedelay 	= 0;
		emFXCreate_S		= "spellFX_Thunder_INVEST_L_GLOW";	
		emFXCreatedOwnTrj	= 1;		
		
};
INSTANCE spellFX_Thunder_INVEST_L_GLOW	(CFx_Base_Proto)
{
		visname_S 		= "MFX_Thunder_INVEST_GLOW";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L Hand";
		emTrjTargetNode 	= "Bip01 L Hand";
		emFXCreatedOwnTrj	= 1;		
		emtrjdynupdatedelay 	= 0;
		emFXCreate_S		= "spellFX_Thunder_INVEST_HACK2";	
		
	
};
instance spellFX_Thunder_ORIGIN	(CFx_Base_Proto)
{
		visname_S 		= "MFX_Thunder_ORIGIN";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01";
		emtrjdynupdatedelay 	= 0;
		emFXCreate_S		= "spellFX_Thunder_INVEST_HACK";
		sfxid					= "MFX_Thunder_Invest";
//		sfxisambient			= 1;
};

instance spellFX_Thunder_TARGET	(CFx_Base_Proto)
{
		lightPresetname 	= "LIGHTNING";
		visname_S 		= "MFX_THUNDER_COLLIDE";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01";
		emtrjdynupdatedelay 	= 0;
		emFXCreate_S		= "spellFX_Thunder_TARGET_BALL";
		sendAssessMagic		= 1;
		
};
instance spellFX_Thunder_TARGET_BALL	(CFx_Base_Proto)
{
		visname_S 		= "MFX_THUNDER_COLLIDE_BALL";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01";
		emtrjdynupdatedelay 	= 0;
		emFXCreate_S		= "spellFX_Thunder_TARGET_GLOW";
		emFXTriggerDelay = 0.1;
		sfxid					= "MFX_Thunder_Cast";
		
		
	
};
instance spellFX_Thunder_TARGET_GLOW	(CFx_Base_Proto)
{
		visname_S 		= "MFX_THUNDER_COLLIDE_GLOW";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01";
		emtrjdynupdatedelay 	= 0;
		emFXTriggerDelay = 0.5;
	
};

///   													XXXXXXXXXXXXXXXXXXX
///   													XX  M I R R O R  XX
///   													XXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Mirror	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Mirror_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.;
		emSelfRotVel_S		= "0 50 0";		
		emFXInvestOrigin_S 	= "spellFX_MIRROR_HIT";
		
		};
		
		INSTANCE spellFX_Mirror_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
		     	sfxid					= "MFX_MIRROR_CAST";
		     	emCreateFXID			= "spellFX_Mirror_CAST_HACK";
		     	sfxisambient			= 1;
		     	//e
				//emCreateFXID 			= "spellFX_Mirror_KEY_CAST_HACK";
};

instance spellFX_MIRROR_HIT	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "MFX_MIRROR_HIT";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "Bip01 Spine1";
//		LightPresetname		= "AURA";
		emFXLifeSpan		= 2;
};
instance spellFX_Mirror_CAST_HACK	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "";
		emTrjOriginNode 	= "BIP01";
		visAlpha			= 1;
	    emFXCreate_S	 	= "spellFX_Mirror_CAST_NPC";
		emtrjmode_s 		= "FIXED";
//		LightPresetname		= "AURA";
};
instance spellFX_Mirror_CAST_NPC	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "MFX_MIRROR_FRONTOFNPC";
		emTrjOriginNode 	= "Bip01 Spine1";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		LightPresetname		= "AURA";
		emFXLifeSpan			= 180.0;//3min
		emSelfRotVel_S		= "0 200 0";	
		
    	emtrjmode_s 			= "FIXED";
		
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
// // 		emTrjTargetRange	 	= 20;
// // 		emTrjTargetElev 		= 0;
 		emTrjDynUpdateDelay		= 1;			
		
};
///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E B A L L  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Fireball(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Fireball_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Fireball_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Fireball_SENDPERCEPTION";
		emFXCollStatAlign_S		= "COLLISIONNORMAL";
	
		emFXCreatedOwnTrj 		= 0; 
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "100 100";
		userString[2]			= "MUL";
		lightPresetname   		= "FIRESMALL";	
		
		};
		
		INSTANCE spellFX_fireball_KEY_OPEN (C_ParticleFXEmitKey)
		{
				lightrange		= 0.01;
		};
		

		INSTANCE spellFX_fireball_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Fireball_INIT";
				lightrange		= 0.01;
		};
		
		INSTANCE spellFX_fireball_KEY_INVEST_1 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST";
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST1";
				lightrange		= 150;
				sfxid			= "MFX_Fireball_invest1";
				sfxisambient	= 1;
		}								;
		INSTANCE spellFX_fireball_KEY_INVEST_2 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST_L2";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST2";
				sfxid			= "MFX_Fireball_invest2";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_fireball_KEY_INVEST_3 (C_ParticleFXEmitKey)
		{
				visname_S 	= "MFX_Fireball_INVEST_L3";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST3";
				sfxid			= "MFX_Fireball_invest3";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_fireball_KEY_INVEST_4 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST_L4";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST4";
				sfxid			= "MFX_Fireball_invest4";
				sfxisambient	= 1;
		};		
		INSTANCE spellFX_FireBall_KEY_CAST (C_ParticleFXEmitKey)
		{
				lightrange				= 200;
				visname_S 				= "MFX_Fireball_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "MFX_Fireball_Cast";
	 			sfxisambient			= 1;
	 			emCheckCollision 		= 1;
		};
		INSTANCE spellFX_FireBall_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
};

instance spellFX_Fireball_InVEST_BLAST1		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Fireball_INVEST_BLAST";
		visAlpha		= 1;
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest1";
		sfxisambient	= 1;
		visAlpha 		= 0.3;
};

instance spellFX_Fireball_InVEST_BLAST2	(CFx_Base_Proto)
{
		visname_S 		= "MFX_Fireball_INVEST_BLAST";
		visAlpha		= 1;
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest2";
		sfxisambient	= 1;
		visAlpha 		= 0.5;
};

instance spellFX_Fireball_InVEST_BLAST3		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Fireball_INVEST_BLAST";
		visAlpha		= 1;
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest3";
		sfxisambient	= 1;
		visAlpha 		= 0.8;
};

instance spellFX_Fireball_InVEST_BLAST4		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Fireball_INVEST_BLAST";
		visAlpha		= 1;
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest4";
		sfxisambient	= 1;
		visAlpha 		= 1;
};

// KOLLISION MIT STATISCHER WELT:  KEINE PERCEPTION

instance spellFX_Fireball_COLLIDE		(CFx_Base_Proto)
{
		visname_S 			= "MFX_Fireball_Collide1";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode		= "BIP01";
		lightPresetname   	= "FIRESMALL";	
};
		
INSTANCE spellFX_Fireball_COLLIDE_KEY_INVEST_1	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide1";		sfxid	= "MFX_Fireball_Collide1";		};
INSTANCE spellFX_Fireball_COLLIDE_KEY_INVEST_2	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide2";		sfxid	= "MFX_Fireball_Collide2";		};
INSTANCE spellFX_Fireball_COLLIDE_KEY_INVEST_3	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide3";		sfxid	= "MFX_Fireball_Collide3";		};
INSTANCE spellFX_Fireball_COLLIDE_KEY_INVEST_4	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide4";		sfxid	= "MFX_Fireball_Collide4";		};

// KOLLISION MIT DYNAMISCHER WELT:  WOHL PERCEPTION

instance spellFX_Fireball_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Fireball_Collide1";
		visAlpha			= 1;
		emTrjOriginNode		= "BIP01";
		emtrjmode_s 		= "FIXED";
		lightPresetname   	= "FIRESMALL";	
		sendAssessMagic		= 1;
};
instance runeFX_Fireball_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Fireball_Collide1";
		visAlpha			= 1;
		emTrjOriginNode		= "BIP01";
		emtrjmode_s 		= "FIXED";
		lightPresetname   	= "FIRESMALL";	
		sendAssessMagic		= 1;
	 	sfxid					= "MFX_Fireball_Cast";
	 	sfxisambient			= 1;		
};
INSTANCE spellFX_Fireball_SENDPERCEPTION_KEY_INVEST_1	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide1";		sfxid	= "MFX_Fireball_Collide1";		};
INSTANCE spellFX_Fireball_SENDPERCEPTION_KEY_INVEST_2	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide2";		sfxid	= "MFX_Fireball_Collide2";		};
INSTANCE spellFX_Fireball_SENDPERCEPTION_KEY_INVEST_3	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide3";		sfxid	= "MFX_Fireball_Collide3";		};
INSTANCE spellFX_Fireball_SENDPERCEPTION_KEY_INVEST_4	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide4";		sfxid	= "MFX_Fireball_Collide4";		};


///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E W A L L  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_FireWall(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Firewall_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_FireWall_COLLIDE";
		emFXCollDyn_S     		= "spellFX_FireWall_SENDPERCEPTION";
		emFXCollStatAlign_S		= "COLLISIONNORMAL";

	
		emFXCollStatAlign_S		= "COLLISIONNORMAL";		// TRAJECTORY, COLLISIONNORMAL
		emFXCollDynAlign_S		= "COLLISIONNORMAL";
		emFXCreatedOwnTrj 		= 0; 
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 2000;
		emTrjTargetAzi			= 180;
		emTrjTargetElev			= 180;		
		userString[0]			= "Fireballquadmark.tga";
		userString[1]			= "100 100";
		userString[2]			= "MUL";
		lightPresetname   		= "FIRESMALL";	
		
		};
		
		INSTANCE spellFX_FireWall_KEY_OPEN (C_ParticleFXEmitKey)
		{
				lightrange		= 0.01;
		};
		

		INSTANCE spellFX_FireWall_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Firewall_INIT";
				lightrange		= 0.01;
		};
		
		INSTANCE spellFX_FireWall_KEY_INVEST_1 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Firewall_INVEST_L4";	
				emCreateFXID	= "spellFX_FireWall_InVEST_BLAST4";
				lightrange		= 150;
				sfxid			= "MFX_Fireball_invest1";
				sfxisambient	= 1;
		}								;
		INSTANCE spellFX_FireWall_KEY_INVEST_2 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Firewall_INVEST_L4";	
				emCreateFXID	= "spellFX_FireWall_InVEST_BLAST4";
				sfxid			= "MFX_Fireball_invest2";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_FireWall_KEY_INVEST_3 (C_ParticleFXEmitKey)
		{
				visname_S 	= "MFX_Firewall_INVEST_L4";	
				emCreateFXID	= "spellFX_FireWall_InVEST_BLAST4";
				sfxid			= "MFX_Fireball_invest3";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_FireWall_KEY_INVEST_4 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Firewall_INVEST_L4";	
				emCreateFXID	= "spellFX_FireWall_InVEST_BLAST4";
				sfxid			= "MFX_Fireball_invest4";
				sfxisambient	= 1;
		};		
		INSTANCE spellFX_FireWall_KEY_CAST (C_ParticleFXEmitKey)
		{
				lightrange				= 250;
				visname_S 				= "MFX_Firewall_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "MFX_ChaosBolt_Cast";
	 			emCheckCollision 		= 1;
		};
		INSTANCE spellFX_FireWall_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.00000001;
	 			sfxid					= "MFX_ChaosBolt_Collide";
		     	
};


instance spellFX_FireWall_InVEST_BLAST4		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Firewall_INVEST_BLAST";
		visAlpha		= 1;
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest4";
		sfxisambient	= 1;
		visAlpha 		= 1;
};

// KOLLISION MIT STATISCHER WELT:  KEINE PERCEPTION

instance spellFX_FireWall_COLLIDE		(CFx_Base_Proto)
{
		visname_S 			= "MFX_FIREWALL_COLLIDE_MISSLE";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode		= "BIP01";
		lightPresetname   	= "FIRESMALL";	
		
};
		
INSTANCE spellFX_FireWall_COLLIDE_KEY_INVEST_1	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_FIREWALL_COLLIDE_MISSLE";		sfxid	= "MFX_Fireball_Collide1";		};
INSTANCE spellFX_FireWall_COLLIDE_KEY_INVEST_2	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_FIREWALL_COLLIDE_MISSLE";		sfxid	= "MFX_Fireball_Collide2";		};
INSTANCE spellFX_FireWall_COLLIDE_KEY_INVEST_3	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_FIREWALL_COLLIDE_MISSLE";		sfxid	= "MFX_Fireball_Collide3";		};
INSTANCE spellFX_FireWall_COLLIDE_KEY_INVEST_4	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_FIREWALL_COLLIDE_MISSLE";		sfxid	= "MFX_Fireball_Collide4";		};

// KOLLISION MIT DYNAMISCHER WELT:  WOHL PERCEPTION

instance spellFX_FireWall_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_FIREWALL_COLLIDE_MISSLE";
		visAlpha			= 1;
		sendAssessMagic		= 1;		
		emTrjOriginNode		= "BIP01";
		emtrjmode_s 		= "FIXED";
		lightPresetname   	= "FIRESMALL";	

};

INSTANCE spellFX_FireWall_SENDPERCEPTION_KEY_INVEST_1	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_FIREWALL_COLLIDE_MISSLE";		sfxid	= "MFX_Fireball_Collide1";		};
INSTANCE spellFX_FireWall_SENDPERCEPTION_KEY_INVEST_2	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_FIREWALL_COLLIDE_MISSLE";		sfxid	= "MFX_Fireball_Collide2";		};
INSTANCE spellFX_FireWall_SENDPERCEPTION_KEY_INVEST_3	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_FIREWALL_COLLIDE_MISSLE";		sfxid	= "MFX_Fireball_Collide3";		};
INSTANCE spellFX_FireWall_SENDPERCEPTION_KEY_INVEST_4	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_FIREWALL_COLLIDE_MISSLE";		sfxid	= "MFX_FireWall_Collide4";		};



///   													XXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E S T O R M  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Firestorm	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Firestorm_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Firestorm_SPREAD";
		emFXCollDyn_S     		= "spellFX_Firestorm_SPREAD";		
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		emFXInvestORIGIN_S 		= "spellFX_Firestorm_INVESTSOUND";
		
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "100 100";
		userString[2]			= "MUL";
		
		lightPresetname   		= "FIRESMALL";
		};

		INSTANCE spellFX_Firestorm_KEY_OPEN(C_ParticleFXEmitKey)
		{
				lightrange			= 0.01;
		};

		INSTANCE spellFX_Firestorm_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Firestorm_INIT";
				lightrange			= 0.01;
		};
		
		INSTANCE spellFX_Firestorm_KEY_INVEST_1	(C_ParticleFXEmitKey)	{	lightrange	= 100;	emCreateFXID	= "spellFX_Firestorm_INVESTBLAST1";	};
		INSTANCE spellFX_Firestorm_KEY_INVEST_2	(C_ParticleFXEmitKey)	{	lightrange	= 200;	emCreateFXID	= "spellFX_Firestorm_INVESTBLAST2";	};
		INSTANCE spellFX_Firestorm_KEY_INVEST_3	(C_ParticleFXEmitKey)	{	lightrange	= 300;	emCreateFXID	= "spellFX_Firestorm_INVESTBLAST3";	};
		INSTANCE spellFX_Firestorm_KEY_INVEST_4	(C_ParticleFXEmitKey)	{	lightrange	= 400;	emCreateFXID	= "spellFX_Firestorm_INVESTBLAST4";	};
		
		INSTANCE spellFX_Firestorm_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_Firestorm_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "MFX_Firestorm_Cast";
	 			sfxisambient			= 1;
				emCheckCollision 		= 1;	 			
				lightrange				= 200;
		};

		INSTANCE spellFX_Firestorm_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
};


INSTANCE spellFX_FireStorm_INVESTSOUND	(CFX_Base_Proto)
{
		visname_s		= "simpleglow.tga";
		visalpha		= 0.01;
		sfxid			= "MFX_Firestorm_Invest";
		sfxisambient	= 1;		
};


INSTANCE spellFX_FireStorm_INVESTBLAST1	(CFX_Base_Proto)
{
		visname_S 		= "MFX_Firestorm_INVESTBLAST1";
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest1";
		sfxisambient	= 1;
};

INSTANCE spellFX_FireStorm_INVESTBLAST2	(CFX_Base_Proto)
{
		visname_S 		= "MFX_Firestorm_INVESTBLAST2";
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest2";
		sfxisambient	= 1;
};

INSTANCE spellFX_FireStorm_INVESTBLAST3	(CFX_Base_Proto)
{
		visname_S 		= "MFX_Firestorm_INVESTBLAST3";
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest3";
		sfxisambient	= 1;
};

INSTANCE spellFX_FireStorm_INVESTBLAST4	(CFX_Base_Proto)
{
		visname_S 		= "MFX_Firestorm_INVESTBLAST4";
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest4";
		sfxisambient	= 1;
};


INSTANCE spellFX_Firestorm_SPREAD	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Firestorm_SPREAD";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "CREATE CREATEQUAD";
     	emActionCollDyn_S 		= "CREATEONCE";
		//emFXCollStat_S	   		= "spellFX_Firestorm_COLLIDE";		// [Edenfeld] Wenn einkommentiert, erzeugt sehr viele VFX -> nicht sichtbar/Performance Probs.
		//emFXCollDyn_S     		= "spellFX_Firespell_HUMANBURN";	// [Edenfeld] NSC Feuerschaden wird in der spell_params.d festgelegt, hier unnötig, (ausser für Item Collisionen und _ZUSÄTZLICHEN_ Effekten unabhängig vom Feuerschaden - ja ehrlich es ist wahr!)
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		emCheckCollision		= 1;
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "40 40";
		userString[2]			= "MUL";
		lightPresetname   		= "FIRESMALL";	
		
		emFXCreate_S			= "spellFX_Firestorm_COLLIDE";
		
		sfxid					= "MFX_FIrestorm_Collide";
		sfxisambient			= 1;
		
		
};

instance spellFX_Firestorm_COLLIDE		(CFx_Base_Proto)
{	
		visname_S 				= "MFX_Fireball_Collide3";
		visAlpha				= 1;
		emtrjmode_s 			= "FIXED";
		lightPresetname   		= "FIRESMALL";	
		sfxid					= "MFX_Fireball_Collide3";
};

///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E R A I N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_FireRain(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Firerain_INIT";		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	
     	emFXInvestOrigin_S 		= "spellFX_FireRAin_INVESTGLOW";
		};

		INSTANCE spellFX_FireRain_KEY_CAST	(C_ParticleFXEmitKey)
		{
				emCreateFXID		= "spellFX_FireRain_RAIN";
				pfx_ppsIsLoopingChg = 1;
};

INSTANCE spellFX_FireRain_RAIN		(CFx_Base_Proto)
{
		visname_S 				= "MFX_FireRain_Rain";		
		emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
		emActionCollDyn_S		= "CREATEONCE";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     	emCheckCollision		= 1;
     	LightPresetName 		= "CATACLYSM";
     	sfxid					= "MFX_Firerain_rain";
     	sfxisambient			= 1;
};
INSTANCE runeFX_FireRain_RAIN		(CFx_Base_Proto)
{
		visname_S 				= "MFX_FireRain_Rain";		
		emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
		emActionCollDyn_S		= "CREATEONCE";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     	emCheckCollision		= 1;
     	LightPresetName 		= "CATACLYSM";
     	sfxid					= "MFX_Firerain_rain";
     	sfxisambient			= 1;
		sendAssessMagic		= 1;   	
};

INSTANCE spellFX_FireRain_SUB(CFx_Base_Proto)		// vorrübergehend, bis er hardcodiert nicht mehr gesucht wird
{
     	visname_S 				= "";
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01 HEAD";
};
	

INSTANCE spellFX_FireRain_INVESTGLOW	(CFx_Base_Proto)
{
		visname_S 				= "MFX_FireRain_INVESTGLOW";
		emTrjOriginNode 		= "BIP01";
		emFXCreatedOwnTrj 		= 1;
		emtrjmode_s 			= "FIXED";
		lightPresetName 		= "REDAMBIENCE";
		sfxid					= "MFX_Firerain_INVEST";
		sfxisambient			= 1;
		emFXCreate_S			= "FX_EarthQuake";
};

///   													XXXXXXXXXXXXXXXXX
///   													XX  S P E E D  XX
///   													XXXXXXXXXXXXXXXXX

instance spellFX_Speed(CFx_Base_Proto)
{
		visname_S 			= "MFX_Heal_INIT";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emFXInvestOrigin_S 	= "spellFX_Speed_ORIGIN";

		};

		instance spellFX_Speed_KEY_INVEST_1 	(C_ParticleFXEmitKey)
		{	
			emCreateFXID		= "spellFX_Speed_START";
		};
		
		instance spellFX_Speed_KEY_CAST 	(C_ParticleFXEmitKey)
		{	
			pfx_ppsisloopingChg = 1;
};

instance spellFX_Speed_START		(CFx_Base_Proto)			// HEAL START wird im 1. Invest-Key getriggert. Säule aus dem Boden.
{
		visname_S 			= "MFX_Heal_Start";
		sfxID			  	= "MFX_Heal_CAST";
		sfxisambient		= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 R FOOT";
};

instance spellFX_Speed_ORIGIN	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 		= "MFX_Heal_Invest";
		visAlpha		= 1;
		LightPresetname 	= "AURA";
	
		emtrjmode_s 		= "FIXED";
};



///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T E L E P O R T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX

instance spellFX_Teleport(CFx_Base_Proto)
{
		visname_S 			= "MFX_Teleport_INIT";
		//visAlpha			= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
			
		emFXInvestOrigin_S 	= "spellFX_Teleport_ORIGIN";
		lightpresetname		= "AURA";

		};

		instance spellFX_Teleport_KEY_OPEN(C_ParticleFXEmitKey)
		{
			lightrange 		= 0.1;
		};

		instance spellFX_Teleport_KEY_INIT		(C_ParticleFXEmitKey)
		{
			lightrange 		= 0.1;
		};
		
		instance spellFX_Teleport_KEY_INVEST_1	(C_ParticleFXEmitKey)
		{
			lightrange		= 200;
		};
		
		instance spellFX_Teleport_KEY_CAST 	(C_ParticleFXEmitKey)
		{	
			emCreateFXID	= "spellFX_Teleport_CAST";
			pfx_ppsIsLoopingChg = 1;
			lightrange 		= 500;
		};

instance spellFX_Teleport_ORIGIN	(CFx_Base_Proto)		
{
		visname_S 			= "MFX_TELEPORT_INVEST";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01";
		emFXCreate_S		= "spellFX_Teleport_Ring";
		sfxid			= "MFX_teleport_invest";
		sfxisambient	= 1;
};

instance spellFX_Teleport_RING	(CFx_Base_Proto)		
{
		visname_S 			= "MFX_TELEPORT_RING";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01";
};

instance spellFX_Teleport_CAST	(CFx_Base_Proto)		
{
		visname_S 			= "MFX_TELEPORT_CAST";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01";
		sfxid				= "MFX_teleport_Cast";
		sfxisambient		= 1;
	
		emtrjmode_s 		= "FIXED";
};


///   													XXXXXXXXXXXXXXX
///   													XX  H E A L  XX
///   													XXXXXXXXXXXXXXX

instance spellFX_Heal(CFx_Base_Proto)
{
		visname_S 			= "MFX_Heal_INIT";
		
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emFXInvestOrigin_S 	= "spellFX_Heal_ORIGIN";

		};

		instance spellFX_Heal_KEY_CAST 	(C_ParticleFXEmitKey)
		{	
			pfx_ppsisloopingChg = 1;
};

instance spellFX_Heal_START		(CFx_Base_Proto)			// HEAL START wird im 1. Invest-Key getriggert. Säule aus dem Boden.
{
		visname_S 			= "MFX_Heal_Start";
		sfxID			  	= "MFX_Heal_CAST";
		sfxisambient		= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 R FOOT";
};

instance spellFX_Heal_ORIGIN	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "MFX_Heal_Invest";
		emTrjOriginNode 	= "BIP01";
		visAlpha			= 1;
	    emFXCreate_S	 	= "spellFX_Heal_START";
		emtrjmode_s 		= "FIXED";
		LightPresetname		= "AURA";
};
instance spellFX_Heal_ORIGIN_SCRIPT	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "MFX_Heal_Invest";
		emTrjOriginNode 	= "BIP01";
		visAlpha			= 1;
	    emFXCreate_S	 	= "spellFX_Heal_START";
		emtrjmode_s 		= "FIXED";
		LightPresetname		= "AURA";
		emfxlifespan = 6;	
		
};

///   													XXXXXXXXXXXXXXX
///   													XX  H E A L  XX
///   													XXXXXXXXXXXXXXX

instance spellFX_HealOther(CFx_Base_Proto)
{
		visname_S 			= "MFX_Heal_INIT";
		
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emFXInvestTarget_S 	= "spellFX_Heal_ORIGIN";

		};

		instance spellFX_HealOther_KEY_CAST 	(C_ParticleFXEmitKey)
		{	
			pfx_ppsisloopingChg = 1;
};

instance spellFX_HealOther_START		(CFx_Base_Proto)			// HEAL START wird im 1. Invest-Key getriggert. Säule aus dem Boden.
{
		visname_S 			= "MFX_Heal_Start";
		sfxID			  	= "MFX_Heal_CAST";
		sfxisambient		= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 R FOOT";
};

instance spellFX_HealOther_ORIGIN	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "MFX_Heal_Invest";
		emTrjOriginNode 	= "BIP01";
		visAlpha			= 1;
	    emFXCreate_S	 	= "spellFX_Heal_START";
		emtrjmode_s 		= "FIXED";
		LightPresetname		= "AURA";
};





///   													XXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T R A N S F O R M   XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Transform	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Transform_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 5000;
		};

		instance spellFX_transform_KEY_OPEN			(C_ParticleFXEmitKey)			// eigentlich INIT, warte auf bugfix
		{
				visname_S 			= "MFX_Transform_INIT";
		};

		instance spellFX_transform_KEY_INVEST_1		(C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Transform_ORIGIN";
				emCreateFXID		= "spellFX_Transform_GLOW_SFX";
		};
						
		instance spellFX_transform_KEY_CAST			(C_ParticleFXEmitKey)
		{
				pfx_ppsisloopingChg = 1;
				emCreateFXID		= "spellFX_Transform_BLEND";
};


instance spellFX_Transform_GLOW_SFX	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Transform_GLOW";
		emtrjmode_s 			= "FIXED";
		emtrjoriginnode 		= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
		sfxid					= "MFX_Transform_invest";
		sfxisambient			= 1;
};

instance spellFX_Transform_GLOW	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Transform_GLOW";
		emtrjmode_s 			= "FIXED";
		emtrjoriginnode 		= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
};

instance spellFX_Transform_BLEND	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Transform_BLEND";
		emtrjmode_s 			= "FIXED";
		emtrjoriginnode 		= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
		sfxid					= "MFX_Transform_Cast";
		sfxisambient			= 1;

};


///   									XXXXXXXXXXXXXXXXXXXXXXXXXXX
///   									XX L I G H T N I N G BIG XX
///   									XXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Lightning_Big	(CFx_Base_Proto)
{
	     	visname_S 				= "MFX_Lightning_Big_INIT";		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	lightPresetname 		= "WHITEBLEND";

     	
     	emFXInvestOrigin_S 		= "spellFX_Lightning_Big_INVESTGLOW";
     		sfxID 	=	"MFX_Lightning_Big_Init";//MFX_Lightning_Big_init//neu//new/nowy//novinka ;-p
				sfxisambient	= 1;
		};

		INSTANCE spellFX_Lightning_Big_KEY_CAST	(C_ParticleFXEmitKey)
		{
			
				emCreateFXID		= "spellFX_Lightning_Big_RAIN";
				pfx_ppsIsLoopingChg = 1;
};

INSTANCE spellFX_Lightning_Big_RAIN		(CFx_Base_Proto)
{
// INSTANCE spellFX_Icewave_WAVE	(CFx_Base_Proto)//But modified
// {
		visname_S 				= "MFX_Lightning_Big_RAIN1";		
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
     	emFXCollDyn_S			= "spellFX_Lightning_Big_TRAGET";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     		emActionCollDyn_S		= "BOUNCE";	
	emCheckCollision		= 1;
// };
     	LightPresetName 		= "CATACLYSM";

     	

};


INSTANCE spellFX_Lightning_Big_SUB(CFx_Base_Proto)		// This is copy of fire rain and i don't know what it is ;P better i don't touch it ;)-Orc
{
     	visname_S 				= "";
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01 HEAD";
			emCheckCollision		= 1;
};
	

INSTANCE spellFX_Lightning_Big_INVESTGLOW	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Lightning_Big_INVESTGLOW";
		emTrjOriginNode 		= "BIP01";
		emtrjmode_s 		= "TARGET LINE RANDOM";
		emFXCreatedOwnTrj 		= 1;
		lightPresetname 		= "WHITEBLEND";

		emFXCreate_S			= "FX_EarthQuake";
			sfxID 	=	"MFX_Lightning_Big_Init";//MFX_Lightning_Big_init//neu//new/nowy//novinka ;-p
	//			sfxisambient	= 1;
};
	
	INSTANCE spellFX_Lightning_Big_KEY_TRAGET (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	
		     	emtrjeasevel 			= 1.000001;
	 			emCheckCollision		= 1;
    			sfxid					= "MFX_Lightning_Big_Cast";
     			sfxisambient			= 1;
     				emCheckCollision		= 1;
};

instance spellFX_Lightning_Big_COLLIDE		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Lightning_Big_Collide";
		visAlpha		= 1;
     	emtrjmode_s 			= "TARGET";
     	sfxid					= "MFX_Lightning_Big_Origin";
     	sfxisambient			= 1;
	 	emtrjtargetnode 	= "BIP01 HEAD";  	
};

instance spellFX_Lightning_Big_TRAGET 		(CFx_Base_Proto)
{	emTrjOriginNode 	= "BIP01";
	visname_S 			= "MFX_LIGHTNING_BIG_TRAGET";//MFX_Lightning_Big_TRAGET/////"MFX_FIRESPELL_HUMANBURN"
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	lightpresetname		= "AURA";
	sendassessmagic		= 1;
     	sfxid					= "MFX_Lightning_Big_Orgin";
     	sfxisambient			= 1;
};	
	
	//OLD (Backup)
// 				visName_S 			= "MFX_Lightning_Big_INIT";
// 				visSize_S 			= "40 40";
// 				visAlphaBlendFunc_S = "ADD";
// 				visTexAniFPS 		= 23;
// 				visTexAniIsLooping 	= 1;
// 				
// 				emtrjmode_s 		= "FIXED";
// 				emtrjNumKeys    	= 4;
// 				emtrjnumkeysvar 	= 1;
// 				emtrjangleelevvar 	= 20.;
// 				emtrjangleheadvar 	= 20.;
// 				emtrjloopmode_s 	= "PINGPONG";
// 				emTrjOriginNode 	= "ZS_RIGHTHAND";
// 				emActionCollStat_S		= "COLLIDE CREATE";
// 		     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
// 				emFXCollStat_S	   		= "spellFX_Lightning_Big_COLLIDE";
// 				emFXCollDyn_S     		= "spellFX_Lightning_Big_SENDPERCEPTION";	
// 				emtrjeasefunc_s 	= "LINEAR";
// 				emtrjdynupdatedelay = 0.3;
// 				emselfrotvel_s 		= "0 0 50";
// 				emTrjTargetRange	= 20;
// 				emTrjTargetElev 	= 0;
// 				};
// 		
// 				INSTANCE spellFX_Lightning_Big_KEY_INIT			(C_ParticleFXEmitKey)
// 				{
// 						visName_S 			= "MFX_Lightning_Big_INIT";		
// 				};
// 				
// 				INSTANCE spellFX_Lightning_Big_KEY_INVEST_1		(C_ParticleFXEmitKey)
// 				{
// 						visName_S 			= "MFX_LIGHTNING_BIG_INVEST";
// 						emtrjmode_s 		= "TARGET LINE RANDOM";
// 						emtrjeasevel 			= 3000.;
// 						emCreateFXID = 	"FX_EarthQuake";
// 						lightPresetname 		= "WHITEBLEND";
// 						lightRange	= 6000;
// 						sfxID 	=	"MFX_Lightning_Big_Init";
// 						sfxisambient	= 1;
// 						emCreateFXID		= "spellFX_Lightning_Big_LEFTHAND";
// 						
// 				};
// 				
// 			INSTANCE spellFX_Lightning_Big_KEY_CAST	(C_ParticleFXEmitKey)
// 				{
// 						emCreateFXID		= "spellFX_Lightning_Big_RAIN";
// 						pfx_ppsIsLoopingChg = 1;
// 		};
// 		
// 		INSTANCE spellFX_Lightning_Big_RAIN		(CFx_Base_Proto)
// 		{
// 				visname_S 				= "MFX_LIGHTNING_BIG_RAIN";		
// 				emtrjmode_s 			= "FIXED";
// 				emTrjOriginNode 		= "ZS_RIGHTHAND";
// 				emActionCollDyn_S		= "CREATEONCE";
// 		     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
// 		     	emCheckCollision		= 1;
// 		     	LightPresetName 		= "WHITEBLEND";
// 		     	sfxisambient			= 1;
// 				sfxID 	=	"MFX_Lightning_Big_Cast";	
// 						
// 		};
// 		instance spellFX_Lightning_Big_COLLIDE		(CFx_Base_Proto)
// 		{
// 				visname_S 			= "MFX_LIGHTNING_BIG_COLLIDE";
// 				visAlpha			= 1;
// 				lightPresetname   	= "WHITEBLEND";
// 				emtrjeasevel 			= 0.000001;
// 					sfxID 	=	"MFX_Lightning_Big_Origin";
// 		};		
// 		
// 		instance spellFX_Lightning_Big_SENDPERCEPTION	(CFx_Base_Proto)
// 		{
// 				visname_S 			= "MFX_LIGHTNING_BIG_COLLIDE";
// 				visAlpha			= 1;
// 				lightPresetname   	= "WHITEBLEND";
// 				sendassessmagic		= 1;
// 					sfxID 	=	"MFX_Lightning_Big_Origin";
// 		};
// 		instance spellFX_Lightning_Big_LEFTHAND	(CFx_Base_Proto)
// 		{
// 				visname_S 			= "MFX_LIGHTNING_BIG_HEAD";
// 				visAlpha			= 1;
// 		
// 				emtrjmode_s 		= "FIXED";
// 				emTrjOriginNode 	= "BIP01 Head";
// 		
// 		
// 		};

				
INSTANCE spellFX_Lightning	(CFx_Base_Proto)
{
		visName_S 			= "MFX_Lightning_Origin";
		visSize_S 			= "40 40";
		visAlphaBlendFunc_S = "ADD";
		visTexAniFPS 		= 17;
		visTexAniIsLooping 	= 1;
		
		emtrjmode_s 		= "FIXED";
		emtrjNumKeys    	= 4;
		emtrjnumkeysvar 	= 1;
		emtrjangleelevvar 	= 20.;
		emtrjangleheadvar 	= 20.;
		emtrjloopmode_s 	= "PINGPONG";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.3;
		emselfrotvel_s 		= "0 0 50";
		emTrjTargetRange	= 20;
		emTrjTargetElev 	= 0;
		};

		INSTANCE spellFX_Lightning_KEY_INIT			(C_ParticleFXEmitKey)
		{
				visName_S 			= "MFX_Lightning_Origin";		
		};
		
		INSTANCE spellFX_Lightning_KEY_INVEST_1		(C_ParticleFXEmitKey)
		{
				visName_S 			= "Lightning_Single.ltn";
				emtrjmode_s 		= "TARGET LINE RANDOM";
				emtrjeasevel 			= 3000.;
		};
		
		INSTANCE spellFX_Lightning_KEY_CAST			(C_ParticleFXEmitKey)
		{
				
};
		
		
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  C H A I N - L I G H T N I N G  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_ChainLightning(CFx_Base_Proto)
{
		visName_S 			= "lightning_big_a0.tga";
		visSize_S 			= "3 3";
		visAlphaBlendFunc_S = "ADD";
		visTexAniFPS 		= 17;
		visTexAniIsLooping 	= 1;
		
		emFXCreate_S 		= "spellFX_ChainLightning_Origin";
		emtrjmode_s 		= "FIXED";
		emtrjNumKeys    	= 12;
		emtrjnumkeysvar 	= 3;
		emtrjangleelevvar 	= 20.;
		emtrjangleheadvar 	= 20.;
		emtrjloopmode_s 	= "none";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 200000.0;
		emselfrotvel_s 		= "0 0 50";
		emTrjTargetRange	= 20;
		emTrjTargetElev 	= 0;
		
};
		

INSTANCE spellFX_ChainLightning_ORIGIN	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Lightning_Origin";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		lightPresetname   		= "AURA";
		};

		INSTANCE spellFX_ChainLightning_Origin_KEY_OPEN			(C_ParticleFXEmitKEy)
		{
				LightRange	= 0.01;
		};

		INSTANCE spellFX_ChainLightning_Origin_KEY_INIT			(C_ParticleFXEmitKEy)
		{
				LightRange	= 0.01;
		};
		
		INSTANCE spellFX_ChainLightning_Origin_KEY_INVEST_1		(C_ParticleFXEmitKey)
		{
				sfxID			= "MFX_Lightning_Origin";
				LightRange	= 200;
};

instance runeFX_ChainLightning_COLLIDE		(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_Collide_RS";
		visAlpha				= 1;
		emTrjOriginNode			= "BIP01";
		emtrjmode_s 			= "FIXED";
		lightPresetname   		= "FIRESMALL";	
		sfxid			= "MFX_Lightning_Target";
	 	sfxisambient	= 1;
		SendAssessMagic	= 1;
		
};					

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T H U N D E R B O L T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Thunderbolt	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Thunderebolt_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATE";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Thunderbolt_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Thunderbolt_SENDPERCEPTION";		
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;

		//visAlpha				= 0;
		
		};

		INSTANCE spellFX_Thunderbolt_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Thunderbolt_INIT";
				scaleDuration			= 0.5;
		};
		
		INSTANCE spellFX_Thunderbolt_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_Thunderbolt_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "MFX_Thunderbolt_Cast";
	 			emCheckCollision		= 1;
				//emCreateFXID 			= "FX_CAST2";
		};

		INSTANCE spellFX_Thunderbolt_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
	 			emCheckCollision		= 0;
};

instance spellFX_Thunderbolt_COLLIDE		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Thunderbolt_Collide";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		sfxid			= "Torch_Enlight";
};

instance spellFX_Thunderbolt_SENDPERCEPTION		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Thunderbolt_Collide";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		sfxid			= "Torch_Enlight";
		SendAssessMagic	= 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T H U N D E R B A L L  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Thunderball	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Thunderball_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Thunderball_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Thunderspell_TARGET";
		emFXCollStatAlign_S		= "COLLISIONNORMAL";
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "100 100";
		userString[2]			= "MUL";
		lightPresetname   		= "AURA";	
		
		};

		INSTANCE spellFX_Thunderball_KEY_OPEN(C_ParticleFXEmitKey)
		{
				visname_S 		= "MFX_Thunderball_INIT";
				lightrange		= 0.01;
		};

		INSTANCE spellFX_Thunderball_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 		= "MFX_Thunderball_INIT";
				lightrange		= 0.01;
		};
		
		INSTANCE spellFX_Thunderball_KEY_INVEST_1 (C_ParticleFXEmitKey)
		{	
				visname_S 		= "MFX_Thunderball_INVEST";
				emCreateFXID	= "spellFX_Thunderball_InVEST_BLAST1";
				lightrange		= 50;
				sfxid			= "MFX_Thunderball_invest1";
				sfxisambient	= 1;
		}								;
		INSTANCE spellFX_Thunderball_KEY_INVEST_2 (C_ParticleFXEmitKey)
		{	
				visname_S 		= "MFX_Thunderball_INVEST_L2";	
				emCreateFXID	= "spellFX_Thunderball_InVEST_BLAST2";
				sfxid			= "MFX_Thunderball_invest2";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_Thunderball_KEY_INVEST_3 (C_ParticleFXEmitKey)
		{
				visname_S 		= "MFX_Thunderball_INVEST_L3";	
				emCreateFXID	= "spellFX_Thunderball_InVEST_BLAST3";
				sfxid			= "MFX_Thunderball_invest3";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_Thunderball_KEY_INVEST_4 (C_ParticleFXEmitKey)
		{	
				visname_S 		= "MFX_Thunderball_INVEST_L4";	
				emCreateFXID	= "spellFX_Thunderball_InVEST_BLAST4";
				sfxid			= "MFX_Thunderball_invest4";
				sfxisambient	= 1;
		};
		
		
		INSTANCE spellFX_Thunderball_KEY_CAST (C_ParticleFXEmitKey)
		{
				lightrange		= 200;
				visname_S 		= "MFX_Thunderball_CAST";		
				emtrjmode_s 	= "TARGET";
		     	emtrjeasevel 	= 1400.;
	 			sfxid			= "MFX_Thunderball_Cast";
	 			sfxisambient	= 1;
	 			emCheckCollision = 1;
		};

		INSTANCE spellFX_Thunderball_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s= "0 0.0002 0";
		     	emtrjeasevel 	= 0.000001;
};

instance spellFX_Thunderball_InVEST_BLAST1		(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_INVEST_BLAST";
		visAlpha				= 1;
		emtrjmode_s 			= "FIXED";
		//lightPresetname 		= "WHITEBLEND";	
		sfxid					= "MFX_Thunderball_invest1";
		sfxisambient			= 1;
		visAlpha 				= 0.3;
};

instance spellFX_Thunderball_InVEST_BLAST2	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_INVEST_BLAST";
		visAlpha				= 1;
		emtrjmode_s 			= "FIXED";
		//lightPresetname 		= "WHITEBLEND";	
		sfxid					= "MFX_Thunderball_invest2";
		sfxisambient			= 1;
		visAlpha 				= 0.5;
};

instance spellFX_Thunderball_InVEST_BLAST3		(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_INVEST_BLAST";
		visAlpha				= 1;
		emtrjmode_s 			= "FIXED";
		//lightPresetname 		= "WHITEBLEND";	
		sfxid					= "MFX_Thunderball_invest3";
		sfxisambient			= 1;
		visAlpha 				= 0.8;
};

instance spellFX_Thunderball_InVEST_BLAST4		(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_INVEST_BLAST";
		visAlpha				= 1;
		emtrjmode_s 			= "FIXED";
		//lightPresetname 		= "WHITEBLEND";	
		sfxid					= "MFX_Thunderball_invest4";
		sfxisambient			= 1;
		visAlpha 				= 1;
};

// KOLLISION MIT STATISCHER WELT:  KEINE PERCEPTION

instance spellFX_Thunderball_COLLIDE		(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_Collide1";
		visAlpha				= 1;
		emTrjOriginNode			= "BIP01";
		emtrjmode_s 			= "FIXED";
		lightPresetname   		= "FIRESMALL";	
		
};
instance runeFX_Thunderball_COLLIDE		(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_Collide1";
		visAlpha				= 1;
		emTrjOriginNode			= "BIP01";
		emtrjmode_s 			= "FIXED";
		lightPresetname   		= "FIRESMALL";	
		sfxid			= "MFX_Thunderball_Cast";
	 	sfxisambient	= 1;
		SendAssessMagic	= 1;
};		

INSTANCE spellFX_Thunderball_COLLIDE_KEY_INVEST_1	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Thunderball_Collide1";		sfxid	= "MFX_Thunderball_Collide1";		};
INSTANCE spellFX_Thunderball_COLLIDE_KEY_INVEST_2	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Thunderball_Collide2";		sfxid	= "MFX_Thunderball_Collide2";		};
INSTANCE spellFX_Thunderball_COLLIDE_KEY_INVEST_3	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Thunderball_Collide3";		sfxid	= "MFX_Thunderball_Collide3";		};
INSTANCE spellFX_Thunderball_COLLIDE_KEY_INVEST_4	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Thunderball_Collide4";		sfxid	= "MFX_Thunderball_Collide4";		};


///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  I C E C U B E  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_IceCube	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Icecube_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_IceCube_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Icespell_TARGET";		
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		
		emFXInvestOrigin_S		= "spellFX_Icespell_Invest";
		//visAlpha				= 0;
		
		lightPresetname   		= "AURA";
		};

		INSTANCE spellFX_IceCube_KEY_OPEN(C_ParticleFXEmitKey)
		{
				Lightrange				= 0.01;
		};

		INSTANCE spellFX_IceCube_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_Icecube_INIT";
				Lightrange				= 0.01;
				scaleDuration			= 0.5;
		};
		
		INSTANCE spellFX_IceCube_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_ICECUBE_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			emCheckCollision		= 1;
	 			sfxid					= "MFX_Icecube_cast";
	 			sfxisambient			= 1;
				//emCreateFXID 			= "FX_CAST2";
				Lightrange				= 200;
		};

		INSTANCE spellFX_IceCube_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	emtrjeasevel 			= 0.000001;
	 			//emCheckCollision		= 0;
};

instance spellFX_IceCube_COLLIDE		(CFx_Base_Proto)
{
		visname_S 			= "MFX_ICESPELL_Collide";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		sfxid				= "MFX_ICECUBE_COLLIDE";
		SendAssessMagic	= 1;

};

instance spellFX_Icespell_Invest		(CFx_Base_Proto)
{
		visname_S 			= "";
		emtrjmode_s 		= "FIXED";
		sfxid				= "MFX_ICECUBE_INVEST";
		sfxisambient		= 1;
};




///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  I C E W A V E  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Icewave(CFx_Base_Proto)
{

     	visname_S 			= "MFX_IceCUBE_INIT";		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	
     	emFXInvestOrigin_S		= "spellFX_Icespell_Invest";
     	};

		INSTANCE spellFX_Icewave_KEY_INIT(C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_IceCUBE_INIT";		
		};

		INSTANCE spellFX_Icewave_KEY_CAST(C_ParticleFXEmitKey)
		{
				emCreateFXID		= "spellFX_Icewave_WAVE";
				pfx_ppsIsLoopingChg = 1;
				sfxid				= "MFX_Icewave_Cast";
				sfxisambient		= 1;				
};

INSTANCE spellFX_Icewave_WAVE	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Icewave_WAVE";		
		emTrjOriginNode 		= "ZS_RIGHTHAND";
		emActionCollDyn_S		= "CREATEONCE";
     	emFXCollDyn_S			= "spellFX_IceSpell_TARGET";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     	emCheckCollision		= 1;
     	LightPresetName			= "WHITEBLEND";
};


INSTANCE spellFX_IceWave_WAVE_KEY_OPEN		(C_ParticleFXEmitKey)
{
		LightRange			= 0.01;
};

INSTANCE spellFX_IceWave_WAVE_KEY_INIT		(C_ParticleFXEmitKey)
{
		LightRange			= 0.01;
};


INSTANCE spellFX_IceWave_WAVE_KEY_CAST		(C_ParticleFXEmitKey)
{
		LightRange			= 200;
};



INSTANCE spellFX_Icewave_SUB(CFx_Base_Proto)		// vorrübergehend, bis er hardcodiert nicht mehr gesucht wird
{
     	visname_S 				= "";
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01 HEAD";
};
	
		
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   D E M O N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


instance spellFX_Demon  (CFx_Base_Proto)
{
		visname_S 		= "MFX_Summondemon_INIT";
		visAlpha		= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		LightPresetname 	= "REDAMBIENCE";	//ToDo: "REDAMBIENCE"
		
		emFXInvestOrigin_S	= "spellFX_Demon_INVEST";
		
		};
		
		instance spellFX_Demon_KEY_OPEN(C_ParticleFXEmitKey)
		{	
				LightRange = 0.01;
		};


		instance spellFX_Demon_KEY_INIT		(C_ParticleFXEmitKey)
		{	
				LightRange = 0.01;
		};
		
		instance spellFX_Demon_KEY_INVEST_1 (C_ParticleFXEmitKey) {	LightRange = 400;	};		
		instance spellFX_Demon_KEY_INVEST_2 (C_ParticleFXEmitKey) {};
		instance spellFX_Demon_KEY_INVEST_3 (C_ParticleFXEmitKey) {		emCreateFXID = 	"FX_EarthQuake";	};

		instance spellFX_Demon_KEY_CAST		(C_ParticleFXEmitKey)
		{	
			//emCreateFXID		= "spellFX_Demon_ORIGIN";
			pfx_ppsisloopingchg = 1;
};

INSTANCE spellFX_Demon_INVEST	(CFx_Base_Proto)
{
		visname_S 				= "MFX_SummonDemon_Invest";		
		emTrjOriginNode 		= "Bip01";
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   S K E L E T O N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


instance spellFX_Skeleton  (CFx_Base_Proto)
{
		visname_S 			= "MFX_Summondemon_INIT";
		visAlpha			= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		LightPresetname 	= "REDAMBIENCE";	
		
		emFXInvestOrigin_S	= "spellFX_Demon_INVEST";
		
		};
		
		instance spellfx_skeleton_KEY_OPEN(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};
		
		instance spellfx_skeleton_KEY_INIT		(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};
		
		instance spellFX_skeleton_KEY_INVEST_1 (C_ParticleFXEmitKey) {	LightRange = 400;	};		
		instance spellFX_skeleton_KEY_INVEST_2 (C_ParticleFXEmitKey) {};
		instance spellFX_skeleton_KEY_INVEST_3 (C_ParticleFXEmitKey) {		emCreateFXID = 	"FX_EarthQuake";	};

		
		instance spellFX_Skeleton_KEY_CAST		(C_ParticleFXEmitKey)
		{	
				//emCreateFXID		= "spellFX_Demon_ORIGIN";
				pfx_ppsisloopingchg = 1;
				LightRange = 200;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   G O L E M  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



instance spellFX_Golem	(CFx_Base_Proto)
{
		visname_S 		= "MFX_Summondemon_INIT";
		visAlpha		= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		LightPresetname 	= "REDAMBIENCE";
		
		emFXInvestOrigin_S	= "spellFX_Demon_INVEST";
		
		};
		

		instance spellFX_Golem_KEY_OPEN(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};

		instance spellFX_Golem_KEY_INIT		(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};
		
		instance spellFX_Golem_KEY_INVEST_1 (C_ParticleFXEmitKey) {		LightRange = 400;	};		
		instance spellFX_Golem_KEY_INVEST_2 (C_ParticleFXEmitKey) {};
		instance spellFX_Golem_KEY_INVEST_3 (C_ParticleFXEmitKey) {		emCreateFXID = 	"FX_EarthQuake";	};

		instance spellFX_Golem_KEY_CAST		(C_ParticleFXEmitKey)
		{	
				//emCreateFXID		= "spellFX_Golem_ORIGIN";
				pfx_ppsisloopingchg = 1;
				LightRange = 200;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  A R M Y   O F   D A R K N E S S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

instance spellFX_ArmyOfDarkness		(CFx_Base_Proto)
{
		visname_S 			= "MFX_Summondemon_INIT";
		visAlpha			= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		LightPresetname 	= "REDAMBIENCE";
		
		emFXInvestOrigin_S	= "spellFX_Demon_INVEST";
		
		};
		
		instance spellFX_ArmyOfDarkness_KEY_OPEN(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};

		instance spellFX_ArmyOfDarkness_KEY_INIT		(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};
		
		instance spellFX_ArmyOfDarkness_KEY_INVEST_1 (C_ParticleFXEmitKey) {		LightRange = 400;		};		
		instance spellFX_ArmyOfDarkness_KEY_INVEST_2 (C_ParticleFXEmitKey) {};
		instance spellFX_ArmyOfDarkness_KEY_INVEST_3 (C_ParticleFXEmitKey) {		emCreateFXID = 	"FX_EarthQuake";	};
		
		instance spellFX_ArmyOfDarkness_KEY_CAST		(C_ParticleFXEmitKey)
		{	
			emCreateFXID		= "spellFX_ArmyOfDarkness_ORIGIN";
			pfx_ppsisloopingchg = 1;
};
		
instance spellFX_ArmyOfDarkness_ORIGIN  (CFx_Base_Proto)
{
		visname_S 		= "MFX_Summondemon_INVEST";
		visAlpha		= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 L FOOT";
};



///   													XXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  M A S S D E A T H  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_MassDeath(CFx_Base_Proto)
{

     	visname_S 				= "MFX_MassDeath_INIT";		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
		emFXInvestOrigin_S	   	= "spellFX_Massdeath_INITGLOW";
		emFXCreatedOwnTrj 		= 0; 
		
		};

		INSTANCE spellFX_MassDeath_KEY_INIT(C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_MassDeath_INIT";		
		};

		INSTANCE spellFX_MassDeath_KEY_CAST(C_ParticleFXEmitKey)
		{
				emCreateFXID		= "spellFX_MassDeath_GROUND";
				pfx_ppsIsLoopingChg = 1;
};

INSTANCE spellFX_MassDeath_GROUND		(CFx_Base_Proto)
{
		visname_S 				= "MFX_MassDeath_CAST";		
		emTrjOriginNode 		= "BIP01 R Foot";
		emActionCollDyn_S		= "CREATEONCE";
     	emFXCollDyn_S			= "spellFX_MassDeath_Target";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     	emCheckCollision		= 1;
     	LightPresetName			= "REDAMBIENCE";
     	sfxid					= "MFX_Massdeath_Cast";
		sfxisambient			= 1;
};



INSTANCE spellFX_MassDeath_SUB(CFx_Base_Proto)		// vorrübergehend, bis er hardcodiert nicht mehr gesucht wird
{
     	visname_S 				= "";
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01 HEAD";
};
	
		
INSTANCE spellFX_MassDeath_Target(CFx_Base_Proto)
{
		visname_S 				= "MFX_Massdeath_TARGET";
		emTrjOriginNode 		= "BIP01";
		emFXCreatedOwnTrj 	= 1;
		emtrjmode_s 			= "FIXED";
		sfxid					= "MFX_MassdeatH_Target";
		sendassessmagic			= 1;
};

INSTANCE spellFX_MassDeath_INITGLOW	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Massdeath_INIT_GLOW";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
		emFXCreatedOwnTrj 		= 0;
		emtrjmode_s 			= "FIXED";
		LightPresetName			= "REDAMBIENCE";
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  D E S T R O Y   U N D E A D  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



INSTANCE spellFX_DestroyUndead(CFx_Base_Proto)
{

     	visname_S 				= "MFX_DestroyUndead_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATE";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Destroyundead_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Destroyundead_SENDPERCEPTION";		
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		};

		INSTANCE spellFX_DestroyUndead_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_DestroyUndead_INIT";
		};
		
		INSTANCE spellFX_DestroyUndead_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_DestroyUndead_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 800.;
	 			sfxid					= "MFX_DestroyUndead_Cast";
	 			sfxisambient			= 1;
				//emCreateFXID 			= "FX_CAST2";
				emCheckCollision 		= 1;
};


INSTANCE spellFX_Destroyundead_COLLIDE		(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01";
	visname_S 			= "MFX_DESTROYUNDEAD_COLLIDE";
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	lightpresetname		= "AURA";
	sfxid				= "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient		= 1;
}; 

INSTANCE spellFX_Destroyundead_SENDPERCEPTION	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01";
	visname_S 			= "MFX_DESTROYUNDEAD_COLLIDE";
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	lightpresetname		= "AURA";
	sendassessmagic		= 1;
	sfxid				= "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient		= 1;
}; 


///   													XXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  W I N D F I S T   XX
///   													XXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_WindFist(CFx_Base_Proto)
{
		visname_S 			= "MFX_WINDFIST_INIT";
		vissize_s				= "1 1";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjnumkeys 		= 7;
		emtrjnumkeysvar 	= 3;
		emtrjangleelevvar 	= 5.;
		emtrjangleheadvar 	= 20.;
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 200000;
		emTrjTargetRange	= 100;
		emTrjTargetElev 	= 1;
		emActionCollDyn_S 	= "CREATEONCE";
		emFXCollDyn_S	   	= "spellFX_Windfist_Target";	//Sendet perception
		emFXInvestOrigin_S	= "spellFX_Windfist_Invest";
		
		
		};
		
		INSTANCE spellFX_WINDFIST_KEY_INIT (C_ParticleFXEmitKey)
		{
				emCheckCollision	= 0;
		};
		
		INSTANCE spellFX_Windfist_KEY_INVEST_1	(C_ParticleFXEmitKey)	{	emCreateFXID	= "spellFX_Windfist_INVESTBLAST";	};
		INSTANCE spellFX_Windfist_KEY_INVEST_2	(C_ParticleFXEmitKey)	{	emCreateFXID	= "spellFX_Windfist_INVESTBLAST";	};
		INSTANCE spellFX_Windfist_KEY_INVEST_3	(C_ParticleFXEmitKey)	{	emCreateFXID	= "spellFX_Windfist_INVESTBLAST";	};
		INSTANCE spellFX_Windfist_KEY_INVEST_4	(C_ParticleFXEmitKey)	{	emCreateFXID	= "spellFX_Windfist_INVESTBLAST";	};
		
		
		INSTANCE spellFX_WINDFIST_KEY_CAST	 (C_ParticleFXEmitKey)
		{
				visname_S 				= "simpleglow.tga";
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			emCheckCollision		= 1;
				emCreateFXID			= "spellFX_WINDFIST_CAST";
};
		

INSTANCE spellFX_Windfist_Invest (CFx_Base_Proto)
{
		visname_S			= "MFX_WINDFIST_INVEST";
		sfxid				= "MFX_WINDFIST_INVEST";
		sfxisambient		= 1;
};

INSTANCE spellFX_Windfist_INVESTBLAST	(CFX_Base_Proto)
{
		visname_S			= "MFX_WINDFIST_INVEST_BLAST";
		sfxid				= "MFX_WINDFIST_INVESBLASTT";
		sfxisambient		= 1;
};


INSTANCE spellFX_Windfist_Cast (CFx_Base_Proto)
{
		visname_S			= "MFX_WINDFIST_Cast";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		sfxid				= "MFX_Windfist_Cast";
		sfxisambient		= 1;
};


INSTANCE spellFX_Windfist_Target (CFx_Base_Proto)	//Sendet perception
{
		visname_S			= "MFX_WINDFIST_COLLIDE";
		sendassessmagic		= 1;
};
INSTANCE runeFX_Windfist_Target (CFx_Base_Proto)	//Sendet perception
{
		visname_S			= "MFX_WINDFIST_Cast";
		sfxid				= "MFX_Windfist_Cast";	
		sfxisambient		= 1;			
		sendassessmagic		= 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S T O R M F I S T   XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Stormfist	(CFx_Base_Proto)
{
		visname_S 			= "MFX_WINDFIST_INIT";
		vissize_s			= "1 1";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjnumkeys 		= 7;
		emtrjnumkeysvar 	= 3;
		emtrjangleelevvar 	= 5.;
		emtrjangleheadvar 	= 20.;
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 200000;
		emTrjTargetRange	= 100;
		emTrjTargetElev 	= 1;
		
		emActionCollDyn_S 	= "CREATEONCE";
		emFXCollDyn_S	   	= "spellFX_Windfist_Target";
		emFXInvestOrigin_S	= "spellFX_Windfist_Invest";
		};
		
		INSTANCE spellFX_Stormfist_KEY_INIT (C_ParticleFXEmitKey)
		{
				emCheckCollision	= 0;
		};
		
		INSTANCE spellFX_Stormfist_KEY_CAST	 (C_ParticleFXEmitKey)
		{
				visname_s			= "MFX_STORMFIST_CAST";
				emcheckcollision	= 1;
				sfxid				= "MFX_Stormfist_Cast";
				sfxisambient		= 1;
};
		

INSTANCE spellFX_Stormfist_Invest (CFx_Base_Proto)
{
		visname_S			= "MFX_WINDFIST_INVEST";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
};


/* INSTANCE spellFX_Stormfist_Cast (CFx_Base_Proto)
{
		visname_S			= "MFX_STORMFIST_Cast";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		sfxid				= "MFX_Stormfist_Cast";
		sfxisambient		= 1;
}; */


/* INSTANCE spellFX_Stormfist_SUB(CFx_Base_Proto)		// vorrübergehend, bis er hardcodiert nicht mehr gesucht wird
{
     	visname_S 				= "";
     	emtrjmode_s 			= "TARGET LINE";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
		emtrjeasevel			= 0.01;
		emActionCollDyn_S 	= "CREATEONCE";
		emFXCollDyn_S	   	= "spellFX_Windfist_Target";
		emFXInvestOrigin_S	= "spellFX_Windfist_Invest";
		};
		
		INSTANCE spellFX_Stormfist_SUB_KEY_CAST	(C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_STORMFIST_CAST";
				emtrjeasevel			= 1000;
				emCheckCollision		= 1;
};*/





///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T E L E K I N E S I S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_telekinesis(CFx_Base_Proto)
{
		visname_S 			= "MFX_Telekinesis_INIT";
		emtrjmode_s 		= "TARGET";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjnumkeys 		= 2;
		emtrjnumkeysvar 	= 1;
		emtrjangleelevvar 	= 2.;
		emtrjangleheadvar 	= 0.;
		emtrjeasefunc_s 	= "LINEAR";
		emtrjloopmode_s 	= "HALT";
		emtrjdynupdatedelay = 0.;
		emFXInvestOrigin_S 	= "spellFX_Telekinesis_ORIGIN";
		//emFXInvestTarget_S 	= "spellFX_Telekinesis_TARGET";
		//lightPresetname 	= "POISON";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
};

INSTANCE spellFX_telekinesis_KEY_INIT (C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_INIT";
		emtrjeasevel	  	= 0.01;
};

INSTANCE spellFX_telekinesis_KEY_INVEST_1	(C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_TARGET";
		emtrjeasevel	  	= 2000;
		sfxid				= "MFX_TELEKINESIS_STARTINVEST";
		sfxisambient		= 1;
};


INSTANCE spellFX_telekinesis_KEY_CAST	(C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_TargetEnd";
		
};

/*INSTANCE spellFX_telekinesis_KEY_STOP (C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_TargetEnd";
		
};*/

INSTANCE spellFX_telekinesis_Origin		(CFx_Base_Proto)
{
		visname_S 			= "MFX_Telekinesis_BRIDGE";
		emtrjmode_s 		= "TARGET LINE";
		emtrjeasevel	  	= 0.0001;
		emTrjOriginNode 	= "BIP01 R Hand";
		emtrjdynupdatedelay = 0.;
		lightPresetname 	= "AURA";
		sfxid				= "MFX_TELEKINESIS_INVEST";
		sfxisambient		= 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  M A S T E R   T E L E K I N E S I S  XX		// kann auch NPCs anheben
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


/* INSTANCE spellFX_telekinesis2(CFx_Base_Proto)
{
	visname_S 			= "spell_telekinesis";
	emtrjmode_s 		= "FIXED";
	emTrjOriginNode 	= "ZS_RIGHTHAND";
	emtrjnumkeys 		= 2;
	emtrjnumkeysvar 	= 1;
	emtrjangleelevvar 	= 2.;
	emtrjangleheadvar 	= 0.;
	emtrjeasefunc_s 	= "PINGPONG";
	emtrjdynupdatedelay = 0.;
	emFXInvestOrigin_S 	= "FX_telekinesis_origin";
	emFXInvestTarget_S 	= "FX_telekinesis_target";
	lightPresetname 	= "POISON";
	emTrjTargetRange	= 0;
	emTrjTargetElev 	= 0;
};

INSTANCE spellFX_telekinesis2_KEY_INVEST_1(C_ParticleFXEmitKey)
{
	pfx_dirmode_s 		= "TARGET";
	emtrjeasevel	  	= 700.;
	pfx_velAvg    		= 0.4;
	emCreateFXID 		= "FX_CAST3";
	emCheckCollision 	= 0;
	//sfxid			  = "telekinesis_CAST";
};

INSTANCE spellFX_telekinesis2_KEY_CAST (C_ParticleFXEmitKey)
{
	pfx_ppsIsLoopingChg = 1;
}; */

///   													XXXXXXXXXXXXXXXXXX
///   													XX  C H A R M   XX
///   													XXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Charm	(CFx_Base_Proto)
{
		visname_S 			= "MFX_CHARM_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.;
				
		//emFXInvestOrigin_S 	= "spellFX_Sleep_ORIGIN";
		
		};
		
		INSTANCE spellFX_Charm_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_CHARM_ORIGIN";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
		     	sfxid					= "MFX_Charm_Cast";
		     	sfxisambient			= 1;
				//emCreateFXID 			= "FX_CAST2";
};



///   													XXXXXXXXXXXXXXXXX
///   													XX  S L E E P  XX
///   													XXXXXXXXXXXXXXXXX


INSTANCE spellFX_Sleep	(CFx_Base_Proto)
{
		visname_S 			= "MFX_SLEEP_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.;
				
		//emFXInvestOrigin_S 	= "spellFX_Sleep_ORIGIN";
		//emFXInvestTarget_S 	= "spellFX_Sleep_TARGET";
		
		};
		
		INSTANCE spellFX_Sleep_KEY_INIT	(C_ParticleFXEmitKey)
		{
				visname_S				= "MFX_SLEEP_INIT";
		};
		
		INSTANCE spellFX_Sleep_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_SLEEP_ORIGIN";		
				//emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
		     	sfxid					= "MFX_Sleep_Cast";
		     	
				//emCreateFXID 			= "FX_CAST2";
};


		
instance spellFX_Sleep_ORIGIN	(CFx_Base_Proto)
{
		visname_S 		= "MFX_SLEEP_ORIGIN";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
	
		//sendAssessMagic	= 1;
};

instance spellFX_Sleep_TARGET	(CFx_Base_Proto)
{
		lightPresetname 	= "AURA";
		visname_S 		= "MFX_SLEEP_TARGET";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01";
		emtrjdynupdatedelay 	= 0;
	
		//sendAssessMagic	= 1;
};
instance RuneFX_Sleep_TARGET	(CFx_Base_Proto)
{
		lightPresetname 	= "AURA";
		visname_S 		= "MFX_SLEEP_TARGET";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01";
		emtrjdynupdatedelay 	= 0;
		sfxid					= "MFX_Sleep_Cast";
		sendAssessMagic	= 1;
};
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  P Y R O K I N E S I S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX



INSTANCE spellFX_Pyrokinesis(CFx_Base_Proto)
{
		visname_S 		= "MFX_Pyrokinesis_INIT";
		visAlpha		= 1;
		
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjtargetnode 	= "BIP01 HEAD";
		emtrjnumkeys 		= 1;
		emtrjnumkeysvar 	= 1;
		emtrjangleelevvar 	= 15.;
		emtrjangleheadvar 	= 0.;
		emtrjdynupdatedelay 	= 0.;
		emFXInvestTarget_S 	= "spellFX_Pyrokinesis_target";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
		};

		INSTANCE spellFX_Pyrokinesis_KEY_CAST (C_ParticleFXEmitKey)
		{
				pfx_ppsIsLoopingChg = 1; 			
};

INSTANCE spellFX_Pyrokinesis_TARGET(CFx_Base_Proto)
{
	visname_S 		= "MFX_Pyrokinesis_TARGET";
	
	emtrjmode_s 		= "FIXED";
	emTrjOriginNode 	= "BIP01 HEAD";
	lightPresetname 	= "FIRESMALL";
	emTrjTargetRange	= 0;
	emTrjTargetElev 	= 0;
	sendAssessMagic		= 1;
	emtrjdynupdatedelay = 0.01;
	
	sfxid				= "MFX_Pyrokinesis_target";
	sfxisambient		= 1;
};

INSTANCE RuneFX_Pyrokinesis_TARGET(CFx_Base_Proto)
{
	visname_S 		= "MFX_Pyrokinesis_TARGET";
	
	emtrjmode_s 		= "FIXED";
	emTrjOriginNode 	= "BIP01 HEAD";
	lightPresetname 	= "FIRESMALL";
	emTrjTargetRange	= 0;
	emTrjTargetElev 	= 0;
	sendAssessMagic		= 1;
	emtrjdynupdatedelay = 0.01;
	emfxlifespan = 3;	
	
	sfxid				= "MFX_Pyrokinesis_target";
	sfxisambient		= 1;
};


///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  C O N T R O L  XX
///   													XXXXXXXXXXXXXXXXXXXXX




INSTANCE spellFX_Control(CFx_Base_Proto)
{
		visName_S			=  "MFX_CONTROL_INIT";
		vissize_s			= "1 1";
		
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjtargetnode 	= "BIP01 HEAD";
		emtrjloopmode_s 	= "none";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.;
		//lightPresetname 	= "POISON";
		//emselfrotvel_s 	= "0 0 50";
		emTrjTargetRange 	= 0;
		emTrjTargetElev  	= 0;
		
		emFXInvestTarget_S 	= "spellFX_Control_TARGET";	
		emFXInvestOrigin_S	= "spellFX_Control_BRIDGE";
		};

		INSTANCE spellFX_Control_KEY_INVEST_1	(C_ParticleFXEmitKey)
		{
				visname_s	= "simpleglow.tga";
				sfxid		= "MFX_CONTROL_STARTINVEST";
				sfxisambient= 1;
				
		};
		
		INSTANCE spellFX_Control_KEY_CAST		(C_ParticleFXEmitKey)
		{
				pfx_ppsIsLoopingChg 	= 1;
				emCreateFXID			= "CONTROL_CASTBLEND";
				sfxid					= "MFX_CONTROL_CAST";
				sfxisambient			= 1;
};

INSTANCE spellFX_Control_TARGET(CFx_Base_Proto)
{
		visname_S 			= "MFX_CONTROL_TARGET";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 HEAD";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
		sendAssessMagic		= 1;
};

INSTANCE spellFX_Control_BRIDGE	(CFx_Base_Proto)
{
		visname_S 			= "MFX_CONTROL_BRIDGE";
		
		emtrjmode_s 		= "TARGET LINE";
		emTrjOriginNode 	= "BIP01 HEAD";
		emtrjtargetnode 	= "BIP01 HEAD";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
		emFXCreate_S		= "spellFX_Control_ORIGIN";
		
		sfxid				= "MFX_CONTROL_INVEST";
		sfxisambient		= 1;
		
		};
		
		INSTANCE spellFX_Control_BRIDGE_KEY_INIT	(C_ParticleFXEmitKey)
		{
				emtrjeasevel	= 0.01;
};



/* INSTANCE spellFX_Control_ORIGIN	(CFx_Base_Proto)
{
		visname_S 			= "MFX_CONTROL_ORIGIN";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 HEAD";
		emtrjtargetnode 	= "BIP01 HEAD";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
}; */



///   													XXXXXXXXXXXXXXX
///   													XX  F E A R  XX
///   													XXXXXXXXXXXXXXX


INSTANCE spellFX_Fear(CFx_Base_Proto)
{
		visname_S 			= "MFX_FEAR_INIT";
		emtrjmode_s 		= "FIXED";
		emtrjeasefunc_s 	= "linear";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay = 10000;
		};
	
		INSTANCE spellFX_Fear_KEY_OPEN (C_ParticleFXEmitKey)
		{
		     	emtrjeasevel 	= 0.;
		};
		
		INSTANCE spellFX_Fear_KEY_INVEST_1	(C_ParticleFXEmitKey)
		{
				emCreateFXID	= "FX_EarthQuake";
		};
		
		INSTANCE spellFX_Fear_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_s 		= "MFX_FEAR_ORIGIN";
		     	emCreateFXID	= "spellFX_Fear_Face";
};
		

INSTANCE spellFX_Fear_Face		(CFx_Base_Proto)
{
		emtrjmode_s 		= "FIXED";
		emtrjeasefunc_s 	= "linear";
		emTrjOriginNode 	= "BIP01 HEAD";
		emtrjdynupdatedelay = 10000;
		lightPresetname 	= "REDAMBIENCE";
		sfxid				= "MFX_FEAR_CAST";
		sfxisambient		= 1;
		visname_S 			= "MFX_FEAR_FACE";
		emFXCreate_S		= "spellFX_Fear_WAVE";
};

INSTANCE spellFX_Fear_WAVE	(CFx_Base_Proto)
{
		visname_S 				= "MFX_FEAR_WAVE";		
		emTrjOriginNode 		= "BIP01";
		emActionCollDyn_S		= "CREATEONCE";
     	emFXCollDyn_S			= "spellFX_Fear_SENDPERCEPTION";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     	emCheckCollision		= 1;
     	//LightPresetName			= "WHITEBLEND";
};

INSTANCE spellFX_FEAR_SENDPERCEPTION	(CFx_Base_Proto)	//Sendet perception
{
		visname_S			= "";
		sfxid				= "HAMMER";
		sendassessmagic		= 1;
};


///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  B E R Z E R K  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Berzerk	(CFx_Base_Proto)
{
		visname_S 			= "MFX_BERZERK_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.;
				
		//emFXInvestOrigin_S 	= "spellFX_Sleep_ORIGIN";
		//emFXInvestTarget_S 	= "spellFX_Sleep_TARGET";
		
		};
		
		INSTANCE spellFX_Berzerk_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_BERZERK_ORIGIN";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
		     	sfxid					= "MFX_Berzerk_Cast";
		     	sfxisambient			= 1;
				//emCreateFXID 			= "FX_CAST2";
};


		
instance spellFX_Berzerk_ORIGIN	(CFx_Base_Proto)
{
		visname_S 		= "MFX_CHARM_ORIGIN";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
	
		//sendAssessMagic	= 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  B R E A T H   O F   D E A T H  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_BreathOfDeath	(CFx_Base_Proto)
{
		visname_S 			= "MFX_BREATHOFDEATH_INIT";
		vissize_s				= "1 1";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjnumkeys 		= 7;
		emtrjnumkeysvar 	= 3;
		emtrjangleelevvar 	= 5.;
		emtrjangleheadvar 	= 20.;
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 200000;
		emTrjTargetRange	= 100;
		emTrjTargetElev 	= 1;
		emActionCollDyn_S 	= "CREATEONCE";
		emFXCollDyn_S	   	= "spellFX_BreathOfDeath_Target";
		
		emFXInvestOrigin_S	= "spellFX_BreathOfDeath_Invest";
		
		
		};
		
		INSTANCE spellFX_BreathOfDeath_KEY_INIT (C_ParticleFXEmitKey)
		{
				emCheckCollision	= 0;
		};
		
		INSTANCE spellFX_BreathOfDeath_KEY_CAST	 (C_ParticleFXEmitKey)
		{
				visname_S 				= "simpleglow.tga";
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			emCheckCollision		= 1;
				emCreateFXID			= "spellFX_BreathOfDeath_CAST";
};
		

INSTANCE spellFX_BreathOfDeath_Invest (CFx_Base_Proto)
{
		visname_S			= "MFX_BREATHOFDEATH_INVEST";
		sfxid				= "MFX_BREATHOFDEATH_INVEST";
		sfxisambient		= 1;
};


INSTANCE spellFX_BreathOfDeath_Cast (CFx_Base_Proto)
{
		visname_S			= "MFX_BREATHOFDEATH_Cast";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		sfxid				= "MFX_BreathOfDeath_Cast";
		sfxisambient		= 1;
};


INSTANCE spellFX_BreathOfDeath_Target (CFx_Base_Proto)
{
		visname_S			= "MFX_BREATHOFDEATH_COLLIDE";
		sfxid				= "MFX_BREATHOFDEATH_TARGET";
		sfxisambient		= 1;
		sendassessmagic		= 1;
};


///   													XXXXXXXXXXXXXXXXXXXX
///   													XX  S H R I N K   XX
///   													XXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Shrink(CFx_Base_Proto)
{
		visname_S 			= "MFX_SHRINK_INIT";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjtargetnode 	= "BIP01";
		emtrjnumkeys 		= 5;
		emtrjnumkeysvar 	= 1;
		emtrjangleelevvar 	= 15.;
		emtrjangleheadvar 	= 0.;
		emtrjeasefunc_s 	= "LINEAR";
		emtrjloopmode_s		= "HALT";
		emtrjdynupdatedelay = 0.;
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
		lightpresetname		= "AURA";
		emFXInvestOrigin_S	= "spellFX_SHRINK_ORIGIN";
		
		};


		INSTANCE spellFX_Shrink_KEY_OPEN(C_ParticleFXEmitKey)
		{
				emtrjeasevel		= 0.01;
				LightRange			= 0.01;
		};

		INSTANCE spellFX_Shrink_KEY_INIT	(C_ParticleFXEmitKey)
		{
				emtrjeasevel		= 0.01;
				LightRange			= 0.01;
		};
		
		INSTANCE spellFX_Shrink_KEY_CAST	(C_ParticleFXEmitKey)
		{
				emtrjmode_s 		= "TARGET LINE";
				visname_S 			= "MFX_SHRINK_TARGET";
				emtrjeasevel		= 6000;
				LightRange			= 200;
				sfxid				= "MFX_SHRINK_CAST";
				sfxisambient		= 1;

};

INSTANCE spellFX_Shrink_Origin (CFx_Base_Proto)
{
		emFXCreatedOwnTrj 	= 0;
		visname_S			= "";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01";
		sfxid				= "MFX_SHRINK_INVEST";
		sfxisambient		= 1;
};



///   													XXXXXXXXXXXXXXXXXXXX
///   													XXXXXXXXXXXXXXXXXXXX
///   													XX  G L O B A L   XX
///   													XXXXXXXXXXXXXXXXXXXX
///   													XXXXXXXXXXXXXXXXXXXX



// HUMAN oder VOB brennt nach Feuerschaden (-> diese Instanz wird auf einem NSC/Monster gestartet, wenn er mit einem Feuerschaden Visual/Spell getroffen wird

INSTANCE VOB_BURN			(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 FIRE";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD1";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	lightpresetname		= "FIRESMALL";
	sfxid				= "MFX_Firespell_Humanburn";
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD1	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R UPPERARM";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD2";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD2	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L UPPERARM";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD3";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD3	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L HAND";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD4";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD4	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R HAND";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD5";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD5	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L FOOT";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD6";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD6	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R FOOT";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "spellFX_Firespell_HUMANSMOKE";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};


INSTANCE spellFX_Firespell_HUMANBURN		(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 FIRE";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	//emFXCreate_S 		= "spellFX_Firespell_HUMANSMOKE";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	emAdjustShpToOrigin = 1;
	//sendAssessMagic		= 1;
};

INSTANCE spellFX_Firespell_HUMANSMOKE	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 FIRE";
	visname_S 			= "MFX_Firespell_HUMANSMOKE";
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	emAdjustShpToOrigin = 1;
};

// ChainLightning Effekt auf Target, wird vom Programm direkt angesprochen
instance FX_Electric	(CFx_Base_Proto)		
{				
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 Head";
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Lightning_Target";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD1";
		emFXCreatedOwnTrj 	= 1;
};

// HUMAN oder VOB ist elektrisiert von ThunderSpell

instance spellFX_Lightning_TARGET			(CFx_Base_Proto)
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 Head";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		sfxid			= "MFX_Lightning_Target";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD1";
};

instance spellFX_Thunderspell_TARGET			(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 Head";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		sendAssessMagic		= 1;
		sfxid			= "MFX_Lightning_Target";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD1";
		emFXCreatedOwnTrj 	= 1;
};


instance spellFX_Thunderspell_TARGET_CHILD1		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 R UPPERARM";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD2";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD2		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 L UPPERARM";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD3";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD3		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 L HAND";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD4";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD4		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 R HAND";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD5";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD5		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 L FOOT";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD6";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD6		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 R FOOT";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD7";
		emFXCreatedOwnTrj 	= 1;
};
instance spellFX_Thunderspell_TARGET_CHILD7		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 L THIGH";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD8";
		emFXCreatedOwnTrj 	= 1;
};
instance spellFX_Thunderspell_TARGET_CHILD8		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 R THIGH";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD9";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD9		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 L CALF";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD10";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD10		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 R CALF";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD11";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD11		(CFx_Base_Proto)		// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderball_COLLIDE";
		emFXCreatedOwnTrj 	= 1;
};


// HUMAN oder VOB ist eingefroren von IceSpell


instance spellFX_IceSpell_TARGET			(CFx_Base_Proto)
{
		visname_S 			= "MFX_IceSpell_Target";
		emtrjmode_s 		= "FIXED";
		sendAssessMagic		= 1;
		emAdjustShpToOrigin = 1;
		sfxid				= "MFX_Icecube_Target";
  	visalpha = 0.5;
	visalphablendfunc_s = "ADD";
	emtrjloopmode_s = "LINEAR";  
	emFXCreatedOwnTrj 	= 1;	
	emFXTriggerDelay	= 0.02;		
	emTrjOriginNode 		= "Bip01";
		
};

// Earth Quake FX

INSTANCE FX_EarthQuake(CFx_Base_Proto)
{
	visName_S 		= 	"earthquake.eqk";
	userString[0]	= 	"1000";
	userString[1]	=	"5";
	userString[2]	=	"5 5 5";
	sfxid			= 	"MFX_EarthQuake";
	sfxIsAmbient	=	1;
};

// Various FX

INSTANCE CONTROL_LEAVERANGEFX(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "1";
	userString[1]	=	"0 100 0 100";
	userString[2]	=	"0.5";
};

INSTANCE CONTROL_CASTBLEND(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "0.5";
	userString[1]	=	"255 255 255 255";
	userString[2]	=	"0.5";
	emFXLifeSpan    =	0.6;
};

INSTANCE TRANSFORM_CASTBLEND(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "0.5";
	userString[1]	=	"255 0 0 255";
	userString[2]	=	"0.5";
	emFXLifeSpan    =	0.6;	
};

INSTANCE TRANSFORM_NOPLACEFX(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "1";
	userString[1]	=	"255 0 0 100";
	userString[2]	=	"1.5";
	emFXLifeSpan    =	0.6;		
};


// -------------------------------------------------------------------------------------------------------
// Seperate Collision Childs
// -------------------------------------------------------------------------------------------------------

INSTANCE FX_COLL_Small(CFx_Base_Proto)
{
		visname_S 		= "coldummy.3ds";
		emActionCollStat_S	= "NORESP";						// no collision response, as this fx is a child. collision response will be handled by parents
		emActionCollDyn_S	= "NORESP CREATEONCE";			// no collision response, as this fx is a child. collision response will be handled by parents
		visAlpha		= 0;
		};

		INSTANCE FX_COLL_Small_KEY_CAST(C_ParticleFXEmitKey)
		{
				emCheckCollision 	= 1;
};


// -------------------------------------------------------------------------------------------------------
// Magische Barriere
// -------------------------------------------------------------------------------------------------------


INSTANCE BARRIERE_PC_SHOOT(CFx_Base_Proto)
{
	visname_S 		= "Blast";
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay 	= 0;
	sfxID			= "MFX_Lightning_Origin";
};

INSTANCE BARRIERE_PC_WARNING(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 TOE";
	visname_S 		= "MFX_lightning_target";	
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay 	= 0.;
	lightPresetname 	= "AURA";
};
//*********************8
//MAGICSHIELD
//=====================8
INSTANCE spellFX_MagicShield	(CFx_Base_Proto)
{
		visname_S 			= "MFX_MAGICSHIELD_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.;
				
		//emFXInvestOrigin_S 	= "spellFX_MagicShield_ORIGIN";
		//emFXInvestTarget_S 	= "spellFX_MagicShield_TARGET";
		
		};
		
		INSTANCE spellFX_MagicShield_KEY_INIT	(C_ParticleFXEmitKey)
		{
				visname_S				= "MFX_MAGICSHIELD_INIT";
		};
		
		INSTANCE spellFX_MagicShield_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_MAGICSHIELD_ORIGIN";		
				//emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
		     	sfxid					= "MFX_MAGICSHIELD_CAST";
		     	
				//emCreateFXID 			= "FX_CAST2";
};

instance spellFX_MagicShield_HIT	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "MFX_Magicshield_HIT";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "Bip01 Spine1";
//		LightPresetname		= "AURA";
		emFXLifeSpan		= 3;
};
		
instance spellFX_MagicShield_ORIGIN	(CFx_Base_Proto)
{
		visname_S 		= "MFX_MagicShield_ORIGIN";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
	
		//sendAssessMagic	= 1;
};
instance MAGICSHIELDFXHead(CFx_Base_Proto)
{
		visname_S 		= "MAGICSHIELD_Bip01_Head";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01 Head";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
		
};

instance MAGICSHIELDFXRUpperArm	(CFx_Base_Proto)
{
		visname_S 		= "MAGICSHIELD_Bip01_R_UpperArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R UpperArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
		
};

instance MAGICSHIELDFXLUpperArm	(CFx_Base_Proto)
{
		visname_S 		= "MAGICSHIELD_Bip01_L_UpperArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L UpperArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
		
};

instance MAGICSHIELDFXLForeArm	(CFx_Base_Proto)
{
		visname_S 		= "MAGICSHIELD_Bip01_L_ForeArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L ForeArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
		
};

instance MAGICSHIELDFXRForeArm	(CFx_Base_Proto)
{
		visname_S 		= "MAGICSHIELD_Bip01_R_ForeArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R ForeArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
		
};

instance MAGICSHIELDFXLCalf	(CFx_Base_Proto)
{
		visname_S 		= "MAGICSHIELD_Bip01_L_Calf";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L Calf";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
};

instance MAGICSHIELDFXRCalf	(CFx_Base_Proto)
{
		visname_S 		= "MAGICSHIELD_Bip01_R_Calf";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R Calf";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
};
instance MAGICSHIELDFXLThigh	(CFx_Base_Proto)
{
		visname_S 		= "MAGICSHIELD_Bip01_L_Thigh";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L Thigh";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
};

instance MAGICSHIELDFXRThigh	(CFx_Base_Proto)
{
		visname_S 		= "MAGICSHIELD_Bip01_R_Thigh";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R Thigh";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emfxcreate_s	= "MAGICSHIELDFXSpine2";
		emAdjustShpToOrigin = 1;
};
instance MAGICSHIELDFXSpine2	(CFx_Base_Proto)
{
		visname_S 		= "MAGICSHIELD_Bip01_Spine2";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 Spine2";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
};
instance MAGICSHIELDFXBip01	(CFx_Base_Proto)
{
		visname_S 		= "MAGICSHIELD_Bip01";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
};





//*********************8
//IceArmor
//=====================8
///   													XXXXXXXXXXXXXXXXXXX
///   													XX  M I R R O R  XX
///   													XXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Undress	(CFx_Base_Proto)
{
		visname_S 			= "MFX_ICECUBE_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.;

		emFXInvestOrigin_S 	= "spellFX_Undress_CAST_NPC";
		
		};
		
		INSTANCE spellFX_Undress_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
		     	sfxid					= "MFX_Mirror_Cast";
		     	sfxisambient			= 1;
		     	//e
				emCreateFXID 			= "spellFX_Undress_CAST_HACK";
};


instance spellFX_Undress_CAST_HACK	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "";
		emTrjOriginNode 	= "BIP01";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
//		LightPresetname		= "AURA";
		sfxid				= "MFX_ICEARMOR_CAST";

};
instance spellFX_Undress_CAST_NPC	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "MFX_ICEARMOR_INVEST";
		emTrjOriginNode 	= "Bip01 Spine1";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		LightPresetname		= "AURA";
		emFXLifeSpan			= 180.0;//3min
		emSelfRotVel_S		= "0 200 0";	
		
    	emtrjmode_s 			= "FIXED";
		
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
// // 		emTrjTargetRange	 	= 20;
// // 		emTrjTargetElev 		= 0;
 		emTrjDynUpdateDelay		= 1;			
		
};


		
instance spellFX_Undress_END	(CFx_Base_Proto)
{
		visname_S 			= "MFX_ICESPELL_Collide";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
	
		//sendAssessMagic	= 1;
};

instance spellFX_Undress_TARGET	(CFx_Base_Proto)
{
		lightPresetname 	= "AURA";
		visname_S 			= "MFX_ICESPELL_Collide";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01";
		emtrjdynupdatedelay 	= 0;
	
		//sendAssessMagic	= 1;
};

instance spellFX_Undress_COLLIDE		(CFx_Base_Proto)
{
		visname_S 			= "MFX_ICESPELL_Collide";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
	
		//sendAssessMagic	= 1;
};

instance spellFX_Undress_SMOKE	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "MFX_ICEARMOR_SMOKE";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "Bip01 Spine1";
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
};

instance IceArmorFXHead(CFx_Base_Proto)
{
		visname_S 		= "IceArmor_Bip01_Head";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01 Head";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
		
};

instance IceArmorFXRUpperArm	(CFx_Base_Proto)
{
		visname_S 		= "IceArmor_Bip01_R_UpperArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R UpperArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
		
};

instance IceArmorFXLUpperArm	(CFx_Base_Proto)
{
		visname_S 		= "IceArmor_Bip01_L_UpperArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L UpperArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
		
};

instance IceArmorFXLForeArm	(CFx_Base_Proto)
{
		visname_S 		= "IceArmor_Bip01_L_ForeArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L ForeArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
		
};

instance IceArmorFXRForeArm	(CFx_Base_Proto)
{
		visname_S 		= "IceArmor_Bip01_R_ForeArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R ForeArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
		
};

instance IceArmorFXLCalf	(CFx_Base_Proto)
{
		visname_S 		= "IceArmor_Bip01_L_Calf";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L Calf";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
};

instance IceArmorFXRCalf	(CFx_Base_Proto)
{
		visname_S 		= "IceArmor_Bip01_R_Calf";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R Calf";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
};
instance IceArmorFXLThigh	(CFx_Base_Proto)
{
		visname_S 		= "IceArmor_Bip01_L_Thigh";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L Thigh";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
};

instance IceArmorFXRThigh	(CFx_Base_Proto)
{
		visname_S 		= "IceArmor_Bip01_R_Thigh";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R Thigh";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emfxcreate_s	= "IceArmorFXSpine2";
		emAdjustShpToOrigin = 1;
};
instance IceArmorFXSpine2	(CFx_Base_Proto)
{
		visname_S 		= "IceArmor_Bip01_Spine2";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 Spine2";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
};
instance IceArmorFXBip01	(CFx_Base_Proto)
{
		visname_S 		= "IceArmor_Bip01";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 180.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
		emAdjustShpToOrigin = 1;
};



INSTANCE TempPotionFX_StunBash_1	(CFx_Base_Proto)
{

    visname_S 				= "STUNBASH_1";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "BIP01 R Foot";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	//emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	LightPresetname   		= "REDAMBIENCE";	
};
INSTANCE TempPotionFX_StunBash_2(CFx_Base_Proto)
{
	visName_S 		= 	"earthquake.eqk";
	userString[0]	= 	"10000";
	userString[1]	=	"1";//duration?
	userString[2]	=	"12 33 1";
	//sfxid			= 	"MFX_EarthQuake";
	//sfxIsAmbient	=	1;
};
INSTANCE TempPotionFX_StunBash_3	(CFx_Base_Proto)
{

    visname_S 				= "STUNBASH_2";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	//emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};
INSTANCE TempPotionFX_StunBash_4	(CFx_Base_Proto)
{

    visname_S 				= "STUNBASH_3";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emTrjOriginNode 		= "ZS_RIGHTHAND";		
	emtrjmode_s = "FIXED";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.1;
	//emfxlifespan = 1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
	
};
//*********************8
//GHOST
//=====================8
instance GhostFXSmoke	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_PFX";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
     	LightPresetName			= "REDAMBIENCEB";		
};
instance GhostFXSmoke2	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_PFX2";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
     	LightPresetName			= "VIOLETAMBIENCE";		
};
instance GhostFXHead	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_Bip01_Head";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01 Head";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

instance GhostFXRUpperArm	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_Bip01_R_UpperArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R UpperArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

instance GhostFXLUpperArm	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_Bip01_L_UpperArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L UpperArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

instance GhostFXLForeArm	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_Bip01_L_ForeArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L ForeArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

instance GhostFXRForeArm	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_Bip01_R_ForeArm";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R ForeArm";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

instance GhostFXLCalf	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_Bip01_L_Calf";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L Calf";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

instance GhostFXRCalf	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_Bip01_R_Calf";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R Calf";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};
instance GhostFXLThigh	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_Bip01_L_Thigh";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 L Thigh";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

instance GhostFXRThigh	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_Bip01_R_Thigh";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 R Thigh";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};
instance GhostFXSpine2	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_Bip01_Spine2";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01 Spine2";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};
instance GhostFXBip01	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_Bip01";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "Bip01";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};
instance GHOST_AXE1_0	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_AXE1";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_LONGSWORD";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

instance GHOST_AXE1_1	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_AXE1";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

instance GHOST_SWD2_0	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_SWD2";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_LONGSWORD";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

instance GHOST_SWD2_1	(CFx_Base_Proto)
{
		visname_S 		= "GHOST_SWD2";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0.1;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

instance VFXWEAPONTRAIL	(CFx_Base_Proto)
{
		visname_S 		= "WEAPONTRAIL_CZ";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_LEFTHAND";
		emtrjdynupdatedelay 	= 0.01;
		emfxlifespan = 1.0;
		emselfrotvel_s = "0 0 0";
		secsperdamage = -1;
};

