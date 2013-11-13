const int MAX_ITEMS = 150;
const int MENU_EVENT_MAX = 9;

class zCMenu {
    var int _vtbl;                  //0x0000

    var string backPic;             //0x0004 zSTRING 
    var string backWorld;           //0x0018 zSTRING
    var int posx;                   //0x001C int
    var int posy;                   //0x0020 int
    var int dimx;                   //0x0024 int
    var int dimy;                   //0x0028 int
    var int alpha;                  //0x002C int
    var string musicThemeName;      //0x0030 zSTRING
    var int eventTimerUpdateMSec;   //0x0044 int
    var string itemID[MAX_ITEMS];   //0x0048 zSTRING
    var int     flags;              //0x0C10 int
    var int     defaultOutGame;     //0x0060 int
    var int     defaultInGame;      //0x006C int

    var int m_pWindow;              //0x0C1C zCViewWindow*
    var int m_pInnerWindow;         //0x0C20 zCViewWindow*
    
    var int m_exitState;            //0x0C24 enum { NONE, BACK, GO, FINISHED }

    var string name;                //0x0C28 zSTRING

    var int m_musicTheme;           //0x0C2C zCMusicTheme*
    var int m_mainSel;              //0x0C30 int
    var int m_screenInitDone;       //0x0C34 zBOOL

    var int m_use_dimx;             //0x0C38 int
    var int m_use_dimy;             //0x0C3C int
    var int m_use_posx;             //0x0C40 int
    var int m_use_posy;             //0x0C44 int
    
    var int m_pViewInfo;            //0x0C44 zCView*
    var int cursorVob;              //0x0C48 zCVob*

    var int eventOccured[MENU_EVENT_MAX]; //zBOOL
    var int cursorEn;               //zBOOL
    var int noneSelectable;         //zBOOL
    var int registeredCPP;          //zBOOL
    
    var int updateTimer;            //int
    var int fxTimer;                //float
    
    /*
    enum zTMenuItemSelAction {
        SEL_ACTION_UNDEF            = 0,
        SEL_ACTION_BACK             = 1,
        SEL_ACTION_STARTMENU        = 2,
        SEL_ACTION_STARTITEM        = 3,
        SEL_ACTION_CLOSE            = 4,
        SEL_ACTION_CONCOMMANDS      = 5,
        SEL_ACTION_PLAY_SOUND       = 6,
        SEL_ACTION_EXECCOMMANDS     = 7 
    };*/
    var int forceSelAction;         //zTMenuItemSelAction
    
    var string forceSelAction_S;    //zSTRING 0xCAC
    var int forceSelActionItem;     //zCMenuItem* 0xCB0
    var int forcedSelAction;        //zBOOL 0xCB4
    
    //zCArray <zCMenuItem *> m_listItems;   
        var int m_listItems_array;  //zCMenuItem* 0xCB8
        var int m_listItems_numAlloc;//int   
        var int m_listItems_numInArray;//int
    
    //[oCMenu_Status_only]
    //oCMenu_Status ist eine Unterklasse und hat zusätzlich diese Eigenschaften:
    //Hab mir gespart dafür nochmal eine Extraklasse zu schreiben:
    
    //zCArray <oSMenuInfoAttribute> m_listAttributes;   
        var int m_listAttributes_array;     //oSMenuInfoAttribute*
        var int m_listAttributes_numAlloc;  //int    
        var int m_listAttributes_numInArray;//int
    //zCArray <oSMenuInfoTalent>        m_listTalents;
        var int m_listTalents_array;        //oSMenuInfoTalent*
        var int m_listTalents_numAlloc;     //int    
        var int m_listTalents_numInArray;   //int
    //zCArray <oSMenuInfoArmor>     m_listArmory;
        var int m_listArmory_array;         //oSMenuInfoArmor*
        var int m_listArmory_numAlloc;      //int    
        var int m_listArmory_numInArray;    //int
    
    //[/oCMenu_Status_only]
};

class zCView {
/*0x000*/    var int _vtbl;
    
    /*
    enum zEViewFX
    {
        VIEW_FX_NONE,
        VIEW_FX_ZOOM,
        VIEW_FX_MAX 
    }*/
/*0x004*/    var int zEViewFX;               //zTViewFX
/*0x008*/    var int m_bFillZ;               //zBOOL
/*0x00C*/    var int next;                   //zCView*

    //enum zTviewID { VIEW_SCREEN,VIEW_VIEWPORT,VIEW_ITEM };
/*0x010*/    var int viewID;                 //zTviewID
/*0x010*/    var int flags;                  //int
/*0x014*/    var int intflags;               //int
/*0x018*/    var int ondesk;                 //zBOOL Flag if in list

