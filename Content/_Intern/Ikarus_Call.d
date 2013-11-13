// // Before each example:
// CALL_Init();

// / * Example 1: hero-> SetFightRangeBase (42) A simple setter is called, nothing exciting *. Afterwards is hero.fightRangeBase / changed.
// CALL_PushIntParam (42);
// CALL__thiscall (MEM_InstToPtr (hero), oCNpc__SetFightRangeBase_adr);

// / * Example 2: npc-> AI_UnreadySpell () * acts on the NPC as AI_RemoveWeapon (NPC), * /

// CALL__thiscall (MEM_InstToPtr (Falgo), oCNpc__AI_UnreadySpell_adr);

// / * Example 3: npc-> SetAsPlayer () * Same effect as when you press O with NPC in focus * /
// CALL__thiscall (MEM_InstToPtr (Falgo), oCNpc__SetAsPlayer);

// / * Example 4: MEM_Game-> SetAsPlayer (EX_VLK_5076_FALGO_CITY "); * Same effect as in Example 3 demonstrated that string transfer works. * /

// CALL_PushStringParam ("EX_VLK_5076_FALGO_CITY");
// CALL__thiscall (MEM_InstToPtr (MEM_Game), oCGame__SetAsPlayer);

const int oCNPC_DoDie_adr = 6894752; //ocnpc attacker
const int oCNPC_DropUnconscious_adr = 6892560; //float,ocnpc
const int oCNpc_EV_Unconscious_adr = 7014236; //char c
const int oCNpc_ExchangeTorch_adr = 6907456; //void


var C_NPC CALLINT_SymbolBeforeCodepool;
var int CALLINT_Codepool[4095]; //hierein wird assembler code geschrieben
func void CALLINT_GenericExternal() {}; //wird zu einer External gemacht, die Code im Codepool aufruft.
func void CALLINT_callgenericExternal() { //soll die genericExternal aufrufen.

	//
	//Apply_Options_Game() menu
    Doc_Create(); //wird durch call an generic External ersetzt.
};

var zCPar_Symbol CALLINT_GenericExternal_Sym;

var int CALLINT_CODEPOOL_SYMBOLINDEX           ;
var int CALLINT_GENERICEXTERNAL_SYMBOLINDEX    ;
var int CALLINT_CALLGENERICEXTERNAL_SYMBOLINDEX;

var int CALLINT_cpStart;
var int CALLINT_cpCurrEntryOffset;
var int CALLINT_cpCursorOffset;

var int CALL_result;
func int CALL_GetResult() {
    return CALL_result;
};
var int CALL_result_adr;

const int CALLINT_OP_movImToECX   = 185;  //0xB9
const int CALLINT_OP_pushIm       = 104;  //0x68
const int CALLINT_OP_call         = 232;  //0xE8
const int CALLINT_OP_movEAXToMem  = 1417; //0x0589
const int CALLINT_OP_retn         = 195;  //0xC3

func zCPar_Symbol CALLINT_GetSymbol (var int index) {
    var zCPar_Symbol result;
    result = MEM_PtrToInst (MEM_ReadIntArray (currSymbolTableAddress, index));
    MEMINT_StackPushInst (result);
};

func void CALL_Init() {

	 MEM_InitAll(); //mindestens der Parser muss initialisiert sein
    CALLINT_CODEPOOL_SYMBOLINDEX            = CALLINT_SymbolBeforeCodepool + 1;
    CALLINT_GENERICEXTERNAL_SYMBOLINDEX     = CALLINT_SymbolBeforeCodepool + 2;
    CALLINT_CALLGENERICEXTERNAL_SYMBOLINDEX = CALLINT_SymbolBeforeCodepool + 3;

    //Pointer auf Codepool muss stehen
    var zCPar_Symbol sym;
    sym = CALLINT_GetSymbol (CALLINT_CODEPOOL_SYMBOLINDEX);
    CALLINT_cpStart = sym.content;
    
    //genericExternal muss External Symbol sein
    CALLINT_GenericExternal_Sym = CALLINT_GetSymbol (CALLINT_GENERICEXTERNAL_SYMBOLINDEX);
    CALLINT_GenericExternal_Sym.bitfield = zPAR_TYPE_FUNC | zPAR_FLAG_EXTERNAL | zPAR_FLAG_CONST;
    
    //callgenericExternal muss genericExternal aufrufen.
    sym = CALLINT_GetSymbol (CALLINT_CALLGENERICEXTERNAL_SYMBOLINDEX);
    MEM_WriteInt (currParserStackAddress + sym.content + 1, CALLINT_GENERICEXTERNAL_SYMBOLINDEX);
    
    //Adresse von CALL_result holen:
    CALL_GetResult();
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
    CALL_result_adr = MEMINT_PopInt();
};

