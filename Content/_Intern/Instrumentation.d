//Markiert Anfang der Datei. (alle Symbole hierdrin haben index > INSTRINT_CodeEnd)
instance INSTRINT_CodeStart (C_NPC);

//######################################################
//
//	Instrumentierung der Funktionen
//	Ziel: Finden von Fehlern mithilfe eines
//	dadurch generierten Callstacks.
//
//######################################################

/* Was ist das?
	Ziel dieses Scriptpakets ists es alle Aufrufe an Funktionen
	zu Debugzwecken mitzuprotokollieren. Dazu wird jeder Aufruf
	zunächst umgeleitet, damit vorher und nachher Ausgaben
	auf dem Spy stattfinden können.
	
	Hiermit ist es möglich im Falle eines Absturzes von Gothic festzustellen
	welche Scriptfunktionen (nicht Enginefunktionen) unmittelbar vorher aktiv waren.
	
	Hinweise zur Benutzung:
		* Dieses Script und Instrumentation_CodePool.d in die .src Datei eintragen.
		* z.B. aus einer Startup oder Init Funktion INSTR_InstrumentFunctions aufrufen
		* Den zSpy starten und Informationen mitloggen.
		* Am besten im zSpy unter Options -> Textfilter "Skript" eingeben.
		* Den zSpy während das Spiel läuft immer minimieren, sonst zieht er SEHR viel Leistung zum rendern
		* Einen Fehler reproduzieren und im zSpy festellen welche Funktionen vorher aufgerufen wurden.
		* Der zSpy verkraft nur begrenzt viele Nachrichten. Irgendwann ist der Speicher voll.
		* Wenn es nur um eine bestimmte Funktion geht, sollte der Textfilter im Spy spezifischer gewählt werden.
*/


//---------------------------------------------
//  Einstellungen (siehe Kommentare):
//---------------------------------------------

/*Bei jedem Betreten / Verlassen einer Funktion Callstack als Info im Spy ausgeben. */
const int INSTR_PRINT_FULL_STACK = 1;

/*Wenn FALSE, gibt das System nichts aus, bis mit INSTR_SetEnabled(TRUE)
	das Zeichen dazu gegeben wird */
const int INSTR_START_ENABLED = 1;

/* Instanzen sind Initialisierungsfunktionen für Npcs.
	Man könnte sie genauso instrumentieren. UNGETESTET! */
const int INSTR_INSTRUMENT_INSTANCES = 0;	

/*
	Ist INSTR_PRINT_FULL_STACK == 0, so wird nur "Entering: [Funktionsname]" und "Exiting..." ausgegeben.
	Das halte ich für weniger praktisch als den gesamten Callstack auszugeben.
	
	Da das System nur dann wirklich sinnvoll ist, wenn ein konkreter Absturz erkannt werden soll
	würde ich das System von Anfang an aktivieren. Nur wenn es einige Zeit braucht um an
	die Absturzstelle zu navigieren kann es aus Performancegründen besser sein das System erst
	dort zu aktivieren.
	
	INSTR_INSTRUMENT_INSTANCES ist ungetestet, sollte aber "eigentlich" funktionieren.
	Bei mir lief es nicht, es könnte aber daran liegen, dass ich dann > 2^16 Symbole instrumentiere und irgendwas überläuft.
	Wer es testen will: Eventuell muss dafür der CodePool (INSTRINT_codepool) vergrößert werden, da es einen ganzen Haufen Instanzen gibt.
	Die meisten Fehler treten aber vermutlich nicht direkt in Instanzen auf, daher ist die Einstellung standardmäßig daktiviert.
*/

/* Maximale Anzahl an Symbolen, die instrumentiert werden können.
 * Diese Konstante nur vergrößern, wenn der INSTRINT_codepool entsprechend groß ist! */
const int INSTRINT_MAXSYMBOLS = 20000;

//------------------------------------------------
//  An- und Ausschalten:
//------------------------------------------------

/* Beeinflusst nicht, ob der Code instrumentiert ist
 * sondern lediglich, ob der Callstack mitgeloggt und
 * ausgegeben wird. Ausschalten ist sehr sinnvoll, wenn
 * es lange dauert um zum Fehler zu navigieren.
 * Übrigens: NIEMALS sollte der zSPY sichtbar sein:
 *           Er rendert sich zu Tode und alles läuft
 *           SEHR langsam. */
 
var int INSTRINT_Enabled;
func void INSTR_SetEnabled (var int on) {
	INSTRINT_Enabled = on;
};

//------------------------------------------------
//  Instrumentierung
//------------------------------------------------

/* Dazu gibt es:

	func void INSTR_InstrumentFunctions()
	
   Diese Funktion kann von einer beliebigen Position aufgerufen werden.
   Danach werden entsprechend der Einstellungen Debugmeldungen ausgegeben.
*/


//######################################################
//
//	Implementierung
//
//######################################################

