//######################################################
//
//  Ikarus Scriptpaket
//
//######################################################



INSTANCE MEM_HELPER_INST (C_NPC)
{
    name = MEM_HELPER_NAME;
    id = 42;
    
    /* unsterblich: */
    flags = 2;
    attribute   [ATR_HITPOINTS_MAX] = 2;
    attribute   [ATR_HITPOINTS]     = 2;
    
    /* irgendein Visual: */
    Mdl_SetVisual           (self,  "meatbug.mds");
};

//######################################################
//
//  Fehler
//
//######################################################

func void MEM_Error(var string error) {
    error = ConcatStrings ("># ERROR: ", error);
    
    if (MEM_PrintErrOnScreen) { Print      (error); };
    if (MEM_PrintErrOnDebug)  { PrintDebug (error); };
};

func void MEM_Warn(var string warn) {
    warn = ConcatStrings ("Warning: ", warn);
    
    if (MEM_PrintWarnOnScreen) { Print      (warn); };
    if (MEM_PrintWarnOnDebug)  { PrintDebug (warn); };
};

func void MEM_Info(var string info) {
    if (MEM_PrintInfoOnDebug)  { PrintDebug(info);  };
};

func void MEM_AssertFail (var string assertFailText) {
    assertFailText = ConcatStrings ("Sektis fault! Report this: ", assertFailText);
    MEM_Error (assertFailText);
};

//######################################################
//
//  Parser Data Stack Hacking
//
//######################################################

class MEMINT_HelperClass {};
var MEMINT_HelperClass MEMINT_INSTUNASSIGNED;
var MEMINT_HelperClass MEMINT_PopDump;

func int MEMINT_StackPushInt (var int val) {
    return val + 0;
};

//Vorsicht: Referenz wird gepusht!
func string MEMINT_StackPushString (var string val) {
    return val;
};

func MEMINT_HelperClass MEMINT_StackPopInstSub () {};
func void MEMINT_StackPopInst () {
    MEMINT_PopDump = MEMINT_StackPopInstSub();
};

func int MEMINT_StackPushInst (var int val) {
    MEMINT_StackPushInt (val);
    MEMINT_StackPopInst();
};

func void MEMINT_StackPushVar (var int adr) {
    MEMINT_StackPushInst (adr);
    MEMINT_StackPushInst (zPAR_TOK_PUSHVAR);
};

//Alternative Formulierungen:
func int    MEMINT_PopInt() {};
func string MEMINT_PopString() {};
func int    MEMINT_StackPopInt() {};
func string MEMINT_StackPopString() {};

//#################################################################
//
//  MEM_Helper
//
//#################################################################

var oCNpc MEM_Helper;

func void MEMINT_GetMemHelper() {
    MEM_Helper = Hlp_GetNpc (MEM_HELPER_INST);
    
    if (!Hlp_IsValidNpc (MEM_Helper)) {
        //self zwischenspeichern
        var C_NPC selfBak;
        selfBak = Hlp_GetNpc (self);
        Wld_InsertNpc (MEM_HELPER_INST, MEM_FARFARAWAY);
        MEM_Helper = Hlp_GetNpc (self);
        self = Hlp_GetNpc (selfBak);
    };
};

//######################################################
//
//  Elementare Read-Write Operationen
//
//######################################################

//--------------------------------------
// Lesen mit Parser-Data-Stack-Hacking
//--------------------------------------

func int MEM_ReadInt (var int address) {
    if (address <= 0) {
        MEM_Error (ConcatStrings ("MEM_ReadInt: Invalid address: ", IntToString (address)));
        return 0;
    };
    
    MEMINT_StackPushVar (address);
    MEMINT_StackPushInt (MEMINT_StackPopInt()); //als int nicht als var auf dem Stack
};

func int MEM_ReadIntUnsave (var int address) {
    
    MEMINT_StackPushVar (address);
    MEMINT_StackPushInt (MEMINT_StackPopInt()); //als int nicht als var auf dem Stack
};


func string MEM_ReadString (var int address) {
    if (address <= 0) {
        MEM_Error (ConcatStrings ("MEM_ReadString: Invalid address: ", IntToString (address)));
        return "";
    };
    
    MEMINT_StackPushVar (address);
};

//--------------------------------------
// Assignments
//--------------------------------------

//Alte Lesemethode wird nur zum Bootstrap des neuen Systems gebraucht.
func void MEMINT_OldWriteInt (var int address, var int val) {
    /* other = address - MEM_NpcID_Offset */
    MEM_Helper.enemy = address - MEM_NpcID_Offset;
    /* res wird nicht gebraucht, müllt aber sonst den Stack zu! */
    var int res; res = Npc_GetTarget (MEM_Helper);
    
    /* *(other + oCNpc_idx_offset) = val */
    other.id = val;
};

func void MEMINT_PrepareAssignments() {
    /* sorgt dafür, dass MEMINT_Assign und MEMINT_StrAssign
     * genau die Funktion von zPAR_OP_IS bzw. zPAR_TOK_ASSIGNSTR
     * erfüllen.
     * Diese Funktion wird nach Start von Gothic genau einmal aufgerufen. */
    
    var int symTab; var int MEMINT_Assign_Sym; var int MEMINT_Assign_StackPos; var int stackStart;
    
    //Navigation zum Code dieser Funktionen:
    symTab                  = MEM_ReadInt (ContentParserAddress + zCParser_symtab_table_array_offset);
    stackStart              = MEM_ReadInt (ContentParserAddress + zCParser_stack_offset);
    MEMINT_Assign_Sym       = MEM_ReadInt (symTab + 4 * (MEMINT_AssignPredecessor + 1));
    MEMINT_Assign_StackPos  = MEM_ReadInt (MEMINT_Assign_Sym + zCParSymbol_content_offset);
    
    //alte Lesemethode braucht Npc
    MEMINT_GetMemHelper();
    var C_NPC othBak;
    othBak = Hlp_GetNpc (other);
    
    //Code überschreiben. Vorsicht: Der erste Aufruf soll auch klappen!
    MEMINT_OldWriteInt (stackStart + MEMINT_Assign_StackPos     , (zPAR_OP_IS          << 0) | (zPAR_TOK_RET       << 8) | (zPAR_TOK_RET << 16) | (zPAR_TOK_RET << 24));
    MEMINT_OldWriteInt (stackStart + MEMINT_Assign_StackPos +  4, (zPAR_TOK_RET        << 0) | (zPAR_OP_IS         << 8) | (zPAR_TOK_RET << 16) | (zPAR_TOK_RET << 24));
    MEMINT_OldWriteInt (stackStart + MEMINT_Assign_StackPos +  8, (zPAR_TOK_ASSIGNSTR  << 0) | (zPAR_TOK_RET       << 8) | (zPAR_TOK_RET << 16) | (zPAR_TOK_RET << 24));
    MEMINT_OldWriteInt (stackStart + MEMINT_Assign_StackPos + 12, (zPAR_TOK_RET        << 0) | (zPAR_TOK_ASSIGNSTR << 8) | (zPAR_TOK_RET << 16) | (zPAR_TOK_RET << 24));
    
    //alte Lesemethode muss aufräumen
    MEM_Helper.enemy = 0;
    other = Hlp_GetNpc (othBak);
};

var MEMINT_HelperClass MEMINT_AssignPredecessor;
func void MEMINT_Assign() {
    /* Hier soll stehen:
     *  zPAR_OP_IS
     *  zPAR_TOK_RET
     *
     * das schreibe ich da jetzt hin: */
     
    MEMINT_PrepareAssignments (); //zPAR_TOK_CALL + 4 bytes
    return;                       //zPAR_TOK_RET
    return;                       //zPAR_TOK_RET
                                  //zPAR_TOK_RET
            
    //Summe: 8 Bytes
};

func void MEMINT_StrAssign() {
    /* Hier soll stehen:
     *  zPAR_TOK_ASSIGNSTR
     *  zPAR_TOK_RET
     *
     * das schreibe ich da jetzt hin: */
     
    MEMINT_PrepareAssignments (); //zPAR_TOK_CALL + 4 bytes
    return;                       //zPAR_TOK_RET
    return;                       //zPAR_TOK_RET
                                  //zPAR_TOK_RET
            
    //Summe: 8 Bytes
};

//--------------------------------------
// Schreiboperationen
//--------------------------------------

func void MEM_WriteInt (var int address, var int val) {
    if (address <= 0) {
        MEM_Error (ConcatStrings ("MEM_WriteInt: Invalid address: ", IntToString (address)));
        return;
    };
    
    MEMINT_StackPushInt (val);
    MEMINT_StackPushVar (address);
    
    MEMINT_Assign();
};

func void MEM_WriteString (var int address, var string val) {
    if (address <= 0) {
        MEM_Error (ConcatStrings ("MEM_WriteString: Invalid address: ", IntToString (address)));
        return;
    };
    
    MEMINT_StackPushString (val);
    MEMINT_StackPushVar (address);
    
    MEMINT_StrAssign();
};

//--------------------------------------
// Int-Arrayzugriff
//--------------------------------------

func int MEM_ReadIntArray (var int arrayAddress, var int offset) {
    return MEM_ReadInt (arrayAddress + 4 * offset);
};

func void MEM_WriteIntArray (var int arrayAddress, var int offset, var int value) {
    MEM_WriteInt (arrayAddress + 4 * offset, value);
};
//######################################################
//
//  Grundlegendes Parser Zeug
//
//######################################################

//IDs, die MEM_SetParset benutzt.
const int PARSER_CONTENT = 0;
const int PARSER_MENU    = 1;
const int PARSER_PFX     = 2;
const int PARSER_VFX     = 3;
const int PARSER_MAX     = 4;

//Folgendes wird mit MEM_SetParser initialisiert:
var int currParserID;
var int currParserAddress;
var int currSymbolTableAddress;
var int currSymbolTableLength;
var int currSortedSymbolTableAddress;
var int currParserStackAddress;

//Den Content Parser braucht man häufiger
var int contentSymbolTableAddress;

//Den Parser umstellen um nach andere Symbolen als Content Symbolen zu suchen.
func void MEM_SetParser(var int parserID) {
    if (parserID < 0) || (parserID >= PARSER_MAX) {
        MEM_Error ("MEM: Bad Parser ID!");
        return;
    };
    
    //Parseradresse aus ParserID gewinnen:
    if (parserID == PARSER_CONTENT) {
        currParserAddress = ContentParserAddress;
    } else if (parserID == PARSER_MENU) {
        currParserAddress = MEM_ReadInt (menuParserPointerAddress);
    } else if (parserID == PARSER_PFX) {
        currParserAddress = MEM_ReadInt (pfxParserPointerAddress);
    } else if (parserID == PARSER_VFX) {
        currParserAddress = MEM_ReadInt (vfxParserPointerAddress);
    };
    
    //Die Symboltabelle im Parser:
    currSymbolTableAddress          = MEM_ReadInt (currParserAddress + zCParser_symtab_table_array_offset);
    currSymbolTableLength           = MEM_ReadInt (currParserAddress + zCParser_symtab_table_array_offset + 8);
    currSortedSymbolTableAddress    = MEM_ReadInt (currParserAddress + zCParser_sorted_symtab_table_array_offset);
    currParserStackAddress          = MEM_ReadInt (currParserAddress + zCParser_stack_offset);
    
    //Die Contentsymboltabelle braucht man immer mal wieder:
    contentSymbolTableAddress       = MEM_ReadInt (ContentParserAddress + zCParser_symtab_table_array_offset);
    
    currParserID = parserID;
};

