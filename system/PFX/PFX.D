	
//////////////////////////////////////
//	
// 	Particle-Effects 
//	Instance-Definitions 
//	
//////////////////////////////////////
INSTANCE MR_INSERT_PRE (C_PARTICLEFX)
{
     ppsvalue = 300.;
     ppsscalekeys_s = "0 0.5 1.0 0.1 0.0 0.01 0.00";
     ppsfps = 0.2;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "-1 -1 -70";
     shpdistribtype_s = "RAND";
     shpdim_s = "205";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 0.00012;
     lsppartavg = 1500;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "BLUEGLOW.TGA";
     visorientation_s = "VELO";
     vistexanifps = 4.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "155 0 0";
     vistexcolorend_s = "155 0 0";
     vissizestart_s = "650 650";
     vissizeendscale = 1.00000005e-003;
     visalphafunc_s = "ADD";
     visalphastart = 15.;
     visalphaend = 105.;
};

INSTANCE MR_INSERT_BOOM (C_PARTICLEFX)
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
     lsppartavg = 1300.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "240 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 200.5000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 1.;   
};
INSTANCE MR_INSERT_LOOP (C_PARTICLEFX)
{
     ppsvalue = 4;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     ppscreateem_s = "MR_INSERT_LOOP2";
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "-80 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "DIR";
     dirfor_s = "world";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = 90;
     velavg = 0.00999999978;
     lsppartavg = 2000;
     lsppartvar = 500;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "215 0 0";
     vissizestart_s = "35 150";
     vissizeendscale = 3;
     visalphafunc_s = "ADD";
     visalphastart = 120;
};

INSTANCE MR_INSERT_LOOP2 (C_PARTICLEFX)
{
     ppsvalue = 20;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "DIR";
     dirfor_s = "world";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelev = 90;
     velavg = 0.02999999978;
     lsppartavg = 10000;
     lsppartvar = 500;
     flygravity_s = "0 0.00001 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "215 0 0";
     vissizestart_s = "1 10";
     vissizeendscale = 1;
     visalphafunc_s = "ADD";
     visalphastart = 175;
};
INSTANCE SANDSTORM_FX(C_PARTICLEFX) 
{
		ppsvalue = 380; 
	ppsscalekeys_s = "1.0 0.8 0.9 1.4 0.3 1.0 0.4 0.7 1 0.6 0.9 1.1 0.5"; 
	ppsislooping = 1; 
	ppsissmooth = 1; 
	shptype_s = "SPHERE"; 
	shpfor_s = "OBJECT"; 
	shpoffsetvec_s = "0 0 0"; 
	shpdistribtype_s = "RANDOM"; 
	shpdistribwalkspeed = 0.100000001; 
	shpisvolume = 1; 
	shpdim_s = "3500 3000 3500"; 
	shpscalekeys_s = "1"; 
	shpscaleislooping = 1; 
	shpscaleissmooth = 1; 
	shpscalefps = 2; 
     diranglehead = 280.;//
     dirangleheadvar = 10.;//
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.27100000003;//
     velvar = 0.19;//
	dirmode_s = "DIR"; 
	lsppartavg = 6500; 
	lsppartvar = 1800; 
	flygravity_s = "0.01 0 0"; 
	visname_s = "FIRESMOKE.TGA";
	visorientation_s = "NONE"; 
	vistexisquadpoly = 1; 
	vistexanifps = 5; 
	vistexaniislooping = 2; 
	vistexcolorstart_s = "136 135 80"; 
	vistexcolorend_s = "200 200 165"; 
	vissizestart_s = "300 300"; 
	vissizeendscale = 5; 
	visalphafunc_s = "BLEND"; 
	visalphastart = 190; 
	visalphaend = 250; 
	
};
INSTANCE WATERFALL_STEAM (C_PARTICLEFX)
{
     ppsvalue = 35.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "600 150 450";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "none";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.2200000003;
     lsppartavg = 3100.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.000003 0";
     visname_s = "SIMPLEGLOW.tga";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "205 205 205";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "130 130";
     vissizeendscale = 5.900000000;
     visalphafunc_s = "ADD";
     visalphastart = 87.000000000;
     visalphaend = 99.000000000;
};
INSTANCE WATERFALL_STEAM_PSI (C_PARTICLEFX)
{
     ppsvalue = 95.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "2800 1200 2000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "none";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.2200000003;
     lsppartavg = 3100.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.000003 0";
     visname_s = "SIMPLEGLOW.tga";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "205 205 205";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "170 170";
     vissizeendscale = 5.900000000;
     visalphafunc_s = "ADD";
     visalphastart = 1.000000000;
     visalphaend = 122.000000000;
};
INSTANCE WATERFALL_STEAM_SMALL (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "400 70 150";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "none";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.2200000003;
     lsppartavg = 2200.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.000003 0";
     visname_s = "SIMPLEGLOW.tga";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "205 205 205";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "110 110";
     vissizeendscale = 4.900000000;
     visalphafunc_s = "ADD";
     visalphastart = 70.000000000;
     visalphaend = 81.000000000;
};
PROTOTYPE WATERFALL (C_PARTICLEFX)
{
     ppsvalue = 13.00;
     ppsislooping = 1;
     ppsscalekeys_s = "1 1 1 1 0.8 0.7 0.9 1.1 1.1 1.2 1.1";
     shptype_s = "BOX";
     shpfor_s = "object";
     shpisvolume = 1; 
     shpdim_s = "1 10 1";
     shpscalefps = 10.;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;     
//      dirmode_s = "DIR";
	      ShpDistribType_S = "uniform";
// 	 DirModeTargetPos_S = "5 50 70";     
//      diranglehead = 180.;
//      dirangleheadvar = 5.;
//      dirangleelev = 20.;
//      dirangleelevvar = 5.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 270.;
     dirangleheadvar = 5.;
     dirangleelev = 20.;
     dirangleelevvar = 5.;
      velavg = 0.30100000003;
     velvar = 0.05;
     flyCollDet_B = 1;
     lsppartavg = 800.;
     lsppartvar = 10.;
     flygravity_s = "0 -0.001 0";
     visname_s = "PFX_WATERFALL1.TGA";
     vistexanifps = 1.000000000;     
     visorientation_s = "VELO3D"; 
     vistexisquadpoly = 1;   
     vistexcolorstart_s = "190 190 190";     
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "120 170";     
     vissizeendscale = 1.8;     
     visalphafunc_s = "ADD";     
     visalphastart = 95;
     visalphaend = 95;
};
PROTOTYPE WATERFALL_LOW (C_PARTICLEFX)
{
     ppsvalue = 13.00;
     ppsislooping = 1;
     ppsscalekeys_s = "1 1 1 1 0.8 0.7 0.9 1.1 1.1 1.2 1.1";
     shptype_s = "BOX";
     shpfor_s = "object";
     shpisvolume = 1; 
     shpdim_s = "1 10 2";
     shpscalefps = 10.;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;     
//      dirmode_s = "DIR";
	      ShpDistribType_S = "uniform";
// 	 DirModeTargetPos_S = "5 50 70";     
//      diranglehead = 180.;
//      dirangleheadvar = 5.;
//      dirangleelev = 20.;
//      dirangleelevvar = 5.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     diranglehead = 270.;
     dirangleheadvar = 5.;
     dirangleelev = 20.;
     dirangleelevvar = 5.;
      velavg = 0.00100000003;
     velvar = 0.00;
     flyCollDet_B = 1;
     lsppartavg = 800.;
     lsppartvar = 10.;
     flygravity_s = "0 -0.001 0";
     visname_s = "PFX_WATERFALL1.TGA";
     vistexanifps = 1.000000000;     
     visorientation_s = "VELO3D"; 
     vistexisquadpoly = 1;   
     vistexcolorstart_s = "190 190 190";     
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "120 170";     
     vissizeendscale = 1.8;     
     visalphafunc_s = "ADD";     
     visalphastart = 85;
     visalphaend = 95;
};
INSTANCE QQW (WATERFALL)
{
     ppsvalue = 40.00;//iloœæ wody
     shpdim_s = "1 100 500";//szerokoœæ wodospadu (góra)
     diranglehead = 270.;//kierunek wodospadu (fixed)
     dirangleheadvar = 5.;//rozproszenie wody
     dirangleelev = 20.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.42100000003;//moc wypchniecia do przodu
     velvar = 0.05;//+/- wypchniecia
     lsppartavg = 1700.;//wysokoœæ wodospadu
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     
};
INSTANCE WATERFALL_NEAR_NO_FIELDS (WATERFALL)
{
     ppsvalue = 40.00;//iloœæ wody
     shpdim_s = "1 100 500";//szerokoœæ wodospadu (góra)
     diranglehead = 270.;//kierunek wodospadu (fixed)
     dirangleheadvar = 5.;//rozproszenie wody
     dirangleelev = 20.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.42100000003;//moc wypchniecia do przodu
     velvar = 0.05;//+/- wypchniecia
     lsppartavg = 1700.;//wysokoœæ wodospadu
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     
};
INSTANCE WATERFALL_DOWN_ORC_CASTLE (WATERFALL)
{
     ppsvalue = 59.00;//iloœæ wody
     shpdim_s = "1 130 531";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 20.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.47100000003;//moc wypchniecia do przodu
     velvar = 0.09;//+/- wypchniecia
     lsppartavg = 3900.;//wysokoœæ wodospadu-
     lsppartvar = 10.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     
     flyCollDet_B = 0;
};
INSTANCE WATERFALL_NEAR_ORC_ARENA (WATERFALL)
{
     ppsvalue = 26.00;//iloœæ wody
     shpdim_s = "1 30 101";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.27100000003;//moc wypchniecia do przodu
     velvar = 0.09;//+/- wypchniecia
     lsppartavg = 2000.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     
     flyCollDet_B = 0;

};
INSTANCE WATERFALL_IN_MONASTARYDNG (WATERFALL)
{
     ppsvalue = 20.00;//iloœæ wody
     shpdim_s = "1 10 21";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 7.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.07100000003;//moc wypchniecia do przodu
     velvar = 0.03;//+/- wypchniecia
     lsppartavg = 800.;//wysokoœæ wodospadu-
     lsppartvar = 200.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};
INSTANCE WATERFALL_IN_MONASTARYDNG_LOW (WATERFALL_LOW)
{
     ppsvalue = 20.00;//iloœæ wody
     shpdim_s = "1 10 21";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 7.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.000000031;//moc wypchniecia do przodu
     velvar = 0.0001;//+/- wypchniecia
     lsppartavg = 800.;//wysokoœæ wodospadu-
     lsppartvar = 200.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};
INSTANCE WATERFALL_NEAR_MONSTARY (WATERFALL)
{
     ppsvalue = 66.00;//iloœæ wody
     shpdim_s = "1 30 501";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.67100000003;//moc wypchniecia do przodu
     velvar = 0.09;//+/- wypchniecia
     lsppartavg = 2000.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     
     flyCollDet_B = 0;

};
INSTANCE WATERFALL_NEAR_XARDASTOWER_1 (WATERFALL)
{
     ppsvalue = 70.00;//iloœæ wody
     shpdim_s = "1 30 430";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 5.;//rozproszenie wody
     dirangleelev = 40.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.39100000003;//moc wypchniecia do przodu
     velvar = 0.01;//+/- wypchniecia
     lsppartavg = 4800.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0.00007 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};

INSTANCE WATERFALL_NEAR_XARDASTOWER_2_UP (WATERFALL)
{
     ppsvalue = 80.00;//iloœæ wody
     shpdim_s = "1 30 500";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 50.;//rozproszenie wody
     dirangleelev = 20.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.94100000003;//moc wypchniecia do przodu
     velvar = 0.09;//+/- wypchniecia
     lsppartavg = 3000.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};
INSTANCE WATERFALL_NEAR_XARDASTOWER_2_1 (WATERFALL)
{
     ppsvalue = 56.00;//iloœæ wody
     shpdim_s = "1 30 500";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 20.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.52100000003;//moc wypchniecia do przodu
     velvar = 0.01;//+/- wypchniecia
     lsppartavg = 3600.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};
INSTANCE WATERFALL_NEAR_XARDASTOWER_2_2 (WATERFALL)
{
     ppsvalue = 56.00;//iloœæ wody
     shpdim_s = "1 30 500";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.63100000003;//moc wypchniecia do przodu
     velvar = 0.01;//+/- wypchniecia
     lsppartavg = 3600.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};

INSTANCE WATERFALL_NEAR_PSI_1_1 (WATERFALL)
{
     ppsvalue = 50.00;//iloœæ wody
     shpdim_s = "1 30 450";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.43100000003;//moc wypchniecia do przodu
     velvar = 0.01;//+/- wypchniecia
     lsppartavg = 2400.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};
INSTANCE WATERFALL_NEAR_PSI_1_2 (WATERFALL)
{
     ppsvalue = 50.00;//iloœæ wody
     shpdim_s = "1 30 500";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.43100000003;//moc wypchniecia do przodu
     velvar = 0.01;//+/- wypchniecia
     lsppartavg = 2600.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};
INSTANCE WATERFALL_NEAR_PSI_1_3 (WATERFALL)
{
     ppsvalue = 50.00;//iloœæ wody
     shpdim_s = "1 30 550";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.43100000003;//moc wypchniecia do przodu
     velvar = 0.01;//+/- wypchniecia
     lsppartavg = 2600.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};

INSTANCE WATERFALL_NEAR_PSI_2_1 (WATERFALL)
{
     ppsvalue = 50.00;//iloœæ wody
     shpdim_s = "1 30 700";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.3100000003;//moc wypchniecia do przodu
     velvar = 0.01;//+/- wypchniecia
     lsppartavg = 2200.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury  
    

};
INSTANCE WATERFALL_NEAR_PSI_2_2 (WATERFALL)
{
     ppsvalue = 46.00;//iloœæ wody
     shpdim_s = "1 30 650";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.3100000003;//moc wypchniecia do przodu
     velvar = 0.01;//+/- wypchniecia
     lsppartavg = 2200.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};
