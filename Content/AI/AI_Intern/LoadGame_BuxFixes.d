//Send at evry change lvl func
		var int globaldoc;
		var int globaldoc2;		
		
//var string TXT_TALENTS_SKILLS [NPC_TALENT_MAX]; //moved from talents.d
		
func void EVT_CHANGELEVEL()
{

	LoadGameCounter=-1;	
};


//Corrects: ...
// WARNING IT'S CALLED AFTER ON SEC DELAY!!! BY TRIGGER7
// SO MOST OF POINTERS ARE USED BEFORE IT!!!
// (yeah that means doing something there is senseless -_-)
func void LoadGame_BugFix_ResetPtrs()
{
};

//Corrects:
//-Damage
//-Amunition 
func void LoadGame_BugFix_Amunition()
{
	var C_ITEM EqRanWeap; var int id;
	eqranweap = Npc_GetEquippedRangedWeapon(hero);
 	if(eqranweap.makingmob==1)
 	{
 	A_SetMunition(eqranweap,A_Munition,TRUE);
 	}	
 	else if(eqranweap.makingmob==2)
 	{
 	A_SetMunition(eqranweap,B_Munition,FALSE);
 	};	
};	
//Corrects:
// reinit -hero sheat
func void LoadGame_BugFix_Sheats()
{
	printdebug("SHEATS-LOADGAME-BUGFIX");
	var int id; var c_item itm;
	itm = Npc_GetEquippedMeleeWeapon(hero);
	id = Hlp_GetInstanceID(itm);
	Create_SheathItemID(hero,id);
};


func void LoadGame_BugFix_Damage()
{
	printdebug("Damage-LOADGAME-BUGFIX");
	R_SWDDMG_PTR = 0;
	L_SWDDMG_PTR = 0;
	
};

func void LoadGame_BugFix_Strings()
{
	//evasion (m. circle)
	if(HERO_EVASION_LEVEL==1)//z magic circles
	{
		TXT_TALENTS_SKILLS [NPC_TALENT_EVASION] = " adept| adept| adept| adept| adept| adept| adept";
	}
	else if(HERO_EVASION_LEVEL==2)
	{
		TXT_TALENTS_SKILLS [NPC_TALENT_EVASION] = " mistrz| mistrz| mistrz| mistrz| mistrz| mistrz| mistrz";					
	};	
	
	//alchemny
	if(Npc_GetTalentValue(hero, NPC_TALENT_ALCHEMY)!=0)
	{
		TXT_TALENTS_SKILLS [NPC_TALENT_ALCHEMY] = " Tak| Tak";
	};		
	
	//smith
	if(Npc_GetTalentValue(hero, NPC_TALENT_SMITH)!=0)
	{
	TXT_TALENTS_SKILLS [NPC_TALENT_SMITH] = " Tak| Tak";              
	};
	
	//1H
	if(Npc_GetTalentSkill(hero, NPC_TALENT_1h)==1)
	{
	TXT_TALENTS_SKILLS [1] = " adept| adept";              
	}
	else if(Npc_GetTalentSkill(hero, NPC_TALENT_1h)==2)
	{
	TXT_TALENTS_SKILLS [1] = " mistrz| mistrz";              
	};
	
	//2H
	if(Npc_GetTalentSkill(hero, NPC_TALENT_2h)==1)
	{
	TXT_TALENTS_SKILLS [2] = " adept| adept";              
	}
	else if(Npc_GetTalentSkill(hero, NPC_TALENT_2h)==2)
	{
	TXT_TALENTS_SKILLS [2] = " mistrz| mistrz";              
	};	
	
	//BOW
	if(Npc_GetTalentSkill(hero, NPC_TALENT_BOW)==1)
	{
	TXT_TALENTS_SKILLS [3] = " adept| adept";              
	}
	else if(Npc_GetTalentSkill(hero, NPC_TALENT_BOW)==2)
	{
	TXT_TALENTS_SKILLS [3] = " mistrz| mistrz";              
	};		
	
	//CROSSBOW
	if(Npc_GetTalentSkill(hero, NPC_TALENT_CROSSBOW)==1)
	{
	TXT_TALENTS_SKILLS [4] = " adept| adept";              
	}
	else if(Npc_GetTalentSkill(hero, NPC_TALENT_CROSSBOW)==2)
	{
	TXT_TALENTS_SKILLS [4] = " mistrz| mistrz";              
	};		
	
};  
//Init of All BugFixs
var int GameLoaded;
func void LoadGame_BugFixList()
{
	if(LoadGameCounter==2)//gamestart
	{
//		HeroLastHP=hero.attribute[ATR_HITPOINTS];	
		//Test - TO DELETE!
		GameLoaded=FALSE;
	};
	if(LoadGameCounter!=Last_LoadGameCounter)
	{
		Last_LoadGameCounter=LoadGameCounter;
		GameLoaded=TRUE;
		LoadGame_BugFix_ResetPtrs();
		LoadGame_BugFix_Amunition();	
		LoadGame_BugFix_Strings();		
		LoadGame_BugFix_Sheats();
		LoadGame_BugFix_Damage();		
	};
		
};