func void MEM_ReinitParser() {
    var C_NPC memHelperCpy;
    if (Hlp_IsValidNpc (memHelperCpy)) {
        /* C_NPC Variablen gehen beim Laden verloren.
         * da die noch da ist, ist alles noch initialisiert! */
        return;
    };
    
    /* Es wurde geladen. */
    MEMINT_GetMemHelper();
    memHelperCpy = Hlp_GetNpc (MEM_Helper);
    MEM_SetParser (currParserID);
};

//######################################################
//
//  Mehr Parser Zeug
//
//######################################################

//--------------------------------------
// Instanz auf Pointer zeigen lassen
//--------------------------------------

var int MEM_AssignInstSuppressNullWarning;
func void MEM_AssignInst (var int inst, var int ptr) {
    if (inst <= 0) {
        /* Anmerkung: inst == 0 kann auch nicht sein,
         * da es keine Instance vor einer Klassendeklaration
         * geben kann. */
        MEM_Error (ConcatStrings ("MEM_AssignInst: Invalid instance: ", IntToString (inst)));
        return;
    };

    if (ptr <= 0) {
        if (ptr < 0) {
            MEM_Error (ConcatStrings ("MEM_AssignInst: Invalid pointer: ", IntToString (ptr)));
            return;
        } else if (!MEM_AssignInstSuppressNullWarning) {
            MEM_Warn ("MEM_AssignInst: ptr is NULL. Use MEM_AssignInstNull if that's what you want.");
        };
    };

    MEM_ReinitParser();
    var int sym;
    sym = MEM_ReadIntArray (currSymbolTableAddress, inst);
    MEM_WriteInt (sym + zCParSymbol_offset_offset, ptr);
};

func void MEM_AssignInstNull (var int inst) {
    /* Normalerweise will man Instanzen nicht zurück auf 0 setzen.
     * Oft wird es ein Fehler sein. Daher wird oben eine Warnung ausgegeben.
     * Um die nicht zu bekommen gibt es hier die explizite Funktion */
    MEM_AssignInstSuppressNullWarning = true;
    MEM_AssignInst (inst, 0);
    MEM_AssignInstSuppressNullWarning = false;
};

func MEMINT_HelperClass MEM_PtrToInst (var int ptr) {
    if (ptr <= 0) {
        if (ptr < 0) {
            MEM_Error (ConcatStrings ("MEM_PtrToInst: Invalid pointer: ", IntToString (ptr)));
            return;
        } else if (!MEM_AssignInstSuppressNullWarning) {
            MEM_Warn ("MEM_PtrToInst: ptr is NULL. Use MEM_NullToInst if that's what you want.");
        };
    };

    var MEMINT_HelperClass hlp;
    MEM_AssignInst (hlp, ptr);
    MEMINT_StackPushInst (hlp);
};

func MEMINT_HelperClass MEM_NullToInst (var int ptr) {
    var MEMINT_HelperClass hlp;
    MEMINT_StackPushInst (hlp);
};

func MEMINT_HelperClass MEM_CpyInst (var int inst) {
    MEMINT_StackPushInst (inst);
};


// --------------------------------------
// Pass Content instance point to Pointer
// If it is not clear whether just
// Content of the parser will be used.
// (Relatively useless, especially for me)
// --------------------------------------

func void MEM_AssignContentInst (var int inst, var int ptr) {
    if (inst <= 0) {
        /* Anmerkung: inst == 0 kann auch nicht sein,
         * da es keine Instance vor eine Klassendeklaration
         * geben kann. */
        MEM_Error (ConcatStrings ("MEM_AssignContentInst: Invalid instance: ", IntToString (inst)));
        return;
    };
    
    if (ptr <= 0) {
        if (ptr < 0) {
            MEM_Error (ConcatStrings ("MEM_AssignContentInst: Invalid pointer: ", IntToString (ptr)));
            return;
        } else if (!MEM_AssignInstSuppressNullWarning) {
            MEM_Warn ("MEM_AssignContentInst: ptr is NULL. Use MEM_AssignContentInstNull if that's what you want.");
        };
    };
    
    MEM_ReinitParser();
    var int sym;
    sym = MEM_ReadIntArray (contentSymbolTableAddress, inst);
    MEM_WriteInt (sym + zCParSymbol_offset_offset, ptr);
};

func void MEM_AssignContentInstNull (var int inst) {
    /* Normalerweise will man Instanzen nicht zurück auf 0 setzen.
     * Oft wird es ein Fehler sein. Daher wird oben eine Warnung ausgegeben.
     * Um die nicht zu bekommen gibt es hier die explizite Funktion */
    MEM_AssignInstSuppressNullWarning = true;
    MEM_AssignContentInst (inst, 0);
    MEM_AssignInstSuppressNullWarning = false;
};


//--------------------------------------
// Offset einer Instanz ermitteln
//--------------------------------------

func int MEM_InstToPtr (var int inst) {
    if (inst <= 0) {
        /* Anmerkung: inst == 0 kann auch nicht sein,
         * da es keine Instance vor eine Klassendeklaration
         * geben kann. */
        MEM_Error (ConcatStrings ("MEM_InstGetOffset: Invalid inst: ", IntToString (inst)));
        return 0;
    };

    MEM_ReinitParser();

    var int symb;
    symb = MEM_ReadIntArray (currSymbolTableAddress, inst);
    return MEM_ReadInt (symb + zCParSymbol_offset_offset);
};

//Abwärtskompatibilität
func int MEM_InstGetOffset (var int inst) {
    return MEM_InstToPtr (inst);
};


//--------------------------------------
// Unsinnig. Nur zur Abwärtskompatibilität
// überhaupt noch drin.
//--------------------------------------

//Lässt currParserSymb auf das Symbol mit Instanz inst zeigen.
INSTANCE currParserSymb (zCPar_Symbol);
func void MEM_SetCurrParserSymb (var int inst) {
    if (inst <= 0) {
        MEM_Error (ConcatStrings ("MEM_SetCurrParserSymb: Invalid inst: ", IntToString (inst)));
        return;
    };
    
    MEM_ReinitParser();
    
    var int symOffset; var int currParserSymOffset;
    symOffset           = MEM_ReadIntArray (currSymbolTableAddress, inst);
    currParserSymOffset = MEM_ReadIntArray (contentSymbolTableAddress, currParserSymb);
    
    MEM_WriteInt (currParserSymOffset + zCParSymbol_offset_offset, symOffset);
};

//#################################################################
//
//  Diverse Hilfsmittel
//
//#################################################################

//--------------------------------------
// Debuginformationen anschalten
//--------------------------------------

/* Empfehlung: Sofort in Startup_Global
 * die Debuginformationen anmachen.
 * Schadet bestimmt nicht.
 * Bei der Auslieferung der Mod wieder rausnehmen. */
 
func void MEM_SetShowDebug (var int on) {
    MEM_WriteInt (showDebugAddress, on);
};

//--------------------------------------
// Sprünge
//--------------------------------------

/* Es sieht einfach aus, gell? Aber das das funktioniert ist
 * gar nicht so offensichtlich wie man glaubt.
 * Das hier geht zum Beispiel:
{
    label = MEM_StackPos.position;
    
    [...]
    
    MEM_StackPos.position = label;
};

 * Das hier geht grandios schief:
 
{
    label = MEM_StackPos.position + 0;
    
    [...]
    
    MEM_StackPos.position = label;
};

 * Wer Experimente macht, wird wahrscheinlich auf die Nase fallen.
 * Es ist Zufall, dass es so einfach funktioniert! */

class MEMINT_StackPos {
    var int position;
};

var MEMINT_StackPos MEM_StackPos;

func void MEM_InitLabels() {
    MEM_AssignContentInst (MEM_StackPos, ContentParserAddress + zCParser_stack_stackPtr_offset);
};

//----------------------------------
//  Bereichskopieren
//----------------------------------

/* Für Zeitkritische Sachen könnte man überlegen ob man hier
   Strings nutzt. Ich kann mir vorstellen, dass Stringzuweisungen
   deutlich schneller sind als der Unsinn hier.
   Allerdings weiß ich nicht ob es da wesentliche Besonderheiten
   zu beachten gäbe, daher hier nur eine primitive Implementierung.
   
   Jedenfalls kopiert diese Funktion wordCount Worte (je 4 Byte)
   von Startadresse src zur Zieladresse dst.
   Insgesamt also wordcount * 4 bytes. */
   
func void MEM_CopyBytes (var int src, var int dst, var int byteCount) {
    if (wordcount < 0) {
        MEM_Error ("MEM_Copy: Cannot copy less than 0 words!");
        return;
    };
    
    if (src <= 0)
    || (dst <= 0) {
        MEM_Error ("MEM_Copy: src or dst is invalid (<= 0)");
        return;
    };
    
    var int wordCount; wordCount = byteCount / 4;
    
    MEM_InitLabels();
    var int loopStart; loopStart = MEM_StackPos.position;
    /* while */ if (wordcount) {
        //Ein Wort (4 Bytes) kopieren.
        
        MEMINT_StackPushVar (src);
        MEMINT_StackPushVar (dst);
        MEMINT_Assign();
        
        src += 4;
        dst += 4;
        wordcount -= 1;
        
        MEM_StackPos.position = loopStart; //weitermachen
    }; /* end while */
    
    //kein ganzes Wort mehr? Dann nur noch den Rest kopieren.
    byteCount = byteCount % 4;
    if (byteCount) {
        var int mask; mask = (1 << (8 * byteCount)) - 1;
        MEM_WriteInt (dst, (MEM_ReadInt (dst) & ~mask) | (MEM_ReadInt (src) & Mask));
    };
};

func void MEM_CopyWords (var int src, var int dst, var int wordcount) {
    MEM_CopyBytes (src, dst, wordcount * 4);
};

//alias, legacy
func void MEM_Copy (var int src, var int dst, var int wordcount) {
    MEM_CopyBytes (src, dst, wordcount * 4);
};

//#################################################################
//
//  Hilfsfunktionen (für Speicherallokation und strings)
//
//#################################################################

/* als "INT" Funktion gelassen, da schwer verständlich:
 * Es können niemals zwei Strings gleichzeitig so gepusht werden! */
func string MEMINT_PushString (var string str) {
    return str;
};
func string MEMINT_PushAnotherString (var string str) {
    return str;
};

var string MEMINT_HlpString;
func string STRINT_PushHlpString () {
    return MEMINT_HlpString;
};
var string MEMINT_AnotherHlpString;
func string STRINT_PushAnotherHlpString () {
    return MEMINT_AnotherHlpString;
}; 

/* Liefert die Adresse einer Kopie von str zurück.
 * nochmaliger Aufruf beeinflusst frühere Rückgabewerte! */
func int STRINT_GetStringAddress (var string str) {
    MEMINT_PushString (str);
    MEMINT_StackPopInst(); //zPAR_TOK_PUSHVAR oder so
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};
/* Liefert die Adresse einer Kopie von str zurück */
func int STRINT_GetAnotherStringAddress (var string str) {
    MEMINT_PushAnotherString (str);
    MEMINT_StackPopInst(); //zPAR_TOK_PUSHVAR oder so
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};

/* Liefert die Adresse von MEMINT_HlpString zurück. */
func int STRINT_GetHelpStringAddress() {
    STRINT_PushHlpString();
    MEMINT_StackPopInst(); //zPAR_TOK_PUSHVAR oder so
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};
func int STRINT_GetAnotherHelpStringAddress() {
    STRINT_PushAnotherHlpString();
    MEMINT_StackPopInst(); //zPAR_TOK_PUSHVAR oder so
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};



