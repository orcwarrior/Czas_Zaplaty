/*aivar Funcs
* ...
* Ok, to na poczatek kilka s³ów nt. funkcjonalnosci tutaj zawartej i jej przeznaczenia.
* Jak zauwazy³em (choc dopiero po uprz±tnieciu AI_Constants.d) wieleaivarów nakladalo sie
* na siebie pozycjami w tablicyaivars co skutkowa³o takimi atrakcjami jak chocby nag³e
* Od-uczenie sie kregów magii oraz wieloma innymi mo¿e nie odnotowanymi ale napewno teoretycznie
* mo¿liwymi.
*
* Dlatego wymagane by³o natychmiastowe ogarniecie tego problemu, dlatego obecneaivary musialy zostac
* "skompresowane" w czesci do mask bitowych. Wi±¿e sie to z jakimis utrudnieniami, choc nie s± one
* ogromne, to jednak wymagaj± przyswojenia, w skrócie, uproszczeniu i bez wnikania w szczegó³y teraz
* Zamiast czytac/zapisywacaivary w ten sposób:
* ------------------------------------------	
* 	aivar[AIV_PARTYMEMBER] = TRUE;
*	
* 	if(aivar[AIV_PARTYMEMBER] == TRUE)
* 	{ Print("Jestes w party!"); }; 
* ------------------------------------------
* Robimy to przy u¿yciu tutaj znajduj±cych sie funkcji o tak:
* ------------------------------------------
* 	Npc_SetAivar(self,AIV_PARTYMEMBER,TRUE);
*	
* 	if(Npc_GetAivar(self,AIV_PARTYMEMBER) == TRUE)
* 	{ Print("Jestes w party!"); };
* ------------------------------------------
* Tym czy danyaivar jest faktycznieaivarem, czy mo¿e jedynie flag± waivarze rozwaz± ju¿ same funkcje.
* Ork, 14:13 2012-10-19
*******************************************************************************************************/

/***************************************
*	A I V A R   R E G I O N S
*	
*	0-3		-> Reserved for bitFlags (Giving ability to have up to 128 boolean(true/false)aivars
* 4-49	-> "Normal"aivars, that will have more states than just two
* 50-178 -> Booleanaivars virtually positions needed 100 is the first bit onaivar[0], 228 is last(32) bit onaivar[3]
**************************************/
const int MIN_AIVAR 		= 0;	const int MAX_AIVAR = 49;
const int MIN_BITFLAG 		= 50; 	const int MAX_BITFLAG = 178;
const int MIN_NORMALAIVAR 	= 4;


//
// Internal ("private" funcs)
// DO NOT USE THEM!!!
// ---------------------------------
func void __Npc_SetAivar (var C_NPC slf, var int offset, var int value)
{
		 if (offset == 	0	) { slf._aivar[	0	] = value; }	
	else if (offset == 	1	) { slf._aivar[	1	] = value; }	
	else if (offset == 	2	) { slf._aivar[	2	] = value; }	
	else if (offset == 	3	) { slf._aivar[	3	] = value; }	
	else if (offset == 	4	) { slf._aivar[	4	] = value; }	
	else if (offset == 	5	) { slf._aivar[	5	] = value; }	
	else if (offset == 	6	) { slf._aivar[	6	] = value; }	
	else if (offset == 	7	) { slf._aivar[	7	] = value; }	
	else if (offset == 	8	) { slf._aivar[	8	] = value; }	
	else if (offset == 	9	) { slf._aivar[	9	] = value; }	
	else if (offset == 	10	) { slf._aivar[	10	] = value; }	
	else if (offset == 	11	) { slf._aivar[	11	] = value; }	
	else if (offset == 	12	) { slf._aivar[	12	] = value; }	
	else if (offset == 	13	) { slf._aivar[	13	] = value; }	
	else if (offset == 	14	) { slf._aivar[	14	] = value; }	
	else if (offset == 	15	) { slf._aivar[	15	] = value; }
	else if (offset == 	16	) { slf._aivar[	16	] = value; }
	else if (offset == 	17	) { slf._aivar[	17	] = value; }
	else if (offset == 	18	) { slf._aivar[	18	] = value; }
	else if (offset == 	19	) { slf._aivar[	19	] = value; }
	else if (offset == 	20	) { slf._aivar[	20	] = value; }
	else if (offset == 	21	) { slf._aivar[	21	] = value; }
	else if (offset == 	22	) { slf._aivar[	22	] = value; }
	else if (offset == 	23	) { slf._aivar[	23	] = value; }
	else if (offset == 	24	) { slf._aivar[	24	] = value; }
	else if (offset == 	25	) { slf._aivar[	25	] = value; }
	else if (offset == 	26	) { slf._aivar[	26	] = value; }
	else if (offset == 	27	) { slf._aivar[	27	] = value; }
	else if (offset == 	28	) { slf._aivar[	28	] = value; }
	else if (offset == 	29	) { slf._aivar[	29	] = value; }
	else if (offset == 	30	) { slf._aivar[	30	] = value; }
	else if (offset == 	31	) { slf._aivar[	31	] = value; }
	else if (offset == 	32	) { slf._aivar[	32	] = value; }
	else if (offset == 	33	) { slf._aivar[	33	] = value; }
	else if (offset == 	34	) { slf._aivar[	34	] = value; }
	else if (offset == 	35	) { slf._aivar[	35	] = value; }
	else if (offset == 	36	) { slf._aivar[	36	] = value; }
	else if (offset == 	37	) { slf._aivar[	37	] = value; }
	else if (offset == 	38	) { slf._aivar[	38	] = value; }
	else if (offset == 	39	) { slf._aivar[	39	] = value; }
	else if (offset == 	40	) { slf._aivar[	40	] = value; }
	else if (offset == 	41	) { slf._aivar[	41	] = value; }
	else if (offset == 	42	) { slf._aivar[	42	] = value; }
	else if (offset == 	43	) { slf._aivar[	43	] = value; }
	else if (offset == 	44	) { slf._aivar[	44	] = value; }
	else if (offset == 	45	) { slf._aivar[	45	] = value; }
	else if (offset == 	46	) { slf._aivar[	46	] = value; }
	else if (offset == 	47	) { slf._aivar[	47	] = value; }
	else if (offset == 	48	) { slf._aivar[	48	] = value; }
	else if (offset == 	49	) { slf._aivar[	49	] = value; };
};

