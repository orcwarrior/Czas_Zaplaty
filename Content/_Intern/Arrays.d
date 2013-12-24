//#################################################################
//
//  Array Npcs:
//
//#################################################################

//************************************
//		Konstanten
//************************************

const int NAN = -1; //Wird zurückgegeben, wenn Offset die Arraygrenzen überschreitet

const int ERROR_NONE = 0;
const int ERROR_CRITICAL = 1;
const int ERROR_WARNINGS = 2;
const int ERROR_INFORMATION = 3;

var int Arr_Print_Errors;
const int ARR_PRINT_ERRORS_DEF = ERROR_WARNINGS; //je nachdem was alles angezeigt werden soll

const int AIVAR_SIZE = 50; // Ork: Tutaj by³o magiczne 100 -> jednak jak wiadomo, w G1 aivarów jest 50 :)

//************************************
//		Hilfsfunktionen
//************************************

var int PrintDebug_5S_Pos;

func void PrintDebug_5S (var int ErrorType, var string s1, var string s2, var string s3, var string s4, var string s5)
{
	//ConcatStrings nervt, daher diese Funktion die fünf Strings zusammen bastelt:
	
	if (ErrorType > ARR_PRINT_ERRORS)
	{
		//Wenn die Meldung ausgestellt, dann:
		return;
	};
	
	s1 = ConcatStrings (s1,s2);
	s1 = ConcatStrings (s1,s3);
	s1 = ConcatStrings (s1,s4);
	s1 = ConcatStrings (s1,s5);
	s1 = ConcatStrings (s1,"."); //damit überhaupt was da ist.
	
	PrintDebug_5S_Pos += 5;
	
	if (PrintDebug_5S_Pos >= 100)
	{
		 PrintDebug_5S_Pos = 5;
	};
	 
	PrintScreen (s1, 5, PrintDebug_5S_Pos, "font_default.tga", 5);
	PrintDebug (s1);
};

//Irgendein Npc, bei dem das Spiel gerade nicht abstürzt, der eine Routine hat:
const string ARR_HELPER_NPC_NAME = "Array-Container";

PROTOTYPE ArrayContainer (C_NPC)
{
	name = ARR_HELPER_NPC_NAME;
	
	//unsterblich:
	flags = 2;
	attribute	[ATR_HITPOINTS_MAX] = 2; //2! Bei einem wird er bewusstlos, wenn er geschlagen wird! Ololo! :-D
	attribute	[ATR_HITPOINTS] 	= 2;
	
	//blödes Visual:
	Mdl_SetVisual			(self,	"Meatbug.mds");
	
	//wichtig:
	exp_next = -1; //Standardmäßig KEIN folgendes Array
	lp = -1; //Standardmäßig kein Längeneintrag, nur manche ArrayElemente sind ein Array-Start.
	
	//exp wird verwendet um freigewordene ArrayContainer zu markieren.
	//guild wird verwendet um beim 2D Array die Länge in X-Richtung zu speichern.
};

//************************************
//	Die Verkettete Liste von Npcs
//************************************
INSTANCE Arr_AStart_Npc		(ArrayContainer) {  };
INSTANCE Arr_Element_Npc	(ArrayContainer) {  };

var C_NPC Arr_Start;
var C_NPC Arr_End;

//--------------------------------------
// Backup von self und other
//--------------------------------------

var C_NPC Arr_slfBak;
var C_NPC Arr_othBak;

var int Arr_BackUpNesting;
func void Arr_BackUpGlobals() {
	if (!Arr_BackUpNesting) {
		Arr_slfBak = Hlp_GetNpc (self);
		Arr_othBak = Hlp_GetNpc (other);
	};
	
	Arr_BackUpNesting += 1;
};

func void Arr_RestoreGlobals() {
	Arr_BackUpNesting -= 1;
	
	if (!Arr_BackUpNesting) {
		self  = Hlp_GetNpc (Arr_slfBak);
		other = Hlp_GetNpc (Arr_othBak);
	};
};

func void Arr_Init()
{
	Wld_InsertNpc (Arr_AStart_Npc, MEM_FARFARAWAY);
	
	Arr_Print_Errors = ARR_PRINT_ERRORS_DEF;
	
	Arr_Start = Hlp_GetNpc (self);
	Arr_End = Hlp_GetNpc (Arr_Start);
		
	self.level = 0;
};
		
//***************************************************
//		Die C_NPCs nach dem Levelstart wieder holen
//***************************************************

func void Arr_ReInitArrHigh()
{
	if (Npc_GetTarget (Arr_End))
	{
		Arr_End = Hlp_GetNpc (other);
		Arr_ReInitArrHigh();
	};
};

func void Arr_ReInitStartAndHigh()
{
	Arr_BackUpGlobals();
	
	Arr_Start = Hlp_GetNpc (Arr_AStart_Npc);
	
	if (!Hlp_IsValidNpc (Arr_Start)) //Noch kein Arr_Start!!!
	{
		Arr_Init();
	};
	
	Arr_End = Hlp_GetNpc (Arr_Start);
	Arr_ReInitArrHigh();
	
	Arr_RestoreGlobals();
};

//************************************
//		Ein ArrayElement hinzufügen
//************************************

func int Arr_FindFreeElement_Sub()
{
	if (other.exp == TRUE)
	{
		return TRUE; //other ist frei; hier kann wieder drauf geschrieben werden!
	}
	else if (Npc_GetTarget (other))
	{
		return Arr_FindFreeElement_Sub(); //other ist zwar nicht frei, hat aber noch ein target wo ich weitersuchen kann
	}
	else
	{
		return FALSE; //Die Liste ist zu Ende, ein geeignetes Element ist nicht gefunden -> FALSE!
	};
};

func int Arr_FindFreeElement()
{
	if (Npc_GetTarget (Arr_Start))
	{
		return Arr_FindFreeElement_Sub();
	}
	else
	{
		return FALSE;
	};
};
	
func void Arr_AddElement (var C_NPC last) //hinterher steht der neue Npc in self
{
	if (!Arr_FindFreeElement())
	{
		//Kein freigewordenes Element? Dann neues Erzeugen!
		Wld_InsertNpc (Arr_Element_Npc, MEM_FARFARAWAY); //jetzt steht er in self drin
	
		//verketten in der Reihenfolge in der eingefügt wurde
		
		//der vorherige (der bisher höchste) hat jetzt mich als Target
		Npc_SetTarget (Arr_End, self);
		var int res; //Gegen Stackoverflow
		res = Npc_GetTarget (Arr_End); //other soll auch initialisiert sein
			
		//Ich habe eine höhere ID als mein Vorgänger
		self.level = Arr_End.level + 1;
			
		//Und ich bin jetzt Arr_End
		Arr_End = Hlp_GetNpc (self);
	}
	else
	{
		other.exp = FALSE; //other ist frei, hier kann jetzt drauf geschrieben werden!
	};
	
	if (Hlp_GetInstanceID (last) != Hlp_GetInstanceID (Arr_Start))
	{
		//Dann wurde ein Vorfahre in last angegeben
		last.exp_next = other.level;
	};
};