//######################################################
//
//  Speicher allozieren
//
//######################################################

func int MEM_Alloc (var int ammount) {
    /* string mit AAAA holen */
    var int strPtr;
    MEMINT_HlpString = "AAAA";
    strPtr = STRINT_GetHelpStringAddress();
    
    var zString str;
    MEM_AssignInst (str, strPtr);
    
    /* aus den As Nuller machen */
    MEM_WriteInt (str.ptr, 0);
    
    /* string mit sich selbst konkatenieren bis groß genug */
    var int size; size = 4;
    MEM_InitLabels(); var int loopStart; loopStart = MEM_StackPos.position;
    
    //VORSICHT! Mindestens einmal muss das durchlaufen werden.
    //sonst kommt statisch die Adrese von der Parserkonstante "AAAA" zurück!
    //Und das ist ein richtig mieser Fehler.
    
    /* do */
        MEMINT_HlpString = ConcatStrings (MEMINT_HlpString, MEMINT_HlpString);
        size *= 2;
    /* while */  if (size < ammount) {  MEM_StackPos.position = loopStart; };
    
    /* Speicher ist jetzt reserviert. Dem String die Referenz wieder wegnehmen. */
    var int res; res = str.ptr;
    
    str.ptr = 0;
    str.len = 0;
    str.res = 0;
    
    return res;
};

func void MEM_Free (var int ptr) {
    /* keine Nuller freigeben */
    if (!ptr) {
        MEM_Warn ("MEM_Free: ptr is 0. Ignoring request.");
        return;
    };
    
    /* Hilfsstring holen */
    var int strPtr;
    MEMINT_HlpString = "";
    strPtr = STRINT_GetHelpStringAddress();
    
    var zString str;
    MEM_AssignInst (str, strPtr);
    
    /* dem String den Speicher geben und mit Zuweisung von "" an den String freigeben */
    str.ptr = ptr;
    str.len = 1;
    str.res = 1;
    
    MEMINT_HlpString = "";
};

/* Speicher in ein neues Array kopieren */
func int MEM_Realloc (var int ptr, var int oldsize, var int newsize) {
    if (!ptr) {
        /* Meckern? */
        if (!oldsize) {
            MEM_Error ("MEM_Realloc: ptr is 0 but oldsize is not 0.");
        };
        
        return MEM_Alloc (newsize);
    };
    
    var int toCopy; if (oldsize < newsize) { toCopy = oldsize; } else { toCopy = newSize; };
    
    var int newPtr; newPtr = MEM_Alloc (newsize);
    
    MEM_CopyBytes (ptr, newPtr, toCopy);
    
    MEM_Free (ptr);
    
    return newPtr;
};

//######################################################
//
//  StrTools
//
//######################################################

//--------------------------------------
// Substrings von Strings
//--------------------------------------

func string STR_SubStr (var string str, var int start, var int count) {
    /* dickes Problem:
     * zString legt bei Zuweisungen nicht immer Kopien an
     * sondern scheint sparsam zu sein (wo auch immer er sich merkt,
     * ob etwas eine Kopie ist oder nicht).
     * Jedenfalls hatte ich hier Probleme, dass sich der übergebene String
     * BEIM AUFRUFER (!) verändert hat. Absolut unerwartet für mich.
     * Neue Implementierung arbeitet mit MEM_Alloc. */
    
    if (start < 0) || (count < 0) {
        MEM_Error ("STR_SubStr: start and count may not be negative.");
        return "";
    };
    
    /* Hole Adressen von zwei Strings, Source und Destination (für Kopieroperation) */
    var zString zStrSrc;
    var zString zStrDst;
    MEM_AssignInst (zStrSrc, STRINT_GetStringAddress(str));
    MEM_AssignInst (zStrDst, STRINT_GetHelpStringAddress()); MEMINT_HlpString = "";
    
    if (zStrSrc.len < start + count) {
        if (zStrSrc.len < start) {
            MEM_Warn ("STR_SubStr: The desired start of the substring lies beyond the end of the string.");
            return "";
        } else {
            /* The start is in valid bounds. Is the end as well? */
            MEM_Warn ("STR_SubStr: The end of the desired substring exceeds the end of the string.");
            count = zStrSrc.len - start;
        };
    };
    
    zStrDst.ptr = MEM_Alloc (count);
    zStrDst.res = count;
    
    MEM_CopyBytes (zStrSrc.ptr + start, zStrDst.ptr, count);
    
    zStrDst.len = count;
    
    /* nicht direkt den Hilfsstring pushen, sondern lokale Kopie, weil Hilfsstring leer sein soll. */
    str = MEMINT_HlpString;
    MEMINT_HlpString = "";
    
    return str;
};

//--------------------------------------
// Länge eines Strings
//--------------------------------------
// Ork: Przesuniete, wymagane przez suffix
func int STR_Len (var string str) {
    var zString zStr;
    MEM_AssignInst (zStr, STRINT_GetStringAddress(str));
    
    return zStr.len;
};
//Von früher:
func string STR_Prefix (var string str, var int len) {
    return STR_SubStr (str, 0, len);
};
// Ork: new
func string STR_Suffix (var string str, var int startPos) {
	var int tillEnd; tillEnd = STR_Len(str) - startPos;
    return STR_SubStr (str, startPos, tillEnd);
};

//--------------------------------------
// Zugriff auf einzelnes Zeichen
//--------------------------------------

func int STR_GetCharAt (var string str, var int pos) {
    var zString zStr;
    MEM_AssignInst (zStr, STRINT_GetStringAddress(str));
    
    if (pos < 0) || (pos >= zStr.len) {
        MEM_Warn ("STR_GetCharAt: Reading out of bounds! returning 0.");
        return 0;
    };
    
    return MEM_ReadInt (zStr.ptr + pos) & 255;
};

//--------------------------------------
// STR_Search returning pos where pattern
// could be found (first time) or -1
//--------------------------------------

func int STR_Search (var string str, var string pattern) {
    var zString zStr; var zString patt;
    var int patt1stChar;
    var int i; var int j;
    MEM_AssignInst (zStr, STRINT_GetStringAddress(str));
    MEM_AssignInst (patt, STRINT_GetAnotherStringAddress(pattern)); //Ork: Korekta nr. 1
    
    if (zStr.len < 1) || (patt.len > zStr.len) {
        MEM_Warn ("STR_Search: Reading out of bounds! returning -1.");
        return -1;
    };
    
    patt1stChar = MEM_ReadInt (patt.ptr) & 255;
    i = 0;
    
    var int loopStart; loopStart = MEM_StackPos.position;
	var string pipe; 
    if( (MEM_ReadInt(zStr.ptr+i)&255) == patt1stChar) // Korekta #2 (nawiasy)
    {
	    var int subLoopStart;
	    j = 1;
	    subLoopStart = MEM_StackPos.position;
	    if( (MEM_ReadInt(zStr.ptr+i+j)&255) == (MEM_ReadInt(patt.ptr+j)&255) ) // Korekta #3i4 (nawiasy)
		{
			if( (j+1) == patt.len) // Korekta #5 japierdole XD
			{
				return i;//returns the begging pos of searched pattern in string
			};
			j+=1;
			MEM_StackPos.position=subLoopStart;
		};    
	}
    else if(i<zStr.len-patt.len)//1st char don't match, but there is more characters to check...
    {
	  i+=1;
	  MEM_StackPos.position = loopStart; 
    };
    
    return -1;//pattern not found
};


//--------------------------------------
// Pointer auf Daten
//--------------------------------------

/* Vorsicht! Der Buffer ist flüchtig! Weitere String-Operationen können ihn zerstören!
 * Diesen Unsinn lieber zur INTeternen Funktion gemacht, das gibt sonst nur Tränen wegen unfindbaren Fehlern! */

func int STRINT_toChar (var string str) {
    var zString zStr;
    MEM_AssignInst (zStr, STRINT_GetStringAddress(str));
    
    return zStr.ptr;
};

//--------------------------------------
// Vergleiche
//--------------------------------------

const int STR_GREATER =  1;
const int STR_EQUAL   =  0;
const int STR_SMALLER = -1;

func int STR_Compare(var string str1, var string str2) {
    /* Case sensitive! */
    var zString zStr1; MEM_AssignInst (zStr1, STRINT_GetStringAddress       (str1));
    var zString zStr2; MEM_AssignInst (zStr2, STRINT_GetAnotherStringAddress(str2));
    
    var int maxlen; if (zStr1.len < zStr2.len) { maxlen = zStr1.len; } else { maxlen = zStr2.len; };
    var int pos; pos = 0;
    
    MEM_InitLabels();
    var int loopStart; loopStart = MEM_StackPos.position;
    
    if (pos >= maxlen) {
        //am Ende und keine Unterschiede gefunden.
        if (zStr1.len > zStr2.len) {
            return STR_GREATER;
        } else if (zStr1.len < zStr2.len) {
            return STR_SMALLER;
        };
        return STR_EQUAL;
    };
    
    var int word1; word1 = MEM_ReadInt (zStr1.ptr + pos);
    var int word2; word2 = MEM_ReadInt (zStr2.ptr + pos);
    
    if (word1 == word2) {
        pos += 4;
        MEM_StackPos.position = loopStart;
    };
    
    //Unterschied gefunden. Aber wo?
    var int subLoopStart;
    subLoopStart = MEM_StackPos.position;
    /* while */ if ((word1 & 255) == (word2 & 255)) {
        pos += 1;
        word1 = word1 >> 8;
        word2 = word2 >> 8;
        MEM_StackPos.position = subLoopStart;
    }; /* end while */
    
    //Ok, Position ermittelt.
    if (pos >= maxLen) {
        //oben kümmere ich mich um solche Fälle
        MEM_StackPos.position = loopStart;
    };
    
    //Unterschied im Gültigkeitsbereich beider strings:
    if (word1 & 255) > (word2 & 255) {
        return STR_GREATER;
    };
    return STR_SMALLER;
};

//--------------------------------------
// STR_ToInt
//--------------------------------------

func int STR_ToInt (var string str) {
    var int len;
    len = STR_Len (str);
    
    var int buf; var int index;
    buf = STRINT_toChar (str); //vorsicht, das ist ein flüchtiger Buffer!
    index = 0;
    
    var int res; res = 0; var int minus; minus = FALSE;
    
    MEM_InitLabels();
    var int loopStart; loopStart = MEM_StackPos.position;
    /* while */ if (index < len) {
        var int chr; chr = MEM_ReadInt (buf + index) & 255;
        
        if (chr >= 48 /* 0 */) && (chr <= 57 /* 9 */) {
            res = res * 10 + (chr - 48);
        } else if (index == 0) {
            //am Anfang sind Vorzeichen erlaubt
            if (chr == 43 /*+*/) {
                /* ignore */
            } else if (chr == 45 /*-*/) {
                minus = true;
            } else {
                MEM_Warn (ConcatStrings ("STR_ToInt: cannot convert string: ", str));
                return 0;
            };
        } else {
            MEM_Warn (ConcatStrings ("STR_ToInt: cannot convert string: ", str));
            return 0;
        };
        index += 1;
        MEM_StackPos.position = loopStart;
    };
    
    if (minus) {
        return -res;
    } else {
        return res;
    };
};

//######################################################
//
//  Höheres Parser Zeug
//
//######################################################

//--------------------------------------
// Symbolsuche
//--------------------------------------