/*
	Grobe Idee:
		Bei jedem Funktionsaufruf (der nicht in dieses Script hinein geht) wird
		zunächst ein Codestück aus INSTRINT_codepool aufgerufen, der dieses
		Scriptpaket anstößt. Dabei wird übergeben, wo die Funktion sich eigentlich
		befindet (damit ich sie aufrufen kann) sowie der Symbolindex der Funktion
		um die Stack-Aktivität protokollieren zu können.
		
		Bei der Behandlung eines Aufrufs darf ich natürlich selbst keine
		instrumentierten Funktionen brauchen, sonst rufe ich mich nur selbst auf.
		Daher muss dieses Script das Ikarus Paket zum Teil selbst nochmal mitbringen.
		
		Weiteres Problem:
		Ich verändere das aktuelle globale Symbol des Parsers (wird geändert
		jedesmal wenn auf objekt.eigenschaft zugegriffen wird) und muss das für den
		Caller wieder herstellen. Das heißt aber, ich brauche eine Lese-
		und Schreibmöglichkeit, die OHNE Objektzugriff auskommt (sonst mache ich
		das, was ich Lese oder Schreiben will beim Lesen bzw. Schreiben kaputt).
		Beim Lesen geht das über Nicos Methode, beim Schreiben bastle ich mir
		im Vorfeld (bevor es gebraucht wird) ein passendes Assignment durch
		schreiben in den Parserstack zusammen.
*/
		
//-----------------------------------------------
//  Ich schreibe in den Parserstack
//  hinein ob er instrumentiert ist
//-----------------------------------------------

/* Sinn: Nach einem Laden muss nicht nochmal instrumentiert werden.
In einer globalen Variable kann ich mir das aber nicht speichern, weil
die im Gegensatz zum Parserstack flüchtig bezüglich Sessions ist. */

instance  INSTR_IsInstrumentedMinusOne (C_NPC) {};
func int INSTR_IsInstrumented() {
	return 0;
};

func void INSTRINT_SetIsInstrumented() {
	//Suche "INSTR_IsInstrumented" im Stack:
	var zCPar_Symbol IsInstrumentedFunc;
	MEM_AssignInst (IsInstrumentedFunc, MEM_ReadInt(contentSymbolTableAddress + 4 * (INSTR_IsInstrumentedMinusOne + 1)));
	
	//"return" gleich lassen, danach 1 hinschreiben für "schon instrumentiert"
	MEM_WriteInt (currParserStackAddress + IsInstrumentedFunc.content + 1, 1);
};

//-----------------------------------------------
//  Assignment für Objektzugriffsfreies WriteInt
//-----------------------------------------------

/* Benutzung: Pushe vorher Wert und Adresse auf den DataStack.
   Assign schreibt dann den Wert an die Adresse. */
INSTANCE INSTRINT_AssignMinusOne(C_NPC);
func void INSTRINT_Assign() {
	return; //wird zu zPAR_OP_IS
	return; //bleibt zPAR_TOK_RET
};

func void INSTRINT_PrepareAssignment() {
	var zCPar_Symbol assignmentFunc;
	MEM_AssignInst (assignmentFunc, MEM_ReadInt(contentSymbolTableAddress + 4 * (INSTRINT_AssignMinusOne + 1)));
	
	//erstes return zu zPAR_TOK_IS machen.
	var int code;
	code = MEM_ReadInt (currParserStackAddress + assignmentFunc.content);
	code = (code & ~255) | zPAR_OP_IS;
	MEM_WriteInt (currParserStackAddress + assignmentFunc.content, code);
};

//------------------------------------------------
//  Ausgabe:
//------------------------------------------------
/* Ich will eine nicht instrumentierte Version (nicht MEM_Info). Sonst nur Ärger.
 * Gleichzeitig will ich aber nicht direkt PrintDebug nehmen, soll anpassbar bleiben. */
func void INSTR_Info (var string info) {
	PrintDebug (info);
};

//######################################################
//
//	Ikarus Ersatz:
//
//######################################################

//----------------------------------
//  Nicht instrumentierte Lesemöglichkeit
//----------------------------------

/* Nicos Lesemöglichkeit. Das tolle: Sie kommt ohne zPAR_TOK_SETINSTANCE aus.
 * Dieses Token macht sonst bei Aufrufen aus Initialisierungsfunktionen (instance)
 * alles kaputt:

func void call() {}; //call greift kein Objekt an.

instance myInstance (myClass) {
	prop1 = val1;
	call();
	prop2 = val2;
};

 * hier würde prop2 nicht richtig initialisiert, wenn ich in meiner Instrumentierung
 * IRGENDEINE Instanz verwende. Ich muss mir daher die aktuelle Instanz merken
 * um dann hinterher alles zurücksetzen.
 * Lesen und Schreiben darf dabei jeweils kein Objekt anfassen. */

/* Folgender Code ist von Nico abgeschrieben: */
class INSTRINT_Nico_Pointer {};
var INSTRINT_Nico_Pointer INSTRINT_Nico_Stack_PurgeInstance;

/* lässt zPAR_TOK_PUSHINT und value auf dem DataStack */
func int INSTRINT_Nico_Stack_PushInt( var int Value ) {
	/* +0 sonst wird ein PushVar draus und die
	 * Adresse vom lokalen value liegt auf dem DataStack */
    return Value + 0;
};

func INSTRINT_Nico_Pointer INSTRINT_Nico_Stack_PopInstance(){};