func int __Npc_GetAivar (var C_NPC slf, var int offset)
{
		 if (offset == 	0	) { return slf._aivar[	0	]; }	
	else if (offset == 	1	) { return slf._aivar[	1	]; }	
	else if (offset == 	2	) { return slf._aivar[	2	]; }	
	else if (offset == 	3	) { return slf._aivar[	3	]; }	
	else if (offset == 	4	) { return slf._aivar[	4	]; }	
	else if (offset == 	5	) { return slf._aivar[	5	]; }	
	else if (offset == 	6	) { return slf._aivar[	6	]; }	
	else if (offset == 	7	) { return slf._aivar[	7	]; }	
	else if (offset == 	8	) { return slf._aivar[	8	]; }	
	else if (offset == 	9	) { return slf._aivar[	9	]; }	
	else if (offset == 	10	) { return slf._aivar[	10	]; }	
	else if (offset == 	11	) { return slf._aivar[	11	]; }	
	else if (offset == 	12	) { return slf._aivar[	12	]; }	
	else if (offset == 	13	) { return slf._aivar[	13	]; }	
	else if (offset == 	14	) { return slf._aivar[	14	]; }	
	else if (offset == 	15	) { return slf._aivar[	15	]; }
	else if (offset == 	16	) { return slf._aivar[	16	]; }
	else if (offset == 	17	) { return slf._aivar[	17	]; }
	else if (offset == 	18	) { return slf._aivar[	18	]; }
	else if (offset == 	19	) { return slf._aivar[	19	]; }
	else if (offset == 	20	) { return slf._aivar[	20	]; }
	else if (offset == 	21	) { return slf._aivar[	21	]; }
	else if (offset == 	22	) { return slf._aivar[	22	]; }
	else if (offset == 	23	) { return slf._aivar[	23	]; }
	else if (offset == 	24	) { return slf._aivar[	24	]; }
	else if (offset == 	25	) { return slf._aivar[	25	]; }
	else if (offset == 	26	) { return slf._aivar[	26	]; }
	else if (offset == 	27	) { return slf._aivar[	27	]; }
	else if (offset == 	28	) { return slf._aivar[	28	]; }
	else if (offset == 	29	) { return slf._aivar[	29	]; }
	else if (offset == 	30	) { return slf._aivar[	30	]; }
	else if (offset == 	31	) { return slf._aivar[	31	]; }
	else if (offset == 	32	) { return slf._aivar[	32	]; }
	else if (offset == 	33	) { return slf._aivar[	33	]; }
	else if (offset == 	34	) { return slf._aivar[	34	]; }
	else if (offset == 	35	) { return slf._aivar[	35	]; }
	else if (offset == 	36	) { return slf._aivar[	36	]; }
	else if (offset == 	37	) { return slf._aivar[	37	]; }
	else if (offset == 	38	) { return slf._aivar[	38	]; }
	else if (offset == 	39	) { return slf._aivar[	39	]; }
	else if (offset == 	40	) { return slf._aivar[	40	]; }
	else if (offset == 	41	) { return slf._aivar[	41	]; }
	else if (offset == 	42	) { return slf._aivar[	42	]; }
	else if (offset == 	43	) { return slf._aivar[	43	]; }
	else if (offset == 	44	) { return slf._aivar[	44	]; }
	else if (offset == 	45	) { return slf._aivar[	45	]; }
	else if (offset == 	46	) { return slf._aivar[	46	]; }
	else if (offset == 	47	) { return slf._aivar[	47	]; }
	else if (offset == 	48	) { return slf._aivar[	48	]; }
	else if (offset == 	49	) { return slf._aivar[	49	]; };
};
// "Public" funcs:
// ---------------------------------
func void Npc_SetAivar(var C_NPC slf, var int offset, var int value)
{
   var int val; var int oldVal;
   
   if((offset>=MIN_NORMALAIVAR)&&(offset<=MAX_AIVAR))
	{//setting normalaivar:
		__Npc_SetAivar(slf,offset,value);
	}
	else if((offset>=MIN_BITFLAG)&&(offset<=MAX_BITFLAG))
	{
		var int bitAivOffset; bitAivOffset 	= (offset-MIN_BITFLAG)/32;//32-bits per variable
		var int bitOffset;	  bitOffset 		= (offset-MIN_BITFLAG)%32;
		
		val = value;
		if(value!=0){value=TRUE;};//We need to be sure its 0/1
		val = 1 << bitOffset; //bit-shifter value
		oldVal = __Npc_GetAivar(slf,bitAivOffset);
		
		//the "magic" formula(s):

      __Npc_SetAivar(slf, bitAivOffset, (oldVal & (~val)) | (!!value << bitOffset));
		// Debug stuff:
		PrintDebug_s_i_s_i("Npc_SetAivar: passed offset: ",offset,", val: ",value);
		PrintDebug_s_i_s_i("Npc_SetAivar: it's aiv num: ",bitAivOffset,", bitOff: ",bitOffset);
		PrintDebug_s_i_s_i("Npc_SetAivar: it's old val: ",oldVal,", newVal: ",__Npc_GetAivar(slf,bitOffset) );
	}
	/*else
	{//Passed wrong offset!
		Print_s_i_s_i("WARN:Npc_SetAivar, offset: ",offset," is out of range, can't set value: ",value);
	}*/;
};