func int MEM_FindParserSymbol (var string inst) {
    MEM_ReinitParser();
    
    var int low; low = 0; var int high; high = currSymbolTableLength - 1;
    
    MEM_InitLabels();
    var int loopStart; loopStart = MEM_StackPos.position;
    
    if (low <= high) {
        /* Ich habe noch einen Bereich zum suchen. Mitte bestimmen: */
        var int med; med = (low + high) / 2;
        
        /* Index an dieser Position holen */
        var int symbID; var int sym;
        symbID = MEM_ReadIntArray (currSortedSymbolTableAddress, med   );
        sym    = MEM_ReadIntArray (currSymbolTableAddress,       symbID);
        
        var string medName; medName = MEM_ReadString (sym);  //steht ganz am Anfang im Symbol
        
        var int erg; erg = STR_Compare(medname, inst);
        
        /* Getroffen? Links daneben? Rechts daneben? */
        if (erg == STR_SMALLER) {
            /* medname < MEMINT_CurrSymbolName
             * -> Ich muss also weiter rechts suchen. */
            low = med + 1;
            MEM_StackPos.position = loopStart;
        } else if (erg == STR_GREATER) {
            /* medname > MEMINT_CurrSymbolName
             * -> Ich muss also weiter links suchen. */
            high = med - 1;
            MEM_StackPos.position = loopStart;
        };
        /* STR_EQUAL? -> Symbol gefunden! Schleife verlassen! */
        return symbID;
    } else {
        /* alles schon ausgeschlossen -> nicht drin! */
        MEM_Warn (ConcatStrings ("MEM_FindParserSymbol: Undefined Symbol: ", inst));
        return -1;
    };
};

func int MEM_GetParserSymbol (var string inst) {
    var int symID;
    symID = MEM_FindParserSymbol (inst);
    
    if (symID == -1) {
        return 0;
    } else {
        return MEM_ReadIntArray (currSymbolTableAddress, symID);
    };
};

//--------------------------------------
// Funktionenbiegerei
//--------------------------------------

/* Will das nicht zweimal schreiben, daher beide möglichen Parameter hier */
func void MEM_CallByID (var int symbID) {
    if (currParserID != PARSER_CONTENT) {
        MEM_Error("Calling Functions within another parser is evil. Dont do it.");
        return;
    };
    
    MEM_ReinitParser();
    
    var zCPar_Symbol sym;
    MEM_AssignInst (sym, MEM_ReadIntArray (contentSymbolTableAddress, symbID));
    
    var int type;
    type = (sym.bitfield & zCPar_Symbol_bitfield_type);
    
    if (type != zPAR_TYPE_FUNC) && (type != zPAR_TYPE_PROTOTYPE) && (type != zPAR_TYPE_INSTANCE) {
       MEM_Error (ConcatStrings ("MEM_CallByID: Provided symbol is not callable (not function, prototype or instance): ", sym.name)); 
       return;
    };
    
    MEM_InitLabels();
    MEM_StackPos.position = sym.content + currParserStackAddress; //Jump statt Call. Geht auch. Sogar bequemer.
};

func void MEM_CallByString (var string fnc) {
    if (Hlp_StrCmp (fnc, "")) {
        MEM_Error ("MEM_CallByString: fnc may not be an empty string!");
        return;
    };
    
    /* Mikrooptimierung: Wird zweimal hintereinander die selbe Funktion
     * mit CallByString aufgerufen, nicht nochmal neu suchen. */
    var int symbID;
    var string cacheFunc; var int cacheSymbID;
    
    if (Hlp_StrCmp (cacheFunc, fnc)) {
        symbID = cacheSymbID;
    } else {
        symbID = MEM_FindParserSymbol (fnc);
        
        if (symbID == -1) {
            MEM_Error (ConcatStrings ("MEM_CallByString: Undefined symbol: ", fnc));
            return;
        };
        
        cacheFunc = fnc; cacheSymbID = symbID;
    };
    printdebug(inttostring(symbID));
    MEM_CallByID (symbID);
};

//************************************
//  Parameter übergeben,
//  Rückgabewerte verwenden.
//  Nochmal explizit
//************************************

/* Kurze Hilfsfunktion, damit die Schnittstelle
 * von PushParam nicht verwirrt. */
func int MEMINT_PushIntParam(var int param) {
    return param + 0; //kein Var pushen sondern Konstante!
};

/* Werte auf den Stack schieben */
func void MEM_PushIntParam (var int param) {
    MEMINT_PushIntParam (param);
};



/* Es werden niemals Stringkonstanten gepusht
 * sondern nur Referenzen. Daher hier mehrere Strings,
 * sonst kommt bei mehreren String Parametern immer der selbe an */
func string MEMINT_PushStringParam0(var string str) { return str; };
func string MEMINT_PushStringParam1(var string str) { return str; };
func string MEMINT_PushStringParam2(var string str) { return str; };
func string MEMINT_PushStringParam3(var string str) { return str; };
func string MEMINT_PushStringParam4(var string str) { return str; };
func string MEMINT_PushStringParam5(var string str) { return str; };

func void MEM_PushStringParam (var string strParam) {
    var int usedRef;
         if (usedRef == 0) { MEMINT_PushStringParam0 (strParam); }
    else if (usedRef == 1) { MEMINT_PushStringParam1 (strParam); }
    else if (usedRef == 2) { MEMINT_PushStringParam2 (strParam); }
    else if (usedRef == 3) { MEMINT_PushStringParam3 (strParam); }
    else if (usedRef == 4) { MEMINT_PushStringParam4 (strParam); }
    else if (usedRef == 5) { MEMINT_PushStringParam5 (strParam); };

    usedRef += 1; if (usedRef > 5) { usedRef = 0; };
};

/* Werte vom Stack herunterholen. */
func int    MEM_PopIntResult   () {};
func string MEM_PopStringResult() {};





//######################################################
//
//  Menü Zugriff
//
//######################################################

/*
    Leider werden manche Menüs jedesmal neu erzeugt (vom Script aus),
    andere dagegen werden beim ersten mal nach dem Spielstart erzeugt und dann behalten.
    Abhängig davon und von dem, was man eigentlich tun will, kann es nötig sein
    in den Menüscripten Änderungen einzubringen (indem man
    in den Variablen dort schreibt) oder es ist nötig sich das Menü
    als Objekt zu holen und in dem fertigen Objekt selbst herumzuschmieren.
*/

func int MEM_GetMenuByString (var string menuName) {
    var zCArray menus;
    MEM_AssignContentInst (menus, MEMINT_MenuArrayOffset);
    
    var int pos; pos = 0;
    
    MEM_InitLabels();
    var int loopStart; loopStart = MEM_StackPos.position;
    
    if (pos >= menus.numInArray) {
        /* Liste durch und nichts gefunden? */
        MEM_Warn (ConcatStrings ("MEM_GetMenuByString: No Menu with the following name found: ", menuName));
        return -1;
    };
    
    var int menuAddr; menuAddr = MEM_ReadIntArray (menus.array, pos);
    var zCMenu menu;  MEM_AssignContentInst (menu, menuAddr);
    
    if (Hlp_StrCmp (menu.name, menuName)) {
        return menuAddr;
    };
    
    pos += 1;
    MEM_StackPos.position = loopStart;
};

//--------------------------------------
// MenuItem Zugriff
//--------------------------------------

/* Selbe Bemerkung wie zu Menüs */

const int  MEMINT_MenuItemArrayAddres = 9248508; //0x8D1EFC

func int MEM_GetMenuItemByString (var string menuItemName) {
    var zCArray menuItems;
    MEM_AssignContentInst (menuItems, MEMINT_MenuItemArrayAddres);
    
    var int pos; pos = 0;
    
    MEM_InitLabels();
    var int loopStart; loopStart = MEM_StackPos.position;
    
    if (pos >= menuItems.numInArray) {
        /* Liste durch und nichts gefunden? */
        MEM_Warn (ConcatStrings ("MEM_GetMenuItemByString: No Menu with the following name found: ", menuItemName));
        return -1;
    };
    
    var int menuItemAddr; menuItemAddr = MEM_ReadIntArray (menuItems.array, pos);
    var zCMenuItem menuItem;  MEM_AssignContentInst (menuItem, menuItemAddr);
    
    if (Hlp_StrCmp (menuItem.id, menuItemName)) {
        return menuItemAddr;
    };
    
    pos += 1;
    MEM_StackPos.position = loopStart;
};

//######################################################
//
//  Game
//
//######################################################

instance MEM_Game (oCGame);
instance MEM_World(oWorld);
instance MEM_Timer(zCTimer);
instance MEM_WorldTimer(oCWorldTimer);
instance MEM_Vobtree(zCTree);
instance MEM_InfoMan(oCInfoManager);
instance MEM_InformationMan (oCInformationManager);
instance MEM_Waynet(zCWaynet);
instance MEM_Camera(zCCamera);
instance MEM_SkyController(zCSkyController_Outdoor);
instance MEM_SpawnManager (oCSpawnManager);

func void MEM_InitGlobalInst() {
    //Game:
    var int game; game = MEM_ReadInt (MEMINT_oGame_Pointer_Address);
    MEM_AssignContentInst (MEM_Game, game);
    
    //World:
    MEM_AssignContentInst (MEM_World, MEM_Game._zCSession_world);
    
    //Vobtree:
    MEM_AssignContentInst (MEM_Vobtree, MEM_Game._zCSession_world + 36); //+ 0x0024
    
    //InfoManager:
    MEM_AssignContentInst (MEM_InfoMan, MEM_Game.infoman);
    
    //InformationManager
    MEM_AssignContentInst (MEM_InformationMan, MEMINT_oCInformationManager_Address);
    
    //Waynet:
    MEM_AssignContentInst (MEM_Waynet, MEM_World.wayNet);
    
    //Camera
    MEM_AssignContentInst (MEM_Camera, MEM_Game._zCSession_camera);
    
    //SkyController:
    if (MEM_World.skyControlerOutdoor) {
        MEM_AssignContentInst (MEM_SkyController, MEM_World.skyControlerOutdoor);
    };
    
    //Spawnmanager
    MEM_AssignContentInst (MEM_SpawnManager, MEM_Game.spawnman);
    
    //zTimer:
    MEM_AssignContentInst (MEM_Timer, MEMINT_zTimer_Address);
    
    //WorldTimer:
    MEM_AssignContentInst (MEM_WorldTimer, MEM_Game.wldTimer);
};

//######################################################
//
//  Gültigkeitsüberprüfungen
//
//######################################################

func int Hlp_Is_oCMobFire (var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == oCMobFire_vtbl);
};

func int Hlp_Is_zCMover(var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == zCMover_vtbl);
};

func int Hlp_Is_oCMob(var int ptr) {
    if (!ptr) { return 0; };
    
    var int vtbl;
    vtbl = MEM_ReadInt (ptr);
    
    /* Schreibweise so bescheuert, weil Gothic Sourcer bei || meckert. */
    return (vtbl == oCMob_vtbl)
        |  (vtbl == oCMobInter_vtbl)
        |  (vtbl == oCMobContainer_vtbl)
        |  (vtbl == oCMobDoor_vtbl);
};

func int Hlp_Is_oCMobInter(var int ptr) {
    if (!ptr) { return 0; };
    
    var int vtbl;
    vtbl = MEM_ReadInt (ptr);
    
    return (vtbl == oCMobInter_vtbl)
         | (vtbl == oCMobContainer_vtbl)
         | (vtbl == oCMobDoor_vtbl);
};