func INSTRINT_Nico_Pointer INSTRINT_Nico_Stack_PushInstance( var int Index ) {
	/* Lege Index sowie zPAR_TOK_PUSHINT auf den Datastack. */
    INSTRINT_Nico_Stack_PushInt( Index );
    /* nehme zPAR_TOK_PUSHINT wieder vom Datastack runter */
    INSTRINT_Nico_Stack_PurgeInstance = INSTRINT_Nico_Stack_PopInstance();
};

func int INSTRINT_Nico_Stack_PushVar( var int Address ) {
    INSTRINT_Nico_Stack_PushInstance( Address );
    INSTRINT_Nico_Stack_PushInstance( 65 );
};

func int INSTRINT_ReadInt( var int Address ) {
	/* Lass für den Caller zPAR_TOK_PUSHVAR und die Adresse auf dem Datastack. */
    INSTRINT_Nico_Stack_PushVar( Address );
};

//----------------------------------
//  Schreiben:
//----------------------------------

func void INSTRINT_WriteInt (var int address, var int value) {
	/* Lege Wert auf den Datastack */
	INSTRINT_Nico_Stack_PushInt (value);
	/* Lege Adresse auf den Datastack */
	INSTRINT_Nico_Stack_PushVar (address);
	
	/* Zuweisung "=", wobei ich Wert und Ziel vorher manuell
	 * auf den Stack gelegt habe */
	INSTRINT_Assign();
};

func void INSTRINT_AssignSymbol(var int res_zCParSym, var int symbID) {
	/* Ein "var zCPar_Symbol" mit Symbolindex res_zCParSym soll auf das Symbol
	 * mit Index symbID verweisen. (ja, das ist verwirrend) */
	
	/* SymboltabellenAdresse Holen: */
	var int symtab;  symtab  = INSTRINT_ReadInt (ContentParserAddress + zCParser_symtab_table_array_offset);
	/* Pointer auf Zielsymbol */
	var int sym_ptr; sym_ptr = INSTRINT_ReadInt (symtab + 4 * symbID);
	/* Pointer auf Symbol, dass auf das Zielsymbol verweisen soll: */
	var int res_ptr; res_ptr = INSTRINT_ReadInt (symtab + 4 * res_zCParSym);
	
	/* Setze Offset des Symbols um: */
	INSTRINT_WriteInt (res_ptr + zCParSymbol_offset_offset, sym_ptr);
};

//######################################################
//
//	Durchlaufen aller Symbole
//
//######################################################

var int INSTRINT_SymbolCount; /* Gesamtzahl */
var int INSTRINT_currSymbol; /* walker durch Symboltabelle */
var int INSTRINT_CodePoolWalker; /* walker durch codepool */
var int INSTRINT_numInstrumented; /* läuft der Codepool über? */

/* In der Jump-Übersetzungstabelle merke ich mir welche Funktion
 * ich wohin gebogen habe. Die Tabelle ist so groß wie der gesamte
 * Parserstack*4. Für jede Position im Parserstack steht also nach
 * Umbiegen von Symbol.content das Biegeziel und 0, falls diese Stelle
 * im Parserstack nicht Einsprungspunkt einer instrumentierten
 * Funktion ist.
 * Ich brauche das, weil ich noch die stackinternen Calls entsprechend
 * Umbiegen muss. */
var int INSTRINT_JumpTranslationTable;

/* Ein Parsersymbol wird verarbeitet. Falls es sich um eine
 * Funktion handelt, die instrumentiert werden soll, dann
 * wird hier Symbol.content verändert, sodass es auf eine
 * Stelle in meinem Codepool zeigt.
 * Außerdem werden im Codepool an der entsprechenden Stelle
 * das eigentliche Sprungziel und der Symbolindex festgehalten
 * damit ich einen im Codepool ankommenden Call identifizieren
 * protokollieren und dann auch entsprechend ausführen kann. */
 
