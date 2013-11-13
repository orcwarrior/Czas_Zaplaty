	
//////////////////////////////////////
//	
// 	Particle-Effects 
//	Instance-Definitions 
//	
//////////////////////////////////////
//////////////////////////////////////
//	I N V I S I B L E   D M G
//////////////////////////////////////
INSTANCE MFX_INVISIBLEDMG_INIT (C_PARTICLEFX)
{
     ppsvalue = 1.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 200.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "0 0";
     vissizeendscale = 0.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 0.000000000;
};

INSTANCE MFX_INVISIBLEDMG_CAST (C_PARTICLEFX)
{
     ppsvalue = 5.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 200 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.0;
     velvar = 0.0;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "40 40";
     vissizeendscale = 0.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 0.000000000;
};

INSTANCE MFX_INVISIBLEDMG_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "0 0";
     vissizeendscale = 0.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 0.000000000;
};
///   			XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   			XX S T U N I N G   B A L L XX
///   			XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
INSTANCE MFX_STUNINGBALL_INIT (C_PARTICLEFX) //MFX_STUNINGBALL_INIT
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 10 5 0.4 2";  
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "2";
     shpscalekeys_s = "1 2 6 4 0.4 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "CFLARERED.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "155 255 255";
     vistexcolorend_s = "155 155 255";
     vissizestart_s = "15 15";
     vissizeendscale = 2.20000000;
     visalphafunc_s = "ADD";
     visalphastart = 245.000000000;
     visalphaend = 205.000000000;
};

INSTANCE MFX_STUNINGBALL_CAST (C_PARTICLEFX) //MFX_STUNINGBALL_CAST
{

     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 10 0 5 0 0.4 2";  
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "2";
     shpscalekeys_s = "1 2 0.4 0.1 1 4 0.01 0.1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg =10.000000000001;
     velvar = 0.00000000;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "CFLARERED3.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "155 255 255";
     vistexcolorend_s = "155 155 255";
     vissizestart_s = "25 25";
     vissizeendscale = 4.20000000;
     visalphafunc_s = "ADD";
     visalphastart = 245.000000000;
     visalphaend = 205.000000000;
    
//      trlfadespeed = 1.800000000;
//      trltexture_s = "XBEAM3-.TGA";
//      trlwidth = 10.000000000;     
};
INSTANCE MFX_STUNINGBALL_COLLIDE (C_PARTICLEFX) //MFX_STUNINGBALL_COLLIDE
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";  
     ppscreateem_s = "MFX_STUNINGBALL_DUST";
     ppscreateemdelay = 3.000000000;  
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "2";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "CFLARERED.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "155 255 255";
     vistexcolorend_s = "155 155 255";
     vissizestart_s = "225 225";
     vissizeendscale = 0.10000000;
     visalphafunc_s = "ADD";
     visalphastart = 245.000000000;
     visalphaend = 205.000000000;
};
INSTANCE MFX_STUNINGBALL_COLLIDE2 (C_PARTICLEFX) //MFX_STUNINGBALL_COLLIDE
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";  
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "2";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "CFLARERED.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "155 255 255";
     vistexcolorend_s = "155 155 255";
     vissizestart_s = "225 225";
     vissizeendscale = 0.10000000;
     visalphafunc_s = "ADD";
     visalphastart = 245.000000000;
     visalphaend = 205.000000000;
};
INSTANCE MFX_STUNINGBALL_DUST (C_PARTICLEFX) //MFX_STUNINGBALL_DUST
{
    ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20";
     ppsissmooth = 1;
     ppsfps = 20.000000000;
	 ppsIsLooping = 0;     
     shptype_s = "CIRCLE";
     shpfor_s = "world";
     shpoffsetvec_s = "0 -130 0";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "20";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20";
     shpscalefps = 20.000000000;
     shpScaleIsSmooth=1;
     shpScaleIsLooping=0;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.001000000;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "133 100 65";
     vistexcolorend_s = "133 120 95";     
     vissizestart_s = "60 60";
     vissizeendscale = 2.000000000;
       visalphafunc_s = "BLEND";
     visalphastart = 225.000000000;
     visalphaend = 175.000000000;
     
};



///   			XXXXXXXXXXXXXXXXX
///   			XX M E T E O R XX
///   			XXXXXXXXXXXXXXXXX
INSTANCE MFX_METEOR_INIT (C_PARTICLEFX) //MFX_METEOR_INIT
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1";   
     shptype_s = "mesh";
     shpmesh_s = "Meteor_Hand.3ds";      
     shpmeshrender_b = 1;                      
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shpfor_s = "object";
     shpoffsetvec_s = "0 20 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "world";
     dirmodetargetpos_s = "0 152 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000000000001;
     velvar = 0.00000000;
     lsppartavg = 350.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIRE_COMPLETE_A0.TGA";
     visorientation_s = "none";//velo z malej nie ustawa sie do kamery
     vistexanifps = 12.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "26 26";
     vissizeendscale = 1.20000000;
     visalphafunc_s = "ADD";
     visalphastart = 235.000000000;
     visalphaend = 5.000000000;	
//      ppsvalue = 30.000000000;
//      ppsscalekeys_s = "1 5 2 1 1";  
// //      ppscreateem_s = "MFX_METEOR_INIT_FIREUP";
// //      ppscreateemdelay = 1.000000000;       
//      ppsislooping = 1;
//      ppsissmooth = 1;
//      ppsfps = 2.500000000;
//      shptype_s = "MESH";
//      shpmesh_s = "Meteor_Hand.3ds"; 
//      shpmeshrender_b = 1;              
//      shpfor_s = "object";
//      shpoffsetvec_s = "0 0 0";
//      shpdistribtype_s = "RAND";
//      shpisvolume = 1;
//      shpdim_s = "1.5";
//      shpscalekeys_s = "1";
//      shpscaleislooping = 1;
//      shpscaleissmooth = 1;
//      shpscalefps = 1.000000000;
//      dirmode_s = "TARGET";
//      dirfor_s = "object";
//      dirmodetargetfor_s = "OBJECT";
//      dirmodetargetpos_s = "0 0 0";
//      dirangleheadvar = 180.000000000;
//      dirangleelevvar = 180.000000000;
//      velavg = 0.020003000000;
//      velvar = 0.00000000;
//      lsppartavg = 300.000000000;
//      flygravity_s = "0 0 0";
//      flycolldet_b = 0;
//      visname_s = "FIRE2_A0.TGA";
//      visorientation_s = "VELO";
//      vistexanifps = 18.000000000;
//       vistexisquadpoly = 1;   
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "255 255 255";
//      vistexcolorend_s = "255 255 255";
//      vissizestart_s = "8 8";
//      vissizeendscale = 2.20000000;
//      visalphafunc_s = "ADD";
//      visalphastart = 165.000000000;
//      visalphaend = 125.000000000;
};

INSTANCE MFX_METEOR_INVEST (C_PARTICLEFX) //MFX_METEOR_INIT
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "1 4 0.5 1 1";  
    
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.500000000;
     shptype_s = "SPHERE";              
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1.5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.020003000000;
     velvar = 0.00000000;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIRE2_A0.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "8 8";
     vissizeendscale = 3.20000000;
     visalphafunc_s = "ADD";
     visalphastart = 165.000000000;
     visalphaend = 45.000000000;	

};

INSTANCE MFX_METEOR_CAST (C_PARTICLEFX) //MFX_METEOR_CAST
{
    ppsvalue = 50.000000000;
     ppsscalekeys_s = "0.3 1 1.8";  
//      ppscreateem_s = "MFX_METEOR_CAST_REDGLOW";
//      ppscreateemdelay = 1.000000000;       
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 15.000000000;
     shptype_s = "MESH";
     shpmesh_s = "METEOR_BIG.3ds"; 
     shpmeshrender_b = 1;         
     shpfor_s = "world";
     shpoffsetvec_s = "0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.1000000000001;
     velvar = 0.010000000;
     lsppartavg = 1700.000000000;
     lsppartavg = 1000.000000000;     
     flygravity_s = "0 -0.0001 0";
     visname_s = "FIRE2_A0.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "95 95";
     vissizeendscale = 0.10000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 55.000000000;
};
INSTANCE MFX_METEOR_CAST_REDGLOW (C_PARTICLEFX) //MFX_METEOR_CAST
{
     ppsvalue = 25.000000000;
     ppsscalekeys_s = "0.1 0.5 1";  
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "2";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "target";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000000001;
     velvar = 0.00000000;
     lsppartavg = 600.000000000;
     flygravity_s = "0 0 0";
     visname_s = "CFLARERED3.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "155 155 155";
     vissizestart_s = "395 395";
     vissizeendscale = 0.30000000;
     visalphafunc_s = "ADD";
     visalphastart = 225.000000000;
     visalphaend = 115.000000000;	
};  
INSTANCE MFX_METEOR_CAST_SMOKE (C_PARTICLEFX) //MFX_METEOR_CAST
{
    ppsvalue = 70.000000000;
     ppsscalekeys_s = "0.4 1";  
   
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpmeshrender_b = 1;         
     shpfor_s = "world";
     shpoffsetvec_s = "0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000010000000001;
     velvar = 0.00000000;
     lsppartavg = 2500.000000000;
     lsppartavg = 500.000000000;     
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "115 95 95";
     vistexcolorend_s = "1 1 1";
     vissizestart_s = "70 55";
     vissizeendscale = 3.00000000;
     visalphafunc_s = "BLEND";
     visalphastart = 215.000000000;
     visalphaend = 125.000000000;
};  
/*
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 10 0 5 0 0.4 2";  
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "2";
     shpscalekeys_s = "1 2 0.4 0.1 1 4 0.01 0.1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg =10.000000000001;
     velvar = 0.00000000;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "CFLARERED3.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "155 255 255";
     vistexcolorend_s = "155 155 255";
     vissizestart_s = "25 25";
     vissizeendscale = 4.20000000;
     visalphafunc_s = "ADD";
     visalphastart = 245.000000000;
     visalphaend = 205.000000000;
*/     
//      trlfadespeed = 1.800000000;
//      trltexture_s = "XBEAM3-.TGA";
//      trlwidth = 10.000000000;     
//};
INSTANCE MFX_METEOR_COLLIDE (C_PARTICLEFX) //MFX_METEOR_COLLIDE
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";  
     ppscreateem_s = "MFX_METEOR_FIRE";
     ppscreateemdelay = 1.000000000;  
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "2";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "CFLARERED.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "155 255 255";
     vistexcolorend_s = "155 155 255";
     vissizestart_s = "225 225";
     vissizeendscale = 14.10000000;
     visalphafunc_s = "ADD";
     visalphastart = 225.000000000;
     visalphaend = 220.000000000;
};
// INSTANCE MFX_METEOR_DUST (C_PARTICLEFX) //MFX_METEOR_DUST
// {
//     ppsvalue = 50.000000000;
//      ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 20 20 21 22 23 24 25 26 27 28 29 30";
//      ppsissmooth = 1;
//      ppsfps = 20.000000000;
//      ppscreateem_s = "MFX_METEOR_DUST2";
//      ppscreateemdelay = 1.000000000;     
//      shpIsVolume = 1;  
// 	 ppsIsLooping = 0;     
//      shptype_s = "CIRCLE";
//      shpfor_s = "world";
//      shpoffsetvec_s = "0 -130 0";
//      shpdistribtype_s = "UNIFORM";
//      shpdim_s = "20";
//      shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 20 20 21 22 23 24 25 26 27 28 29 30";
//      shpscalefps = 20.000000000;
//      shpScaleIsSmooth=1;
//      shpScaleIsLooping=0;
//      dirmode_s = "RAND";
//      dirfor_s = "object";
//      diranglehead = 90.000000000;
//      dirangleheadvar = 45.000000000;
//      dirangleelev = 90.000000000;
//      dirangleelevvar = 45.000000000;
//      velavg = 0.001000000;
//      lsppartavg = 4500.000000000;
//      lsppartvar = 300.000000000;
//      flygravity_s = "0";
//      visname_s = "GROUNDFOG.TGA";
//      visorientation_s = "VELO";
//      vistexisquadpoly = 1;
//      vistexanifps = 25.000000000;
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "133 100 65";
//      vistexcolorend_s = "133 120 95";     
//      vissizestart_s = "60 60";
//      vissizeendscale = 2.000000000;
//        visalphafunc_s = "BLEND";
//      visalphastart = 225.000000000;
//      visalphaend = 175.000000000;
//      
// };
INSTANCE MFX_METEOR_DUST (C_PARTICLEFX) //MFX_METEOR_DUST
{
    ppsvalue = 40.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35";
     ppsissmooth = 1;
     ppsfps = 60.000000000;
//      ppscreateem_s = "MFX_METEOR_GROUND";
//      ppscreateemdelay = 1.000000000;       
	 ppsIsLooping = 0;     
     shptype_s = "CIRCLE";
     shpfor_s = "world";
     shpoffsetvec_s = "0 -130 0";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "60";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35";
     shpscalefps = 60.000000000;
     shpScaleIsSmooth=1;
     shpScaleIsLooping=0;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.001000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 1300.000000000;
     flygravity_s = "0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";     
     vissizestart_s = "150 150";
     vissizeendscale = 3.000000000;
       visalphafunc_s = "BLEND";
     visalphastart = 225.000000000;
     visalphaend = 125.000000000;
     
};
INSTANCE MFX_METEOR_GROUND (C_PARTICLEFX)
{
     ppsvalue = 70.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 0.8 0.6 0.4 0.2";
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "700";
     shpscalekeys_s = "1 1.5 1.7 1.8 1.9 2 1.8 1.5 1.4 1.1 0.7 0.4 0.1";
     shpscaleislooping = 0;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleelev = 90.000000000;
     velavg = 0.029999999;
     lsppartavg = 1200.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 3;
     visname_s = "FIRE_COMPLETE_A1.TGA";
     visorientation_s = "0";//0?
     vistexisquadpoly = 1;
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "20 10 10";
     vissizestart_s = "50 15";
     vissizeendscale = 12.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "MFX_FIRERAIN_RAINTRAIL.TGA";
     mrktexture_s = "=";
};
INSTANCE MFX_METEOR_FIRE (C_PARTICLEFX) //MFX_METEOR_DUST
{
    ppsvalue = 160.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 0.8 0.6 0.4 0.2";
     ppsfps = 2.000000000;
     ppscreateem_s = "MFX_METEOR_DUST";
     ppscreateemdelay = 1.000000000;      
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 100 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "800";
     shpscalekeys_s = "1 1.2 1.5";
     shpscaleislooping = 0;
     shpscalefps = 3.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleelev = 90.000000000;
     velavg = 0.029999999;
     lsppartavg = 1000.000000000;
     lsppartvar = 700.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 3;
     visname_s = "FIRE_COMPLETE_A0.TGA";
     visorientation_s = "none";
     vistexisquadpoly = 1;
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "200 0 0";
     vissizestart_s = "50 50";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     
};
///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX HO L Y   L I G HT XX
///   													XXXXXXXXXXXXXXXXXXXXXXX
INSTANCE MFX_HOLYFIRE_INIT (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 1000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 10";
     vissizeendscale = 5;
     visalphafunc_s = "ADD";
     visalphastart = 255;

};
INSTANCE MFX_HOLYFIRE_INVEST(C_PARTICLEFX) //MFX_STUNINGBALL_INIT
{
     ppsvalue = 12.000000000;
     ppsscalekeys_s = "1";  
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "2";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 250.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "PFXFLARE2_A0.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "215 225 255";
     vissizestart_s = "15 15";
     vissizeendscale = 8.10000000;
     visalphafunc_s = "ADD";
     visalphastart = 225.000000000;
     visalphaend = 220.000000000;
};


