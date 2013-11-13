//######################################################
//
//  Skycontroller
//      Der Outdoor Skycontroller ist der speziellste
//      aller SkyController.
//	Gothic II version 2.6 (Report-Version 2.6_rev1)
// (Obivously need modifications to work with 1.08k)
// Analize started June 01, 2010 
//######################################################
//size=1664

/* zCArray<zCSkyState*> 
0 - time:12,00/0; MIDDAY
	polycolor: 	255,250,235
	fogcolor 	116,89,75
	domecolor0: 120,140,180
	fogdist = 0,05
	sunon = 1
	//zCSkylayer
	0.texname = "skyday_layer1_A0.TGA"
	  texalpha = 215
	1.texname = ""
	  texalpha = 255 (disabled)
	  
1 - time 17:00/0.25 afternoon
	polycolor: 	255,250,235
	fogcolor 	116,89,75      
	domecolor0 =120,140,180
	fogdist = 0,05
	sunon = 1
	//ZCskylayer
	0.texname=""
	  texalpha = 215
	1.texname=""
	  texalpha= 255
	NO CHANGES SINCE MIDDAY
	
2 - time ~19:12 /0.30... SUNSET
	polycolor: 255,185,170
	fogcolor:  180,75,60
	domecolor0:180,75,60 
	fogdist = 0,20
	//ZCSkyLayer
	0.texname=""
	  texalpha=128
	1.texname=""
	  texalpha=128	
	  
3 - time 20:24/0.35 DUSK
	polycolor: 105,105,195
	fogcolor:  20,20,60
	domecolor0:55,55,155
	domecolor1:20,20,60(???)
	fogdist = 0.1
	//ZCSkyLayer
	0.texname="SKYNIGHT_LAYER0_A0.TGA"
	  texalpha=255
	1.texname="SKYNIGHT_LAYER1_A0.TGA"
	  texalpha=0	
	  
4 - time 0:00/0.5 MIDNIGHT
	polycolor: 40,60,210
	fogcolor: 5,5,20
	domecolor0:55,55,155
	domecolor1:5,5,20(???)	
	fogdist = 0.05
	//ZCskyLayer
	0.texname=""
	  texalpha=255
	1.texname="SKYNIGHT_LAYER1_A0.TGA"
	  texalpha=215
	  
5.	time ~3:20/0.65 DAWN
	polycolor: 40,60,210
	fogcolor: 5,5,20
	domecolor0:55,55,155
	domecolor1:5,5,20(???)	
	fogdist = 0.2
	//ZCskyLayer
	0.texname=""
	  texalpha=255
	1.texname="SKYDAY_LAYER0_A0.TGA"
	  texalpha=0
	  
6.	time ~4:30/0.70 SUNRISE
	polycolor: 190,160,255
	fogcolor: 80,60,105
	domecolor0:80,60,105
	fogdist = 0.5
	//ZCskyLayer
	0.texname=""
	  texalpha=128
	1.texname=""
	  texalpha=128	  

	  
7.	time ~6:00/0.75 MORNING
	polycolor: 255,250,235
	fogcolor: 116,89,75
	domecolor0: 120,140,180
	fogdist = 0.2
	//ZCskyLayer
	0.texname="SKYDAY_LAYER1_A0.TGA"
	  texalpha=128
	1.texname="SKYDAY_LAYER0_A0.TGA"
	  texalpha=128	 	  	  
*/
	


class zCSkyController_Outdoor {
    //zCObject {
/*0x0000*/  var int    _vtbl;
/*0x0004*/  var int    _zCObject_refCtr;
/*0x0008*/  var int    _zCObject_hashIndex;
/*0x000C*/  var int    _zCObject_hashNext;
/*0x0010*/	var string _zCObject_objectName;
    //}
    
    /*
    enum zTWeather
    {
        zTWEATHER_SNOW,
        zTWEATHER_RAIN
    };*/
    