func int Hlp_Is_oCMobLockable(var int ptr) {
    if (!ptr) { return 0; };
    
    /* Gibt es Lockables die weder Türen noch Truhe sind?
     * nutzt aber eh keiner => zu faul zum nachforschen. */
    var int vtbl;
    vtbl = MEM_ReadInt (ptr);
    
    return (vtbl == oCMobInter_vtbl)
         | (vtbl == oCMobContainer_vtbl)
         | (vtbl == oCMobDoor_vtbl);
};

func int Hlp_Is_oCMobContainer(var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == oCMobContainer_vtbl);
};

func int Hlp_Is_oCMobDoor(var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == oCMobDoor_vtbl);
};

func int Hlp_Is_oCNpc (var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == oCNpc_vtbl);
};

func int Hlp_Is_oCItem (var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == oCItem_vtbl);
};

//#################################################################
//
//  Hilfsfunktion: ArrayInsert
//
//#################################################################

func int MEM_ArrayCreate () {
    return MEM_Alloc (sizeof_zCArray);
};

func void MEM_ArrayFree(var int zCArray_ptr) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayFree: Invalid address: zCArray_ptr may not be null!");
        return;
    };
    
    var int array; array = MEM_ReadInt (zCArray_ptr);
    
    if (array) {
        MEM_Free (array);
    };
    
    MEM_Free (zCArray_ptr);
};

func void MEM_ArrayClear (var int zCArray_ptr) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayClear: Invalid address: zCArray_ptr may not be null!");
        return;
    };
    
    var zCArray array;
    MEM_AssignContentInst (array, zCArray_ptr);
    
    if (array.array) {
        MEM_Free (array.array);
        array.array = 0;
    };
    
    array.numAlloc = 0;
    array.numInArray = 0;
};

func void MEM_ArrayInsert (var int zCArray_ptr, var int value) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayInsert: Invalid address: zCArray_ptr may not be null!");
        return;
    };
    
    var zCArray array;
    MEM_AssignContentInst (array, zCArray_ptr);
    
    if (array.numInArray > array.numAlloc) {
        MEM_Error ("MEM_ArrayInsert: Invalid array state!");
        return;
    };
    
    if (!array.array) {
        //Noch gar kein Array angelegt. Erstmals anlegen
        array.numAlloc = zARRAY_START_ALLOC;
        array.array = MEM_Alloc (array.numAlloc * 4);
    } else if (array.numInArray == array.numAlloc) {
        //kein Platz mehr
        
        //Tritt bestimmt nicht auf oder? Aber lieber mal Fehlermeldung statt komischem Absturz.
        if (!array.numAlloc) {
            MEM_Error ("MEM_ArrayInsert: Invalid array state!");
            return;
        };
        
        //nehmen wir mal das doppelte (oder ist das zu gierig? sollte passen):
        array.numAlloc = 2 * array.numAlloc;
        array.array = MEM_Realloc (array.array, array.numInArray * 4, array.numAlloc * 4);
    };
    
    //Jetzt muss Platz sein:
    MEM_WriteIntArray (array.array, array.numInArray, value);
    array.numInArray += 1;  
};

func void MEM_ArrayRemoveIndex (var int zCArray_ptr, var int index) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayRemoveIndex: Invalid address: zCArray_ptr may not be null!");
        return;
    };
    
    var zCArray array;
    MEM_AssignContentInst (array, zCArray_ptr);
    
    if (array.numInArray <= index) {
     MEM_Error ("MEM_ArrayRemoveIndex: index lies beyond the end of the array!");
        return;
    };
    
    //letzten Wert in die Lücke schieben
    array.numInArray -= 1; 
    MEM_WriteIntArray (array.array, index, MEM_ReadIntArray (array.array, array.numInArray));
  
};

var int MEMINT_ArrayRemoveValue_OnlyOnce;
func void MEM_ArrayRemoveValue (var int zCArray_ptr, var int value) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayRemoveValue: Invalid address: zCArray_ptr may not be null!");
        return;
    };
    
    var zCArray array;
    MEM_AssignContentInst (array, zCArray_ptr);
    
    MEM_InitLabels();
    var int i; i = 0;
    var int loop; loop = MEM_StackPos.position;
    
    //schon durchgelaufen?
    /* while */ if (i < array.numInArray) {
        if (MEM_ReadIntArray (array.array, i) == value) {
            //dann element entfernen
            array.numInArray -= 1;
            MEM_WriteIntArray (array.array, i, MEM_ReadIntArray (array.array, array.numInArray));
            
            //weitersuchen?
            if (MEMINT_ArrayRemoveValue_OnlyOnce) {
                MEMINT_ArrayRemoveValue_OnlyOnce = 2; //geschafft
                return;
            };
        } else {
            i += 1;
        };
        
        MEM_StackPos.position = loop;
    };
};

func void MEM_ArrayRemoveValueOnce (var int zCArray_ptr, var int value) {
    MEMINT_ArrayRemoveValue_OnlyOnce = true;
    MEM_ArrayRemoveValue (zCArray_ptr, value);
    
    if (MEMINT_ArrayRemoveValue_OnlyOnce != 2) {
        MEM_Warn (ConcatStrings ("MEM_ArrayRemoveValueOnce: Could not find value: ", IntToString (value)));
    };
    
    MEMINT_ArrayRemoveValue_OnlyOnce = false;
};

func string MEM_ArrayToString (var int zCArray_ptr) {
    var string res; res = "";
    
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayRemoveValue: Invalid address: zCArray_ptr may not be null!");
        return "";
    };
    
    var zCArray array;
    MEM_AssignContentInst (array, zCArray_ptr);
    
    MEM_InitLabels();
    var int i; i = 0;
    var int loop; loop = MEM_StackPos.position;
    /* while */ if (i < array.numInArray) {
        res = ConcatStrings (res, IntToString (MEM_ReadIntArray (array.array, i)));
        if (i < array.numInArray - 1) {
            res = ConcatStrings (res, ",");
        };
        i += 1;
        
        MEM_StackPos.position = loop;
    };
    
    return res;
};

//######################################################
//
//  Vob Hasherei
//
//######################################################

func int MEM_GetBufferCRC32 (var int buf, var int buflen) 
{
    /* crc wird das Ergebnis sein */
    var int crc; crc = -1; /* am Anfang: alle Bits gesetzt. */
    
    var int bufval;
    var int taboff;
    var int tabent;
    
    MEM_InitLabels();
    var int loopStart; loopStart = MEM_StackPos.position;
    
    if (buflen > 0) {
        // crc = crc_table[(crc ^ (*buf++)) & 0xff] ^ (crc >> 8);
        
        // bufval = *buf++
        bufval = MEM_ReadInt (buf); buf += 1;
        
        // taboff = (crc ^ bufval) & 0xff
        taboff = ((crc & ~ bufval) | ((~crc) & bufval)) & 255;
        
        // tabent = crc_table[taboff]
        tabent = MEM_ReadIntArray (crc_table_address, taboff);
        
        // crc = (crc >> 8)
        crc = (crc >> 8) & 16777215; //0xFFFFFF //signed Kacke.
        
        // crc = tabent ^ crc
        crc = ((tabent & ~crc) | ((~tabent) & crc));
        
        buflen -= 1;
        
        MEM_StackPos.position = loopStart;
    };
    
    return ~crc; //crc ^ 0xffffffffL;
};

func int MEM_GetStringHash (var string str) {
    return MEM_GetBufferCRC32 (STRINT_toChar (str), STR_Len (str));
};
func int MEMINT_GetWorldHashBucket (var int hash) {
    MEM_InitGlobalInst();
    var int bucketPtr;
    bucketPtr = MEM_InstToPtr (MEM_World);
    bucketPtr += zCWorld_VobHashTable_Offset + /* sizeof (zCArray) */ 12 * hash;
    return bucketPtr;
};
//--------------------------------------
// Vob in Hashtabelle suchen
//--------------------------------------

func int MEMINT_SearchVobByName (var string str, var int searchAll) {
	//am Anfang leeres Array oder null
	var int res;
	if (searchAll) {
		res = MEM_ArrayCreate();
	} else {
		res = 0;
	};
	
    /* Vobs mit leeren Namen werden nicht gehasht! */
    if (Hlp_StrCmp (str, "")) {
	    return res;
    };
    
    /* Hashtabellenposition berechnen */
    var int hash;
    hash = MEM_GetStringHash (str);
    hash = hash & (VOB_HASHTABLE_SIZE - 1);
    
    /* Im Allgemeinen sind mehrere Vobs dem selben Hashwert zugeordnet
     * Jeder Tabelleneintrag ist ein Array von Vobzeigern.
     * Dieses Array hier heraussuchen: */
    var int bucketPtr;
    MEM_InitGlobalInst();
    bucketPtr = MEM_InstGetOffset (MEM_World);
    bucketPtr += zCWorld_VobHashTable_Offset + /* sizeof (zCArray) */ 12 * hash;
    
    var zCArray bucket;
    MEM_AssignInst (bucket, bucketPtr);
    
    /* for (int i = 0; i < bucket.numInArray; i++) {
          if (bucket[i].name == str) {
	          if (searchAll) {
		          res.insert (bucket[i]);
	          } else {
              	  return bucket[i];
          	  };
          };
       } */
    
    var int i; i = 0;
    MEM_InitLabels();
    var int loopStart; loopStart = MEM_StackPos.position;
    /* while */ if (i < bucket.numInArray) {
        var zCObject vob;
        var int vobPtr; vobPtr = MEM_ReadIntArray (bucket.array, i);
        MEM_AssignInst (vob, vobPtr);
        
        if (Hlp_StrCmp (vob.objectName, str)) {
	        if (searchAll) {
		        MEM_ArrayInsert (res, vobPtr);
	        } else {
            	return vobPtr;
        	};
        };
        
        i += 1;
        MEM_StackPos.position = loopStart;
    }; /*end while*/
    
    /* kein (weiteres) Vob gefunden */
    return res;
};

func int MEM_SearchVobByName (var string str) {
	return MEMINT_SearchVobByName (str, 0);
};

func int MEM_SearchAllVobsByName (var string str) {
	return MEMINT_SearchVobByName (str, 1);
};

//---------------------------------------------
// zCTexture search by name of texture       
// .tga NOT .tex!
const int MEMINT_zCTexture_zCClassDef_Address = 9236752; //0x8CF110
const int zCClassDef_HashTable_Offset = 88;/*0x58*/
var string MEMINT_SearchTextureFileName;
func int MEM_SearchTextureByFileName_Sub (var int ptr) {

    if(Hlp_StrCmp(MEM_ReadString(ptr+16),MEMINT_SearchTextureFileName))
    {
    	return ptr;//ptr to zCTexture
	}
	else if(MEM_ReadInt(ptr+12)!=0)//there is next in hash
	{//check it by _Sub func
		return MEM_SearchTextureByFileName_Sub(MEM_ReadInt(ptr+12));
	}
	else
	{//tex not found
		return 0;	
	};
};
func int MEM_SearchTextureByFileName (var string str) {
    //Vobs mit leeren Namen werden nicht gehasht!
    if (Hlp_StrCmp (str, "")) {
        return 0;
    };
    
    var int hash; 
    hash = MEM_GetStringHash (str); //letzteres, damits in die Tabelle passt
    hash = hash & ((1 << 10) - 1);
       
    var int res;
    res = MEM_ReadInt(MEMINT_zCTexture_zCClassDef_Address + zCClassDef_HashTable_Offset);
    res = MEM_ReadInt(res + 4 * hash);//In zCClassDef there is no arrays in hash just pointer after pointer (+4bytes)
    if(res)//Ptr is valid, without it, game might crash when MEM_ReadString of 0+16
    {   	        
    	if(Hlp_StrCmp(MEM_ReadString(res+16),str))
    	{
    		return res;//ptr to zCTexture
		}
		else if(MEM_ReadInt(res+12)!=0)//there is next in hash
		{//check it by _Sub func
			MEMINT_SearchTextureFileName = str;
						
			return MEM_SearchTextureByFileName_Sub(MEM_ReadInt(res+12));
		};
	}
	else
	{//tex not found
		return 0;	
	};
	
	
};

