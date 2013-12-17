var int Key_RuneSwd;
var int Key_PrevA;
var int Key_NextA;
var int Key_LameHP;
var int Key_LameMP;
var int key_PFollow;
var int key_PWait;
var int key_PHeal;
var int key_PNear;
var int key_PFar;
var int key_PFav;

func void KeyEvent_RuneSwd()
{
	var oCNPC hiro;	var int rune; var string rune_instance;
	if(MEM_KeyState(Key_RuneSwd)==KEY_PRESSED)
	{
		hiro = hlp_getnpc(hero);	
		if(hiro.inventory2_frame)&&(hiro.inventory2_invnr==3)
		{ //Hero is in magic category
			if(RS_HasRSInInventory())
			{ //Hero Has Runesword
				if(!Hlp_StrCmp(item.name,NAME_Spruchrolle))
				{//Sel.Item!=SCROLL
					Npc_GetInvItembyslot(hero,3,hiro.inventory2_selectedItem);			 		
					rune =	Hlp_GetInstanceID(item);
					rune = MEM_InstGetOffset(rune);
					rune_instance = MEM_ReadString(rune+16);
					rune_instance = STR_SubStr (rune_instance,8,24);
					if(MEM_ReadInt(rune+568)/*range*/==NO_RuneSword)
					{ //Means cant be used in RuneSword
						PutMsg("Runa nie pasuje!","font_default.tga",RGBAToZColor(255,50,50,255),8*1,"");			
					}
					else
					{
						MEM_CallByString (concatstrings("RUNESWD_EQUIP_RUNECHOICE_",rune_instance));						
					};
				};
			};
		};
	};
};

func void KeyEvent_PreviousAmunition()
{
	var c_item rw;
	if(Npc_HasReadiedRangedWeapon(hero))&&(!KeyAmunitionChange)
	{
		if(MEM_KeyState(Key_PrevA) != KEY_UP)
		{
			//TODO: Idea color of font means type of amunition
			rw = Npc_GetReadiedWeapon(hero);
			printdebug("Amu: [KEYEVENT] Previous Ammu");
			if(rw.makingmob==1)//bow
			{
				A_MUNITION =I_GetA_Munition(TRUE,A_MUNITION,0);	
				KeyAmunitionChange=1;
				Npc_ClearAIQueue(hero);
				Am_Unequip(0);
				AI_RemoveWeapon(hero);	
				KeyAmunitionChange=2;//to perframetrigger =when it sat to 2 hero is removing weapon
				printdebug_s_i("Amu: [KEYEVENT] Previous Ammu, new A-Munition:",A_MUNITION);
				Npc_GetInvItem(hero,A_AmunitionIDToItmID(A_MUNITION,true)); //Ork: Item dla opisu ponizej	
			}
			else//CBOW
			{
				B_MUNITION =I_GetB_Munition(TRUE,B_MUNITION,0);				
				KeyAmunitionChange=1;
				Npc_ClearAIQueue(hero);
				Am_Unequip(1);
				AI_RemoveWeapon(hero);	
				KeyAmunitionChange=2;//to perframetrigger =when it sat to 2 hero is removing weapon
				printdebug_s_i("Amu: [KEYEVENT] Previous Ammu, new B-Munition:",B_MUNITION);
				Npc_GetInvItem(hero,A_AmunitionIDToItmID(B_MUNITION,true)); //Ork: Item dla opisu ponizej		
			};
			var string msg; msg = "Poprzednia amunicja:\n";	
			msg = ConcatStrings(msg,item.description);
			PutMsg(msg,"font_default.tga",RGBAToZColor(255,255,255,255),4,"");
		};
	};	
};

