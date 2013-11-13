//######################################################
//
//  zCZoneZFog
//
//	Gothic I 1.08k
//	Untested
//######################################################

class zCZoneZFog {  
//class zCZoneZFogDefault { //beide Klassen vom Speicherbild identisch
 //  zCVob {    -fixed -orc	June 01, 2010  
//      zCObject {
            var int    vfptr;
            var int    _zCObject_refCtr;
            var int    _zCObject_hashIndex;
            var int    _zCObject_hashNext;
            var string _zCObject_objectName;
//      }
        var int        _zCVob_globalVobTreeNode;
        var int        _zCVob_lastTimeDrawn;
        var int        _zCVob_lastTimeCollected;
        var int        _zCVob_vobLeafList_array;
        var int        _zCVob_vobLeafList_numAlloc;
        var int        _zCVob_vobLeafList_numInArray;
        var int        _zCVob_trafoObjToWorld[16];
        var int        _zCVob_bbox3D_mins[3];
        var int        _zCVob_bbox3D_maxs[3];
        var int        _zCVob_touchVobList_array;
        var int        _zCVob_touchVobList_numAlloc;
        var int        _zCVob_touchVobList_numInArray;
        var int        _zCVob_type;
        var int        _zCVob_groundShadowSizePacked;
        var int        _zCVob_homeWorld;
        var int        _zCVob_groundPoly;
        var int        _zCVob_callback_ai;
        var int        _zCVob_trafo;
        var int        _zCVob_visual;
        var float      _zCVob_visualAlpha;
        var int        _zCVob_rigidBody;
        var int        _zCVob_lightColorStat;
        var int        _zCVob_lightColorDyn;
        var int        _zCVob_lightDirectionStat[3];
        var int        _zCVob_vobPresetName;
        var int        _zCVob_eventManager;
        var int        _zCVob_nextOnTimer;
        var int        _zCVob_vob_bitfield[5];
        var int        _zCVob_m_poCollisionObjectClass;
        var int        _zCVob_m_poCollisionObject;
        

    //zCZone
        var int     _zCZone_world;      //zCWorld*  0x0100
    
    //zCZoneZFog, Eigenschaften aus dem Spacer bekanntrrun scripts
    
    var int fogRangeCenter;  //zREAL  0x0104  
    var int innerRangePerc;  //zREAL     
    var int fogColor;        //zCOLOR   
    //not in g1!
    //var int bFadeOutSky;     //zBOOL     
   //	var int bOverrideColor;  //zBOOL     
};