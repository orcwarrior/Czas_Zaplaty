//******************************
//  ARMOR TEST
//******************************
//FINALLY WORKING VERSION!!!
PROTOTYPE ARMOR_PART_PROTO	(CFx_Base)
{
	visName_S				= "";
	emTrjOriginNode			= "";
	emTrjTargetNode			= "";
	emTrjTargetRange		= 0;
	emTrjTargetAzi			= 0;
	emTrjTargetElev			= 0;
	emTrjNumKeys			= 0;
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
	emInvestNextKeyDuration		= 0;
	emFlyGravity			= 0;
	emSelfRotVel_S			= "0 0 0";
	lightPresetName			= "";
	sfxID					= "";
	sendAssessMagic			= 0;
	secsPerDamage			= -1;	
	
  	visalpha = 1;
	visalphablendfunc_s = "NONE";
	emtrjmode_s = "FIXED";     
	emtrjloopmode_s = "LINEAR";  
	emtrjeasefunc_s = "NONE";
	emFXCreatedOwnTrj 	= 1;	
	emFXTriggerDelay	= 0.02;
	emfxlifespan = 1;	
 	emadjustshptoorigin = 1;//1	
	emTrjDynUpdateDelay		= 200;	
	//emFXCreate_S	= "BugfixFX";
	
};
INSTANCE V_ARMOR_STTH_BOOTL	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_BOOTL";
	emTrjOriginNode 		= "Bip01 L Foot";	

	
};
INSTANCE V_ARMOR_STTH_BOOTR	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_BOOTR";
	emTrjOriginNode 		= "Bip01 R Foot";	
	
};
INSTANCE V_ARMOR_STTH_CALFL	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_CALFL";
	emTrjOriginNode 		= "Bip01 L Calf";	
	
};
INSTANCE V_ARMOR_STTH_CALFR	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_CALFR";
	emTrjOriginNode 		= "Bip01 R Calf";	
	
};
INSTANCE V_ARMOR_STTH_THIGHL	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_THIGHL";
	emTrjOriginNode 		= "Bip01 L Thigh";	
	
};
INSTANCE V_ARMOR_STTH_THIGHR	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_THIGHR";
	emTrjOriginNode 		= "Bip01 R Thigh";	
	
};
INSTANCE V_ARMOR_STTH_PELVIS	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_PELVIS";
	emTrjOriginNode 		= "Bip01";
	
};
INSTANCE V_ARMOR_STTH_TORSO	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_TORSO";
	emTrjOriginNode 		= "Bip01 Spine2";
	
};
INSTANCE V_ARMOR_STTH_UPPERARMR	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_UPPERARMR";
	emTrjOriginNode 		= "Bip01 R UpperArm";
	
};
INSTANCE V_ARMOR_STTH_UPPERARML	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_UPPERARML";
	emTrjOriginNode 		= "Bip01 L UpperArm";
	
};

INSTANCE V_ARMOR_STTH_FOREARMR	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_FOREARMR";
	emTrjOriginNode 		= "Bip01 R ForeArm";
	
};

INSTANCE V_ARMOR_STTH_FOREARML	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_FOREARML";
	emTrjOriginNode 		= "Bip01 L ForeArm";
	
};
INSTANCE V_ARMOR_STTH_HANDR	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_HANDR";
	emTrjOriginNode 		= "Bip01 R Hand";
	
};
INSTANCE V_ARMOR_STTH_HANDL	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_HANDL";
	emTrjOriginNode 		= "Bip01 L Hand";
	
};
INSTANCE FIREHEAD	(ARMOR_PART_PROTO)
{
    visname_S 				= "P_ARMOR_STTH_TORSO";
	emTrjOriginNode 		= "Bip01 Head";
	
};
INSTANCE R_SWORDDAMAGE	(ARMOR_PART_PROTO)
{
    visname_S 				= "PFX_SWORDDAMAGE_100";
	emTrjOriginNode 		= "ZS_RIGHTHAND";
	emfxlifespan = -1;		
	emTrjDynUpdateDelay		= 200;	
	emCheckCollision = 1;
	emAdjustShpToOrigin = 1;
	emActionCollDyn_S = "COLLIDE";
	
};
INSTANCE L_SWORDDAMAGE	(ARMOR_PART_PROTO)
{
    visname_S 				= "PFX_SWORDDAMAGE_100";
	emTrjOriginNode 		= "ZS_LEFTHAND";
	emfxlifespan = -1;		
	emTrjDynUpdateDelay		= 200;	
	emCheckCollision = 1;
	emAdjustShpToOrigin = 1;
	emActionCollDyn_S = "COLLIDE";
	
};

