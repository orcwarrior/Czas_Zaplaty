
//######################################################
//
//  Game
//	-zCSession
//	-oCGame
//	right now it should full work with Gothic 1.08k
//	I wasn't which of this four int isn't work with
//	Gothic 1.08k:
//
//  var int music_delay;            //zREAL                               
//  var int watchnpc;               //oCNpc*                                 
//	var int m_bWorldEntered;        //zBOOL                               
//	var int m_fEnterWorldTimer; 
// I've disabled last two of them, anyway all them looks
// useless.
//	game_showranges - disabled too.
//
// Hex pointers need to be corrected
//######################################################
//statics:
//Die Weltzeit wird nicht weiter gezählt, falls gesetzt
const int game_holdTime_Address = 11208840; //0xAB0888 //zBOOL*
//Didn't corrected

class zCSession {
    var int csMan;        //zCCSManager*
    var int world;        //zCWorld*   
    var int camera;       //zCCamera*   
    var int aiCam;        //zCAICamera* 
    var int camVob;       //zCVob*     
    var int viewport;     //zCView*    
};

const int GAME_VIEW_MAX = 6;

class oCGame {
/*0x0000*/	var int _zCSession_vtbl;
/*0x0004*/	var int _zCSession_csMan;        //zCCSManager*
/*0x0008*/	var int _zCSession_world;        //zCWorld*   
/*0x000C*/	var int _zCSession_camera;       //zCCamera*   
/*0x0010*/	var int _zCSession_aiCam;        //zCAICamera* 
/*0x0014*/	var int _zCSession_camVob;       //zCVob*     
/*0x0018*/	var int _zCSession_viewport;     //zCView*    

/*0x001C*/	var int cliprange;              //zREAL
/*0x0020*/	var int fogrange;               //zREAL
/*0x0024*/	var int inScriptStartup;        //zBOOL
/*0x0028*/	var int inLoadSaveGame;         //zBOOL
/*0x002C*/	var int inLevelChange;          //zBOOL

   /*
    enum oTGameDialogView
    {
        GAME_VIEW_SCREEN        ,/0
        GAME_VIEW_CONVERSATION  ,/1       
        GAME_VIEW_AMBIENT       ,/2       
        GAME_VIEW_CINEMA        ,/3       
        GAME_VIEW_CHOICE        ,/4
        GAME_VIEW_NOISE         ,/5
        GAME_VIEW_MAX
    }*/
    
    //Views sind Kanäle, über die die Engine
    //Informationen anzeigen kann.
    //Beispiel sind die normalen Dialoguntertitelboxen.
/*0x0030*/	var int array_view[GAME_VIEW_MAX];          //zCView*
/*0x0048*/	var int array_view_visible[GAME_VIEW_MAX];  //zBOOL
/*0x0060*/	var int array_view_enabled[GAME_VIEW_MAX];  //zBOOL

/*0x0074*/	var int savegameManager;        //oCSavegameManager*        
/*0x0078*/	var int game_text;              //zCView*                           
/*0x007C*/	var int load_screen;            //zCView*                           
/*0x0080*/	var int save_screen;            //zCView*                           
/*0x0084*/	var int pause_screen;           //zCView*                           
/*0x0088*/	var int hpBar;                  //oCViewStatusBar*        
/*0x008C*/	var int swimBar;                //oCViewStatusBar*        
/*0x0090*/	var int manaBar;                //oCViewStatusBar*        
/*0x0094*/	var int focusBar;               //oCViewStatusBar*        
/*0x0098*/	var int showPlayerStatus;       //zBOOL                           
    
   			// Debugsachen
/*0x009C*/	var int game_drawall;           //zBOOL   //"toggle Desktop"
/*0x00A0*/	var int game_frameinfo;         //zBOOL  
/*0x00A4*/	var int game_showaniinfo;       //zBOOL  
/*0x00A8*/	var int game_showwaynet;        //zBOOL  
/*0x00AC*/	var int game_testmode;          //zBOOL  
                    
/*0x00B0*/	var int game_editwaynet;        //zBOOL
					
/*0x00B4*/	var int game_showtime;          //zBOOL  
			//only in Notr	
			///*0x00B8*/	var int game_showranges;        //zBOOL  
/*0x00BC*/	var int drawWayBoxes;           //zBOOL  
/*0x00C0*/	var int scriptStartup;          //zBOOL  
/*0x00C4*/	var int showFreePoints;         //zBOOL  
/*0x00C8*/	var int showRoutineNpc;         //oCNpc*    
			
