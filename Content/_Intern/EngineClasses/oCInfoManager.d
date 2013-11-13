class oCInfoChoice
{
    var int Text    ;   //zSTRING 
    var int Function;   //int     //symbolindex    
};

//----------------------------------
//  oCInfo
//----------------------------------

/* Große Vorsicht!

Im Gegensatz zu C_NPC und C_ITEM zeigt eine C_INFO nicht auf den vergrößerten
Speicherbereich, sondern tatsächlich auf sich selbst.
MEM_InstGetOffset liefert also, auf eine C_INFO angewendet NICHT die Adresse
des umrahmenden oCInfo Objekts sondern die Adresse der enthaltenen C_INFO zurück.
Um an die oCInfo zu kommen müssen 4 + 4 + 20 = 28 abgezogen werden! */


class oCInfo {
    //Achtung: Nur "name" und "told" wandert in ein Savegame!
    
    var int _vtbl;                  //Methodentabelle

    var int next;                   //oCInfo*
    var string name;                //zSTRING

    //Wohlbekannt:
    //struct Tpd {
        var int npc         ;       //int
        var int nr          ;       //int
        var int important   ;       //zBOOL   
        var int conditions  ;       //int   
        var int information ;       //int   
        var string description ;       //zSTRING
        var int trade       ;       //zBOOL   
        var int permanent   ;       //zBOOL   
    //} pd;

    var int told        ;           //zBOOL  //schonmal abgespielt (das was Npc_KnowsInfo abfragt)
    var int _instance   ;           //int    //symbolindex der oCInfo im Parser.
    
    //Choices:
    //zCList< oCInfoChoice > listChoices;
        var int listChoices_data;   //oCInfoChoice*
        var int listChoices_next;   //zCList< oCInfoChoice >*
};

class oCInfoManager {
/*0x00*/    var int _vtbl;                  //Zeiger auf Methodentabelle                                            
    
    //Liste aller oCInfos. Geordnet nach...? Müsste man mal nachschauen.
    //zCListSort< oCInfo > infoList;    
/*0x04*/         var int infoList_compare;   //int (*Compare)(oCInfo *ele1,oCInfo *ele2);
/*0x08*/         var int infoList_data;      //oCInfo*
/*0x0C*/         var int infoList_next;      //zCList< oCInfo >*
        
    //Parser.
/*0x10*/     var int p;                      //zCParser*
};

class oCInformationManager 
{
	/*
	typedef
	enum zEInformationManagerMode
	{
		INFO_MGR_MODE_IMPORTANT	,
		INFO_MGR_MODE_INFO		,
		INFO_MGR_MODE_CHOICE	,
		INFO_MGR_MODE_TRADE
	}
	zTInfoMgrMode; */

/*0x00*/	var string LastMethod			;  //zSTRING				         
/*0x14*/	var int DlgStatus				;  //zCViewDialogChoice*	//das sind Views. Das heißt vermutlich nur Anzeige
/*0x18*/	var int DlgTrade				;  //ocViewDialogTrade*	    //das sind Views. Das heißt vermutlich nur Anzeige
/*0x1C*/	var int DlgChoice				;  //zCViewDialogChoice*	//das sind Views. Das heißt vermutlich nur Anzeige
/*0x20*/	var int Npc						;  //oCNpc*				          
/*0x24*/	var int Player					;  //oCNpc*				          
/*0x28*/	var int Info					;  //oCInfo*				         
/*0x2C*/	var int IsDone					;  //zBOOL				  //== InfoManager_HasFinished         
/*0x30*/	var int IsWaitingForEnd			;  //zBOOL				           
/*0x34*/	var int IsWaitingForScript		;  //zBOOL				           
/*0x38*/	var int IsWaitingForOpen		;  //zBOOL				           
/*0x3C*/	var int IsWaitingForClose		;  //zBOOL				           
/*0x40*/	var int IsWaitingForSelection	;  //zBOOL				           
/*0x44*/	var int MustOpen				;  //zBOOL				           
/*0x48*/	var int IndexBye				;  //int					            
/*0x4C*/	var int ImportantCurrent		;  //int					            
/*0x50*/	var int ImportantMax			;  //int					            
/*0x54*/	var int Mode					;  //zTInfoMgrMode		     
};