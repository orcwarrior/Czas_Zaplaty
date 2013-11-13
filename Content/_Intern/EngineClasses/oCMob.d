//######################################################
//
//  oCMob
//
//  Gothic II 2.60(fix) version                           
//
//######################################################

//--------------------------------------
// Normales Mob
//--------------------------------------

const int oCMob_bitfield_hitp           = ((1 << 12) - 1) <<  0;
const int oCMob_bitfield_damage         = ((1 << 12) - 1) << 12;
const int oCMob_bitfield_isDestroyed    = ((1 <<  1) - 1) << 24;
const int oCMob_bitfield_moveable       = ((1 <<  1) - 1) << 25;
const int oCMob_bitfield_takeable       = ((1 <<  1) - 1) << 26;
const int oCMob_bitfield_focusOverride  = ((1 <<  1) - 1) << 27;
const int oCMob_bitfield_sndMat         = ((1 <<  3) - 1) << 28; //oTSndMaterial

class oCMob {
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
    
    //Mobeigenschaften:
    var string name;                //zSTRING Symbolischer Name, z.B. "MOBNAME_DOOR"
    
    var int bitfield;

    var string visualDestroyed;     //zSTRING
    
    var string ownerStr;            //zSTRING
    var string ownerGuildStr;       //zSTRING

    var int owner;                  //int
    var int ownerGuild;             //int
                                    
    var int focusNameIndex;         //int //Index des Parsersymbols, dass den Namen enthält, zum Beispiel Index des Symbols MOBNAME_DOOR.

    //zCList<zCVob>     ignoreVobList;
        var int ignoreVobList_data;     //zCVob*
        var int ignoreVobList_next;     //zCList<zCVob>*
};

//--------------------------------------
// Mobinter
//--------------------------------------

const int oCMobInter_bitfield_npcsMax       = ((1 << 8) -1) <<  0;
const int oCMobInter_bitfield_npcsNeeded    = ((1 << 8) -1) <<  8;
const int oCMobInter_bitfield_npcsCurrent   = ((1 << 8) -1) << 16;
const int oCMobInter_bitfield_tmpState      = ((1 << 8) -1) << 24;

class oCMobInter {
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
    
    //oCMob
/*0x104*/      var string _oCMob_name;               
/*0x118*/       var int    _oCMob_bitfield;
/*0x11C*/      var string _oCMob_visualDestroyed;    
/*0x130*/       var string _oCMob_ownerStr;           
/*0x144*/       var string _oCMob_ownerGuildStr;      
/*0x158*/       var int    _oCMob_owner;              
/*0x15C*/       var int    _oCMob_ownerGuild;         
/*0x160*/       var int    _oCMob_focusNameIndex;     
/*0x164*/       var int    _oCMob_ignoreVobList_data; 
/*0x168*/       var int    _oCMob_ignoreVobList_next; 
      
    //oCMobInter:
    
    
    //Optimale Positionen sind wohl die, zu denen der Held bei der Benutzung hinploppt. Ich bin aber kein Animierer, hab wenig Ahnung davon.
    //zCList<TMobOptPos>    optimalPosList; // List of all Optimal Positions
/*0x16C*/      var int optimalPosList_data;      //TMobOptPos*
/*0x170*/      var int optimalPosList_next;      //zCList<TMobOptPos>*
    
    //wohlbekannte Eigenschaften:
/*0x174*/    var string triggerTarget;               //zSTRING
/*0x188*/   var string useWithItem;                 //zSTRING
/*0x19C*/    var string sceme;                       //zSTRING
/*0x1B0*/    var string conditionFunc;               //zSTRING
/*0x1C4*/    var string onStateFuncName;             //zSTRING
    
    //Zustand des Mobs
/*0x1D8*/    var int state;                          //int
/*0x1DC*/    var int state_num;                      //int
/*0x1E0*/    var int state_target;                   //int Zustand auf den gerade "hingearbeitet wird" ?
    
/*0x1E4*/    var int rewind;                         //zBOOL

/*0x1E8*/    var int mobStateAni;                    //int / zTModelAniID
/*0x1EC*/    var int npcStateAni;                    //int / zTModelAniID
    
/*0x1F0*/    var int bitfield; //siehe oben
/*0x1F4*/    var int tmpStateChanged;                //zBOOL
    
/*0x1F8*/    var int Direction;                      //TMobInterDirection "Richtung in die das Mob benutzt wird????", (0 = none, 1 = up, 2 = down)
    
/*0x1FC*/    var int onInterruptReturnToSlotPos;     //zBOOL
    
/*0x200*/    var int startPos[3];                    //zVEC3
/*0x20C*/    var int aniCombHeight;                  //zREAL
/*0x210*/    var int inUseVob;                       //zCVob*
/*0x214*/    var int timerEnd;                       //zREAL
};