INSTANCE BugfixFX	(CFx_Base_Proto)
{
    visname_S 				= "";
	visalpha = 1;
	visalphablendfunc_s = "NONE";
	emtrjmode_s = "FIXED";
	emTrjOriginNode 		= "ZS_LEFTHAND";	
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.01;
	emfxlifespan = 1;
	//emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;//1	
};	


PROTOTYPE SHEAT_PROTO	(CFx_Base)
{
	visName_S				= "";
	emTrjOriginNode			= "";
	emTrjTargetNode			= "";
	emTrjTargetRange		= 0;
	emTrjTargetAzi			= 0;
	emTrjTargetElev			= 0;
	emTrjNumKeys			= 0;
	emTrjNumKeysVar			= 0;
	emTrjAngleElevVar		= 0;
	emTrjAngleHeadVar		= 0;
	emTrjKeyDistVar			= 0;
	emTrjEaseVel			= 1;
	emTrjDynUpdateTargetOnly= 0;
	emActionCollDyn_S		= "NORESP";		
	emActionCollStat_S		= "NORESP";		
	emFXCollStat_S			= "";
	emFXCollDyn_S			= "";
	emFXCollStatAlign_S		= "";		
	emFXCollDynAlign_S		= "";
	emCheckCollision		= 0;
	emInvestNextKeyDuration		= 0;
	emFlyGravity			= 0;
	emSelfRotVel_S			= "0 0 0";
	lightPresetName			= "";
	sfxID					= "";
	sendAssessMagic			= 0;
	secsPerDamage			= -1;	
	
  	visalpha = 1;
	visalphablendfunc_s = "NONE";
	emtrjmode_s = "FIXED";     
	emtrjloopmode_s = "LINEAR";  
	emtrjeasefunc_s = "NONE";
	emFXCreatedOwnTrj 	= 0;	
	emFXTriggerDelay	= 1;
	emfxlifespan = -1;	
 	emadjustshptoorigin = 1;//1	
	emTrjDynUpdateDelay		= 1;	
	//emFXCreate_S	= "BugfixFX";
	
};

//-------------------------------------------------------
//   S H E A T S - 1 H
//-------------------------------------------------------
INSTANCE V_ITMW_1H_SWORD_SHORT_SHEATH_01	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_SHORT_SHEATH_01";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_SHORT_SHEATH_02	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_SHORT_SHEATH_02";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_SHEATH_01	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_SHEATH_01";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_SHEATH_02	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_SHEATH_02";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_LONG_SHEATH_01	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_LONG_SHEATH_01";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_LONG_SHEATH_02	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_LONG_SHEATH_02";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_BROAD_SHEATH_01	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_BROAD_SHEATH_01";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_BROAD_SHEATH_02	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_BROAD_SHEATH_02";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_BASTARD_SHEATH_01	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_BASTARD_SHEATH_01";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_BASTARD_SHEATH_02	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_BASTARD_SHEATH_02";
	emTrjOriginNode 		= "ZS_SWORD";
};


//-------------------------------------------------------
//   S H E A T S - 2 H
//-------------------------------------------------------

INSTANCE V_ITMW_2H_SWORD_LIGHT_SHEATH_01	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_LIGHT_SHEATH_01";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};
INSTANCE V_ITMW_2H_SWORD_LIGHT_SHEATH_02	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_LIGHT_SHEATH_02";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};

INSTANCE V_ITMW_2H_SWORD_SHEATH_01	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_SHEATH_01";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};
INSTANCE V_ITMW_2H_SWORD_SHEATH_02	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_SHEATH_02";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};
INSTANCE V_ITMW_2H_SWORD_HEAVY_SHEATH_01	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_HEAVY_SHEATH_01";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};
INSTANCE V_ITMW_2H_SWORD_HEAVY_SHEATH_02	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_HEAVY_SHEATH_02";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};

