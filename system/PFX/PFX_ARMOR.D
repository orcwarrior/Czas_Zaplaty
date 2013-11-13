PROTOTYPE ARMOR_PART (C_ParticleFX)
{
	ppsvalue			= 4;
	ppsscalekeys_s		= "1";
	ppsfps				= 1;
	ppsislooping		= 0;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "UNIFORM";
	shpdim_s			= "1";
    shpmesh_s 			= "M_ARMOR_STTH_BOOTL.3DS"; 
	ShpMeshRender_B 	= 1;    
	shpscalekeys_s		= "1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 1;
	dirmode_s			= "DIR";
	velavg				= 0.1;//9.
	lsppartavg			= 1000;
	flygravity_s		= "0 0 0";
	visname_s			= "MSH_WEAPONTRAIL.3DS"; 
	visorientation_s	= "VEL0";
	vistexisquadpoly	= 0;
	vistexanifps		= 0;
	vistexaniislooping	= 0;
	vistexcolorstart_s	= "0 0 0";
	vistexcolorend_s	= "0 0 0";
	vissizestart_s		= "1 1";
	vissizeendscale		= 1;
	visalphafunc_s		= "ADD";
	visalphastart		= 0;
	visalphaend			= 0;
};

INSTANCE P_WEAPONTRAIL (C_ParticleFX)
{
	ppsvalue			= 100;
	ppsscalekeys_s		= "1";
	ppsfps				= 2;
	ppsislooping		= 0;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "WALK";
	shpdim_s			= "1";
    shpmesh_s 			= "MSH_WEAPONTRAIL.3DS"; 
	ShpMeshRender_B 	= 1;    
	shpscalekeys_s		= "1 0 0";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 1;
	dirmode_s			= "DIR";
	velavg				= 1.1;//9.
	lspPartVar			= 0;
	flygravity_s		= "0 0 0";
	visname_s			= "";
	visorientation_s	= "VELO";
	vistexisquadpoly	= 0;
	vistexanifps		= 0;
	vistexaniislooping	= 0;
	vistexcolorstart_s	= "0 0 0";
	vistexcolorend_s	= "0 0 0";
	vissizestart_s		= "0 0";
	vissizeendscale		= 0;
	visalphafunc_s		= "ADD";
	visalphastart		= 0;
	visalphaend			= 0;
};
INSTANCE PFX_SWORDDAMAGE_100 (ARMOR_PART)
{
	ppsvalue		= 40;  
	ppsfps			= 8;
	ppsislooping	= 1;
	shptype_s		= "LINE";
	shpdim_s			= "100 1";
	
	shpoffsetvec_s	= "0 70 0";
	ShpMeshRender_B = 1;      
	lsppartavg		= 100;    
	lsppartvar		= 1;    
	velavg 			= 0.00000005;
	velvar 			= 0.000000001; 
};