func void KeyEvent_NextAmunition()
{
	var c_item rw;	
	if(Npc_HasReadiedRangedWeapon(hero))&&(!KeyAmunitionChange)
	{
		if(MEM_KeyState(Key_NextA) != KEY_UP)
		{
			rw = Npc_GetReadiedWeapon(hero);
			printdebug("Amu: [KEYEVENT] Next Ammu");	
			if(rw.makingmob==1)//bow
			{
				A_MUNITION = I_GetA_Munition(FALSE,A_MUNITION,0);	
				KeyAmunitionChange=1;
				Npc_ClearAIQueue(hero);
				Am_Unequip(0);
				AI_RemoveWeapon(hero);	
				KeyAmunitionChange=2;//to perframetrigger =when it sat to 2 hero is removing weapon		
				printdebug_s_i("Amu: [KEYEVENT] Next Ammu, new A-Munition:",A_MUNITION);	
				Npc_GetInvItem(hero,A_AmunitionIDToItmID(A_MUNITION,true)); //Ork: Item dla opisu ponizej	
			}
			else//CBOW
			{
				B_MUNITION =I_GetB_Munition(FALSE,B_MUNITION,0);				
				KeyAmunitionChange=1;
				Npc_ClearAIQueue(hero);
				Am_Unequip(1);
				AI_RemoveWeapon(hero);	
				KeyAmunitionChange=2;//to perframetrigger =when it sat to 2 hero is removing weapon
				printdebug_s_i("Amu: [KEYEVENT] Next Ammu, new A-Munition:",B_MUNITION);				
				Npc_GetInvItem(hero,A_AmunitionIDToItmID(B_MUNITION,false)); //Ork: Item dla opisu ponizej:	
			};
			var string msg; msg = "Nastepna amunicja:\n";
			msg = ConcatStrings(msg,item.description);
			PutMsg(msg,"font_default.tga",RGBAToZColor(255,255,255,255),4,"");
		};	
	};

};


func void KeyEvent_AmunitionBugFix()
{
	var c_item rw;	
	if(KeyAmunitionChange==2)
	{//Hero Is Removing RangedWeapon
		if(!Npc_HasReadiedRangedWeapon(hero))
		{  //time to ready it again!
			rw = Npc_GetEquippedRangedWeapon(hero);		
			if(rw.makingmob==1)//bow
			{		
				A_SetMunition(rw,A_munition,TRUE);	
			}		
			else//cbow
			{		
				A_SetMunition(rw,B_munition,FALSE);	//Ork: False - isBow no kurwa -_-
			};
			AI_ReadyRangedWeapon(hero);					
			KeyAmunitionChange=0;
		};	
	};
};