func void INSTR_DoSymbol() {
	//Hole Symbol
	var zCPar_Symbol sym;
	MEM_AssignInst (sym, MEM_ReadInt(contentSymbolTableAddress + 4 * INSTRINT_currSymbol));
	INSTRINT_currSymbol += 1; //auf keinen Fall vergessen!
	
	//Variablen, Instanzen, Prototypen rausfiltern:
	var int type; type = sym.bitfield & zCPar_Symbol_bitfield_type;
	if (type != zPAR_TYPE_FUNC) {
		//Instanzen nur durchlassen, falls sie instrumentiert werden sollen
		if (!INSTR_INSTRUMENT_INSTANCES) {
			return;
		};
		
		if (type != zPAR_TYPE_PROTOTYPE)
		&& (type != zPAR_TYPE_INSTANCE) {
			return;
		};
	};
	
	//Keine Externals!
	if (sym.bitfield & zPAR_FLAG_EXTERNAL) {
		return;
	};
	
	//nicht meine Internas instrumentieren -> sonst Endlosrekursion
	if (INSTRINT_currSymbol >= INSTRINT_CodeStart)
	&& (INSTRINT_currSymbol <= INSTRINT_CodeEnd) {
		return;
	};
	
	//Bound-checking
	if (INSTRINT_numInstrumented >= INSTRINT_MAXSYMBOLS) {
		MEM_Error ("Instrumentation: Too many functions! Enlarge INSTRINT_codepool and adjust INSTRINT_MAXSYMBOLS accordingly!");
		return;
	};
	
	INSTRINT_numInstrumented += 1;
	
	/*	Situation im Codepool:
		vorher:   INSTRINT_Makecall (0, 0); return;
		nachher:  INSTRINT_Makecall (INSTRINT_currSymbol, sym.content); return;	*/
	
	/* Invariante hier: INSTRINT_CodePoolWalker steht auf freier Stelle im Codepool. */
		
	var int start; start = INSTRINT_CodePoolWalker - currParserStackAddress;
	
	/* springe über "stack Push Int" (1) */
	INSTRINT_CodePoolWalker += 1;
	
	/* 1. Parameter: aktuelles Symbol (Vorsicht! Schon erhöht!) */
	MEM_WriteInt (INSTRINT_CodePoolWalker, INSTRINT_currSymbol - 1);
	
	/* springe über int (4) und das zweite "stack Push Int" (1) */
	INSTRINT_CodePoolWalker += 5;
	
	/* 2. Parameter: ursprüngliches Sprungziel des Funktionsaufrufs */
	MEM_WriteInt (INSTRINT_CodePoolWalker, sym.content);
	
	/* springe über int (4), call token (1), call Ziel (4) und return (1)
	 * Damit zeigt INSTRINT_CodePoolWalker wieder auf nächstes freie Stück. */
	INSTRINT_CodePoolWalker += 10;
	
	/* Im Parserstacks müssen später noch die Calls umgebogen werden.
	 * Hier daher die Übersetzung von altem Sprungziel zu neuem Sprungziel merken */
	MEM_WriteIntArray (INSTRINT_JumpTranslationTable, sym.content, start);
	
	/* Zum Schluss: Biege Funktion auch wirklich um */
	sym.content = start;
};

//------------------------------------------------
//  Durch alle Symbole gehen:
//------------------------------------------------

var zCParser INSTRINT_Parser;

/* Wird initialisiert mit der Adresse der Funktion INSTRINT_GoThroughAllSymbols */
var int INSTRINT_GoThroughAllSymbols_StackPtr;

instance  INSTRINT_GoThroughAllSymbolsMinusOne (C_NPC);
func void INSTRINT_GoThroughAllSymbols() {
	if (INSTRINT_SymbolCount - INSTRINT_currSymbol) {
		/* Es sind noch Symbol zu durchsuchen, also los: */
		INSTR_DoSymbol();
		
		if (!(INSTRINT_currSymbol % 5000)) {
			/* Alle 5000 Symbole Statusmeldung: */
			INSTR_Info (ConcatStrings (ConcatStrings ("INSTR: ", IntToString (INSTRINT_currSymbol)), " symbols done."));
		};
		
		/* Jetzt wirds spannend: Setze den aktuellen Stackpointer des Parsers!
		 * Resultat: Jump an den Anfang dieser Funktion! */
		INSTRINT_Parser.stack_stackptr = INSTRINT_GoThroughAllSymbols_StackPtr;
	};
};

//######################################################
//
//	Ändere Calls im Parserstack
//
//######################################################

var int INSTRINT_StackWalker;
var int INSTRINT_StackEnd;

/* Eine Stackposition verarbeiten */
func void INSTRINT_ProcessStack() {
	/* Hole Befehlstoken */
	var int tok; tok = INSTRINT_ReadInt(INSTRINT_StackWalker) & 255;
	
	if (tok <= zPAR_OP_MAX) {
		/* Operatoren stehen alleine in der Gegend.
		 *Sie haben keine zusätzlichen "Parameter" */
		INSTRINT_StackWalker += 1;
		return;
	} else if (tok > zPAR_TOK_CALL)
	&& (tok <= zPAR_TOK_PUSHINST) {
		/* jeweils zusätzlich vier Byte Symbolindex / Addresse */
		INSTRINT_StackWalker += 5;
		return;
	} else if (tok >= zPAR_TOK_ASSIGNSTR)
	&& (tok <= zPAR_TOK_ASSIGNINST) {
		INSTRINT_StackWalker += 1;
		return;
	} else if (tok >= zPAR_TOK_JUMP)
	&& (tok <= zPAR_TOK_SETINSTANCE) {
		INSTRINT_StackWalker += 5;
		return;
	} else if (tok == zPAR_TOK_RET) {
		/* return, nichts weiter. */
		INSTRINT_StackWalker += 1;
		return;
	} else if (tok == zPAR_TOK_FLAGARRAY + zPAR_TOK_PUSHVAR) {
		/* zusätzlich vier Byte + 1 byte Index */
		INSTRINT_StackWalker += 6;
		return;
	} else if (tok == zPAR_TOK_CALL) {
		/* Das ist der Fall, der mich interessiert! Den Call umbiegen! */
		
		/* hier geht der Sprung im Moment hin */
		var int jumpTarget;
		jumpTarget = MEM_ReadInt (INSTRINT_StackWalker + 1);
		
		/* Und da habe ich ihn vorhin hingebogen: */
		var int newTarget;
		newTarget = INSTRINT_ReadInt (INSTRINT_JumpTranslationTable + 4 * jumpTarget);
		
		if (newTarget) {
			INSTRINT_WriteInt (INSTRINT_StackWalker + 1, newTarget);
		} /* else {
			* Handelt sich wohl um einen Call an Funktionen in diesem Script
			* die sind ja nicht instrumentiert.
		}*/;
		
		INSTRINT_StackWalker += 5;
		return;
	} else {
		/* Ungültiges Token. Wer hat im Stack rumgepfuscht?! */
		MEM_Error (ConcatStrings ("INSTRINT_ProcessStack: Shitty Stack token: ", IntToString (tok)));
		MEM_Error ("Printing the preceding stack... (Careful! Wrong order (little Endian ints)!)");
		MEM_Error  (IntToString (MEM_ReadInt(INSTRINT_StackWalker - 20)));
		MEM_Error  (IntToString (MEM_ReadInt(INSTRINT_StackWalker - 16)));
		MEM_Error  (IntToString (MEM_ReadInt(INSTRINT_StackWalker - 12)));
		MEM_Error  (IntToString (MEM_ReadInt(INSTRINT_StackWalker -  8)));
		MEM_Error  (IntToString (MEM_ReadInt(INSTRINT_StackWalker -  4)));
		MEM_Error  (IntToString (MEM_ReadInt(INSTRINT_StackWalker -  0)));
		
		/* Exit ungracefully */
		MEM_Error  ("There's no way I'm going to continue with a shitty stack! Exiting ungracefully...");
		tok = tok / (tok - tok);
		return;
	};
};