    /*
    enum zTRnd_AlphaBlendFunc   {   zRND_ALPHA_FUNC_MAT_DEFAULT,
                                zRND_ALPHA_FUNC_NONE,           
                                zRND_ALPHA_FUNC_BLEND,          
                                zRND_ALPHA_FUNC_ADD,                    
                                zRND_ALPHA_FUNC_SUB,                    
                                zRND_ALPHA_FUNC_MUL,                    
                                zRND_ALPHA_FUNC_MUL2,                   
                                zRND_ALPHA_FUNC_TEST,           
                                zRND_ALPHA_FUNC_BLEND_TEST      
                            };  */
                            
  //LOWER PART IS GOOD OFFSET
/*0x01C*/   var int alphafunc;              //zTRnd_AlphaBlendFunc
/*0x020*/   var int color;                  //zCOLOR b, g, r, a
/*0x024*/   var int alpha;                  //int

    // Childs
    //zList <zCView>            childs;
/*0x028*/   var int compare;        //(*Compare)(zCView *ele1,zCView *ele2);
/*0x02C*/   var int count;          //int
/*0x030*/   var int last;           //zCView*;
/*0x034*/   var int wurzel;         //zCView* /root
    
/*0x038*/   var int owner;              //zCView*
/*0x03C*/   var int backTex;            //zCTexture*

    //Das Menüzeug nutzt oft virtuelle Koordinaten.
/*0x040*/   var int vposx;              //int
/*0x044*/   var int vposy;              //int
/*0x048*/   var int vsizex;             //int
/*0x04C*/   var int vsizey;             //int
    
    //Aber auch "echt" Pixelpositionen
/*0x050*/   var int pposx;              //int
/*0x054*/   var int pposy;              //int
/*0x058*/   var int psizex;             //int
/*0x05C*/   var int psizey;             //int

    //Font
/*0x060*/    var int font;               //zCFont*
/*0x064*/    var int fontColor;          //zCOLOR
    
    //Das Textfenster:
/*0x068*/    var int px1;                //int
/*0x06C*/    var int py1;                //int
/*0x070*/    var int px2;                //int
/*0x074*/    var int py2;                //int
    
/*0x078*/    var int winx;               //int // Position in Text-Win
/*0x07C*/    var int winy;               //int
    
    //zCList <zCViewText>       textLines;
/*0x080*/        var int textLines_data; //zCViewText*
/*0x084*/        var int textLines_next; //zCList <zCViewText>*
        
/*0x088*/    var int scrollMaxTime;      //zREAL
/*0x08C*/    var int scrollTimer;        //zREAL
    
/*0x090*/    var int fxOpen       ;    //zTViewFX            
/*0x094*/    var int fxClose      ;    //zTViewFX            
/*0x098*/    var int timeDialog   ;    //zREAL                 
/*0x0A0*/    var int timeOpen     ;    //zREAL
/*0x0A4*/    var int timeClose    ;    //zREAL                 
/*0x0A8*/    var int speedOpen    ;    //zREAL                 
/*0x0AC*/    var int speedClose   ;    //zREAL                 
/*0x0B0*/    var int isOpen       ;    //zBOOL                 
/*0x0B4*/    var int isClosed     ;    //zBOOL                 
/*0x0B8*/    var int continueOpen ;    //zBOOL                 
/*0x0BC*/    var int continueClose;    //zBOOL                 
/*0x0B0*/    var int removeOnClose;    //zBOOL                 
/*0x0B4*/    var int resizeOnOpen ;    //zBOOL                 
/*0x0B8*/    var int maxTextLength;    //int                    
/*0x0BC*/    var string textMaxLength;    //zSTRING              
/*0x0D0*/    var int posCurrent_0[2]; //zVEC2
/*0x0D8*/    var int posCurrent_1[2]; //zVEC2              
/*0x0E0*/    var int posOpenClose_0[2]; //zVEC2
/*0x0E8*/    var int posOpenClose_1[2]; //zVEC2
};//0z0F0

const int MAX_USERSTRINGS = 10;
const int MAX_SEL_ACTIONS =  5;
const int MAX_USERVARS    =  4;
const int MAX_EVENTS      = 10;

