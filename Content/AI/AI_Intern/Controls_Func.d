var int Key_tStatus1;
var int Key_tStatus2;

var int Key_tForward1;
var int Key_tForward2;
var int Key_tLeft1;
var int Key_tLeft2;
var int Key_tRight1;
var int Key_tRight2;
var int Key_tStrafeLeft1;
var int Key_tStrafeLeft2;
var int Key_tStrafeRight1;
var int Key_tStrafeRight2;
var int Key_tAction1;
var int Key_tAction2;
var int Key_tDown1;
var int Key_tDown2;
// Ork: Coś mnie olsniło i jeśli chcemy otrzymywać poprawne stany klawiszy tj.
// takze PRESSED i REALASED to na możemy pobrać stan konkretnego klawisza tylko raz na klatke:
// (Coś zaczeło się kopać po wprowadzeniu zastrzezenie ze Sprint można właczyć tylko gdy Ctrl
// nie jest wcisniety -> zeby podczas walki go nie wlaczac i wylaczac w kółko, po tej zmianie
// przestało działać 2xCTRL -> Zabierz wszystkie przedmioty z ekwipunku focus'a, dlatego dodaje te zmienne)
var int Key_tAction1_State;
var int Key_tAction2_State;
//---------------------------------------
// G2 controls style handle
// I give it up, functions should be ok
// but I can't bind keys
var int ControlsSet_Mode;
const int ControlsSet_DEFAULT 	= 1;
const int ControlsSet_FIGHT   	= 2;
const int ControlsSet_SWIM	 	= 3;
const int ControlsSet_INVENTORY 	= 4;

func void ControlsG2_Default()//exploration
{
	//W - 0x11
	//Alt - 0x38
	//LCTRL - 0x1d
	//ArrowUP - 0xC8
	//Use Items Ctrl (Not ctrl+up)
	MEM_SetGothOpt ("KEYS","keyUp","1d001100c8003800");//up/w/lctrl/alt
	MEM_SetGothOpt ("KEYS","keyAction","1d00");//lctrl/lalt  
	//MEM_SetGothOpt ("KEYS","keySMove","3800");//alt = w+alt+arrow up
	MEM_SetGothOpt ("KEYS","keyDown","1f00D000");//DOWN/S
};

func void ControlsG2_Fight()//when in fightmode - disable ctrl = ctrl+up
{
	MEM_SetGothOpt ("KEYS","keyUp","1100");//up/w

};

func void ControlsG2_Swim()//when in fightmode - disable ctrl = ctrl+up
{
	MEM_SetGothOpt ("KEYS","keyUp","1d001100c800");//up/w/lctrl
};

func void ControlsG2_Inventory()//alt+down = alt = drop item
{
	MEM_SetGothOpt ("KEYS","keyDown","1f00D0003800");//DOWN/S	
};

func void ControlsG2_BindKeys()
{
	var int this;
	this = MEM_ReadInt(zCInput_Class_ptr);
	printdebug(inttostring(this));
	printdebug(inttostring(MEM_ReadInt(this)));
	CALL_IntParam(1);
	CALL__thiscall (this,zCInput__BindKeys);				
	
};
func void ControlsG2_CheckMode()
{
	return;
	
	var oCNpc hiro; hiro = Hlp_GetNpc(pc_hero);
	print(inttostring(ControlsSet_Mode));
	if(Npc_IsInFightMode(hero,FMODE_NONE)==0)
	{
		if(ControlsSet_Mode!=ControlsSet_FIGHT)
		{
			ControlsG2_Fight();
			ControlsSet_Mode = ControlsSet_FIGHT;
			ControlsG2_BindKeys(); 
		};
	}
	else if(hiro.inventory2_frame)
	{
		if(ControlsSet_Mode!=ControlsSet_INVENTORY)
		{
			ControlsG2_Inventory();
			ControlsSet_Mode = ControlsSet_INVENTORY;
			ControlsG2_BindKeys(); 
		};
	}
	else// 
	{
		if(ControlsSet_Mode!=ControlsSet_DEFAULT)
		{
			ControlsG2_Default();
			ControlsSet_Mode = ControlsSet_DEFAULT;
			ControlsG2_BindKeys(); 
		};
	};
	//swim
};