//------------------------------------------------
//  Schleife: 
//------------------------------------------------

/* zSpy Statusupdate alle x Bytes: */
const int INTSTRINT_StackWalkNotificationDist = 50000;
var int INTSTRINT_StackWalkNextNotification;

/* Pointer auf die Funktion zwecks Jump */
var int INSTRINT_WalkThroughStack_StackPtr;

instance  INSTRINT_WalkThroughStackMinusOne (C_NPC);
func void INSTRINT_WalkThroughStack() {
	if (INSTRINT_StackWalker + 120 < INSTRINT_StackEnd) {
		/* Es werden immer maximal 6 in einem Schritt übersprungen
		 * noch mindestens 120 Bytes Stack zu verarbeiten, ergo:
		 * Es ist safe gleich 20 mal ProcessStack zu callen. */
		INSTRINT_ProcessStack(); INSTRINT_ProcessStack(); INSTRINT_ProcessStack(); INSTRINT_ProcessStack();
		INSTRINT_ProcessStack(); INSTRINT_ProcessStack(); INSTRINT_ProcessStack(); INSTRINT_ProcessStack();
		INSTRINT_ProcessStack(); INSTRINT_ProcessStack(); INSTRINT_ProcessStack(); INSTRINT_ProcessStack();
		INSTRINT_ProcessStack(); INSTRINT_ProcessStack(); INSTRINT_ProcessStack(); INSTRINT_ProcessStack();
		INSTRINT_ProcessStack(); INSTRINT_ProcessStack(); INSTRINT_ProcessStack(); INSTRINT_ProcessStack();
	} else if (INSTRINT_StackWalker < INSTRINT_StackEnd) {
		/* letztes Stück */
		INSTRINT_ProcessStack();
	} else {
		/* fertig */
		return;
	};
	
	/* Falls genug Bytes vearbeitet: Statusupdate. */
	if (INSTRINT_StackWalker > INTSTRINT_StackWalkNextNotification) {
		INTSTRINT_StackWalkNextNotification += INTSTRINT_StackWalkNotificationDist;
		INSTR_Info (ConcatStrings (ConcatStrings ("INSTR: Processing stack... ", IntToString (INSTRINT_StackEnd - INSTRINT_StackWalker)), " bytes to go."));
	};
	
	/* Jump zurück an den Anfang der Funktion */
	INSTRINT_Parser.stack_stackptr = INSTRINT_WalkThroughStack_StackPtr;
};

//------------------------------------------------
//  Vorbereitung:
//------------------------------------------------

func void INSTRINT_TranslateStackJumps() {
	/* Wie groß ist der Stack? */
	INSTRINT_StackWalker = INSTRINT_Parser.stack_stack;
	INSTRINT_StackEnd = INSTRINT_Parser.stack_stacklast;
	INSTR_Info (ConcatStrings (ConcatStrings ("INSTR: ", IntToString (INSTRINT_StackEnd - INSTRINT_StackWalker)), "bytes to search..."));
	
	/* Bereite Schleife vor (Sprungadresse für Sprung an den Anfang der Funktion): */
	var zCPar_Symbol walkThroughStack_sym;
	MEM_AssignInst (walkThroughStack_sym, MEM_ReadInt(contentSymbolTableAddress + 4 * (INSTRINT_WalkThroughStackMinusOne + 1)));
	INSTRINT_WalkThroughStack_StackPtr = walkThroughStack_sym.content + currParserStackAddress;
	
	INTSTRINT_StackWalkNextNotification = INSTRINT_StackWalker + INTSTRINT_StackWalkNotificationDist;
	
	INSTRINT_WalkThroughStack();
};