func int Npc_GetAivar(var C_NPC slf, var int offset)
{
   if ((offset >= MIN_AIVAR) && (offset<MIN_NORMALAIVAR))
   {
      return ((__Npc_GetAivar(slf,offset) & (1 << 0)) >> 0);
   }
	else if((offset>=MIN_NORMALAIVAR)&&(offset<=MAX_AIVAR))
	{//setting normalaivar:
		return __Npc_GetAivar(slf,offset);
	}
	else if((offset>=MIN_BITFLAG)&&(offset<=MAX_BITFLAG))
	{
		var int bitAivOffset; bitAivOffset 	= (offset-MIN_BITFLAG)/32;//32-bits per variable
		var int bitOffset;	  bitOffset 		= (offset-MIN_BITFLAG)%32;
		var int val;
		
		//the "magic" formula:
		val = (__Npc_GetAivar(slf,bitAivOffset) & (1 << bitOffset)) >> bitOffset;	
		// Debug stuff:
		PrintDebug_s_i_s_i("Npc_GetAivar: passed offset: ",offset,", returned val: ",val);
		return val;
	}
	else
	{//Passed wrong offset!
		// Hmm to jest sposob ktorym poradziliscie sobie z blednymi offsetami? :D
		// mam nadzieje ze nie :P
		//Print_s_i_s("WARN:Npc_GetAivar, offset: ",offset," is out of range, can't get value.");
		PrintDebug_s_i_s("WARN:Npc_GetAivar, offset: ",offset," is out of range, can't get value.");
		return -1; 
	};
};

// [NEW] Ork: Doda rekursywnie wartosæ do obecnej wartosci aivaru:
func void Npc_AddToAivarValue(var C_NPC slf, var int offset, var int valPlus)
{
	Npc_SetAivar(slf,offset,Npc_GetAivar(slf,offset) + valPlus);
};
