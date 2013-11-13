const int Respawn_ChangeDay_IdxPerWalk = 25;
const int Max_Respawn_Days = 30;

var int killed_Counter;

var int Respawn_minusdays;
var int Respawn_ChangeDay_LastCheckedIndex;
	
var int Respawn_Array_ID;
var int Respawn_Array_WP;
var int Respawn_Array_Day;//in minutes
var int Respawn_Array_LastUsedIDX;
const int respawn_slots = 200;

func void Respawn_Init()//at Init_Allworlds
{
	if(!Arr_GetValidArray (Respawn_Array_ID))
	{
		Respawn_Array_ID = Arr_Create();
		printdebug(concatstrings("RespawnID_ArrID: ",inttostring(Respawn_Array_ID)));
		Arr_SetLength (Respawn_Array_ID,respawn_slots);		
		//free array: (loop)
		var int i; var int label;
		i=0;
		MEM_InitLabels (); 
		label = MEM_StackPos.position; 
		Arr_SetValue	(Respawn_Array_ID,i,0);
		i+=1;
		if (i <  respawn_slots) {      
		MEM_StackPos.position = label; 
 		};
	};
	//WP create
	if(!Arr_GetValidArray (Respawn_Array_WP))
	{
		Respawn_Array_WP = StrArr_Create();
		printdebug(concatstrings("RespawnWP_ArrID: ",inttostring(Respawn_Array_WP)));
		StrArr_SetLength (Respawn_Array_WP,respawn_slots);	
	};
	//Time create
	if(!Arr_GetValidArray (Respawn_Array_Day))
	{
		Respawn_Array_Day = Arr_Create();
		printdebug(concatstrings("RespawnDAY_ArrID: ",inttostring(Respawn_Array_Day)));
		Arr_SetLength (Respawn_Array_Day,respawn_slots);		
	};	
	
	Respawn_ChangeDay_LastCheckedIndex=0;
};

//Todo: this function is fucking joke, half sec lag...meh
func int Respawn_FindFirstFree ()
{
	return Respawn_Array_LastUsedIDX;
};

func int Respawn_FindLastUsed (var int arr_ID, var int start, var int last)
{
	// rekursive Suche nach einem Element
	
	if (start <= last)
	{
		var int foundvalue;
		
		foundvalue = Arr_GetValue (arr_ID, start);
		
		if (foundvalue>=0)
		{
			return Respawn_FindLastUsed (arr_ID,start + 1, last);
		}
		else
		{
			return start;
		};
	}
	else
	{
		return NAN; //Nichts gefunden.
	};
};

func void Respawn_Include(var c_npc slf)
{
	//Find first free index in array
	var int idx;
	idx = Arr_SearchFor (Respawn_Array_ID,0,0,respawn_slots-1);
	
	if(idx>Respawn_Array_LastUsedIDX)
	{
	Respawn_Array_LastUsedIDX = idx;	
	};
	//return if daytorespawn invalid
	if(Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN)==999)||(Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN)==0)
	{
		return;
	};
	
	killed_Counter+=1;
	//Set ID,WP and Time
	var int id;
	id = slf.id;
	printdebug(inttostring(id));
	Arr_SetValue	(Respawn_Array_ID,idx,id);
	StrArr_SetValue	(Respawn_Array_WP,idx,slf.wp);
	Arr_SetValue	(Respawn_Array_Day,idx,Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN));
};
var int respawn_OFF; //set to off if cause problems ingame
func void Respawn_SpawnMonster(var int id, var string wp)
{
	if(Respawn_OFF)
	{
		return;	
	};
	//easly can add some monster evolutions etc.	
	printdebug(concatstrings("Respawn -> ID: ",inttostring(id)));
	printdebug(concatstrings("Respawn -> WP: ",wp));
   
   if(id<=0)||(Hlp_StrCmp(WP,""))
   {
      printdebug("Respawn -> Respawn failure, ID or WP invaild!!!!"); 
      return;
   };
   
   var int inst; MEM_AssignInst (inst, id);
   
	if(inst)
	{
		printdebug(concatstrings("Respawn -> ",MEM_ReadString(inst+16)));
	};
	//printdebug(concatstrings("Respawn -> Inst2Ptr: ",inttostring(MEM_InstToPtr(id))));
   
   
   if (inst > 0)
   {
      Wld_InsertNpc(id,wp);
   };
		
	return;	

   //BUGFIX: Special threatment needed for some monsters
   //YEA ITS FUCKING ANNOYING!!!
   //First method for fixing but, sure it won't be working anyway
   if(id==13998)//bugfix! it's an aligator
   { 
      printdebug("Respawn -> respawnin, aligator (need special treatment)"); 	
      Wld_InsertNpc(Aligator,wp); 
   }
   else if(id==14124)//bugfix! it's an bitter
   { 
      printdebug("Respawn -> respawnin, bitter (need special treatment)"); 	
      Wld_InsertNpc(OrcBiter,wp); 
   }
   else if(id==14127)//bugfix! it's an orcdog -_-
   { 
      printdebug("Respawn -> respawnin, orcdog (need special treatment)"); 	
      Wld_InsertNpc(orcDog,wp); 
   }
   else if(id==14148)//bugfix! it's an orcwarrior
   { 
      printdebug("Respawn -> respawnin, orcwarrior2 (need special treatment)"); 	
      Wld_InsertNpc(orcwarrior2,wp); 
   }
   else if(id==14161)//bugfix! it's an razor
   { 
      printdebug("Respawn -> respawnin, razor (need special treatment)"); 	
      Wld_InsertNpc(razor,wp); 
   }
   else if(id==14057)//bugfix! it's an fwaran
   { 
      printdebug("Respawn -> respawnin, firewaran (need special treatment)"); 	
      Wld_InsertNpc(FireWaran,wp); 
   }
   else
   {
      Wld_InsertNpc(id,wp);	
   };
};