    //Es wird eine Tageszeitabhängige Lookuptable für Lichtwerte bereitgestellt.
/*0x0024*/  var int polyLightCLUTPtr;   //zCOLOR*  "colour look up table", siehe unten

/*0x0028*/	var int m_bColorChanged;    //zBOOL    
    
///*0x0028*/	var int cloudShadowScale;   //zREAL    
///*0x0020*/	var int m_enuWeather;       //zTWeather
    		
/*0x002C*/	var int backgroundColor;    //zCOLOR                           
/*0x0030*/	var int fillBackground;     //zBOOL                         
/*0x0034*/	var int backgroundTexture;  //zCTexture*                    
// /*0x0038*/  var int relightCtr;         //zTFrameCtr ~ int              
// /*0x003C*/  var int lastRelightTime;    //zREAL                         
// /*0x0040*/  var int m_fRelightTime;     //zREAL                         
    		
/*0x0038*/	var int underwaterFX;       //zBOOL                      
/*0x003C*/	var int underwaterColor;    //zCOLOR                        
/*0x0040*/	var int underwaterFarZ;     //zREAL                      
/*0x0044*/	var int underwaterStartTime;//zREAL                      
/*0x0048*/	var int oldFovX;            //zREAL                      
/*0x004C*/	var int oldFovY;            //zREAL                      
/*0x0050*/	var int vobUnderwaterPFX;   //zCVob*                        
	
			//Screen Poly? Für Blenden? Dafür gibts doch die Kamera...
/*0x0054*/	var int scrPoly;            //zCPolygon*                   
/*0x0058*/	var int scrPolyMesh;        //zCMesh*                        
/*0x005C*/	var int scrPolyAlpha;       //int                               
/*0x0060*/	var int scrPolyColor;       //zCOLOR                          
/*0x0064*/	var int scrPolyAlphaFunc;   //zTRnd_AlphaBlendFunc
    		
    		//ab hier: Outdoor spezifisch!
/*0x0068*/	var int initDone;           //zBOOL
/*0x006C*/	var int masterTime;         //zREAL //Archived
/*0x007C*/	var int masterTimeLast;     //zREAL
    
    //enum zESkyLayerMode { zSKY_MODE_POLY, zSKY_MODE_BOX };
    
    //zCSkyState masterState;
/*0x0080*/  var int masterState_time;                    //zREAL               
/*0x0084*/  var int masterState_polyColor[3];            //zFloat               
/*0x0090*/  var int masterState_fogColor[3];             //zFloat               
/*0x00A0*/  var int masterState_domeColor1[3];           //zFloat               
/*0x00AC*/	var int masterState_domeColor0[3];           //zFloat               
/*0x00B8*/	var int masterState_fogDist;                 //zREAL               
/*0x00BC*/	var int masterState_sunOn;                   //zBOOL               
              
        
        //zCSkyLayerData masterState_layer[zSKY_NUM_LAYER]  //zSKY_NUM_LAYER == 2
            //Layer 0
/*0x00C4*/  var int masterState_layer0_skyMode;      //zESkyLayerMode   
/*0x00C8*/  var int masterState_layer0_tex;          //zCTexture*          
/*0x00D0*/  var string masterState_layer0_texName;   //zSTRING               
/*0x00E4*/  var int masterState_layer0_texAlpha;     //zREAL                   
/*0x00E8*/  var int masterState_layer0_texScale;     //zREAL                   
/*0x00EC*/	var int masterState_layer0_texSpeed[2];  //zVEC2                   
            //Layer 1
/*0x00F4*/  var int masterState_layer1_skyMode;      //zESkyLayerMode   
/*0x00F8*/  var int masterState_layer1_tex;          //zCTexture*          
/*0x00FC*/  var string masterState_layer1_texName;   //zSTRING               
/*0x0110*/  var int masterState_layer1_texAlpha;     //zREAL                   
/*0x0114*/	var int masterState_layer1_texScale;     //zREAL                   
/*0x0118*/  var int masterState_layer1_texSpeed[2];  //zVEC2
    
/*0x0120*/  var int state0;      //zCSkyState*
/*0x0124*/  var int state1;      //zCSkyState*
    
