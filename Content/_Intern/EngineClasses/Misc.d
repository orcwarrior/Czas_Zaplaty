//--------------------------------------
// Baum / Knoten. Für Vobtree
//--------------------------------------

//template <class T> 
class zCTree {
    var int parent;            //zCTree* 
    var int firstChild;        //zCTree* 
    var int next;              //zCTree* 
    var int prev;              //zCTree* 
    var int data;              //T*
};

//--------------------------------------
// Listen, Arrays. Treten oft auf.
//--------------------------------------

//template <class T> 
class zCArray {
    var int array;              //T*
    var int numAlloc;           //int
    var int numInArray;         //int
};

//template <class T> 
class zCArraySort {
    var int array;              //T*
    var int numAlloc;           //int
    var int numInArray;         //int
    var int compare;            //int (*Compare)(const T* ele1,const T* ele2);
};

//template <class T> 
class zCList {
    var int data;               //T*
    var int next;               //zCListSort<T>*
};

//template <class T> 
class zCListSort {
    var int compareFunc;        //int (*Compare)(T *ele1,T *ele2);
    var int data;               //T*
    var int next;               //zCListSort<T>*
};

//--------------------------------------
// Timer (technisch und spieltechnisch)
//--------------------------------------

class zCTimer {
    var int factorMotion;        //zREAL        //nicht zu klein machen. Sonst: Freeze bei hoher Framerate!
    var int frameTimeFloat;      //zREAL [msec] //Zeit der zwischen diesem und dem letzten Frame verstrichen ist
    var int totalTimeFloat;      //zREAL [msec] //gesamte Zeit
    var int frameTimeFloatSecs;  //zREAL  [s]
    var int totalTimeFloatSecs;  //zREAL  [s]
    var int lastTimer;           //zDWORD
    var int frameTime;           //zDWORD [msec] //nochmal als Ganzahl
    var int totalTime;           //zDWORD [msec]
    var int minFrameTime;        //zDWORD       //antifreeze. Sonst wird die Framezeit auf 0 gerundet und nichts bewegt sich
          
    var int forcedMaxFrameTime;  //zDWORD //länger als das darf ein Frame (in Spielzeit) nicht dauern. Um zu große Zeitsprünge für die Objekte zu vermeiden? Jedenfalls sort dies dafür, dass das Spiel langsamer läuft, wenn das Spiel mit rendern nicht hinterherkommt.
};

class oCWorldTimer {
    //250000 Ticks pro Stunde
    var int worldTime;    //zREAL   
    var int day;          //int      
};

//--------------------------------------
// Spawnmanager
//--------------------------------------

//Ausbeute der Klasse ist eher gering, aber folgende
//drei statischen Variablen sind sehr interessant:

class oCSpawnManager
{
    /*
    typedef struct oSSpawnNode{
        oCNpc*      npc;
        zVEC3       spawnPos;
        zREAL       timer;
    } oTSpawnNode; */

    //zCArray<oTSpawnNode*> spawnList;
        var int spawnList_array;        //oTSpawnNode**
        var int spawnList_numAlloc;     //int
        var int spawnList_numInArray;   //int
        
    var int spawningEnabled;        //zBOOL
    var int camPos[3];              //zVEC3
    var int insertTime;             //zREAL //Verzögerungszeit des Spawnmanagers (Performancegründe)

    var int spawnFlags; //war mal ne Kopierschutz Sache, böse Raubkopierer hatten mit gepimpten immortal Flags zu kämpfen. jetzt ungenutzt.
};

//--------------------------------------
// Portalzeug
//--------------------------------------

class oCPortalRoom {
    var string portalName;    //zSTRING 
    var string ownerNpc;      //zSTRING 
    var int ownerGuild;    //int           
};

class oCPortalRoomManager {
    var int oldPlayerPortal;    //zSTRING*      
    var int curPlayerPortal;    //zSTRING*      
    var int oldPlayerRoom;      //oCPortalRoom*
    var int curPlayerRoom;      //oCPortalRoom*

    //zCArraySort <oCPortalRoom*> portals;
        var int portals_array;      //oCPortalRoom**
        var int portals_numAlloc;   //int
        var int portals_numInArray; //int
        var int portals_compare;    //int (*Compare)(const oCPortalRoom* ele1,const oCPortalRoom* ele2);
};

//--------------------------------------
// Light
//--------------------------------------
const int zCVobLight_bitfield_isStatic       = ((1 << 1) - 1) <<  0;
const int zCVobLight_bitfield_rangeAniSmooth = ((1 << 1) - 1) <<  1;
const int zCVobLight_bitfield_rangeAniLoop   = ((1 << 1) - 1) <<  2;
const int zCVobLight_bitfield_colorAniSmooth = ((1 << 1) - 1) <<  3;
const int zCVobLight_bitfield_colorAniLoop   = ((1 << 1) - 1) <<  4;
const int zCVobLight_bitfield_isTurnedOn     = ((1 << 1) - 1) <<  5;
const int zCVobLight_bitfield_lightQuality   = ((1 << 4) - 1) <<  6;
const int zCVobLight_bitfield_lightType      = ((1 << 4) - 1) << 10;
const int zCVobLight_bitfield_m_bCanMove     = ((1 << 1) - 1) << 14;