INSTANCE WATERFALL_NEAR_PSI_2_3 (WATERFALL)
{
     ppsvalue = 46.00;//iloœæ wody
     shpdim_s = "1 30 720";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.3100000003;//moc wypchniecia do przodu
     velvar = 0.01;//+/- wypchniecia
     lsppartavg = 2200.;//wysokoœæ wodospadu-
     lsppartvar = 100.;//+/- ---,,---
     flygravity_s = "0 -0.001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};

INSTANCE WATERFALL_NEAR_PSI_HALF (WATERFALL)
{
     ppsvalue = 23.00;//iloœæ wody
     shpdim_s = "1 30 620";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.3100000003;//moc wypchniecia do przodu
     velvar = 0.01;//+/- wypchniecia
     lsppartavg = 1200.;//wysokoœæ wodospadu-
     lsppartvar = 1.;//+/- ---,,---
     flygravity_s = "0.0007 -0.0000001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};
INSTANCE WATERFALL_NEAR_PSI_HALF_LONGER (WATERFALL)
{
     ppsvalue = 26.00;//iloœæ wody
     shpdim_s = "1 30 620";//szerokoœæ wodospadu (góra)
     diranglehead = 280.;//kierunek wodospadu (fixed)
     dirangleheadvar = 10.;//rozproszenie wody
     dirangleelev = 10.;//?
     dirangleelevvar = 5.;//?
     velavg = 0.3100000003;//moc wypchniecia do przodu
     velvar = 0.01;//+/- wypchniecia
     lsppartavg = 2100.;//wysokoœæ wodospadu-
     lsppartvar = 1.;//+/- ---,,---
     flygravity_s = "0.0007 -0.0000001 0";//szybkosc opadania
     vissizestart_s = "120 170";//wielkosc tekstury     

};
INSTANCE QQH (C_PARTICLEFX)
{
     ppsvalue = 100.;
     ppsislooping = 1;
     ppsscalekeys_s = "1";
     shptype_s = "BOX";
     shpfor_s = "object";
     shpisvolume = 1; 
     shpdim_s = "1 50 1";
     shpscalefps = 10.;
     dirmode_s = "none";
     dirfor_s = "DIR";
	 DirModeTargetPos_S = "1 50 70";     
     diranglehead = 180.;
     dirangleheadvar = 5.;
     dirangleelev = 20.;
     dirangleelevvar = 5.;
     velavg = 0.20100000003;
     velvar = 0.5;
     lsppartavg = 1000.;
     lsppartvar = 400.;
     flygravity_s = "0 -0.0007 0";
     visname_s = "PFX_WATERFALL1.TGA";
     vistexanifps = 5.000000000;     
     visorientation_s = "VELO"; 
     vistexisquadpoly = 1;   
     vistexcolorstart_s = "255 255 255";     
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "25 25";     
     vissizeendscale = 2.;     
     visalphafunc_s = "ADD";     
     visalphastart = 255;
     visalphaend = 205;
};
INSTANCE QQ2 (C_PARTICLEFX)
{
     ppsvalue = 100.;
     ppsislooping = 1;
     ppsscalekeys_s = "1";
     shptype_s = "BOX";
     shpfor_s = "object";
     shpisvolume = 1; 
     shpdim_s = "100 50 1";
     shpscalefps = 10.;
     dirmode_s = "TARGET";
     dirfor_s = "DIR";
	 DirModeTargetPos_S = "1 50 70";     
     diranglehead = 180.;
     dirangleheadvar = 5.;
     dirangleelev = 20.;
     dirangleelevvar = 5.;
     velavg = 0.30100000003;
     velvar = 0.1;
     lsppartavg = 5000.;
     lsppartvar = 400.;
     flygravity_s = "0 -0.001 0";
     visname_s = "DECAL_EARTHQUAKE.TGA";
     vistexanifps = 5.000000000;     
     visorientation_s = "VELO"; 
     vistexisquadpoly = 1;   
     vistexcolorstart_s = "255 255 255";     
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "25 25";     
     vissizeendscale = 2.;     
     visalphafunc_s = "ADD";     
     visalphastart = 255;
     visalphaend = 205;
};
INSTANCE PFX_MIS_TRI_ADANOS_CURSE (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     ppscreateem_s = "MFX_ICESPELL_TARGETEND";
     ppscreateemdelay = 5000.000000000;
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
     velavg = 0.000001000;
     lsppartavg = 10000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "VELO";
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
INSTANCE PFX_MIS_TRI_ADANOS_INIT (C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     ppscreateem_s = "=";
     shptype_s = "LINE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 50 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "100";
     shpscalekeys_s = "1 2 3";
     shpscalefps = 1.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 3000.000000000;
     lsppartvar = 800.000000000;
     flygravity_s = "0 -0.00006 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 100 255";
     vissizestart_s = "30 30";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 15.000000000;
};
INSTANCE PFX_MIS_TRI_INNOS_INIT (C_PARTICLEFX)
{
     ppsvalue = 90.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "120 50 50";
     shpscalekeys_s = "1 10";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.0010000000;
     velvar = 0.00000000;
     lsppartavg = 800.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.000001 0";
     visname_s = "MFX_FIRESWD.TGA";
     visorientation_s = "NONE";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "155 155 155";
     vissizestart_s = "3 3";
     vistexisquadpoly = 1;     
     vissizeendscale = 80.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 145.000000000;
};
INSTANCE PFX_MIS_TRI_BELIAR_INIT (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "120 50 50";
     shpscalekeys_s = "1 10";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     dirmode_s = "DIR";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.0010000000;
     velvar = 0.00000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.000001 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 3.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 100.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};
INSTANCE PFX_MIS_KAT_DEMON3 (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1 1 2 2 2 3 3 4 4 5";
     ppsissmooth = 1;
     ppsfps = 3;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10";
     shpscaleissmooth = 1;
     shpscalefps = 3;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90;
     dirangleheadvar = 45;
     dirangleelev = 90;
     dirangleelevvar = 45;
     velavg = 0.100000001;
     lsppartavg = 1500;
     lsppartvar = 300;
     flygravity_s = "0 0.00008 0";
     visname_s = "MFX_MAGICCLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "55 170 255";
     vissizestart_s = "10 10";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};
INSTANCE PFX_MIS_KAT_DEMON2 (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1 1 2 2 2 3 3 4 4 5";
     ppsissmooth = 1;
     ppsfps = 3;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10";
     shpscaleissmooth = 1;
     shpscalefps = 3;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90;
     dirangleheadvar = 45;
     dirangleelev = 90;
     dirangleelevvar = 45;
     velavg = 0.100000001;
     lsppartavg = 1500;
     lsppartvar = 300;
     flygravity_s = "0 0.0000 0";
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 195;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};
INSTANCE PFX_MIS_KAT_DEMON1 (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1 2";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "800";
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
     velavg = 0.300000000;
     velvar = 0.000100000;
     lsppartavg = 4000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     
     vistexaniislooping = 1;
     vistexcolorstart_s = "55 100 255";
     vistexcolorstart_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 250.000000000;
     trlfadespeed = 1.500000000;
     trltexture_s = "XBEAM2.TGA";
     trlwidth = 5.000000000;
     
};

INSTANCE KATRAKANAT_MAGE_HAND(C_PARTICLEFX)
{
     ppsvalue = 30;
     shpscalekeys_s = "1 1.5 2 3 5 5 7";
     ppsislooping = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "30";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1 1.5 2 3 5 5 7";
     shpScaleIsLooping=0;
     shpscaleissmooth = 1;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180;
     dirangleelevvar = 180;
     velavg = 0.00999999978;
     lsppartavg = 2000;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "HEAVENLIGHT.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 18;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 205";
     vistexcolorend_s = "255 255 205";
     vissizestart_s = "4 20";
     vissizeendscale = 8;
     visalphafunc_s = "ADD";
     visalphastart = 255;

};
INSTANCE KATRAKANAT_PIECE_FIRE (C_PARTICLEFX) //MFX_METEOR_INIT
{
      ppsvalue = 80.000000000;
     ppsscalekeys_s = "1.0 0.9 0.8 0.5 0.3 0.1 0.1";   
     ppsfps = 0.1600000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "=";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "7";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.100000001;
     lsppartavg = 350.000000000;
     flygravity_s = "0 0.0003 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "7 7";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
 };
 INSTANCE RITUAL_KATRAKANAT_PFX_CIRCLE (C_PARTICLEFX) //MFX_METEOR_INIT
{
      ppsvalue = 800.000000000;
     ppsscalekeys_s = "1.0 0.8 0.5 0.3 0.1";   
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "=";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "240";
     shpscalekeys_s = "1 0.8 0.4 0.1 0.02";
    // shpscaleislooping = 1;
     shpisvolume = 0;
     shpscaleissmooth = 1;
     shpscalefps = 1.250000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.100000001;
     lsppartavg = 350.000000000;
     flygravity_s = "0 0.0003 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "7 7";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;

 };
 INSTANCE RITUAL_KATRAKANAT_PFX_ALTAR (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "70 10 59";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "20 1000 20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleelev = 90.000000000;
     velavg = 0.000000000001000;
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
     vissizestart_s = "14 60";
     vissizeendscale = 12.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
  INSTANCE RITUAL_KATRAKANAT_PFX_CIRCLE_HERO (C_PARTICLEFX) //MFX_METEOR_INIT
{
      ppsvalue = 200.000000000;
     ppsscalekeys_s = "1.0";   
     ppsislooping = 1;     
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "=";
     shpdistribtype_s = "UNIFORM";
     shpoffsetvec_s = "0 -20 0";
     
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpisvolume = 0;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.100000001;
     lsppartavg = 350.000000000;
     flygravity_s = "0 0.0003 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "7 7";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;

 };
 
 INSTANCE DBAURA (C_PARTICLEFX)
{
    ppsvalue = 30.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 50 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000;
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 70";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "DB_AURA_A0.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;
     vistexanifps = 12.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s =  "255 255 255";
     vissizestart_s = "70 70";
     vissizeendscale = 3.200000000;
     visalphafunc_s = "ADD";
     visalphastart = 55.000000000;
     visalphaend = 120.000000000;
     
};
INSTANCE TEST_AURA (C_PARTICLEFX)
{
    ppsvalue = 1.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 20 0";
     shpdistribtype_s = "walk";
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "mesh";
     dirfor_s = "OBJECT";
     dirangleheadvar = 0.0000000000;
     diranglehead = 90.000000000;     
     dirangleelevvar = 0.000000000;     
     dirangleelev = 0.000000000;
     velavg = 0.0000001;
     lsppartavg = 10000.000000000;
     lsppartvar = 0.000000000;
     visname_s = "FX_AURA_01.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "220 10 0";
     vistexcolorend_s = "200 200 0";
     vissizestart_s = "200 200";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
     
};

INSTANCE AS (C_PARTICLEFX)
{
    ppsvalue = 0.505500000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
 
     ppsissmooth = 0;
     //ppsfps = 0.500000000000;
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "walk";
     shpdim_s = "1";
    // shpscalekeys_s = "1 0";
     shpscaleislooping = 0;
     shpscaleissmooth = 0;
     //shpscalefps = 0.500000000;
     dirmode_s = "mesh";
     dirfor_s = "OBJECT";
     dirangleheadvar = 0.0000000000;
     diranglehead = 90.000000000;     
     dirangleelevvar = 0.000000000;     
     dirangleelev = 0.000000000;
     velavg = 0.0000001;
     lsppartavg = 2000.000000000;
     lsppartvar = 0.000000000;
     visname_s = "CZ_TORCH_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 77.500000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "245 255 225";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "40 25";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 245.000000000;
     visalphaend = 245.000000000;
     
};
prototype FIX (C_PARTICLEFX)//bugfix, otherwise get zctexture cant be possible
{
     visname_s = "DREAMFX_A0.TGA";
     visorientation_s = "NONE";
     visalphaend = 245.000000000;
    
};
INSTANCE d0 (FIX)
{
     visname_s = "DREAMFX_A0.TGA";
};
INSTANCE d1 (FIX)
{
     visname_s = "DREAMFX_A1.TGA";
};
INSTANCE d2 (FIX)
{
     visname_s = "DREAMFX_A2.TGA";
};
INSTANCE d3 (FIX)
{
     visname_s = "DREAMFX_A3.TGA";
};
INSTANCE d4 (FIX)
{
     visname_s = "DREAMFX_A4.TGA";
};
INSTANCE d5 (FIX)
{
     visname_s = "DREAMFX_A5.TGA";
};
INSTANCE d6 (FIX)
{
     visname_s = "DREAMFX_A6.TGA";
};
INSTANCE d7 (FIX)
{
     visname_s = "DREAMFX_A7.TGA";
};
INSTANCE d8 (FIX)
{
     visname_s = "DREAMFX_A8.TGA";
};
INSTANCE d9 (FIX)
{
     visname_s = "DREAMFX_A9.TGA";
};
INSTANCE d10 (FIX)
{
     visname_s = "DREAMFX_A10.TGA";
};
INSTANCE d11 (FIX)
{
     visname_s = "DREAMFX_A11.TGA";
};
INSTANCE d12 (FIX)
{
     visname_s = "DREAMFX_A12.TGA";
};
INSTANCE d13 (FIX)
{
     visname_s = "DREAMFX_A13.TGA";
};
INSTANCE d14 (FIX)
{
     visname_s = "DREAMFX_A14.TGA";
};
INSTANCE d15 (FIX)
{
     visname_s = "DREAMFX_A15.TGA";
};
INSTANCE d16 (FIX)
{
     visname_s = "DREAMFX_A16.TGA";
};
INSTANCE d17 (FIX)
{
     visname_s = "DREAMFX_A17.TGA";
};
INSTANCE d18 (FIX)
{
     visname_s = "DREAMFX_A18.TGA";
};
INSTANCE d19 (FIX)
{
     visname_s = "DREAMFX_A19.TGA";
};
INSTANCE d20 (FIX)
{
     visname_s = "DREAMFX_A20.TGA";
};
INSTANCE d21 (FIX)
{
     visname_s = "DREAMFX_A21.TGA";
};
INSTANCE d22 (FIX)
{
     visname_s = "DREAMFX_A22.TGA";
};
INSTANCE d23 (FIX)
{
     visname_s = "DREAMFX_A23.TGA";
};
INSTANCE d24 (FIX)
{
     visname_s = "DREAMFX_A24.TGA";
};
INSTANCE d25 (FIX)
{
     visname_s = "DREAMFX_A25.TGA";
};
INSTANCE d26 (FIX)
{
     visname_s = "DREAMFX_A26.TGA";
};
INSTANCE d27 (FIX)
{
     visname_s = "DREAMFX_A27.TGA";
};
INSTANCE d28 (FIX)
{
     visname_s = "DREAMFX_A28.TGA";
};
INSTANCE d29 (FIX)
{
     visname_s = "DREAMFX_A29.TGA";
};

INSTANCE d30 (FIX)
{
     visname_s = "DREAMFX_A30.TGA";
};
INSTANCE d31 (FIX)
{
     visname_s = "DREAMFX_A31.TGA";
};
INSTANCE d32 (FIX)
{
     visname_s = "DREAMFX_A32.TGA";
};
INSTANCE d33 (FIX)
{
     visname_s = "DREAMFX_A33.TGA";
};
INSTANCE d34 (FIX)
{
     visname_s = "DREAMFX_A34.TGA";
};
INSTANCE d35 (FIX)
{
     visname_s = "DREAMFX_A35.TGA";
};
INSTANCE d36 (FIX)
{
     visname_s = "DREAMFX_A36.TGA";
};
INSTANCE d37 (FIX)
{
     visname_s = "DREAMFX_A37.TGA";
};
INSTANCE d38 (FIX)
{
     visname_s = "DREAMFX_A38.TGA";
};
INSTANCE d39 (FIX)
{
     visname_s = "DREAMFX_A39.TGA";
};
INSTANCE d40 (FIX)
{
     visname_s = "DREAMFX_A40.TGA";
};
INSTANCE d41 (FIX)
{
     visname_s = "DREAMFX_A41.TGA";
};
INSTANCE d42 (FIX)
{
     visname_s = "DREAMFX_A42.TGA";
};
INSTANCE d43 (FIX)
{
     visname_s = "DREAMFX_A43.TGA";
};
INSTANCE d44 (FIX)
{
     visname_s = "DREAMFX_A44.TGA";
};
INSTANCE d45 (FIX)
{
     visname_s = "DREAMFX_A45.TGA";
};
INSTANCE d46 (FIX)
{
     visname_s = "DREAMFX_A46.TGA";
};
INSTANCE d47 (FIX)
{
     visname_s = "DREAMFX_A47.TGA";
};
INSTANCE SKYNIGHTSUNNYLAYER0 (FIX)
{
     visname_s = "SKYNIGHT_SUNNY_LAYER0.TGA";
};


INSTANCE ASD(C_PARTICLEFX)
{
    ppsvalue = 4.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
    
     ppsissmooth = 0;
     //ppsfps = 0.500000000000;
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "walk";
     shpdim_s = "1";
    // shpscalekeys_s = "1 0";
     shpscaleislooping = 0;
     shpscaleissmooth = 0;
     //shpscalefps = 0.500000000;
     dirmode_s = "mesh";
     dirfor_s = "OBJECT";
     dirangleheadvar = 0.0000000000;
     diranglehead = 90.000000000;     
     dirangleelevvar = 0.000000000;     
     dirangleelev = 0.000000000;
     velavg = 0.0000001;
     lsppartavg = 2000.000000000;
     lsppartvar = 0.000000000;
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "252 169 05";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "100 100";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 55.000000000;
     visalphaend = 105.000000000;
     
};
INSTANCE ASD2(C_PARTICLEFX)
{
    ppsvalue = 4.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
    
     ppsissmooth = 0;
     //ppsfps = 0.500000000000;
     shptype_s = "POINT";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "walk";
     shpdim_s = "1";
    // shpscalekeys_s = "1 0";
     shpscaleislooping = 0;
     shpscaleissmooth = 0;
     //shpscalefps = 0.500000000;
     dirmode_s = "mesh";
     dirfor_s = "OBJECT";
     dirangleheadvar = 0.0000000000;
     diranglehead = 90.000000000;     
     dirangleelevvar = 0.000000000;     
     dirangleelev = 0.000000000;
     velavg = 0.0000001;
     lsppartavg = 2000.000000000;
     lsppartvar = 0.000000000;
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "242 105 35";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "50 50";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 65.000000000;
     visalphaend = 125.000000000;
     
};
INSTANCE NEAR_DRAGON (C_PARTICLEFX)
{
     ppsvalue = 600.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpisvolume = 1;     
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "1000";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     diranglehead = 0.000000000;
     dirangleheadvar = 0.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 0.000000000;
     velvar = 0.3;     
     velavg = 0.1;
     lsppartavg = 2000;
     lsppartvar = 1000;
     flycolldet_b = 1;     
     flygravity_s = "0 0.0001 0";
     visname_s = "GLOWWORM_AURA.TGA";
     visorientation_s = "VELO3D";
     vistexisquadpoly = 1;     
     vistexanifps = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 200 200";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 30.0;
     visalphafunc_s = "ADD";
     visalphastart = 205.;     
     visalphaend = 0.;
};
//---------------------
//Irrlicht PFX

INSTANCE IRRLICHT (C_PARTICLEFX)
{
     ppsvalue = 200.;
     ppsscalekeys_s = "1.0 0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 500;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "BLUEGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 4.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 1.00000005e-003;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

INSTANCE IRRLICHT_WARN (C_PARTICLEFX)
{
     ppsvalue = 200.;
     ppsscalekeys_s = "1.0 0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "40";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1 2 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 500;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 4.;
     vistexisquadpoly = 1;     
     
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 1.00000005e-003;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

INSTANCE IRRLICHT_DIE (C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1 1 1 3";
     ppsislooping = 0;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "20";
     shpscalekeys_s = "1 10 5 1";
     shpscaleislooping = 0;
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

// IRRLICHT ENDE
//---------------------------
////////////////////////////////////////---------------------
//Irrlicht2 PFX

INSTANCE IRRLICHT2 (C_PARTICLEFX)
{
     ppsvalue = 200.;
     ppsscalekeys_s = "1.0 0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 500;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "BLUEGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 4.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 50 255";
     vistexcolorend_s = "105 105 255";
     vissizestart_s = "100 100";
     vissizeendscale = 1.00000005e-003;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

INSTANCE IRRLICHT_PSI (C_PARTICLEFX)
{
     ppsvalue = 50.;
     ppsscalekeys_s = "1.0 0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 500;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "CFLARERED.TGA";
     visorientation_s = "NONE";
     vistexanifps = 4.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "250 50 50";
     vistexcolorend_s = "255 105 105";
     vissizestart_s = "100 100";
     vistexisquadpoly = 1;          
     vissizeendscale = 1.00000005e-003;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};
INSTANCE IRRLICHT3 (C_PARTICLEFX)
{
     ppsvalue = 200.;
     ppsscalekeys_s = "1.0 0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 500;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 4.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "60 60";
     vissizeendscale = 1.00000005e-003;
     visalphafunc_s = "SUB";
     visalphaend = 255.;
};
INSTANCE IRRLICHT_FIRE (C_PARTICLEFX)
{
     ppsvalue = 200.;
     ppsscalekeys_s = "1.0 0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "15";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1 1.2 1.5 1.1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 500;
     lsppartvar = 100;
     flygravity_s = "0 0 0";
     visname_s = "MFX_FIRESWD.TGA";
     visorientation_s = "VELO";
     vistexanifps = 4.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "60 60";
     vistexisquadpoly = 1;     
     vissizeendscale = 2.00000005e-003;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};

// IRRLICHT3 ENDE
//---------------------------
//////////////////////////////////////
//ALTE!!
// DUAL WEAPONS MESH
INSTANCE DUAL1(C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsislooping = 1;     
     ppsfps = 1.000000000;
	 shptype_s			= "MESH";
	 shpfor_s			= "object";
	 shpoffsetvec_s		= "9.394 -2.602 25.765";
	 shpdistribtype_s	= "walk";//random
	 shpdim_s			= "1";
     shpmesh_s = "ItMw_1H_Sword_Dual_01_FIX.3DS"; 
     ShpMeshRender_B		= 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "OBJECT";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 2000.000000000;
     lsppartvar = 1900.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_FEAR_DEMONFACE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 13";
     vissizeendscale = 1.200000000;
     visalphafunc_s = "ADD";
     visalphastart = 0.000000000;
};
INSTANCE DUAL1_HAND(C_PARTICLEFX)
{
     ppsvalue = 999999999.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsislooping = 0;     
     ppsfps = 0.0000000001;
	 shptype_s			= "MESH";
	 shpfor_s			= "object";
	 shpoffsetvec_s		= "0 0 0";
	 shpdistribtype_s	= "walk";//random
	 shpdim_s			= "1";
     shpmesh_s = "ItMw_1H_Sword_Bastard_01.3DS"; 
     ShpMeshRender_B		= 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "OBJECT";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 2000.000000000;
     lsppartvar = 1900.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_FEAR_DEMONFACE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 13";
     vissizeendscale = 1.200000000;
     visalphafunc_s = "ADD";
     visalphastart = 0.000000000;
};
INSTANCE DUAL2(C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsislooping = 1;     
     ppsfps = 1.000000000;
	 shptype_s			= "MESH";
	 shpfor_s			= "object";
	 shpoffsetvec_s		= "9.394 -2.602 25.765";
	 shpdistribtype_s	= "walk";//random
	 shpdim_s			= "1";
     shpmesh_s = "ItMw_1H_Sword_Dual_02_FIX.3DS"; 
     ShpMeshRender_B		= 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "OBJECT";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 2000.000000000;
     lsppartvar = 1900.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_FEAR_DEMONFACE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 13";
     vissizeendscale = 1.200000000;
     visalphafunc_s = "ADD";
     visalphastart = 0.000000000;
};
INSTANCE DUAL2_HAND(C_PARTICLEFX)
{
     ppsvalue = 3.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsislooping = 1;     
     ppsfps = 1.000000000;
	 shptype_s			= "MESH";
	 shpfor_s			= "object";
	 shpoffsetvec_s		= "0 0 0";
	 shpdistribtype_s	= "walk";//random
	 shpdim_s			= "1";
     shpmesh_s = "ItMw_1H_Sword_Bastard_02.3DS"; 
     ShpMeshRender_B		= 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "OBJECT";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.003000000;
     velvar = 0.001000000;
     lsppartavg = 2000.000000000;
     lsppartvar = 1900.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_FEAR_DEMONFACE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 13";
     vissizeendscale = 1.200000000;
     visalphafunc_s = "ADD";
     visalphastart = 0.000000000;
};












//STATUES
INSTANCE RED_FACE (C_PARTICLEFX)
{
     ppsvalue = 2.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 0.5 0.5 0.5";
     ppsissmooth = 1;
     ppsislooping = 1;     
     ppsfps = 2.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "8 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "12";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "OBJECT";
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
     vissizestart_s = "10 13";
     vissizeendscale = 1.200000000;
     visalphafunc_s = "ADD";
     visalphastart = 175.000000000;
};
INSTANCE RED_EYE_L (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.500000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "7 -4.5 4";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 0.000000000;
     dirangleelevvar = 0.000000000;
     velavg = 0.0000001;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "18 18";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE RED_EYE_R (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.500000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "7 4.5 4";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 0.000000000;
     dirangleelevvar = 0.000000000;
     velavg = 0.0000001;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "18 18";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

// INSTANCE PartikelEffekt1 (C_ParticleFX) 
// INSTANCE PartikelEffekt1 (C_ParticleFXProto) 
//NEW PFX's
//INSTANCE MAGIC_SWORD (C_PARTICLEFX)//-ORCWARRIOR-16:16 2006-06-10==>IceSword Efect
// {
	// ppsvalue			= 128;
	// ppsscalekeys_s		= "1.0 0.5 0.2 1 1.8 1.3 0.2 0.4 1.5 0.6 1";
	// PpsIsSmooth = 1;
//	ppsislooping		= 1;
	// ppsfps				= 32;
	// shptype_s			= "MESH";
	// shpfor_s			= "object";
	// shpoffsetvec_s		= "0 0 0";
	// shpdistribtype_s	= "walk";//random
	// shpdim_s			= "2";
    // shpmesh_s = "MAGIC_SWD.3DS"; 
	// shpscalekeys_s		= "1";
	// shpscaleislooping	= 1;
	// shpscaleissmooth	= 1;
	// shpscalefps			= 2;
	// dirmode_s			= "NONE";
	// velavg				= 9.99999996e-012;
	// lsppartavg			= 300;
	// flygravity_s		= "0 0.000 0";
	// visname_s			= "ELECTRICBLUE0000.TGA";
	// visorientation_s	= "VELO3D";
	// vistexisquadpoly	= 1;
	// vistexanifps		= 15;
	// vistexaniislooping	= 1;
	// vistexcolorstart_s	= "255 255 255";
	// vistexcolorend_s	= "000 200 255";
	// vissizestart_s		= "0.5 0.5";
	// vissizeendscale		= 10;
	// visalphafunc_s		= "ADD";
	// visalphastart		= 255;

	 // trlFadeSpeed = 0.2; 
	 // trlTexture_S = "ELECTRIC_A0.TGA";
	 // TrlWidth = 5;

// };
INSTANCE LAVAINCAVE (C_PARTICLEFX)
{
     ppsvalue = 105.000000000;
     ppsscalekeys_s = "20";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "6000 10000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.300000012;
     velvar = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 100";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE ICE_ARROW (C_PARTICLEFX)
{
	ppsvalue			= 150;
	ppsscalekeys_s		= "1.0";
	ppsfps				= 0.0002;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
    shpmesh_s = "ItAm_Arrow_01.3DS"; 
	ShpMeshRender_B 	= 1;    
	shpscalekeys_s		= "0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 70;
	dirmode_s			= "NONE";
	velavg				= 1.99999996e-012;//9.
	lsppartavg			= 400;
	flygravity_s		= "0 0.000 0";
	visname_s			= "MAGICDUMMY16BIT_4.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "195 255 255";
	vistexcolorend_s	= "100 200 255";
	vissizestart_s		= "0.8 0.8";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 0;
};
INSTANCE ICE_BOLT (C_PARTICLEFX)
{
	ppsvalue			= 150;
	ppsscalekeys_s		= "1.0";
	ppsfps				= 0.0002;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
    shpmesh_s = "ItAm_Bolt_01.3DS"; 
	shpscalekeys_s		= "0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 70;
	dirmode_s			= "NONE";
	velavg				= 1.99999996e-012;//9.
	lsppartavg			= 400;
	flygravity_s		= "0 0.000 0";
	visname_s			= "MAGICDUMMY16BIT_4.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "195 255 255";
	vistexcolorend_s	= "100 200 255";
	vissizestart_s		= "0.5 0.5";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
};
INSTANCE FIRE_ARROW (C_PARTICLEFX)
{
	ppsvalue			= 150;
	ppsscalekeys_s		= "1.0";
	ppsfps				= 0.0002;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
    shpmesh_s = "ItAm_Arrow_01.3DS"; 
	shpscalekeys_s		= "0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 70;
	dirmode_s			= "NONE";
	velavg				= 1.99999996e-012;//9.
	lsppartavg			= 400;
	flygravity_s		= "0 0.0002 0";
    visname_s = "HUMANBURN.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 211 111";
	vistexcolorend_s	= "200 100 55";
	vissizestart_s		= "1.5 1.8";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
};
INSTANCE FIRE_BOLT (C_PARTICLEFX)
{
	ppsvalue			= 60;
	ppsscalekeys_s		= "1.0";
	ppsfps				= 0.0002;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
    shpmesh_s = "ItAm_Bolt_01.3DS"; 
	shpscalekeys_s		= "0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 70;
	dirmode_s			= "NONE";
	velavg				= 1.99999996e-012;//9.
	lsppartavg			= 400;
	flygravity_s		= "0 0.0002 0";
    visname_s = "HUMANBURN.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 211 111";
	vistexcolorend_s	= "200 100 55";
	vissizestart_s		= "1.2 1.4";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
};
//FIRESWORD 1H
//FIRESWORD 1H
//FIRESWORD 1H
//FIRESWORD 1H
//FIRESWORD 1H
//FIRESWORD 1H
//FIRESWORD 1H
//FIRESWORD 1H
//FIRESWORD 1H
//FIRESWORD 1H
INSTANCE FIRERUNE_1HSWORD (C_PARTICLEFX)
{
	 ppsvalue = 25.000000000;
     ppsscalekeys_s = " 1 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-10.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "CFLARERED.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "255 0 0";
	vistexcolorend_s	= "255 50 50";
     vissizestart_s = "35 35";
     vissizeendscale = 1.00000000;
     visalphafunc_s = "ADD";
     visalphastart = 90.000000000;	
     visalphaend = 90.000000000;	
 /*    
	ppsvalue			= 60;
	ppsscalekeys_s		= "1";
	ppsfps				= 0.001;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "1";
    shpmesh_s = "ItMw_1H_RuneSword_BLADE.3DS"; 
	shpscalekeys_s		= "1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 1;
	dirmode_s			= "RAND";
	velavg				= 1.9-012;//9.
	lsppartavg			= 400;
	flygravity_s		= "0 0.0004 0";
	visname_s			= "HUMANBURN.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 205 155";
	vistexcolorend_s	= "200 150 55";
	vissizestart_s		= "3.7 7";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 185;*/
/* 	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscalefps			= 1;
	dirmode_s			= "DIR";
	velavg				= 1.6000000001;//???//szybkoœæ pojawiania siê i znikania ppsów
	lsppartavg			= 99999.906;
	lsppartvar			= 9999.50001;//Iloœæ ppsów na sec	zarazem ich "rozprzesztrzenianie" siê
	flygravity_s		= "-1 -1 -1";
 //   visname_s = "PFXANI22.TGA";//MFX_SLEEP_STAR
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 0;
	vistexanifps		= 7;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "100 120 255";
	vistexcolorend_s	= "170 200 255";
	vissizestart_s		= "15 15";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;  */
//
/* 	 trlFadeSpeed = 0.1; 
	 trlTexture_S = "PLASMA01.TGA";
	 TrlWidth = 4; */

};
INSTANCE FIRERUNE_1HSWORD_2 (C_PARTICLEFX)
{
     ppsvalue = 15.000000000;
     ppsscalekeys_s = "1 2 1";
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.01000000;
     lsppartavg = 200.000000000;
     lsppartvar = 100.000000000;
     visname_s = "MFX_FIRERAIN_RAIN_BIG.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "2 10";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 205.000000000;

};
INSTANCE FIRERUNE_1HSWORD_3 (C_PARTICLEFX)
{
	ppsvalue = 24;
	ppsscalekeys_s = "1 1.5 1";
	ppsislooping = 1;
	ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
	dirangleheadvar = 180;
	dirangleelevvar = 180;
	velavg = 0.008;
	velvar = 0.03;
	lsppartavg = 2000;
	flygravity_s = "0 -0.00001 0";
	flycolldet_b = 0;
	visname_s = "FIREFLARE.TGA";
	visorientation_s = "NONE";
	vistexanifps = 18;
	vistexaniislooping = 1;
	vistexcolorstart_s = "255 220 220";
	vistexcolorend_s = "255 220 220";
	vissizestart_s = "9 9";
	vissizeendscale = 11;
	visalphafunc_s = "ADD";
	visalphastart = 160;
	 /*ppsvalue = 44.000000000;
     ppsscalekeys_s = "2 1 0.5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1H_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 -0.00001 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 110 10";
     vistexcolorend_s = "255 120 2";
     vissizestart_s = "8 8";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 140.000000000;*/

};
INSTANCE FIRERUNE_1HSWORD_4 (C_PARTICLEFX)
{
	 ppsvalue = 26.000000000;
     ppsscalekeys_s = "1 1.5 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
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
     vistexisquadpoly = 1;
     visname_s = "MFX_FIRESWD.TGA";
     visorientation_s = "NONE";
     vistexanifps = 7.500000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "9 9";
     vissizeendscale = 6.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 120.000000000;

};
//FIRESWORD 2H
//FIRESWORD 2H
//FIRESWORD 2H
//FIRESWORD 2H
//FIRESWORD 2H
//FIRESWORD 2H
//FIRESWORD 2H
//FIRESWORD 2H
//FIRESWORD 2H
//FIRESWORD 2H
INSTANCE FIRERUNE_2HSWORD (C_PARTICLEFX)
{
	 ppsvalue = 40.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-12.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "CFLARERED.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "255 0 0";
	vistexcolorend_s	= "255 50 50";
     vissizestart_s = "25 25";
     vissizeendscale = 1.00000000;
     visalphafunc_s = "ADD";
     visalphastart = 90.000000000;	
     visalphaend = 90.000000000;	
 /*    
	ppsvalue			= 60;
	ppsscalekeys_s		= "1";
	ppsfps				= 0.001;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "1";
    shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
	shpscalekeys_s		= "1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 1;
	dirmode_s			= "RAND";
	velavg				= 1.9-012;//9.
	lsppartavg			= 400;
	flygravity_s		= "0 0.0004 0";
	visname_s			= "HUMANBURN.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 205 155";
	vistexcolorend_s	= "200 150 55";
	vissizestart_s		= "3.7 7";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 185;*/
/* 	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscalefps			= 1;
	dirmode_s			= "DIR";
	velavg				= 1.6000000001;//???//szybkoœæ pojawiania siê i znikania ppsów
	lsppartavg			= 99999.906;
	lsppartvar			= 9999.50001;//Iloœæ ppsów na sec	zarazem ich "rozprzesztrzenianie" siê
	flygravity_s		= "-1 -1 -1";
 //   visname_s = "PFXANI22.TGA";//MFX_SLEEP_STAR
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 0;
	vistexanifps		= 7;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "100 120 255";
	vistexcolorend_s	= "170 200 255";
	vissizestart_s		= "15 15";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;  */
//
/* 	 trlFadeSpeed = 0.1; 
	 trlTexture_S = "PLASMA01.TGA";
	 TrlWidth = 4; */

};
INSTANCE FIRERUNE_2HSWORD_2 (C_PARTICLEFX)
{
     ppsvalue = 15.000000000;
     ppsscalekeys_s = "1 2 1";
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.01000000;
     lsppartavg = 200.000000000;
     lsppartvar = 100.000000000;
     visname_s = "MFX_FIRERAIN_RAIN_BIG.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "2 10";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 205.000000000;

};
INSTANCE FIRERUNE_2HSWORD_3 (C_PARTICLEFX)
{
	ppsvalue = 24;
	ppsscalekeys_s = "1 1.5 1";
	ppsislooping = 1;
	ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
	dirangleheadvar = 180;
	dirangleelevvar = 180;
	velavg = 0.008;
	velvar = 0.03;
	lsppartavg = 2000;
	flygravity_s = "0 -0.00001 0";
	flycolldet_b = 0;
	visname_s = "FIREFLARE.TGA";
	visorientation_s = "NONE";
	vistexanifps = 18;
	vistexaniislooping = 1;
	vistexcolorstart_s = "255 220 220";
	vistexcolorend_s = "255 220 220";
	vissizestart_s = "9 9";
	vissizeendscale = 11;
	visalphafunc_s = "ADD";
	visalphastart = 160;
	 /*ppsvalue = 44.000000000;
     ppsscalekeys_s = "2 1 0.5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 -0.00001 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 110 10";
     vistexcolorend_s = "255 120 2";
     vissizestart_s = "8 8";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 140.000000000;*/

};
INSTANCE FIRERUNE_2HSWORD_4 (C_PARTICLEFX)
{
	 ppsvalue = 26.000000000;
     ppsscalekeys_s = "1 1.5 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
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
     vistexisquadpoly = 1;
     visname_s = "MFX_FIRESWD.TGA";
     visorientation_s = "NONE";
     vistexanifps = 7.500000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "9 9";
     vissizeendscale = 6.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 120.000000000;

};
//WATER
INSTANCE WATERRUNE_2HSWORD (C_PARTICLEFX)
{
	 ppsvalue = 24.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 -0.00001 0";
     flycolldet_b = 0;
     visname_s = "PFXANI22.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "4 4";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 211.000000000;

};
INSTANCE WATERRUNE_2HSWORD_2 (C_PARTICLEFX)
{
	 ppsvalue = 24.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.3300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MAGICFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "8 8";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 120.000000000;

};
INSTANCE WATERRUNE_2HSWORD_3 (C_PARTICLEFX)
{
	 ppsvalue = 34.000000000;
     ppsscalekeys_s = "2 3 4";
     ppsislooping = 1;
     ppsissmooth = 1;
      ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 -0.00001 0";
     flycolldet_b = 0;
     visname_s = "MFX_FIRESWD.TGA";
     visorientation_s = "VELO";
     vistexanifps = 7.500000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 90.000000000;
};
INSTANCE WATERRUNE_2HSWORD_4 (C_PARTICLEFX)
{
	 ppsvalue = 40.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-12.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "CFLARERED.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "0 100 255";
	vistexcolorend_s	= "0 120 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 110.000000000;	
     visalphaend = 110.000000000;	
     
 };
//WATER 1H
INSTANCE WATERRUNE_1hSWORD (C_PARTICLEFX)
{
	 ppsvalue = 24.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 -0.00001 0";
     flycolldet_b = 0;
     visname_s = "PFXANI22.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "8 8";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 211.000000000;

};
INSTANCE WATERRUNE_1hSWORD_2 (C_PARTICLEFX)
{
	 ppsvalue = 24.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
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
     visname_s = "MAGICFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "4 6";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 120.000000000;


};
INSTANCE WATERRUNE_1hSWORD_3 (C_PARTICLEFX)
{
	 ppsvalue = 34.000000000;
     ppsscalekeys_s = "2 3 4";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 -0.00001 0";
     flycolldet_b = 0;
     visname_s = "MFX_FIRESWD.TGA";
     visorientation_s = "VELO";
     vistexanifps = 7.500000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 90.000000000;
};
INSTANCE WATERRUNE_1HSWORD_4 (C_PARTICLEFX)
{
	 ppsvalue = 40.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-10.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "CFLARERED.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "0 100 255";
	vistexcolorend_s	= "0 120 255";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 110.000000000;	
     visalphaend = 110.000000000;	
     
 };
////////////////////
// LIGHT SWD
///////////////////
//2h
INSTANCE LIGHTRUNE_2hSWORD (C_PARTICLEFX)
{
	 ppsvalue = 24.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "LINE";
   //	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "-30 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "52 5 1";
     shpscalekeys_s = "0 1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 9.000000000;
     dirmode_s = "RAND";
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
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;
    vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 120.000000000;

};
INSTANCE LIGHTRUNE_2hSWORD_2 (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsfps = 1.100000000;
     ppscreateem_s = "MFX_LIGHT_ORIGIN_LESS";
     ppscreateemdelay = 80000.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
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
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "3 30";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 235.000000000;

};
INSTANCE LIGHTRUNE_2hSWORD_3 (C_PARTICLEFX)
{
	 ppsvalue = 40.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-12.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "FLARESTAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "220 205 100";
	vistexcolorend_s	= "220 205 100";
     vissizestart_s = "60 60";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;	
     visalphaend = 100.000000000;	
     
};
//1H
INSTANCE LIGHTRUNE_1HSWORD (C_PARTICLEFX)
{
	 ppsvalue = 24.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
   //	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "-30 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "52 5 1";
     shpscalekeys_s = "0 1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 9.000000000;
     dirmode_s = "RAND";
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
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 120.000000000;

};
INSTANCE LIGHTRUNE_1HSWORD_2 (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
     ppsfps = 0.100000000;
     ppscreateem_s = "MFX_LIGHT_ORIGIN_LESS";
     ppscreateemdelay = 80000.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1H_RuneSword_BLADE.3DS"; 
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
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "3 30";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 235.000000000;

};
INSTANCE LIGHTRUNE_1hSWORD_3 (C_PARTICLEFX)
{
	 ppsvalue = 40.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-10.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "FLARESTAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "220 205 100";
	vistexcolorend_s	= "220 205 100";
     vissizestart_s = "60 60";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;	
     visalphaend = 100.000000000;	
     
};
////////////////////
// WIND SWD
///////////////////
//2h
INSTANCE WINDRUNE_2hSWORD (C_PARTICLEFX)
{

	 ppsvalue = 24.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
   //	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "-40 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "52 5 5";
     shpscalekeys_s = "0 1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 9.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "-50 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "55 75 55";
     vistexcolorend_s = "25 55 25";
     vissizestart_s = "4 6";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 160.000000000;


};
INSTANCE WINDRUNE_2hSWORD_2 (C_PARTICLEFX)
{
	 ppsvalue = 34.000000000;
     ppsscalekeys_s = "2 5 8";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
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
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "VELO";
     vistexanifps = 7.500000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "30 55 30";
     vistexcolorend_s = "20 55 20";
     vissizestart_s = "6 6";
     vissizeendscale = 12.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 110.000000000;
};
INSTANCE WINDRUNE_2hSWORD_3 (C_PARTICLEFX)
{
	 ppsvalue = 40.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-13.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "ZFLARE1.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "55 100 55";
	vistexcolorend_s	= "55 100 55";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 110.000000000;	
     visalphaend = 110.000000000;	
};

//1H
INSTANCE WINDRUNE_1HSWORD (C_PARTICLEFX)
{

	 ppsvalue = 24.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
   //	 shpmesh_s = "ItMw_1H_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "-40 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "52 5 5";
     shpscalekeys_s = "0 1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 9.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "-50 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "55 75 55";
     vistexcolorend_s = "25 55 25";
     vissizestart_s = "4 6";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 160.000000000;


};
INSTANCE WINDRUNE_1HSWORD_2 (C_PARTICLEFX)
{
	 ppsvalue = 34.000000000;
     ppsscalekeys_s = "2 5 8";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "SIMPLEGLOW.TGA";
     visorientation_s = "VELO";
     vistexanifps = 7.500000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "30 55 30";
     vistexcolorend_s = "20 55 20";
     vissizestart_s = "6 6";
     vissizeendscale = 12.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 110.000000000;
};
INSTANCE WINDRUNE_1hSWORD_3 (C_PARTICLEFX)
{
	 ppsvalue = 40.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-10.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "ZFLARE1.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "55 100 55";
	vistexcolorend_s	= "55 100 55";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 110.000000000;	
     visalphaend = 110.000000000;	
};
//////////////////
// HEAL
////////////////// 
INSTANCE MFX_Hero_HealAura (C_PARTICLEFX)
{
     ppsvalue = 25.000000000;
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
INSTANCE MFX_Hero_HealAura_START (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "-100 0 0";
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
INSTANCE HEALRUNE_2hSWORD (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2H_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "1";
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
     vissizestart_s = "3 3";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "WHITE.TGA";
};
INSTANCE HEALRUNE_1hSWORD (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1H_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
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
     vissizestart_s = "3 3";
     vissizeendscale = 20.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "WHITE.TGA";
};
/////////////
// PSI
/////////////
//2H
INSTANCE PSIRUNE_2HSWORD (C_PARTICLEFX)
{
	 ppsvalue = 54.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 0.2;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 9.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.0000007;
     velvar = 0.000005;
     lsppartavg = 810.000000000;
     flygravity_s = "0 0.00001 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "195 255 195";
     vistexcolorend_s = "195 255 195";
     vissizestart_s = "6.5 6.5";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 55.000000000;   
     trlFadeSpeed = 0.3; 
	 trlTexture_S = "MFX_LIGHT_RAY.TGA";
	 TrlWidth = 3;
     
       /*	
	 ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
	 ppsfps		= 0.2;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2H_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "7";
     shpscalekeys_s = "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 1;
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;	
     dirfor_s = "object";
	velvar				= 0.000001;//99999996;//e-012;//9.
	lsppartavg			= 400;
     flygravity_s = "0 0 0";
	 visname_s	  = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 1.0;
     vistexaniislooping = 1;
 	vistexisquadpoly	= 1;    
     vistexcolorstart_s = "200 255 200";
     vistexcolorstart_s = "200 255 200";
	vissizestart_s		= "3.5 3.5";
	vissizeendscale		= 5;
     visalphafunc_s = "ADD";
     visalphastart = 240.000000000;
     visalphaend = 190.000000000; */
};
INSTANCE PSIRUNE_2HSWORD_2 (C_PARTICLEFX)
{	 ppsvalue = 30.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-13.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "ZFLARE6.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "55 200 55";
	vistexcolorend_s	= "55 200 55";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 80.000000000;	
     visalphaend = 80.000000000;	
 };
//1H
INSTANCE PSIRUNE_1HSWORD (C_PARTICLEFX)
{
	 ppsvalue = 54.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 0.2;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "62 5 5";
     shpscalekeys_s = "0 1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 9.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.0000004;
     velvar = 0.00001;
     lsppartavg = 810.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "195 255 195";
     vistexcolorend_s = "195 255 195";
     vissizestart_s = "6.5 6.5";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 55.000000000;   
     trlFadeSpeed = 0.3; 
	 trlTexture_S = "MFX_LIGHT_RAY.TGA";
	 TrlWidth = 3;
}; 
INSTANCE PSIRUNE_1HSWORD_2 (C_PARTICLEFX)
{	 ppsvalue = 40.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-10.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "ZFLARE6.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "55 200 55";
	vistexcolorend_s	= "55 200 55";
     vissizestart_s = "30 30";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 80.000000000;	
     visalphaend = 80.000000000;	
 };
////////////
// DARK SWD
////////////
//2H
//2H
//2H
INSTANCE DARKRUNE_2HSWORD (C_PARTICLEFX)
{
	 ppsvalue = 124.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 0.2;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 -2 -5";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";//62 5 5";
     shpscalekeys_s = "0 1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 9.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.0000004;
     velvar = 0.00001;
     lsppartavg = 310.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 165";
     vistexcolorend_s = "255 0 165";
     vissizestart_s = "20 20";
     vissizeendscale = 0.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 205.000000000;
     visalphaend = 155.000000000;   
     trlFadeSpeed = 0.3; 
	 trlTexture_S = "MFX_LIGHT_RAY.TGA";
	 TrlWidth = 3;
}; 
INSTANCE DARKRUNE_2HSWORD_2 (C_PARTICLEFX)
{
	 ppsvalue = 24.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
   //	 shpmesh_s = "ItMw_1H_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "-30 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "52 5 5";
     shpscalekeys_s = "0 1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 9.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "-50 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 34 0";
     vistexcolorend_s = "0 45 0";
     vissizestart_s = "4 6";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 190.000000000;
}; 
INSTANCE DARKRUNE_2HSWORD_3 (C_PARTICLEFX)
{
	 ppsvalue = 34.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 0.1;
     shptype_s = "BOX";
   //	 shpmesh_s = "ItMw_2h_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "-30 -2 -5";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "52 5 5";
     shpscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
    // dirmodetargetfor_s = "OBJECT";
    // dirmodetargetpos_s = "0 0 0";
     velavg = 0.000004;
     velvar = 0.0001;
     lsppartavg = 310.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MAGICCOULDRON.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "2 5";
     vissizeendscale = 0.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 105.000000000;
     visalphaend = 155.000000000;   
     trlFadeSpeed = 0.3; 
	 trlTexture_S = "MFX_LIGHT_RAY.TGA";
	 TrlWidth = 3;
}; 
INSTANCE DARKRUNE_2HSWORD_4 (C_PARTICLEFX)
{	 ppsvalue = 40.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-13.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "PFXFLARE3.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "200 10 155";
	vistexcolorend_s	= "200 10 155";
     vissizestart_s = "35 35";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;	
     visalphaend = 100.000000000;	
 };
//1H
//1H
//1H
INSTANCE DARKRUNE_1HSWORD (C_PARTICLEFX)
{
	 ppsvalue = 124.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 0.2;
     shptype_s = "MESH";
   	 shpmesh_s = "ItMw_1H_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "0 -2 -5";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";//62 5 5";
     shpscalekeys_s = "0 1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 9.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     velavg = 0.0000004;
     velvar = 0.00001;
     lsppartavg = 310.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 165";
     vistexcolorend_s = "255 0 165";
     vissizestart_s = "20 20";
     vissizeendscale = 0.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 205.000000000;
     visalphaend = 155.000000000;   
     trlFadeSpeed = 0.3; 
	 trlTexture_S = "MFX_LIGHT_RAY.TGA";
	 TrlWidth = 3;
}; 
INSTANCE DARKRUNE_1HSWORD_2 (C_PARTICLEFX)
{
	 ppsvalue = 24.000000000;
     ppsscalekeys_s = "3 2 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
   //	 shpmesh_s = "ItMw_1H_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "-30 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "52 5 5";
     shpscalekeys_s = "0 1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 9.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "-50 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 34 0";
     vistexcolorend_s = "0 45 0";
     vissizestart_s = "4 6";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 190.000000000;
}; 
INSTANCE DARKRUNE_1HSWORD_3 (C_PARTICLEFX)
{
	 ppsvalue = 34.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 0.1;
     shptype_s = "BOX";
   //	 shpmesh_s = "ItMw_1H_RuneSword_BLADE.3DS"; 
     shpfor_s = "object";
     shpoffsetvec_s = "-30 -2 -5";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "52 5 5";
     shpscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 1.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
    // dirmodetargetfor_s = "OBJECT";
    // dirmodetargetpos_s = "0 0 0";
     velavg = 0.000004;
     velvar = 0.0001;
     lsppartavg = 310.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MAGICCOULDRON.TGA";
     visorientation_s = "VELO3D";
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "2 5";
     vissizeendscale = 0.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 105.000000000;
     visalphaend = 155.000000000;   
     trlFadeSpeed = 0.3; 
	 trlTexture_S = "MFX_LIGHT_RAY.TGA";
	 TrlWidth = 3;
}; 
INSTANCE DARKRUNE_1HSWORD_4 (C_PARTICLEFX)
{	 ppsvalue = 40.000000000;
     ppsscalekeys_s = " 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "-10.5 -3.2 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.0300000;
     shpisvolume = 1;
     shpscalekeys_s = "1";
     //shpscaleislooping = 1;
     //shpscaleissmooth = 1;
     shpscalefps = 0.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
  //   dirangleheadvar = 180.000000000;
  //   dirangleelevvar = 180.000000000;
     velavg = 0.000000010;
   //  velvar = 0.029999999;
     lsppartavg = 100.000000000;
	flygravity_s		= "0 0 0";
     flycolldet_b = 0;
     visname_s = "PFXFLARE3.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
    vistexanifps = 18.000000000;
     vistexaniislooping = 1;
	vistexcolorstart_s	= "200 10 155";
	vistexcolorend_s	= "200 10 155";
     vissizestart_s = "35 35";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;	
     visalphaend = 100.000000000;	
 };
INSTANCE MAGIC_SWORD (C_PARTICLEFX)//-ORCWARRIOR-16:16 2006-06-10==>IceSword Efect
{
	ppsvalue			= 350;
	ppsscalekeys_s		= "1.0";
	ppsfps				= 0.0002;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
    shpmesh_s = "MAGIC_SWD.3DS"; 
	shpscalekeys_s		= "0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";
	shpscaleislooping	= 0;
	shpscaleissmooth	= 0;
	shpscalefps			= 70;
	dirmode_s			= "NONE";
	velavg				= 1.99999996e-012;//9.
	lsppartavg			= 400;
	flygravity_s		= "0 0.000 0";
	visname_s			= "MAGICDUMMY16BIT_4.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "195 255 255";
	vistexcolorend_s	= "100 200 255";
	vissizestart_s		= "0.7 0.7";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
/* 	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscalefps			= 1;
	dirmode_s			= "DIR";
	velavg				= 1.6000000001;//???//szybkoœæ pojawiania siê i znikania ppsów
	lsppartavg			= 99999.906;
	lsppartvar			= 9999.50001;//Iloœæ ppsów na sec	zarazem ich "rozprzesztrzenianie" siê
	flygravity_s		= "-1 -1 -1";
 //   visname_s = "PFXANI22.TGA";//MFX_SLEEP_STAR
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 0;
	vistexanifps		= 7;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "100 120 255";
	vistexcolorend_s	= "170 200 255";
	vissizestart_s		= "15 15";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;  */
//
/* 	 trlFadeSpeed = 0.1; 
	 trlTexture_S = "PLASMA01.TGA";
	 TrlWidth = 4; */

};
INSTANCE MAGIC_SWORD_DAM_COLIDE (C_PARTICLEFX)//-ORCWARRIOR-20:32 2006-06-13==>IceSword Efect at normal attack
{
     ppsvalue = 1500.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "75";
	 shpscalekeys_s		= "1 0";
	 shpscaleislooping	= 0;
	 shpscaleissmooth	= 1;
	 shpscalefps			= 1.5;
	 shpoffsetvec_s = "0 -60 0";
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.001000000;
     lsppartavg = 200.000000000;
     flygravity_s = "0 0.01 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "155 205 255";
     vistexcolorend_s = "100 165 255";
     vissizestart_s = "25 25";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;

};
INSTANCE MAGIC_SWORD_DAM_COLIDE_2 (C_PARTICLEFX)//-ORCWARRIOR-20:32 2006-06-13==>IceSword Efect at atack with bonus
{
     ppsvalue = 1500.000000000;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "45";
	 shpscalekeys_s		= "1 0.5 1 1.5";
	 shpscaleislooping	= 0;
	 shpscaleissmooth	= 1;
	 shpscalefps			= 2;
	 shpoffsetvec_s = "0 -60 0";
     dirmode_s = "RAND";
     dirfor_s = "OBJECT";
     dirmodetargetfor_s = "OBJECT";
     velavg = 0.001000000;
     lsppartavg = 250.000000000;
     flygravity_s = "0 0.01 0";
     visname_s = "FIRE2_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "105 185 255";
     vistexcolorend_s = "100 165 255";
     vissizestart_s = "10 10";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;

};
INSTANCE MAGIC_SWORD_DAM_COLIDE_ICE (C_PARTICLEFX)
{
     ppsvalue = 35.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     ppscreateem_s = "MFX_ICESPELL_TARGETEND";
     ppscreateemdelay = 30.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20 80 20";
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
     velavg = 0.000001000;
     lsppartavg = 20000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_FREEZE_MULTIICE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MAGIC_SWORD_LOOP (C_PARTICLEFX)//-ORCWARRIOR-23:45 2006-06-11==>IceSword Efect(looping)
{
	ppsislooping		= 1;
	ppsvalue			= 300;
	ppsscalekeys_s		= "1.0";
	ppsfps				= 300;
	shptype_s			= "MESH";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";
	shpdim_s			= "7";
    shpmesh_s = "MAGIC_SWD.3DS"; 
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscaleissmooth	= 1;
	shpscalefps			= 2;
	dirmode_s			= "NONE";
	velavg				= 9.99999996e-012;
	lsppartavg			= 300;
	flygravity_s		= "0 0.000 0";
	visname_s			= "PFX13_A0.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 1;
	vistexanifps		= 15;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "255 255 255";
	vistexcolorend_s	= "000 100 255";
	vissizestart_s		= "4 4";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;

};
INSTANCE MAGIC_SWORD_SPEC (C_PARTICLEFX)//-ORCWARRIOR-16:16 2006-06-10==>IceSword Efect
{
	ppsvalue			= 5;
	ppsscalekeys_s		= "1";
	PpsIsSmooth = 1;
	//ppsislooping		= 1;
	ppsfps				= 5;	
	shptype_s			= "POINT";
	shpfor_s			= "object";
	shpoffsetvec_s		= "0 0 0";
	shpdistribtype_s	= "RANDOM";//random
	ShpIsVolume			= 1;
	ShpDistribWalkSpeed = 20;
	shpdim_s			= "10";
	shpscalekeys_s		= "1";
	shpscaleislooping	= 1;
	shpscalefps			= 1;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 185.000000000;
     dirangleelevvar = 15.000000000;
     velavg = 0.400000003;
     velvar = 0.260000001;
     lsppartavg = 52.000000000;
     lsppartvar = 14.000000000;
     flygravity_s = "0 -0.0003 0";
    visname_s = "ZFLARE1.TGA";
	visorientation_s	= "VELO3D";
	vistexisquadpoly	= 0;
	vistexanifps		= 7;
	vistexaniislooping	= 1;
	vistexcolorstart_s	= "120 250 255";
	vistexcolorend_s	= "255 255 255";
	vissizestart_s		= "2 2";
	vissizeendscale		= 10;
	visalphafunc_s		= "ADD";
	visalphastart		= 255;
//
	 trlFadeSpeed = 0.06; 
	 trlTexture_S = "XBEAM3.TGA";
	 TrlWidth = 5;

};

INSTANCE TELEPORT_CENTER_2 (C_PARTICLEFX)
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
     shpscalekeys_s = "2 1.5 2 3 2 1 1 1.5";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 4.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 500.000000000;
     visname_s = "BLUESPARKLE0000.TGA";
     vistexcolorstart_s = "50 150 255";
     vistexcolorend_s = "50 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 140.000000000;
};
INSTANCE TELEPORT_CENTER (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsislooping = 1;
     ppsissmooth = 0;
     ppsscalekeys_s = "1 0.3 2 3 6 5 10 2 4 3 2 1 2";	 
     ppsfps = 8.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "world";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "6";
     shpscalekeys_s = "2 1.5 2 1 1.5 2 2.2 3 4.5 2 1.5 2 .1.2 1.3 1.4 1.5 1.6 1.7 1.8";
     shpscaleislooping = 1;
     shpscalefps = 5.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 500.000000000;
     visname_s = "TELSTURM.TGA";
     vistexcolorstart_s = "150 150 205";
     vistexcolorend_s = "50 80 255";
     vissizestart_s = "10 10";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 140.000000000;
};
INSTANCE TELEPORT_AURA (C_PARTICLEFX)
{
     ppsislooping = 1;
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
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
INSTANCE GLOWWORMS (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppscreateem_s = "GLOWWORMS_SMALL";
     ppscreateemdelay = 1000.000000000;	 
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.200000003;
     velvar = 0.100000001;
     lsppartavg = 4000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0.00005 0.00005";
     visname_s = "GLOWWORM.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 200 200";
     vistexcolorend_s = "100 200 200";
     vissizestart_s = "6 6";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE GLOWWORMS_SMALL (C_PARTICLEFX)
{
     ppsvalue = 4.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
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
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.029999999;
     lsppartavg = 4000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GLOWWORM_AURA_4.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "70 70";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};
// ******************************************************************************************
// Spiel PFX 
// ******************************************************************************************


INSTANCE FIREGOLEM_FIRE (C_PARTICLEFX)
{
     ppsvalue = 15.000000000;
     ppsscalekeys_s = "2 1 1";
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "25";
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
     flygravity_s = "0 0.0004 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 180 180";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "5 5";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE FIREGOLEM_DEADSMOKE (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "2 2 2 2 1 1 1 1";
     ppsfps = 0.500000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "80";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 2000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "SMK_16BIT_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 50 0";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "30 30";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};


INSTANCE ICEGOLEM_GLITTER (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "2 1 1";
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "25";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.001000000;
     lsppartavg = 500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 255 255";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "25 25";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE ICEGOLEM_DEADSMOKE (C_PARTICLEFX)
{
     ppsvalue = 70.000000000;
     ppsscalekeys_s = "2 2 2 2 1 1 1 1";
     ppsfps = 0.500000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -100 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
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
     vissizestart_s = "25 25";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE LAVAOUTBURST (C_PARTICLEFX)
{
     ppsvalue = 15.000000000;
     ppsscalekeys_s = "1 1 1 1 20 1 1 1 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1 1 1 1 20 1 1 1 1 1 1 5 1 10 1 2 3 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.300000012;
     velvar = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 100";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE SNOW (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 500 0";
     shpisvolume = 1;
     shpdim_s = "300";
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = -89.000000000;
     velavg = 0.050000001;
     velvar = 0.020000000;
     lsppartavg = 5000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE CPFX_IAI_METAL (C_PARTICLEFX)
{
     ppsvalue = 25.;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 3.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.;
     dirangleheadvar = 10.;
     dirangleelev = 180.;
     dirangleelevvar = 10.;
     velavg = 0.200000003;
     velvar = 5.00000007e-002;
     lsppartavg = 2000.;
     lsppartvar = 300.;
     flygravity_s = "0 -0.0003 0";
     flycolldet_b = 1;
     visname_s = "FIRETAIL.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 8.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "2 2";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};


//  @@@@@@@@@@@@@@@@@
//  Species-Blood 
//  @@@@@@@@@@@@@@@@@

INSTANCE BFX_PRESET1 (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 8.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.150000006;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0003 0";
     visname_s = "BPFX_SCAVENGER2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "13 13";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trltexture_s = "=";
     mrkfadespeed = 0.100000001;
     mrktexture_s = "BQM_SCAVENGER.TGA";
     mrksize = 50.000000000;
};

INSTANCE BFX_PRESET2 (C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 8.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.150000006;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0003 0";
     visname_s = "BPFX_SCAVENGER2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 255 50";
     vistexcolorend_s = "0 255 0";
     vissizestart_s = "18 18";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "=";
     mrkfadespeed = 0.100000001;
     mrktexture_s = "BQM_SCAVENGER.TGA";
     mrksize = 50.000000000;
};

INSTANCE BFX_GOLEM (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 20.000000000;
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
     velavg = 0.300000012;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "BPFX_GOLEM_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 180 180";
     vistexcolorend_s = "150 150 150";
     vissizestart_s = "10 10";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
     trltexture_s = "=";
     mrktexture_s = "0";
};

INSTANCE BFX_DEMON (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 8.000000000;
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
     velavg = 0.100000001;
     velvar = 0.050000001;
     lsppartavg = 500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "=";
     mrkfadespeed = 0.100000001;
     mrktexture_s = "BQM_SCAVENGER.TGA";
     mrksize = 50.000000000;
};

INSTANCE BFX_SKELETON (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 20.000000000;
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
     velavg = 0.300000012;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "BPFX_SKELETON_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 200 200";
     vistexcolorend_s = "150 150 150";
     vissizestart_s = "8 8";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
     trltexture_s = "=";
     mrktexture_s = "0";
};

INSTANCE BFX_ZOMBIE (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 8.000000000;
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
     velavg = 0.100000001;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0003 0";
     flycolldet_b = 3;
     visname_s = "BPFX_ZOMBIE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "150 150 150";
     vissizestart_s = "15 15";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
     trltexture_s = "=";
     mrkfadespeed = 0.100000001;
     mrktexture_s = "BQM_SCAVENGER.TGA";
     mrksize = 50.000000000;
};



INSTANCE BFX_PRESET1_DEAD (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1 0 0 0.8 0 0 0.5 0 0 0.3 0 0";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 15.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 15.000000000;
     velavg = 0.150000006;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0003 0";
     visname_s = "BPFX_SCAVENGER.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "7 7";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trltexture_s = "=";
     mrkfadespeed = 0.100000001;
     mrktexture_s = "BQM_SCAVENGER.TGA";
     mrksize = 80.000000000;
};
INSTANCE BFX_PRESET1_DEADCZ (C_PARTICLEFX)
{
     ppsvalue = 490.000000000;
     ppsscalekeys_s = "1 0 0 0.8 0 0 0.5 0 0 0.3 0 0";
     ppsissmooth = 1;
     ppsislooping = 0;
     ppsfps = 40.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     diranglehead = 90.000000000;
     dirangleheadvar = 15.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 15.000000000;
     velavg = 0.210000006;
     velvar = 0.030000001;
     lsppartavg = 1700.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 -0.0003 0";
     visname_s = "BPFX_SCAVENGER.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "8 8";
     vissizeendscale = 3.900000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trltexture_s = "=";
     mrkfadespeed = 0.100000001;
     mrktexture_s = "BQM_SCAVENGER.TGA";
     mrksize = 80.000000000;
};

INSTANCE BFX_PRESET2_DEAD (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1 0 0 0.8 0 0 0.5 0 0 0.3 0 0";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 15.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 15.000000000;
     velavg = 0.150000006;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0005 0";
     visname_s = "BPFX_SCAVENGER.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 255 50";
     vistexcolorend_s = "50 255 50";
     vissizestart_s = "15 15";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "=";
     mrktexture_s = "=";
};

INSTANCE BFX_DEMON_DEAD (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "5 5 5 3 3 3 3";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "100 -100 20";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10";
     shpmesh_s = "Demon_Die.3ds";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 15.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 15.000000000;
     velavg = 0.000100000;
     velvar = 0.010000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.00005 0";
     visname_s = "DEMON_DIE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "=";
};

INSTANCE BFX_ZOMBIE_DEAD	(C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "2 3 2 1";
     ppsissmooth = 1;
     ppsfps = 4.000000000;
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
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "5 5";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE DEMON_ATTACK (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "2 3 2 1";
     ppsissmooth = 1;
     ppsfps = 4.000000000;
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
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "5 5";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE DEMON_ATTACK_LIGHTNING (C_PARTICLEFX)
{
     ppsvalue = 55.000000000;
     ppsscalekeys_s = "2 3 2 1";
     ppsissmooth = 1;
     ppsfps = 5.000000000;
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
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "MFX_THUNDERSPELL_ELECTRO.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "10 10";
     vissizeendscale = 13.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


//  @@@@@@@@@@@@@@@@@
//  Cutscene by KaiRo
//  @@@@@@@@@@@@@@@@@

INSTANCE FIREFLOOR (C_PARTICLEFX)
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




INSTANCE CS_FOKUS1 (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "40";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.000100000;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "100 100";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

INSTANCE CS_FOKUS2 (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
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


INSTANCE CS_FOKUS3 (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
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
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 20.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.300000012;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 100 255";
     vistexcolorend_s = "100 100 255";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trlfadespeed = 0.500000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
     trlwidth = 10.000000000;
};

INSTANCE CS_WATERSPLASH (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1 0.3 2";
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.600000024;
     velvar = 0.200000003;
     lsppartavg = 1300.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0018 0";
     visname_s = "WATER_DRIPPING.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 100 200";
     vissizestart_s = "20 20";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 20.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "WATER_BOOM_03.TGA";
     trlwidth = 5.000000000;
};

INSTANCE BARRIEREWARNING_BOX (C_PARTICLEFX)
{
     ppsvalue = 500.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "140 0 100";
     shpdistribtype_s = "RAND";
     shpdim_s = "120 120 120";
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
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 190 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "60 60";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 150.000000000;
};

INSTANCE BARRIERE (C_PARTICLEFX)
{
     ppsvalue = 2000.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "140 0 100";
     shpdistribtype_s = "RAND";
     shpdim_s = "4000 6000 1";
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
     lsppartavg = 100.000000000;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1000 1000";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 20.000000000;
     visalphaend = 20.000000000;
};


INSTANCE MAGICCOULDRON (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "DIR";
     shpdim_s = "20";
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleelev = 90.000000000;
     velavg = 0.150000006;
     velvar = 0.050000001;
     lsppartavg = 18000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MAGICCOULDRON.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "100 200 255";
     vistexcolorend_s = "255 0 255";
     vissizestart_s = "40 40";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 50.000000000;
};

INSTANCE LIGHTNINGS (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
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
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 150.000000000;
     velavg = 0.300000012;
     lsppartavg = 15000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "WATERSPLASH2.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "20 20";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 50.000000000;
     visalphaend = 50.000000000;
     trlfadespeed = 0.029999999;
     trltexture_s = "ELECTRIC_A0.TGA";
     trlwidth = 150.000000000;
};

INSTANCE CAULDRON_BUBBLES (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 10";
     shpdistribtype_s = "DIR";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleelev = 90.000000000;
     velavg = 0.001000000;
     velvar = 0.001000000;
     lsppartavg = 800.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "BUBBLE.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "BLEND";
     visalphaend = 255.000000000;
};


INSTANCE MINE_BRICKS (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 300 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "400 0 400";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 50.000000000;
     velavg = 0.001000000;
     velvar = 0.010000000;
     lsppartavg = 8000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 -0.001 0";
     flycolldet_b = 1;
     visname_s = "MINE_BRICK.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MINE_DUST (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "400 0 400";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 50.000000000;
     velavg = 0.079999998;
     velvar = 0.010000000;
     lsppartavg = 5000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "STOMPERDUST.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1 1";
     vissizeendscale = 300.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};



//  @@@@@@@@@@@@@@
//  ItemI by KaiRo
//  @@@@@@@@@@@@@@

INSTANCE SOAPFOAM (C_PARTICLEFX)
{
     ppsvalue = 40.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 10";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalefps = 10.;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 20.;
     dirangleheadvar = 10.;
     dirangleelev = 150.;
     dirangleelevvar = 10.;
     velavg = 1.500000013038516e-003;
     lsppartavg = 8000.;
     flygravity_s = "0 0 0";
     visname_s = "SOAPFOAM.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "8 8";
     vissizeendscale = 1.5;
     visalphafunc_s = "BLEND";
     visalphastart = 200.;
};


//  @@@@@@@@@@@@@@
//  MobsI by KaiRo
//  @@@@@@@@@@@@@@

INSTANCE PICKORE (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalefps = 10.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 150.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.200000003;
     velvar = 0.070000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "OREBRICKS.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "200 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 0.300000012;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};

//  @@@@@@@@@@@@@@
//  MobsI by KaiRo
//  Mod by Orc
//  @@@@@@@@@@@@@@
INSTANCE PICKSTONE (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalefps = 10.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 150.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.200000003;
     velvar = 0.070000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "OREBRICKS.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "200 150 50";
     vistexcolorend_s = "250 175 65";
     vissizestart_s = "7 7";
     vissizeendscale = 0.300000012;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};
INSTANCE PICKCARBONIRONSILVER (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalefps = 10.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 150.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.200000003;
     velvar = 0.070000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "OREBRICKS.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "10 10 5";
     vistexcolorend_s = "25 25 15";
     vissizestart_s = "5 5";
     vissizeendscale = 0.300000012;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};
INSTANCE PICKGOLD (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalefps = 10.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 150.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.200000003;
     velvar = 0.070000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "OREBRICKS.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "150 50 10";
     vistexcolorstart_s = "190 70 15";
     vissizestart_s = "5 5";
     vissizeendscale = 0.300000012;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};
INSTANCE COALGLOW (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 10";
     shpisvolume = 1;
     shpdim_s = "25";
     shpscalefps = 10.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 150.000000000;
     dirangleelevvar = 10.000000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "COALGLOW.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "12 12";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};

INSTANCE THROWDRUGS (C_PARTICLEFX)
{
     ppsvalue = 600.;
     ppsscalekeys_s = "1";
     shptype_s = "POINT";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 20.;
     dirangleheadvar = 10.;
     dirangleelev = 150.;
     dirangleelevvar = 10.;
     velavg = 5.99999987e-002;
     velvar = 1.99999996e-002;
     lsppartavg = 5000.;
     flygravity_s = "0 -0.00007 0";
     visname_s = "DRUGPARTICLE.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 150.;
};


INSTANCE PSILAB_DROPS (C_PARTICLEFX)
{
     ppsvalue = 10.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 90.;
     dirangleelev = -90.;
     dirangleelevvar = 3.;
     velavg = 5.00000007e-002;
     velvar = 1.99999996e-002;
     lsppartavg = 750.;
     flygravity_s = "0 0 0";
     visname_s = "LABDROPS.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "200 140 110";
     vistexcolorend_s = "170 120 110";
     vissizestart_s = "4 4";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 70.;
     visalphaend = 70.;
};
     

INSTANCE PSILAB_GLOW (C_PARTICLEFX)
{
     ppsvalue = 10.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "150";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999978e-003;
     lsppartavg = 3000.;
     flygravity_s = "0 0 0";
     visname_s = "LABGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 150 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "1 1";
     vissizeendscale = 50.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
     visalphaend = 0.;
};


INSTANCE PSILAB_SMOKE (C_PARTICLEFX)
{
     ppsvalue = 5.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 3.99999991e-002;
     lsppartavg = 4000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "LABSMOKE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 70.;
};

//  @@@@@@@@@@@@@@
//  Magic by KaiRo
//  @@@@@@@@@@@@@@

INSTANCE ORE_HIGHLIGHT (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     //ppscreateem_s = "ORE_GLOW";
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 10";
     shpisvolume = 1;
     shpdim_s = "10";
     shpmesh_s = "NC_OREHEAP_PFX.3DS";
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 150.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.000010000;
     velvar = 0.000010000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "OREHIGHLIGHT.TGA";
     visorientation_s = "WORLD";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "15 15";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 100.000000000;
};

INSTANCE ORE_GLOW (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 10";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "10";
     shpmesh_s = "NC_OREHEAP_PFX.3DS";
     shpscalefps = 10.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 150.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.001500000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "OREGLOW.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "0 200 255";
     vistexcolorend_s = "0 200 255";
     vissizestart_s = "5 5";
     vissizeendscale = 50.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE FLAMETHROWER (C_PARTICLEFX)
{
     ppsvalue = 120.000000000;
     ppsscalekeys_s = "1 2 3";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 180.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.300000012;
     velvar = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.0005 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 8.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 150 150";
     vissizestart_s = "1 1";
     vissizeendscale = 100.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE DEMON_FLAMETHROWER (C_PARTICLEFX)
{
     ppsvalue = 120.000000000;
     ppsscalekeys_s = "1 2 2 1";
     ppsfps = 2.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 180.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.300000012;
     velvar = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.0005 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 8.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 150 150";
     vissizestart_s = "1 1";
     vissizeendscale = 100.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
INSTANCE DEMON_FLAMETHROWER_LIGHTNING (C_PARTICLEFX)
{
     ppsvalue = 120.000000000;
     ppsscalekeys_s = "1 2 2 1";
     ppsfps = 2.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 180.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.300000012;
     velvar = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.0005 0";
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;     
     vistexanifps = 8.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "13 13 225";
     vissizestart_s = "1 1";
     vissizeendscale = 100.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
INSTANCE CRW_GREENSMOKE (C_PARTICLEFX)
{
     ppsvalue = 1.;
     ppsscalekeys_s = "0.1 0.2 0.3 0.4 1 0.1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = -90.;
     dirangleheadvar = 10.;
     dirangleelev = 180.;
     dirangleelevvar = 10.;
     velavg = 5.00000007e-002;
     velvar = 1.99999996e-002;
     lsppartavg = 5000.;
     lsppartvar = 200.;
     flygravity_s = "0 0.00001 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 8.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 150 0";
     vissizestart_s = "3 3";
     vissizeendscale = 10.;
     visalphafunc_s = "BLEND";
     visalphastart = 100.;
};

INSTANCE CRW_GLIBBER (C_PARTICLEFX)
{
     ppsvalue = 60.;
     ppsscalekeys_s = "1 2 3";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.;
     dirangleheadvar = 10.;
     dirangleelev = 180.;
     dirangleelevvar = 10.;
     velavg = 0.300000012;
     velvar = 0.100000001;
     lsppartavg = 500.;
     lsppartvar = 200.;
     flygravity_s = "0 0.0005 0";
     visname_s = "FIRE2_A0.TGA";
     visorientation_s = "NONE";
     vistexanifps = 8.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 180 255";
     vistexcolorend_s = "50 50 50";
     vissizestart_s = "1 1";
     vissizeendscale = 100.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
     visalphaend = 30.;
};


//Magische Aura
INSTANCE RESURRECTION (C_PARTICLEFX)
{
     ppsvalue = 300.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "100";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 750.;
     flygravity_s = "0 0 0";
     visname_s = "BLUEGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 4.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 1.00000005e-003;
     visalphafunc_s = "ADD";
     visalphaend = 100.;
};

INSTANCE TELEKINESE (C_PARTICLEFX)
{
     ppsvalue = 80.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "MESH";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "100";
     shpmesh_s = "Healbody.3DS";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 1500.;
     lsppartvar = 500.;
     flygravity_s = "0 0 0";
     visname_s = "TELSTURM.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 128 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};

/*INSTANCE MAGICGLOW (C_PARTICLEFX)
{
     ppsvalue = 80.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "MESH";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "100";
     shpmesh_s = "MIN_MOB_STONE_V2_20";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 3000.;
     lsppartvar = 500.;
     flygravity_s = "0 0 0";
     visname_s = "BLUEGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "100 100";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphaend = 50.;
};
*/
INSTANCE ORGANICFOG (C_PARTICLEFX)
{
     ppsvalue = 50.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "300";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 0.100000001;
     velvar = 2.99999993e-002;
     lsppartavg = 2700.;
     flygravity_s = "0 0 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 150 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "100 100";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};


INSTANCE ELECTRIC (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 1.000000000;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "150";
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
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "ELECTRIC_A0.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 150 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "50 50";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
     visalphaend = 50.000000000;
};

INSTANCE TeleSturm (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 1500.;
     lsppartvar = 500.;
     flygravity_s = "0 0 0";
     visname_s = "TelSturm.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 0;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 50 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};

  

//  @@@@@@@@@@@@@@@@@@@@
//  Environment by KaiRo
//  @@@@@@@@@@@@@@@@@@@@


INSTANCE STOMPERDUST (C_PARTICLEFX)
{
     ppsvalue = 90.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "120";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 50.;
     velavg = 7.99999982e-002;
     velvar = 9.99999978e-003;
     lsppartavg = 1000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "STOMPERDUST.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 3.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};

INSTANCE GOLEMDUST (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 3.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "40";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 50.000000000;
     velavg = 0.079999998;
     velvar = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "STOMPERDUST.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 200.000000000;
};

INSTANCE SWAMPSHARKSLIME (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 3.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -20 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "25";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 50.000000000;
     lsppartavg = 8000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 220";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 0.500000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};

INSTANCE FIRE (C_PARTICLEFX)
{
    ppsvalue = 40.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000;
     shpdim_s = "20";
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
     vissizestart_s = "40 40";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
INSTANCE FIRE_GLOW (C_PARTICLEFX)
{
     ppsvalue = 0.000000000;
     ppsscalekeys_s = "1 1 1 1 1 1 1 1 1 1";
     ppsissmooth = 1;
     ppsfps = 3.000000000;   
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.000300000;
     shpdim_s = "50";
     shpscalekeys_s = "0.5 1 0.8";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "WORLD";
     lsppartavg = 3000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "SIMPLEGLOW.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 152 3";
     vistexcolorend_s = "255 105 3";
     vissizestart_s = "17 17";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 125.000000000;
};

INSTANCE FIRE_MEDIUM (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "=";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "7";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.100000001;
     lsppartavg = 350.000000000;
     flygravity_s = "0 0.0003 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE FIRE_HOT (C_PARTICLEFX)
{
     ppsvalue = 90.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpisvolume = 1;
     shpdim_s = "40";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.200000003;
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "60 60";
     vissizeendscale = 0.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE FIRE_SWAMP (C_PARTICLEFX)
{
     ppsvalue = 18.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
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
     visname_s = "FIRE_COMPLETE_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 255 100";
     vistexcolorend_s = "100 200 0";
     vissizestart_s = "40 40";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE Fire_Sparks (C_PARTICLEFX)
{
     ppsvalue = 0.;
     ppsscalekeys_s = "0.2 0.2 0.5 0.2 0.2 0.3 0.5 0.3 0.7";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 80.;
     velavg = 0.100000001;
     velvar = 0.200000003;
     lsppartavg = 300.;
     lsppartvar = 3000.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "FIRETAIL.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "2 2";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};

INSTANCE ANVIL_SPARKS (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 20.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 180.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.200000003;
     velvar = 0.050000001;
     lsppartavg = 2000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0003 0";
     flycolldet_b = 1;
     visname_s = "FIRETAIL.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 8.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "2 4";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE SHARPSTONE_SPARKS (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1 2 3";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.;
     dirangleheadvar = 10.;
     dirangleelev = 180.;
     dirangleelevvar = 10.;
     velavg = 0.200000003;
     velvar = 5.00000007e-002;
     lsppartavg = 2000.;
     lsppartvar = 300.;
     flygravity_s = "0 -0.0003 0";
     flycolldet_b = 1;
     visname_s = "FIRETAIL.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 8.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "1 5";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};


// FIRE_SMOKE ist momentan noch identisch mit LIGHTSMOKE
// Feuerrauch: visname_s = "SMK_FIRE.TGA"
INSTANCE FIRE_SMOKE (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
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

INSTANCE TORCH (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "=";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "7";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.100000001;
     lsppartavg = 350.000000000;
     flygravity_s = "0 0.0003 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE TORCH_SMOKE (C_PARTICLEFX)
{
     ppsvalue = 8.;
     ppsscalekeys_s = "0.2 1 0.4 2 0.6 2.4 1.2 3 0.5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 4.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 3.99999991e-002;
     lsppartavg = 3000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "SMK_FIRE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 5.;
     visalphafunc_s = "BLEND";
     visalphastart = 80.;
};
INSTANCE BOLT (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "=";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.100000001;
     lsppartavg = 350.000000000;
     flygravity_s = "0 0.0003 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "2 2";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE BOLT_SMOKE (C_PARTICLEFX)
{
     ppsvalue = 8.;
     ppsscalekeys_s = "0.2 1 0.4 2 0.6 2.4 1.2 3 0.5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 4.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "4";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 3.99999991e-002;
     lsppartavg = 3000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "SMK_FIRE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 5.;
     visalphafunc_s = "BLEND";
     visalphastart = 80.;
};
// GREENSMOKE ist momentan noch identisch mit LIGHTSMOKE
// Grüner Rauch: visname_s = "GREENSMOKE.TGA"
INSTANCE GreenSmoke (C_PARTICLEFX)
{
     ppsvalue = 1.;
     ppsscalekeys_s = "0.1 0.2 0.1 0 0.3 0.2";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 1.99999996e-002;
     lsppartavg = 8000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 40.;
     visalphafunc_s = "BLEND";
     visalphastart = 150.;
};
INSTANCE AMBIENTFOG (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "2000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.020000000;
     lsppartavg = 8000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "SMK_16BIT_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "400 400";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 200.000000000;
};
////////////////////
//New: Swamp_Fog
///////////////////
INSTANCE Swamp_Fog (C_PARTICLEFX)
{
     ppsvalue = 15.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RANDOM";
     shpisvolume = 1;
     shpdim_s = "8000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 170.000000000;
     dirangleelev = 120.000000000;
     dirangleelevvar = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 6000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "SMK_16BIT_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 200 150";
     vistexcolorend_s 	= "150 200 150";
     vissizestart_s = "800 800";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 160.000000000;
};

INSTANCE LAVAFOG_NS (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100 10 300";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "60 60";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 50.000000000;
};

INSTANCE LAVAFOG_OW (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "300 10 100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "60 60";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 50.000000000;
};

INSTANCE LAVAFOG_BIG (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100 10 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "60 60";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 50.000000000;
};

INSTANCE GROUNDFOG (C_PARTICLEFX)
{
     ppsvalue = 5.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "500";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.020000000;
     velvar = 0.008000000;
     lsppartavg = 15000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 -0.000005 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};



INSTANCE CS_MILTENFOG (C_PARTICLEFX)		// disabled by value
{
     ppsvalue = 2.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1000 1000 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.020000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MAGICFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "0 100 200";
     vissizestart_s = "2 2";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 0.000000000;
};

/*   OLD

INSTANCE CS_MILTENFOG (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1000 1000 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.020000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MAGICFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "0 100 200";
     vissizestart_s = "40 40";
     vissizeendscale = 25.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};  */

INSTANCE WATERVAPOUR (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 3.99999991e-002;
     velvar = 9.99999978e-003;
     lsppartavg = 2000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "SMK_16BIT_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 2.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};

INSTANCE LightSmoke(C_PARTICLEFX)
{
     ppsvalue = 5.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 0.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 3.99999991e-002;
     lsppartavg = 8000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "groundfog.tga";
     visorientation_s = "NONE";
     vistexisquadpoly = 0;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 30.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};
INSTANCE BROOM(C_PARTICLEFX)
{
    ppsvalue = 40.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 0;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "-120 -30 1";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 3.00000;
     shpdim_s = "10 5 51";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "10 -50 -500";
     dirangleelev = 90.000000000;
     velavg = 0.06000000;
     lsppartavg = 2000.000000000;
     lsppartvar = 1000.000000000;
     flygravity_s = "0 0.000032 0";
     visname_s = "groundfog.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.500000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "80 65 80";
     vistexcolorend_s = "185 166 185";
     vissizestart_s = "30 30";
     vissizeendscale = 6.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 135.000000000;	
     visalphaend = 10.000000000;	
//      ppsvalue = 10;
//      ppsscalekeys_s = "0.1 0.6 1 1 1 0.7 0.5 0.3 0";
//      ppsislooping = 0;
//      ppsissmooth = 1;
//      ppsfps = 3;
//      shptype_s = "BOX";
//      shpfor_s = "object";
//      shpoffsetvec_s = "0 -10 0";
//      shpdistribtype_s = "WALK";
//      shpisvolume = 1;
//      shpdim_s = "50 10 5";
//      shpscalekeys_s = "1";
//      shpscaleislooping = 1;
//      shpscaleissmooth = 1;
//      shpscalefps = 2.;
//      dirmode_s = "DIR";
//      dirfor_s = "object";
//      dirangleheadvar = 50.;
//      dirangleelev = 90.;
//      dirangleelevvar = 20.;
//      velavg = 0.0008;
//      lsppartavg = 3000.;
//      lsppartvar = 400.;
//      flygravity_s = "0.00003 0 0";
//      visname_s = "groundfog.tga";
//      visorientation_s = "ADD";
//      vistexisquadpoly = 0;
//      vistexanifps = 5.;
//      vistexaniislooping = 1;
//      vistexcolorstart_s = "100 90 100";
//      vistexcolorend_s = "205 185 205";
//      vissizestart_s = "15 15";
//      vissizeendscale = 40.;
//      visalphafunc_s = "BLEND";
//      visalphastart = 215.;
//      visalphaend = 1;
};

// MAGICPOTIONSMOKE ist momentan noch identisch mit LIGHTSMOKE
// Grüner Rauch: visname_s = "GREENSMOKE.TGA"
INSTANCE MAGICPOTIONSMOKE (C_PARTICLEFX)
{
     ppsvalue = 5.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 3.99999991e-002;
     lsppartavg = 5500.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "SMK_16BIT_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 30.;
     visalphafunc_s = "BLEND";
     visalphastart = 150.;
};




INSTANCE Waterfall1 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "0.2 1 0.4 2 0.6 2.4 1.2 3 0.5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 25.;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "10 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "800";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 200.;
     dirangleheadvar = 45.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 0.239999995;
     velvar = 5.00000007e-002;
     lsppartavg = 3000.;
     lsppartvar = 1500.;
     flygravity_s = "0 -0.00015 0";
     visname_s = "WATERSPLASH2.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "15 15";
     vissizeendscale = 2.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};

INSTANCE WaterfallComplete (C_PARTICLEFX)
{
     ppsvalue = 10.;
     ppsscalekeys_s = "1";
     shptype_s = "LINE";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "300";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleelev = -90.;
     lsppartavg = 3000.;
     flygravity_s = "0 -0.0002 0";
     visname_s = "WATERFALL_A0.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "80 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "160 160";
     vissizeendscale = 5.;
     visalphafunc_s = "BLEND";
     visalphaend = 255.;
};


INSTANCE WATERFALL2 (C_PARTICLEFX)
{
     ppsvalue = 40.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 25.;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "10 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "800 0 0";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 60.;
     dirangleelev = -90.;
     dirangleelevvar = 90.;
     velavg = 7.99999982e-002;
     velvar = 1.99999996e-002;
     lsppartavg = 5200.;
     lsppartvar = 400.;
     flygravity_s = "0 0.00007 0";
     visname_s = "WATERSPLASH3.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "80 80";
     vissizeendscale = 4.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};
     
INSTANCE WATERSPLASH (C_PARTICLEFX)
{
     ppsvalue = 100.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 20.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 0.200000003;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 200.;
     flygravity_s = "0 -0.0005 0";
     visname_s = "WATERSPLASH2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 8.;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};


INSTANCE HUMAN_WASHSELF1 (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 20.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.001000000;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 30.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 30.000000000;
     velavg = 0.200000003;
     velvar = 0.050000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 -0.0005 0";
     visname_s = "WASHSELF2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 200 255";
     vissizestart_s = "2 2";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "BLENND";
     visalphastart = 255.000000000;
     trlfadespeed = 1.500000000;
     trltexture_s = "JUSTWHITE.TGA";
     trlwidth = 0.500000000;
};


INSTANCE HUMAN_WASHSELF2 (C_PARTICLEFX)
{
     ppsvalue = 2000.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 40.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.001000000;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 60.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 60.000000000;
     velavg = 0.200000003;
     velvar = 0.050000001;
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 -0.0005 0";
     visname_s = "WASHSELF2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 200 255";
     vissizestart_s = "3 3 ";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trlfadespeed = 1.500000000;
     trltexture_s = "JUSTWHITE.TGA";
     trlwidth = 0.400000006;
};




INSTANCE BloodWater (C_PARTICLEFX)
{
     ppsvalue = 15.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "0";
     shpscalekeys_s = "0";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 40.;
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 9.99999978e-003;
     lsppartavg = 5000.;
     lsppartvar = 100.;
     flygravity_s = "0 0 0";
     visname_s = "BLOODKAI.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "160";
     vistexcolorend_s = "100 25 0";
     vissizestart_s = "0.5 0.5";
     vissizeendscale = 20.;
     visalphafunc_s = "BLEND";
     visalphastart = 200.;
};

INSTANCE CPFX_STONE (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "0";
     shpscalekeys_s = "0";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirangleheadvar = 40.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 30.000000000;
     velavg = 0.100000001;
     velvar = 0.050000001;
     lsppartavg = 1200.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 -0.0005 0";
     flycolldet_b = 3;
     visname_s = "CPFX_STONE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "7 7";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 200.000000000;
     visalphaend = 100.000000000;
};

INSTANCE CPFX_Wood	(C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "0";
     shpscalekeys_s = "0";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirangleheadvar = 40.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 30.000000000;
     velavg = 0.100000001;
     velvar = 0.050000001;
     lsppartavg = 1200.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 -0.0005 0";
     flycolldet_b = 3;
     visname_s = "CPFX_Wood.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "7 7";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 200.000000000;
     visalphaend = 100.000000000;
};

INSTANCE WASTEOUTLET (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 0.001000000;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     diranglehead = 10.000000000;
     dirangleheadvar = 0.000000000;
     dirangleelev = -40.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.050000001;
     velvar = 0.029999999;
     lsppartavg = 4400.000000000;
     flygravity_s = "0 -0.0001 0";
     visname_s = "WATER_DRIPPING.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "3 3";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 20.000000000;
     visalphaend = 50.000000000;
};

INSTANCE WATEROUTLET (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 0.001000000;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     diranglehead = 10.000000000;
     dirangleheadvar = 0.000000000;
     dirangleelev = -40.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.050000001;
     velvar = 0.029999999;
     lsppartavg = 4400.000000000;
     flygravity_s = "0 -0.0001 0";
     visname_s = "WATER_DRIPPING.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "3 3";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 20.000000000;
     visalphaend = 50.000000000;
};


INSTANCE WASTEOUTLET_BOTTOM (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RANDOM";
     shpisvolume = 1;
     shpdim_s = "70";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     diranglehead = 10.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.010000000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "WATER_DRIPPING_GROUND.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 255 100";
     vistexcolorend_s = "150 200 255";
     vissizestart_s = "1 1";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};

INSTANCE WAVERINGS  (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 0.1 0.3 0.8 0.2 1 0.1";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shpoffsetvec_s = "0 0 0";
     dirmode_s = "RAND";
     lsppartavg = 2500.000000000;
     lsppartvar = 500.000000000;
     flycolldet_b = 1;
     visname_s = "WASSERRINGE_A0.TGA";
     visorientation_s = "VOB";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 200 255";
     vistexcolorend_s = "200 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 5.072220325;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
};

INSTANCE Bubbles (C_PARTICLEFX)
{
     ppsvalue = 1.;
     ppsscalekeys_s = "1 2 0.5 0.8 1 1.3";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 60.;
     dirangleelev = 90.;
     dirangleelevvar = 40.;
     velavg = 9.99999978e-003;
     lsppartavg = 4200.;
     lsppartvar = 100.;
     flygravity_s = "0 0.00001 0";
     visname_s = "BUBBLE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "3 3";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 200.;
     visalphaend = 0.;
};


INSTANCE FLIES (C_PARTICLEFX)
{
     ppsvalue = 30.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "200";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 80.;
     velavg = 0.100000001;
     lsppartavg = 3000.;
     lsppartvar = 100.;
     flygravity_s = "0 0 0";
     visname_s = "BLOODKAI.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "1 1";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};

INSTANCE BIRDFLY (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 0.001000000;
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 10.000000000;
     dirangleelev = 10.000000000;
     dirangleelevvar = 2.000000000;
     velavg = 0.500000000;
     velvar = 0.029999999;
     lsppartavg = 100000.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0.0001 0 0";
     visname_s = "BIRDFLY_A0.TGA";
     visorientation_s = "NONE";
     vistexanifps = 12.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE WOODRAYS_NIGHT (C_PARTICLEFX)
{
    ppsvalue = 4.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 400 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "4000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 70.000000000;
     dirangleelevvar = 0.000000000;
     lsppartavg = 12000.000000000;
     lsppartvar = 1000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "CZ_WOODRAYS.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "130 155 205";
     vissizestart_s = "100 590";
     vissizeendscale = 1.0100000000;
     visalphafunc_s = "ADD";
     visalphastart = 205.000000000;
     visalphaend = 0.000000000;
};

INSTANCE WOODRAYS (C_PARTICLEFX)
{
    ppsvalue = 4.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 400 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "4000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 70.000000000;
     dirangleelevvar = 0.000000000;
     lsppartavg = 12000.000000000;
     lsppartvar = 1000.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "CZ_WOODRAYS.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 1.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "100 590";
     vissizeendscale = 1.0100000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 0.000000000;
};
INSTANCE DUST (C_PARTICLEFX)
{
     ppsvalue = 38.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "4000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "none";
     VelAvg		=	0.00018;
	 VelVar		=	0.00012;
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     lsppartavg = 5000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 -0.0000013 0";
     flycolldet_b = 0;
     visname_s = "DUST_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexanifps = 0.000000000;     
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 205.000000000;
     visalphaend = 165.000000000;
};
INSTANCE LEAVES (C_PARTICLEFX)
{
     ppsvalue = 9.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "5000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     lsppartavg = 10000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "-0.00004 -0.00009 0";
     flycolldet_b = 0;
     visname_s = "LEAF_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 13.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "250 100 150";
     vistexcolorend_s = "250 100 150";
     vissizestart_s = "50 50";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE GREENWASTE (C_PARTICLEFX)
{
     ppsvalue = 200.;
     ppsscalekeys_s = "1";
     shptype_s = "LINE";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 90.;
     dirangleelev = -90.;
     dirangleelevvar = 10.;
     velavg = 1.99999996e-002;
     velvar = 5.00000007e-002;
     lsppartavg = 6500.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "GREENWASTE.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "200 140 110";
     vistexcolorend_s = "170 120 110";
     vissizestart_s = "8 8";
     vissizeendscale = 4.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

//INSTANCE MENU_REDPLASMA (C_PARTICLEFX)
INSTANCE FIRE_MENU (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 1500.;
     lsppartvar = 500.;
     flygravity_s = "0 0 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 50 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};

/*  INSTANCE FIRE_MAGIC (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "MESH";
     shpfor_s = "MESH";
	 shpmesh_s = "special_sword.3ds";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 1500.;
     lsppartvar = 500.;
     flygravity_s = "0 0 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 50 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};  */


//  @@@@@@@@@@@@@@@@@@
//  Created by Carsten
//  @@@@@@@@@@@@@@@@@@
  
  
  
  
  
INSTANCE SPIT (C_PARTICLEFX)
{
     ppsvalue = 1.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 20";
     shpdim_s = "0 0 0";
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleelevvar = 1.5;
     velavg = 0.200000003;
     velvar = 4.99999989e-003;
     lsppartavg = 5000.;
     lsppartvar = 400.;
     flygravity_s = "0 -0.001 0";
     visname_s = "WATERSPLASH3.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 100.;
};

INSTANCE PEE (C_PARTICLEFX)
{
     ppsvalue = 100.;
     ppsscalekeys_s = "1 0 1 0 2 0.4 12 16 0.3 0 1";
     shptype_s = "POINT";
     shpfor_s = "object";
     shpisvolume = 1; 
     shpdim_s = "300";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 270.;
     dirangleheadvar = 5.;
     dirangleelev = 20.;
     dirangleelevvar = 5.;
     velavg = 0.200000003;
     velvar = 4.99999989e-003;
     lsppartavg = 700.;
     flygravity_s = "0 -0.002 0";
     visname_s = "PARTYEL1.TGA";
     visorientation_s = "VELO";     
     vistexcolorstart_s = "255 255 255";     
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "3 15";     
     vissizeendscale = 2.;     
     visalphafunc_s = "BLEND";     
     visalphastart = 30.;
};

INSTANCE FOUNTAIN (C_PARTICLEFX)
{
     ppsvalue = 50.;
     ppsscalekeys_s = "1 1.2 0.6 0.3 1.2";
     ppsIsLooping = 1;
     ppsIsSmooth = 1;
     ppsFps = 5;
     shptype_s = "sphere";
     shpfor_s = "world";
     shpisvolume = 1; 
     shpdim_s = "15";
     shpscalefps = 4.;
     dirmode_s = "DIR";
     dirfor_s = "world";
     diranglehead = 270.;
     dirangleheadvar = 5.;
     dirangleelev = 20.;
     dirangleelevvar = 5.;
     velavg = 0.100000003;
     velvar = 4.99999989e-003;
     lsppartavg = 1000.;
     lsppartvar = 200;
     flygravity_s = "0 -0.0004 0";
     visname_s = "zDebris0_a0.TGA";
     visorientation_s = "VELO";     
     vistexcolorstart_s = "100 100 200";     
     vistexisquadpoly = 1;
     vistexanifps = 10;
     vistexaniislooping = 1;
     flycolldet_b = 1;
     vistexcolorend_s = "155 155 200";
     vissizestart_s = "10 30";     
     vissizeendscale = 2.;     
     visalphafunc_s = "BLEND";     
     visalphastart = 120.;
     visAlphaEnd = 80;
};


/*INSTANCE PFX_WATERSPLASH (C_PARTICLEFX)
{
      ppsvalue = 20.;
     shptype_s = "CIRCLE";
     shpfor_s = "world";
     shpoffsetvec_s = "1000 1000 1000";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.;
     shpdim_s = "0";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 100.;
     visname_s = "CFLAREBLUE.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "10 10";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};

*/

INSTANCE ACID (C_PARTICLEFX)
{
     ppsvalue = 1.;
     ppsscalekeys_s = "1 2 3";
     ppsislooping = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "300";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 270.;
     dirangleheadvar = 5.;
     dirangleelev = 20.;
     dirangleelevvar = 5.;
     velavg = 0.200000003;
     velvar = 4.99999989e-003;
     lsppartavg = 700.;
     flygravity_s = "0 0 0";
     visname_s = "WATERSPLASH3.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "200 180 0";
     vistexcolorend_s = "190 190 0";
     vissizestart_s = "5 15";
     vissizeendscale = 10.;
     visalphafunc_s = "BLEND";
     visalphastart = 100.;
};
// Blutspritzer bei Treffer
// Wahrscheinlich sollte dieser Effekt pro Spezies unterschiedlich sein (z.B. grünes Blut für Crawler)
// Später sollte sich die Stärke des Effekts auch der Schadenshöhe anpassen

INSTANCE PFX_BLOOD (C_PARTICLEFX)
{
     ppsvalue = 70.;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "1 1";
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.;
     dirangleheadvar = 20.;
     dirangleelev = -45.;
     dirangleelevvar = 10.;
     velavg = 0.100000001;
     velvar = 0.5;
     lsppartavg = 1300.;
     lsppartvar = 600.;
     flygravity_s = "0 -0.0005 0";
     visname_s = "BLOOD1.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "200 200 200";
     vistexcolorend_s = "255 255 255 ";
     vissizestart_s = "4 8";
     vissizeendscale = 0.5;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 180.;
};


INSTANCE PFX_DUST (C_PARTICLEFX)
{
     ppsvalue = 64.000000000;
     shptype_s = "BOX";
     shpdistribtype_s = "=";
     shpdim_s = "10 5 10";
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 50.000000000;
     velavg = 0.079999998;
     velvar = 0.010000000;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0 0";
     visname_s = "STOMPERDUST.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 7.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 100.000000000;
};


INSTANCE PFX_Metalsparks (C_PARTICLEFX)
{
     ppsvalue = 40.;
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 500.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "ZSPARK1.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "6 10";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};


INSTANCE PFX_MOBDESTROY (C_PARTICLEFX)
{
     ppsvalue = 75.;
     shptype_s = "POINT";
     shpmesh_s = "";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 80.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0004 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};


///////////////////////////////
// destruction PFX
///////////////////////////////

/*
// Wood
INSTANCE DS_WO (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

// Stone
INSTANCE DS_ST (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

// Metal
INSTANCE DS_ME (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

// Leather BEISPIEL ????????
INSTANCE DS_LE (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

// Clay BEISPIEL ??????????
INSTANCE DS_CL (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

// Glass BEISPIEL ??????????
INSTANCE DS_GL (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};


///////////////////////////////
// Slide PFX
///////////////////////////////

// Undefined
INSTANCE SS_UD (C_PARTICLEFX)
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


///////////////////////////////
// Collision PFX
///////////////////////////////

//	Model Attacks Model (Angriff ohne Waffen)


INSTANCE GESCHOSS (C_PARTICLEFX)
{
     ppsvalue = 1.;
     shptype_s = "POINT";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "800";
     dirmode_s = "TARGET";
     dirfor_s = "world";
     dirmodetargetfor_s = "world";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 180.;
     dirangleelev = 90.;
     velavg = 1.;
     velvar = 5.00000007e-002;
     lsppartavg = 5000.;
     lsppartvar = 350.;
     flygravity_s = "0 0.00002 0";
     visname_s = "ZSPARKJ1.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "80 80";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};
INSTANCE Effect01 (C_PARTICLEFX) //Kugel mit Sternen
{
     ppsvalue = 1.;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpdistribtype_s = "RAN";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "300";
     dirangleelev = 100.;
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 2000.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "CFLARESTARJ1_A1.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "18 30";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 255.;
};	
INSTANCE Effect02 (C_PARTICLEFX) // KugelZauber
{
      ppsvalue = 1.;
     shptype_s = "POINT";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "800";
     dirmode_s = "TARGET";
     dirfor_s = "world";
     dirmodetargetfor_s = "world";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 180.;
     dirangleelev = 90.;
     velavg = 1.;
     velvar = 5.00000007e-002;
     lsppartavg = 5000.;
     lsppartvar = 350.;
     flygravity_s = "0 0.00002 0";
     visname_s = "ZSPARKJ1.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "80 80";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};
INSTANCE Effect03 (C_PARTICLEFX)
{
     ppsvalue = 100.;
     ppsislooping = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 100;
     shpdim_s = "300";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 1000.;
     visname_s = "CFLAREBLUE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "8 8";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 255.;
};
INSTANCE EinleitungTeleport (C_PARTICLEFX)
{
     ppsvalue = 30.;
     ppsislooping = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "world";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 3.00000014e-004;
     shpdim_s = "100";
     dirmode_s = "DIR";
     dirfor_s = "world";
     lsppartavg = 100.;
     visname_s = "CFLAREBLUE.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
     visalphaend = 100.;
};
INSTANCE Teleporter/teleport (C_PARTICLEFX)
{
     ppsvalue = 1.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "0";
     dirmode_s = "DIR";
     dirfor_s = "0";
     dirmodetargetfor_s = "object";
     dirmodetargetpos_s = "0 0 0";
     velvar = 5.00000007e-002;
     lsppartavg = 5000.;
     lsppartvar = 350.;
     flygravity_s = "0 0 0";
     visname_s = "CFLAREBLUE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "300 300";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 255.;
};
INSTANCE PORTAL (C_PARTICLEFX)
{
     ppsvalue = 5.;
     shptype_s = "POINT";
     shpfor_s = "object";
     dirmode_s = "DIR";
     lsppartavg = 20000.;
     visname_s = "CURSOR.TGA";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "100 100";
     vissizeendscale = 20.;
     visalphafunc_s = "ADD";
     visalphaend = 100.;
};
INSTANCE WindfistProgress (C_PARTICLEFX)
{
     ppsvalue = 500.;
     ppsislooping = 1;
     shptype_s = "LINE";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "200";
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 500.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "TWISTERJ.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "100 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "12 20";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 100.;
};*/


INSTANCE MENU_CURSOR (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 5.;
     ppsIsSmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "30 30 30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 360.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     lsppartavg = 300.;
     lsppartvar = 400.;
     flygravity_s = "0 0.00002 0";
     visname_s = "FLAM_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 100 100";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.5;
     visalphafunc_s = "ADD";
     visalphastart = 90.;
     visalphaend = 10.;
     
     
};
INSTANCE MENU_SELECT_ITEM(C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 0;
     ppsfps = 1;
     ppsIsSmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "30 30 30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 360.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     lsppartavg = 200.;
     lsppartvar = 200.;
     flygravity_s = "0 0.000002 0";
     visname_s = "electricblue0000.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 100 100";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "40 20";
     vissizeendscale = 0.5;
     visalphafunc_s = "ADD";
     visalphastart = 120.;
     visalphaend = 20.;
     
};


INSTANCE FIRE_MENU_OLD(C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 360.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 0.100000001;
     lsppartavg = 400.;
     lsppartvar = 600.;
     flygravity_s = "0 0.00002 0";
     visname_s = "FLAM_A0.TGA";
 //    visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 100 100";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "15 15";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 90.;
     visalphaend = 50.;
};

INSTANCE MAGICGLOW (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "MESH";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "100";
     shpmesh_s = "healbody.3ds";
     shpmeshrender_b = 0;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     lsppartavg = 2000.;
     flygravity_s = "0 0 0";
     visname_s = "AURA.TGA";
     visorientation_s = "NONE";
     vistexanifps = 20.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 200 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 15.;
     visalphafunc_s = "ADD";
     visalphastart = 50.;
};



INSTANCE RED_LENS (C_PARTICLEFX) //MFX_STUNINGBALL_INIT
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 2 1 1";  
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 7 0";
     shpdistribtype_s = "WALK";
     shpisvolume = 1;
     shpdim_s = "1";
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
     visname_s = "CFLAREBLUE.TGA";
     visorientation_s = "VELO";
     vistexanifps = 18.000000000;
      vistexisquadpoly = 1;   
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vissizestart_s = "35 35";
     vissizeendscale = 2.20000000;
     visalphafunc_s = "ADD";
     visalphastart = 245.000000000;
     visalphaend = 205.000000000;
};




//G2 FOG


// [EDENFELD] ab 1.20 groundfog geschichten (visTexAniIslooping muss auf 2 sein)

INSTANCE GROUNDFOG1_OUTDOOR_LOW (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "150 20 150";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     lsppartavg = 5500;
     lsppartvar = 800;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 100;

};



instance GROUNDFOG1_OUTDOOR_MID (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "WALK";
     shpDistribWalkSpeed = 0.1;
     shpisvolume = 1;
     shpdim_s = "500 20 500";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0;
     lsppartavg = 5500.000000000;
     lsppartvar = 800.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 150.000000000;
     visAlphaEnd   = 100.0;

};


INSTANCE GROUNDFOG1_OUTDOOR_HIGH (C_PARTICLEFX)
{
     ppsvalue = 60;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "1000 20 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     lsppartavg = 5500;
     lsppartvar = 800;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 4;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 100;

};


INSTANCE GROUNDFOG1_INDOOR_LOW (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "150 20 150";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     lsppartavg = 5500;
     lsppartvar = 800;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 100;
};



instance GROUNDFOG1_INDOOR_MID (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "WALK";
     shpDistribWalkSpeed = 0.1;
     shpisvolume = 1;
     shpdim_s = "500 20 500";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0;
     lsppartavg = 5500.000000000;
     lsppartvar = 800.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 150.000000000;
     visAlphaEnd   = 100.0;

};


INSTANCE GROUNDFOG1_INDOOR_HIGH (C_PARTICLEFX)
{
     ppsvalue = 60;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "1000 20 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     lsppartavg = 5500;
     lsppartvar = 800;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 4;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 100;
  

};



INSTANCE GROUNDFOG2_OUTDOOR_LOW (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "150 20 150";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     velavg = 0.00100000005;
     lsppartavg = 5500;
     lsppartvar = 800;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 100;

};



instance GROUNDFOG2_OUTDOOR_MID (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpDistribWalkSpeed = 0.1;
     shpisvolume = 1;
     shpdim_s = "500 20 500";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0;
     lsppartavg = 5500.000000000;
     lsppartvar = 800.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     velAvg			  = 0.001;
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 150.000000000;
     visAlphaEnd   = 100.0;

     
};


INSTANCE GROUNDFOG2_OUTDOOR_HIGH (C_PARTICLEFX)
{
     ppsvalue = 60;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "1000 20 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     velavg = 0.00999999978;
     lsppartavg = 5500;
     lsppartvar = 800;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 4;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 100;


};

INSTANCE GROUNDFOG2_INDOOR_LOW (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "150 20 150";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     velavg = 0.00100000005;
     lsppartavg = 5500;
     lsppartvar = 800;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 100;
};



instance GROUNDFOG2_INDOOR_MID (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpDistribWalkSpeed = 0.1;
     shpisvolume = 1;
     shpdim_s = "500 20 500";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0;
     lsppartavg = 5500.000000000;
     lsppartvar = 800.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     velAvg			  = 0.001;
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 150.000000000;
     visAlphaEnd   = 100.0;     


};


INSTANCE GROUNDFOG2_INDOOR_HIGH (C_PARTICLEFX)
{
     ppsvalue = 60;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "1000 20 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     velavg = 0.00999999978;
     lsppartavg = 5500;
     lsppartvar = 800;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 4;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 100;


};


INSTANCE GROUNDFOGNIGHT_OUTDOOR_LOW (C_PARTICLEFX)
{
     ppsvalue = 10;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "150 20 150";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     lsppartavg = 5500;
     lsppartvar = 800;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 100;

};



instance GROUNDFOGNIGHT_OUTDOOR_MID (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "WALK";
     shpDistribWalkSpeed = 0.1;
     shpisvolume = 1;
     shpdim_s = "500 20 500";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0;
     lsppartavg = 5500.000000000;
     lsppartvar = 800.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 150.000000000;
     visAlphaEnd   = 100.0;

};


INSTANCE GROUNDFOGNIGHT_OUTDOOR_HIGH (C_PARTICLEFX)
{
     ppsvalue = 60;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 0.100000001;
     shpisvolume = 1;
     shpdim_s = "1000 20 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2;
     dirmode_s = "DIR";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     lsppartavg = 5500;
     lsppartvar = 800;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5;
     vistexaniislooping = 2;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 4;
     visalphafunc_s = "BLEND";
     visalphastart = 150;
     visalphaend = 100;


};


PROTOTYPE INVOCATION (C_PARTICLEFX)
{
     ppsvalue = 30;
     ppsscalekeys_s = "1 1 2 2 2 3 3 4 4 5";
     ppsissmooth = 1;
     ppsfps = 3;
     shptype_s = "CIRCLE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "120";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10";
     shpscaleissmooth = 1;
     shpscalefps = 3;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90;
     dirangleheadvar = 45;
     dirangleelev = 90;
     dirangleelevvar = 45;
     velavg = 0.100000001;
     lsppartavg = 1500;
     lsppartvar = 300;
     flygravity_s = "0 0.00008 0";
     visname_s = "MFX_MAGICCLOUD.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25;
     vistexaniislooping = 2;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "20 20";
     vissizeendscale = 20;
     visalphafunc_s = "ADD";
     visalphastart = 255;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

INSTANCE INVOCATION_RED  (INVOCATION)
{
	vistexcolorstart_s = "255 0 0";
    vistexcolorend_s = "255 0 0";
};

INSTANCE INVOCATION_WHITE  (INVOCATION)
{
	vistexcolorstart_s = "255 255 255";
    vistexcolorend_s = "255 255 255";
};

INSTANCE INVOCATION_WHITE_TO_BRIGHT_BLUE  (INVOCATION)
{
	vistexcolorstart_s = "255 255 255";
    vistexcolorend_s = "155 195 255";
};
INSTANCE INVOCATION_BLUE  (INVOCATION)
{
	vistexcolorstart_s = "0 0 255";
    vistexcolorend_s = "0 0 255";
};

INSTANCE INVOCATION_GREEN  (INVOCATION)
{
	vistexcolorstart_s = "0 200 200";
    vistexcolorend_s = "0 200 200";
};

INSTANCE INVOCATION_VIOLET  (INVOCATION)
{
	vistexcolorstart_s = "200 0 255";
    vistexcolorend_s = "255 0 200";
};
INSTANCE INVOCATION_BLACK (INVOCATION)
{
	
     visname_s = "MFX_MAGICCLOUD_ALPHA.TGA";
     visalphafunc_s = "BLEND";	
	vistexcolorstart_s = "0 0 0";
    vistexcolorend_s = "0 0 0";
};

INSTANCE STUNBASH_1 (C_PARTICLEFX)
{
     ppsvalue = 19.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20";
     ppsissmooth = 1;
     ppsfps = 12.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "world";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 21 22 23 23 23 24";
     shpscalefps = 19.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.00000010;
     lsppartavg = 900.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "MFX_MAGICCLOUD_ALPHA.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "87 65 39";
     vistexcolorend_s = "20 19 18";
     vissizestart_s = "60 60";
     vissizeendscale = 7.000000000;
     visalphafunc_s = "SUB";
     visalphastart = 255.000000000;
     visalphaend = 0.000000000;
};

INSTANCE STUNBASH_2 (C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 50.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 180.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.750000003;
     velvar = 0.080000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.001 0";
     flycolldet_b = 1;
     visname_s = "PFXFLARE1.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 8.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 50 10";
     vissizestart_s = "60 60";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
INSTANCE STUNBASH_3 (C_PARTICLEFX)
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
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_ORIGIN_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 90 20";
     vissizestart_s = "11 11";
     vissizeendscale = 25.5000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 0.;   
};


INSTANCE DUST_NL (C_PARTICLEFX)
{
     ppsvalue = 14;
     ppsscalekeys_s = "1.0 0.9 0.7 0.3 0.2 0.2 0.1 0.2 0.1 0.2 0.1 0.2 0.3 0.4 0.5 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.1 1.0 0.9";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2;
     shptype_s = "SPHERE";
     shpfor_s = "WORLD";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpdistribwalkspeed = 0.02;
     shpisvolume = 1;
     shpdim_s = "450 450 450";
     shpscalekeys_s = "1 1 1.2 1.4 1.3 1.4";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 1;
     dirmode_s = "NONE";
     dirangleheadvar = 50;
     dirangleelev = 90;
     dirangleelevvar = 20;
     velavg = 0.00350000005;
     lsppartavg = 4500;
     lsppartvar = 1200;
     flygravity_s = "0 0.00001 0";
     visname_s = "AMBIENTFOG_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 0;
     vistexanifps = 1;
     vistexaniislooping = 0;
     vistexcolorstart_s = "2 2 2";
     vistexcolorend_s = "250 250 250";
     vissizestart_s = "188 188";
     vissizeendscale = 1.7;
     visalphafunc_s = "ADD";
     visalphastart = 220;
     visalphaend = 0;
};



INSTANCE MIS_FINGERS_HUT_DUST (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "2 1 0.3 0.2 0.1 0.001 0";
     ppsfps = 2;
     ppsislooping = 0;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "-60 -120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20 5 20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirangleheadvar = 20.000000000;
     //dirangleelev = 30.000000000;
     dirangleelevvar = 30.000000000;
     velavg = 0.05999998;
     velvar = 0.020000000;
     lsppartavg = 4000.000000000;
     lsppartvar = 2000.000000000;
     flygravity_s = "-0.000088 -0.00001 -0.000068";
     flyCollDet_B	 = 1;
     visname_s = "groundfog.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "205 135 86";
     vistexcolorend_s = "155 135 136";
     vissizestart_s = "50 50";
     vissizeendscale = 17.000000000;
     visalphafunc_s = "blend";
     visalphastart = 155.000000000;
     visalphastart = 255.000000000;
};