func void KeyEvent_LameHP()
{
	var int hp; var int hpmax;
	if(MEM_KeyState(Key_LameHP)==KEY_PRESSED)
	{
		hp = hero.attribute[ATR_HITPOINTS];
		hpmax = hero.attribute[ATR_HITPOINTS_MAX];
		if(hp>=hpmax)//||(Npc_GetBodystate(hero)==BS_RUN)
		{ return; };//FULLHP or in Run
		
		//Chose ur potion!
		//50
		if(hpmax-hp_Essenz>=hp-19)&&(Npc_HasItems(hero,ItFo_Potion_Health_01))
		{
			AI_PlayAni(hero,"T_LAMEHP");
			Npc_RemoveInvItem(hero,ItFo_Potion_Health_01);	
			Npc_ChangeAttribute			(hero,ATR_HITPOINTS,hp_Essenz); 
		}
		else if(hpmax-hp_Extrakt>=hp-19)&&(Npc_HasItems(hero,ItFo_Potion_Health_02))
		{
			AI_PlayAni(hero,"T_LAMEHP");
			Npc_RemoveInvItem(hero,ItFo_Potion_Health_02);	
			Npc_ChangeAttribute			(hero,ATR_HITPOINTS,hp_Extrakt); 
		}
		else if( (hpmax-hp_Elixier>=hp-49) || (hp-100>0) )&&(Npc_HasItems(hero,ItFo_Potion_Health_03))
		{
			AI_PlayAni(hero,"T_LAMEHP");
			Npc_RemoveInvItem(hero,ItFo_Potion_Health_03);	
			Npc_ChangeAttribute			(hero,ATR_HITPOINTS,hp_Elixier); 
		}
		else if(hp-100<=0)&&(Npc_HasItems(hero,ItFo_Potion_Health_04))//Very Low HP, drink full it's rational
		{
			AI_PlayAni(hero,"T_LAMEHP");
			Npc_RemoveInvItem(hero,ItFo_Potion_Health_04);	
			Npc_ChangeAttribute			(hero,ATR_HITPOINTS,hpmax-hp); 
		}
		else//Drink anything!
		{
			if(Npc_HasItems(hero,ItFo_Potion_Health_01))
			{
				AI_PlayAni(hero,"T_LAMEHP");
				Npc_RemoveInvItem(hero,ItFo_Potion_Health_01);	
				Npc_ChangeAttribute			(hero,ATR_HITPOINTS,hp_Essenz); 
			}
			else if(Npc_HasItems(hero,ItFo_Potion_Health_02))
			{
				AI_PlayAni(hero,"T_LAMEHP");
				Npc_RemoveInvItem(hero,ItFo_Potion_Health_02);	
				Npc_ChangeAttribute			(hero,ATR_HITPOINTS,hp_Extrakt); 
			}
			else if(Npc_HasItems(hero,ItFo_Potion_Health_03))
			{
				AI_PlayAni(hero,"T_LAMEHP");
				Npc_RemoveInvItem(hero,ItFo_Potion_Health_03);	
				Npc_ChangeAttribute			(hero,ATR_HITPOINTS,hp_Elixier); 
			}
			else if(Npc_HasItems(hero,ItFo_Potion_Health_04))
			{
				AI_PlayAni(hero,"T_LAMEHP");
				Npc_RemoveInvItem(hero,ItFo_Potion_Health_04);	
				Npc_ChangeAttribute			(hero,ATR_HITPOINTS,hpmax-hp); 
				
			};
		};
		if(hp==hero.attribute[ATR_HITPOINTS])
		{return;};
		
		//HP updated: Print Msg
		var string msg;
		msg = ConcatStrings("P¯: ",inttostring(hero.attribute[ATR_HITPOINTS]));
		msg = ConcatStrings(msg,"/");
		msg = ConcatStrings(msg,inttostring(hero.attribute[ATR_HITPOINTS_MAX]));
		PutMsg(msg,"font_default.tga",RGBAToZColor(255,100,100,255),4,"");		
	};	

};