const string MEMINT_UNIQUEVOBNAME = "MEMINT_UNIQUEVOBNAME";

func void MEMINT_SendTriggerOrUntrigger (var int vobPtr, var int trigger) {
    if (!vobPtr) {
        MEM_Error ("MEMINT_SendTriggerOrUntrigger: VobPtr may not be null!");
        return;
    };
    
    var zCObject vob;
    vob = MEM_PtrToInst (vobPtr);
    
    /* temporär umbenennen und (nochmal) in Hashtabelle einfügen:
     * dann kann ich einfach mit Wld_SendTrigger / Wld_SendUntrigger
     * arbeiten. */
    
    //Alten Namen merken, temporären Namen setzen
    var string oldName;
    oldName = vob.objectName;
    vob.objectName = MEMINT_UNIQUEVOBNAME;
    
    //Hash des temporären Namens nur einmal berechnen.
    var int hash;
    if (!hash) {
        hash = MEM_GetStringHash (MEMINT_UNIQUEVOBNAME) & (VOB_HASHTABLE_SIZE - 1);
    };
    
    //Zugehörigen Hashbucket holen
    var int bucketPtr; var zCArray bucket;
    bucketPtr = MEMINT_GetWorldHashBucket (hash);
    bucket	  = MEM_PtrToInst (bucketPtr);
    
    //Vob dort einfügen und Nachricht senden
    MEM_ArrayInsert (bucketPtr, vobPtr);
    
    if (trigger) {
        Wld_SendTrigger (MEMINT_UNIQUEVOBNAME);
    } else {
        Wld_SendUntrigger (MEMINT_UNIQUEVOBNAME);
    };
    
    //Vob wieder aus Tabelle rausnehmen
    if (MEM_ReadIntArray (bucket.array, bucket.numInArray - 1) == vobPtr) {
        //Normalfall: Vob ist ganz normal am Ende des Buckets.
        bucket.numInArray -= 1;
    } else {
        //Ansonsten sind während dem trigger komische Dinge passiert.
        //Dann eben auf die aufwändige Tour entfernen.
        MEM_ArrayRemoveValueOnce (bucketPtr, vobPtr);
    };
    
    //alten Namen wiederherstellen
    vob.objectName = oldName;
};

func void MEM_TriggerVob (var int vobPtr) {
    MEMINT_SendTriggerOrUntrigger (vobPtr, 1);
};

func void MEM_UntriggerVob (var int vobPtr) {
    MEMINT_SendTriggerOrUntrigger (vobPtr, 0);
};
//######################################################
//
//  Key Pressed
//
//######################################################

//Rückgabewerte
const int KEY_UP = 0;
const int KEY_PRESSED = 1;
const int KEY_HOLD = 2;
const int KEY_RELEASED = 3;

//************************************
//  Grundlage: Ist die Taste gedrückt?
//************************************

//etwas ungeschickt, dass die Methode, die auf KEY_HOLD prüft KeyPressed heißt... :-(
//aber jetzt ist es so und ich wills nicht ändern.

func int MEM_KeyPressed(var int key) {
    return MEM_ReadInt (MEMINT_KeyEvent_Offset + key) & 255;
};

//************************************
//  Darauf aufbauend: Erkennung
//  wann das erste mal gedrückt
//  und wann gehalten
//************************************

//Hier merke ich mir die Zustände seit der letzten Abfrage:
var int MEMINT_KeyState[1024]; //lieber mal etwas mehr, gibt noch JoystickButtons usw.

//schiebt: &MEMINT_KeyState und zPAR_TOK_PUSHVAR auf den Datenstack.
func int MEMINT_PushKeyStateArray() { return MEMINT_KeyState; };

func int MEM_KeyState(var int key) {
    var int pressed;
    pressed = MEM_KeyPressed (key);
    
    //Array mit zPAR_TOK_PUSHVAR pushen
    MEMINT_PushKeyStateArray();
    //zPAR_TOK_PUSH_VAR durch zPAR_TOK_PUSHINT ersetzen.
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
    
    //Adresse als Int runterholen:
    var int adr; adr = MEMINT_StackPopInt();
    adr += 4 * key;
    
    //State holen:
    var int keyState; keyState = MEM_ReadInt(adr);
    
    //State bearbeiten:
    if (keyState == KEY_UP) {
        if (pressed) {
            keyState = KEY_PRESSED;
        };
    } else if (keyState == KEY_PRESSED) {
        if (pressed) {
            keyState = KEY_HOLD;
        } else {
            keyState = KEY_RELEASED;
        };
    } else if (keyState == KEY_HOLD) {
        if (!pressed) {
            keyState = KEY_RELEASED;
        };
    } else /* keyState == KEY_RELEASED */ {
        if (pressed) {
            keyState = KEY_PRESSED;
        } else {
            keyState = KEY_UP;
        };
    };
    
    //Neuen State merken
    MEM_WriteInt (adr, keyState);
    return keyState; //zurückgeben.
};

//************************************
//  Key-Event einfügen
//************************************

/* Problematisch, vielleicht gibt es irgendwann eine bessere Lösung.
 * Aber einiges kann man damit schon machen.
 * Beispiel:
 *   -Inventar öffnen.
 *   -Quicksave
 *   -Charaktermenü öffnen
 *   -Pause togglen (Marvin Modus)
 *   -Log-Öffnen
 *   -Hauptmenü öffnen (ESC)
 *   ...
 *
 * An anderen Stellen will die Engine aber, dass der Key "getoggled"
 * wurde, das wird anderweitig verwaltet und ist hiervon nicht betroffen.
 * Daher kann man zum Beispiel das Inventar mit Hilfe dieser Funktion
 * nicht wieder schließen. */
 
func void MEM_InsertKeyEvent(var int key) {
    MEM_ArrayInsert (MEMINT_KeyBuffer_offset, key);
};

//#################################################################
//
//  zCOptions Access:
//
//#################################################################

var zCOption MEMINT_OPT_Set;
var zCOptionSection MEMINT_OPT_Section;
var zCOptionEntry MEMINT_OPT_Entry;

//#####################################################
//  reading
//#####################################################

/* Search the current section for an entry */
func int MEMINT_OPT_FindEntry(var string optname) {
    //Anzahl Einträge == 0 ausschließen (weil nur do-while schleife möglich, keine while-do).
    if (!MEMINT_OPT_Section.entryList_numInArray) {
        return FALSE;
    };
    
    MEM_InitLabels();
    
    var int i; i = 0;
    var int loopStart; loopStart = MEM_StackPos.position;
    /* while */ if (i < MEMINT_OPT_Section.entryList_numInArray) {
        var int ptr; ptr = MEM_ReadIntArray (MEMINT_OPT_Section.entryList_array, i);
        MEM_AssignContentInst (MEMINT_OPT_Entry, ptr);
        
        if (Hlp_StrCmp (MEMINT_OPT_Entry.varName, optname)) {
            return TRUE;
        };
        
        i += 1;
    
        MEM_StackPos.position = loopStart;
    }; /* end while */
    
    return FALSE; //nichts gefunden.
};

/* Search the current option set for a section */
func int MEMINT_OPT_FindSection (var string sectname) {
    //Anzahl Sektionen == 0 ausschließen (weil nur do-while schleife möglich, keine while-do).
    if (!MEMINT_OPT_Set.sectionList_numInArray) {
        return FALSE;
    };
    
    MEM_InitLabels();
    
    var int i; i = 0;
    var int loopStart; loopStart = MEM_StackPos.position;
    
    /* while */ if (i < MEMINT_OPT_Set.sectionList_numInArray) {
        var int ptr; ptr = MEM_ReadIntArray (MEMINT_OPT_Set.sectionList_array, i);
        MEM_AssignContentInst (MEMINT_OPT_Section, ptr);
        
        if (Hlp_StrCmp (MEMINT_OPT_Section.secName, sectname)) {
            return TRUE;
        };
        
        i += 1;
    
        MEM_StackPos.position = loopStart;
    }; /* end while */
    
    return FALSE; //nichts gefunden.
};

//************************************
//  Search the Gothic.ini
//************************************

func string MEM_GetGothOpt (var string sectionname, var string optionname) {
    MEM_AssignContentInst (MEMINT_OPT_Set, MEM_ReadInt (zoptions_Pointer_Address));
    
    if (!MEMINT_OPT_FindSection (sectionname)) {
        return "";
    };
    
    if (!MEMINT_OPT_FindEntry (optionname)) {
        return "";
    };
    
    return MEMINT_OPT_Entry.varValue;
};

func int MEM_GothOptSectionExists (var string sectionname) {
    MEM_AssignContentInst (MEMINT_OPT_Set, MEM_ReadInt (zoptions_Pointer_Address));
    return MEMINT_OPT_FindSection (sectionname);
};

func int MEM_GothOptExists (var string sectionname, var string optionname) {
    if (!MEM_GothOptSectionExists (sectionname)) {
        return false;
    };
    
    return MEMINT_OPT_FindEntry (optionname);
};

//************************************
//  Search the Mod.ini
//************************************

func string MEM_GetModOpt (var string sectionname, var string optionname) {
    MEM_AssignContentInst (MEMINT_OPT_Set, MEM_ReadInt (zgameoptions_Pointer_Address));
    
    if (!MEMINT_OPT_FindSection (sectionname)) {
        return "";
    };
    
    if (!MEMINT_OPT_FindEntry (optionname)) {
        return "";
    };
    
    return MEMINT_OPT_Entry.varValue;
};

func int MEM_ModOptSectionExists (var string sectionname) {
    MEM_AssignContentInst (MEMINT_OPT_Set, MEM_ReadInt (zgameoptions_Pointer_Address));
    return MEMINT_OPT_FindSection (sectionname);
};

func int MEM_ModOptExists (var string sectionname, var string optionname) {
    if (!MEM_ModOptSectionExists (sectionname)) {
        return false;
    };
    
    return MEMINT_OPT_FindEntry (optionname);
};

//************************************
//  Get the command line
//************************************

func string MEM_GetCommandLine () {
    MEM_AssignContentInst (MEMINT_OPT_Set, MEM_ReadInt (zoptions_Pointer_Address));
    return MEMINT_OPT_Set.commandline;
};

//#####################################################
//  writing
//#####################################################