class zCMenuItem {
    var int zCView__vtbl;
    var int zCView_zEViewFX;    
    var int zCView_m_bFillZ;    
    var int zCView_next;        
    var int zCView_viewID;      
    var int zCView_flags;      
    var int zCView_intflags;   
    var int zCView_ondesk;      
    var int zCView_alphafunc;   
    var int zCView_color;       
    var int zCView_alpha;       
    var int zCView_compare; 
    var int zCView_count;       
    var int zCView_last;        
    var int zCView_wurzel;      
    var int zCView_owner;       
    var int zCView_backTex; 
    var int zCView_vposx;       
    var int zCView_vposy;       
    var int zCView_vsizex;     
    var int zCView_vsizey;      
    var int zCView_pposx;      
    var int zCView_pposy;       
    var int zCView_psizex;      
    var int zCView_psizey;      
    var int zCView_font;        
    var int zCView_fontColor;   
    var int zCView_px1;            
    var int zCView_py1;            
    var int zCView_px2;            
    var int zCView_py2;            
    var int zCView_winx;            
    var int zCView_winy;            
    var int zCView_textLines_data;  
    var int zCView_textLines_next; 
    var int zCView_scrollMaxTime;   
    var int zCView_scrollTimer; 
    var int zCView_fxOpen        ;  
    var int zCView_fxClose       ;  
    var int zCView_timeDialog    ;  
    var int zCView_timeOpen  ;  
    var int zCView_timeClose     ;  
    var int zCView_speedOpen     ;  
    var int zCView_speedClose    ;  
    var int zCView_isOpen        ;  
    var int zCView_isClosed  ;  
    var int zCView_continueOpen ;  
    var int zCView_continueClose;  
    var int zCView_removeOnClose;  
    var int zCView_resizeOnOpen ;  
    var int zCView_maxTextLength;  
    var string zCView_textMaxLength;            
    var int zCView_posCurrent_0[2]; 
    var int zCView_posCurrent_1[2];       
    var int zCView_posOpenClose_0[2];
    var int zCView_posOpenClose_1[2];
    
    //Parser Start
    
    var string m_parFontName;                            //zSTRING 
    var string m_parText            [MAX_USERSTRINGS];   //zSTRING 
    var string m_parBackPic;                             //zSTRING 
    var string m_parAlphaMode;                           //zSTRING 
    var int m_parAlpha;                                  //int         
    var int m_parType;                                   //int         
    var int m_parOnSelAction        [MAX_SEL_ACTIONS] ;  //int         
    var string m_parOnSelAction_S   [MAX_SEL_ACTIONS];   //zSTRING 
    var string m_parOnChgSetOption;                      //zSTRING 
    var string m_parOnChgSetOptionSection;                //zSTRING 
    var int m_parOnEventAction  [MAX_EVENTS];            //int         
    var int m_parPosX;                                   //int         
    var int m_parPosY;                                   //int         
    var int m_parDimX;                                   //int         
    var int m_parDimY;                                   //int         
    var int m_parSizeStartScale;                         //float      
    var int m_parItemFlags;                              //int         
    var int m_parOpenDelayTime;                          //float      
    var int m_parOpenDuration;                           //float      
    var int m_parUserFloat      [MAX_USERVARS];          //float   
    var string m_parUserString      [MAX_USERVARS];      //zSTRING 
    var int m_parFrameSizeX;                             //int         
    var int m_parFrameSizeY;                             //int         
    var string m_parHideIfOptionSectionSet;              //zSTRING  
    var string m_parHideIfOptionSet;                     //zSTRING  
    var int m_parHideOnValue;                            //int      
    
    //Parser End
    
    var int m_iRefCtr;                //int                      
    var int m_pInnerWindow;           //zCView*               
    var int m_pFont;                  //zCFont*               
    var int m_pFontHi;                //zCFont*               
    var int m_pFontSel;               //zCFont*               
    var int m_pFontDis;               //zCFont*   0x36C            
    var int m_bViewInitialized;       //zBOOL                   
    var int m_bLeaveItem;             //zBOOL                   
    var int m_bVisible;               //zBOOL                   
    var int m_bDontRender;            //zBOOL                   
    //zCArray<zSTRING> m_listLines;
        var int m_listLines_array;     //zSTRING* 0x37C
        var int m_listLines_numAlloc;  //int     
        var int m_listLines_numInArray;//int

    var string id;                     //zSTRING            
    var int inserted;                  //zBOOL            
    var int changed;                   //zBOOL            
    var int active;                    //zBOOL            
    var int open;                      //zBOOL            
    var int close;                     //zBOOL            
    var int opened;                    //zBOOL            
    var int closed;                    //zBOOL            
    var int disabled;                  //zBOOL            
    var int orgWin;                    //zCView*            
    var int fxTimer;                   //float            
    var int openDelayTimer;            //float            
};