   			// Levelinfos                        
/*0x00CC*/	var int loadNextLevel;          //zBOOL                               
/*0x00D0*/	var string loadNextLevelName;   //zSTRING                               
/*0x00E4*/	var string loadNextLevelStart;  //zSTRING                               
   			
   			// Spielerspezifika
/*0x00F8*/  var int startpos[3];            //zVEC3                               
/*0x00FC*/  var int gameInfo;               //oCGameInfo* //etwas auf den ersten Blick uninteressantes
/*0x0100*/  var int pl_light;               //zCVobLight*                        
/*0x0104*/  var int pl_lightval;            //zREAL                               
//FIXFIXFIX LINES    
    		// Timer
/*0x0108*/  var int wldTimer;               //oCWorldTimer*                 
/*0x010C*/  var int timeStep;               //zREAL                               // Ermöglicht Einzelbildschaltung
/*0x0110*/  var int singleStep;             //zBOOL                               
    
    		// Referenzen auf Einzelstückklassen.
/*0x0114*/ 	var int guilds;                 //oCGuilds*                        
/*0x0118*/	var int infoman;                //oCInfoManager*                   
/*0x011C*/	var int newsman;                //oCNewsManager*                   
/*0x0120*/	var int svmman;                 //oCSVMManager*                 
/*0x0124*/	var int trademan;               //oCTradeManager*                 
/*0x0128*/	var int portalman;              //oCPortalRoomManager*     
/*0x012C*/  var int spawnman;               //oCSpawnManager*                 
    
    //Zeug
/*0x0130*/  var int music_delay;            //zREAL                               
/*0x0134*/  var int watchnpc;               //oCNpc*                                 
   

//NotR only, i'm correct?
		    //Kurz nachdem Laden kurze Pause, damit
		    //sich die Systemressourcen erholen.
//		/*0x0138*/  var int m_bWorldEntered;        //zBOOL                               
//		/*0x013C*/  var int m_fEnterWorldTimer;     //zREAL                               
    
    //Klar:
/*0x0140*/  var int initial_hour;           //int                                      
/*0x0144*/  var int initial_minute;         //int                                      
           
    //Debug:                         
    //zCArray<zCVob*>           debugInstances;
/*0x0148*/  var int debugInstances_array;       //zCVob**
/*0x014C*/  var int debugInstances_numAlloc;    //int
/*0x0150*/  var int debugInstances_numInArray;  //int
    
/*0x0154*/  var int debugChannels;          //int        
/*0x0158*/  var int debugAllInstances;      //zBOOL 

    //Objektroutinen ("Wld_SetObjectRoutine"), z.B. Laternen: nur Nachts an
    /*
    typedef struct {
        zSTRING     objName;
        int         stateNum;
        int         hour1,min1;
        int         type;
    } TObjectRoutine; */

/*0x015C*/  var int oldRoutineDay;          //int
    
    //zCListSort<TObjectRoutine>    objRoutineList;
/*0x0160*/  var int objRoutineList_compareFunc;           //int (*Compare)(TObjectRoutine *ele1,TObjectRoutine *ele2);
/*0x0164*/  var int objRoutineList_data;                  //TObjectRoutine*
/*0x0168*/  var int objRoutineList_next;                  //zCListSort<TObjectRoutine>*
        
/*0x016C*/  var int currentObjectRoutine;                   //zCListSort<TObjectRoutine>*
    
    //ProgressBar
/*0x0170*/  var int progressBar;                            //zCViewProgressBar*
    
    //Nicht jedes Fass in der Welt hat ein privates Visual.
    //Ich schätze mal, dass alle benutzten Visuals hier gesammelt werden
    //und Vobs nur Kopien der Referenzen halten.
    
    //zCArray   <zCVisual*>     visualList;
/*0x0174*/  var int visualList_array;         //zCVisual**
/*0x0178*/  var int visualList_numAlloc;      //int
/*0x017C*/  var int visualList_numInArray;    //int
};  /*0x0180*/