    //zCArray<zCSkyState*>      stateList;
/*0x0128*/  var int stateList_array;         //zCSkyState**
/*0x012C*/  var int stateList_numAlloc;      //int
/*0x0130*/  var int stateList_numInArray;    //int
    
/*0x0134*/    var int polyLightCLUT[256];     //zCOLOR //Farbtabelle für Beleuchtung. Abhängig von der Tageszeit
/*0x0548*/    var int RelightCounter;             //zREAL  //sehr nutzlos
    
    //zCArray<zVEC3> fogColorDayVariations;
       		var int fogColorDayVariations_array;         //zVEC3*
       		var int fogColorDayVariations_numAlloc;      //int
       		var int fogColorDayVariations_numInArray;    //int
    
    //zCArray<zVEC3> fogColorDayVariations2;
        	var int fogColorDayVariations2_array;        //zVEC3*
        	var int fogColorDayVariations2_numAlloc;     //int
        	var int fogColorDayVariations2_numInArray;   //int
        	
    		var int m_fSkyScale;             //zREAL
    		var int m_bSkyScaleChanged;      //zBOOL
 			var int m_overrideColor[3];      //zVEC3
 /*0x0564*/ var int m_bOverrideColorFlag;    //zBOOL
    		var int m_bDontRain;             //zBOOL
    		var int m_bLevelChanged;         //zBOOL
//    		var int m_bDarkSky;              //zBOOL //Not part of G1 class

    //fog
    var int resultFogScale;          //zREAL             
    var int heightFogMinY;           //zREAL             
//    var int heightFogMaxY;           //zREAL             
//    var int userFogFar;              //zREAL             
    var int resultFogNear;           //zREAL             
    var int resultFogFar;            //zREAL             
    var int resultFogSkyNear;        //zREAL             
    var int resultFogSkyFar;         //zREAL             
    var int resultFogColor;          //zCOLOR           
    var int resultFogColorOverride;  //zCOLOR           
    var int userFarZScalability;     //zREAL             

    var int skyLayerState[2];        //zCSkyState*  

    //zCSkyLayer skyLayer[2];    
        //0
        var int skyLayer0_skyPolyMesh;             //zCMesh*             
        var int skyLayer0_skyPoly;                 //zCPolygon*  0x594  
        var int skyLayer0_skyTexOffs[2];           //zVEC2             
        var int skyLayer0_skyDomeMesh;             //zCMesh*     0x5A0        
/*x5A4*/var int skyLayer0_skyMode;                 //zESkyLayerMode
        //1
        var int skyLayer1_skyPolyMesh;             //zCMesh*             
        var int skyLayer1_skyPoly;                 //zCPolygon*  0x5AC  
        var int skyLayer1_skyTexOffs[2];           //zVEC2             
        var int skyLayer1_skyDomeMesh;             //zCMesh*     0x5B8        
        var int skyLayer1_skyMode;                 //zESkyLayerMode
    
    //zCSkyLayer skyLayerRainClouds;
        var int skyLayerRainClouds_skyPolyMesh;             //zCMesh*            
        var int skyLayerRainClouds_skyPoly;                 //zCPolygon*       
        var int skyLayerRainClouds_skyTexOffs[2];           //zVEC2            
        var int skyLayerRainClouds_skyDomeMesh;             //zCMesh*            
        var int skyLayerRainClouds_skyMode;                 //zESkyLayerMode

    var int skyCloudLayerTex;        //zCTexture*    

    // planets
    //enum { NUM_PLANETS = 2 }; //Sonne:0, Mond:1
    //zCSkyPlanet                   planets[NUM_PLANETS];
        //Sonne:
        var int Sun_mesh;        //zCMesh*
        var float Sun_color0[4];   //zVEC4     
        var float Sun_color1[4];   //zVEC4     
        var int Sun_size;        //zREAL     
        var int Sun_pos[3];      //zVEC3     
        var int Sun_rotAxis[3];  //zVEC3     
        //Mond:
        var int Moon_mesh;        //zCMesh*
        var float Moon_color0[4];   //zVEC4    
        var float Moon_color1[4];   //zVEC4    
        var int Moon_size;        //zREAL    
        var int Moon_pos[3];      //zVEC3    
        var int Moon_rotAxis[3];  //zVEC3    
    
//     var int m_bSunVisible;        //zBOOL
//     var int m_fFadeScale;         //zREAL
                                