func void MEM_SetGothOpt (var string section, var string option, var string value) {
    var int optSetPtr; optSetPtr = MEM_ReadInt (zoptions_Pointer_Address);
    MEM_AssignContentInst (MEMINT_OPT_Set, optSetPtr);
    
    if (!MEMINT_OPT_FindSection (section)) {
        MEM_Info (ConcatStrings ("MEM_SetGothOpt: Creating new Section: ", section));
        var int newSect_ptr;
        newSect_ptr = MEM_Alloc (sizeof_zCOptionSection);
        MEM_AssignContentInst (MEMINT_OPT_Section, newSect_ptr);
        MEMINT_OPT_Section.secName = section;
        
        MEM_ArrayInsert (optSetPtr + 8, newSect_ptr);
    };
    
    if (!MEMINT_OPT_FindEntry (option)) {
        MEM_Info (ConcatStrings ("MEM_SetGothOpt: Creating new entry: ", option));
        var int newEntry_ptr;
        newEntry_ptr = MEM_Alloc (sizeof_zCOptionEntry);
        MEM_AssignContentInst (MEMINT_OPT_Entry, newEntry_ptr);
        MEMINT_OPT_Entry.varName = option;
        
        var int sectPtr;
        sectPtr = MEM_InstGetOffset (MEMINT_OPT_Section);
        
        MEM_ArrayInsert (sectPtr + 20, newEntry_ptr);
    };

    MEMINT_OPT_Entry.varValue = value;
};

//######################################################
//
//	Auf statische Arrays zugreifen
//
//######################################################

var MEMINT_HelperClass MEMINT_ReadStatArr_MinusOne;
func int  MEMINT_ReadStatArr() {
    var int offset; offset = MEMINT_StackPopInt();
    
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
    
    var int adr;
    adr = MEMINT_StackPopInt();
    
    return MEM_ReadInt (adr + offset * 4);
};
var MEMINT_HelperClass MEM_ReadStatArr_MinusOne;
func int  MEM_ReadStatArr (var int array, var int offset) {
    MEM_Error ("MEM_ReadStatArr was called before MEM_InitStatArrs!");
    return 0;
};

var MEMINT_HelperClass MEMINT_WriteStatArr_MinusOne;
func void MEMINT_WriteStatArr() {
    var int value;  value = MEMINT_StackPopInt();
    var int offset; offset = MEMINT_StackPopInt();
    
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
    
    var int adr;
    adr = MEMINT_StackPopInt();
    
    MEM_WriteInt (adr + 4 * offset, value);
};
var MEMINT_HelperClass MEM_WriteStatArr_MinusOne;
func void MEM_WriteStatArr (var int array, var int offset, var int value)  {
    MEM_Error ("MEM_WriteStatArr was called before MEM_InitStatArrs!");
};

func int MEMINT_StatArrs_GetFuncStackAdr (var int symbolIndex) {
    //benötigt MEM_ReinitParser vorher.
    var zCPar_Symbol function;
    function = MEM_PtrToInst (MEM_ReadIntArray (currSymbolTableAddress, symbolIndex));
    return function.content;
};

func int MEMINT_StatArrs_ReplaceFunc (var int symbolIndex, var int replaceFuncIndex) {
    var int dest; var int src;
    dest = MEMINT_StatArrs_GetFuncStackAdr (replaceFuncIndex);
    src  = MEMINT_StatArrs_GetFuncStackAdr (symbolIndex) + currParserStackAddress;
    
    MEM_WriteInt (src, zPAR_TOK_JUMP); src += 1;
    MEM_WriteInt (src, dest); src += 4;
};

func void MEM_InitStatArrs() {
    //Ich muss an die Symboltabelle
    MEM_ReinitParser();
    
    MEMINT_StatArrs_ReplaceFunc (MEM_ReadStatArr_MinusOne + 1, MEMINT_ReadStatArr_MinusOne + 1);
    MEMINT_StatArrs_ReplaceFunc (MEM_WriteStatArr_MinusOne + 1, MEMINT_WriteStatArr_MinusOne + 1);
};

//#################################################
//
//    Mobs Erzeugen
//
//#################################################

/* Danke an Gottfried für die Entdeckung von Wld_InsertObject! */
func int MEM_InsertVob(var string vis, var string wp) {
    MEM_InitGlobalInst(); //MEM_World initialisieren
    
    /* oCMob von Gothic konstruieren lassen */
    Wld_InsertObject(vis,wp);
    
	/* A pointer to the new object is found in the Vobtree
     * always the first child of the global Vobtrees */
    var zCTree newTreeNode;
    newTreeNode = MEM_PtrToInst (MEM_World.globalVobTree_firstChild);
    return newTreeNode.data;
};

//#################################################
//
//    TOKENS
//
//#################################################

/* 1 Byte */
const int ASMINT_OP_movImToECX   = 185;  //0xB9
const int ASMINT_OP_movImToEDX   = 186;  //0xBA
const int ASMINT_OP_pushIm       = 104;  //0x68
const int ASMINT_OP_call         = 232;  //0xE8
const int ASMINT_OP_retn         = 195;  //0xC3

/* 2 Bytes */
const int ASMINT_OP_movEAXToMem     =  1417; //0x0589
const int ASMINT_OP_floatStoreToMem =  7641; //0x1DD9
const int ASMINT_OP_addImToESP      = 50307; //0xC483

/* Tuning:
   If not specified differently,
   there will be this much space available
   for an Assembler sequence. */
const int ASM_StandardStreamLength = 256;

//#################################################
//
//    Running Assembler Code
//
//#################################################

func int ASMINT_Array() {
    return 0;
};

var zCPar_Symbol ASMINT_MyExternal_Sym;
func void ASMINT_MyExternal() {};   /* the Symbol belonging to this function will become an external symbol */
func void ASMINT_CallMyExternal() { /* calls some external */
      Doc_Create(); /* will be changed so that it calls MyExternal */
};

func void ASMINT_Init() {
    /* used later to set the pointer to the call-target. */
    ASMINT_MyExternal_Sym = MEM_PtrToInst (MEM_GetParserSymbol ("ASMINT_MYEXTERNAL"));

    if (!ASMINT_Array()) {
        /* create an array */
            var zCPar_Symbol sym;
            sym = MEM_PtrToInst (MEM_GetParserSymbol ("ASMINT_ARRAY"));
        
            //place address of this array after the zPAR_TOK_PUSHINT Token
            MEM_WriteInt (currParserStackAddress + sym.content + 1, MEM_ArrayCreate());
        
        /* turn ASMINT_MyExternal into an external */
            ASMINT_MyExternal_Sym.bitfield = zPAR_TYPE_FUNC | zPAR_FLAG_EXTERNAL | zPAR_FLAG_CONST;
            
        /* have ASM_CallMyExternal call MyExternal instead of ExitSession */
            sym = MEM_PtrToInst (MEM_GetParserSymbol ("ASMINT_CALLMYEXTERNAL"));
            MEM_WriteInt (currParserStackAddress + sym.content + 1, ASMINT_MyExternal_Sym + 1);
    };
};

var int ASMINT_currRun;
var int ASMINT_cursor;
var int ASMINT_Length;

func void ASM_Open(var int space) {
    if (ASMINT_currRun) {
        MEM_Error ("ASM_Open: Only one stream of assembler code can be constructed at any given time (ASM_Open was called again before closing operation).");
        return;
    };
    
    if (!space) {
        space = ASM_StandardStreamLength; //default size
    };
    
    ASMINT_currRun = MEM_Alloc (space + 3); /* no byte fiddling at the end of the buffer */
    ASMINT_Length  = space;
    ASMINT_cursor  = ASMINT_currRun; /* pointing to the start */
};

func void ASM (var int data, var int length) {
    if (!ASMINT_currRun) {
        ASM_Open (0);
    };
    
    if (ASMINT_cursor - ASMINT_currRun + length > ASMINT_Length) {
        MEM_Error ("ASM: Reserved length is exceeded.");
        return;
    };
    
    MEM_WriteInt (ASMINT_cursor, data);
    ASMINT_cursor += length;
};

func void ASM_1 (var int data) { ASM (data, 1); };
func void ASM_2 (var int data) { ASM (data, 2); };
func void ASM_3 (var int data) { ASM (data, 3); };
func void ASM_4 (var int data) { ASM (data, 4); };

func int ASM_Here() {
    if (!ASMINT_currRun) {
        ASM_Open (0);
    };
    
    return ASMINT_cursor;
};

func int ASM_Close() {
    ASM (ASMINT_OP_retn, 1);
    var int res; res = ASMINT_currRun;
    ASMINT_currRun = 0;
    return res;
};

func void ASM_Run(var int ptr) {
    ASMINT_Init();
    ASMINT_MyExternal_Sym.content = ptr;
    ASMINT_CallMyExternal();
};

func void ASM_RunOnce() {
    if (!ASMINT_currRun) {
        MEM_Error ("ASM: ASM_Open has to be called before calling ASM_RunOnce.");
    };
    
    ASM (ASMINT_OP_retn, 1);
    
    /* Save this code in an array of codes.
     * Reason: On calling it another instance of this function may be
     * executing his own code */
    
    ASMINT_Init();
    MEM_ArrayInsert (ASMINT_Array(), ASMINT_currRun);
    
    ASMINT_MyExternal_Sym.content = ASMINT_currRun;
    ASMINT_currRun = 0; //more Code can be build while this one is running.
    
    ASMINT_CallMyExternal();
    
    /* Discard the code again */
    var zCArray arr; arr = MEM_PtrToInst (ASMINT_Array());
    MEM_Free (MEM_ReadIntArray (arr.array, arr.numInArray - 1));
    arr.numInArray -= 1;
};

//#################################################
//
//    Application of the ASM Functions:
//      Calls to Engine Functions
//
//#################################################

//************************************************
//   Build the code to lay parameters
//   onto the machine stack.
//************************************************

var int CALLINT_numParams;

/* int */
func void CALL_IntParam(var int param) {
    ASM_1 (ASMINT_OP_pushIm);
    ASM_4 (param);
    
    CALLINT_numParams += 1;
};

/* void */
func void CALL_PtrParam (var int param) {
    CALL_IntParam (param);
};

/* float */
func void CALL_FloatParam (var int param) {
    CALL_IntParam (param);
};

//string: Problem: The strings have to exist somewhere
//to avoid ridiculous complicated code that needs to
//free the string afterwards I take 10 different static
//strings here. It is impropable that anyone ever wants
//to push more than ten strings on the machine stack at once.
func string CALLINT_PushString (var string str) {
    var int n; n += 1; if (n == 10) { n = 0; };
    if (n == 0) { var string s0; s0 = str; return s0; };
    if (n == 1) { var string s1; s1 = str; return s1; };
    if (n == 2) { var string s2; s2 = str; return s2; };
    if (n == 3) { var string s3; s3 = str; return s3; };
    if (n == 4) { var string s4; s4 = str; return s4; };
    if (n == 5) { var string s5; s5 = str; return s5; };
    if (n == 6) { var string s6; s6 = str; return s6; };
    if (n == 7) { var string s7; s7 = str; return s7; };
    if (n == 8) { var string s8; s8 = str; return s8; };
    if (n == 9) { var string s9; s9 = str; return s9; };
    
    MEM_AssertFail ("Should be never here.");
};

func int CALLINT_GetStringAddress (var string str) {
    /* parser data stack hacking to get the address
     * of one of the strings. */
    CALLINT_PushString (str);
    MEMINT_StackPopInst(); //zPAR_TOK_PUSHVAR
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};

/* zString*  */
func void CALL_zStringPtrParam (var string param) {
    /* simply push the address onto the stack */
    CALL_IntParam (CALLINT_GetStringAddress(param));
};
/* cString*  */
func void CALL_cStringPtrParam (var string param) {
    /* get the Pointer to the data and lay it on the stack */
    var zString str; str = MEM_PtrToInst (STRINT_GetStringAddress(param));
    CALL_IntParam (str.ptr);
};

/* struct (not a Pointer to a struct, but a struct as is) */
func void CALL_StructParam (var int ptr, var int words) {
    /* the struct as a whole has to be pushed onto the stack
     * it has to be pushed in reverse order to lie correctly */
    if (words > 0) {
        CALL_IntParam (MEM_ReadIntArray (ptr, words - 1));
        CALL_StructParam (ptr, words - 1);
    };
};