//######################################################
//
//	INSTRUMENTIERUNG: HAUPTROUTINE
//
//######################################################

func void INSTR_InstrumentFunctions() {
	var int once; if (!once) { once = true;
		INSTRINT_Enabled = INSTR_START_ENABLED;
	};
	
	MEM_SetShowDebug (1);
	INSTR_Info ("INSTR: Starting Instrumentation...");
	
	if (INSTR_IsInstrumented()) {
		/* einmal reicht */
		INSTR_Info ("INSTR: Functions already instrumented.");
		return;
	};
	
	/* setzt u.A: currSymbolTableAddress */
	MEM_SetParser (0); 
	
	/* Codepool suchen. Dort werde ich meine Calls hinbiegen */
	var zCPar_Symbol codePoolFunc;
	MEM_AssignInst (codePoolFunc, MEM_ReadInt(contentSymbolTableAddress + 4 * (INSTRINT_codepoolMinusOne + 1)));
	INSTRINT_CodePoolWalker = codePoolFunc.content + currParserStackAddress;
	
	/* Zugriff auf Parser und Symboltabelle vorbereiten */
	MEM_AssignInst (INSTRINT_Parser, ContentParserAddress);
	INSTRINT_SymbolCount = INSTRINT_Parser.symtab_table_numInArray;
	INSTRINT_currSymbol  = 0;
	INSTRINT_numInstrumented = 0;
	
	INSTR_Info (ConcatStrings (ConcatStrings ("INSTR: ", IntToString (INSTRINT_SymbolCount)), " symbols in symtab. Iterating..."));
	
	/* wird später beim behandeln der Calls gebraucht */
	INSTRINT_PrepareAssignment();
	
	/* System während der Instrumentierung ausschalten */
	var int wasEnabled; wasEnabled = INSTRINT_Enabled; INSTRINT_Enabled = 0;
	//{
		/* Übersetzungstabelle anlegen */
		INSTRINT_JumpTranslationTable = MEM_Alloc (INSTRINT_Parser.stack_stacksize * 4);
		
		/* Funktionsstart von INSTRINT_GoThroughAllSymbols ausmachen */
		var zCPar_Symbol GoThroughFunc;
		MEM_AssignInst (GoThroughFunc, MEM_ReadInt(contentSymbolTableAddress + 4 * (INSTRINT_GoThroughAllSymbolsMinusOne + 1)));
		INSTRINT_GoThroughAllSymbols_StackPtr = GoThroughFunc.content + currParserStackAddress;
		
		/* Durch alle Symbole gehen */
		INSTR_Info ("INSTR: Bending calls from the outside (zCPar_Symbol.content) ...");
		INSTRINT_GoThroughAllSymbols();
		
		/* Im Parserstack Calls umbiegen */
		INSTR_Info ("INSTR: Bending calls on the parserstack (zPAR_TOK_CALL) ...");
		INSTRINT_TranslateStackJumps();
		
		MEM_Free (INSTRINT_JumpTranslationTable);
		
		INSTRINT_SetIsInstrumented();
		INSTR_Info ("INSTR: Instrumentation done.");
	//};
	INSTRINT_Enabled = wasEnabled;
};

//######################################################
//
//	Behandlung der Calls:
//
//######################################################

//------------------------------------------------
//  Die Helperfunction wird ständig editiert
//  der Call an INSTRINT_fail wird umgebogen
//  bevor die Helperfunction aufgerufen wird
//------------------------------------------------
func void INSTRINT_fail() {
	MEM_AssertFail ("INSTRINT_Helperfunc: Should be never here!");
};

instance  INSTRINT_HelperfuncMinusOne (C_NPC) {};	
func void INSTRINT_Helperfunc() {
	INSTRINT_fail();
};

//------------------------------------------------
//  Verwalte Stack-String
//------------------------------------------------

instance INSTRINT_StackStringMinusOne (C_NPC);
var string INSTRINT_StackString; /* um diesen String geht es */

func int INSTRINT_StackStringLen() {
	/* Bestimme Länge von INSTRINT_StackString */
	
	/* Hole Symboltabelle */
	contentSymbolTableAddress = INSTRINT_ReadInt (ContentParserAddress + zCParser_symtab_table_array_offset);
	/* Schlage INSTRINT_StackString nach */
	var int sym_ptr; sym_ptr  = INSTRINT_ReadInt (contentSymbolTableAddress + 4 *  (INSTRINT_StackStringMinusOne + 1));
	/* Hole Pointer auf zSTRING */
	var int str_ptr; str_ptr  = INSTRINT_ReadInt (sym_ptr + zCParSymbol_content_offset);
	/* Hole die Länge des zSTRING */
	var int len	   ; len	  = INSTRINT_ReadInt (str_ptr + 12);
	
	return len;
};