class zCViewDialogChoice {
  var int    _vtbl;       // 0x0000 //8255932
  var int    refCtr;      // 0x0004 int
  var int    hashIndex;   // 0x0008 zWORD
  var int    hashNext;    // 0x000C zCObject*
  var string objectName;  // 0x0010 zString

  var int Another_vtbl;  // 0x0024 //8255896
  var int    m_BFillz;   // 0x0028 unsure
  var int 	vposx;       // 0x002C
  var int 	vposy;       // 0x0030
  var int 	vsizex;      // 0x0034
  var int 	vsizey;      // 0x0038
  var int 	pposx;       // 0x003C
  var int 	pposy;       // 0x0040
  var int 	psizex;      // 0x0044
  var int 	psizey;      // 0x0048
  var int 	ptr;         // 0x004C  *SomeView or menu object
  var int 	val;         // 0x0050  
  var int val2;          //	0x0054	
  var int val3;        	 //	0x0058	
                           	
  var int alphafunc;     //	0x005C	MAYBE
  var int backTex;       //	0x0060	zCTexture*  
  var int color;         // 0x0064 	zCOLOR b, g, r, a
  var int alpha;         // 0x0068 	int
  var int val4;          // 0x006C	int blendmode?
  var int val5;          // 0x0070 	int 
  var int val6;          // 0x0074 	int 
  var int val7;          // 0x0078 	int 
  var int val8;          // 0x007C 	int 
  var int val9;          // 0x0080 	int 
  var int val10;         // 0x0084 	int 
  var int val11;         // 0x0088 	int 
  var int val12;         // 0x008C 	ZFLOAT OR TIMER 
  var int val13;         // 0x0090	ZFLOAT OR TIMER  
  var int val14;         // 0x0094 	int 
  var int val15;         // 0x0098 	int 
  var int val16;         // 0x009C 	int 
  var int val17;         // 0x00A0 	int 
  var int val18;         // 0x00A4 	int 
  var int val19;         // 0x00A8 	int 
  var int ViewText_array;         // 0x00AC zCBspLeaf**
  var int ViewText_numAlloc;      // 0x00B0 int
  var int ViewText_numInArray;    // 0x00B4 int  
                 
};


class oCViewStatusBar
{
    var int zCView__vtbl;
    var int _zCInputCallBack_vtbl;
    var int zCView_m_bFillZ;    
    var int zCView_next;        
    var int zCView_viewID;      
    var int zCView_flags;      //20
    var int zCView_intflags;   
    var int zCView_ondesk;      
    var int zCView_alphafunc;   
    var int zCView_color;       
    var int zCView_alpha;       //40
    var int zCView_compare; 
    var int zCView_childs_count;       
    var int zCView_childs_last;        
    var int zCView_childs_wurzel;      
    var int zCView_childs_owner;  //60     
    var int zCView_backTex; 
    var int zCView_vposx;       
    var int zCView_vposy;       
    var int zCView_vsizex;     
    var int zCView_vsizey;      
    var int zCView_pposx;      
    var int zCView_pposy;       
    var int zCView_psizex;      
    var int zCView_psizey;      
    var int zCView_font;        
    var int zCView_fontColor;   
    var int zCView_px1;            
    var int zCView_py1;            
    var int zCView_px2;            
    var int zCView_py2;            
    var int zCView_winx;            
    var int zCView_winy;            
    var int zCView_textLines_data;  
    var int zCView_textLines_next; 
    var int zCView_scrollMaxTime;   
    var int zCView_scrollTimer; 
    var int zCView_fxOpen        ;  
    var int zCView_fxClose       ;  
    var int zCView_timeDialog    ;  
    var int zCView_timeOpen  ;  
    var int zCView_timeClose     ;  
    var int zCView_speedOpen     ;  
    var int zCView_speedClose    ;  
    var int zCView_isOpen        ;  
    var int zCView_isClosed  ;  
    var int zCView_continueOpen ;  
    var int zCView_continueClose;  
    var int zCView_removeOnClose;  
    var int zCView_resizeOnOpen ;  
    var int zCView_maxTextLength;  
    var string zCView_textMaxLength;            
    var int zCView_posCurrent_0[2]; 
    var int zCView_posCurrent_1[2];       
    var int zCView_posOpenClose_0[2];
    var int zCView_posOpenClose_1[2];
    
    var int minLow, maxHigh;         //zREAL
    var int low, high;               //zREAL
    var int previewValue;            //zREAL
    var int currentValue;            //zREAL
    
    var int scale;                   //float   
    var int range_bar;               //zCView* 
    var int value_bar;               //zCView* 
    var string texView;              //zSTRING 
    var string texRange;             //zSTRING 
    var string texValue;             //zSTRING 
};