//--------------------------------------
// Lockable
//--------------------------------------

const int oCMobLockable_bitfield_locked     = ((1 <<  1) - 1) << 0;
const int oCMobLockable_bitfield_autoOpen   = ((1 <<  1) - 1) << 1;
const int oCMobLockable_bitfield_pickLockNr = ((1 << 30) - 1) << 2;

class oCMobLockable
{
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
    
    //oCMob
      var string _oCMob_name;               
      var int    _oCMob_bitfield;
      var string _oCMob_visualDestroyed;    
      var string _oCMob_ownerStr;           
      var string _oCMob_ownerGuildStr;      
      var int    _oCMob_owner;              
      var int    _oCMob_ownerGuild;         
      var int    _oCMob_focusNameIndex;     
      var int    _oCMob_ignoreVobList_data; 
      var int    _oCMob_ignoreVobList_next; 
      
    //oCMobInter:
      var int _oCMobInter_optimalPosList_data;
      var int _oCMobInter_optimalPosList_next;
      var string _oCMobInter_triggerTarget; 
      var string _oCMobInter_useWithItem;       
      var string _oCMobInter_sceme;         
      var string _oCMobInter_conditionFunc; 
      var string _oCMobInter_onStateFuncName;   
      var int _oCMobInter_state;                
      var int _oCMobInter_state_num;            
      var int _oCMobInter_state_target;     
      var int _oCMobInter_rewind;               
      var int _oCMobInter_mobStateAni;      
      var int _oCMobInter_npcStateAni;      
      var int _oCMobInter_bitfield;
      var int _oCMobInter_tmpStateChanged;
      var int _oCMobInter_Direction;        
      var int _oCMobInter_onInterruptReturnToSlotPos;   
      var int _oCMobInter_startPos[3];              
      var int _oCMobInter_aniCombHeight;                
      var int _oCMobInter_inUseVob;                 
/*0x214*/      var int _oCMobInter_timerEnd;                 
    
    //oCMobLockable  
    
/*0x218*/    var int bitfield;
    
/*0x21C*/    var string keyInstance;     // zSTRING //Schlüsselinstanzname
/*0x230*/    var string pickLockStr;     // zSTRING //linksrechtscombo
}; /*0x244*/

//--------------------------------------
// Door
//--------------------------------------

class oCMobDoor
{
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
    
    //oCMob
      var string _oCMob_name;               
      var int    _oCMob_bitfield;
      var string _oCMob_visualDestroyed;    
      var string _oCMob_ownerStr;           
      var string _oCMob_ownerGuildStr;      
      var int _oCMob_owner;              
      var int _oCMob_ownerGuild;         
      var int _oCMob_focusNameIndex;     
      var int _oCMob_ignoreVobList_data;    
      var int _oCMob_ignoreVobList_next;    
      
    //oCMobInter:
      var int _oCMobInter_optimalPosList_data;
      var int _oCMobInter_optimalPosList_next;
      var string _oCMobInter_triggerTarget; 
      var string _oCMobInter_useWithItem;       
      var string _oCMobInter_sceme;         
      var string _oCMobInter_conditionFunc; 
      var string _oCMobInter_onStateFuncName;   
      var int _oCMobInter_state;                
      var int _oCMobInter_state_num;            
      var int _oCMobInter_state_target;     
      var int _oCMobInter_rewind;               
      var int _oCMobInter_mobStateAni;      
      var int _oCMobInter_npcStateAni;      
      var int _oCMobInter_bitfield;
      var int _oCMobInter_tmpStateChanged;
      var int _oCMobInter_Direction;        
      var int _oCMobInter_onInterruptReturnToSlotPos;   
      var int _oCMobInter_startPos[3];              
      var int _oCMobInter_aniCombHeight;                
      var int _oCMobInter_inUseVob;                 
      var int _oCMobInter_timerEnd;                 
    
    //oCMobLockable  
      var int _oCMobLockable_bitfield;
      var string _oCMobLockable_keyInstance;
     var string _oCMobLockable_pickLockStr;
    