func void INSTRINT_SetStackLen(var int len) {
	/* Ich will den String häufig verkürzen. Dazu überschreibe ich einfach die Länge */
	
	/* Hole Symboltabelle */
	contentSymbolTableAddress = INSTRINT_ReadInt (ContentParserAddress + zCParser_symtab_table_array_offset);
	/* Hole Symbol */
	var int sym_ptr; sym_ptr  = INSTRINT_ReadInt (contentSymbolTableAddress + 4 *  (INSTRINT_StackStringMinusOne + 1));
	/* Hole Pointer auf zSTRING */
	var int str_ptr; str_ptr  = INSTRINT_ReadInt (sym_ptr + zCParSymbol_content_offset);
	
	/* Überschreibe Länge */
	INSTRINT_WriteInt (str_ptr + 12, len);
};

//------------------------------------------------
//  Freigabe muss neuimplementiert werden
//  weil sonst Rückgabewerte kaputt gehen können
//------------------------------------------------

instance   INSTRINT_MEM_FreeStringMinusOne (C_NPC);
var string INSTRINT_MEM_FreeString; //immer ""

func void INSTRINT_MEM_Free (var int ptr) {
	/* Hole Symboltabelle */
	contentSymbolTableAddress = INSTRINT_ReadInt (ContentParserAddress + zCParser_symtab_table_array_offset);
	/* Schlage INSTRINT_MEM_FreeString nach */
	var int sym_ptr; sym_ptr  = INSTRINT_ReadInt (contentSymbolTableAddress + 4 *  (INSTRINT_MEM_FreeStringMinusOne + 1));
	/* Hole Pointer auf zSTRING */
	var int str_ptr; str_ptr  = INSTRINT_ReadInt (sym_ptr + zCParSymbol_content_offset);
	
	/* Überschreibe res und ptr */
	INSTRINT_WriteInt (str_ptr +  8, ptr);
	INSTRINT_WriteInt (str_ptr + 16, 1);
	
	INSTRINT_MEM_FreeString = "";
};

//------------------------------------------------
//  Merke Länge der einzelnen Funktionennamen
//  um den Stack-String entsprechend wieder
//  kürzen zu können.
//------------------------------------------------

/* Mit so tiefe Schachtelung kommt mein Script klar: */
const int INSTRINT_StackSize = 100000; /* 400kB Speicher nötig */

/* Array. INSTRINT_StackStringSegmentSizes[i] = Länge des Strings, der die ersten i Funktionen umfasst */
var int INSTRINT_StackStringSegmentSizes;
var int INSTRINT_NumInArray;
var int INSTRINT_TotalStackLength;

func void INSTRINT_PushLength () {
	/* Merke aktuelle Länge und aktualisiere INSTRINT_TotalStackLength*/
	var int length; length = INSTRINT_StackStringLen();
	
	INSTRINT_NumInArray += 1;
	
	if (INSTRINT_NumInArray == 1) {
		/* Erstes Element? Dann erstmal Array allozieren */
		
		/* Annahme: Wenn die erste Funktion gelogt wird, dann kann keine Ikarus Funktion auf dem Stack liegen,
		 * also kann ich keine Parameter dort kaputt machen und keine Rückgabewerte verändern */
		INSTRINT_StackStringSegmentSizes = MEM_Alloc (4 * INSTRINT_StackSize);
	};
	
	/* Folgende Abfrage sollte eigentlich nie falsch sein.
	 * Wer schachtelt schon bis zu einer Tiefe von 100.000?
	 * Ab diesem Wert gibts keinen vollständigen Callstack mehr */
	if (INSTRINT_NumInArray < INSTRINT_StackSize) {
		INSTRINT_WriteInt (INSTRINT_StackStringSegmentSizes + 4 * (INSTRINT_NumInArray - 1), length);
		INSTRINT_TotalStackLength = length;
	};
};

func void INSTRINT_PopLength() {
	/* Schreibe vorherige Länge wieder in INSTRINT_TotalStackLength */
	INSTRINT_NumInArray -= 1;
	
	if (INSTRINT_NumInArray < INSTRINT_StackSize) {
		INSTRINT_TotalStackLength = INSTRINT_ReadInt (INSTRINT_StackStringSegmentSizes + 4 * INSTRINT_NumInArray);
	};
	
	if (!INSTRINT_NumInArray) {
		/* Wenn ein Nutzer aus einer Instanz heraus MEM_ReadInt nutzt
		 * dann zerstöre ich mit MEM_Free den Rückgabewert. */
		//MEM_Free (INSTRINT_StackStringSegmentSizes);
		
		//Eigene Implementierung:
		INSTRINT_MEM_Free (INSTRINT_StackStringSegmentSizes);
		INSTRINT_StackStringSegmentSizes = 0;
	};
};

//######################################################
//	Das eigentliche Makecall!
//######################################################

/* Die Werte dort brauchen besondere Schutz!
 * Siehe Kommentar weiter oben. */
const int INSTRINT_instance_sym_address = 9298308;
const int INSTRINT_instance_adr_address = 9298312;

/* Ich bin nicht so konsequent, als dass ich gar keine
 * nicht instrumentierten Funktionen selbst nutzen würde.
 * Weil also Makecall mehrfach auf dem Stack liegen kann
 * muss ich mir merken ob ich die obigen Werte schon gesichtert
 * habe. Wenn ja: Nichts tun. Keine ungültigen Werte sichern! */
