/***********************************\
			 HOOKENGINE
\***********************************/
func MEMINT_HelperClass _^ (var int ptr) 
{	
	MEM_PtrToInst (ptr);
};

func int MEM_ReadByte (var int adr) 
{
   return MEM_ReadInt (adr) & 255;
};

func int MEM_GetFuncID(var func fnc) 
{
   var zCPar_Symbol symb; /* dummy symbol with index indexOf(fnc)+1 */
   symb = MEM_PtrToInst(MEM_ReadIntArray(contentSymbolTableAddress, symb - 1));
   
   var int res;
   var int loop; loop = MEM_StackPos.position;
	
   if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_FUNC) 
	{
	  MEM_Warn("MEM_GetFuncID: Unresolvable request (probably uninitialised function variable).");
	  return -1;
   };
	
   if (symb.bitfield & zPAR_FLAG_CONST) 
	{
	  return +res;
   } 
	else 
	{
	  res = symb.content;
	  symb = MEM_PtrToInst(MEM_ReadIntArray(contentSymbolTableAddress, res));
	  MEM_StackPos.position = loop;
   };
};
//-------------------
// OPCODES
//-------------------
// /* 1 Byte */

const int ASMINT_OP_movEAXtoEDI = 51081; //0xC789
const int ASMINT_OP_addImToEAX	  = 49283; //0xC083  aus LeGo geklaut
const int ASMINT_OP_movEDItoEAX	 = 51083; //0xC78B  aus LeGo geklaut
//-------------------
// Registervariablen
//-------------------

var int EDI;
func int GetEDI() { return EDI; };
func int EDIAdr() 
{
	GetEDI();
	MEMINT_StackPopInst();
	MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};   

//========================================
// Engine hooken
//========================================
func void HookEngineI(var int address, var int oldInstr, var int function) 
{
   var int SymbID;   // Symbolindex von 'function'
   var int ptr;	  // Pointer auf den Zwischenspeicher der alten Anweisung
   var int relAdr;   // Relative Addresse zum neuen Assemblercode, ausgehend von 'address'

   // ----- Sicherheitsabfragen -----
   if(oldInstr < 5) 
	{
	  PrintDebug("HOOKENGINE: oldInstr ist zu kurz. Es werden mindestens 5 Bytes erwartet.");
	  return;
   };

   SymbID = function;
   if(SymbID == -1) 
	{
	  PrintDebug("HOOKENGINE: Die gegebene Daedalusfunktion kann nicht gefunden werden.");
	  return;
   };

   MemoryProtectionOverride (address, oldInstr+3);
   // ----- Eventuell geschützen Speicher behandeln -----

   if (MEM_ReadByte(address) == 233) { // Hook schon vorhanden
	  HookEngineI(MEM_ReadInt(address+1)+address+5+96, oldInstr, function);
	  return;
   };

	// ----- Die alte Anweisung sichern -----
	ptr = MEM_Alloc(oldInstr);
	MEM_CopyBytes(address, ptr, oldInstr);

	// ----- Einen neuen Stream für den Assemblercode anlegen -----
	ASM_Open(200 + oldInstr); // Play it safe.

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
	ASM_2(ASMINT_OP_addImToEAX);
	ASM_1(4*8);				  // Wegen pushad [Danke an Sektenspinner]
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

	// EDI in Daedalus Variable sichern
	ASM_2(ASMINT_OP_movEDItoEAX);
	ASM_2(ASMINT_OP_movEAXtoMem);
	ASM_4(EDIAdr());
	
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
		
	ASM_1(ASMINT_OP_movMemToEax);
	ASM_4(EDIAdr());
	ASM_2(ASMINT_OP_movEAXtoEDI);

	ASM_1(ASMINT_OP_movMemToEAX);
	ASM_4(EAXAdr());

	// Alte Anweisung wieder einfügen
	MEM_CopyBytes(ptr, ASMINT_Cursor, oldInstr);
	MEM_Free(ptr);

	ASMINT_Cursor += oldInstr;

	// Zur Enginefunktion zurückkehren
	ASM_1(ASMINT_OP_pushIm);
	ASM_4(address + oldInstr);
	ASM_1(ASMINT_OP_retn);

	var int i; i = ASM_Close();
};

func void HookEngineF(var int address, var int oldInstr, var func function) 
{
	HookEngineI(address, oldInstr, MEM_GetFuncID(function));
};
