//######################################################
//
//  Game
//
//  oCItem Gothic II 2.60(fix) version                             
//
// zCVob part need to be corected (copypasta from oCNpc)
// I guess end part need corections too.
//######################################################
class oCItem {
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
        var float     _zCVob_visualAlpha;
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
  
// Für alle Items
/*0x100*/	VAR INT		id								;				
/*0x104*/	VAR STRING  name,nameID						;
/*0x12C*/	VAR INT		hp,hp_max						;

/*0x134*/	VAR INT     mainflag,flags					;		//	Hauptflag und weitere Flags
/*0x13C*/	VAR INT		weight,value					;			
															
	// Für Waffen								
/*0x144*/	VAR INT		damageType						;		//	Welche Schadensarten
/*0x148*/	VAR	INT		damageTotal						;	//
/*0x14C*/	VAR INT		damage			[DAM_INDEX_MAX]	;

	// Für Rüstungen
	VAR INT		wear							;
	VAR INT		protection		[PROT_INDEX_MAX];

	// Für Nahrung
/*0x190*/	VAR INT		nutrition						;		//	HP-Steigerung bei Nahrung

	// Benötigte Attribute zum Benutzen des Items
/*0x194*/	VAR INT		cond_atr		[3]				;
/*0x1A0*/	VAR INT		cond_value		[3]				;

	// Attribute, die bei anlegen des Items verändert werden
/*0x1AC*/	VAR INT		change_atr		[3]				;
/*0x1B8*/VAR INT		change_value	[3]				;

	// Parserfunktionen
/*0x1C4*/	VAR int 	magic							;		//	Parserfunktion zum "Magie Header"
/*0x1C8*/	VAR int 	on_equip						;		//	Parserfunktion, wenn Item equipped wird.
/*0x1CC*/	VAR int 	on_unequip						;		//	Parserfunktion, wenn Item unequipped wird.
/*0x1D0*/	VAR int 	on_state		[4]				;		//	
															
	// Besitzer									
/*0x1E0*/	VAR int 	owner							;		//	Besitzer : Instanz-Name
/*0x1E4*/	VAR INT		ownerGuild						;		//	Besitzer : Gilde
/*0x1E8*/	VAR INT		disguiseGuild					;		//	Zur Schau getragene Gilde durch Verkleidung

	// Die 3DS-Datei
/*0x1EC*/	VAR STRING	visual							;

	// Veränderung des NSC-Meshes beim Anlegen dieses Gegenstandes
/*0x200*/	VAR STRING  visual_change					;		//	ASC - File
/*0x21C*/	VAR STRING  effect;								//	Effekt Instanz

/*0x220*/	VAR INT		visual_skin						;
	
/*0x224*/	VAR STRING 	scemeName						;
/*0x238*/	VAR INT		material						;	
	// VAR STRING	pfx								;		//	Magic Weapon PFX
/*0x23C*/	VAR INT		munition						;		//	Instance of Munition
															
/*0x240*/	var int 	spell							;			
/*0x244*/	var int		range							;			
	
/*0x23C*/	var int		mag_circle						;
	
/*0x240*/	VAR STRING	description						;
/*0x254*/	VAR STRING	text			[ITM_TEXT_MAX]	;
	VAR INT		count			[ITM_TEXT_MAX]	;
	
// 	// inventory darstellungs geschichten, wird nur benutzt, falls von 0 abweichend
// 	var int	    inv_zbias;								//  wie weit ist das item im inventory richtung far plane verschoben (integer scale 100=1)
// 	var	int		inv_rotx;								//  wieviel grad um die x achse ist das item im inv gedreht
// 	var int 	inv_roty;								//  wieviel grad um die y achse ist das item im inv gedreht
// 	var int 	inv_rotz;								//  wieviel grad um die z achse ist das item im inv gedreht
// 	var int 	inv_animate;							//  soll das item in inv rotiert werden

/*0x2E4*/	var int amount;							//int Wieviele Items sind das (Itemstapel)
/*0x2E8*/	var int instanz;						//int Symbolindex
	var int c_manipulation;					//int ?
	var int last_manipulation;				//zREAL ?
	var int magic_value;					//int ?
	var int effectVob;						//oCVisualFX*
	var int next;							//oCItem* sind wohl einfach verkettete Listen.
};				