INSTANCE MFX_HOLYFIRE_CAST (C_PARTICLEFX)
{   
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "WORLD";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 180;
     dirangleheadvar = 1;
     velavg = 0.00999999978;
     lsppartavg = 3000;
     lsppartvar = 500;
     flygravity_s = "0 0 0";
     visname_s = "PFXANI22.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 255;
 

};

INSTANCE MFX_HOLYFIRE_CAST2 (C_PARTICLEFX)
{   
     ppsvalue = 50;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "WORLD";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 180;
     dirangleheadvar = 1;
     velavg = 0.00999999978;
     lsppartavg = 3000;
     lsppartvar = 500;
     flygravity_s = "0 0 0";
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "26 26";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 205;
 

};

INSTANCE MFX_HOLYFIRE_COLLIDE (C_PARTICLEFX) //MFX_METEOR_COLLIDE
{
     ppsvalue = 12.000000000;
     ppsscalekeys_s = "1";  
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "2";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "PFXFLARE2_A0.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "215 225 255";
     vissizestart_s = "55 55";
     vissizeendscale = 7.10000000;
     visalphafunc_s = "ADD";
     visalphastart = 225.000000000;
     visalphaend = 220.000000000;
};


INSTANCE MFX_HOLYFIRE_BURN (C_PARTICLEFX)
{
     ppsvalue = 4.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30 5 5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "HOLYBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "235 245 255";
     vistexcolorend_s = "200 200 255";
     vissizestart_s = "5 5";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
INSTANCE MFX_HOLYFIRE_GLOW (C_PARTICLEFX)
{
     ppsvalue = 4.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30 5 5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 215.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX L I G H T L I N G XX
///   													XXXXXXXXXXXXXXXXXXXXXXX
INSTANCE MFX_Thunder_INIT (C_PARTICLEFX)
{
     ppsvalue = 15.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 7 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "10 10";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_Thunder_INIT_GLOW (C_PARTICLEFX)
{
     ppsvalue = 15.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5 5 5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "NONE";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = 90.000000000;
     velavg = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "15 15";
     vissizeendscale = 9.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 185.000000000;
};
INSTANCE MFX_Thunder_INVEST (C_PARTICLEFX)
{
     ppsvalue = 45.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
      ppsfps =9.0100000000;    
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 7 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "10 10";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_Thunder_INVEST_GLOW (C_PARTICLEFX)
{
     ppsvalue = 25.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 0.0100000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5 5 5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "NONE";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = 90.000000000;
     velavg = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "15 15";
     vissizeendscale = 9.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 185.000000000;
};
INSTANCE MFX_Thunder_CAST (C_PARTICLEFX)
{
     ppsvalue = 25.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "2";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.101000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "200 200";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 3.000000000;
     visalphaend = 2.000000000;
};
INSTANCE MFX_Thunder_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 45.000000000;
     ppsscalekeys_s = "1 1.1 1.2 1.3 1.5 1.8 2 2.2 2.5 2.8 3";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5 5 5";
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 1000";
     dirangleelev = 90.000000000;
     velavg = 0.150000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 40";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 195.000000000;
};
INSTANCE MFX_THUNDER_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpisvolume = 1;
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "1";
     ShpFOR_S =	"object";
	 shpoffsetvec_s		= "0 900 0";     
     dirmode_s = "none";
     dirfor_s = "object";
     diranglehead = 10.000000000;
     dirangleheadvar = 5.000000000;
     dirangleelev = -90.000000000;
     dirangleelevvar = 5.000000000;
     velavg = 0.0000000000001;
     velvar = 0.000000000001;
     lsppartavg = 600.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNINGNEU_BIG_A0.TGA";
     visorientation_s = "none";
     vistexanifps = 9;     
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "150 200 255";
     vissizestart_s = "250 1100";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
INSTANCE MFX_THUNDER_COLLIDE_BALL (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsfps = 10;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "1 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "1";
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 600.;
     lsppartvar = 50.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "250 250 250";
     vissizestart_s = "30 30";
     vissizeendscale = 50.5000000;
     visalphafunc_s = "ADD";
     visalphastart = 230.;
     visalphaend = 165.;   
};

INSTANCE MFX_THUNDER_COLLIDE_GLOW (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsfps = 10;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "1 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "30";
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 400.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "250 250 250";
     vissizestart_s = "30 30";
     vissizeendscale = 1000.5000000;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
     visalphaend = 1.;   
};
///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX LI F E   D R A IN XX
///   													XXXXXXXXXXXXXXXXXXXXXXX
INSTANCE MFX_LIFEDRAIN_BRIDGE (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1 2 3 2";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppscreateem_s = "MFX_LIFEDRAIN_CAST";
     ppscreateemdelay = 1.000000000;         
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1 3 5 3 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "WORLD";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.200000012;
     velvar = 0.050000003;
     lsppartavg = 800.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "70 0 0";
     vistexcolorend_s = "70 20 20";
     vissizestart_s = "20 20";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 185.000000000;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE MFX_LIFEDRAIN_INIT (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppscreateem_s = "MFX_LIFEDRAIN_INIT_SPARKS";
     ppscreateemdelay = 1.000000000;     
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 1050.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "PFXFLARE2_A0.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 50 1";
     vissizestart_s = "25 25";
     vissizeendscale = 1.00000000;
     visalphafunc_s = "ADD";
     visalphastart = 105.000000000;
     visalphaend = 115.000000000;
};
INSTANCE MFX_LIFEDRAIN_INIT_SPARKS (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
    // ppsislooping = 1;
     
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 1050.000000000;
     lsppartvar = 10.000000000;     
     flygravity_s = "0 0.000000001 0";
     flycolldet_b = 0;
     visname_s = "PFXFLARE3.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 110 110";
     vissizestart_s = "2 2";
     vissizeendscale = 1.5100000000;
     visalphafunc_s = "ADD";
     visalphastart = 1.000000000;
     visalphaend = 205.000000000;
};
INSTANCE MFX_LIFEDRAIN_CAST (C_PARTICLEFX)
{
      ppsvalue = 20.000000000;
     ppsfps = 10.000000000;
     ppscreateem_s = "MFX_LIFEDRAIN_CAST_DOTS";
     ppscreateemdelay = 1.000000000;       
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.049999998;
     velvar = 0.020000000;
     lsppartavg = 1800.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MAGICFOG.TGA";
     visorientation_s = "VELO";
     //vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 125 0";
     vistexcolorend_s = "255 70 0";
     vissizestart_s = "12 12";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
INSTANCE MFX_LifeDrain_INCOME (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 2";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "400";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     flyCollDet_B	 = 1;
     velavg = 0.200000000;
     velvar = 0.000100000;
     lsppartavg = 4000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     
     vistexaniislooping = 1;
     vistexcolorstart_s = "205 10 5";
     vistexcolorend_s = "250 0 8";
     vissizestart_s = "10 10";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 150.000000000;
     trlfadespeed = 1.500000000;
     trltexture_s = "XBEAM2.TGA";
     trlwidth = 5.000000000;
     
};
INSTANCE MFX_LIFEDRAIN_CAST_DOTS (C_PARTICLEFX)
{
      ppsvalue = 35.000000000;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "190";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.089999998;
     velvar = 0.020000000;
     lsppartavg = 1200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "DOTS.TGA";
     visorientation_s = "VELO";
     //vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 102 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "35 35";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_LIFEDRAIN_COLLIDE1 (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1 1 0.7 0.7 0.4 0.4";
     ppscreateem_s = "MFX_LIFEDRAIN_COLLIDE2";
     ppscreateemdelay = 1.000000000;       
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "400";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     velvar = 0.020000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
    visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "200 200";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "MAT_DEFAULT";
     visalphastart = 175.000000000;
};
INSTANCE MFX_LIFEDRAIN_COLLIDE2 (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1 1 0.7 0.7 0.4 0.4";
     
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000000001;
     velvar = 0.000000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0.00001 0";
     flycolldet_b = 0;
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     //vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "95 0 0";
     vistexcolorend_s = "85 0 0";
     vissizestart_s = "300 300";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "MAT_DEFAULT";
     visalphaend = 255.000000000;
};
//00000000000000000000000000
//   M I R R O R
//00000000000000000000000000

INSTANCE MFX_CURSE_INIT (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
//      ppscreateem_s = "MFX_CURSE_INIT_SPARKS";
//      ppscreateemdelay = 1.000000000;     
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.0000003000000;
     velvar = 0.000001000000;
     lsppartavg = 400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GALAXYYELLOW0000.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "25 25";
     vissizeendscale = 1.00000000;
     visalphafunc_s = "ADD";
     visalphastart = 145.000000000;
     visalphaend = 145.000000000;
};
INSTANCE MFX_CURSE_INIT_FOG (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
    // ppsislooping = 1;
     
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     //shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.028000000;
     velvar = 0.000100000;
     lsppartavg = 850.000000000;
     lsppartvar = 10.000000000;     
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "PFXANI22.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     //vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 15 0";
     vistexcolorend_s = "255 155 0";
     vissizestart_s = "19 19";
     vissizeendscale = 0.4100000000;
     visalphafunc_s = "ADD";
     visalphastart = 200.000000000;
     visalphaend = 105.000000000;

};
INSTANCE MFX_CURSE_CAST (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
//      ppscreateem_s = "MFX_CURSE_INIT_SPARKS";
//      ppscreateemdelay = 1.000000000;     
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.0000003000000;
     velvar = 0.000001000000;
     lsppartavg = 1200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GALAXYYELLOW0000.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 15.000000000;
};
INSTANCE MFX_CURSE_CAST_DOTS (C_PARTICLEFX)
{
      ppsvalue = 35.000000000;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "120";
     shpscalekeys_s = "1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.089999998;
     velvar = 0.020000000;
     lsppartavg = 2100.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "DOTS.TGA";
     visorientation_s = "VELO";
     //vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 102 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "25 25";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_CURSE_COLLIDE1 (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1 1 0.7 0.7 0.4 0.4";
//      ppscreateem_s = "MFX_CURSE_COLLIDE2";
//      ppscreateemdelay = 1.000000000;       
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "400";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     velvar = 0.020000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 50";
     vistexcolorend_s = "255 150 50";
     vissizestart_s = "300 300";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};
INSTANCE MFX_CURSE_COLLIDE2 (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1 1 0.7 0.7 0.4 0.4";
     
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000000001;
     velvar = 0.000000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0.00001 0";
     flycolldet_b = 0;
     visname_s = "MAGICFOG.TGA";
     visorientation_s = "VELO";
     //vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 75 0";
     vistexcolorend_s = "255 40 0";
     vissizestart_s = "300 300";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};


INSTANCE MFX_MIRROR_INIT (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
//      ppscreateem_s = "MFX_CURSE_INIT_SPARKS";
//      ppscreateemdelay = 1.000000000;     
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "7 17 1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 100.000000000;
     dirangleelevvar = 100.000000000;
     velavg = 0.0000000000001;
     velvar = 0.000000000001;
     lsppartavg = 250.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 161 255";
     vistexcolorstart_s = "0 161 255";

     vissizestart_s = "15 15";
     vissizeendscale = 1.00000000;
     visalphafunc_s = "ADD";
     visalphastart = 205.000000000;
     visalphaend = 105.000000000;
};

INSTANCE MFX_MIRROR_FRONTOFNPC (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
//      ppscreateem_s = "MFX_CURSE_INIT_SPARKS";
//      ppscreateemdelay = 1.000000000;     
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.0000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 60";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "1 110 1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 100.000000000;
     dirangleelevvar = 100.000000000;
     velavg = 0.0000000000001;
     velvar = 0.000000000001;
     lsppartavg = 1550.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 161 255";
     vistexcolorend_s = "0 0 255";

     vissizestart_s = "15 15";
     vissizeendscale = 1.00000000;
     visalphafunc_s = "ADD";
     visalphastart = 151.000000000;
     visalphaend = 255.000000000;
};
INSTANCE MFX_MIRROR_HIT (C_PARTICLEFX)
{
     ppsvalue = 70.000000000;
     ppsscalekeys_s = "1 2 2 5";
//      ppscreateem_s = "MFX_CURSE_INIT_SPARKS";
//      ppscreateemdelay = 1.000000000;     
     //ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.0000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 20 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "2 2 2";
     shpscalekeys_s = "1 2 3 5 10 30";
    // shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 90.000000000;
     dirangleelevvar = 90.000000000;
     velavg = 0.1500001;
     velvar = 0.0070001;
     lsppartavg = 2350.000000000;
     flygravity_s = "-0.0001 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 161 255";
     vistexcolorend_s = "0 0 0";

     vissizestart_s = "15 15";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 195.000000000;
};

INSTANCE MFX_MAGICSHIELD_INIT (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.050000001;
     lsppartavg = 1400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 50 255";    
     vissizestart_s = "10 10";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_MAGICSHIELD_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "";
     //ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 50 255";
     vissizestart_s = "20 20";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_MAGICSHIELD_HIT (C_PARTICLEFX)
{
     ppsvalue = 70.000000000;
     ppsscalekeys_s = "1 2 2 5";
//      ppscreateem_s = "MFX_CURSE_INIT_SPARKS";
//      ppscreateemdelay = 1.000000000;     
     //ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.0000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10 7 2";
     shpscalekeys_s = "1 2 3 5 10 30";
    // shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 90.000000000;
     dirangleelevvar = 90.000000000;
     velavg = 0.1500001;
     velvar = 0.0070001;
     lsppartvar = 2550.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 51 255";
     vistexcolorend_s = "255 255 255";

     vissizestart_s = "19 19";
     vissizeendscale = 0.600000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 195.000000000;
};


PROTOTYPE MAGICSHIELD_PROTO (C_PARTICLEFX)
{
   ppsvalue = 13.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 0;
   ppsislooping = 1;     
     ppsfps = 0.1300000000;
     shptype_s = "MESH";
 	 shpmesh_s = "Bip01 Head.3DS"; 	 
//     shpmeshrender_b = 1; 	     
      shpfor_s = "object";
  //   shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 0;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "object";
     velavg = 0.0051;
     velvar = 0.0011;
     lsppartavg = 1800.100000000;
     lsppartvar = 800.100000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     vistexisquadpoly = 1;    
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";    
     vistexcolorend_s = "50 50 195";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 175.000000000;       
     vissizestart_s = "6 6";  
     vissizeendscale = 3.000000000;     
};
INSTANCE MAGICSHIELD_Bip01_Head(MAGICSHIELD_PROTO)
{

    ppsvalue = 40.000000000;
 	 shpmesh_s = "Bip01 Head.3DS"; 	 
 	 shpoffsetvec_s = "7 0 0";
//     shpmeshrender_b = 1; 	     
   
};

INSTANCE MAGICSHIELD_Bip01_L_Calf(MAGICSHIELD_PROTO)
{



 	 shpmesh_s = "Bip01 L Calf.3DS"; 	 
};


INSTANCE MAGICSHIELD_Bip01_R_Calf(MAGICSHIELD_PROTO)
{


 	 shpmesh_s = "Bip01 R Calf.3DS";
};

INSTANCE MAGICSHIELD_Bip01_L_Forearm(MAGICSHIELD_PROTO)
{



 	 shpmesh_s = "Bip01 L Forearm.3DS"; 
};


INSTANCE MAGICSHIELD_Bip01_R_Forearm(MAGICSHIELD_PROTO)
{



 	 shpmesh_s = "Bip01 R Forearm.3DS"; 
};


INSTANCE MAGICSHIELD_Bip01_L_Thigh(MAGICSHIELD_PROTO)
{



 	 shpmesh_s = "Bip01 L Thigh.3DS"; 
};


INSTANCE MAGICSHIELD_Bip01_R_Thigh(MAGICSHIELD_PROTO)
{



 	 shpmesh_s = "Bip01 R Thigh.3DS"; 	 
};


INSTANCE MAGICSHIELD_Bip01_L_UpperArm(MAGICSHIELD_PROTO)
{


 	 shpmesh_s = "Bip01 L UpperArm.3DS"; 
};


INSTANCE MAGICSHIELD_Bip01_R_UpperArm(MAGICSHIELD_PROTO)
{


 	 shpmesh_s = "Bip01 R UpperArm.3DS"; 
};



INSTANCE MAGICSHIELD_Bip01_Spine2(MAGICSHIELD_PROTO)
{



 	 shpmesh_s = "Bip01 Spine2.3DS"; 	
};


INSTANCE MAGICSHIELD_Bip01(MAGICSHIELD_PROTO)
{



 	 shpmesh_s = "Bip01.3DS"; 	 
};




INSTANCE MFX_ICEARMOR_SMOKE (C_PARTICLEFX)
{
    ppsvalue = 130.000000000;
     ppsscalekeys_s = "2 2 2 2 1 1 1 1 0.3 0.4 0.8 0.6 1.3";
     ppsissmooth = 1;
     ppsfps = 2.0000000000;     
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100 70 20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "220 255 255";
     vistexcolorend_s = "220 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 0.5000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
INSTANCE MFX_ICEARMOR_INVEST(C_PARTICLEFX)
{
     ppsvalue =	33.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 0.0100000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "40 20 15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "NONE";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = 90.000000000;
     velavg = 0.000010001;
     lsppartavg = 1000.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 -0.0001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "25 25";
     vissizeendscale = 9.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 185.000000000;
};

PROTOTYPE ICEARMOR_PROTO (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1 0.4 0.7 0.9";
     ppsislooping = 1;
     ppsissmooth = 0;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "5";
     shpscalekeys_s = "1 2 1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.500000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     velvar = 0.000100000;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "17 17";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 155.000000000;
     visalphaend = 165.000000000;  
};
INSTANCE ICEARMOR_Bip01_Head(ICEARMOR_PROTO)
{

    ppsvalue = 40.000000000;
 	 shpmesh_s = "Bip01 Head.3DS"; 	 
 	 shpoffsetvec_s = "7 0 0";
//     shpmeshrender_b = 1; 	     
   
};

INSTANCE ICEARMOR_Bip01_L_Calf(ICEARMOR_PROTO)
{



 	 shpmesh_s = "Bip01 L Calf.3DS"; 	 
};


INSTANCE ICEARMOR_Bip01_R_Calf(ICEARMOR_PROTO)
{


 	 shpmesh_s = "Bip01 R Calf.3DS";
};

INSTANCE ICEARMOR_Bip01_L_Forearm(ICEARMOR_PROTO)
{



 	 shpmesh_s = "Bip01 L Forearm.3DS"; 
};


INSTANCE ICEARMOR_Bip01_R_Forearm(ICEARMOR_PROTO)
{



 	 shpmesh_s = "Bip01 R Forearm.3DS"; 
};


INSTANCE ICEARMOR_Bip01_L_Thigh(ICEARMOR_PROTO)
{



 	 shpmesh_s = "Bip01 L Thigh.3DS"; 
};


INSTANCE ICEARMOR_Bip01_R_Thigh(ICEARMOR_PROTO)
{



 	 shpmesh_s = "Bip01 R Thigh.3DS"; 	 
};


INSTANCE ICEARMOR_Bip01_L_UpperArm(ICEARMOR_PROTO)
{


 	 shpmesh_s = "Bip01 L UpperArm.3DS"; 
};


INSTANCE ICEARMOR_Bip01_R_UpperArm(ICEARMOR_PROTO)
{


 	 shpmesh_s = "Bip01 R UpperArm.3DS"; 
};



INSTANCE ICEARMOR_Bip01_Spine2(ICEARMOR_PROTO)
{



 	 shpmesh_s = "Bip01 Spine2.3DS"; 	
};


INSTANCE ICEARMOR_Bip01(ICEARMOR_PROTO)
{



 	 shpmesh_s = "Bip01.3DS"; 	 
};

INSTANCE MFX_ICEARMOR_INIT (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "1";
     //ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "5";
     shpscalekeys_s = "1 2 1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.500000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     velvar = 0.000100000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

// INSTANCE PartikelEffekt1 (C_ParticleFX) 
// INSTANCE PartikelEffekt1 (C_ParticleFXProto) 
INSTANCE MFX_FIRE (C_PARTICLEFX)
{
     ppsvalue = 4.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30 5 5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 0";
     vissizestart_s = "5 5";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  P R A C T I C E  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE PRACTICEMAGIC_01A (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1";
     ppsfps = 5.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "45 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000100000;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_LIGHT_SINGLERAY2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE PRACTICEMAGIC_01B (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1 1";
     ppsfps = 5.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "45 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1 1 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000100000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_LIGHT_SINGLERAY2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 10";
     vissizeendscale = 50.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE PRACTICEMAGIC_02a (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1";
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.050000001;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     visname_s = "TELSTURM.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "100 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE PRACTICEMAGIC_02B (C_PARTICLEFX)
{
     ppsvalue = 500.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     ppscreateem_s = "=";
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -100 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "50";
     shpmesh_s = "TELEPORT_AURA.3ds";
     shpscalekeys_s = "1";
     shpscalefps = 5.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 3000.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 100 255";
     vissizestart_s = "40 40";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE PracticeMagic_03 (C_PARTICLEFX)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "";
     //ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE PRACTICEMAGIC_04 (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdim_s = "8";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10";
     shpscalefps = 20.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.200000003;
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.001 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "80 80";
     vissizeendscale = 0.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S C R I P T      XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_TELEPORT_SKRIPT (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1";
     ppsfps = 3.000000000;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "-35 0 20";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "1";
     shpmesh_s = "TELEPORT_AURA.3ds";
     shpscalekeys_s = "1";
     shpscalefps = 5.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     visname_s = "TELSTURM.TGA";
     vistexcolorstart_s = "0 200 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S P A W N   F X  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_SPAWN_CAST (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 1.000000000;
     ppscreateem_s = "MFX_SPAWN_CHILD";
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 15 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1 0.3 1.2 0.8.0.1 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     velavg = 0.001000000;
     lsppartavg = 1000.000000000;
     visname_s = "MFX_LIGHT_SINGLERAY.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 200";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};


INSTANCE MFX_SPAWN_CHILD (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 15 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "30";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20";
     shpscaleislooping = 1;
     shpscalefps = 20.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     velavg = 0.010000000;
     lsppartavg = 500.000000000;
     visname_s = "MFX_LIGHT_SINGLERAY.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 100";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXX
///   													XX  L I G H T  XX
///   													XXXXXXXXXXXXXXXXX


INSTANCE MFX_LIGHT_INIT (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 0.020000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 15 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1 0.3 1.2 0.8.0.1 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     velavg = 0.001000000;
     lsppartavg = 150.000000000;
     visname_s = "MFX_LIGHT_SINGLERAY.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "3 20";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};

INSTANCE MFX_LIGHT_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 250.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsfps = 0.200000000;
     ppscreateem_s = "MFX_LIGHT_ORIGIN_LESS";
     ppscreateemdelay = 80000.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     //ADDED October 15, 2009 Fix cuz strange things happened (vfx was to low offset)
     shpoffsetvec_s = "70 1 1";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1 0.3 1.2 0.8.0.1 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     velavg = 0.001000000;
     lsppartavg = 300.000000000;
     lsppartvar = 100.000000000;
     visname_s = "MFX_LIGHT_SINGLERAY.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "3 30";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};

INSTANCE MFX_LIGHT_ORIGIN_LESS (C_PARTICLEFX)
{
     ppsvalue = 250.000000000;
     ppsscalekeys_s = "1 1 1 1";
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1 0.3 1.2 0.8.0.1 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     velavg = 0.001000000;
     lsppartavg = 300.000000000;
     lsppartvar = 100.000000000;
     visname_s = "MFX_LIGHT_SINGLERAY.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "200 128 128";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "3 30";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E B O L T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_FIREBOLT_INIT (C_PARTICLEFX)
{
     ppsvalue = 500.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "7";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 150";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "2 2";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIREBOLT_CAST (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "20 5 5";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "15 5 5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "4 4";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIREBOLT_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "10 10";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

/// 
INSTANCE MFX_FIREWEAP (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 7 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "8 8";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
//  													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E B A L L  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_FIREBALL_INIT (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 7 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "8 8";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIREBALL_INVEST_BLAST (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1 2 2 2 3 3 3 4 4 4 3 3 3 2 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 25.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "6";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 9 8 7 6 5 4 3 2 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 25.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 200.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "10 10";
     vissizeendscale = 6.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

PROTOTYPE MFX_FIREBALL_INVEST_PROTO (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "10 10";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
};



INSTANCE MFX_FIREBALL_INVEST	(MFX_FIREBALL_INVEST_PROTO)
{
	 ppsvalue = 10;
	 lsppartavg = 1000.000000000;
	 vistexcolorstart_s = "200 50 50";
	 vistexcolorend_s = "200 0 0";
     vissizeendscale = 5.000000000;
     shpdim_s = "6";
     visalphastart = 180;
};

INSTANCE MFX_FIREBALL_INVEST_L1 (MFX_FIREBALL_INVEST_PROTO)
{
	 ppsvalue = 10;
	 lsppartavg = 1000.000000000;
	 vistexcolorstart_s = "200 100 100";
     vistexcolorend_s = "200 50 50";
     vissizeendscale = 5.000000000;
     shpdim_s = "6";
     visalphastart = 180;
};

INSTANCE MFX_FIREBALL_INVEST_L2 (MFX_FIREBALL_INVEST_PROTO)
{
	 ppsvalue = 13;
	 lsppartavg = 1300.000000000;
	 vistexcolorstart_s = "220 150 150";
     vistexcolorend_s = "220 100 100";
     vissizeendscale = 6.000000000;
     shpdim_s = "14";
     visalphastart = 200;
};

INSTANCE MFX_FIREBALL_INVEST_L3 (MFX_FIREBALL_INVEST_PROTO)
{
	 ppsvalue = 16;
	 lsppartavg = 1600.000000000;
	 vistexcolorstart_s = "235 200 200";
     vistexcolorend_s = "235 150 150";
     vissizeendscale = 7.000000000;
     shpdim_s = "22";
     visalphastart = 220;
};

INSTANCE MFX_FIREBALL_INVEST_L4 (MFX_FIREBALL_INVEST_PROTO)
{
	 ppsvalue = 20;
	 lsppartavg = 2000.000000000;
	 vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 200";
     vissizeendscale = 8.000000000;
     shpdim_s = "30";
     visalphastart = 255;
};



PROTOTYPE MFX_FIREBALL_CAST_PROTO (C_PARTICLEFX)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "200 150 0";
     vissizestart_s = "15 15";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIREBALL_CAST (MFX_FIREBALL_CAST_PROTO)
{
	 vistexcolorstart_s = "200 100 100";
     vistexcolorend_s = "200 0 0";
     vissizeendscale = 1.000000000;
     lsppartavg = 200.000000000;
     shpdim_s = "10";
     visalphastart = 180;
};

INSTANCE MFX_FIREBALL_CAST_L1 (MFX_FIREBALL_CAST_PROTO)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 30 30";
     vistexcolorend_s = "200 0 0";
     vissizestart_s = "15 15";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 180.000000000;
};

INSTANCE MFX_FIREBALL_CAST_L2 (MFX_FIREBALL_CAST_PROTO)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 60 60";
     vistexcolorend_s = "220 0 0";
     vissizestart_s = "15 15";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 200.000000000;
};

INSTANCE MFX_FIREBALL_CAST_L3 (MFX_FIREBALL_CAST_PROTO)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 230 230";
     vistexcolorend_s = "235 0 0";
     vissizestart_s = "15 15";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 220.000000000;
};

INSTANCE MFX_FIREBALL_CAST_L4 (MFX_FIREBALL_CAST_PROTO)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "40";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "15 15";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

PROTOTYPE MFX_FIREBALL_COLLIDE_PROTO (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsfps = 10.000000000;
     ppscreateem_s = "MFX_FIREBALL_COLLIDE_WALLGLOW";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "10 10";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_FIREBALL_COLLIDE1	 (MFX_FIREBALL_COLLIDE_PROTO)
{
     ppsvalue = 10.000000000;
     lsppartavg = 1400.000000000;
     vissizeendscale = 10.000000000;
     visalphastart = 130.000000000;
};

INSTANCE MFX_FIREBALL_COLLIDE2	 (MFX_FIREBALL_COLLIDE_PROTO)
{
     ppsvalue = 20.000000000;
     lsppartavg = 1600.000000000;
     vissizeendscale = 12.0000000;
     visalphastart = 180.000000000;
};

INSTANCE MFX_FIREBALL_COLLIDE3	 (MFX_FIREBALL_COLLIDE_PROTO)
{
     ppsvalue = 30.000000000;
     lsppartavg = 1800.000000000;
     vissizeendscale = 14.000000000;
     visalphastart = 220.000000000;
     ppscreateem_s = "MFX_FIREBALL_COLLIDE_SPARKS";
};

INSTANCE MFX_FIREBALL_COLLIDE4	 (MFX_FIREBALL_COLLIDE_PROTO)
{
     ppsvalue = 40.000000000;
     lsppartavg = 2000.000000000;
     vissizeendscale = 16.000000000;
     visalphastart = 255.000000000;
     ppscreateem_s = "MFX_FIREBALL_COLLIDE_SPARKS";
};


INSTANCE MFX_FIREBALL_COLLIDE_SPARKS (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpmesh_s = "ITMI_RING_01.3DS";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.200000003;
     velvar = 0.050000001;
     lsppartavg = 5000.000000000;
     flygravity_s = "0 -0.0005 0";
     flycolldet_b = 1;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE MFX_FIREBALL_COLLIDE_WALLGLOW (C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsscalekeys_s = "5 5 4 4 3 3 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpmesh_s = "ITMI_RING_01.3DS";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     lsppartavg = 1500.000000000;
     flygravity_s = "0 0.00004 0";
     flycolldet_b = 1;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "2 2";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
};
//  													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E B A L L  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_FIREWALL_INIT (C_PARTICLEFX)
{
     ppsvalue = 27.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
    // dirmodetargetpos_s = "0 7 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.1000000;
     lsppartavg = 500.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "DECAL_HUMANCONTROL_DISABLED.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
      vistexisquadpoly = 1;
     vistexcolorstart_s = "160 240 225";
     vistexcolorend_s = "115 240 215";
     vissizestart_s = "20 20";
     vissizeendscale = 1.300000000;
     visalphafunc_s = "ADD";
     visalphastart = 175.000000000;
     visalphaend = 1.000000000;
};

INSTANCE MFX_FIREWALL_INVEST_BLAST (C_PARTICLEFX)
{
     ppsvalue = 25.000000000;
     ppsscalekeys_s = "1";
     ppscreateem_s = "MFX_FIREWALL_INVEST_BLAST_2";
     ppscreateemdelay = 40.000000000;     
     ppsissmooth = 1;
     ppsfps = 20.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "3";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 20.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 1300.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "CFLAREBLUE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexisquadpoly = 1;     
     vistexcolorstart_s = "195 195 195";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "25 25";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 1.000000000;
};
INSTANCE MFX_FIREWALL_INVEST_BLAST_2 (C_PARTICLEFX)
{
     ppsvalue = 25.000000000;
     ppsscalekeys_s = "1";

     ppsissmooth = 1;
     ppsfps = 20.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "3";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 20.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 1300.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "CFLAREBLUE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexisquadpoly = 1;     
     vistexcolorstart_s = "115 155 195";
     vistexcolorend_s = "25 105 255";
     vissizestart_s = "35 35";
     vissizeendscale = 6.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 185.000000000;
     visalphaend = 1.000000000;

};

PROTOTYPE MFX_FIREWALL_INVEST_PROTO (C_PARTICLEFX)
{
     ppsvalue = 25.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "105";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "PFXANI22.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexisquadpoly = 1;          
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "220 220 220";
     vissizestart_s = "15 15";
     vissizeendscale = 9.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
     visalphaend = 100.000000000;
};



INSTANCE MFX_FIREWALL_INVEST	(MFX_FIREWALL_INVEST_PROTO)
{
	 ppsvalue = 10;
	 lsppartavg = 1000.000000000;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 220";
     vissizeendscale = 5.000000000;
     shpdim_s = "6";
     visalphastart = 180;
};

INSTANCE MFX_FIREWALL_INVEST_L1 (MFX_FIREWALL_INVEST_PROTO)
{
	 ppsvalue = 10;
	 lsppartavg = 200.000000000;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "220 220 220";
     vissizeendscale = 5.000000000;
     shpdim_s = "6";
     visalphastart = 180;
};

INSTANCE MFX_FIREWALL_INVEST_L2 (MFX_FIREWALL_INVEST_PROTO)
{
	 ppsvalue = 13;
	 lsppartavg = 250.000000000;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 220";
     vissizeendscale = 6.000000000;
     shpdim_s = "14";
     visalphastart = 200;
};

INSTANCE MFX_FIREWALL_INVEST_L3 (MFX_FIREWALL_INVEST_PROTO)
{
	 ppsvalue = 16;
	 lsppartavg = 300.000000000;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "220 220 220";
     vissizeendscale = 7.000000000;
     shpdim_s = "22";
     visalphastart = 70;
};

INSTANCE MFX_FIREWALL_INVEST_L4 (MFX_FIREWALL_INVEST_PROTO)
{
	 ppsvalue = 78;
	 lsppartavg = 450.000000000;
     vistexcolorstart_s = "115 215 255";
     vistexcolorend_s = "0 0 220";
     vissizeendscale = 3.8000000000;
     shpdim_s = "75";
     visalphastart = 155;
     visalphaend = 5;
};



PROTOTYPE MFX_FIREWALL_CAST_PROTO (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexisquadpoly = 1;     
     vistexcolorstart_s = "175 100 255";
     vistexcolorend_s = "255 100 250";
     vissizestart_s = "15 15";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 55.000000000;
};

INSTANCE MFX_FIREWALL_CAST (MFX_FIREWALL_CAST_PROTO)
{
     ppsvalue = 350.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.08000000;
     velvar = 0.009999999;
     lsppartavg = 1500.000000000;
     lsppartvar = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "ELECTRICBLUE0000.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "215 215 165";
     vistexcolorend_s = "75 100 200";
     vissizestart_s = "30 30";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;	
     visalphastart = 55.000000000;	
// 	 vistexcolorstart_s = "200 100 100";
//      vistexcolorend_s = "200 0 0";
//      vissizeendscale = 1.000000000;
//      lsppartavg = 200.000000000;
//      shpdim_s = "15";
//      visalphastart = 250;

};

INSTANCE MFX_FIREWALL_COLLIDE_MISSLE (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsfps = 10.0000000000;
     ppsscalekeys_s = "1"; 
     ppscreateemdelay = 70.0;         
     ppscreateem_s = "MFX_FIREWALL_COLLIDE3";

     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1 2 3 5 5 5 9";     
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "RAND";
     dirfor_s = "world";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.4000000;
     velvar = 0.019999999;
     lsppartavg = 1000.000000000;
     lsppartvar = 409.000000000;
     flygravity_s = "0 -0.00001 0";
     flycolldet_b = 1;
     visname_s = "PFXANI22.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexisquadpoly = 1;     
     vistexcolorstart_s = "55 100 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "80 80";
     vissizeendscale = 4.1000000000;
     visalphafunc_s = "ADD";
     visalphastart = 15.000000000;
     visalphaend = 255.000000000;
};
PROTOTYPE MFX_FIREWALL_COLLIDE_PROTO (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsfps = 10.000000000;
     ppscreateem_s = "MFX_FIREWALL_COLLIDE_WALLGLOW";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "CFLAREBLUE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexisquadpoly = 1;     
     vistexcolorstart_s = "55 155 255";
     vistexcolorend_s = "50 150 250";
     vissizestart_s = "7 7";
     vissizeendscale = 100.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphastart = 1.000000000;
};


INSTANCE MFX_FIREWALL_COLLIDE3	 (MFX_FIREWALL_COLLIDE_PROTO)
{
     ppsvalue = 10.000000000;
     lsppartavg = 500.000000000;
     vissizeendscale = 84.000000000;
     visalphastart = 100.000000000;
     ppscreateem_s = "MFX_FIREWALL_COLLIDE_SPARKS";
};

INSTANCE MFX_FIREWALL_COLLIDE4	 (MFX_FIREWALL_COLLIDE_PROTO)
{
     ppsvalue = 40.000000000;
     lsppartavg = 2000.000000000;
     vissizeendscale = 16.000000000;
     visalphastart = 255.000000000;
     ppscreateem_s = "MFX_FIREWALL_COLLIDE_SPARKS";
};


INSTANCE MFX_FIREWALL_COLLIDE_SPARKS (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpmesh_s = "ITMI_RING_01.3DS";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.400000003;
     velvar = 0.050000001;
     lsppartvar = 6000.000000000;
     lsppartavg = 3000.000000000;     
     flygravity_s = "0 -0.0004 0";
     flycolldet_b = 1;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "5 40 255";
     vistexcolorend_s = "5 30 200";
     vissizestart_s = "30 30";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE MFX_FIREWALL_COLLIDE_WALLGLOW (C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsscalekeys_s = "5 5 4 4 3 3 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpmesh_s = "ITMI_RING_01.3DS";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     lsppartavg = 1500.000000000;
     flygravity_s = "0 0.00004 0";
     flycolldet_b = 1;
     visname_s = "DECAL_HEAL.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "2 2";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 1.000000000;
     visalphaend = 255.000000000;     
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E S T O R M  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_FIRESTORM_INIT (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 100 0";
     vissizestart_s = "6 6";
     vissizeendscale = 6.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIRESTORM_INVESTBLAST1 (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1 2 3 2";
     ppsissmooth = 1;
     ppsfps = 6.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpdim_s = "10";
     shpscalekeys_s = "1 2 3 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 6.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 100";
     vistexcolorend_s = "255 50 50";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIRESTORM_INVESTBLAST2 (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1 2 4 2";
     ppsissmooth = 1;
     ppsfps = 6.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpdim_s = "10";
     shpscalekeys_s = "1 2 4 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 6.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 100";
     vistexcolorend_s = "255 50 50";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIRESTORM_INVESTBLAST3 (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1 3 5 3";
     ppsissmooth = 1;
     ppsfps = 6.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpdim_s = "10";
     shpscalekeys_s = "1 3 5 3";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 6.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 100";
     vistexcolorend_s = "255 50 50";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_FIRESTORM_INVESTBLAST4 (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1 4 6 4";
     ppsissmooth = 1;
     ppsfps = 6.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpdim_s = "10";
     shpscalekeys_s = "1 4 6 4";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 6.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 100";
     vistexcolorend_s = "255 50 50";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE MFX_FIRESTORM_CAST (C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 100 0";
     vissizestart_s = "6 6";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_FIRESTORM_SPREAD (C_PARTICLEFX)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 50.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.449999988;
     velvar = 0.029999999;
     lsppartavg = 1400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FIRERAIN_RAIN.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 100";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trlfadespeed = 1.500000000;
     trltexture_s = "MFX_FIRERAIN_RAINTRAIL.TGA";
     trlwidth = 8.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E R A I N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_FIRERAIN_INIT (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 20 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 40.000000000;
     dirangleelev = -89.000000000;
     velavg = 0.000100000;
     lsppartavg = 100.000000000;
     lsppartvar = 0.000000000;
     flygravity_s = "0 -0.003 0";
     visname_s = "MFX_FIRERAIN_RAIN.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 100 0";
     vistexcolorend_s = "200 200 0";
     vissizestart_s = "2 5";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_FIRERAIN_INVESTGLOW (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "100 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10 1000 10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = -89.000000000;
     velavg = 0.001000000;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0.001 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "10 50";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE MFX_FIRERAIN_RAIN (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1 1 1 1 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsfps = 2.000000000;
     ppscreateem_s = "MFX_FIRERAIN_GROUND";
     ppscreateemdelay = 4000.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 1000 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscalefps = 15.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     diranglehead = 10.000000000;
     dirangleheadvar = 5.000000000;
     dirangleelev = -90.000000000;
     dirangleelevvar = 5.000000000;
     velavg = 0.699999988;
     velvar = 0.300000012;
     lsppartavg = 2000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0005 0";
     visname_s = "MFX_FIRERAIN_RAIN_BIG.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 60";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
     trlfadespeed = 0.699999988;
     trltexture_s = "MFX_FIRERAIN_RAINTRAIL.TGA";
     trlwidth = 8.000000000;
};

INSTANCE MFX_FIRERAIN_GROUND (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 0.8 0.6 0.4 0.2";
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscalefps = 15.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleelev = 90.000000000;
     velavg = 0.029999999;
     lsppartavg = 2000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 3;
     visname_s = "FIRE_COMPLETE_A1.TGA";
     visorientation_s = "0";
     vistexisquadpoly = 1;
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "20 0 0";
     vissizestart_s = "50 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "MFX_FIRERAIN_RAINTRAIL.TGA";
     mrktexture_s = "=";
};

INSTANCE MFX_FIRERAIN_TARGET (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 0.8 0.8 0.8 0.6 0.6 0.3";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -100 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscalefps = 15.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.000100000;
     lsppartavg = 2500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "WHITECLOUD.TGA";
     visorientation_s = "NONE";
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 100 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "100 200";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};



///   													XXXXXXXXXXXXXXXXX
///   													XX  S P E E D  XX
///   													XXXXXXXXXXXXXXXXX


INSTANCE MFX_SPEED_FOOTSTEPS (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 180.000000000;
     dirangleheadvar = 1.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 150 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trlfadespeed = 0.100000001;
     trltexture_s = "WHITECLOUD.TGA";
};


///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T E L E P O R T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_TELEPORT_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.050000001;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     visname_s = "TELSTURM.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "100 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_TELEPORT_INVEST (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "-35 0 20";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "1";
     shpmesh_s = "TELEPORT_AURA.3ds";
     shpscalekeys_s = "1";
     shpscalefps = 5.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     visname_s = "TELSTURM.TGA";
     vistexcolorstart_s = "0 200 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
INSTANCE MFX_TELEPORT_RING (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     ppscreateem_s = "=";
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -100 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "100";
     shpmesh_s = "TELEPORT_AURA.3ds";
     shpscalekeys_s = "1";
     shpscalefps = 5.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 3000.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 100 255";
     vissizestart_s = "40 40";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_TELEPORT_CAST (C_PARTICLEFX)
{
     ppsvalue = 2000.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "-30 0 30";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpisvolume = 1;
     shpdim_s = "1";
     shpmesh_s = "TELEPORT_AURA.3ds";
     shpscalekeys_s = "1";
     shpscalefps = 5.000000000;
     dirmode_s = "RAND";
     dirfor_s = "WORLD";
     velavg = 0.090000004;
     lsppartavg = 600.000000000;
     lsppartvar = 500.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "TELSTURM.TGA";
     vistexcolorstart_s = "0 200 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};


///   													XXXXXXXXXXXXXXX
///   													XX  H E A L  XX
///   													XXXXXXXXXXXXXXX

INSTANCE MFX_HEAL_INIT (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsislooping = 1;
     ppsissmooth = 0;
     ppsfps = 5.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "world";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "6";
     shpscalekeys_s = "2 1.5 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 500.000000000;
     visname_s = "TELSTURM.TGA";
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 140.000000000;
};

INSTANCE MFX_HEAL_START (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "-10 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "50";
     shpscalekeys_s = "2 1.5 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 3000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "SIMPLEGLOW.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 100 255";
     vissizestart_s = "6 6";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "WHITE.TGA";
};

INSTANCE MFX_HEAL_INVEST (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 2";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "300";
     shpmesh_s = "HEALBODY.3DS";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.500000000;
     velvar = 0.000100000;
     lsppartavg = 4000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "WHITECLOUD.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "1 1";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 150.000000000;
     trlfadespeed = 1.000000000;
     trltexture_s = "WHITECLOUD.TGA";
     trlwidth = 10.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T R A N S F O R M    XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_TRANSFORM_INIT (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.150000006;
     velvar = 0.200000003;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "WAVEOFINSANITY_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 20.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "`NING_BIG_A0.TGA";
     trlwidth = 2.000000000;
};

INSTANCE MFX_TRANSFORM_GLOW (C_PARTICLEFX)
{
     ppsvalue = 800.000000000;
     ppsscalekeys_s = "1 1 1 1 0.8 0.6 0.4 0.2";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "150";
     shpmesh_s = "COLDUMMY.3DS";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.001000000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 128 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 12.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 200.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

INSTANCE MFX_TRANSFORM_BLEND (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "WHITECLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

INSTANCE MFX_TRANSFORM_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1 1 1 1 2 2 3 3 4 4";
     ppsissmooth = 1;
     ppsislooping = 1;
     ppsfps = 2.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.600000024;
     velvar = 0.200000003;
     lsppartavg = 400.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "WAVEOFINSANITY_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 20.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
     trlwidth = 3.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T R A N S F O R M    ( S P E C I E S )  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


///   													XXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  L I G H T N I N G  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_LIGHTNING_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1 2 1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.500000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     velvar = 0.000100000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 255 255";
     vistexcolorend_s = "0 100 255";
     vissizestart_s = "15 15";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_LIGHTNING_SWD (C_PARTICLEFX)
{
     ppsvalue = 65.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1 2 1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.500000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     velvar = 0.000100000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 255 255";
     vistexcolorend_s = "0 100 255";
     vissizestart_s = "15 15";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_LIGHTNING_TARGET (C_PARTICLEFX)
{
     ppsvalue = 25.000000000;
     ppsscalekeys_s = "1 2 1 0.7 0.4 0.1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     ppsIsLooping =1;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "60";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     velvar = 0.000100000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 190 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "10 10";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 150.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  C H A I N - L I G H T N I N G  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T H U N D E R B O L T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_THUNDERBOLT_INIT (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 200.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "6 6";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 180.000000000;
};

INSTANCE MFX_THUNDERBOLT_CAST (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "6 6";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE MFX_THUNDERBOLT_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T H U N D E R B A L L  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
INSTANCE MFX_THUNDERBALL_INIT (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 7 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_THUNDERSPELL_ELECTRO.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_THUNDERBALL_INVEST_BLAST (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 25.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "3";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 9 8 7 6 5 4 3 2 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 25.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 140.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_THUNDERSPELL_ELECTRO.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "40 40";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
     visalphaend = 100.000000000;
};

PROTOTYPE MFX_THUNDERBALL_INVEST_PROTO (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_THUNDERSPELL_ELECTRO.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "10 10";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
     visalphaend = 100.000000000;
};



INSTANCE MFX_THUNDERBALL_INVEST	(MFX_THUNDERBALL_INVEST_PROTO)
{
	 ppsvalue = 10;
	 vissizeendscale = 5.000000000;
     shpdim_s = "6";
     visalphastart = 180;
     visalphaend = 180;
};

INSTANCE MFX_THUNDERBALL_INVEST_L1 (MFX_THUNDERBALL_INVEST_PROTO)
{
	 ppsvalue = 10;
	 vissizeendscale = 5.000000000;
     shpdim_s = "6";
     visalphastart = 180;
	 visalphaend = 180;
};

INSTANCE MFX_THUNDERBALL_INVEST_L2 (MFX_THUNDERBALL_INVEST_PROTO)
{
	 ppsvalue = 13;
	 vissizeendscale = 6.000000000;
     shpdim_s = "14";
     visalphastart = 200;
     visalphaend = 200;
};

INSTANCE MFX_THUNDERBALL_INVEST_L3 (MFX_THUNDERBALL_INVEST_PROTO)
{
	 ppsvalue = 16;
	 vissizeendscale = 7.000000000;
     shpdim_s = "22";
     visalphastart = 220;
	 visalphaend = 220;
};

INSTANCE MFX_THUNDERBALL_INVEST_L4 (MFX_THUNDERBALL_INVEST_PROTO)
{
	 ppsvalue = 20;
	 vissizeendscale = 8.000000000;
     shpdim_s = "30";
     visalphastart = 255;
	 visalphaend = 255;
};



PROTOTYPE MFX_THUNDERBALL_CAST_PROTO (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_THUNDERSPELL_ELECTRO.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "15 15";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
	 visalphaend = 255.000000000;
};

INSTANCE MFX_THUNDERBALL_CAST (MFX_THUNDERBALL_CAST_PROTO)
{
	 vissizeendscale = 1.000000000;
     shpdim_s = "10";
     visalphastart = 180;
     visalphaend = 180;
};


INSTANCE MFX_THUNDERBALL_CAST_L1 (MFX_THUNDERBALL_CAST_PROTO)
{
	 vissizeendscale = 1.000000000;
     shpdim_s = "10";
     vissizestart_s = "15 15";
     visalphastart = 100;
     visalphaend = 100;
};


INSTANCE MFX_THUNDERBALL_CAST_L2 (MFX_THUNDERBALL_CAST_PROTO)
{
	 ppsvalue		= 700;
	 vissizeendscale = 1.000000000;
     vissizestart_s = "20 20";
     shpdim_s = "15";
     visalphastart = 150;
     visalphaend = 150;
};


INSTANCE MFX_THUNDERBALL_CAST_L3 (MFX_THUNDERBALL_CAST_PROTO)
{
	 ppsvalue		= 800;
	 vissizeendscale = 2.000000000;
     vissizestart_s = "25 25";
     shpdim_s = "20";
     visalphastart = 200;
	 visalphaend = 200;
};


INSTANCE MFX_THUNDERBALL_CAST_L4 (MFX_THUNDERBALL_CAST_PROTO)
{
	 ppsvalue		= 900;
	 vissizeendscale = 2.000000000;
     vissizestart_s = "30 30";
     shpdim_s = "30";
     visalphastart = 255;
     visalphaend = 255;
};




PROTOTYPE MFX_THUNDERBALL_COLLIDE_PROTO (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsscalekeys_s = "4 3 2 1";
     ppsfps = 2.000000000;
     ppscreateem_s = "MFX_FIREBALL_COLLIDE_WALLGLOW";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_THUNDERSPELL_ELECTRO.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "70 70";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_THUNDERBALL_COLLIDE1	 (MFX_THUNDERBALL_COLLIDE_PROTO)
{
     ppsvalue = 10.000000000;
     vissizestart_s = "40 40";
     visalphastart = 130.000000000;
};

INSTANCE MFX_THUNDERBALL_COLLIDE2	 (MFX_THUNDERBALL_COLLIDE_PROTO)
{
     ppsvalue = 20.000000000;
     vissizestart_s = "50 50";
     visalphastart = 180.000000000;
};

INSTANCE MFX_THUNDERBALL_COLLIDE3	 (MFX_THUNDERBALL_COLLIDE_PROTO)
{
     ppsvalue = 30.000000000;
     vissizestart_s = "60 60";
     visalphastart = 220.000000000;
     ppscreateem_s = "MFX_THUNDERBALL_COLLIDE_SPARKS";
};

INSTANCE MFX_THUNDERBALL_COLLIDE4	 (MFX_THUNDERBALL_COLLIDE_PROTO)
{
     ppsvalue = 40.000000000;
     vissizestart_s = "70 70";
     visalphastart = 255.000000000;
     ppscreateem_s = "MFX_THUNDERBALL_COLLIDE_SPARKS";
};

INSTANCE MFX_THUNDERBALL_COLLIDE_RS	 (MFX_THUNDERBALL_COLLIDE_PROTO)
{
     ppsvalue = 30.000000000;
     vissizestart_s = "50 50";
     visalphastart = 205.000000000;
     visname_s 			= "LIGHTNING_ORIGIN_A0.tga";
     ppscreateem_s = "MFX_THUNDERBALL_COLLIDE_SPARKS";
};


INSTANCE MFX_THUNDERBALL_COLLIDE_SPARKS (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpmesh_s = "ITMI_RING_01.3DS";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     velvar = 0.050000001;
     lsppartavg = 200.000000000;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "20 20";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE MFX_THUNDERBALL_COLLIDE_WALLGLOW (C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsscalekeys_s = "5 5 4 4 3 3 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpmesh_s = "ITMI_RING_01.3DS";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     lsppartavg = 1500.000000000;
     flygravity_s = "0 0.00004 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 255";
     vissizestart_s = "2 2";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
};




///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  I C E C U B E  XX
///   													XXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_ICECUBE_INIT (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "5";
     shpscalekeys_s = "1 2 1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.500000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     velvar = 0.000100000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE MFX_ICECUBE_CAST (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000100000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "15 15";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 0.000000000;
};


INSTANCE MFX_ICESPELL_TARGET (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     ppscreateem_s = "MFX_ICESPELL_TARGETEND";
     ppscreateemdelay = 10000.000000000;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "UNIFORM";
	shpdim_s			= "1";
    shpmesh_s 			= "FROZEN_BODY.3DS"; 
	ShpMeshRender_B 	= 1;    
	shpscalekeys_s		= "1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 1;
	dirmode_s			= "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 550 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000010;
     lsppartavg = 9000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "SMK_16BIT_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 16.000000000;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 111.000000000;
     visalphaend = 55.000000000;
};
INSTANCE MFX_ICESPELL_TARGET_LOOP (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
	 ppsislooping = 1; 
     ppsissmooth = 1;
     ppsfps = 10.000000000;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "UNIFORM";
	shpdim_s			= "1";
    shpmesh_s 			= "FROZEN_BODY.3DS"; 
	ShpMeshRender_B 	= 1;    
	shpscalekeys_s		= "1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 1;
	dirmode_s			= "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000001000;
     lsppartavg = 10000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_ICESPELL_TARGETEND (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30 100 30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     velvar = 0.039999999;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.001 0";
     flycolldet_b = 1;
     visname_s = "MFX_FREEZE_ICEQUADMARK.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 180.000000000;
     visalphaend = 100.000000000;
     mrkfadespeed = 0.100000001;
     mrktexture_s = "MFX_FREEZE_ICEQUADMARK.TGA";
     mrksize = 20.000000000;
};


INSTANCE MFX_ICESPELL_COLLIDE	(C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30 30 30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     velvar = 0.039999999;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.001 0";
     flycolldet_b = 1;
     visname_s = "MFX_FREEZE_ICEQUADMARK.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 180.000000000;
     visalphaend = 100.000000000;
     mrkfadespeed = 0.100000001;
     mrktexture_s = "MFX_FREEZE_ICEQUADMARK.TGA";
     mrksize = 20.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  I C E W A V E  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_ICEWAVE_WAVE (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     ppsissmooth = 1;
     ppsfps = 40.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "world";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     shpscalefps = 40.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.001000000;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0";
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "200 220 255";
     vissizestart_s = "40 40";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 0.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   D E M O N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_SUMMONDEMON_INIT (C_PARTICLEFX)
{
     ppsvalue = 500.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000010000;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "2 2";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_SUMMONDEMON_INVEST (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.000000000;
     shpdim_s = "60";
     shpscalekeys_s = "2 0.5";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelev = -89.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.200000003;
     velvar = 0.100000001;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "10 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 30.000000000;
};
//////////////////////////////////////////////////////////
//BIG LIGHTLING
////////////////////////////////////////////////
INSTANCE MFX_LIGHTNING_BIG_INIT (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1 1.2 1.5 1.7 2 1.8 1.4 1.6 1.8 2 1.6 1.2 ";
     ppsislooping = 1;

     ppsissmooth = 1;
     ppsfps = 15.000000000;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20 20 20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 40.000000000;
     dirangleelev = -89.000000000;
     velavg = 0.000100000;
     lsppartavg = 100.000000000;
     lsppartvar = 0.000000000;
     flygravity_s = "0 -0.003 0";
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 24.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "3 3 3";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};
INSTANCE MFX_LIGHTNING_BIG_INIT_LINES (C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1 2 2.5 3.7 5 6.2 8.4 10.6 12.8 14 17 21 ";
     ppsislooping = 1;

     ppsissmooth = 1;
     ppsfps = 300.000000000;
     PpsScaleKeys_S  = "1 2 3 4 5 5 4 3 2 1 1 2 3 2 1";  

     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdim_s = "30 20 20";
     shpscalekeys_s = "1 2 3 4 5 4 3 2 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     DirAngleHead = 359.65; 
     dirangleheadvar = 120.000000000;
     dirangleelev = -89.000000000;
     velavg = 0.000100000;
     lsppartavg = 100.000000000;
     lsppartvar = 10.000000000;
     flygravity_s = "0 -0.003 0";
     visname_s = "PFXANI15.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 24.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "100 103 103";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_LIGHTNING_BIG_INVESTGLOW (C_PARTICLEFX)
{
      ppsvalue = 300.000000000;
     ppsislooping = 0;
     shptype_s = "POINT";
     shpfor_s = "object";
    shpdistribtype_s = "RANDOM";
     ppscreateem_s = "MFX_LIGHTNING_BIG_INIT_LINES";
     ppscreateemdelay = 150.000000000;
     shpdim_s = "120";
     shpscalekeys_s = "1 2 3 4 3 2 2 1 2 3 4 5 6 7 6 5 4 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10.000000000;
     dirmode_s = "=";
     dirfor_s = "OBJECT";
     dirangleheadvar = 360.000000000;
     velavg = 10.300000012;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.000001 0 ";
     flycolldet_b = 1;
     visname_s = "ELECTRICBLUE0000.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 100 255";
     vistexcolorend_s = "20 20 255";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 150.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "ZPLASMA0.TGA";
     trlwidth = 10.000000000;
};


INSTANCE MFX_LIGHTNING_BIG_RAIN1 (C_PARTICLEFX)
{

  ppsvalue = 48.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70";
     ppsissmooth = 1;
    // ppsislooping = 1;   
     ppscreateem_s = "MFX_LIGHTNING_BIG_GROUND";
     ppscreateemdelay = 300.000000000;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "world";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.0002;
     shpdim_s = "500 100 500";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70";
     shpscalefps = 1.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;//45
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;//45
     velavg = 0.001000000;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "velo";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "90 90 90";
     vissizestart_s = "39 39 39";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
          trlfadespeed = 0.200000003;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
     trlwidth = 12.000000000;
 };	
	
	
	//Backup 2
//   ppsvalue = 148.000000000;
//      ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70";
//      ppsissmooth = 1;
//     // ppsislooping = 1;   
//      ppscreateem_s = "MFX_LIGHTNING_BIG_GROUND";
//      ppscreateemdelay = 300.000000000;
//      ppsfps = 1.000000000;
//      shptype_s = "SPHERE";
//      shpfor_s = "world";
//      shpoffsetvec_s = "0 -50 0";
//      shpdistribtype_s = "RAND";
//      shpdistribwalkspeed = 0.0002;
//      shpdim_s = "500 100 500";
//      shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70";
//      shpscalefps = 1.000000000;
//      dirmode_s = "RAND";
//      dirfor_s = "object";
//      diranglehead = 90.000000000;
//      dirangleheadvar = 45.000000000;//45
//      dirangleelev = 90.000000000;
//      dirangleelevvar = 45.000000000;//45
//      velavg = 0.001000000;
//      lsppartavg = 1500.000000000;
//      lsppartvar = 300.000000000;
//      flygravity_s = "0";
//      visname_s = "LIGHTNING_BIG_A0.TGA";
//      visorientation_s = "velo";
//      vistexisquadpoly = 1;
//      vistexanifps = 20.000000000;
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "255 255 255";
//      vistexcolorend_s = "90 90 90";
//      vissizestart_s = "39 39 39";
//      vissizeendscale = 10.000000000;
//      visalphafunc_s = "ADD";
//      visalphastart = 255.000000000;
//  };
//      visalphaend = 0.000000000;
//      trltexture_s = "LIGHTBOLT_A0.TGA";
//      TrlWidth = 12.0;
//      trlFadeSpeed = 1.2;
   /*//Backup
   ppsvalue = 74.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70";
     ppsissmooth = 1;
     ppsislooping = 1;   
     ppscreateem_s = "MFX_LIGHTNING_BIG_GROUND";
     ppscreateemdelay = 300.000000000;
     ppsfps = 37.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "world";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
          shpdistribwalkspeed = 1.2;
     shpdim_s = "500 50 500";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70";
     shpscalefps = 37.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;//45
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;//45
     velavg = 0.001000000;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "velo";//velo3d
     vistexisquadpoly = 1;
     vistexanifps = 20.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "90 90 90";
     vissizestart_s = "39 39 39";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
*/

INSTANCE MFX_LIGHTNING_BIG_GROUND (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "2 1.5 1.2 1.1 1 1 0.8 0.6 0.4 0.2";
     ppsfps = 6.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "500";
     shpscalekeys_s = "2 1.5 1.2 1.1 1 1 0.8 0.6 0.4 0.2";
     shpscaleislooping = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleelev = 90.000000000;
     velavg = 10.029999999;
     lsppartavg = 2000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 3;
     visname_s = "DECAL_DEAMON.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "85 80 255";
     vistexcolorend_s = "20 20 100";
     vissizestart_s = "25 30 25";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};

INSTANCE MFX_LIGHTNING_BIG_TRAGET (C_PARTICLEFX)
{
    ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "point";
     shpfor_s = "OBJECT";
     shpdistribwalkspeed = 0.000000000000000000000000000000000001;
     ppscreateem_s = "MFX_LIGHTNING_BIG_ORGIN";
     ppscreateemdelay = 0.0000000001;
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "30";
     
     shpmesh_s = "ITMI_RING_01.3DS";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.200000003;
     velvar = 0.050000001;
     lsppartavg = 5000.000000000;
     flygravity_s = "0 -0.00001 0";
     flycolldet_b = 1;
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 26.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "225 250 250";
     vistexcolorend_s = "105 110 130";
     vissizestart_s = "20 20";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
  
   
};
INSTANCE MFX_LIGHTNING_BIG_ORGIN (C_PARTICLEFX)
{
      ppsvalue = 120.000000000;
     ppsscalekeys_s = "4 3 2 1";
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "50 100 155";
     vissizestart_s = "50 50";
     vissizeendscale = 1.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};





//OLD BACKUP////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////
// INSTANCE MFX_LIGHTNING_BIG_INIT (C_PARTICLEFX)
// {
//      ppsvalue = 500.000000000;
//      ppsscalekeys_s = "2";
//      ppsislooping = 1;
//      ppsissmooth = 1;
//      ppsfps = 18.000000000;
//      shptype_s = "POINT";
//      shpfor_s = "object";
//      shpoffsetvec_s = "0 0 0";
//      shpdistribtype_s = "WALK";
//      shpdim_s = "10";
//      shpscalekeys_s = "0 0.1 0.2 0.3 0.5 0.6 0.8 1 2 3 4 5 4 3 2 1 0.5";
//      shpscaleislooping = 1;
//      shpscaleissmooth = 1;
//      shpscalefps = 20.000000000;
//      dirmode_s = "RAND";
//      dirfor_s = "object";
//      dirmodetargetfor_s = "OBJECT";
//      dirmodetargetpos_s = "0 0 0";
//      dirangleheadvar = 180.000000000;
//      dirangleelevvar = 180.000000000;
//      velavg = 0.000010000;
//      lsppartavg = 200.000000000;
//      flygravity_s = "0 0 0";
//      flycolldet_b = 0;
//      visname_s = "MAGICDUMMY16BIT_3.TGA";
//      visorientation_s = "VELO";
//      vistexisquadpoly = 1;
//      vistexanifps = 18.000000000;
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "0 0 0";
//      vistexcolorend_s = "252 252 255";
//      vissizestart_s = "2 2";
//      vissizeendscale = 5.000000000;
//      visalphafunc_s = "ADD";
//      visalphastart = 255.000000000;
//      visalphaend = 255.000000000;
// };
// /////////////////
// INSTANCE MFX_LIGHTNING_BIG_INVEST (C_PARTICLEFX)
// {
 /*  ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10  1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70";
     ppsissmooth = 1;
     ppsislooping = 1;   
     ppscreateem_s = "MFX_LIGHTNING_BIG_GROUND";
     ppscreateemdelay = 300.000000000;
     ppsfps = 90.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "world";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
          shpdistribwalkspeed = 0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
     shpdim_s = "50 50 50";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70";
     shpscalefps = 90.000000000;
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 28.6000000;
  dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 0.000000000;//40
     dirangleelev = 0.000000000;//45

//      diranglehead = 90.000000000;
//      dirangleheadvar = 85.000000000;//45
//      dirangleelev = 90.000000000;
  dirangleelevvar = 0.000000000;//45
     velavg = 0.00200000001;//0.2
     velavg = 0.001000000;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "ECHOBRIGHT0000.TGA";//PFXANI22.TGA
     visorientation_s = "VELO3D";//velo3d
     vistexisquadpoly = 1;
     vistexanifps = 22.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "80 160 255";
     vistexcolorend_s = "20 50 205";
     vissizestart_s = "40 40 40";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 50.000000000;
// };
// INSTANCE MFX_LIGHTNING_BIG_INVEST1 (C_PARTICLEFX)
// {
//      ppsvalue = 1000.000000000;
//      ppsscalekeys_s = "2";
//      ppsislooping = 1;
//      ppsfps = 2.000000000;
//      ppscreateem_s = "MFX_LIGHTNING_BIG_INVEST2";
//    	 ppscreateemdelay = 3000.000000000;
//      shptype_s = "LINE";
//      shpfor_s = "OBJECT";
//      shpoffsetvec_s = "0 -120 0";
//      shpdistribtype_s = "RAND";
//      shpdistribwalkspeed = 1.000000000;
//      shpdim_s = "60";
//      shpscalekeys_s = "5 6 4 3 2 4 7 9 6";
//      shpscaleislooping = 1;
//      shpscaleissmooth = 1;
//      shpscalefps = 1.020000024;
//      dirmode_s = "DIR";
//      dirfor_s = "object";
//      dirmodetargetfor_s = "OBJECT";
//      dirmodetargetpos_s = "0 1 0";
//      dirangleheadvar = 10.000000000;
//      dirangleelev = -19.000000000;
//      dirangleelevvar = 180.000000000;
//      velavg = 0.500000003;
//      velvar = 0.100000001;
//      lsppartavg = 500.000000000;
//      flygravity_s = "0 4 0";
//      visname_s = "PFXANI22.TGA";
//      visorientation_s = "VELO";
//      vistexisquadpoly = 1;
//      vistexanifps = 18.000000000;
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "100 20 100";
//      vistexcolorend_s = "150 50 255";
//      vissizestart_s = "10 10";
//      vissizeendscale = 12.000000000;
//      visalphafunc_s = "ADD";
//      visalphastart = 255.000000000;
//      visalphaend = 30.000000000;
// };
// INSTANCE MFX_LIGHTNING_BIG_INVEST2 (C_PARTICLEFX)
// {
//      ppsvalue = 1000.000000000;
//      ppsscalekeys_s = "2";
//      ppsislooping = 1;
//      ppsfps = 2.000000000;
//      shptype_s = "SPHERE";
//      shpfor_s = "OBJECT";
//      shpoffsetvec_s = "0 -120 0";
//      shpdistribtype_s = "RAND";
//      shpdistribwalkspeed = 1.000000000;
//      shpdim_s = "60";
//      shpscalekeys_s = "5 6 4 3 2 4 7 9 6";
//      shpscaleislooping = 1;
//      shpscaleissmooth = 1;
//      shpscalefps = 1.020000024;
//      dirmode_s = "DIR";
//      dirfor_s = "object";
//      dirmodetargetfor_s = "OBJECT";
//      dirmodetargetpos_s = "0 1 0";
//      dirangleheadvar = -180.000000000;
//      dirangleelev = -99.000000000;
//      dirangleelevvar = 180.000000000;
//      velavg = 0.500000003;
//      velvar = 0.100000001;
//      lsppartavg = 500.000000000;
//      flygravity_s = "0 0 0";
//      visname_s = "FIREBALL16BIT.TGA";
//      visorientation_s = "VELO";
//      vistexisquadpoly = 1;
//      vistexanifps = 18.000000000;
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "200 20 10";
//      vistexcolorend_s = "245 150 155";
//      vissizestart_s = "10 10";
//      vissizeendscale = 12.000000000;
//      visalphafunc_s = "ADD";
//      visalphastart = 255.000000000;
//      visalphaend = 30.000000000;
// };
// ////////////////////////////////////////////////////////
// INSTANCE MFX_LIGHTNING_BIG_HEAD (C_PARTICLEFX)
// {
//      ppsvalue = 600.000000000;
//      ppsscalekeys_s = "1";
//      ppsissmooth = 1;
//      ppsfps = 10.000000000;
//      shptype_s = "SPHERE";
//      shpfor_s = "OBJECT";
//      shpoffsetvec_s = "0 0 0";
//      shpdistribtype_s = "RAND";
//      shpisvolume = 1;
//      shpdim_s = "50";
//      shpmesh_s = "ITMI_RING_01.3DS";
//      shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11";
//      shpscaleislooping = 0;
//      shpscaleissmooth = 1;
//      shpscalefps = 10.000000000;
//      dirmode_s = "RAND";
//      dirfor_s = "object";
//      dirmodetargetfor_s = "OBJECT";
//      dirmodetargetpos_s = "0 0 0";
//      dirangleheadvar = 180.000000000;
//      dirangleelevvar = 180.000000000;
//      velavg = 0.200000003;
//      velvar = 0.050000001;
//      lsppartavg = 5200.000000000;
//      flygravity_s = "0 0.0002 0";
//      flycolldet_b = 1;
//      visname_s = "ELECTRIC.TGA";
//      visorientation_s = "NONE";
//      vistexisquadpoly = 1;
//      vistexanifps = 18.000000000;
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "0 120 120";
//      vistexcolorend_s = "100 200 200";
//      vissizestart_s = "30 30";
//      vissizeendscale = 1.200000001;
//      visalphafunc_s = "ADD";
//      visalphastart = 255.000000000;
//      visalphaend = 255.000000000;
// };
// /////////////////////////////////////////////////////////

//  
// //      visorientation_s = "VELO3D";//VELO3D
// //      vistexisquadpoly = 6;
// //      vistexanifps = 10.000000000;
// //      vistexaniislooping = 1;

// //      vissizestart_s = "30 60 20";
// //      vissizeendscale = 5.000000000;
// //      visalphafunc_s = "ADD";
// //      visalphastart = 255.000000000;
// //      visalphaend = 255.000000000;
// //      trlfadespeed = 0.699999988;

// //      trlwidth = 8.000000000;
// // };

// INSTANCE MFX_LIGHTNING_BIG_GROUND (C_PARTICLEFX)
// {
//      ppsvalue = 200.000000000;
//      ppsscalekeys_s = "1 1 1 1 1 1 0.8 0.6 0.4 0.2";
//      ppsfps = 2.000000000;
//      shptype_s = "CIRCLE";
//      shpfor_s = "object";
//      shpoffsetvec_s = "0 -120 0";
//      shpdistribtype_s = "RAND";
//      shpisvolume = 1;
//      shpdim_s = "1000";
//      shpscalekeys_s = "1";
//      shpscaleislooping = 1;
//      shpscalefps = 15.000000000;
//      dirmode_s = "DIR";
//      dirfor_s = "object";
//      diranglehead = 90.000000000;
//      dirangleelev = 90.000000000;
//      velavg = 0.029999999;
//      lsppartavg = 2000.000000000;
//      lsppartvar = 300.000000000;
//      flygravity_s = "0 0 0";
//      flycolldet_b = 3;
//      visname_s = "PFXANI15.TGA";
//      visorientation_s = "0";
//      vistexisquadpoly = 1;
//      vistexanifps = 3.000000000;
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "105 100 205";
//      vistexcolorend_s = "20 0 0";
//      vissizestart_s = "50 10";
//      vissizeendscale = 10.000000000;
//      visalphafunc_s = "ADD";
//      visalphaend = 255.000000000;
//      trltexture_s = "LIGHTNING_BIG.TGA";
//      mrktexture_s = "ZFLARE1";
// };

// INSTANCE MFX_LIGHTNING_BIG_TARGET (C_PARTICLEFX)
// {
//          ppsvalue = 4.000000000;
//      ppsscalekeys_s = "1 1 2 3 5 2 1 1 5 6 7 3 2 1 1 1 0.5 1 2 3 2 4 3 1 2 1";
//      ppsissmooth = 1;
//      ppsfps = 2.000000000;
//      shptype_s = "BOX";
//      shpfor_s = "object";
//      shpoffsetvec_s = "0 0 0";
//      shpdistribtype_s = "UNIFORM";//rand
//      shpdim_s = "30 5 5";
//      shpscalekeys_s = "1";
//      shpscaleislooping = 1;
//      shpscaleissmooth = 1;
//      shpscalefps = 2.000000000;
//      dirmode_s = "DIR";
//      dirmodetargetfor_s = "OBJECT";
//      dirmodetargetpos_s = "0 0 400";
//      dirangleelev = 90.000000000;
//      velavg = 0.100000001;
//      lsppartavg = 1000.000000000;
//      lsppartvar = 50.000000000;
//      flygravity_s = "0 0.0002 0";
//      visname_s = "LIGHTNING_ORIGIN.TGA";
//      visorientation_s = "VELO";
//      vistexisquadpoly = 1;
//      vistexanifps = 5.000000000;
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "200 200 200";
//      vistexcolorend_s = "20 20 20";
//      vissizestart_s = "5 5";
//      vissizeendscale = 30.000000000;
//      visalphafunc_s = "ADD";
//      visalphastart = 255.000000000;
// };
// INSTANCE MFX_LIGHTNING_BIG_COLLIDE (C_PARTICLEFX)
// {
//          ppsvalue = 40.000000000;
//      ppsfps = 10.000000000;
//      ppscreateem_s = "MFX_LIGHTNING_BIG_COLLIDE_SPARKS";
//      shptype_s = "SPHERE";
//      shpfor_s = "object";
//      shpoffsetvec_s = "0 0 0";
//      shpdistribtype_s = "RAND";
//      shpisvolume = 1;
//      shpdim_s = "8";
//      shpscalekeys_s = "1 2 1 2 3 4 5 6 8 9 11 9 8 7 6 5 6 4 3 2 1";
//      shpscaleislooping = 1;
//      shpscaleissmooth = 1;
//      shpscalefps = 2.000000000;
//      dirmode_s = "TARGET";
//      dirfor_s = "object";
//      dirmodetargetfor_s = "OBJECT";
//      dirmodetargetpos_s = "0 0 0";
//      dirangleheadvar = 180.000000000;
//      dirangleelevvar = 180.000000000;
//      velavg = 0.079999998;
//      velvar = 0.020000000;
//      lsppartavg = 2000.000000000;
//      flygravity_s = "0 0 0";
//      flycolldet_b = 1;
//      visname_s = "ELECTRIC.TGA";
//      visorientation_s = "NONE";
//      vistexanifps = 18.000000000;
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "205 220 220";
//      vistexcolorend_s = "205 220 226";
//      vissizestart_s = "10 10";
//      vissizeendscale = 15.000000000;
//      visalphafunc_s = "ADD";
//      visalphastart = 255.000000000;
// };

*/
///////////////////////////////////////////////////////
////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////

INSTANCE SPAWN_DEMON	(C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 ";
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpdim_s = "40";
     shpscalekeys_s = "2 0.5";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000010000;
     velvar = 0.000100000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 0";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   S K E L E T O N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   G O L E M  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE SPAWN_GOLEM	(C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 ";
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpdim_s = "40";
     shpscalekeys_s = "2 0.5";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.600000024;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000010000;
     velvar = 0.000100000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 0";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  A R M Y   O F   D A R K N E S S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


///   													XXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  M A S S D E A T H  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_MASSDEATH_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "8";
     shpscalekeys_s = "1 2 3 3 2 2 2 1 2 3 2 3 4 3 2 1 2 3 2 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     velvar = 0.000100000;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 50 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE MFX_MASSDEATH_INIT_GLOW (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "5";
     shpscalekeys_s = "1 2 1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 0.500000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.600000024;
     velvar = 0.020000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_Spell_Star.tga";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 150 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trlfadespeed = 0.800000012;
     trltexture_s = "MFX_FIRERAIN_RAINTRAIL.TGA";
     trlwidth = 1.000000000;
};

INSTANCE MFX_MASSDEATH_CAST (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     ppsissmooth = 1;
     ppsfps = 15.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "40";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     shpscalefps = 15.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.000100000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.00008 0";
     visname_s = "WHITECLOUD.TGA";
     visorientation_s = "VELO";
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 50 50";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

INSTANCE MFX_MASSDEATH_TARGET (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 1 0.8 0.6 0.4 0.2";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -100 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscalefps = 15.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.000100000;
     lsppartavg = 2500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "WHITECLOUD.TGA";
     visorientation_s = "NONE";
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 50 50";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "100 200";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  D E S T R O Y   U N D E A D  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_DESTROYUNDEAD_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "DESTROYUNDEAD3.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "3 3";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_DESTROYUNDEAD_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 5.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "DESTROYUNDEAD3.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "3 3";
     vissizeendscale = 200.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_DESTROYUNDEAD_CAST (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1 1.5 2 2.5 3 3.5 4 4.5 5";
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.500000000;
     velvar = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "DESTROYUNDEAD3.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 40";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "DESTROYUNDEAD2.TGA";
};

INSTANCE MFX_DESTROYUNDEAD_SOUL (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 2 3 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 89.000000000;
     dirangleheadvar = 8.000000000;
     dirangleelevvar = 8.000000000;
     velavg = 1.000000000;
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "AURA.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trlfadespeed = 1.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
     trlwidth = 3.000000000;
};

INSTANCE MFX_DESTROYUNDEAD_SOUL_BACK (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 2 3 2 2 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = -89.000000000;
     dirangleheadvar = 8.000000000;
     dirangleelevvar = 8.000000000;
     velavg = 1.000000000;
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "AURA.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trlfadespeed = 1.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
     trlwidth = 3.000000000;
};


INSTANCE MFX_DESTROYUNDEAD_SOUL_CLOUD (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1 1 1 1 0.6 0.6 0.3 0.3";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpdim_s = "5";
     shpscalekeys_s = "1";
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 89.000000000;
     dirangleelev = 89.000000000;
     dirangleelevvar = 15.000000000;
     velavg = 0.010000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "STOMPERDUST.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 6.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "1 1";
     vissizeendscale = 50.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "JUSTWHITE.TGA";
};


///   													XXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  W I N D F I S T   XX	// schleudert nur einen
///   													XXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_WINDFIST_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2.000000000;
     shpdim_s = "3";
     shpscalekeys_s = "1 2 3 4 5 4 3 4 6 8 7 5 4 2 6 5 4 3 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};

INSTANCE MFX_WINDFIST_INVEST (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2.000000000;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10.000000000;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.100000001;
     lsppartavg = 1750.000000000;
     lsppartvar = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "220 220 255";
     vistexcolorend_s = "220 220 255";
     vissizestart_s = "200 200";
     visalphafunc_s = "BLEND";
     visalphaend = 255.000000000;
};

INSTANCE MFX_WINDFIST_INVEST_BLAST (C_PARTICLEFX)
{
     ppsvalue = 2000.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 20.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2.000000000;
     shpdim_s = "250";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10.000000000;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.400000006;
     lsppartavg = 800.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "220 220 255";
     vistexcolorend_s = "220 220 255";
     vissizestart_s = "100 100";
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};

INSTANCE MFX_WINDFIST_CAST (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1 10";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "1000 0 0";
     velavg = 2.000000000;
     velvar = 0.500000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 200 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 150.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE MFX_WINDFIST_CASTDUMMY (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "6 6";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_WINDFIST_TARGET (C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "8";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.079999998;
     velvar = 0.020000000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S T O R M F I S T   XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_STORMFIST_CAST (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1 10";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "1000 0 0";
     dirangleheadvar = 30.000000000;
     dirangleelevvar = 30.000000000;
     velavg = 2.000000000;
     velvar = 0.500000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 200 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 300.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trltexture_s = "WHITECLOUD.TGA";
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T E L E K I N E S I S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_TELEKINESIS_INIT (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "10 10";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_TELEKINESIS_BRIDGE (C_PARTICLEFX)
{
     ppsvalue = 250.000000000;
     ppsscalekeys_s = "1 2 3 2";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "4";
     shpscalekeys_s = "1 3 5 3 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "WORLD";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.800000012;
     velvar = 0.200000003;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 255 255";
     vistexcolorend_s = "100 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE MFX_TELEKINESIS_TARGET (C_PARTICLEFX)
{
     ppsvalue = 1500.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "40";
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.001000000;
     lsppartavg = 200.000000000;
     flygravity_s = "0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};


INSTANCE MFX_TELEKINESIS_TARGETEND (C_PARTICLEFX)
{
     ppsvalue = 1500.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "40";
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.050000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 255 255";
     vistexcolorend_s = "100 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  M A S T E R   T E L E K I N E S I S  XX		// kann auch NPCs anheben
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_MasterTelekinesis_INIT		(C_PARTICLEFX)
{
     ppsvalue = 20.;
	 ppsislooping = 0;
	 ppsfps   = 0.5;
	 ppsScaleKeys_S = "1.0";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "40";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 1200.;
     lsppartvar = 200.;
     flygravity_s = "0 0.0001 0";
     vistexisquadpoly = 1;
     visname_s = "pfxani15.TGA";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "50 50";
     vissizeendscale = 5.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};



///   													XXXXXXXXXXXXXXXXXX
///   													XX  C H A R M   XX
///   													XXXXXXXXXXXXXXXXXX

INSTANCE MFX_CHARM_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.050000001;
     lsppartavg = 1400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 200 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "30 30";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_CHARM_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1.1 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 1;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 200 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "35 35";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_CHARM_TARGET (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 0.7 0.4";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.00003 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "20 20";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXX
///   													XX  S L E E P  XX
///   													XXXXXXXXXXXXXXXXX

INSTANCE MFX_SLEEP_INIT (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.050000001;
     lsppartavg = 1400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "10 10";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_SLEEP_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 400.000000000;
     ppsscalekeys_s = "";
     //ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_SLEEP_TARGET (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 0.7 0.4";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.00003 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "20 20";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  P Y R O K I N E S I S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_PYROKINESIS_INIT (C_PARTICLEFX)
{
     ppsvalue = 800.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 150 0";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE MFX_PYROKINESIS_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "10 10";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
};

INSTANCE MFX_PYROKINESIS_TARGET (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.300000012;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "20 0 0";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "10 10";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 50.000000000;
     trlfadespeed = 0.400000006;
     trltexture_s = "MFX_PYROKINESIS_TARGETTRAIL.TGA";
     trlwidth = 4.000000000;
};


///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  C O N T R O L  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_CONTROL_INIT (C_PARTICLEFX)
{
     ppsvalue = 660.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "10 10";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_CONTROL_BRIDGE (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1 2 3 2";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "WORLD";
     dirmodetargetfor_s = "WORLD";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.300000012;
     velvar = 0.100000001;
     lsppartavg = 5000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 100";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 150.000000000;
     visalphaend = 150.000000000;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE MFX_CONTROL_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsislooping = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "30";
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.100000001;
     velvar = 0.010000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 100";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_CONTROL_TARGET (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "120";
     shpscalekeys_s = "1 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.100000001;
     velvar = 0.010000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 100";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "JUSTWHITE.TGA";
};


///   													XXXXXXXXXXXXXXX
///   													XX  F E A R  XX
///   													XXXXXXXXXXXXXXX


INSTANCE MFX_FEAR_INIT (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 20 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "2";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 150.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_FEAR_DEMONFACE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 100 0";
     vistexcolorend_s = "200 200 0";
     vissizestart_s = "30 30";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 180.000000000;
};

INSTANCE MFX_FEAR_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 0.5 0.5 0.5";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 100 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "120";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     lsppartavg = 5000.000000000;
     lsppartvar = 1000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 50 0";
     vissizestart_s = "30 30";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "MFX_PYROKINESIS_TARGETTRAIL.TGA";
};

INSTANCE MFX_FEAR_FACE (C_PARTICLEFX)
{
     ppsvalue = 2.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 0.5 0.5 0.5";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 100 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "12";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 2000.000000000;
     lsppartvar = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_FEAR_DEMONFACE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "200 200";
     vissizeendscale = 1.200000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE MFX_FEAR_WAVE (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     ppsissmooth = 1;
     ppsfps = 15.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -150 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "40";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     shpscalefps = 15.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.000100000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.00008 0";
     visname_s = "WHITECLOUD.TGA";
     visorientation_s = "VELO";
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 50 50";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};



///   													XXXXXXXXXXXXXXXXXXXX
///   													XX  F O R G E T	  XX
///   													XXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_FORGET_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.050000001;
     lsppartavg = 1400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_FORGET_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1.1 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  B E R Z E R K  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_BERZERK_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.050000001;
     lsppartavg = 1400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_BERZERK_ORIGIN (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1 1.1 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MFX_BERZERK_TARGET (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 0.7 0.4";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.00003 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 0";
     vissizestart_s = "20 20";
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};




///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  B R E A T H   O F   D E A T H  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MFX_BREATHOFDEATH_INIT (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2.000000000;
     shpdim_s = "3";
     shpscalekeys_s = "1 2 3 4 5 4 3 4 6 8 7 5 4 2 6 5 4 3 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "2 2";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};

INSTANCE MFX_BREATHOFDEATH_INVEST (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 2.000000000;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 10.000000000;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.100000001;
     lsppartavg = 2000.000000000;
     lsppartvar = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "100 100";
     visalphafunc_s = "BLEND";
     visalphaend = 255.000000000;
};

INSTANCE MFX_BREATHOFDEATH_CAST (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1 10";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "1000 0 0";
     velavg = 2.000000000;
     velvar = 0.500000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 150.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trltexture_s = "WHITECLOUD.TGA";
};

INSTANCE MFX_BREATHOFDEATH_CASTDUMMY (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "6 6";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_BREATHOFDEATH_COLLIDE (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1 1 0.7 0.7 0.4 0.4";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "400";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.100000001;
     velvar = 0.020000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "300 300";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "BLEND";
     visalphaend = 255.000000000;
};



///   													XXXXXXXXXXXXXXXXXX
///   													XX  D A N C E   XX
///   													XXXXXXXXXXXXXXXXXX


///   													XXXXXXXXXXXXXXXXXXXX
///   													XX  S H R I N K   XX
///   													XXXXXXXXXXXXXXXXXXXX


INSTANCE MFX_SHRINK_INIT (C_PARTICLEFX)
{
     ppsvalue = 1000.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000100000;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_LIGHT_SINGLERAY2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 10";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE MFX_SHRINK_TARGET (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "3 3 2 2 1";
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 -40 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.000000000;
     shpdim_s = "40";
     shpscalekeys_s = "1 4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.000010000;
     velvar = 0.000100000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_LIGHT_SINGLERAY.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "200 255 200";
     vissizestart_s = "30 400";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



///   													XXXXXXXXXXXXXXXXXXXXXX
///   													XX  U N D R E S S   XX
///   													XXXXXXXXXXXXXXXXXXXXXX




///   													XXXXXXXXXXXXXXXXXXXX
///   													XXXXXXXXXXXXXXXXXXXX
///   													XX  G L O B A L   XX
///   													XXXXXXXXXXXXXXXXXXXX
///   													XXXXXXXXXXXXXXXXXXXX


// HUMAN oder VOB brennt nach Feuerschaden

INSTANCE MFX_FIRESPELL_HUMANBURN (C_PARTICLEFX)
{
     ppsvalue = 4.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30 5 5";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 50.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 0";
     vissizestart_s = "5 5";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE MFX_Firespell_HUMANSMOKE (C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsscalekeys_s = "1 2 3 4 3 2 2 2 2 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "25";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.039999999;
     lsppartavg = 5500.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 150.000000000;
};



// Carsten:


INSTANCE PFX2(C_PARTICLEFX)
{
     ppsvalue = 40.;
     ppsscalekeys_s = "1 0";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     //ppscreateem_s = "CIRLCLE1";
     shptype_s = "MESH";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "0 1 0.5 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.;
     dirmode_s = "DIR";
     dirfor_s = "mesh";
     lsppartavg = 600.;
     lsppartvar = 100.;
     visname_s = "PFXFLARE2_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "9 9";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 80.;
};
INSTANCE HUMAN1(C_PARTICLEFX)
{
     ppsvalue = 20.;
	 ppsislooping = 0;
	 ppsfps   = 0.4;
	 ppsScaleKeys_S = "1.0";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "40";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 800.;
     lsppartvar = 200.;
     vistexisquadpoly = 1;
     visname_s = "pfxflare2_a0.TGA";
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "50 50";
     vissizeendscale = 3.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE HUMAN2(C_PARTICLEFX)
{
     ppsvalue = 15.;
	 ppsislooping = 0;
	 ppsfps   = 0.4;
	 ppsScaleKeys_S = "1.0";
     shptype_s = "box";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "40 60 20";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 1000.;
     lsppartvar = 200.;
     vistexisquadpoly = 1;
     visname_s = "cflarestar_a0.TGA";
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 150 255";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "50 50";
     vissizeendscale = 3.;
     visalphafunc_s = "ADD";
     visalphastart = 80.;
};

INSTANCE HUMAN_ELECTRIC(C_PARTICLEFX)
{
     ppsvalue = 20.;
	 ppsislooping = 0;
	 ppsfps   = 0.4;
	 ppsScaleKeys_S = "1.0";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "40";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 800.;
     lsppartvar = 200.;
     vistexisquadpoly = 1;
     visname_s = "pfxflare2_a0.TGA";
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "50 50";
     vissizeendscale = 3.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE WALL1(C_PARTICLEFX)
{
     ppsvalue = 20.;
	 ppsislooping = 0;
	 ppsfps   = 0.8;
	 ppsScaleKeys_S = "1.0";
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "40";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 800.;
     lsppartvar = 200.;
     vistexisquadpoly = 1;
     visname_s = "pfxflare2_a0.TGA";
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "50 50";
     vissizeendscale = 3.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE SMOKE1 (C_PARTICLEFX)
{
     ppsvalue = 9.;
     ppsscalekeys_s = "1 0.2 1.1 0.6 0.8 1.2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.;
     shptype_s = "BOX";
     shpfor_s = "world";
     shpisvolume = 1;
     shpdim_s = "50 50 50";
     shpscalekeys_s = "1 2 0.7 2 0.4 0.1 1.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.;
     dirmode_s = "DIR";
     lsppartavg = 800.;
     lsppartvar = 200.;
     flygravity_s = "0 0.001 0";
     visname_s = "PUFF5.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 20";
     vissizeendscale = 10.;
     visalphafunc_s = "MUL";
};

INSTANCE EXPLOSION1 (C_PARTICLEFX)
{
     ppsvalue = 15.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 0.5;
     ppscreateem_s = "ZZTEST_EXPL_DEBRIS";
     shptype_s = "BOX";
     shpdim_s = "30 30 30";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 750.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0003 0";
     visname_s = "pfxfexp2_a0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 17.;

     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE EXPLOSION2 (C_PARTICLEFX)
{
     ppsvalue = 15.;
     ppsscalekeys_s = "1";
	 ppsislooping = 0;
     ppsfps = 0.5;
     ppscreateem_s = "ZZTEST_EXPL_DEBRIS";
     shptype_s = "BOX";
     shpdim_s = "30 30 30";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 750.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0003 0";
     visname_s = "pfxfexp2_a0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 17.;

     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "40 40";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE EXPLOSION3 (C_PARTICLEFX)
{
     ppsvalue = 15.;
     ppsscalekeys_s = "1";
	 ppsislooping = 0;
     ppsfps = 0.5;
     ppscreateem_s = "ZZTEST_EXPL_DEBRIS";
     shptype_s = "BOX";
     shpdim_s = "30 30 30";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 750.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0003 0";
     visname_s = "pfxfexp2_a0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 17.;

     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "70 70";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};

INSTANCE FB2 (C_PARTICLEFX)
{
     ppsvalue = 5.;
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000014e-004;
     shpisvolume = 1;
     shpdim_s = "8";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 9.99999983e+012;
     visname_s = "fireball_a0.tga";
     vistexisquadpoly = 1;
     vistexanifps = 17.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "30 30";
     vissizeendscale = 3.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};
INSTANCE NEW(C_PARTICLEFX)
{
     ppsvalue = 1.;
     ppsislooping = 0;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1 15";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     lsppartavg = 1500.;
     lsppartvar = 0.;
     visname_s = "PFXFLARE2_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 10.;
     vistexaniislooping = 0;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "50 50";
     vissizeendscale = 15.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
	 visalphaend   = 100.;
};

INSTANCE FBNEW (C_PARTICLEFX)
{
     ppsvalue = 1.;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "3";
     dirmode_s = "DIR";
     lsppartavg = 6.00000011e+013;
     flygravity_s = "0 0 0";
     visname_s = "fireball_a0.tga";
     vistexisquadpoly = 1;
     vistexanifps = 17.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};
INSTANCE FB_TAIL(C_PARTICLEFX)
{
 /*    ppsvalue = 40.;
     //ppsscalekeys_s = "1 0";
     ppsislooping = 1;
     //ppsissmooth = 1;
     //ppsfps = 10.;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 2.00000009e-003;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 0.5 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.;
     dirmode_s = "DIR";
     dirfor_s = "world";
     lsppartavg = 600.;
     lsppartvar = 100.;
     visname_s = "firetail.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 90.;*/

     ppsvalue = 150.;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "1 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "5";
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 100.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "FIRETAIL.TGA";
     visorientation_s = "VELO";
	 vistexisquadpoly = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "12 20";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphastart = 255.;


};

INSTANCE FB_TAIL2(C_PARTICLEFX)
{
     ppsvalue = 40.;
     //ppsscalekeys_s = "1 0";
     ppsislooping = 1;
     //ppsissmooth = 1;
     //ppsfps = 10.;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 2.00000009e-003;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 0.5 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.;
     dirmode_s = "DIR";
     dirfor_s = "world";
     lsppartavg = 600.;
     lsppartvar = 100.;
     visname_s = "firetail.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 90.;

};

INSTANCE FB3 (C_PARTICLEFX)
{
     ppsvalue = 80.;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "3";
     dirmode_s = "DIR";
     lsppartavg = 600.;
     lsppartvar = 200.;
     flygravity_s = "0 0 0";
     visname_s = "fireball_a0.tga";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "12 12";
     vissizeendscale = 0.5;
     visalphafunc_s = "ADD";
     visalphastart = 80.;
};

INSTANCE CAST1 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsfps = 1.5;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "1 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "5";
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 400.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "PFXFLARE2_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "15 20";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};
INSTANCE CAST2 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsfps = 1.5;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "1 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "30";
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 400.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "PFXFLARE2_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 180 50";
     vistexcolorend_s = "150 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};

INSTANCE CAST3 (C_PARTICLEFX)
{
     ppsvalue = 50.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 0;
     ppsfps = 1;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "30";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     velvar = 5.00000007e-002;
     lsppartavg = 800.;
     lsppartvar = 350.;
     flygravity_s = "0 0 0";
     visname_s = "PFX6_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "30 30";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

INSTANCE BLAST(C_PARTICLEFX)
{
     ppsvalue = 10.;
     ppsscalekeys_s = "3 2 1";
	 //ppsIsLooping = 1;
	 ppsfps = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "80";
     shpscalekeys_s = "0 1 0.5 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.;
     dirmode_s = "DIR";
     dirfor_s = "world";
     lsppartavg = 800.;
     lsppartvar = 100.;
     visname_s = "PFX6_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 10.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "20 20";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 150.;
     visalphaend = 50.;
};

INSTANCE CAST4 (C_PARTICLEFX)
{
     ppsvalue = 50.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "30 100 30";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     velvar = 5.00000007e-002;
     lsppartavg = 800.;
     lsppartvar = 350.;
     flygravity_s = "0 0 0";
     visname_s = "ALIEN0000.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "30 30";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};
INSTANCE CAST6 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "600 0 600";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     velavg = 1.99999995e-004;
     lsppartavg = 6000.;
     lsppartvar = 1000.;
     flygravity_s = "0 -0.00004 0";
     flycolldet_b = 0;
     visname_s = "FLARESTAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 50 33";
     vissizestart_s = "50 50";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 50.;
};
INSTANCE CAST7 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "50 50 ";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 5.;
     dirangleheadvar = 360.;
     dirangleelevvar = 360.;
     velavg = 9.99999978e-003;
     velvar = 5.00000007e-002;
     lsppartavg = 2000.;
     lsppartvar = 350.;
     flygravity_s = "0 0.00004 0";
     visname_s = "DEMONSIGN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 80 0";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "50 10";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 200.;
};

INSTANCE CAST10 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     ppscreateem_s = "CAST9";
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 800.;
     lsppartvar = 350.;
     flygravity_s = "0 0 0";
     visname_s = "FLAME_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 150 80";
     vistexcolorend_s = "100 0 0 ";
     vissizestart_s = "30 30";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

INSTANCE BREATH(C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "30";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     velvar = 5.00000007e-002;
     lsppartavg = 800.;
     lsppartvar = 350.;
     flygravity_s = "0 0 0";
     visname_s = "ALIEN0000.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 100 100";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "30 30";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

INSTANCE WaterFX(C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "200";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     velavg = 1.99999995e-004;
     lsppartavg = 2000.;
     lsppartvar = 350.;
     flygravity_s = "0 0.0002 0";
     visname_s = "FLARESTAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 50 33";
     vissizestart_s = "50 50";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

INSTANCE SPELL_MASSDEATH(C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "UNIFORM";
     shpdistribwalkspeed = 0.039999999;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "1 ";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "=";
     dirfor_s = "OBJECT";
     dirangleheadvar = 360.000000000;
     lsppartavg = 699.000000000;
     flygravity_s = "0";
     flycolldet_b = 0;
     visname_s = "ELECTRICBLUE0000.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "8 8 ";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "ZPLASMA0.TGA";
};

INSTANCE SPELL_MASSDEATH_INVEST(C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsislooping = 0;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpdim_s = "10";
     shpscalekeys_s = "1 ";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 3.000000000;
     dirmode_s = "=";
     dirfor_s = "OBJECT";
     dirangleheadvar = 360.000000000;
     velavg = 0.300000012;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.0001 0 ";
     flycolldet_b = 1;
     visname_s = "ELECTRICBLUE0000.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "5 5";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 150.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "ZPLASMA0.TGA";
     trlwidth = 10.000000000;
};
