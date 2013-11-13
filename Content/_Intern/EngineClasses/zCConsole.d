const int zCON_MAX_EVAL = 15;
const int zCon_address  = 9291168; //0x8DC5A0

class zCConsole {
    var int _vtbl; //8251748
    
	var string id;       //zSTRING
	var string instr;    //zSTRING
	var string savemsg;  //zSTRING
	
    //In G1 there is only one command stored im memory
    var string lastcommand;         //zString
       // var int lastcommand_numAlloc;      //int
       // var int lastcommand_numInArray;    //int
        
	var int	    lastCommandPos;

	var int px; var int py;//0x60
	var int lx; var int ly;//0x68
	

	//Two vars at this range don't exist if I'm right
	var int showmax; var int skip;
	var int dynsize;       //zBOOL 0x74
	
    var int _var;          //zBOOL 
	var int autocomplete; //zBOOL
	//end
	
	//zList <zCConDat>	list;
        var int compare;            //int (*Compare)(const zCConDat* ele1,const zCConDat* ele2);
        var int count;              //int
        var int last;               //zCConDat*
        var int wurzel;             //zCConDat*
        
	var int conview; //zCView*

	var int	evalcount; //0x8C 
    var int evalfunc[zCON_MAX_EVAL]; //zBOOL (*evalfunc[])  ( const zSTRING &s, zSTRING &msg )
	var int changedfunc;             //void	 (*changedfunc)	( const zSTRING &s ) 0xCC
	
	var int world;        //zCWorld*	0xD0 Sure of this one
	var int cparser;      //zCParser*	
	var int edit_index;   //int			
	var int edit_adr;     //void*		
	//I've don't checked size of this class, it might have more vars down here
};