func int Extract_CharToHex(var string c)
{
	if(hlp_strcmp(c,"f")){ return 15; }	
	else if(hlp_strcmp(c,"e")){ return 14; }	
	else if(hlp_strcmp(c,"d")){ return 13; }	
	else if(hlp_strcmp(c,"c")){ return 12; }	
	else if(hlp_strcmp(c,"b")){ return 11; }	
	else if(hlp_strcmp(c,"a")){ return 10; }	
	else if(hlp_strcmp(c,"9")){ return 9; }	
	else if(hlp_strcmp(c,"8")){ return 8; }	
	else if(hlp_strcmp(c,"7")){ return 7; }	
	else if(hlp_strcmp(c,"6")){ return 6; }	
	else if(hlp_strcmp(c,"5")){ return 5; }	
	else if(hlp_strcmp(c,"4")){ return 4; }	
	else if(hlp_strcmp(c,"3")){ return 3; }	
	else if(hlp_strcmp(c,"2")){ return 2; }	
	else if(hlp_strcmp(c,"1")){ return 1; }	
	else 					  { return 0; };
};

func void Extract_ActionKeys()
{
	var string keystr;
	keystr = MEM_GetGothOpt ("KEYS","KEYACTION");//up
	
	var string onekey;
	//Exctract Show status screen keys:
	onekey = Str_Prefix(keystr,4);
	//printdebug(concatstrings(": ",onekey));
	
	Key_tAction1 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tAction1 += Extract_CharToHex(str_substr(onekey,1,1));
	
	onekey = str_substr(keystr,4,4);
	
	Key_tAction2 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tAction2 += Extract_CharToHex(str_substr(onekey,1,1));
};

func void Extract_GoForwardKeys()
{
	var string keystr;
	keystr = MEM_GetGothOpt ("KEYS","KEYUP");//up
	printdebug(concatstrings("forward_str: ",keystr));
	
	var string onekey;
	//Exctract Show status screen keys:
	onekey = Str_Prefix(keystr,4);
	//printdebug(concatstrings(": ",onekey));
	
	Key_tForward1 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tForward1 += Extract_CharToHex(str_substr(onekey,1,1));
	printdebug_s_i("forward[0]: ",Key_tForward1);
	
	onekey = str_substr(keystr,4,4);
	
	Key_tForward2 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tForward2 += Extract_CharToHex(str_substr(onekey,1,1));
	printdebug_s_i("forward[1]: ",Key_tForward2);
};

func void Extract_DownKeys()
{
	var string keystr;
	keystr = MEM_GetGothOpt ("KEYS","KEYDOWN");//up
	
	var string onekey;
	//Exctract Show status screen keys:
	onekey = Str_Prefix(keystr,4);
	
	Key_tDown1 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tDown1 += Extract_CharToHex(str_substr(onekey,1,1));
	
	onekey = str_substr(keystr,4,4);
	
	Key_tDown2 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tDown2 += Extract_CharToHex(str_substr(onekey,1,1));
};

func void Extract_LRKeys()
{
	var string keystr;
	keystr = MEM_GetGothOpt ("KEYS","KEYLEFT");//up
	var string onekey;

	onekey = Str_Prefix(keystr,4);
	Key_tLeft1 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tLeft1 += Extract_CharToHex(str_substr(onekey,1,1));
	printdebug_s_i("># left[0]: ",Key_tLeft1);
	
	onekey = str_substr(keystr,4,4);
	Key_tLeft2 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tLeft2 += Extract_CharToHex(str_substr(onekey,1,1));
	printdebug_s_i("># left[1]: ",Key_tLeft2);
	
	keystr = MEM_GetGothOpt ("KEYS","KEYRIGHT");//up
	onekey = Str_Prefix(keystr,4);
	Key_tRight1 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tRight1 += Extract_CharToHex(str_substr(onekey,1,1));
	printdebug_s_i("># Key_tRight1[0]: ",Key_tRight1);
	
	onekey = str_substr(keystr,4,4);
	Key_tRight2 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tRight2 += Extract_CharToHex(str_substr(onekey,1,1));
	printdebug_s_i("># Key_tRight2[1]: ",Key_tRight2);	
};