func void KeyEvenT_LAMEMP()
{
	var int mp; var int mpmax;
	if(MEM_KeyState(Key_LameMP)==KEY_PRESSED)
	{
		mp = hero.attribute[ATR_MANA];
		mpmax = hero.attribute[ATR_MANA_MAX];
		if(mp>=mpmax)//||(Npc_GetBodystate(hero)==BS_RUN)
		{ return; };//FULLmp
		
		//Chose ur potion!
		//50
		if(mpmax-mana_Essenz>=mp-19)&&(Npc_HasItems(hero,ItFo_Potion_Mana_01))
		{
			AI_PlayAni(hero,"T_LAMEMP");
			Npc_RemoveInvItem(hero,ItFo_Potion_Mana_01);	
			Npc_ChangeAttribute			(hero,ATR_MANA,mana_Essenz); 
		}
		else if(mpmax-mana_Extrakt>=mp-19)&&(Npc_HasItems(hero,ItFo_Potion_Mana_02))
		{
			AI_PlayAni(hero,"T_LAMEMP");
			Npc_RemoveInvItem(hero,ItFo_Potion_Mana_02);	
			Npc_ChangeAttribute			(hero,ATR_MANA,mana_Extrakt); 
		}
		else if( (mpmax-mana_Elixier>=mp-49) || (mp-100>0) )&&(Npc_HasItems(hero,ItFo_Potion_Mana_03))
		{
			AI_PlayAni(hero,"T_LAMEMP");
			Npc_RemoveInvItem(hero,ItFo_Potion_Mana_03);	
			Npc_ChangeAttribute			(hero,ATR_MANA,mana_Elixier); 
		}
		else if(mp-50<=0)&&(Npc_HasItems(hero,ItFo_Potion_Mana_04))//Very Low mp, drink full it's rational
		{ //ork: fine tunning taki :)
			AI_PlayAni(hero,"T_LAMEMP");
			Npc_RemoveInvItem(hero,ItFo_Potion_Mana_04);	
			Npc_ChangeAttribute			(hero,ATR_MANA,mpmax-mp); 
			
		}
		else//Drink anything!
		{
			if(Npc_HasItems(hero,ItFo_Potion_Mana_01))
			{
				AI_PlayAni(hero,"T_LAMEMP");
				Npc_RemoveInvItem(hero,ItFo_Potion_Mana_01);	
				Npc_ChangeAttribute			(hero,ATR_MANA,mana_Essenz); 
			}
			else if(Npc_HasItems(hero,ItFo_Potion_Mana_02))
			{
				AI_PlayAni(hero,"T_LAMEMP");
				Npc_RemoveInvItem(hero,ItFo_Potion_Mana_02);	
				Npc_ChangeAttribute			(hero,ATR_MANA,mana_Extrakt); 
			}
			else if(Npc_HasItems(hero,ItFo_Potion_Mana_03))
			{
				AI_PlayAni(hero,"T_LAMEMP");
				Npc_RemoveInvItem(hero,ItFo_Potion_Mana_03);	
				Npc_ChangeAttribute			(hero,ATR_MANA,mana_Elixier); 
			}
			else if(Npc_HasItems(hero,ItFo_Potion_Mana_04))
			{
				AI_PlayAni(hero,"T_LAMEMP");
				Npc_RemoveInvItem(hero,ItFo_Potion_Mana_04);	
				Npc_ChangeAttribute			(hero,ATR_MANA,mpmax-mp); 
			};
		};
		
		if(mp==hero.attribute[ATR_MANA])
		{return;};
		
		//Mana updated: Print Msg
		var string msg;
		msg = ConcatStrings("Mana: ",inttostring(hero.attribute[ATR_MANA]));
		msg = ConcatStrings(msg,"/");
		msg = ConcatStrings(msg,inttostring(hero.attribute[ATR_MANA_MAX]));
		PutMsg(msg,"font_default.tga",RGBAToZColor(100,100,255,255),4,"");

	};	

};



// TODO: To chyba w sumie nie jest wcale zaimplementowane, có¿ :D -ork
func void KeyEvent_PartyCommands()
{
	if(MEM_KeyState(key_PFollow)==KEY_PRESSED)
	{
		//play ani
		PARTY_COMMAND = COMMAND_FOLLOW;
		PutMsg("Za mn¹!","font_default.tga",RGBAToZColor(255,255,255,255),4,"");
		AI_PlayAni(hero,"T_PARTYFOLLOW");
		follow_TP_WP="";//reset wp, dont touch!
	};
	if (MEM_KeyState(key_PWait)==KEY_PRESSED)
	{
		//play ani
		PARTY_COMMAND = COMMAND_WAIT;
		AI_PlayAni(hero,"T_PARTYWAIT");
		PutMsg("Utrzymaæ pozycje!","font_default.tga",RGBAToZColor(255,255,255,255),4,"");
		
	};
	if (MEM_KeyState(key_PHeal)==KEY_PRESSED)
	{
		//play ani
		PARTY_COMMAND = COMMAND_HEALSELF;
		PutMsg("Leczyæ rany!","font_default.tga",RGBAToZColor(255,255,255,255),4,"");
	};
	if (MEM_KeyState(key_PNear)==KEY_PRESSED)
	{
		//play ani
		PARTY_COMMAND = COMMAND_FIGHTNEAR;
		PutMsg("Walczyæ w zwarciu!","font_default.tga",RGBAToZColor(255,255,255,255),4,"");
	};
	if (MEM_KeyState(key_PFar)==KEY_PRESSED)
	{
		//play ani
		PARTY_COMMAND = COMMAND_FIGHTFar;
		PutMsg("Walczyæ w dystansie!","font_default.tga",RGBAToZColor(255,255,255,255),4,"");
	};
	if (MEM_KeyState(key_PFav)==KEY_PRESSED)
	{
		//play ani
		PARTY_COMMAND = COMMAND_FIGHTFAV;
		PutMsg("Walczyæ wed³ug uznania.","font_default.tga",RGBAToZColor(255,255,255,255),4,"");
	};
	
};

