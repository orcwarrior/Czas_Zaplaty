//################################################ ######
//
// Game Manager takes care of
// save to start game sessions, etc.
//
//################################################

class CGameManager
{
	var int _vbtl;
	
	var int oldAlphaBlendFunc;  //zTRnd_AlphaBlendFunc 
	var int sysContextHandle;   //zTSystemContextHandle

	var int gameSession;        //oCGame*			        
	var int backLoop;           //oCGame*			        
	var int exitGame;	        //zBOOL			          
	var int exitSession;	    //zBOOL			          
	var int gameIdle;           //zBOOL			          
	var int lastWorldWasGame;   //zBOOL			          
	var int savegameManager;    //oCSavegameManager*

	//zCArray<zSTRING>	lastDatFileList;
		var int lastDatFileList_array;     	//zSTRING*
		var int lastDatFileList_numAlloc;   //int
		var int lastDatFileList_numInArray; //int
	
	//zCArray<zSTRING>	lastWorldList;
		var int lastWorldList_array;     	//zSTRING*
		var int lastWorldList_numAlloc;     //int
		var int lastWorldList_numInArray;   //int
		
	var string backWorldRunning;    //zSTRING
	var string backDatFileRunning;  //zSTRING

	var int vidScreen;              //zCView*
	var int initScreen;             //zCView*

	var int introActive;            //zBOOL
	var int dontStartGame;          //zBOOL

	var int videoPlayer;            //oCBinkPlayer*	
	var int videoPlayInGame;        //zBOOL			      

	var int menu_chgkeys;           //zCMenu*		      
	var int menu_chgkeys_ext;       //zCMenu*		      
	var int menu_save_savegame;     //oCMenuSavegame*
	var int menu_load_savegame;	    //oCMenuSavegame*

	var int	playTime;				// is rarely updated (?). But at least when saving and loading.
	
};