func void Extract_StrafeLRKeys()
{
	var string keystr;
	keystr = MEM_GetGothOpt ("KEYS","KEYSTRAFELEFT");//up
	var string onekey;

	onekey = Str_Prefix(keystr,4);
	Key_tStrafeLeft1 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tStrafeLeft1 += Extract_CharToHex(str_substr(onekey,1,1));
	
	onekey = str_substr(keystr,4,4);
	Key_tStrafeLeft2 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tStrafeLeft2 += Extract_CharToHex(str_substr(onekey,1,1));

	keystr = MEM_GetGothOpt ("KEYS","KEYSTRAFERIGHT");//up
	onekey = Str_Prefix(keystr,4);
	Key_tStrafeRight1 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tStrafeRight1 += Extract_CharToHex(str_substr(onekey,1,1));
	
	onekey = str_substr(keystr,4,4);
	Key_tStrafeRight2 = 16*Extract_CharToHex(str_prefix(onekey,1));
	Key_tStrafeRight2 += Extract_CharToHex(str_substr(onekey,1,1));
};

func void Extract_StatusKeys()
{
	var string keystr;
	keystr = MEM_GetGothOpt ("KEYS","KEYSHOWSTATUS");//up
	
	var string onekey;
	
	//Exctract Show status screen keys:
	onekey = Str_Prefix(keystr,4);
	
	Key_tStatus1 = 10*Extract_CharToHex(str_prefix(onekey,1));
	Key_tStatus1 += Extract_CharToHex(str_substr(onekey,1,1));
	printdebug_s_i("Key1: ",Key_tStatus1);
	
	onekey = str_substr(keystr,4,4);
	
	Key_tStatus2 = 10*Extract_CharToHex(str_prefix(onekey,1));
	Key_tStatus2 += Extract_CharToHex(str_substr(onekey,1,1));
	printdebug_s_i("Key2: ",Key_tStatus2);
};

func void Extract_NeededKeys()
{
	Extract_GoForwardKeys();
	Extract_StatusKeys();
	Extract_LRKeys();      //For picklock Msg Bugfix
	Extract_StrafeLRKeys();//For picklock Msg Bugfix
	Extract_ActionKeys();//For parade tunning		
	Extract_DownKeys();//For parade tunning	
};