//---------------------------------
// Take all items from equipment

//var int  LCtrl_Doubleclick; //Moved to Funcs Globals
instance herofocus(C_NPC);
func void KeyEvent_EquipmentTakeAll()
{
	if(Key_tAction1_State==KEY_RELEASED || Key_tAction2_State==KEY_RELEASED)
	{
		//Get hero focus:
		var int targetptr; var int t_hp;

		var ocnpc hiro; hiro = Hlp_GetNpc(pc_hero);
		PrintDebug_s_i_s_i("Herofocus wynosi: ",herofocus,", hiro.focus_vob wynosi: ",hiro.focus_vob);

		MEM_AssignInst (herofocus,hiro.focus_vob); // <-- tu jest NULL
		targetptr =  MEM_InstToPtr(herofocus);

		printdebug(inttostring(targetptr));
		t_hp = 2;//init
		if(targetptr)
		{
			t_hp = MEM_ReadInt(targetptr+388);
		};
		printdebug("KeyEvent_EquipmentTakeAll drugi if");
		if(!LCtrl_Doubleclick)//first click of doubleclick
		{
			LCtrl_Doubleclick = 6;//6*0.125=750ms
		}
		else if(t_hp<2)&&(LCtrl_Doubleclick)&&(MEM_ReadInt(targetptr)==oCNpc_vtbl)//trader container is unconscious/dead
		{
			// Ork: Zastanawiam sie czemu nikt tego wczesniej nie wy³¹czy³ :D		
			//print(herofocus.name);

			//Transfer whole inventory except armor:
			Show_HeroTransferedItem=true;
			B_GiveAllInventory(herofocus,hero);
			if(B_InventoryIsEmpty(herofocus))
			{//nuttin was given:
				AI_PlayAni(hero,"T_DONTKNOW");
			}
			else
			{//Play sound:
				Snd_Play("BACKPACK_HANDLE");		
			};
			Show_HeroTransferedItem=false;
			
			targetptr = hiro.focus_vob;
			if(t_hp==0)
			{//Dead, he shouldn't trash hero focus anymore...
				MEM_WriteInt(targetptr+160,0);//0 = oCVOB - others causes CRASH!!!
			};
			var int this;
			this = MEM_InstToPtr(hiro);
			//Close invetories:
			CALL__thiscall (this,oCNpc__CloseDeadNpc_offset);			
			CALL__thiscall (this,oCNpc__CloseInventory_offset);			
			LCtrl_Doubleclick = 0;
		};
	};
};
var int BugfixUpdate;
func void KeyEvent_UpdateStatusScreen()
{
	BugfixUpdate =BugfixUpdate+1;
	var int ptr; var int listptr;	var int arrayptr;	
	ptr = MEM_GetMenuByString("MENU_STATUS");				
	if(ptr>1000)
	{
		CheckAdress(ptr,128,1,1);
		listptr = MEM_ReadInt(ptr+3256);//ItemArray
		CheckAdress(listptr,128,1,1);

		
		var string t14;//[73]
		var string t15;//[75]
		var string t16;//[77]
		var string t17;//[79]
		
		//Initiation of Values:
		t14 = "0";
		t15 = "Nie";
		t16 = "Nie";
		t17 = "Nie";
		
		//Check if status is changed
		//Magic Circle: (Printed in Romamian Numerics)
		var int hlp;
		hlp = Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE);
		if(hlp==1){ t14="I"; }
		if(hlp==2){ t14="II"; }
		if(hlp==3){ t14="III"; }
		if(hlp==4){ t14="IV"; }
		if(hlp==5){ t14="V"; }
		if(hlp==6){ t14="VI"; };
		
		//Dual:
		if(TALENT_DUALUSING){t15="Tak";};
		
		//Sneak:
		if(TALENT_SNEAK){t16="Tak";};
		
		//Rune Sword:
		if(TALENT_RUNESWORDUSING){t17="Tak";};         	
		
		//Apply on [71]
		ptr = MEM_ReadInt(listptr+4*71);          
		arrayptr = MEM_ReadInt(ptr+892);
		MEM_WriteString(arrayptr,t14);			
		CALL__thiscall (ptr,zCMenuItem__DrawFront_offset);			
		printdebug(concatstrings("># I'm here safe;puttin':",t14));
		//Apply on [73]
		ptr = MEM_ReadInt(listptr+4*73);          
		arrayptr = MEM_ReadInt(ptr+892);
		MEM_WriteString(arrayptr,t15);			
		CALL__thiscall (ptr,zCMenuItem__DrawFront_offset);			
		printdebug(concatstrings("># I'm here safe;puttin':",t15));
		
		//Apply on [75]
		ptr = MEM_ReadInt(listptr+4*75);           
		arrayptr = MEM_ReadInt(ptr+892);
		MEM_WriteString(arrayptr,t16);			
		CALL__thiscall (ptr,zCMenuItem__DrawFront_offset);		
		printdebug(concatstrings("># I'm here safe;puttin':",t16));
		
		//Apply on [77]
		ptr = MEM_ReadInt(listptr+4*77);          
		arrayptr = MEM_ReadInt(ptr+892);
		MEM_WriteString(arrayptr,t17);			
		CALL__thiscall (ptr,zCMenuItem__DrawFront_offset);		
		printdebug("># I'm here safe");
		
		BugfixUpdate = false;
	};
	
	//If it was closing of menustatus
	if(BugfixUpdate>5)
	{ BugfixUpdate=false;};

};
func void Hook_AfterOpenStatusScreen()
{
	//print("StatusScreenOpened");//budzis tu by³
	KeyEvent_UpdateStatusScreen();
};