PROTOTYPE SHEAT (C_ParticleFX)
{
	ppsvalue			= 4;
	ppsscalekeys_s		= "1";
	ppsfps				= 1;
	ppsislooping		= 1;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "UNIFORM";
	shpdim_s			= "0";
    shpmesh_s 			= "M_ARMOR_STTH_BOOTL.3DS"; 
	ShpMeshRender_B 	= 1;    
	shpscalekeys_s		= "1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 1;
	dirmode_s			= "DIR";
	velavg				= 0.1;//9.
	lsppartavg			= 1000;
	flygravity_s		= "0 0 0";
	visname_s			= "MSH_WEAPONTRAIL.3DS"; 
	visorientation_s	= "NONE";
	vistexisquadpoly	= 0;
	vistexanifps		= 0;
	vistexaniislooping	= 0;
	vistexcolorstart_s	= "0 0 0";
	vistexcolorend_s	= "0 0 0";
	vissizestart_s		= "0 0";
	vissizeendscale		= 1;
	visalphafunc_s		= "NONE";
	visalphastart		= 0;
	visalphaend			= 0;
};
//SHEATS
INSTANCE P_ITMW_1H_SWORD_SHORT_SHEATH_01 (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_SHORT_SHEATH_01.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_SHORT_SHEATH_02 (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_SHORT_SHEATH_02.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_SHEATH_01 (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_SHEATH_01.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_SHEATH_02 (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_SHEATH_02.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_LONG_SHEATH_01 (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_LONG_SHEATH_01.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_LONG_SHEATH_02 (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_LONG_SHEATH_02.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_BROAD_SHEATH_01 (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_BROAD_SHEATH_01.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_BROAD_SHEATH_02 (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_BROAD_SHEATH_02.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_BASTARD_SHEATH_01 (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_BASTARD_SHEATH_01.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_BASTARD_SHEATH_02 (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_BASTARD_SHEATH_02.3DS"; 
};
//2h


INSTANCE P_ITMW_2H_SWORD_LIGHT_SHEATH_01 (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_LIGHT_SHEATH_01.3DS"; 
};
INSTANCE P_ITMW_2H_SWORD_LIGHT_SHEATH_02 (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_LIGHT_SHEATH_02.3DS"; 
};
INSTANCE P_ITMW_2H_SWORD_SHEATH_01 (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_SHEATH_01.3DS"; 
};
INSTANCE P_ITMW_2H_SWORD_SHEATH_02 (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_SHEATH_02.3DS"; 
};
INSTANCE P_ITMW_2H_SWORD_HEAVY_SHEATH_01 (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_HEAVY_SHEATH_01.3DS"; 
};
INSTANCE P_ITMW_2H_SWORD_HEAVY_SHEATH_02 (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_HEAVY_SHEATH_02.3DS"; 
};



//SHEATS
INSTANCE P_ITMW_1H_SWORD_SHORT_SHEATH_01_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_SHORT_SHEATH_01_NPC.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_SHORT_SHEATH_02_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_SHORT_SHEATH_02_NPC.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_SHEATH_01_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_SHEATH_01_NPC.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_SHEATH_02_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_SHEATH_02_NPC.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_LONG_SHEATH_01_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_LONG_SHEATH_01_NPC.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_LONG_SHEATH_02_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_LONG_SHEATH_02_NPC.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_BROAD_SHEATH_01_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_BROAD_SHEATH_01_NPC.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_BROAD_SHEATH_02_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_BROAD_SHEATH_02_NPC.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_BASTARD_SHEATH_01_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_BASTARD_SHEATH_01_NPC.3DS"; 
};
INSTANCE P_ITMW_1H_SWORD_BASTARD_SHEATH_02_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_1H_SWORD_BASTARD_SHEATH_02_NPC.3DS"; 
};
//2h


INSTANCE P_ITMW_2H_SWORD_LIGHT_SHEATH_01_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_LIGHT_SHEATH_01_NPC.3DS"; 
};
INSTANCE P_ITMW_2H_SWORD_LIGHT_SHEATH_02_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_LIGHT_SHEATH_02_NPC.3DS"; 
};
INSTANCE P_ITMW_2H_SWORD_SHEATH_01_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_SHEATH_01_NPC.3DS"; 
};
INSTANCE P_ITMW_2H_SWORD_SHEATH_02_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_SHEATH_02_NPC.3DS"; 
};
INSTANCE P_ITMW_2H_SWORD_HEAVY_SHEATH_01_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_HEAVY_SHEATH_01_NPC.3DS"; 
};
INSTANCE P_ITMW_2H_SWORD_HEAVY_SHEATH_02_NPC (SHEAT)
{
    shpmesh_s 			= "ITMW_2H_SWORD_HEAVY_SHEATH_02_NPC.3DS"; 
};


//ARROWS


PROTOTYPE ARROW (C_ParticleFX)
{
	ppsvalue			= 4;
	ppsscalekeys_s		= "1";
	ppsfps				= 1;
	ppsislooping		= 0;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "UNIFORM";
	shpdim_s			= "1";
    shpmesh_s 			= "M_ARMOR_STTH_BOOTL.3DS"; 
	ShpMeshRender_B 	= 1;    
	shpscalekeys_s		= "1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 1;
	dirmode_s			= "DIR";
	velavg				= 0.1;//9.
	lsppartavg			= 19000;
	lsppartvar			= 5000;
	flygravity_s		= "0 0 0";
	visname_s			= "MSH_WEAPONTRAIL.3DS"; 
	visorientation_s	= "VEL03D";
	vistexisquadpoly	= 0;
	vistexanifps		= 0;
	vistexaniislooping	= 0;
	vistexcolorstart_s	= "0 0 0";
	vistexcolorend_s	= "0 0 0";
	vissizestart_s		= "1 1";
	vissizeendscale		= 1;
	visalphafunc_s		= "ADD";
	visalphastart		= 0;
	visalphaend			= 0;
};
//SHEATS
INSTANCE P_RANDOM_ARROW_1 (ARROW)
{
    shpmesh_s 			= "RANDOM_ARROW_1.3DS"; 
};
INSTANCE P_RANDOM_ARROW_2 (ARROW)
{
    shpmesh_s 			= "RANDOM_ARROW_2.3DS"; 
};
INSTANCE P_RANDOM_ARROW_3 (ARROW)
{
    shpmesh_s 			= "RANDOM_ARROW_3.3DS"; 
};
INSTANCE P_RANDOM_ARROW_4 (ARROW)
{
    shpmesh_s 			= "RANDOM_ARROW_4.3DS"; 
};
INSTANCE P_RANDOM_ARROW_5 (ARROW)
{
    shpmesh_s 			= "RANDOM_ARROW_5.3DS"; 
};
INSTANCE P_RANDOM_ARROW_6 (ARROW)
{
    shpmesh_s 			= "RANDOM_ARROW_6.3DS"; 
};
INSTANCE P_RANDOM_ARROW_7 (ARROW)
{
    shpmesh_s 			= "RANDOM_ARROW_7.3DS"; 
};
INSTANCE P_RANDOM_ARROW_8 (ARROW)
{
    shpmesh_s 			= "RANDOM_ARROW_8.3DS"; 
};