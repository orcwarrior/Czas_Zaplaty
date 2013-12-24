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
		printdebug(concatstrings("Respawn: RespawnID_ArrID: ",inttostring(Respawn_Array_ID)));
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
	var int idx; // RespawnID Array look for 0 value in range 0..respawn_slots-1
	idx = Arr_SearchFor (Respawn_Array_ID,0,0,respawn_slots-1);
	
	if(idx>Respawn_Array_LastUsedIDX)
	{
		Respawn_Array_LastUsedIDX = idx;	
	};
	//break if daytorespawn invalid
	if(Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN)==999)||(Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN)==0)
	{ return; };
	printdebug_ss("respawn: Include:",slf.name);
	printdebug_s_i("respawn: realID:",Npc_GetAivar(slf,AIV_MM_REAL_ID));
	printdebug_ss("respawn: ... at:",slf.wp);
	printdebug_s_i_s_i("respawn: ... days2respawn:",Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN),", arrIDX: ",idx);
	
	killed_Counter+=1;
	//Set ID,WP and Time
	var int realID;
	realID = Npc_GetAivar(slf,AIV_MM_REAL_ID);
	Arr_SetValue	(Respawn_Array_ID,idx,realID);
	printdebug_s_i_s_i("respawn: Array valCheck:",Arr_GetValue(Respawn_Array_ID,idx),", arrValid: ",Arr_GetValidArray(Respawn_Array_ID));
	StrArr_SetValue	(Respawn_Array_WP,idx,slf.wp);
	Arr_SetValue	(Respawn_Array_Day,idx,Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN));
};

func int Respawn__RealIDToInstance(var int realID)
{
	// Magic regex formula: (from AI_MM_Constants.d)
	// find: (CONST INT)[\s].*?([\w]+).*?//[\s].*?([\w]+).*?$
	// replace: else if \(realID==$2\) { return $3; }
		 if (realID==ID_WOLF) { return Wolf; }
	else if (realID==ID_BLACKWOLF) { return BlackWolf; }
	else if (realID==ID_SNAPPER) { return Snapper; }
	else if (realID==ID_ORCBITER) { return OrcBiter; }
	else if (realID==ID_SHADOWBEAST) { return Shadowbeast; }
	else if (realID==ID_BLOODHOUND) { return Bloodhound; }
	else if (realID==ID_TROLL) { return Troll; }
	else if (realID==ID_WARAN) { return Waran; }
	else if (realID==ID_FIREWARAN) { return FireWaran; }
	else if (realID==ID_RAZOR) { return Razor; }
	else if (realID==ID_LURKER) { return Lurker; }
	else if (realID==ID_SWAMPSHARK) { return Swampshark; }
	else if (realID==ID_MINECRAWLER) { return Minecrawler; }
	else if (realID==ID_MINECRAWLERWARRIOR) { return MinecrawlerWarrior; }
	else if (realID==ID_BLOODFLY) { return Bloodfly; }
	else if (realID==ID_BLACKGOBBO) { return BlackGobboMace; }
	else if (realID==ID_GOBBOCLUB) { return GreenGobboClub; }
	else if (realID==ID_SCAVENGER) { return Scavenger; }
	else if (realID==ID_DEMON) { return Demon; }
	else if (realID==ID_DEMONLORD) { return DemonLord; }
	else if (realID==ID_MOLERAT) { return Molerat; }
	else if (realID==ID_HARPIE) { return Harpie; }
	else if (realID==ID_STONEGOLEM) { return StoneGolem; }
	else if (realID==ID_FIREGOLEM) { return FireGolem; }
	else if (realID==ID_ICEGOLEM) { return IceGolem; }
	else if (realID==ID_MEATBUG) { return Meatbug; }
	else if (realID==ID_YOUNGTROLL) { return YoungTroll; }
	else if (realID==ID_ALIGATOR) { return Aligator; }
	else if (realID==ID_KINGTROLL) { return King_Troll; }
	else if (realID==ID_DRACONIANSCOUT) { return DraconianScout; }
	else if (realID==ID_SHEEP) { return Sheep; }
	else if (realID==ID_DIRK) { return Dirk; }
	else if (realID==ID_WISP) { return Wisp; }
	else if (realID==ID_BLACKTROLL) { return Black_Troll; }
	else if (realID==ID_FIREWISP) { return Wisp_Fire; }
	else if (realID==ID_BLACKGOBBOWARRIOR) { return BlackGobboWarrior; }	
	else if (realID==ID_BLACKWOLFBOSS) { return BlackWolfBoss; }
	else if (realID==ID_DRACONIANSOLIDER) { return DraconianSolidier; }
	else if (realID==ID_DRACONIANOFFICER) { return DraconianOfficer; }
	else if (realID==ID_DRAGON) { return Dragon_Fire; }
	else if (realID==ID_GOBBOSWORD) { return GreenGobboSword; }
	else if (realID==ID_SWAMPGOLEM) { return SwampGolem; }
	else if (realID==ID_ORCDOG) { return OrcDog; }
	else if (realID==ID_ORCSCOUT) { return OrcScout; }
	else if (realID==ID_ORCSCOUTGYD) { return OrcScoutGYD; }
	else if (realID==ID_ORCSHAMAN) { return OrcShaman; }
	else if (realID==ID_ORCSLAVE) { return OrcSlave; }
	else if (realID==ID_ORCDANCE) { return OrcPeasantDance; }
	else if (realID==ID_ORCDRUM) { return OrcPeasantDrum; }
	else if (realID==ID_ORCWARRIOR1) { return OrcWarrior1; }
	else if (realID==ID_ORCWARRIOR2) { return OrcWarrior2; }
	else if (realID==ID_ORCWARRIOR3) { return OrcWarrior3; }
	else if (realID==ID_ORCWARRIOR4) { return OrcWarrior4; }
	else if (realID==ID_ORCELITE) { return OrcElite1; }
	else if (realID==ID_ORCGENERAL) { return OrcElite2; }
	else if (realID==ID_RAZORNK) { return RazorNK; }
//	else if (realID==ID_TIGER) { return Tiger; }
	else if (realID==ID_WISP2) { return Wisp2; };
	return -1;
};

var int respawn_OFF; //set to off if cause problems ingame
func void Respawn_SpawnMonster(var int realid, var string wp)
{
	var int id;
	if(Respawn_OFF)
	{
		return;	
	};
	//easly can add some monster evolutions etc.	
	printdebug(concatstrings("Respawn -> realID: ",inttostring(realid)));
	printdebug(concatstrings("Respawn -> WP: ",wp));
    id = Respawn__RealIDToInstance(realid);
	printdebug(concatstrings("Respawn -> ID: ",inttostring(id)));
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
   };
      Wld_InsertNpc(id,wp);
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
	
	printdebug_s_i("Respawn: Indexs to check:",Respawn_ChangeDay_LastCheckedIndex);
	printdebug("Respawn_ChangeDay");
	
};

func void Respawn_ChangeDay_walker()
{
	printdebug("Respawn: Respawn_ChangeDay_walker");
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
	// Ork: O prosze, nawet wczesniej wpadłem na to samo co powyzej :)
	if(Respawn_ChangeDay_LastCheckedIndex>0)//during walk...
	{
		Respawn_ChangeDay_walker();
	};
};