func int Controls_StringToKey(var string str)
{
	var int pos0; var int hlp; var int pos1; var int pos2;
	pos0 = STR_GetCharAt(str,0);
	
	//Numbers 0-9
	if(48<=pos0)&&(pos0<=57)	
	{
		if(pos0==48)
		{
			return KEY_0;
		};
		return pos0-47;
	};
	//Merge Letters
	
	if(65<=pos0)&&(pos0<=90) ||
	(97<=pos0)&&(pos0<=122)
	{
		if(pos0<=90)//BIG
		{
			hlp = pos0-65; //0-24
		}
		else
		{
			hlp = pos0-97; //0-24	
		};
		
		if(Str_Len(str)==1) //only if its single letter
		{                  			
			//okay, time for some Divide and Conquer :-P
			if (hlp<=12)//0-12
			{
				if(hlp<=6)//0-6
				{
					if(hlp<=3)//0-3
					{
						if(hlp<=1)//0,1
						{
							if(hlp)//1
							{
								return KEY_B;
							}
							else
							{
								return KEY_A;
							};	
						}
						else//2-3
						{
							if(hlp==2)
							{
								return KEY_C;
							}
							else
							{
								return KEY_D;	
							};
						};	
					}
					else//4-6
					{
						if(hlp<=5)
						{
							if(hlp==4)
							{
								return KEY_E;
							}
							else
							{
								return KEY_F;
							};
						}
						else//6
						{
							return KEY_G;	
						};
					};
				}
				else//7-12
				{
					if(hlp<=10)//7-10
					{
						if(hlp<=8)//7,8
						{
							if(hlp==8)//8
							{
								return KEY_I;
							}
							else//7
							{
								return KEY_H;
							};	
						}
						else//9-10
						{
							if(hlp==9)
							{
								return KEY_J;
							}
							else//10
							{
								return KEY_K;	
							};
						};	
					}
					else//11-12
					{
						if(hlp==11)
						{
							return KEY_L;
						}
						else
						{
							return KEY_M;
						};
					};				
				};
			}
			else//13-24
			{
				if(hlp<=19)//13-19
				{
					if(hlp<=16)//13-16
					{
						if(hlp<=14)//13,14
						{
							if(hlp==14)//14
							{
								return KEY_O;
							}
							else//13
							{
								return KEY_N;
							};	
						}
						else//15-16
						{
							if(hlp==15)
							{
								return KEY_P;
							}
							else
							{
								return KEY_Q;	
							};
						};	
					}
					else//17-19
					{
						if(hlp<=18)
						{
							if(hlp==17)
							{
								return KEY_R;
							}
							else
							{
								return KEY_S;
							};
						}
						else//19
						{
							return KEY_T;	
						};
					};
				}
				else//19-24
				{
					if(hlp<=22)//19-22
					{
						if(hlp<=20)//19,20
						{
							if(hlp==20)//20
							{
								return KEY_V;
							}
							else//19
							{
								return KEY_U;
							};	
						}
						else//21-22
						{
							if(hlp==21)
							{
								return KEY_W;
							}
							else//22
							{
								return KEY_X;	
							};
						};	
					}
					else//23-24
					{
						if(hlp==23)
						{
							return KEY_Y;
						}
						else
						{
							return KEY_Z;
						};
					};				
				};			
			};
		};
	};
	//End of chars...
	
	//Special chars
	if( STR_Len(str)>1)
	{
		//F1-F12
		if(hlp==5)//F..
		{
			pos1 = STR_GetCharAt(str,1);	
			//Numbers 1-9
			if(49<=pos1)&&(pos1<=57)	
			{
				if(pos1==49)//F1..
				{
					pos2 = STR_GetCharAt(str,2);	
					if(pos2 == 48)//f10
					{ return KEY_F10; }
					else if(pos2 == 49)//f11
					{ return KEY_F11; }
					else if(pos2 == 50)//f12
					{ return KEY_F12; }
					else { return KEY_F1;};//f1
				}
				else
				{
					return pos1+10;//F2-F9
				};
			};						
		};
		
		//N0-N10
		if(hlp==13)//N..
		{		
			pos1 = STR_GetCharAt(str,1);
			if(48<=pos1)&&(pos1<=57)//N0-N9	
			{
				if(pos1==48)
				{ return KEY_NUMPAD0;}	
				else if(pos1==49)
				{ return KEY_NUMPAD1;}	
				else if(pos1==50)
				{ return KEY_NUMPAD2;}	
				else if(pos1==51)
				{ return KEY_NUMPAD3;}	
				else if(pos1==52)
				{ return KEY_NUMPAD4;}	
				else if(pos1==53)
				{ return KEY_NUMPAD5;}	
				else if(pos1==54)
				{ return KEY_NUMPAD6;}	
				else if(pos1==55)
				{ return KEY_NUMPAD7;}	
				else if(pos1==56)
				{ return KEY_NUMPAD8;}	
				else if(pos1==57)
				{ return KEY_NUMPAD9;};			
			};
			
			//N-/N+
			if(pos1==43)
			{
				return KEY_ADD;	
			}			
			else if(pos1==45)
			{
				return KEY_SUBTRACT;	
			};
			
			if(Hlp_StrCmp("NENTER",str))
			{
				return KEY_NUMPADENTER;
			}
			else if(Hlp_StrCmp("NDIV",str))
			{
				return KEY_DIVIDE;	
			}
			else if(Hlp_StrCmp("NMUL",str))
			{
				return KEY_MULTIPLY;	
			}
			else if(Hlp_StrCmp("NDEL",str))
			{
				return KEY_DECIMAL;	
			};
		};			

		//others
		if(Hlp_StrCmp("LE",str))
		{
			return KEY_COMMA;	
		}	
		else if(Hlp_StrCmp("GR",str))
		{
			return KEY_PERIOD;	
		}	
		else if(Hlp_StrCmp("ASK",str))
		{
			return KEY_SLASH;	
		}	
		else if(Hlp_StrCmp("SR",str))
		{
			return KEY_SEMICOLON;	
		}
		else if(Hlp_StrCmp("AP",str))
		{
			return KEY_APOSTROPHE;	
		}
		else if(Hlp_StrCmp("QO",str))
		{
			return KEY_LBRACKET;	
		}
		else if(Hlp_StrCmp("QC",str))
		{
			return KEY_RBRACKET;	
		}
		else if(Hlp_StrCmp("MY",str))
		{
			return KEY_MINUS;	
		}
		else if(Hlp_StrCmp("PL",str))
		{
			return KEY_EQUALS;	
		}
		else if(Hlp_StrCmp("PP",str))
		{
			return KEY_BACKSLASH;	
		}
		else if(Hlp_StrCmp("TY",str))
		{
			return KEY_GRAVE;	
		}
		else if(Hlp_StrCmp("ENTER",str))
		{
			return KEY_RETURN;	
		};	
	};
};	

