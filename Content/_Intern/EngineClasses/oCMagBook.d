//******************************************************************************
//                                                                            
//                                   oCMagBook                                 
//      
//	Gothic 1.08k version (experimental, much of pointers are still unknown
//                                                                    
//******************************************************************************

class oCMag_Book {
    //zCArray    <oCSpell*>   spells;
        var int spells_array;
        var int spells_numAlloc;
        var int spells_numInArray;
    //zCArray    <oCItem*>    spellitems;
        var int spellitems_array;
        var int spellitems_numAlloc;
        var int spellitems_numInArray;
    
    var int wld;                //zCWorld*    
    var int owner;              //zCVob*      
    var int model;              //zCModel*    //model of the owner (seems to be kind of redundant)
    var int spellnr;            //int         //selected spell
    var int MAG_HEIGHT;         //zREAL       //some offset to shift the spell above the head of the owner (for spell choosing)
    var int active;             //zBOOL       //unused??
    var int remove_all;         //zBOOL       //some internal stuff?
    var int in_movement;        //zBOOL       //currently rotating the spells above the player head?
    var int show_handsymbol;    //zBOOL       //?
    var int step;               //zREAL       //if n spells are in the mag book this is 360/n 
    var int action;             //int         //internal
    var int UNUSED;             //int         //
    var int open;               //zBOOL       //currently showing mag book (cirlce above player head)?
    var int open_delay_timer;   //zREAL       //used for delaying the time until the rune turns into a pfx
    var int show_particles;     //zBOOL       //currently rendering the spell above the player head as a pfx?
    var int targetdir;          //zREAL       //used for turning the spellbook over time when player pressed "left" or "right"
    var int t1;                 //zREAL       // - " -
    var int targetpos[3];       //zVEC3       //used for popping out the magbook (from the hips) and closing it again.
    var int startpos[3];        //zVEC3       // - " -

    var int nextRegister;       //int         //not sure. Something with key assignment?
    var int keys;               //int         //bitfield. If key n \in {0, 1, ..., 9} is used, keys & (1 << n) is true.
};