class zCVobLight {
//  zCVob {
//      zCObject {
            var int    vfptr;
            var int    _zCObject_refCtr;
            var int    _zCObject_hashIndex;
            var int    _zCObject_hashNext;
            var string _zCObject_objectName;
//      }
        var int       _zCVob_globalVobTreeNode;
        var int       _zCVob_lastTimeDrawn;
        var int       _zCVob_lastTimeCollected;
        var int       _zCVob_vobLeafList_array;
        var int       _zCVob_vobLeafList_numAlloc;
        var int       _zCVob_vobLeafList_numInArray;
        var int       _zCVob_trafoObjToWorld[16];
        var int       _zCVob_bbox3D_mins[3];
        var int       _zCVob_bbox3D_maxs[3];
        var int       _zCVob_touchVobList_array;
        var int       _zCVob_touchVobList_numAlloc;
        var int       _zCVob_touchVobList_numInArray;
        var int       _zCVob_type;
        var int       _zCVob_groundShadowSizePacked;
        var int       _zCVob_homeWorld;
        var int       _zCVob_groundPoly;
        var int       _zCVob_callback_ai;
        var int       _zCVob_trafo;
        var int       _zCVob_visual;
        var int       _zCVob_visualAlpha;
        var int       _zCVob_rigidBody;
        var int       _zCVob_lightColorStat;
        var int       _zCVob_lightColorDyn;
        var int       _zCVob_lightDirectionStat[3];
        var int       _zCVob_vobPresetName;
        var int       _zCVob_eventManager;
        var int       _zCVob_nextOnTimer;
        var int       _zCVob_vob_bitfield[5];
        var int       _zCVob_m_poCollisionObjectClass;
        var int       _zCVob_m_poCollisionObject;
//  }
    
    //Ein Licht Vob kann verschiedene Farben und Reichweite haben.
    //Schließlich gibt es animierte Lichter!
    
    //zCVobLightData    lightData;
        //zCArray<zVALUE>       rangeAniScaleList; //zREAL ~ zVALUE
            var int lightData_rangeAniScaleList_array;      //zVALUE* 0x100 
            var int lightData_rangeAniScaleList_numAlloc;   //int
            var int lightData_rangeAniScaleList_numInArray; //int
        
        //zCArray<zCOLOR>       colorAniList;
            var int lightData_colorAniList_array;           //zCOLOR*
            var int lightData_colorAniList_numAlloc;        //int
            var int lightData_colorAniList_numInArray;      //int	0x110 
        
        var int lensFlareFXNo;                              //int                  
        var int lensFlareFX;                                //zCLensFlareFX*
        
        var int lightColor;                                 //zCOLOR //Alphakanal hier irrelevant
        var int range;                                      //zVALUE	0x120 
        var int rangeInv;                                   //zVALUE
        var int rangeBackup;                                //zVALUE
        
        //Daten zur Lichtanimation
        //Zustand der Reichweitenanimation
        var int rangeAniActFrame;                           //zVALUE
        var int rangeAniFPS;                                //zVALUE	0x130 
        
        //Zustand der Farbanimation
        var int colorAniActFrame;                           //zVALUE                
        var int colorAniFPS;                                //zVALUE                
        
        // spotLights? Ich kenne das Feature nicht.
        var int spotConeAngleDeg;                           //zREAL //0x13C
        
        //Siehe Auflistung oben
        var int bitfield;					//0x140
        
    
    //zTRayTurboValMap<zCPolygon*, int>affectedPolyMap;
        /*
        struct zSNode                                   
        {                                               
            KEY             m_Key       ;               
            ELEMENT         m_Element   ;               
            unsigned long   m_u32Hash   ;               
            zSNode*         m_pNext     ;               
        }; */
        //zCArray<zSNode*>              m_arrNodes;
            var int affectedPolyMap_m_arrNodes_array;       //zSNode**	//0x144
            var int affectedPolyMap_m_arrNodes_numAlloc;    //int
            var int affectedPolyMap_m_arrNodes_nunInArray;  //int
    
    var string lightPresetInUse;                //zSTRING
};

//--------------------------------------
// String
//--------------------------------------

/*
    Speicherlayout eines Strings.
    Gothic geht eigentlich ganz gut mit Strings um, man braucht diese Klasse nicht.
    Ich habe sie nur intern gebraucht um Speicher zu allozieren.
*/ 
class zString {
    var int _vtbl; //immer 0
    var int _allocater; //immer 0
    var int ptr; //pointer zu den Daten
    var int len; //Länge des Strings
    var int res; //allozierte Ressourcen
};

const int sizeof_zString = 20;

class zCTexture {
	
   var int    vfptr;	 //0x000
   var int    refCtr;    //0x004
   var int    hashIndex; //0x008
   var int    hashNext;  //0x00C
   var string objectName;//0x010
   var int	  val1;		 //0x024 
   var int	  val2;		 //0x028 
   var int	  val3;		 //0x02C 
   var int	  vfptr2;	 //0x030 zCTextureExchange vftptr /8211660
   var int	  val4;	 	 //0x034 ptr?
   var int	  val5;	 	 //0x038 always -1
   var int	  val6;	 	 //0x03C always -1
   var int	  val7;	 	 //0x040 always -1
   var int	  val8;	 	 //0x044 always -1
   var int	  val9;	 	 //0x048 always -1
   var int	  val10;	 //0x04C always -1
};