func void CALL_PushIntParam(var int param) {
    //************************************************
    //   push param
    //************************************************
    
    MEM_WriteInt (CALLINT_cpStart + CALLINT_cpCursorOffset, CALLINT_OP_pushIm);
   CALLINT_cpCursorOffset += 1;
	MEM_WriteInt (CALLINT_cpStart + CALLINT_cpCursorOffset, param);
   CALLINT_cpCursorOffset += 4;
};

func void CALL_PushStringParam (var string param) {
    //Absolut unzureichend: Niemals kann mehr als ein String gepusht werden.
    CALL_PushIntParam (STRINT_GetStringAddress (param));
};

func void CALL__stdcall (var int adr) {
    //************************************************
    //   Der Call selbst:
    //************************************************
     printdebug("STDCALL:Checkpoint 1");   
    MEM_WriteInt (CALLINT_cpStart + CALLINT_cpCursorOffset, CALLINT_OP_call);
    CALLINT_cpCursorOffset += 1;
    //Vorsicht: Call ist relativ!
     printdebug("STDCALL:Checkpoint 2");   
    MEM_WriteInt (CALLINT_cpStart + CALLINT_cpCursorOffset, adr - CALLINT_cpStart - CALLINT_cpCursorOffset - 4); //-4 weil relativ zum Ende der Instruktion gemessen wird.
    CALLINT_cpCursorOffset += 4;

    //************************************************
    //   Ergebnis in Ergebniswert schieben
    //************************************************
     printdebug("STDCALL:Checkpoint 3");   
    
    MEM_WriteInt (CALLINT_cpStart + CALLINT_cpCursorOffset, CALLINT_OP_movEAXToMem);
    CALLINT_cpCursorOffset += 2;
     printdebug("STDCALL:Checkpoint 4");   
    MEM_WriteInt (CALLINT_cpStart + CALLINT_cpCursorOffset, CALL_result_adr);
    CALLINT_cpCursorOffset += 4;
    
    //************************************************
    //   return
    //************************************************
     printdebug("STDCALL:Checkpoint 5");   
    
    MEM_WriteInt (CALLINT_cpStart + CALLINT_cpCursorOffset, CALLINT_OP_retn);
    CALLINT_cpCursorOffset += 1;
      printdebug("STDCALL:Checkpoint 5.3");   
   
    //************************************************
    //   Jetzt gehts los:
    //************************************************
    
    CALLINT_GenericExternal_Sym.content = CALLINT_cpStart + CALLINT_cpCurrEntryOffset;
      printdebug("STDCALL:Checkpoint 5.6");   
    
    CALLINT_callgenericExternal();
     printdebug("STDCALL:Checkpoint 6");   
    
    //Fürs nächste mal:
    CALLINT_cpCurrEntryOffset = CALLINT_cpCursorOffset;
    
    if (CALLINT_cpCursorOffset > 3800) {
        //3800 byte vollgeschrieben: Zurück auf los:
        CALLINT_cpCursorOffset = 0;
        CALLINT_cpCurrEntryOffset = 0;
    };
};

func void CALL__thiscall (var int this, var int adr) {
    //code zum setzen von ECX setzen, dann normaler Call:
    
    if(this<=0){         MEM_Warn ("THIS in this call is 0 or less!!!"); return;};
    if(adr<=0){         MEM_Warn ("ADR in this call is 0 or less!!!");return;};
    //************************************************
    //   ecx <- this
    //************************************************
     printdebug("TCALL:Checkpoint 1");   
    MEM_WriteInt (CALLINT_cpStart + CALLINT_cpCursorOffset, CALLINT_OP_movImToECX);
    CALLINT_cpCursorOffset += 1;
     printdebug("TCALL:Checkpoint 2");   
    MEM_WriteInt (CALLINT_cpStart + CALLINT_cpCursorOffset, this);
    CALLINT_cpCursorOffset += 4;
    CALL__stdcall (adr);
};