//************************************
//		Ein ArrayElement suchen
//************************************

func int Arr_GetElementByID_Sub (var int ID)
{
	//Nur wenn die ID nicht stimmt etwas machen
	if (other.level != ID)
	{
		if (Npc_GetTarget (other))
		{
			//Dann weitersuchen
			return Arr_GetElementByID_Sub (ID);
		}
		else
		{
			//ungültig, nichts gefunden
			
			return FALSE;
		};
	}
	else
	{
		//other ist jetzt richtig initialisiert
		
		return TRUE;
	};
};

func int Arr_GetElementByID (var int arr_ID)
{
	//Speed-Hack für viele Zugriffe aufs selbe (kurze) Array:
	if (Hlp_IsValidNpc (other)) {
		//Wenn in other schon der richtige Npc steht
		if (Hlp_StrCmp (other.name, ARR_HELPER_NPC_NAME))
		&& (other.level == arr_ID) {
			//dann nicht ganz von vorne loslaufen
			return TRUE;
		};
	};
	
	if (arr_ID <= 0) { return FALSE; }; //Keine Npcs mit negativen IDs! Auch nicht der Start des Arrays!
	
	if (Npc_GetTarget(Arr_Start))
	{
		//Rekursive Suche nach dem Element mit der richtigen ID, startend von Arr_Start
		return Arr_GetElementByID_Sub (arr_ID);
	}
	else
	{
		return FALSE;
	};
};

//************************************
//		Gleich noch auf gültigkeit prüfen hiermit:
//************************************