func void Controls_Update()
{	
	Printdebug("Update Controls!");
	var string keystr;
	keystr = MEM_GetGothOpt ("KEYS","KeyNextA");
	Key_NextA  	= Controls_StringToKey(keystr);
	Printdebug(concatstrings(concatstrings(keystr,"=>"),inttostring(Key_NextA)));
	
	keystr = MEM_GetGothOpt ("KEYS","keyPrevA");
	Key_PrevA  	= Controls_StringToKey(keystr);
	Printdebug(concatstrings(concatstrings(keystr,"=>"),inttostring(key_PrevA)));
	
	keystr = MEM_GetGothOpt ("KEYS","keyRuneSWD");
	Key_RuneSwd	= Controls_StringToKey(keystr);
	Printdebug(concatstrings(concatstrings(keystr,"=>"),inttostring(Key_RuneSwd)));
	
	keystr = MEM_GetGothOpt ("KEYS","KeyLameHP");
	Key_LameHP	= Controls_StringToKey(keystr);
	Printdebug(concatstrings(concatstrings(keystr,"=>"),inttostring(Key_LameHP)));
	
	keystr = MEM_GetGothOpt ("KEYS","KeyLameMP");
	Key_LameMP	= Controls_StringToKey(keystr);
	Printdebug(concatstrings(concatstrings(keystr,"=>"),inttostring(Key_LameMP)));

	keystr = MEM_GetGothOpt ("KEYS","keyPFollow");
	key_PFollow	= Controls_StringToKey(keystr);
	Printdebug(concatstrings(concatstrings(keystr,"=>"),inttostring(key_PFollow)));
	
	keystr = MEM_GetGothOpt ("KEYS","keyPWait");
	key_PWait	= Controls_StringToKey(keystr);
	Printdebug(concatstrings(concatstrings(keystr,"=>"),inttostring(key_PWait)));		
	
	keystr = MEM_GetGothOpt ("KEYS","keyPHeal");
	key_PHeal	= Controls_StringToKey(keystr);
	Printdebug(concatstrings(concatstrings(keystr,"=>"),inttostring(key_PHeal)));	
	
	keystr = MEM_GetGothOpt ("KEYS","keyPNear");
	key_PNear	= Controls_StringToKey(keystr);
	Printdebug(concatstrings(concatstrings(keystr,"=>"),inttostring(key_PNear)));	
	
	keystr = MEM_GetGothOpt ("KEYS","keyPFar");
	key_PFar 	= Controls_StringToKey(keystr);
	Printdebug(concatstrings(concatstrings(keystr,"=>"),inttostring(key_PFar)));		
	
	keystr = MEM_GetGothOpt ("KEYS","keyPFav");
	key_PFav 	= Controls_StringToKey(keystr);
	Printdebug(concatstrings(concatstrings(keystr,"=>"),inttostring(key_PFav)));		
};