var int INSTRINT_saved_currSymbol;

/* Aus dem Codepool heraus wird dies aufgerufen mit symbolID und Stackpointer
 * für die Funktion, die es aufzurufen gilt */
func void INSTRINT_Makecall (var int symbolID, var int actualstackpointer) {
	//Aktuelle Instanz sichern, falls nicht schon getan!
	var int instance_sym; var int instance_adr;
	if (!INSTRINT_saved_currSymbol) {
		instance_sym = INSTRINT_ReadInt (INSTRINT_instance_sym_address);
		instance_adr = INSTRINT_ReadInt (INSTRINT_instance_adr_address);
	}; INSTRINT_saved_currSymbol += 1;
	
	if (INSTRINT_Enabled) {
		/* Falls System aktiv, hier Ausgabe des Stacks.
		 * Mein eigenes Gerödel um dies zu erreichen aber nicht
		 * mitloggen. Also kurz ausschalten. */
		INSTRINT_Enabled = false;
		
		var zCPar_Symbol sym;
		INSTRINT_AssignSymbol (sym, symbolID);
		
		if (INSTR_PRINT_FULL_STACK) {
			/* Option 1: ganzen Stack ausgeben (empfohlen). */
			
			/* Was muss an den Stackstring dran? */
			var string append_str;
			if (INSTRINT_NumInArray) {
				append_str = ConcatStrings (" -> ", sym.name);
			} else {
				append_str = sym.name;
			};
			
			/* Parameter merken, weil ich mir gleich externe
			 * Funktionen gönne, die auch durch MakeCall laufen
			 * Das geht gut, weil ich mich durch INSTRINT_Enabled = false
			 * hier absichern kann. */
			var int actualstackpointer_cpy;
			actualstackpointer_cpy = actualstackpointer;
			
			/* Aktuelle Länge merken, dann String verändern. */
			INSTRINT_PushLength();
			INSTRINT_StackString = ConcatStrings (INSTRINT_StackString, append_str);
			
			/* restore */
			actualstackpointer = actualstackpointer_cpy;
			
			INSTR_Info (ConcatStrings ("INSTR: Stack: ", INSTRINT_StackString));
		} else {
			/* Option 2: nur gerade betretene Funktion ausgeben */
			INSTR_Info (ConcatStrings ("INSTR: Entering: ", sym.name));
		};
		
		/* wieder an */
		INSTRINT_Enabled = true;
	};
	
	/* Hier nur nicht instrumentierte Funktionen erlaubt! */
	
	/* Hilfsfunktion holen */
	var zCPar_Symbol INSTRINT_HelperFuncSym;
	INSTRINT_AssignSymbol (INSTRINT_HelperFuncSym, INSTRINT_HelperfuncMinusOne + 1);
	
	/* Den Call in der Helperfunction umbiegen */
	var int stackAddr; stackAddr = INSTRINT_ReadInt (ContentParserAddress + zCParser_stack_offset);
	INSTRINT_WriteInt (stackAddr + INSTRINT_HelperFuncSym.content + 1, actualstackpointer);
	
	/* vor dem Call noch schnell aktuelles Symbol wiederherstellen */
	INSTRINT_saved_currSymbol -= 1;
	if (!INSTRINT_saved_currSymbol) {
		INSTRINT_WriteInt (INSTRINT_instance_sym_address, instance_sym);
		INSTRINT_WriteInt (INSTRINT_instance_adr_address, instance_adr);
	};

	/* CALL ! */
	INSTRINT_Helperfunc();
	
	if (INSTRINT_Enabled) {
		/* Nachbereitung: */
		if (INSTR_PRINT_FULL_STACK) {
			/* Option: Ganzer Stack (empfohlen). */
			
			/* wieder absichern und Zeug speichern */
			INSTRINT_Enabled = false;
			
			if (!INSTRINT_saved_currSymbol) {
				instance_sym = INSTRINT_ReadInt (INSTRINT_instance_sym_address);
				instance_adr = INSTRINT_ReadInt (INSTRINT_instance_adr_address);
			}; INSTRINT_saved_currSymbol += 1;
			
			/* Frühere Länge des Stackstrings holen und Länge setzen */
			INSTRINT_PopLength();
			INSTRINT_SetStackLen (INSTRINT_TotalStackLength);
			INSTR_Info (ConcatStrings ("INSTR: Stack: ", INSTRINT_StackString));
			
			/* restore */
			INSTRINT_saved_currSymbol -= 1;
			if (!INSTRINT_saved_currSymbol) {
				INSTRINT_WriteInt (INSTRINT_instance_sym_address, instance_sym);
				INSTRINT_WriteInt (INSTRINT_instance_adr_address, instance_adr);
			};
			INSTRINT_Enabled = true;
		} else {
			/* Option 2: Langweilig. */
			INSTR_Info ("INSTR: Exiting...");
		};
	};
};

//Markiert Ende der Datei (alle Symbole hierdrin haben index < INSTRINT_CodeEnd).
instance INSTRINT_CodeEnd (C_NPC);