    // sky-pfx                  
    var int vobSkyPFX;            //zCVob*  
    var int skyPFXTimer;          //zREAL    

//     // wind
//     var int m_bIsMainControler;   //zBOOL //gibts überhaupt noch andere als den Hauptcontroller?
//     
//     var int m_bWindVec[3];        //zVEC3

    /*
    enum zTCamLocationHint {
        zCAM_OUTSIDE_SECTOR,
        zCAM_INSIDE_SECTOR_CANT_SEE_OUTSIDE,
        zCAM_INSIDE_SECTOR_CAN_SEE_OUTSIDE,
    };*/
    //
    
    //struct zTRainFX {
        var int rainFX_outdoorRainFX;                   //zCOutdoorRainFX*   
        var int rainFX_camLocationHint;                 //zTCamLocationHint 
        var int rainFX_outdoorRainFXWeight;             //zREAL                      // 0..1
        var int rainFX_soundVolume;                     //zREAL                      // 0..1
        var int rainFX_timerInsideSectorCantSeeOutside; //zREAL                      // msec
        var int rainFX_timeStartRain;                   //zREAL                      
        var int rainFX_timeStopRain;                    //zREAL                      
//         var int rainFX_renderLightning;                 //zBOOL                      
//         var int rainFX_m_bRaining;                      //zBOOL                      
//         var int rainFX_m_iRainCtr;                      //int Anzahl der bisherigen Regenperioden.
    //} rainFX;
};



class zCSkyLayerData {
    //enum zESkyLayerMode { zSKY_MODE_POLY, zSKY_MODE_BOX };
    var int skyMode;            //zESkyLayerMode
    var int tex;                //zCTexture*
    var string texName;         //zSTRING
    var int texAlpha;           //zREAL
    var int texScale;           //zREAL
    var int texSpeed[2];        //zVEC2
};

class zCSkyState {
    var int time;                    //zREAL               
    var int polyColor[3];            //zVEC3               
    var int fogColor[3];             //zVEC3               
    var int domeColor1[3];           //zVEC3               
    var int domeColor0[3];           //zVEC3               
   var int fogDist;                 //zREAL  /*ix56*/              
    var int sunOn;                   //zBOOL               
    var int unknown1;           //int  //in g2: cloudshadow visible  
    
                  
              
                
    
    //zCSkyLayerData layer[zSKY_NUM_LAYER]  //zSKY_NUM_LAYER == 2
        //Layer 0
    	var int layer0_int1;           //int                  
    	var int layer0_int2;           //int                  
    	var int layer0_int3;           //int                  
    	var int layer0_int4;           //int                  
    	var int layer0_int5;           //int 
    	var int layer0_skyMode;      //zESkyLayerMode   
        var int layer0_tex;          //zCTexture*          
        var string layer0_texName;   //zSTRING               
        var int layer0_texAlpha;     //zREAL                   
        var int layer0_texScale;     //zREAL                   
        var int layer0_texSpeed[2];  //zVEC2                   
        //Layer 1
        
    	var int layer1_int1;           //int     
    	var int layer1_int2;           //int     
    	var int layer1_int3;           //int     
    	var int layer1_int4;           //int     
    	var int layer1_int5;           //int         
        var int layer1_skyMode;      //zESkyLayerMode   
        var int layer1_tex;          //zCTexture*          
        var string layer1_texName;   //zSTRING               
        var int layer1_texAlpha;     //zREAL                   
        var int layer1_texScale;     //zREAL                   
        var int layer1_texSpeed[2];  //zVEC2 
};