// Sprint is activited by double
// click of Key "Walk Forward"
func void KeyEvent_SprintDoubleClick()
{
	if ((MEM_KeyState(Key_tForward1)==KEY_PRESSED)|| (MEM_KeyState(Key_tForward2)==KEY_PRESSED))
	&& ((Key_tAction1_State == KEY_UP) && (Key_tAction2_State == KEY_UP))// Ork: Dzieki temu sprint nie bêdzie sie nam odpalal przy walce
	{
		//Dont switch sprint on/off IF:
		//If hero is in inventory navigate in menu
		//If hero is holding Ctrl (action) TODO: get real action key, not just control
		var ocnpc hiro; hiro = Hlp_GetNpc(pc_hero);
		if(hiro.inventory2_frame)||(MEM_KeyState(KEY_LCONTROL)==KEY_PRESSED)
		{
			Sprint_UpClicked = 0;
			return; 
		};
		
		if(!Sprint_UpClicked)
		{ Sprint_UpClicked = 4; }//~0.5s for doubleclick
		else
		{ Sprint_UpClicked = -1;};//-1 For B_Sprint means switch have to be performed
	};
};
func void KeyEvent_ParadeTunning()
{
	//Speed up block "response" when hero is durinng attack/other ani.
	if //((MEM_KeyState(Key_tAction1)==KEY_HOLD)||(MEM_KeyState(Key_tAction2)==KEY_HOLD))//||(MEM_KeyState(MOUSE_BUTTONLEFT)==KEY_HOLD))
	((MEM_KeyState(Key_tDown1)==KEY_HOLD)||(MEM_KeyState(Key_tDown2)==KEY_HOLD))
	&& (Npc_IsInFightMode(hero,FMODE_MELEE))
	//TODO: Some way to detect mouse input
	{
		
		if(C_BodyStateContains(hero,BS_HIT))
		{
			var oCNpc Chero; var int ptr; var int frame;
			ptr = Hlp_GetInstanceID(hero);
			Chero = Hlp_GetNpc(ptr);
			ptr = CHero.anictrl;
			ptr = MEM_ReadInt(ptr+104);//zCModel
			ptr = MEM_ReadInt(ptr+56);//*ActiveAniLayer1]
			frame =  MEM_ReadInt(ptr+12);
			MEM_WriteInt(ptr+12,addf(frame,mkf(1)));
		};
	};
	

};