//-------------------------------
// Respawn_SkippedDays
//-------------------------------
// Function is bugfix used when hero entered to some world after not being in it for some days.

func void Respawn_SkippedDays(var int daysskipped)
{ 
	Respawn_minusdays = daysskipped;
	Respawn_ChangeDay_LastCheckedIndex = Respawn_FindFirstFree();
	//pri/nt(inttostring(Respawn_ChangeDay_LastCheckedIndex));	
};
func void Respawn_ChangeDay()
{
	//Find first free index in array
	Respawn_minusdays = 1;
	Respawn_ChangeDay_LastCheckedIndex = Respawn_FindFirstFree();
	
	printdebug_s_i("respawn killed_Counter:",killed_Counter);
	printdebug("Respawn_ChangeDay");
};

func void Respawn_ChangeDay_walker()
{
	printdebug("Respawn_ChangeDay_walker");
	//Find first free index in array
	var int idx; var int tmp;
	idx=Respawn_ChangeDay_LastCheckedIndex+1;
	printdebug(concatstrings("Respawn_ChangeDay_LastCheckedIndex:",inttostring(Respawn_ChangeDay_LastCheckedIndex)));
	//loop
	var int label;
	MEM_InitLabels (); 
	label = MEM_StackPos.position; 
	idx = idx-1; 
	printdebug(concatstrings("Respawn_ChangeDay_walker.idx:",inttostring(idx)));
	
	if(idx>=0)
	{
		//decrease days2respawn by one
		tmp = Arr_GetValue(Respawn_Array_Day,idx);
		printdebug(concatstrings("Respawn_ChangeDay_walker.daysleft:",inttostring(tmp-Respawn_minusdays)));	
		Arr_SetValue(Respawn_Array_Day,idx,tmp-Respawn_minusdays);
		if(tmp-Respawn_minusdays <= 0)
		{
			if(tmp>=1)//wasn't he respawned before?
			{
				//time 4 respawn
				printdebug("Respawn -> Respawning...");
				
				//bugfix: putting id and wp direct readen from array causes errors
				var int id; var string wp;
				id = Arr_GetValue(Respawn_Array_ID,idx);
				wp = StrArr_GetValue(Respawn_Array_WP,idx);
				
				Respawn_SpawnMonster(id,wp);
				//clear index:
				Arr_SetValue(Respawn_Array_ID,idx,0);
			};
			//Last IDX update
			if(idx == Respawn_Array_LastUsedIDX)
			{
				printdebug("Respawn -> last idx update...");	
				Respawn_Array_LastUsedIDX-=1; 
			};
		};
		
		//if less than IndexPerWalk indexes done, continue
		MEM_StackPos.position = label; 
	}
	else
	{
	Respawn_ChangeDay_LastCheckedIndex=0;//END	
	};
};

func void Respawn_Trigger()
{
	//TODO:
	//temporary disabled, it need fix cuz instances at respawn are someway incorrect, so it
	//need to be base on f.e. an MonsterID  aiv'ar and respawn monsters by recognize that AivID
	//and respawnin straight f.e. Wld_InsertNpc(Scavenger,WP);
	if(Respawn_ChangeDay_LastCheckedIndex>0)//during walk...
	{
	Respawn_ChangeDay_walker();
	};
};