    //oCMobDoor
 /*0x244*/   var string addName;         // zSTRING // FRONT / BACK
}; /*0x258*/

//--------------------------------------
// Container
//--------------------------------------

class oCMobContainer
{
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
    
    //oCMob
      var string _oCMob_name;               
      var int    _oCMob_bitfield;
      var string _oCMob_visualDestroyed;    
      var string _oCMob_ownerStr;           
      var string _oCMob_ownerGuildStr;      
      var int    _oCMob_owner;              
      var int    _oCMob_ownerGuild;         
      var int    _oCMob_focusNameIndex;     
      var int    _oCMob_ignoreVobList_data; 
      var int    _oCMob_ignoreVobList_next; 
      
    //oCMobInter:
      var int _oCMobInter_optimalPosList_data;
      var int _oCMobInter_optimalPosList_next;
      var string _oCMobInter_triggerTarget; 
      var string _oCMobInter_useWithItem;       
      var string _oCMobInter_sceme;         
      var string _oCMobInter_conditionFunc; 
      var string _oCMobInter_onStateFuncName;   
      var int _oCMobInter_state;                
      var int _oCMobInter_state_num;            
      var int _oCMobInter_state_target;     
      var int _oCMobInter_rewind;               
      var int _oCMobInter_mobStateAni;      
      var int _oCMobInter_npcStateAni;      
      var int _oCMobInter_bitfield;
      var int _oCMobInter_tmpStateChanged;
      var int _oCMobInter_Direction;        
      var int _oCMobInter_onInterruptReturnToSlotPos;   
      var int _oCMobInter_startPos[3];              
      var int _oCMobInter_aniCombHeight;                
      var int _oCMobInter_inUseVob;                 
      var int _oCMobInter_timerEnd;                 
    
    //oCMobLockable  
      var int _oCMobLockable_bitfield;
      var string _oCMobLockable_keyInstance;
      var string _oCMobLockable_pickLockStr;
    
    //oCMobContainer
/*0x258*/    var string contains;                //zSTRING //Scriptinstanzen der Items. Nicht aktuelle gehalten! Original Spacereinstellung!
    
 /*0x26C*/   var int items;                      //oCItemContainer*
    //zCListSort<oCItem>    containList; //sollte die richtigen Daten beinhalten
/*0x270*/      var int containList_compareFunc;          //int (*Compare)(oCItem *ele1,oCItem *ele2);
/*0x274*/      var int containList_data;                 //oCItem*           
/*0x278*/      var int containList_next;                 //zCListSort<oCItem>*
};/*0x27C*/

class oCMobFire {
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
    
    //oCMob
      var string _oCMob_name;               
      var int    _oCMob_bitfield;
      var string _oCMob_visualDestroyed;    
      var string _oCMob_ownerStr;           
      var string _oCMob_ownerGuildStr;      
      var int    _oCMob_owner;              
      var int    _oCMob_ownerGuild;         
      var int    _oCMob_focusNameIndex;     
      var int    _oCMob_ignoreVobList_data; 
      var int    _oCMob_ignoreVobList_next; 
      
    //oCMobInter:
      var int _oCMobInter_optimalPosList_data;
      var int _oCMobInter_optimalPosList_next;
      var string _oCMobInter_triggerTarget; 
      var string _oCMobInter_useWithItem;       
      var string _oCMobInter_sceme;         
      var string _oCMobInter_conditionFunc; 
      var string _oCMobInter_onStateFuncName;   
      var int _oCMobInter_state;                
      var int _oCMobInter_state_num;            
      var int _oCMobInter_state_target;     
      var int _oCMobInter_rewind;               
      var int _oCMobInter_mobStateAni;      
      var int _oCMobInter_npcStateAni;      
      var int _oCMobInter_bitfield;
      var int _oCMobInter_tmpStateChanged;
      var int _oCMobInter_Direction;        
      var int _oCMobInter_onInterruptReturnToSlotPos;   
      var int _oCMobInter_startPos[3];              
      var int _oCMobInter_aniCombHeight;                
      var int _oCMobInter_inUseVob;                 
      var int _oCMobInter_timerEnd;
	
	//oCMobFire
/*0x218*/ 	var string fireSlot;		//zSTRING: z.B: "BIP01 FIRE"
/*0x22C*/	var string fireVobtreeName; //zSTRING: z.B. "FIRETREE_MEDIUM.ZEN"
	
/*0x240*/	var int fireVobtree;		//zCVob*
};/*0x244*/