func int Arr_GetValidArray (var int arr_ID)
{
	//Lieber ein bisschen umständlich, denn in einer && Verknüpfung wertet Gothic in der falschen Reihenfolge aus!
	if (!Arr_GetElementByID (arr_ID))
	{
		return FALSE;
	}
	else if (other.LP != -1) //-1 würde bedeuten, dass das kein gescheites Array ist!
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int Arr_IsValidArray (var int arr_ID) {
	/* GetValidArray schreibt zusätzlich das Array in other rein.
	 * Das ist nicht, was der Nutzer will */
	Arr_BackUpGlobals();
	
	var int res; res = Arr_GetValidArray (arr_ID);
	Arr_RestoreGlobals();	
	return res;
};

//**************************************************
//	Einen Wert im Array setzen oder von dort holen
//**************************************************

func int Arr_Walker (var int offset, var int dyn_create)
{
	if (offset >= AIVAR_SIZE) //nur dann brauche ich den nächsten Npc
	{
		//Wenn Offset zu groß nächsten Npc suchen
				
		if (!Arr_GetElementByID (other.exp_next)) //other aktualisiert
		{
			//das nächste Stück des Arrays existiert noch nicht
			
			if (dyn_create)
			{
				//das Array ist zu kurz? dynamisch verlängern:
				Arr_AddElement (other); //neues Ding jetzt in other
				return Arr_Walker (offset - AIVAR_SIZE, dyn_create); //weiter gehts, 100 sind geschafft
			}
			else
			{
				//Kein Wert vorhanden zum abfragen und einen neuen will ich nicht erstellen!
				return FALSE; //fehlgeschlagen!
			};
		}
		else
		{
			//es geht weiter! 100 habe ich geschafft
			return Arr_Walker (offset - AIVAR_SIZE, dyn_create);
		};
	}
	else
	{
		return TRUE; //Erfolg! Jetzt kann auf other geschrieben/gelesen werden
	};
};

//setzen
func void Arr_SetValue (var int arr_ID, var int offset, var int value)
{
	Arr_BackUpGlobals();
	
	//Den Faden finden:
	if (!Arr_GetValidArray (arr_ID)) //jetzt steht er in other
	{
		var string s1; s1 = IntToString (arr_ID);
		var string s2;
			
		PrintDebug_5S (ERROR_CRITICAL, "ARRAYS: Error: ", "Es gibt kein Array mit Array-ID: ", s1, "", "<-Arr_SetValue");
		
		//Error um die Ohren und raus hier!
		Arr_RestoreGlobals();
		return;
	};
	
	if (Offset < 0)
	{
		s1 = IntToString (offset);
		s2 = IntToString (arr_ID);
		
		//Error um die Ohren und raus hier!
		PrintDebug_5S (ERROR_CRITICAL, "ARRAYS: Error: Du versuchst auf einem Offset < 0 zu schreiben: Offset ", s1, "; ArrayID : ", s2, "<-Arr_SetValue");
		
		Arr_RestoreGlobals();
		return;
	};
	
	if (other.lp <= offset) //Array zu klein!
	{
		//Das Array wird länger:
		other.lp = offset + 1;
		
		s1 = IntToString (offset);
		s2 = IntToString (arr_ID);
		
		PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: Schreiben hinter Array Grenze. Das Array wird verlängert. Offset: ", s1, "; ArrayID: ", s2, "");
	};
	
	//dem Faden folgen, bis das gewünscht offset greifbar ist:
	var int res;
	res = Arr_Walker (offset, TRUE); //dynamic create damit das Array automatisch vergrößert wird
	//assert: res == 1.
	
	//und den Wert setzen:
	__Npc_SetAivar (other, offset % AIVAR_SIZE, value);
	
	Arr_RestoreGlobals();
};

//holen

func int Arr_GetValue (var int arr_ID, var int offset)
{
	Arr_BackUpGlobals();
	
	if (!Arr_GetValidArray (arr_ID)) //jetzt steht er in other
	{
		var string s1; s1 = IntToString (arr_ID);
		var string s2;
			
		PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: ", "Es gibt kein Array mit Array-ID: ", s1, "", "; NAN zurückgegeben <-Arr_GetValue");
		
		//Error um die Ohren und raus hier!
		Arr_RestoreGlobals();
		return NAN;
	};
	
	if (other.lp <= offset)
	|| (offset < 0)
	{
		s1 = IntToString (arr_ID);
		s2 = IntToString (offset);
		
		PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: Abfrage jenseits der Array Grenzen bei Array: ", s1, "; Offset: ", s2, "; NAN zurückgegeben. <-Arr_GetValue");
		
		//Ein Wert hinter der Arraygrenze? Da wird NAN zurückgegeben.
		Arr_RestoreGlobals();
		return NAN;
	};
	
	//Alles innerhalber der Grenzen:
	if (!Arr_Walker (offset, FALSE)) //nichts dynamisch kreierien!
	{
		//Es kann sein, dass ein Array theoretisch länger ist, als praktisch in Form von Array Elementen aufgebaut. Das ist genau dann, wenn an diese Stelle noch nicht geschrieben wurde. Folglich hat dort 0 zu stehen.
		Arr_RestoreGlobals();
		return 0;
	}
	else //alles prima, es kann von other gelesen werden
	{
		var int res; res = __Npc_GetAivar (other, offset % AIVAR_SIZE);
		Arr_RestoreGlobals();
		return res;
	};
};

//************************************
//		Array zerstören
//************************************

func void Arr_Free (var int arr_ID)
{
	Arr_BackUpGlobals();
	
	if (Arr_GetElementByID (arr_ID)) //steht jetzt in other (sofern vorhanden, wenn nicht, dann 
	&& (arr_ID != 0) //Den ArrayStart bitte nicht freigeben!
	{
		//Kein Array mehr (falls es überhaupt ein array start war)
		other.lp = -1;
	
		other.exp = TRUE;
		
		Npc_ClearAivars (other); //damit es, wenn es neu reserviert wird wie neu ist
	
		//evtl. folgende Array Elemente auch entfernen
		var int tmp;
		tmp = other.exp_next;
		other.exp_next = -1; //Jetzt keinen Nachfolger mehr. Hier verändern, bevor sich other ändert!
		Arr_Free (tmp); //Aufpassen! Das verändert other! Daher ist die tmp Variable nötig
	};
	
	Arr_RestoreGlobals();
};

//Array ab einem gewissen Punkt leeren

func void Arr_ClearFrom (var int offset) //das betreffende Array muss in other stehen!
{
	if (Arr_Walker (offset, FALSE)) //natürlich nichts neu erstellen, daher false!
	{
		//Jetzt steht in other das Objekt, indem der Clear tatsächlich losgeht.
	
		Npc_ClearAivarsFrom (other, offset % AIVAR_SIZE);
		
		//evtl. folgende Elemente auch freigeben:
		var int tmp;
		tmp = other.exp_next;
		other.exp_next = -1; //Jetzt keinen Nachfolger mehr. Hier verändern, bevor sich other ändert!
		
		Arr_Free (tmp); //Aufpassen! Das verändert other! Daher ist die tmp Variable nötig
	};
};

//************************************
//		Arrays erzeugen und Längen verändern
//************************************

func int Arr_Create()
{
	Arr_BackUpGlobals();
	
	//Gothic, du bist verdammt noch mal doof! Ich habe hier NULL eingesetzt und als was interpretierst du das?
	//Als self bzw. other!? Welcher Schehrenspüler hat das denn so programmiert?
	
	Arr_AddElement (Arr_Start); //Jetzt anders gelöst: Arr_Start bedeutet kein Vorfahre.
	
	//Die Länge 0 und damit gültiges Array
	other.lp = 0;
	
	var string s1; s1 = InttoString (other.lp);
	var string s2; s2 = IntToString (other.level);
	
	PrintDebug_5S (ERROR_INFORMATION, s1, s2, "", "", "<-Arr_Create");
	
	//Damit die aufrufende Funktion etwas mit dem Array machen kann, die ID:
	var int res; res = other.level;
	Arr_RestoreGlobals();
	return res;
};

func int Arr_Length (var int arr_ID)
{
	Arr_BackUpGlobals();
	
	if (!Arr_GetValidArray (arr_ID)) //jetzt steht er in other
	{
		var string s1; s1 = IntToString (arr_ID);
			
		PrintDebug_5S (ERROR_CRITICAL, "ARRAYS: Error: ", "Es gibt kein Array mit Array-ID: ", s1, "", "; NAN zurückgegeben <-Length");
		
		//Meckern und NAN zurückgeben.
		Arr_RestoreGlobals();
		return NAN;
	}
	else
	{
		//ansonsten die Länge zurückgeben
		var int res; res = other.lp;
		Arr_RestoreGlobals();
		return res;
	};
};

func int Arr_High (var int arr_ID)
{
	//Das selbe in Grün
	return Arr_Length (arr_ID) - 1;
};

func void Arr_SetLength (var int arr_ID, var int newLength)
{
	Arr_BackUpGlobals();
	
	if (!Arr_GetValidArray (arr_ID)) //jetzt steht er in other
	{
		var string s1; s1 = IntToString (arr_ID);
		var string s2;
			
		PrintDebug_5S (ERROR_CRITICAL, "ARRAYS: Error: ", "Es gibt kein Array mit Array-ID: ", s1, "", " <-SetLength");
		
		//Meckern und raus hier
		Arr_RestoreGlobals();
		return;
	};
	
	if (newLength < 0)
	{
		s1 = IntToString (arr_ID);
		s2 = IntToString (newLength);
		
		PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: Eine negative Länge ist für ein Array nicht erlaubt. ArrayID: ", s1, "; gewünschte Länge: ", s2, "; Der Befehl ist unwirksam. <-SetLength");
		
		//raus hier!
		Arr_RestoreGlobals();
		return;
	};
	
	other.lp = newLength;
	Arr_ClearFrom (newLength);
	
	Arr_RestoreGlobals();
};

//************************************
//		Hilfsfunktionen:
//************************************

func void Arr_Append (var int arr_ID, var int value)
{
	Arr_BackUpGlobals();
	
	var int length;
	
	length = Arr_Length (arr_ID);
	
	if (length >= 0) //sonst gibts woanders einen Error um die Ohren!
	{
		Arr_SetLength (arr_ID, Length + 1);
		Arr_SetValue (arr_ID, length, value); //Array verlängert, Wert eingetragen
		
		Arr_RestoreGlobals();
		
		//Im Zuge der Anti-Stack-Overflow Erneuerung leider kein Rückgabewert mehr.
		//Die meisten werden ihn nicht brauchen.
		return ; // length; //Der Index des neuen Elements
	}
	else
	{
		Arr_RestoreGlobals();
		return ; // NAN;
	};
};

func int Arr_SearchFor (var int arr_ID, var int value, var int start, var int last)
{
	// rekursive Suche nach einem Element
	
	if (start <= last)
	{
		var int foundvalue;
		
		foundvalue = Arr_GetValue (arr_ID, start);
		
		if (foundvalue == value)
		{
			return start;
		}
		else
		{
			return Arr_SearchFor (arr_ID, value, start + 1, last);
		};
	}
	else
	{
		return NAN; //Nichts gefunden.
	};
};

func int Arr_IndexOf (var int arr_ID, var int value)
{
	Arr_BackUpGlobals();
	
	var int length;
	
	length = Arr_Length (arr_ID);
	
	if (length >= 0) //sonst gibts woanders einen Error um die Ohren!
	{
		var int res; res = Arr_SearchFor (arr_ID, value, 0, length - 1);
		Arr_RestoreGlobals();
		return res;
	}
	else
	{
		Arr_RestoreGlobals();
		return NAN;
	};
};

//#################################################################
//
//  2D-Arrays
//
//#################################################################

//2D Arrays sind eine Anwendung der 1D Arrays (ein Array von Arrays),
//allerdings erfordert das ganze dann doch eine ganze Menge an zusätzlichen Funktionen.
//In einem Array (Dimension Y) liegen die ArrayIDs der einzelnen Arrays (Dimension X).
//Zusätzlich wird nun auch guild benutzt um zu kennzeichnen wie Lang das Array in X-Richtung ist.

//************************************
//		Erzeugen ist einfach
//************************************

func int Arr2D_Create()
{
	return Arr_Create();
};

//************************************
//		Länge holen
//************************************

//Dies ist die Länge der einzelnen Teilarrays. Die Länge wird aber nicht dort gespeichert, sondern im Hauptarray als "guild"
func int Arr2D_LengthX(var int arr_ID)
{
	Arr_BackUpGlobals();
	
	if (!Arr_GetValidArray (arr_ID)) //jetzt steht er in other
	{
		var string s1; s1 = IntToString (arr_ID);
		var string s2;
			
		PrintDebug_5S (ERROR_CRITICAL, "ARRAYS: Error: ", "Es gibt kein 2D Array mit Array-ID: ", s1, "; NAN zurückgegeben.", " <-Arr2D_LengthX");
		
		Arr_RestoreGlobals();
		return NAN;
	}
	else
	{
		Arr_RestoreGlobals();
		return other.guild; //Hier wird die Länge in X-Richtung gespeichert
	};
};
	
func int Arr2D_LengthY(var int arr_ID)
{
	//Ganz einfach die Länge des Mutterarrays
	return Arr_Length(arr_ID);
};

//Und das ganze nochmal -1
func int Arr2D_HighX(var int arr_ID)
{
	return Arr2D_LengthX(arr_ID) - 1;
};

func int Arr2D_HighY(var int arr_ID)
{
	return Arr2D_LengthY (arr_ID) - 1;
};

//************************************
//		Längen setzen
//************************************

//Wenn das Array verkürzt wird, müssen die Arrays, die wegfallen (falls vorhanden) freigegeben werden!
func void Arr2D_FreeFrom(var int arr_ID, var int pos, var int lastPos)
{
	if (pos <= lastPos)
	{
		var int Arr2Free_ID;
		
		//die Funktion wird nur von mir benutzt, die Gültigkeitsprüfung spare ich mir.
		Arr2Free_ID = Arr_GetValue (arr_ID, pos);
		
		Arr_Free (Arr2Free_ID); //Es kann durchaus sein, dass da kein Array ist, aber freigeben geht immer.
		
		Arr_SetValue (arr_ID, pos, 0); //Eintrag im Mutterarray entfernen!
		
		//und weiter beim nächsten
		Arr2D_FreeFrom (arr_ID, pos + 1, lastpos);
	};
};

//Die y-Länge ist die Menge von Subarrays. Wird die y-Länge geändert, werden ggf. Subarrays freigeben. Es werden aber keine neuen erstellt, das geschieht erst bei Bedarf.
func void Arr2D_SetLengthY (var int arr_ID, var int newLength)
{
	Arr_BackUpGlobals();
	
	if (!Arr_GetValidArray (arr_ID)) //jetzt steht er in other
	{
		var string s1; s1 = IntToString (arr_ID);
			
		PrintDebug_5S (ERROR_CRITICAL, "ARRAYS: Error: ", "Es gibt kein 2D Array mit Array-ID: ", s1, "", " <-Arr2D_SetLengthY");
		
		Arr_RestoreGlobals();
		return;
	};
	
	var int oldLength;
	oldLength = other.LP;
	
	if (newLength < 0)
	{
		var string s2;
		s1 = IntToString (arr_ID);
		s2 = IntToString (newLength);
		
		PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: Eine negative Länge ist für ein Array nicht erlaubt. ArrayID: ", s1, "; gewünschte Länge: ", s2, "; Der Befehl ist unwirksam. <-Arr2D_SetLengthY");
		
		//raus hier!
		Arr_RestoreGlobals();
		return;
	};
	
	if (newLength < oldLength) {
		Arr2D_FreeFrom (arr_ID, newLength, oldlength - 1);
	};
	
	//Die Arrays werden noch nicht angelegt, es wird nur platz für sie geschaffen.
	Arr_SetLength (arr_ID, newLength); //Wenn die Eingaben vernünftig waren wird das klappen
	Arr_RestoreGlobals();
};

//Die X-Länge wird nur im Mutterarray verwaltet. Bei den SubArrays wird erst eingegriffen, wenn sie tatsächlich angesprochen werden.
func void Arr2D_SetLengthX (var int arr_ID, var int newlength)
{
	Arr_BackUpGlobals();
	
	if (!Arr_GetValidArray (arr_ID)) //jetzt steht er in other
	{
		var string s1; s1 = IntToString (arr_ID);
		var string s2;
			
		PrintDebug_5S (ERROR_CRITICAL, "ARRAYS: Error: ", "Es gibt kein 2D Array mit Array-ID: ", s1, "", " <-Arr2D_SetLengthX");
		
		Arr_RestoreGlobals();
		return;
	}
	else if (newLength < 0)
	{
		s1 = IntToString (arr_ID);
		s2 = IntToString (newLength);
		
		PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: Eine negative Länge ist für ein Array nicht erlaubt. ArrayID: ", s1, "; gewünschte Länge: ", s2, "; Der Befehl ist unwirksam.<-Arr2D_SetLengthX");
		
		//raus hier!
		Arr_RestoreGlobals();
		return;
	}
	else
	{
		other.guild = newlength; //Nur im Mutterarray den Eintrag ändern, mehr nicht!
		
		Arr_RestoreGlobals();
		return;
	};
};

//************************************
//		Werte holen und eintragen
//************************************

func int Arr2D_GetValue(var int arr_ID, var int offsetX, var int offsetY)
{
	Arr_BackUpGlobals();
	
	if (!Arr_GetValidArray (arr_ID)) //überhaupt ein gültiges Array?
	{
		var string s1; s1 = IntToString (arr_ID);
		var string s2;
			
		PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: ", "Es gibt kein 2D Array mit Array-ID: ", s1, "; NAN zurückgegeben. ", " <-Arr2D_GetValue");
		
		Arr_RestoreGlobals();
		return NAN;
	};
	
	//ArrayID der Zeile holen
	var int SubArray;
	SubArray = Arr_GetValue (arr_ID, offsetY);
	
	if (SubArray == NAN)
	{
		s1 = IntToString (offsetY);
		s2 = IntToString (arr_ID);
		PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: Ungültiger OffsetY bei 2D-Array: ", s2, "; OffsetY: ", s1, "; NAN zurückgegeben. <-Arr2D_GetValue");
		
		Arr_RestoreGlobals();
		return NAN; //Dann war der Y-Offset ungültig!
	}
	else
	{
		var int LengthX;
		LengthX = Arr2D_LengthX (arr_ID);
		
		if (LengthX <= offsetX)
		{
			s1 = IntToString (offsetX);
			s2 = IntToString (arr_ID);
			PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: Ungültiger OffsetX bei 2D-Array: ", s2, "; OffsetX: ", s1, "; NAN zurückgegeben. <-Arr2D_GetValue");
		
			Arr_RestoreGlobals();
			return NAN; //Abfrage jenseits der X Grenzen gibt auch NAN
		}
		else if (SubArray == 0)
		{
			//Möglicherweise wurde das Array noch gar nicht erstellt, weil noch nichts herausgeschrieben wurde.
			//dann steht aber garantiert 0 drin:
			
			Arr_RestoreGlobals();
			return 0;
		}
		else
		{
			//Achtung! Ich habe ggf. die Länge des SubArrays noch nicht mit der internen Länge abgestimmt:
			Arr_SetLength (SubArray, LengthX);
			
			var int res; res = Arr_GetValue (SubArray, offsetX);
			Arr_RestoreGlobals();
			return res;
		};
	};
};

func void Arr2D_SetValue (var int arr_ID, var int offsetX, var int offsetY, var int value)
{
	Arr_BackUpGlobals();
	
	if (!Arr_GetValidArray (arr_ID)) //überhaupt ein gültiges Array?
	{
		var string s1; s1 = IntToString (arr_ID);
		var string s2;
		var string s3;
		
		PrintDebug_5S (ERROR_CRITICAL, "ARRAYS: Error: ", "Es gibt kein 2D Array mit Array-ID: ", s1, "", " <-Arr2D_SetValue");
		
		Arr_RestoreGlobals();
		return;
	}
	else if (OffsetY < 0)
	{
		s1 = IntToString (offsetY);
		s2 = IntToString (arr_ID);
		
		//Error um die Ohren und raus hier!
		PrintDebug_5S (ERROR_CRITICAL, "ARRAYS: Error: Du versuchst auf einem OffsetY < 0 zu schreiben: OffsetY ", s1, "; 2DArrayID : ", s2, " <- Arr2D_SetValue");
		
		Arr_RestoreGlobals();
		return;
	}
	else
	{
		if (other.LP <= offsetY) //zu großer yOffset?
		{
			s1 = IntToString (arr_ID);
			s2 = IntToString (offsetY);
			s3 = IntToString (other.LP);
			
			PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: Das 2D Array mit Y-Länge: ", s3, " ist zu kurz für OffsetY: ", s2, "; Es wird verlängert! <-Arr2D_SetValue");
			
			Arr2D_SetLengthY (arr_ID, offsetY + 1);
		};
		
		var int xLength;
		xLength = Arr2D_LengthX (arr_ID);
		
		if (xLength <= offsetX) //zu großer xOffset
		{
			s1 = IntToString (arr_ID);
			s2 = IntToString (offsetX);
			s3 = IntToString (xLength);
			
			PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: Das 2D Array mit X-Länge: ", s3, " ist zu kurz für OffsetX: ", s2, "; Es wird verlängert! <-Arr2D_SetValue");
			
			Arr2D_SetLengthX (arr_ID, offsetX + 1);
			xLength = Arr2D_LengthX (arr_ID);
		};
		
		//ArrayID der Zeile holen
		var int SubArray;
		SubArray = Arr_GetValue (arr_ID, offsetY);
		
		//Möglicherweise wurde das SubArray auch noch nicht erstellt und jetzt wird zum ersten mal reingeschrieben:
		if (SubArray == 0)
		{
			SubArray = Arr_Create(); //Wenn nicht da, dann erstellen
			Arr_SetValue (arr_ID, offsetY, SubArray); //Dann auch im MutterArray eintragen
		};
		
		//Achtung! Ich habe ggf. die Länge des SubArrays noch nicht mit der internen Länge abgestimmt:
		Arr_SetLength (SubArray, xLength);
		
		//Jetzt ist SubArray auf jeden Fall richtig initialisiert. Es kann geschrieben werden:
		Arr_SetValue (SubArray, offsetX, value);
		Arr_RestoreGlobals();
		return;
	};
};

//************************************
//		Freigeben
//************************************

func void Arr2D_Free (var int arr_ID)
{
	Arr_BackUpGlobals();
	
	if (Arr_GetElementByID (arr_ID)) //steht jetzt in other (sofern vorhanden, wenn nicht, dann gibts nix zum freigeben
	&& (arr_ID != 0) //Den ArrayStart bitte nicht freigeben!
	{
		other.guild = 0; //Kein 2D Array mehr, keine X-Länge.
		Arr2D_SetLengthY (arr_ID, 0); //Erstmal alle subarrays raushauen
		
		Arr_Free (arr_ID); //Und dann das Mutterarray ganz normal freigeben
	};
	
	Arr_RestoreGlobals();
};

//######################################################
//
//	String Arrays
//
//######################################################

//Unverändert kann bleiben:
func int StrArr_Create() {
	return Arr_Create();
};

func int StrArr_Length (var int arr_ID) {
	return Arr_Length (arr_ID);
};

func int StrArr_High (var int arr_ID) {
	return Arr_High (arr_ID);
};

//************************************
//		Länge verändern
//************************************

func int StrArr_ClearFromTo (var int arr_ID, var int first, var int last) {
	if (first <= last) {
		//Da jeder Eintrag im Array selbst ein formales Array ist
		//muss hier penibel freigegeben werden.
		var int val;
		val = Arr_GetValue (arr_ID, first);
		
		if (val) {
			Arr_Free (val);
		};
		
		//Und weiter im Text:
		StrArr_ClearFromTo (arr_ID, first + 1, last);
	};
};

func void StrArr_SetLength (var int arr_ID, var int newLength) {
	Arr_BackUpGlobals();
	
	var string s1; var string s2;
	
	var int oldLen;
	oldLen = StrArr_Length (arr_ID);
	
	if (oldLen == NAN) {
		/*
			Dann hat der Coder mir Mist übergeben!
			Nen Error gabs schon. Also einfach:
			raus hier!
		*/
		Arr_RestoreGlobals();
		return;
	};
	
	if (newLength < 0) {
		//darf nicht sein.
		s1 = IntToString (arr_ID);
		s2 = IntToString (newLength);
		
		PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: Eine negative Länge ist für ein Array nicht erlaubt. ArrayID: ", s1, "; gewünschte Länge: ", s2, "; Der Befehl ist unwirksam. <-StrArr_SetLength");
		
		//raus hier!
		Arr_RestoreGlobals();
		return;
	};
	
	//Freigewordene String-Plätze freigeben.
	//Wirkungslos, falls das Array verlängert wird, nicht verkürzt.
	StrArr_ClearFromTo (arr_ID, newLength, oldLen - 1);
	
	//Jetzt die 1D-Arrays aufräumen lassen
	//bzw. die neuen Indizes freischaffen.
	Arr_SetLength (arr_ID, newLength);
	
	Arr_RestoreGlobals();
};

//************************************
//		Werte setzen
//************************************

func void StrArr_SetValue (var int arr_ID, var int offset, var string value) {
	Arr_BackUpGlobals();
	var string s1; var string s2;
	
	//Längen Check:
	var int oldLen;
	oldLen = StrArr_Length (arr_ID);
	
	if (oldLen == NAN) {
		/*
			Dann hat der Coder mir Mist übergeben!
			Nen Error gabs schon. Also einfach:
			raus hier!
		*/
		Arr_RestoreGlobals();
		return;
	};
	
	if (offset < 0) {
		s1 = IntToString (offset);
		s2 = IntToString (arr_ID);
		//Error um die Ohren und raus hier!
		PrintDebug_5S (ERROR_CRITICAL, "ARRAYS: Error: Du versuchst auf einem Offset < 0 zu schreiben: Offset ", s1, "; ArrayID : ", s2, "<-Arr_SetValue");
		
		Arr_RestoreGlobals();
		return;
	};
	
	if (oldLen <= offset) //Array zu klein!
	{
		//Das Array wird länger:
		StrArr_SetLength (arr_ID, offset + 1);
		
		s1 = IntToString (offset);
		s2 = IntToString (arr_ID);
		
		PrintDebug_5S (ERROR_WARNINGS, "ARRAYS: Warnung: Schreiben hinter Array Grenze. Das Array wird verlängert. Offset: ", s1, "; ArrayID: ", s2, "");
	};
	
	var int strContainer;
	strContainer = Arr_GetValue (arr_ID, offset);
	
	if (!strContainer) {
		//dann liegt hier noch kein Array drin
		strContainer = Arr_Create();
		Arr_SetValue (arr_ID, offset, strContainer);
	};
	
	//Container-Npc in other holen
	Arr_GetElementByID (strContainer);
	
	other.wp = value;
	
	Arr_RestoreGlobals();
};

//************************************
//		Werte holen
//************************************

func string StrArr_GetValue (var int arr_ID, var int offset) {
	Arr_BackUpGlobals();
	
	var int strContainer;
	strContainer = Arr_GetValue (arr_ID, offset);
	
	if (strContainer == NAN) {

		//lesen hinter der Array Grenze. Warnung gabs schon! RAUS!
		Arr_RestoreGlobals();
		return "UNDEFINED";
	};
	
	if (!strContainer) {
		//noch nie beschrieben, dann leerer String
		Arr_RestoreGlobals();
		return "";
	};
	
	//ansonsten gültiges Array.
	//Container-Npc in other holen
	Arr_GetElementByID (strContainer);
	
	var string res; res = other.wp;
	Arr_RestoreGlobals();
	return res;
};

//************************************
//		Freigeben (wichtig!)
//************************************

func void StrArr_Free (var int arr_ID) {
	Arr_BackUpGlobals();
	
	if (Arr_GetValidArray (arr_ID)) {
		//scheint gültig zu sein.
		//Erst alle Hilfsarrays freigeben.
		StrArr_SetLength (arr_ID, 0);
		
		//Und auch das Array selbst freigeben:
		Arr_Free (arr_ID);
	};	
	
	Arr_RestoreGlobals();
};

//************************************
//		Ein paar Hilfsfunktionen
//************************************

func int StrArr_SearchFor (var int arr_ID, var string value, var int start, var int last) {
	// rekursive Suche nach einem Element
	if (start <= last) {
		var string foundvalue;
		
		foundvalue = StrArr_GetValue (arr_ID, start);
		
		if (Hlp_StrCmp (foundvalue, value)) {
			return start;
		} else {
			return StrArr_SearchFor (arr_ID, value, start + 1, last);
		};
	} else {
		return NAN; //Nichts gefunden.
	};
};

func int StrArr_IndexOf (var int arr_ID, var string value) {
	Arr_BackUpGlobals();
	
	var int length;
	
	length = StrArr_Length (arr_ID);
	
	if (length >= 0) { //sonst gibts woanders einen Error um die Ohren!
		var int res; res = StrArr_SearchFor (arr_ID, value, 0, length - 1);
		Arr_RestoreGlobals();
		return res;
	} else {
		Arr_RestoreGlobals();
		return NAN;
	};
};

func void StrArr_Append (var int arr_ID, var string value) {
	Arr_BackUpGlobals();
	
	var int length;
	
	length = StrArr_Length (arr_ID);
	
	if (length >= 0) { //sonst gibts woanders einen Error um die Ohren!
		StrArr_SetLength (arr_ID, Length + 1);
		StrArr_SetValue (arr_ID, length, value); //Array verlängert, Wert eingetragen
		
		Arr_RestoreGlobals();
		/* Rückgabewert fällt dem Cleanup zugunsten eines sauberen Stacks zum Opfer.
		 * Fast niemand wird hier den Rückgabewert brauchen. */
		return ; // length; //Der Index des neuen Elements
	} else {
		Arr_RestoreGlobals();
		return ; //NAN;
	};
};
	
//#################################################################
//
//  beispiel Implementierung
//
//#################################################################

//************************************
//		Quadratzahlengenerierer
//************************************

var int ArrDemo_QZ_Walker;
var int ArrDemo_QZ_Arr;
func void ArrDemo_QZ_Sub () {
	if (ArrDemo_QZ_Walker >= 0) {
		Arr_SetValue (ArrDemo_QZ_Arr, ArrDemo_QZ_Walker, ArrDemo_QZ_Walker * ArrDemo_QZ_Walker);
		
		ArrDemo_QZ_Walker -= 1;
		ArrDemo_QZ_Sub();
	};
};

func void ArrDemo_Quadratzahlen (var int arr_ID, var int curr, var int max)
{
	if (!Arr_IsValidArray (arr_ID))
	{
		var string s1; s1 = IntToString (arr_ID);
		PrintDebug_5S (ERROR_CRITICAL, "ARRAYS: Error: ", "Es gibt kein Array mit Array-ID: ", s1, "", " <- Quadratzahlen");
		
		//Meckern und raus hier
		return;
	};
	
	Arr_SetLength (arr_ID, max +1);
	ArrDemo_QZ_Walker = max;
	ArrDemo_QZ_Arr = arr_ID;
	
	ArrDemo_QZ_Sub();
};

//#################################################################
//
//  ArrayMan!
//
//#################################################################

INSTANCE ArrayMan (C_NPC)
{
// ------ NSC ------
	name 		= "ArrayMan";
	guild 		= GIL_NONE;
	id 			= 0;
	voice 		= 15;
	flags       = 0 ;																
	npctype		= NPCTYPE_FRIEND ;
	
	attribute[ATR_HITPOINTS_MAX] 	= 42;
	attribute[ATR_HITPOINTS] 		= 42;
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ visuals ------	
	Mdl_SetVisual (self,"HUMANS.MDS");			
	Mdl_SetVisualBody (self,	"hum_body_Naked0", 	1,	0,	"Hum_Head_Pony", 	2,	0, 			-1);
	
	// ------ TA anmelden ------
	start_aistate 		= ZS_Stand;
};

var int AM_Mode2D;

var int AM_Array;
var int AM_Array2D;

//************************************
//		Exit
//************************************

instance  AM_Exit (C_INFO)
{
	npc			=  ArrayMan;
	nr			=  999;
	condition	=  AM_Exit_Condition;
	information	=  AM_Exit_Info;
	permanent	=  TRUE;
	description = DIALOG_ENDE;
};                       

FUNC int  AM_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  AM_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

//************************************
//		Switch 2D <-> 1D
//************************************

instance  AM_SwithArray (C_INFO)
{
	npc			=  ArrayMan;
	nr			=  1;
	condition	=  AM_SwithArray_Condition;
	information	=  AM_SwithArray_Info;
	permanent	=  TRUE;
	description =  "1D <-> 2D wechseln";
};

FUNC int AM_SwithArray_Condition()
{
	return TRUE;
};

FUNC void AM_SwithArray_Info()
{
	if (AM_Mode2D)
	{
		AM_Mode2D = FALSE;
		Print ("1D-Modus");
	}
	else
	{
		AM_Mode2D = TRUE;
		Print ("2D-Modus");
	};
};

//#################################################################
//
//  1D -Arrays
//
//#################################################################

//************************************
//		Array erzeugen
//************************************

instance  AM_CreateArray (C_INFO)
{
	npc			=  ArrayMan;
	nr			=  1;
	condition	=  AM_CreateArray_Condition;
	information	=  AM_CreateArray_Info;
	permanent	=  TRUE;
	description =  "1D Array erzeugen";
};

FUNC int AM_CreateArray_Condition()
{
	if (!AM_Mode2D)
	{
		return TRUE;
	};
};

FUNC void AM_CreateArray_Info()
{
	AM_Array = Arr_Create();
	
	Print (IntToString (AM_Array));
};

//************************************
//		Array zerstören
//************************************

instance  AM_FreeArray (C_INFO)
{
	npc			=  ArrayMan;
	nr			=  2;
	condition	=  AM_FreeArray_Condition;
	information	=  AM_FreeArray_Info;
	permanent	=  TRUE;
	description =  "1D Array freigeben";
};

FUNC int AM_FreeArray_Condition()
{
	if (!AM_Mode2D)
	{
		return TRUE;
	};
};

FUNC void AM_FreeArray_Info()
{
	Arr_Free(AM_Array);
	
	Print ("OK");
};

//************************************
//		Array füllen
//************************************

instance  AM_SetArray (C_INFO)
{
	npc			=  ArrayMan;
	nr			=  3;
	condition	=  AM_SetArray_Condition;
	information	=  AM_SetArray_Info;
	permanent	=  TRUE;
	description =  "1D Array füllen";
};

FUNC int  AM_SetArray_Condition()
{
	if (!AM_Mode2D)
	{
		return TRUE;
	};
};

FUNC VOID  AM_SetArray_Info()
{
	Info_AddChoice (AM_SetArray, "ZURÜCK", AM_SetArray_0);
	Info_AddChoice (AM_SetArray, "Arr_Append (17161)", AM_SetArray_AP);
	Info_AddChoice (AM_SetArray, "Quadratzahlen bis 15000 (dauert ~ 1 min!)", AM_SetArray_150);
	Info_AddChoice (AM_SetArray, "Quadratzahlen bis 112", AM_SetArray_112);
	Info_AddChoice (AM_SetArray, "Quadratzahlen bis 72", AM_SetArray_72);
	Info_AddChoice (AM_SetArray, "Quadratzahlen bis 35", AM_SetArray_35);
};

func void AM_SetArray_0()
{
	Info_ClearChoices (AM_SetArray);
};

func void AM_SetArray_35 () 	{ AM_SetArray_0(); ArrDemo_Quadratzahlen (AM_Array, 0, 35);		};
func void AM_SetArray_72 () 	{ AM_SetArray_0(); ArrDemo_Quadratzahlen (AM_Array, 0, 72);	};
func void AM_SetArray_112 () 	{ AM_SetArray_0(); ArrDemo_Quadratzahlen (AM_Array, 0, 112);	};
func void AM_SetArray_150 () 	{ AM_SetArray_0(); ArrDemo_Quadratzahlen (AM_Array, 0, 15000);	};

func void AM_SetArray_AP()		{ AM_SetArray_0(); Arr_Append (AM_Array, 17161);			};
//************************************
//		Array auslesen
//************************************

instance  AM_GetArray (C_INFO)
{
	npc			=  ArrayMan;
	nr			=  4;
	condition	=  AM_GetArray_Condition;
	information	=  AM_GetArray_Info;
	permanent	=  TRUE;
	description =  "1D Array auslesen";
};

FUNC int  AM_GetArray_Condition()
{
	if (!AM_Mode2D)
	{
		return TRUE;
	};
};

FUNC VOID  AM_GetArray_Info()
{
	Info_AddChoice (AM_GetArray, "ZURÜCK", AM_GetArray_0);
	Info_AddChoice (AM_GetArray, "Arr_IndexOf(17161)", AM_GetArray_IO);
	Info_AddChoice (AM_GetArray, "14200", AM_GetArray_142);
	Info_AddChoice (AM_GetArray, "100", AM_GetArray_100);
	Info_AddChoice (AM_GetArray, "54", AM_GetArray_54);
	Info_AddChoice (AM_GetArray, "25", AM_GetArray_25);
};

var int AM_result;

func void AM_GetArray_0()
{
	Info_ClearChoices (AM_GetArray);
	
	Print (IntToString (AM_result));
};

func void AM_GetArray_25 () 	{ AM_result = Arr_GetValue (AM_Array, 25);		AM_GetArray_0(); };
func void AM_GetArray_54 () 	{ AM_result = Arr_GetValue (AM_Array, 54);		AM_GetArray_0(); };
func void AM_GetArray_100 () 	{ AM_result = Arr_GetValue (AM_Array, 100);		AM_GetArray_0(); };
func void AM_GetArray_142 () 	{ AM_result = Arr_GetValue (AM_Array, 14200);		AM_GetArray_0(); };

func void AM_GetArray_IO ()		{ AM_result = Arr_IndexOf (AM_Array, 17161);		AM_GetArray_0(); };

//#################################################################
//
//  2D -Arrays
//
//#################################################################

//************************************
//		Array erzeugen
//************************************

instance  AM_CreateArray2D (C_INFO)
{
	npc			=  ArrayMan;
	nr			=  1;
	condition	=  AM_CreateArray2D_Condition;
	information	=  AM_CreateArray2D_Info;
	permanent	=  TRUE;
	description =  "2D Array erzeugen";
};

FUNC int AM_CreateArray2D_Condition()
{
	if (AM_Mode2D)
	{
		return TRUE;
	};
};

FUNC void AM_CreateArray2D_Info()
{
	AM_Array2D = Arr2D_Create();
	
	Print (IntToString (AM_Array2D));
};

//************************************
//		Array2D zerstören
//************************************

instance  AM_FreeArray2D (C_INFO)
{
	npc			=  ArrayMan;
	nr			=  2;
	condition	=  AM_FreeArray2D_Condition;
	information	=  AM_FreeArray2D_Info;
	permanent	=  TRUE;
	description =  "2D Array freigeben";
};

FUNC int AM_FreeArray2D_Condition()
{
	if (AM_Mode2D)
	{
		return TRUE;
	};
};

FUNC void AM_FreeArray2D_Info()
{
	Arr2D_Free(AM_Array2D);
	
	Print ("OK");
};

//************************************
//		Array2D füllen
//************************************

instance  AM_SetArray2D (C_INFO)
{
	npc			=  ArrayMan;
	nr			=  3;
	condition	=  AM_SetArray2D_Condition;
	information	=  AM_SetArray2D_Info;
	permanent	=  TRUE;
	description =  "2D Array füllen";
};

FUNC int  AM_SetArray2D_Condition()
{
	if (AM_Mode2D)
	{
		return TRUE;
	};
};

FUNC VOID  AM_SetArray2D_Info()
{
	Info_AddChoice (AM_SetArray2D, "ZURÜCK", AM_SetArray2D_0);
	Info_AddChoice (AM_SetArray2D, "(2|4) = 5", AM_SetArray2D_1);
	Info_AddChoice (AM_SetArray2D, "(3|2) = 6", AM_SetArray2D_2);
	Info_AddChoice (AM_SetArray2D, "(42|13) = 55", AM_SetArray2D_3);
	Info_AddChoice (AM_SetArray2D, "(13|42) = 23", AM_SetArray2D_4);
};

func void AM_SetArray2D_0()
{
	Info_ClearChoices (AM_SetArray2D);
};

func void AM_SetArray2D_SetValues (var int X, var int Y, var int value)
{
	var int tmp; //nötig, da Gothic spinnt, wenn ich Funktionen direkt in einer Bedingung benutze
	
	tmp = Arr2D_LengthY (AM_Array2D);
	if (tmp <= Y)
	{
		Arr2D_SetLengthY (AM_Array2D, Y + 1);
	};
	
	tmp = Arr2D_LengthX (AM_Array2D);
	if (tmp <= X)
	{
		Arr2D_SetLengthX (AM_Array2D, X + 1);
	};
	
	Arr2D_SetValue (AM_Array2D, X, Y, value);
	
	//Clear
	AM_SetArray2D_0();
};

func void AM_SetArray2D_1 () 	{ AM_SetArray2D_SetValues ( 2, 4, 5);	};
func void AM_SetArray2D_2 () 	{ AM_SetArray2D_SetValues ( 3, 2, 6);	};
func void AM_SetArray2D_3 () 	{ AM_SetArray2D_SetValues (42,13,55);	};
func void AM_SetArray2D_4 () 	{ AM_SetArray2D_SetValues (13,42,23);	};

//************************************
//		Array2D auslesen
//************************************

instance  AM_GetArray2D (C_INFO)
{
	npc			=  ArrayMan;
	nr			=  4;
	condition	=  AM_GetArray2D_Condition;
	information	=  AM_GetArray2D_Info;
	permanent	=  TRUE;
	description =  "2D Array auslesen";
};

FUNC int  AM_GetArray2D_Condition()
{
	if (AM_Mode2D)
	{
		return TRUE;
	};
};

FUNC VOID  AM_GetArray2D_Info()
{
	Info_AddChoice (AM_GetArray2D, "ZURÜCK", AM_GetArray2D_0);
	Info_AddChoice (AM_GetArray2D, "(2|4)", AM_GetArray2D_1);
	Info_AddChoice (AM_GetArray2D, "(3|2)", AM_GetArray2D_2);
	Info_AddChoice (AM_GetArray2D, "(42|13)", AM_GetArray2D_3);
	Info_AddChoice (AM_GetArray2D, "(13|42)", AM_GetArray2D_4);
};

var int AM_result2D;

func void AM_GetArray2D_0()
{
	Info_ClearChoices (AM_GetArray2D);
	
	Print (IntToString (AM_result));
};

func void AM_GetArray2D_1 () 	{ AM_result = Arr2D_GetValue (AM_Array2D,  2,  4);		AM_GetArray2D_0(); };
func void AM_GetArray2D_2 () 	{ AM_result = Arr2D_GetValue (AM_Array2D,  3,  2);		AM_GetArray2D_0(); };
func void AM_GetArray2D_3 () 	{ AM_result = Arr2D_GetValue (AM_Array2D, 42, 13);		AM_GetArray2D_0(); };
func void AM_GetArray2D_4 () 	{ AM_result = Arr2D_GetValue (AM_Array2D, 13, 42);		AM_GetArray2D_0(); };

//#################################################################
//
//  Beispiel für eine Anwendung (an den Haaren herbeigezogen)
//
//#################################################################

//Es soll gezählt werden, wieviel Monster von welchem Typ der Spieler getötet hat.
//Diese Funktion könnte von ZS_Dead heraus aufgerufen werden.
/*
var int MonsterTypen;
var int MonsterCount;

func void KillCounter(var C_NPC totesMonster)
{
	if (MonsterTypen == 0) //noch nicht initialisiert
	{
		MonsterTypen = Arr_Create();
		MonsterCount = Arr_Create();
	};
	
	var int inst_ID;
	inst_ID = Hlp_GetInstanceID (totesMonster);
	
	var int index;
	index = Arr_IndexOf (MonsterTypen, inst_ID);
	
	if (index == NAN) //Sowas hat er noch nicht getötet!
	{
		Print ("Hui, sowas habe ich noch nicht getötet!");
		
		Arr_Append (MonsterTypen, inst_ID);
		Arr_Append (MonsterCount, 1); //einen getötet
		
	}
	else
	{
		var int count;
		var string prt;
		
		count = Arr_GetValue (MonsterCount, index);
		
		prt = "Davon habe ich jetzt schon ";
		prt = ConcatStrings (prt, IntToString (count + 1));
		prt = ConcatStrings (prt, " getötet!");
		
		Print (prt);
		
		Arr_SetValue (MonsterCount, index, count + 1);
	};
};*/