//-------------------------------------------------------
//   S H E A T S - 1 H
//-------------------------------------------------------
INSTANCE V_ITMW_1H_SWORD_SHORT_SHEATH_01_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_SHORT_SHEATH_01_NPC";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_SHORT_SHEATH_02_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_SHORT_SHEATH_02_NPC";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_SHEATH_01_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_SHEATH_01_NPC";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_SHEATH_02_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_SHEATH_02_NPC";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_LONG_SHEATH_01_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_LONG_SHEATH_01_NPC";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_LONG_SHEATH_02_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_LONG_SHEATH_02_NPC";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_BROAD_SHEATH_01_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_BROAD_SHEATH_01_NPC";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_BROAD_SHEATH_02_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_BROAD_SHEATH_02_NPC";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_BASTARD_SHEATH_01_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_BASTARD_SHEATH_01_NPC";
	emTrjOriginNode 		= "ZS_SWORD";
};
INSTANCE V_ITMW_1H_SWORD_BASTARD_SHEATH_02_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_1H_SWORD_BASTARD_SHEATH_02_NPC";
	emTrjOriginNode 		= "ZS_SWORD";
};


//-------------------------------------------------------
//   S H E A T S - 2 H
//-------------------------------------------------------

INSTANCE V_ITMW_2H_SWORD_LIGHT_SHEATH_01_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_LIGHT_SHEATH_01_NPC";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};
INSTANCE V_ITMW_2H_SWORD_LIGHT_SHEATH_02_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_LIGHT_SHEATH_02_NPC";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};

INSTANCE V_ITMW_2H_SWORD_SHEATH_01_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_SHEATH_01_NPC";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};
INSTANCE V_ITMW_2H_SWORD_SHEATH_02_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_SHEATH_02_NPC";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};
INSTANCE V_ITMW_2H_SWORD_HEAVY_SHEATH_01_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_HEAVY_SHEATH_01_NPC";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};
INSTANCE V_ITMW_2H_SWORD_HEAVY_SHEATH_02_NPC	(SHEAT_PROTO)
{
    visname_S 				= "P_ITMW_2H_SWORD_HEAVY_SHEATH_02_NPC";
	emTrjOriginNode 		= "ZS_LONGSWORD";
};


//-------------------------------------------------------
//   A R R O W S   ( O N   D A M A G E )
//-------------------------------------------------------

instance V_RANDOM_ARROW_1(ARMOR_PART_PROTO)
{
    visname_S 				= "P_RANDOM_ARROW_1";
		emtrjoriginnode 	= "Bip01 L Foot";
	emfxlifespan = 30;		
};

instance V_RANDOM_ARROW_2(ARMOR_PART_PROTO)
{
    visname_S 				= "P_RANDOM_ARROW_2";
		emtrjoriginnode 	= "Bip01 L Thigh";
	emfxlifespan = 30;		
};

instance V_RANDOM_ARROW_3(ARMOR_PART_PROTO)
{
    visname_S 				= "P_RANDOM_ARROW_3";
		emtrjoriginnode 	= "Bip01 R Calf";
	emfxlifespan = 30;		
};

instance V_RANDOM_ARROW_4(ARMOR_PART_PROTO)
{
    visname_S 				= "P_RANDOM_ARROW_4";
		emtrjoriginnode 	= "Bip01 L Thigh";
	emfxlifespan = 30;		
};

instance V_RANDOM_ARROW_5(ARMOR_PART_PROTO)
{
    visname_S 				= "P_RANDOM_ARROW_5";
		emtrjoriginnode 	= "Bip01 Spine2";
	emfxlifespan = 30;		
};

instance V_RANDOM_ARROW_6(ARMOR_PART_PROTO)
{
    visname_S 				= "P_RANDOM_ARROW_6";
		emtrjoriginnode 	= "Bip01 L Clavicle";
	emfxlifespan = 30;		
};

instance V_RANDOM_ARROW_7(ARMOR_PART_PROTO)
{
    visname_S 				= "P_RANDOM_ARROW_7";
		emtrjoriginnode 	= "Bip01 R Clavicle";
	emfxlifespan = 30;		
};

instance V_RANDOM_ARROW_8(ARMOR_PART_PROTO)
{
    visname_S 				= "P_RANDOM_ARROW_8";
		emtrjoriginnode 	= "Bip01 L Forearm";
	emfxlifespan = 30;		
};
