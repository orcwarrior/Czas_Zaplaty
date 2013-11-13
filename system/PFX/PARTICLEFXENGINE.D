//////////////////////////////////////////
//	
// 	Particle-Effects 
//	Instance-Definitions, Engine Presets 
//	Author: Dieter Hildebrandt
//
//	** DO NOT MODIFY **
//	** Ive MODIFIED IT! **
//////////////////////////////////////////
INSTANCE SKYDOME_LAYER0(C_PARTICLEFX)
{
     ppsvalue = 25.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "MESH";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpmesh_s = "SkyDome_NEWLayer0.3DS";
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "humanburn.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "40 40";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE SKYDOME_LAYER1(C_PARTICLEFX)
{
     ppsvalue = 25.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "MESH";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpmesh_s = "SkyDome_NEWLayer1.3DS";
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "humanburn.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "40 40";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};




INSTANCE WEAPONTRAIL_CZ (C_PARTICLEFX)
{
//      ppsvalue = 50.000000000;
//      ppsislooping = 1;
//      shptype_s = "LINE";
//      shpfor_s = "OBJECT";
//      shpdistribtype_s = "uniform";
//      shpdistribwalkspeed = 0.0000000001;
//      shpdim_s = "1";
//      shpoffsetvec_s = "1 31 1";     
//      shpscalekeys_s = "1 0";
//      shpscaleislooping = 1;
//      shpscaleissmooth = 1;
//      shpscalefps = 1.000000000;
//      dirmode_s = "OBJECT";
//      DirAngleHead = 0.00;
//      DirAngleHeadVar = 0.00;
//      DirAngleElev = 0.00;
//      DirAngleElevVar = 0.00;
//      dirfor_s = "object";
//      dirmodetargetfor_s = "target";
//      velavg = 0.00000000;
//      velvar = 0.00000000;
//      lsppartavg = 1000.000000000;
//      flygravity_s = "0";
//      visname_s = "ZWEAPONTRAIL.TGA";
//      visorientation_s = "velo3d";
//      vistexisquadpoly = 1;
//      vistexanifps = 10.000000000;
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "255 255 255";
//      vistexcolorend_s = "255 255 255";
//      vissizestart_s = "10 30";
//      vissizeendscale = 1.000000000;
//      visalphafunc_s = "ADD";
//      visalphastart = 255.000000000;
//      visalphastart = 255.000000000;     
	 ppsvalue = 30.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
 	 shpmesh_s = "MSH_WEAPONTRAIL.3DS"; 	 
     shpmeshrender_b = 1; 	
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "NONE";
     shpisvolume = 0;
     shpdim_s = "100 100";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000001;
   //  velvar = 0.029999999;
     lsppartavg = 2000.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "1 1 1";
	vistexcolorend_s	= "1 1 1";
     vissizestart_s = "150 20";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 241.000000000;	
//      trltexture_s = "ZWEAPONTRAIL.TGA";
//   trlFadeSpeed = 0.5; 
//  	 TrlWidth = 60;     
};

INSTANCE TALENT_MAGICFIST (C_PARTICLEFX)
{
     ppsvalue = 140.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000030000;
     shpdim_s = "10";
     shpscalekeys_s = "1 0";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.050000001;
     velvar = 0.020000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "185 95 95";
     vistexcolorend_s = "250 0 0";
     vissizestart_s = "10 100";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphastart = 225.000000000;     
     trltexture_s = "BLUEGLOW.TGA";
};

INSTANCE TALENT_MAGICFIST_HIT (C_PARTICLEFX)
{
     ppsvalue = 200.;
     ppsfps = 150.;     
 //    ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000130000;
     shpdim_s = "10";
     shpscalekeys_s = "1 0";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.150000001;
     velvar = 0.0520000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "220 155 155";
     vistexcolorend_s = "250 0 0";
     vissizestart_s = "15 100";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphastart = 225.000000000;     
     trltexture_s = "BLUEGLOW.TGA";
};

INSTANCE GHOST_PFX(C_PARTICLEFX)
{
     ppsvalue = 35.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
//   ppsislooping = 1;     
     ppsfps = 0.6000000000;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10 90 40";
     shpscalekeys_s = "1";
     shpscaleislooping = 0;
     shpscaleissmooth = 1;
     dirmode_s = "none";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.015;
     velvar = 0.05;
     lsppartavg = 1800.100000000;
     lsppartvar = 800.100000000;
     flygravity_s = "0 0.00001 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
 	 vistexcolorstart_s = "120 50 50";//   vistexcolorstart_s = "65 30 120";
     vistexcolorend_s = "1 1 2";
     vissizestart_s = "21 21";
     vissizeendscale = 7.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 205.000000000;
     visalphaend = 125.000000000;     
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE GHOST_PFX2(C_PARTICLEFX)
{
     ppsvalue = 35.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
//   ppsislooping = 1;     
     ppsfps = 0.6000000000;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10 90 40";
     shpscalekeys_s = "1";
     shpscaleislooping = 0;
     shpscaleissmooth = 1;
     dirmode_s = "none";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.015;
     velvar = 0.05;
     lsppartavg = 1800.100000000;
     lsppartvar = 800.100000000;
     flygravity_s = "0 0.00001 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
 	 vistexcolorstart_s = "65 30 120";
     vistexcolorend_s = "1 1 2";
     vissizestart_s = "21 21";
     vissizeendscale = 7.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 205.000000000;
     visalphaend = 125.000000000;     
     trltexture_s = "WHITECLOUD.TGA";
};
PROTOTYPE GHOST_DOTS(C_PARTICLEFX)
{
     ppsvalue = 24.000000000;	
     lsppartavg = 1400.100000000;
     lsppartvar = 1100.100000000;     
     flygravity_s = "0 0 0";
};
INSTANCE GHOST_Bip01_Head(GHOST_DOTS)
{

     ppsvalue = 40.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01 Head.3DS"; 	 
//     shpmeshrender_b = 1; 	     
      shpfor_s = "object";
     shpoffsetvec_s = "10 1 1";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.0001;
     velvar = 0.000001;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};

INSTANCE GHOST_Bip01_L_Calf(GHOST_DOTS)
{

     ppsvalue = 24.000000001;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01 L Calf.3DS"; 	 
//     shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.001;
     velvar = 0.00001;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};


INSTANCE GHOST_Bip01_R_Calf(GHOST_DOTS)
{

     ppsvalue = 24.000000001;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01 R Calf.3DS"; 	 
 //    shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.0001;
     velvar = 0.000001;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};

INSTANCE GHOST_Bip01_L_Forearm(GHOST_DOTS)
{

     ppsvalue = 24.000000001;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01 L Forearm.3DS"; 	 
  //   shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.001;
     velvar = 0.00001;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};


INSTANCE GHOST_Bip01_R_Forearm(GHOST_DOTS)
{

     ppsvalue = 24.000000001;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01 R Forearm.3DS"; 	 
  //   shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.001;
     velvar = 0.00001;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};


INSTANCE GHOST_Bip01_L_Thigh(GHOST_DOTS)
{

     ppsvalue = 24.000000001;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01 L Thigh.3DS"; 	 
  //   shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.001;
     velvar = 0.00001;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};


INSTANCE GHOST_Bip01_R_Thigh(GHOST_DOTS)
{

     ppsvalue = 24.000000001;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01 R Thigh.3DS"; 	 
  //   shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.001;
     velvar = 0.00001;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};


INSTANCE GHOST_Bip01_L_UpperArm(GHOST_DOTS)
{

     ppsvalue = 24.000000001;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01 L UpperArm.3DS"; 	 
  //   shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.001;
     velvar = 0.00001;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};


INSTANCE GHOST_Bip01_R_UpperArm(GHOST_DOTS)
{

     ppsvalue = 24.000000001;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01 R UpperArm.3DS"; 	 
  //   shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.001;
     velvar = 0.00001;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};



INSTANCE GHOST_Bip01_Spine2(GHOST_DOTS)
{

     ppsvalue = 24.000000001;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01 Spine2.3DS"; 	 
  //   shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.001;
     velvar = 0.00001;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};


INSTANCE GHOST_Bip01(GHOST_DOTS)
{

     ppsvalue = 24.000000001;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01.3DS"; 	 
 //    shpmeshrender_b = 1; 	     
      shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.001;
     velvar = 0.00001;
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};

INSTANCE GHOST_AXE1(GHOST_DOTS)
{

      ppsvalue = 110.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 0.1 0";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 10.000000000;
     shptype_s = "MESH";
 	 shpmesh_s = "MAGICAXE.3DS"; 	 
//     shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.01;
     velvar = 0.0001;
     vistexisquadpoly = 1;    
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.5000000000;
     visalphafunc_s = "ADD";
     visalphastart = 205.000000000;
     trltexture_s = "JUSTWHITE.TGA";
};

INSTANCE GHOST_AXE1LOOP(GHOST_DOTS)
{

      ppsvalue = 290.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
     ppsislooping = 1;     
     ppsfps = 1.000000000;
     shptype_s = "MESH";
 	 shpmesh_s = "MAGICAXE.3DS"; 	 
//     shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.01;
     velvar = 0.0001;
     vistexisquadpoly = 1;    
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.5000000000;
     visalphafunc_s = "ADD";
     visalphastart = 205.000000000;
     trltexture_s = "JUSTWHITE.TGA";
     lsppartavg = 2100.100000000;
     lsppartvar = 600.100000000;          
};
INSTANCE GHOST_SWD2 (GHOST_DOTS)
{

      ppsvalue = 110.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
//   ppsislooping = 1;     
     ppsfps = 1.000000000;
     shptype_s = "MESH";
 	 shpmesh_s = "GHOST_SWD1.3DS"; 	 
//     shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     dirmode_s = "mesh";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.01;
     velvar = 0.0001;
     vistexisquadpoly = 1;    
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "165 0 240";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.5000000000;
     visalphafunc_s = "ADD";
     visalphastart = 205.000000000;
     trltexture_s = "JUSTWHITE.TGA";
};
///GHOSTEND
///GHOSTEND
///GHOSTEND
///GHOSTEND


INSTANCE ZBLOOD1 (C_PARTICLEFX)
{
     ppsvalue = 64.;
     ppscreateem_s = "ZBLOOD1_SPLAT";
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 30.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 750.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "BLOOD1.TGA";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};

INSTANCE ZMODELLANDDUST (C_PARTICLEFX)
{
     ppsvalue = 8.;
     shptype_s = "BOX";
     shpdim_s = "20 5 20";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 2.99999993e-002;
     velvar = 9.99999978e-003;
     lsppartavg = 550.;
     lsppartvar = 350.;
     visname_s = "PUFF.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "35 35";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 80.;
};

INSTANCE ZSKYNIGHT1 (C_PARTICLEFX)
{
     ppsvalue = 1.;
     shpdim_s = "800";
     velavg = 0.25;
     velvar = 5.00000007e-002;
     lsppartavg = 2000.;
     lsppartvar = 350.;
     visname_s = "ZSPARK1.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "9 13";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};

INSTANCE ZUNDERWATER (C_PARTICLEFX)
{
     ppsvalue = 500.000000000;
     shptype_s = "BOX";
     shpisvolume = 1;
     shpdim_s = "500 500 500";
     lsppartavg = 100000000.000000000;
     visname_s = "UNDERWATER_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 20.000000000;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE ZWATERRING (C_PARTICLEFX)
{
      ppsvalue = 1.000000000;
      ppsislooping = 0;
      dirmode_s = "RAND";
      lsppartavg = 2500.000000000;
      lsppartvar = 500.000000000;
      flycolldet_b = 0;
      visname_s = "WATERRING.TGA";
      visorientation_s = "VOB";
      vistexisquadpoly = 1;
      vistexanifps = 0.000000000;
      vistexaniislooping = 0;
      vistexcolorstart_s = "200 200 255";
      vistexcolorend_s = "200 255 255";
      vissizestart_s = "5 5";
      vissizeendscale = 5.072220325;
      visalphafunc_s = "ADD";
      visalphastart = 124.000000001;
};

INSTANCE PFX_WATERSPLASH (C_PARTICLEFX)
{
     ppsvalue = 35.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "CIRCLE";
     shpisvolume = 1;
     shpdim_s = "10 0 10";
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 30.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.200000003;
     velvar = 0.029999999;
     lsppartavg = 800.000000000;
     lsppartvar = 500.000000000;
     flygravity_s = "0 -0.0005 0";
     flycolldet_b = 3;
     visname_s = "WATERSPLASH1.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "150 200 255";
     vissizestart_s = "3 3";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE FIRED_OBJ (C_PARTICLEFX)
{
    ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
    
     ppsfps = 3.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000;
     shpdim_s = "120";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "humanburn.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 100 100";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "170 170";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
INSTANCE FIRED_OBJ2 (C_PARTICLEFX)
{
    ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "humanburn.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 100 100";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "20 20";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