var int f12;
var int Last_MenusOpened;
func void FrameCallBack_HandleKeystorkes()
{
	//Ork: W zw. z powyzsza notatka (pocz. pliku) [bugfix]
	Key_tAction1_State = MEM_KeyState(Key_tAction1);
	Key_tAction2_State = MEM_KeyState(Key_tAction2);
	
	var int ptr; var oCNPC hiro;
	//F12
	if(MEM_KeyState(KEY_F12)==KEY_PRESSED)
	{
	/*
		return; // Ork: czegos szukam i akurat tu trafilem, to bylo dla czystej zabawy usuwam bo mogło sporo mieszać
		// 		CheckAdress(MEM_InstToPtr(MEM_World),2024,1,1); 		
		printdebug_s_i("># lights: ",MEM_World.bspTree_renderLightList_numInArray);
		// 		OptimizationVobLights_CollectLights();		
		//BspLeaf
		//0x1C - PolyArray 		
		CheckAdress(MEM_ReadInt(MEM_ReadInt(MEM_ReadInt(MEM_World.bspTree_leafList)+60)),128,1,1);
		//Wld_SpawnNpcRange	(self,sym,1,1000);		
		// 		if(GetSkyPreset()!=SKYPRESET_SUNNY)
		// 		{
		// 			SetSkyPreset(SKYPRESET_SUNNY,TRANS_SMOOTH);
		// 			CustomRainFX_InitRain(5,40,5,41,0,"",0);	
		// 		}
		// 		else
		// 		{
		// 			SetSkyPreset(SKYPRESET_FOGGY,TRANS_SMOOTH);
		// 			CustomRainFX_InitRain(5,40,5,41,0,"",0);	
		// 		};

		//CheckAdress(MeM_ReadInt(zCRenderClass),1224,2,1);
		// 	
		// 	//MEM_WriteInt(rnd+1088,0);	
		// 	rnd = MeM_ReadInt(zCRenderClass);
		// 	CALL_IntParam(0);
		// 		CALL__thiscall (rnd,7446336);	
		
		//print(MEM_GetClassName(	MEM_ReadInt(ptr)));
		var oCNpc her; her = hlp_GetNpc(pc_hero);
		printdebug_s_i(">###### voblist lenght: ",her.vobList_numInArray);
		printdebug_s_i(">###### percActivet: ",her.percActive);
		
		if(!f12)
		{

			f12 = 1;
			
		}
		else
		{
			f12 = 0;

		};	
		*/
	};

	if(f12==2)
	{ /*
		return;
		ScaleWorldTime(fracf(205,100));	//475	
		//MEM_WriteInt(SPAWN_INSERTRANGE_Address,mkf(700));
		//MEM_WriteInt(SPAWN_REMOVERANGE_Address,mkf(800));
		
		hiro = hlp_Getnpc(pc_hero);
		MEM_AssignInst (ptr, hiro);
		var int npclist; var int npcptr; var int npcptrhlp;
		var int label; var int i;

		MEM_AssignInst (npclist, MEM_World);
		npclist = MEM_ReadInt(npclist+25196);
		printdebug_s_i("npclist:",npclist);
		
		//first npc on list is always blank
		//so jump to next
		npclist = MEM_ReadInt(npclist+8);
		
		MEM_InitLabels (); 
		label = MEM_StackPos.position; 
		//CheckAdress(npclist,16,3,1);
		
		//exit if end of list
		if(!npclist)
		{
			//return;
		};
		
		npcptr = MEM_ReadInt(npclist+4);//.data
		npclist = MEM_ReadInt(npclist+8);//next on list	
		printdebug(concatstrings("NpcID:",MEM_ReadString(npcptr+16)));
		if(npcptr!=0)&&(npcptr!=ptr)//is hero
		{
			printdebug("1");
			npcptrhlp = MEM_ReadInt(npcptr+2488);//oCaniCtrl
			printdebug_s_i("2:",npcptrhlp);
			if(!npcptrhlp){
				MEM_StackPos.position =label; 
				return;
			};
			npcptrhlp = MEM_ReadInt(npcptrhlp+104);//zCModel
			printdebug_s_i("3:",npcptrhlp);
			//layer1
			npcptr = MEM_ReadInt(npcptrhlp+56);//*ActiveAniLayer1		
			printdebug_s_i("4:",npcptr);
			MEM_WriteInt(npcptr+12,mkf(5));
			printdebug("5");
			
			//layer2
			npcptr = MEM_ReadInt(npcptrhlp+60);//*ActiveAniLayer1		
			if(!npcptr)
			{
				MEM_StackPos.position =label; 
				return;
			}; 		
			printdebug_s_i("6:",npcptr);
			if(npcptr>400000000)
			{
				MEM_StackPos.position = label; 
				return;
			}; 	
			// 		if(MEM_ReadInt(npcptr)==0)
			// 		{
			// 			MEM_StackPos.position = label; 
			// 			return;
			// 		}; 	
			MEM_WriteInt(npcptr+12,mkf(5));
		};
		MEM_StackPos.position =label; 
		*/
	};

	//F5 - Damage Debug
	if(MEM_KeyState(KEY_F10)==KEY_PRESSED)
	{
		//return; // jak wyzej, ale ja jeszcze z tego skorzystam :D
		//RS_PrintActualRuneAttribs();
		//PrintScreen ("Damage Pool:",-1, 10, _STR_FONT_ONSCREEN,999119);	
		//		var int ptr;
		// 		ptr = MEM_SearchVobByName ("DMG2");
		// 		if(ptr)
		// 		{
		// 			MEM_WriteInt(ptr+72,HeroDamage_Hitpos1_X);
		// 			MEM_WriteInt(ptr+88,HeroDamage_Hitpos1_Y);
		// 			MEM_WriteInt(ptr+104,HeroDamage_Hitpos1_Z);
		// 			
		// 		};		
	};	
	
	//Chest hacking massages bugfix (anti doubles)
	if(MEM_KeyState(Key_tLeft1)==KEY_PRESSED)||(MEM_KeyState(Key_tLeft2)==KEY_PRESSED)
	||(MEM_KeyState(Key_tRight1)==KEY_PRESSED)||(MEM_KeyState(Key_tRight2)==KEY_PRESSED)
	||(MEM_KeyState(Key_tStrafeLeft1)==KEY_PRESSED)||(MEM_KeyState(Key_tStrafeLeft2)==KEY_PRESSED)
	||(MEM_KeyState(Key_tStrafeRight1)==KEY_PRESSED)||(MEM_KeyState(Key_tStrafeRight2)==KEY_PRESSED)
	{
		ChestMsgBugfix=false;	
	};
	
	printdebug("FrameCallBack_HandleKeystorkes RuneSwd");
	KeyEvent_RuneSwd();
	printdebug("FrameCallBack_HandleKeystorkes PreviousAmunition");
	KeyEvent_PreviousAmunition();
	printdebug("FrameCallBack_HandleKeystorkes NextAmunition");
	KeyEvent_NextAmunition();
	printdebug("FrameCallBack_HandleKeystorkes AmunitionBugFix");
	KeyEvent_AmunitionBugFix();

	printdebug("FrameCallBack_HandleKeystorkes LameHP");
	KeyEvent_LameHP();
	printdebug("FrameCallBack_HandleKeystorkes LameMP");
	KeyEvent_LameMP();

	printdebug("FrameCallBack_HandleKeystorkes SprintDoubleClick");
	KeyEvent_SprintDoubleClick();

	printdebug("FrameCallBack_HandleKeystorkes ParadeTunning");
	KeyEvent_ParadeTunning();
	
	//print(inttostring(Party_LastPos));	
	if(Party_LastPos)//party has npcs!
	{
		KeyEvent_PartyCommands();
	};
	//Amunition Bugfix
	printdebug("FrameCallBack_HandleKeystorkes EquipmentTakeAll");
	KeyEvent_EquipmentTakeAll();
	
	printdebug("FrameCallBack_HandleKeystorkes koniec funkcji");
};