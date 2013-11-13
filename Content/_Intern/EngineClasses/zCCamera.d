//--------------------------------------
// Kamera
// Gothic 2.60(fix) version
// need modifications
// won't work correctly right now
//--------------------------------------

const int NUM_FRUSTUM_PLANES = 6;

class zCCamera {
    //enum { CLIP_FLAGS_FULL        = 63, CLIP_FLAGS_FULL_WO_FAR    = 15 };
    //enum { NUM_FRUSTUM_PLANES_WO_FAR  =  4 };
    //enum { FRUSTUM_PLANE_FAR  =  4 };

    //zTPlane           frustumplanes   [NUM_FRUSTUM_PLANES];
/*0x0000*/      var int frustumplanes[24/*NUM_FRUSTUM_PLANES * sizeof (zTPlane)*/];         //zTPlane: { zREAL distance; zPOINT3 normal; }
/*0x0004*/      var int signbits[/*NUM_FRUSTUM_PLANES als Bytes*/ 2];   //zBYTE

    //var int zTViewportData    vpData;
/*0x0008*/      var int xmin;               //int           // oben rechts
/*0x000C*/		var int ymin;               //int         
/*0x0010*/		var int xdim;               //int           
/*0x0014*/		var int ydim;               //int         
/*0x0018*/		var int xminFloat;          //zVALUE        // oben links
/*0x001C*/		var int yminFloat;          //zVALUE    
/*0x0020*/		var int xmaxFloat;          //zVALUE        // unten rechts
/*0x0024*/		var int ymaxFloat;          //zVALUE    
/*0x0028*/		var int xdimFloat;          //zVALUE        
/*0x002C*/		var int ydimFloat;          //zVALUE    
/*0x0030*/		var int xdimFloatMinus1;    //zVALUE    
/*0x0034*/		var int ydimFloatMinus1;    //zVALUE    
/*0x0038*/		var int xcenter;            //zVALUE
/*0x003C*/		var int ycenter;            //zVALUE
    
/*0x0040*/	    var int targetView;                         //zCViewBase

    //Transformationsmatrizzen:
/*0x0044*/   	var int camMatrix   [16];       //zMATRIX4
/*0x0084*/   	var int camMatrixInv[16];       //zMATRIX4

/*0x00C4*/   	var int tremorToggle;       //zBOOL
/*0x00C8*/   	var int tremorScale;        //zREAL
/*0x00CC*/   	var int tremorAmplitude[3]; //zVEC3
/*0x00DC*/   	var int tremorOrigin[3];    //zVEC3
/*0x00EC*/   	var int tremorVelo;         //zREAL

    // Transformation matrices
/*0x00F0*/    	var int trafoView   [16];   //zMATRIX4   //+0x40
/*0x0130*/    	var int trafoViewInv[16];   //zMATRIX4
/*0x0170*/    	var int trafoWorld  [16];   //zMATRIX4
    
    /*
    template <class T, int SIZE> class zCMatrixStack {
        int     pos;
        T       stack[SIZE];
    }*/
    //zCMatrixStack<zMATRIX4,8> trafoViewStack;
/*0x01B0*/    	var int trafoViewStack[/* 1 + 16 * 8 */129];  //+0x204
    //zCMatrixStack<zMATRIX4,8> trafoWorldStack;
/*0x03B4*/      var int trafoWorldStack[/* 1 + 16 * 8 */129];
    //zCMatrixStack<zMATRIX4,8> trafoWorldViewStack;
/*0x05B8*/      var int trafoWorldViewStack[/* 1 + 16 * 8 */129];
    
/*0x07BC*/    	var int trafoProjection[16]; //zMATRIX4

    //enum { zTCAM_POLY_NUM_VERT = 4 };
    
    /*
    struct zTCamVertSimple {
        zREAL       x,y,z;      
        zVEC2       texuv;
        zCOLOR      color;
    };
    */
    
    //zTCamVertSimple polyCamVerts[zTCAM_POLY_NUM_VERT];
/*0x07FC*/      var int polyCamVerts[/*zTCAM_POLY_NUM_VERT * (3 + 2 + 1)*/ 24];   //+0x60
    
/*0x08B4*/    	var int poly;           //zCPolygon* 
/*0x08B8*/    	var int polyMesh;       //zCMesh*   
/*0x08BC*/    	var int polyMaterial;   //zCMaterial*

    // Screen-Effects CORRECTED BYTES OFFSET
/*0x08C0*/    	var int screenFadeEnabled;         //zBOOL            
/*0x08C4*/    	var int screenFadeColor;           //zCOLOR          
// /*0x08C8*/    	var string screenFadeTexture;      //zSTRING    //NOT IN G1        
// /*0x08DC*/    	var int screenFadeTextureAniFPS;   //zREAL      //NOT IN G1      
//     
//     /*
//     enum zTRnd_AlphaBlendFunc   {   zRND_ALPHA_FUNC_MAT_DEFAULT,
//                                 zRND_ALPHA_FUNC_NONE,                   
//                                 zRND_ALPHA_FUNC_BLEND,              
//                                 zRND_ALPHA_FUNC_ADD,                    
//                                 zRND_ALPHA_FUNC_SUB,                    
//                                 zRND_ALPHA_FUNC_MUL,                    
//                                 zRND_ALPHA_FUNC_MUL2,                   
//                                 zRND_ALPHA_FUNC_TEST,   
//                                 zRND_ALPHA_FUNC_BLEND_TEST
//                             };  */
// /*0x08E0*/    	var int screenFadeTextureBlendFunc;     //zTRnd_AlphaBlendFunc
/*0x08E4*/    	var int cinemaScopeEnabled;             //zBOOL 
/*0x08E8*/    	var int cinemaScopeColor;               //zCOLOR

    //ungenutzt:
    //enum zPROJECTION  { PERSPECTIVE, ORTHOGONAL };
/*0x0894*/    	var int projection;     //zPROJECTION
    
    /*
    enum zTCam_DrawMode { zCAM_DRAW_NORMAL, zCAM_DRAW_NOTHING, 
                      zCAM_DRAW_WIRE, zCAM_DRAW_FLAT, zCAM_DRAW_TEX }; */
/*0x0898*/    	var int drawMode; //zTCam_DrawMode
    
    /*
    enum zTShadeMode    { zSHADE_NORMAL, zSHADE_NOTHING, zSHADE_CONSTANT, zSHADE_GOURAUD, zSHADE_LIGHTMAP }; */
/*0x089C*/    	var int shadeMode;  //zTShadeMode
              	
/*0x08A0*/    	var int drawWire;   //zBOOL
              	
/*0x08A4*/    	var int farClipZ;          //zVALUE 
/*0x08A8*/    	var int nearClipZ;         //zVALUE 
/*0x08AC*/    	var int viewDistanceX;     //zVALUE 
/*0x08B0*/    	var int viewDistanceY;     //zVALUE 
/*0x08B4*/    	var int viewDistanceXInv;  //zVALUE 
/*0x08B8*/    	var int viewDistanceYInv;  //zVALUE 
/*0x08BC*/    	var int vobFarClipZ;       //zBOOL   
/*0x08FC*/    	var int fovH;              //zREAL
/*0x0900*/    	var int fovV;              //zREAL   
/*0x08C8*/    	var int connectedVob;     //zCVob*
  
/*0x08CC*/   	var int topBottomSin;      //zVALUE
/*0x08D0*/   	var int topBottomCos;      //zVALUE
/*0x08D4*/   	var int leftRightSin;      //zVALUE
/*0x08D8*/   	var int leftRightCos;      //zVALUE
}; /*0x08DC*/