/* switch: If the return value is a structure with a size
 * larget than 32 bit, the space for the return value has
 * to be allocated by the caller (this is us).
 * The address to the allocated memory is expected on the stack
 * as an additional parameter (pushed last)
 *
 * Warning: It is in the your responsibility to free
 * the memory, when the return value is not needed anymore.
 */
 
var int CALLINT_RetValStructSize;
func void CALL_RetValIsStruct (var int size) {
    CALLINT_RetValStructSize = size;
};

/* a special case of CALL_RetValIsStruct
 * a zString is a structure with the size of 20 bytes. */
func void CALL_RetValIszString() {
    CALL_RetValIsStruct (sizeof_zString);
};

/* switch: If the return value is a float (and therefore
 * lies on the top of the FPU stack instead of lying in eax
 * I need to know that. */
var int CALLINT_RetValIsFloat;
func void CALL_RetValIsFloat() {
    CALLINT_RetValIsFloat = true;
};

//************************************************
//   Getting the result after a call
//************************************************

/* returns a value that is written to by the call */
var int CALLINT_Result;
func int CALL_GetResult() {
    return CALLINT_Result;
};

/* if the value some 32 bit constant, there is nothing to do */
func int CALL_RetValAsInt  () { return CALL_GetResult(); };
func int CALL_RetValAsFloat() { return CALL_GetResult(); };
func int CALL_RetValAsPtr  () { return CALL_GetResult(); };

/* for those who are to lazy to use MEM_PtrToInst themselves: */
func MEMINT_HelperClass CALL_RetValAsStructPtr() {
    MEM_PtrToInst (CALL_GetResult());
};

/* parser data stack hacking does the trick for pointer to zStrings */
func string CALL_RetValAszStringPtr() {
    if (CALLINT_Result) {
        MEMINT_StackPushVar(CALLINT_Result);
    } else {
        return "";
    };
};

/* A zString is merely a special case of a structure, with the difference,
 * that it is used as a primitive datatype. Nobody will be willing
 * to use it as a pointer to some memory or an instance in Daedalus.
 * This function copies the contents of the zString into a
 * daedalus string and frees the zString afterwards. */
func string CALL_RetValAszString() {
    var string ret; ret = "";
    if (CALLINT_Result) {
        ret = CALL_RetValAszStringPtr();
        
        MEMINT_StackPushString("");
        CALL_RetValAszStringPtr();
        
        MEMINT_StrAssign();
        
        MEM_Free (CALLINT_Result);
        CALLINT_Result = 0;
    };
    
    return ret;
};

//************************************************
//   The calls
//************************************************

/* helper function to get the address to write the result to */
func int CALLINT_ResultAdr() {
    CALL_GetResult();
    /* parser data stack hacking */
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};

func void CALLINT_makecall (var int adr, var int cleanStack) {
    if (CALLINT_RetValStructSize) {
        CALL_IntParam (MEM_Alloc (CALLINT_RetValStructSize));
        CALLINT_RetValStructSize = 0;
    };

    /* make the call: */
    ASM_1 (ASMINT_OP_call);
    ASM_4 (adr - ASM_Here() - 4); /* -4, because the jump is relative to the _next_ instruction. */
    
    /* copy the result into a daedalus variable */
    if (!CALLINT_RetValIsFloat) {
        ASM_2 (ASMINT_OP_movEAXToMem); /* mov CALLINT_Result eax */
    } else {
        ASM_2 (ASMINT_OP_floatStoreToMem); /* fstp CALLINT_Result */
    };
    ASM_4 (CALLINT_ResultAdr());
    
    /* default: return value is not a float, has to be
     * set again if it is a float again. */
    CALLINT_RetValIsFloat = false; //fürs nächste mal muss neugeschaltet werden.
    
    /* __cdecl has to clean the stack here: */
    if (cleanStack) {
        ASM_2 (ASMINT_OP_addImToESP);
        ASM_1 (CALLINT_numParams * 4);
    };
    
    /* reset Param Counter */
    CALLINT_numParams = 0;
    
    /* run the code that was build and discard it afterwards */
    ASM_RunOnce();
};

/* all Parameters are passed on the stack (right to left)
   callee cleans the stack */
func void CALL__stdcall (var int adr) {
    CALLINT_makecall (adr, false);
};

/* all Parameters are passed on the stack (right to left)
   caller cleans the stack */ 
func void CALL__cdecl (var int adr) {
    CALLINT_makecall (adr, true);
};

/* __stdcall but with a this pointer in ecx. */
func void CALL__thiscall (var int this, var int adr) {
    /* this -> ecx */
    ASM_1 (ASMINT_OP_movImToECX);
    ASM_4 (this);
    CALL__stdcall (adr);
};

/* __stdcall but with the first two parameters passed in ecx and edx. */
func void CALL__fastcall (var int ecx, var int edx, var int adr) {
    ASM_1 (ASMINT_OP_movImToEDX);
    ASM_4 (edx);
    
    CALL__thiscall (ecx, adr);
};

//#################################################
//
//    Externe Bibliotheken laden
//
//#################################################

//*****************************************
//   Funktionen aus anderen DLLs laden
//*****************************************

/*  http://msdn.microsoft.com/en-us/library/ms684175%28v=vs.85%29.aspx */
func int LoadLibrary (var string lpFileName) {
    var int WinAPI__LoadLibrary;
    if (GOTHIC_BASE_VERSION == 2) {
        WinAPI__LoadLibrary = MEM_ReadInt (8577604); //0x82E244
    } else {
        WinAPI__LoadLibrary = MEM_ReadInt (8192588); //0x7D024C
    };
    
    CALL_cStringPtrParam (lpFileName);
    CALL__stdcall (WinAPI__LoadLibrary);
    return CALL_RetValAsPtr();
};

/* http://msdn.microsoft.com/en-us/library/ms683212%28v=vs.85%29.aspx */
func int GetProcAddress (var int hModule, var string lpProcName) {
    var int WinAPI__GetProcAddress;
    if (GOTHIC_BASE_VERSION == 2) {
        WinAPI__GetProcAddress = MEM_ReadInt (8577688); //0x82E298
    } else {
        WinAPI__GetProcAddress = MEM_ReadInt (8192260); //0x7D0104
    };
    
    CALL_cStringPtrParam (lpProcName);
    CALL_PtrParam (hModule);
    CALL__stdcall (WinAPI__GetProcAddress);
    
    return CALL_RetValAsPtr();
};

//einfache Anwendung der obigen beiden Funktionen.
func int FindKernelDllFunction (var string name) {
    return GetProcAddress (LoadLibrary ("KERNEL32.DLL"), name);
};

//*****************************************
//   Schreibschutz umgehen
//*****************************************

const int PAGE_EXECUTE = 16; //0x10
const int PAGE_EXECUTE_READ = 32; //0x20
const int PAGE_EXECUTE_READWRITE = 64; //0x40
const int PAGE_EXECUTE_WRITECOPY = 128; //0x80

const int PAGE_NOACCESS = 1; //0x01
const int PAGE_READONLY = 2; //0x02
const int PAGE_READWRITE = 4; //0x04
const int PAGE_WRITECOPY = 8; //0x08

/* http://msdn.microsoft.com/en-us/library/aa366898%28VS.85%29.aspx */
/* Note: I made lpflOldProtectPtr the return value and ignored
 * the return Value of VirtualProtect */
func int VirtualProtect (var int lpAddress, var int dwSize, var int flNewProtect) {
    var int adr;
    adr = FindKernelDllFunction ("VirtualProtect");
    
    var int lpflOldProtectPtr;
    lpflOldProtectPtr = MEM_Alloc (4);
    
    CALL_PtrParam (lpflOldProtectPtr);
    CALL_IntParam (flNewProtect);
    CALL_IntParam (dwSize);
    CALL_PtrParam (lpAddress);
    
    CALL__stdcall (adr);
    
    var int res; res = MEM_ReadInt (lpflOldProtectPtr);
    MEM_Free (lpflOldProtectPtr);
    
    return res;
};

func void MemoryProtectionOverride (var int address, var int size) {
    var int resDump;
    resDump = VirtualProtect (address, size, PAGE_EXECUTE_READWRITE);
};

//#################################################
//
//    Message Boxen
//
//#################################################

const int MB_OK                = 0;
const int MB_OKCANCEL          = 1;
const int MB_ABORTRETRYIGNORE  = 2;
const int MB_YESNOCANCEL       = 3;
const int MB_YESNO             = 4;
const int MB_RETRYCANCEL       = 5;
const int MB_CANCELTRYCONTINUE = 6;

const int MB_ICONERROR         = 16; //0x10
const int MB_ICONQUESTION      = 32; //0x20
const int MB_ICONWARNING       = 48; //0x30
const int MB_ICONINFORMATION   = 64; //0x40

//alias:
    const int MB_ICONEXCLAMATION = MB_ICONWARNING;
    const int MB_ICONASTERISK    = MB_ICONINFORMATION;
    const int MB_ICONSTOP        = MB_ICONERROR;
    const int MB_ICONHAND        = MB_ICONERROR;

const int MB_DEFBUTTON1 =   0; //0x000
const int MB_DEFBUTTON2 = 256; //0x100
const int MB_DEFBUTTON3 = 512; //0x200
const int MB_DEFBUTTON4 = 768; //0x300
    
const int IDOK       =  1;
const int IDCANCEL   =  2;
const int IDABORT    =  3;
const int IDRETRY    =  4;
const int IDIGNORE   =  5;
const int IDYES      =  6;
const int IDNO       =  7;
const int IDTRYAGAIN = 10;
const int IDCONTINUE = 11;

func int MEM_MessageBox (var string txt, var string caption, var int type) {
    /* Hier liegt die Funktion */
    const int WinAPI__MessageBox_G2 = 8079592; //0x7B48E8
    const int WinAPI__MessageBox_G1 = 7713298; //0x75B212
    
    const int MB_TASKMODAL     = 8192;    //0x2000
    
    /* Parameter in umgekehrter Reihenfolge */
    CALL_IntParam (type | MB_TASKMODAL); //soll in den Vordergrund
    CALL_cStringPtrParam (caption);        
    CALL_cStringPtrParam (txt);            
    CALL_IntParam (0);                     
    
    /* als __stdcall ausführen */
    if (GOTHIC_BASE_VERSION == 2) {
        CALL__stdcall (WinAPI__MessageBox_G2);
    } else {
        CALL__stdcall (WinAPI__MessageBox_G1);
    };
    
    return CALL_RetValAsInt();
};

func void MEM_InfoBox (var string txt) {
    var int res;
    res = MEM_MessageBox (txt, "Information:", MB_OK | MB_ICONINFORMATION);
};



//#################################################################
//
//  Initialisierungen
//
//#################################################################

func void MEM_InitAll() {
    //MEM_ReinitParser(); //enthalten in MEM_InitParser
    MEM_InitLabels();
    MEM_InitGlobalInst();
    MEM_InitStatArrs();
};


//5-Key Action
//8-Key "space"
//11-Key "alt"
//15-Key INVENTORY
func int MEM_MouseKeyPressed(var int key)
{
	var int this;
	this = MEM_ReadInt(zCInput_Class_ptr);
	CALL_IntParam(key);
	CALL__thiscall(this,MEM_ReadInt(MEM_ReadInt(this)+4));
	return CALL_RetValAsInt();
};