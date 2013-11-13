/****************************************************\
 * ENGINEHOOKS                                      *
 * Dieses kleine Paket erlaubt Daedalusfunktionen   *
 * an Enginefunktionen zu hängen und somit Zugriff  *
 * auf bestimmte Vorgänge außerhalb der Scripte zu  *
 * bekommen.                                        *
 * Beispiel: Man könnte einen Hook an die Speicher- *
 * funktion der Engine setzen und damit strings die *
 * regulär nicht gespeichert werden noch schnell in *
 * bspw. den Namen eines zCVob legen um sie zu be-  *
 * halten.                                          *
\****************************************************/

//-------------------
// OPCODES
//-------------------
/* 1 Byte */
const int ASMINT_OP_pusha       = 96;    //0x60
const int ASMINT_OP_popa        = 97;    //0x61
const int ASMINT_OP_movMemToEAX = 161;     //0xA1
/* 2 Byte */
const int ASMINT_OP_movECXtoEAX = 49547; //0xC18B
const int ASMINT_OP_movESPtoEAX = 50315; //0xC48B
const int ASMINT_OP_movESItoEAX = 50827; //0xC68B
const int ASMINT_OP_movEAXtoECX = 49545; //0xC189
const int ASMINT_OP_movEBXtoEAX = 55433; //0xD889
const int ASMINT_OP_movEBPtoEAX = 50571; //0xC58B

//-------------------
// KONSTANTEN
//-------------------
const int parser            = ContentParserAddress; //0xAB40C0 zCParser
const int zParser__CallFunc = 7247504;  //0x6E9690  CallFunc(int,...)

//-------------------
// Hooks varibles
//-------------------
var int HookEngine_Hook_PreUnconscious_JmpAdress; //Where jmp adress is placed rite now;
var int HookEngine_Hook_PreDropVob_JmpAdress; 
var int HookEngine_Hook_PreRenderVobList_JmpAdress;
var int HookEngine_Hook_LeftWeaponTrail_JmpAdress;

var int HookTesting;

var string HooksReinited;

//-------------------
// RÜCKGABEVARIABLEN
//-------------------
var int EAX;
func int GetEAX() { return EAX; };
func int EAXAdr() {
    GetEAX();
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};
var int ECX;
func int GetECX() { return ECX; };
func int ECXAdr() {
    GetECX();
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};
var int ESP;
func int GetESP() { return ESP; };
func int ESPAdr() {
    GetESP();
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};

var int EBX;
func int GetEBX() { return EBX; };
func int EBXAdr() {
    GetEBX();
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};    

var int EBP;
func int GetEBP() { return EBP; };
func int EBPAdr() {
    GetEBP();
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};  

var int ESI;
func int GetESI() { return ESI; };
func int ESIAdr() {
    GetESI();
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};  


/*============================*
/* HOOKENGINE                 *
/*============================*
 - address:       Addresse einer Enginefunktion an die die Funktion angehängt werden soll.
 - oldInstr:      Die Länge in Bytes der Anweisung die an 'address' zu finden ist, mindestens 5 Bytes (Notfalls nächste Zeile noch mitnehmen). 
                Kann zB. in IDA nachgesehen werden.
 - function:       Die Daedalusfunktion die aufgerufen werden soll.
*/
const int SKIP_INSTR = 0;
const int COPY_INSTR = 1;
func int HookEngine(var int address, var int oldInstr, var string function,var int skipInstr) {
    var int SymbID;   // Symbolindex von 'function'
    var int ptr;      // Pointer auf den Zwischenspeicher der alten Anweisung
    var int relAdr;   // Relative Addresse zum neuen Assemblercode, ausgehend von 'address'
	var int HookEngine_JmpAdr;
    // ----- Sicherheitsabfragen -----
    if(oldInstr < 5) {
        PrintDebug("HOOKENGINE: oldInstr ist zu kurz. Es werden mindestens 5 Bytes erwartet.");
        return -1;
    };

    SymbID = MEM_FindParserSymbol(function);
    if(!SymbID) {
        PrintDebug("HOOKENGINE: Die gegebene Daedalusfunktion kann nicht gefunden werden.");
        return -1;
    };

    MemoryProtectionOverride (address, oldInstr+3);
    // ----- Eventuell geschützen Speicher behandeln -----

    // ----- Die alte Anweisung sichern -----
    ptr = MEM_Alloc(oldInstr);
    MEM_CopyBytes(address, ptr, oldInstr);

    // ----- Einen neuen Stream für den Assemblercode anlegen -----
    ASM_Open(100 + oldInstr);

    // ----- Jump aus der Enginefunktion in den neuen Code einfügen -----
    relAdr = ASMINT_CurrRun-address-5;
    MEM_WriteInt(address + 0, 233);
    MEM_WriteInt(address + 1, relAdr);

    // ----- Neuen Assemblercode verfassen -----
  
    // Alle Register sichern
    
    // EAX in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movEAXToMem);
    ASM_4(EAXAdr());
    ASM_1(ASMINT_OP_pusha);

    // ECX in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movECXtoEAX);
    ASM_2(ASMINT_OP_movEAXToMem);
    ASM_4(ECXAdr());

    // ESP in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movESPtoEAX);
    ASM_2(ASMINT_OP_movEAXToMem);
    ASM_4(ESPAdr());
    
    // EBX in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movEBXtoEAX);
    ASM_2(ASMINT_OP_movEAXtoMem);
    ASM_4(EBXAdr());

    // EBP in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movEBPtoEAX);
    ASM_2(ASMINT_OP_movEAXtoMem);
    ASM_4(EBPAdr());

    // ESI in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movESItoEAX);
    ASM_2(ASMINT_OP_movEAXtoMem);
    ASM_4(ESIAdr());
    // --- Daedalusfunktion aufrufen ---

    ASM_1(ASMINT_OP_pushIm);
    ASM_4(SymbID);

    ASM_1(ASMINT_OP_pushIm);
    ASM_4(parser);

    ASM_1(ASMINT_OP_call);
    ASM_4(zParser__CallFunc-ASM_Here()-4);

    ASM_2(ASMINT_OP_addImToESP);
    ASM_1(8);

    ASM_1(ASMINT_OP_popa);
    
    ASM_1(ASMINT_OP_movMemToEAX);
    ASM_4(ECXAdr());
    ASM_2(ASMINT_OP_movEAXtoECX);
    
    ASM_1(ASMINT_OP_movMemToEAX);
    ASM_4(EAXAdr());

    // Alte Anweisung wieder einfügen
    if(skipInstr == COPY_INSTR)
    {
    MEM_CopyBytes(ptr, ASMINT_Cursor, oldInstr);
    //printdebug_s_i("HOOKENGINE: ASMINT_Cursor(oldinstr):",ASMINT_Cursor);
    ASMINT_Cursor += oldInstr;
    };
    MEM_Free(ptr);

    // Engine function to return
    ASM_1(ASMINT_OP_pushIm);
    HookEngine_JmpAdr = ASMINT_Cursor;
    ASM_4(address + oldInstr);   
    ASM_1(ASMINT_OP_retn);
    ASM_Close();
    return HookEngine_JmpAdr;
};