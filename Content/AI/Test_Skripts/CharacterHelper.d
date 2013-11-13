//#####################################################################
//##
//##
//##							Instanz
//##
//##
//#####################################################################
INSTANCE CH(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name 			= "CharacterHelper";
	Npctype			= Npctype_Main;
	guild			= GIL_NONE;
	level			= 10;
	voice			= 5;
	id				= 0;
	

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody	(self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			-1);
	
	//-------- ai ----------
	start_aistate = ZS_CH_Hangaround;
};

func void ZS_CH_Hangaround ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"ZS_CH_Hangaround");

	Npc_PercEnable  	(self,	PERC_ASSESSPLAYER		,	B_AssessSC			);
	Npc_PercEnable  	(self,	PERC_ASSESSTALK			,	B_AssessTalk		);
};

func void ZS_CH_Hangaround_Loop ()
{
	PrintDebugNpc	(PD_ZS_LOOP,	"ZS_CH_Hangaround_Loop");
};

func void ZS_CH_Hangaround_End ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"ZS_CH_Hangaround_End");
};

//#####################################################################
//##
//##
//##					ENDE
//##
//##
//#####################################################################
INSTANCE CH_END (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_END_COND;
	information		= CH_Training_END_Info;
	important		= 0;
	permanent		= 1;
	nr				= 999;
	description		= "KONIEC"; 
};

FUNC INT CH_Training_END_COND()
{		
		return TRUE;
};

func void CH_Training_END_Info()
{

	Ai_StopProcessInfos(self);
		
};

//#####################################################################
//##
//##
//##					ATTRIBUTE: Stärke
//##
//##
//#####################################################################
INSTANCE CH_Training_STR (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_STR_Condition;
	information		= CH_Training_STR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka: Si³a"; 
};

FUNC INT CH_Training_STR_Condition()
{		
		return TRUE;
};

func void CH_Training_STR_Info()
{
	Info_ClearChoices	(CH_Training_STR);
	
	Info_AddChoice		(CH_Training_STR, DIALOG_BACK	     							, CH_Training_STR_BACK);    
	if	(hero.LP >= LPCOST_ATTRIBUTE_STRENGTH)
	{ 
	    Info_AddChoice	(CH_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)		, CH_Strength1);
	};
	if	(hero.LP >= 5*LPCOST_ATTRIBUTE_STRENGTH)
	{
		Info_AddChoice	(CH_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)	 	, CH_Strength5);
	};	
};

func void CH_Strength1()
{
    B_BuyAttributePoints(hero,self, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH,200);
    Info_ClearChoices	(CH_Training_STR);    
	Info_AddChoice		(CH_Training_STR, DIALOG_BACK	     							, CH_Training_STR_BACK);    
	if	(hero.LP >= 5*LPCOST_ATTRIBUTE_STRENGTH)
	{
		Info_AddChoice	(CH_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)	 	, CH_Strength5);
	};	
	if	(hero.LP >= LPCOST_ATTRIBUTE_STRENGTH)
	{ 
	    Info_AddChoice	(CH_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)		, CH_Strength1);
	};  	

};

func void CH_Strength5()
{
    B_BuyAttributePoints(hero,self, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH,200);
    
    Info_ClearChoices	(CH_Training_STR);
 	
	Info_AddChoice		(CH_Training_STR, DIALOG_BACK	     							, CH_Training_STR_BACK);    
	if	(hero.LP >= LPCOST_ATTRIBUTE_STRENGTH)
	{ 
	    Info_AddChoice	(CH_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)		, CH_Strength1);
	};
	if	(hero.LP >= 5*LPCOST_ATTRIBUTE_STRENGTH)
	{
		Info_AddChoice	(CH_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)	 	, CH_Strength5);
	};	   
};

func void CH_Training_STR_BACK()
{
	Info_ClearChoices	(CH_Training_STR);
};


//#####################################################################
//##
//##
//##					ATTRIBUTE: Geschick
//##
//##
//#####################################################################
INSTANCE CH_Training_DEX (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_DEX_Condition;
	information		= CH_Training_DEX_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka: Zrêcznoœæ"; 
};

FUNC INT CH_Training_DEX_Condition()
{		
		return TRUE;
};

func void CH_Training_DEX_Info ()
{

	Info_ClearChoices	(CH_Training_DEX);
	Info_AddChoice		(CH_Training_DEX, DIALOG_BACK	     							, CH_Training_DEX_BACK);
	if	(hero.LP >= 1)
	{ 
	    Info_AddChoice	(CH_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, CH_Dexterity1);
	};	
	if	(hero.LP >= 5)
	{
		Info_AddChoice	(CH_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, CH_Dexterity5);
	};
};

func void CH_Dexterity1()
{
    B_BuyAttributePoints(hero,self, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY,200);
    
    Info_ClearChoices	(CH_Training_DEX);
	Info_AddChoice		(CH_Training_DEX, DIALOG_BACK	     							, CH_Training_DEX_BACK);
	if	(hero.LP >= 5)
	{
		Info_AddChoice	(CH_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, CH_Dexterity5);
	};   
	if	(hero.LP >= 1)
	{ 
	    Info_AddChoice	(CH_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, CH_Dexterity1);
	};		 
}; 

func void CH_Dexterity5()
{
    B_BuyAttributePoints(hero,self, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY,200);
    
    Info_ClearChoices	(CH_Training_DEX);
	Info_AddChoice		(CH_Training_DEX, DIALOG_BACK	     							, CH_Training_DEX_BACK);
    
 	if	(hero.LP >= 1)
	{ 
	    Info_AddChoice	(CH_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, CH_Dexterity1);
	};	
	if	(hero.LP >= 5)
	{
		Info_AddChoice	(CH_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, CH_Dexterity5);
	};   
};
func void CH_Training_DEX_BACK()
{
	Info_ClearChoices	(CH_Training_DEX);
};


//#####################################################################
//##
//##
//##					ATTRIBUTE: Mana
//##
//##
//#####################################################################
INSTANCE CH_Training_Mana (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Mana_Condition;
	information		= CH_Training_Mana_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka: Mana"; 
};

FUNC INT CH_Training_Mana_Condition()
{		
		return TRUE;
};

func void CH_Training_Mana_Info()
{
	Info_ClearChoices	(CH_Training_Mana);
	Info_AddChoice		(CH_Training_Mana, DIALOG_BACK	     					, CH_Training_Mana_BACK);
	if	(hero.LP >= 1)
	{ 
	    Info_AddChoice	(CH_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, CH_Mana1);
	};	
	if	(hero.LP >= 5)
	{
		Info_AddChoice	(CH_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, CH_Mana5);
	};
};
 
func void CH_Mana1()
{
    B_BuyAttributePoints(hero,self, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA,300);	
    hero.attribute[ATR_MANA]+=LPCOST_ATTRIBUTE_MANA;	    
    
    Info_ClearChoices	(CH_Training_Mana);
	Info_AddChoice		(CH_Training_Mana, DIALOG_BACK	     					, CH_Training_Mana_BACK);
	if	(hero.LP >= 5)
	{
		Info_AddChoice	(CH_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, CH_Mana5);
	};
	if	(hero.LP >= 1)
	{ 
	    Info_AddChoice	(CH_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, CH_Mana1);
	};    
}; 

func void CH_Mana5()
{
    B_BuyAttributePoints(hero,self, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA,300);	
    hero.attribute[ATR_MANA]+=5*LPCOST_ATTRIBUTE_MANA;	

    Info_ClearChoices	(CH_Training_Mana);
	Info_AddChoice		(CH_Training_Mana, DIALOG_BACK	     					, CH_Training_Mana_BACK);
	if	(hero.LP >= 1)
	{ 
	    Info_AddChoice	(CH_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, CH_Mana1);
	};	
	if	(hero.LP >= 5)
	{
		Info_AddChoice	(CH_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, CH_Mana5);
	};  
};
func void CH_Training_Mana_BACK()
{
	Info_ClearChoices	(CH_Training_Mana);
};


//#####################################################################
//##
//##
//##					TALENTE: Kampf 1H
//##
//##
//#####################################################################
INSTANCE CH_Training_Combat_1H (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Combat_1H_Condition;
	information		= CH_Training_Combat_1H_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie walczyæ broni¹ jednorêczn¹."; 
};

FUNC INT CH_Training_Combat_1H_Condition()
{		
		return TRUE;
};

func void CH_Training_Combat_1H_Info()
{
	Info_ClearChoices	(CH_Training_Combat_1H);
		if(	Npc_GetTalentValue(other, NPC_TALENT_1H)==100)
		{
			B_Say (self, other, "$NoLearnOverMax");
			return;
		};	
	Info_AddChoice		(CH_Training_Combat_1H, DIALOG_BACK	     				, CH_Training_Combat_1H_BACK);
	    Info_AddChoice	(CH_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_1,			LPCOST_TALENT_1H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1)/2))			, CH_1hL1);

	
	if	(Npc_GetTalentValue(other, NPC_TALENT_1H)<96)
	{    
	    Info_AddChoice	(CH_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_5,			LPCOST_TALENT_1H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5)/2))			, CH_1hL2);
	};	
};
//----------------------------
// 1H Funcs
//============================
func void CH_1hL1()
{
    B_GiveSkill			(hero, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1,100);
	Info_ClearChoices	(CH_Training_Combat_1H);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_1H)==100)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice		(CH_Training_Combat_1H, DIALOG_BACK	     				, CH_Training_Combat_1H_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_1H)<96)
	{    
	    Info_AddChoice	(CH_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_5,			LPCOST_TALENT_1H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5)/2))			, CH_1hL2);
	};		
	    Info_AddChoice	(CH_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_1,			LPCOST_TALENT_1H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1)/2))			, CH_1hL1);
};  

func void CH_1hL2()
{
    B_GiveSkill			(hero, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_5,100);
	CH_Training_Combat_1H_Info();    
};  

func void CH_Training_Combat_1H_BACK()
{
	Info_ClearChoices	(CH_Training_Combat_1H);
};


//#####################################################################
//##
//##
//##					TALENTE: Kampf 2H
//##
//##
//#####################################################################
INSTANCE CH_Training_Combat_2H (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Combat_2H_Condition;
	information		= CH_Training_Combat_2H_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie walczyæ broni¹ dwurêczn¹."; 
};

FUNC INT CH_Training_Combat_2H_Condition()
{		
		return TRUE;
};

func void CH_Training_Combat_2H_Info()
{
	Info_ClearChoices	(CH_Training_Combat_2H);
		if(	Npc_GetTalentValue(other, NPC_TALENT_2H)==100)
		{
			B_Say (self, other, "$NoLearnOverMax");
			return;
		};	
	Info_AddChoice		(CH_Training_Combat_2H, DIALOG_BACK	     				, CH_Training_Combat_2H_BACK);
	    Info_AddChoice	(CH_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_1,			LPCOST_TALENT_2H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1)/2))			, CH_2HL1);

	if	(Npc_GetTalentValue(other, NPC_TALENT_2H)<96)
	{    
	    Info_AddChoice	(CH_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_5,			LPCOST_TALENT_2H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5)/2))			, CH_2HL2);
	};		

};
//----------------------------
// 2H Funcs
//============================
func void CH_2HL1()
{
    B_GiveSkill			(hero, NPC_TALENT_2H, 1, LPCOST_TALENT_2H_1,100);
	Info_ClearChoices	(CH_Training_Combat_2H);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_2H)==100)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice		(CH_Training_Combat_2H, DIALOG_BACK	     				, CH_Training_Combat_2H_BACK);
	if	(Npc_GetTalentValue(other, NPC_TALENT_2H)<96)
	{    
	    Info_AddChoice	(CH_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_5,			LPCOST_TALENT_2H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5)/2))			, CH_2HL2);
	};		
	    Info_AddChoice	(CH_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_1,			LPCOST_TALENT_2H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1)/2))			, CH_2HL1);

};  

func void CH_2HL2()
{
    B_GiveSkill			(hero, NPC_TALENT_2H, 2, LPCOST_TALENT_2H_5,100);
	CH_Training_Combat_2H_Info();    
};  

func void CH_Training_Combat_2H_BACK()
{
	Info_ClearChoices	(CH_Training_Combat_2H);
};
//#####################################################################
//##
//##
//##					TALENTE: Kampf BOW
//##
//##
//#####################################################################
INSTANCE CH_Training_Combat_BOW (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Combat_BOW_Condition;
	information		= CH_Training_Combat_BOW_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie pos³ugiwaæ siê ³ukiem."; 
};

FUNC INT CH_Training_Combat_BOW_Condition()
{		
		return TRUE;
};

func void CH_Training_Combat_BOW_Info()
{
	Info_ClearChoices	(CH_Training_Combat_BOW);
		if(	Npc_GetTalentValue(other, NPC_TALENT_BOW)==100)
		{
			B_Say (self, other, "$NoLearnOverMax");
			return;
		};	
	Info_AddChoice		(CH_Training_Combat_BOW, DIALOG_BACK	     				, CH_Training_Combat_BOW_BACK);
	    Info_AddChoice	(CH_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_1,0,0)			, CH_BOWL1);

	
	if	(Npc_GetTalentValue(other, NPC_TALENT_BOW)<96)
	{    
	    Info_AddChoice	(CH_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_5,0,0)			, CH_BOWL2);
	};	
};
//----------------------------
// BOW Funcs
//============================
func void CH_BOWL1()
{
    B_GiveSkill			(hero, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1,100);
	Info_ClearChoices	(CH_Training_Combat_BOW);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_BOW)==100)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice		(CH_Training_Combat_BOW, DIALOG_BACK	     				, CH_Training_Combat_BOW_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_BOW)<96)
	{    
	    Info_AddChoice	(CH_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_5,0,0)			, CH_BOWL2);
	};		
	    Info_AddChoice	(CH_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_1,0,0)			, CH_BOWL1);
};  

func void CH_BOWL2()
{
    B_GiveSkill			(hero, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_5,100);
	CH_Training_Combat_BOW_Info();    
};  

func void CH_Training_Combat_BOW_BACK()
{
	Info_ClearChoices	(CH_Training_Combat_BOW);
};

//#####################################################################
//##
//##
//##					TALENTE: Kampf CROSSBOW
//##
//##
//#####################################################################
INSTANCE CH_Training_Combat_CROSSBOW (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Combat_CROSSBOW_Condition;
	information		= CH_Training_Combat_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie pos³ugiwaæ siê Kusz¹."; 
};

FUNC INT CH_Training_Combat_CROSSBOW_Condition()
{		
		return TRUE;
};

func void CH_Training_Combat_CROSSBOW_Info()
{
	Info_ClearChoices	(CH_Training_Combat_CROSSBOW);
		if(	Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)==100)
		{
			B_Say (self, other, "$NoLearnOverMax");
			return;
		};	
	Info_AddChoice		(CH_Training_Combat_CROSSBOW, DIALOG_BACK	     				, CH_Training_Combat_CROSSBOW_BACK);

	    Info_AddChoice	(CH_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_1,0,0)			, CH_CROSSBOWL1);

	if	(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)<96)
	{    
	    Info_AddChoice	(CH_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_5,0,0)			, CH_CROSSBOWL2);
	};	
};
//----------------------------
// CROSSBOW Funcs
//============================
func void CH_CROSSBOWL1()
{
    B_GiveSkill			(hero, NPC_TALENT_CROSSBOW, 1, LPCOST_TALENT_CROSSBOW_1,100);
	Info_ClearChoices	(CH_Training_Combat_CROSSBOW);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)==100)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice		(CH_Training_Combat_CROSSBOW, DIALOG_BACK	     				, CH_Training_Combat_CROSSBOW_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)<96)
	{    
	    Info_AddChoice	(CH_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_5,0,0)			, CH_CROSSBOWL2);
	};		
	    Info_AddChoice	(CH_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_1,0,0)			, CH_CROSSBOWL1);
};  

func void CH_CROSSBOWL2()
{
    B_GiveSkill			(hero, NPC_TALENT_CROSSBOW, 2, LPCOST_TALENT_CROSSBOW_5,100);
	CH_Training_Combat_CROSSBOW_Info();    
};  

func void CH_Training_Combat_CROSSBOW_BACK()
{
	Info_ClearChoices	(CH_Training_Combat_CROSSBOW);
};







//#####################################################################
//##
//##
//##					TALENTE: Magie
//##
//##
//#####################################################################
INSTANCE CH_Training_Magic (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Magic_Condition;
	information		= CH_Training_Magic_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka: Magia"; 
};

FUNC INT CH_Training_Magic_Condition()
{		
		return TRUE;
};

func void CH_Training_Magic_Info()
{
	Info_ClearChoices	(CH_Training_Magic);
	Info_AddChoice		(CH_Training_Magic, DIALOG_BACK	     					, CH_Training_Magic_BACK);

	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 0)&&(Kapitel>=1) 
	{
		Info_AddChoice(CH_Training_Magic, B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,	0,ATR_MANA_MAX,20,0,0), CH_Magic1);
	}
	else if (Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 1)&&(Kapitel>=2)  
	{
		Info_AddChoice(CH_Training_Magic, B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,	0,ATR_MANA_MAX,40,0,0), CH_Magic2);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 2)&&(Kapitel>=3)  
	{
		Info_AddChoice(CH_Training_Magic, B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,	0,ATR_MANA_MAX,60,0,0), CH_Magic3);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE)== 3)&&(Kapitel>=4)  
	{
		Info_AddChoice(CH_Training_Magic, B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,	0,ATR_MANA_MAX,80,0,0), CH_Magic4);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 4)&&(Kapitel>=5)  
	{
		Info_AddChoice(CH_Training_Magic, B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,	0,ATR_MANA_MAX,100,0,0), CH_Magic5);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 5)&&(Kapitel>=5)   
	{
		Info_AddChoice	(CH_Training_Magic,	B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,	0,ATR_MANA_MAX,120,0,0),	CH_Magic6);
	};
};

func void CH_Magic1()
{
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_MAGE, 1, LPCOST_TALENT_MAGE_1,100);
	CH_Training_Magic_Info();
};  

func void CH_Magic2()
{
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_MAGE, 2, LPCOST_TALENT_MAGE_2,100);
	CH_Training_Magic_Info();
};  

func void CH_Magic3()
{   
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_MAGE, 3, LPCOST_TALENT_MAGE_3,100);
 	CH_Training_Magic_Info();
}; 

func void CH_Magic4()
{
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_MAGE, 4, LPCOST_TALENT_MAGE_4,100);
 	CH_Training_Magic_Info();
};  

func void CH_Magic5()
{
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_MAGE, 5, LPCOST_TALENT_MAGE_5,100);
 	CH_Training_Magic_Info(); 
}; 

func void CH_Magic6()
{
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6,100);
 	CH_Training_Magic_Info();
};  

func void CH_Training_Magic_BACK()
{
	Info_ClearChoices	(CH_Training_Magic);
};



//#####################################################################
//##
//##
//##					TALENTE: Acrobat
//##
//##
//#####################################################################
INSTANCE CH_Training_Acrobat (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Acrobat_Condition;
	information		= CH_Training_Acrobat_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka: Akrobatyka (10PN)"; 
};

FUNC INT CH_Training_Acrobat_Condition()
{		
	if(TALENT_ACROBAT == 0) 
	{
		return TRUE;
	};
};


func void CH_Training_Acrobat_Info()
{
	
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_ACROBAT, 1, LPCOST_TALENT_ACROBAT,100);
   
};	

//#####################################################################
//##
//##
//##					TALENTE: Sneak
//##
//##
//#####################################################################
INSTANCE CH_Training_Sneak (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Sneak_Condition;
	information		= CH_Training_Sneak_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka: Skradanie siê (10PN)"; 
};

FUNC INT CH_Training_Sneak_Condition()
{		
	if	(TALENT_SNEAK == 0) 
	{
		return TRUE;
	};
};


func void CH_Training_Sneak_Info()
{
	
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK,999);
   
};	

//#####################################################################
//##
//##
//##					TALENTE: PickPocket
//##
//##
//#####################################################################
INSTANCE CH_Training_PickPocket (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_PickPocket_Condition;
	information		= CH_Training_PickPocket_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka: Kradzie¿"; 
};

FUNC INT CH_Training_PickPocket_Condition()
{		
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) != 2)
	{
		return TRUE;
	};
};


func void CH_Training_PickPocket_Info()
{
	Info_ClearChoices	(CH_Training_PickPocket);
	Info_AddChoice		(CH_Training_PickPocket, DIALOG_BACK	     					, CH_Training_PickPocket_BACK);
		
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{    
	    Info_AddChoice	(CH_Training_PickPocket,	B_BuildLearnString(NAME_LearnPickpocket_2,	LPCOST_TALENT_PICKPOCKET_2,	0,0,0,0,0),	CH_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{    
	    Info_AddChoice	(CH_Training_PickPocket,	B_BuildLearnString(NAME_LearnPickpocket_1,	LPCOST_TALENT_PICKPOCKET_1,	0,0,0,0,0),	CH_Pickpocket1);
	};
   
};	


func void CH_Pickpocket1()
{
    B_GiveSkill			(hero, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1,100);
	CH_Training_PickPocket_Info();
}; 

func void CH_Pickpocket2()
{
    B_GiveSkill			(hero, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2,100);
	CH_Training_PickPocket_Info();
}; 

func void CH_Training_PickPocket_BACK()
{
	Info_ClearChoices	(CH_Training_PickPocket);
};   


//#####################################################################
//##
//##
//##					TALENTE: PickLock
//##
//##
//#####################################################################
INSTANCE CH_Training_PickLock (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_PickLock_Condition;
	information		= CH_Training_PickLock_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka: Otwieranie zamków"; 
};

FUNC INT CH_Training_PickLock_Condition()
{		
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PickLock) != 2)
	{
		return TRUE;
	};
};


func void CH_Training_PickLock_Info()
{
	Info_ClearChoices	(CH_Training_PickLock);
	Info_AddChoice		(CH_Training_PickLock, DIALOG_BACK	     					, CH_Training_PickLock_BACK);
		
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{    
	    Info_AddChoice	(CH_Training_PickLock,	B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,	0,0,0,0,0),		CH_Picklock2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{    
	    Info_AddChoice	(CH_Training_PickLock, B_BuildLearnString(NAME_LearnPicklock_1,		LPCOST_TALENT_PICKLOCK_1,	0,0,0,0,0),		CH_Picklock1);
	};
   
};


func void CH_Picklock1()
{
    B_GiveSkill			(hero, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1,100);
	CH_Training_PickLock_Info();
};

func void CH_Picklock2()
{
    B_GiveSkill			(hero, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2,100);
	CH_Training_PickLock_Info();
}; 

func void CH_Training_PickLock_BACK()
{
	Info_ClearChoices	(CH_Training_PickLock);
};   


//#####################################################################
//##
//##
//##					NEW SKILLS
//##
//##
//#####################################################################

//#####################################################################
//##
//##
//##					TALENTE: QUICK LERNING
//##
//##
//#####################################################################
INSTANCE CH_Training_QLERNING (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_QLERNING_Condition;
	information		= CH_Training_QLERNING_Info;
	important		= 0;
	permanent		= 1;
	description		= "Szybka Nauka."; 
};

FUNC INT CH_Training_QLERNING_Condition()
{		
	if (Npc_GetTalentSkill(hero, HACK_NPC_TALENT_QUICK_LERNING) != 2)
	{
		return TRUE;
	};
};


func void CH_Training_QLERNING_Info()
{

	Info_ClearChoices	(CH_Training_QLERNING);
	Info_AddChoice		(CH_Training_QLERNING, DIALOG_BACK	     					, CH_Training_QLERNING_BACK);
		
	if	(Npc_GetTalentSkill(hero, HACK_NPC_TALENT_QUICK_LERNING) == 1) 
	{    
	    Info_AddChoice	(CH_Training_QLERNING,	B_BuildLearnString(NAME_LearnQuickLerning_2,	LPCOST_TALENT_QLERNING_2,	0,0,0,0,0),		CH_Training_QLERNING2);
	};
	if	(Npc_GetTalentSkill(hero, HACK_NPC_TALENT_QUICK_LERNING) == 0) 
	{    
	    Info_AddChoice	(CH_Training_QLERNING, B_BuildLearnString(NAME_LearnQuickLerning_1,		LPCOST_TALENT_QLERNING_1,	0,0,0,0,0),		CH_Training_QLERNING1);
	};
   
};


func void CH_Training_QLERNING1()
{
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_QUICK_LERNING, 1, LPCOST_TALENT_QLERNING_1,100);
	CH_Training_QLERNING_Info();
};

func void CH_Training_QLERNING2()
{
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_QUICK_LERNING, 2, LPCOST_TALENT_QLERNING_2,100);
	CH_Training_QLERNING_Info();
}; 

func void CH_Training_QLERNING_BACK()
{
	Info_ClearChoices	(CH_Training_QLERNING);
}; 


//#####################################################################
//##
//##
//##					TALENTE: Dual
//##
//##
//#####################################################################
INSTANCE CH_Training_Dual (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Dual_Condition;
	information		= CH_Training_Dual_Info;
	important		= 0;
	permanent		= 1;
	description		= NAME_DUALSLERN; 
};

FUNC INT CH_Training_Dual_Condition()
{		
	if	(TALENT_DUALUSING == 0) 
	{
		return TRUE;
	};
};


func void CH_Training_Dual_Info()
{
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_DUALUSING, 1, 30,100);
   
};	



//#####################################################################
//##
//##
//##					TALENTE: RuneSword
//##
//##
//#####################################################################
INSTANCE CH_Training_RuneSword (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_RuneSword_Condition;
	information		= CH_Training_RuneSword_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie pos³ugiwaæ siê mieczem runicznym(30 PN)"; 
};

FUNC INT CH_Training_RuneSword_Condition()
{		
	if	(TALENT_RUNESWORDUSING == 0) 
	{
		return TRUE;
	};
};

func void CH_Training_RuneSword_Info()
{
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_RUNESWORDUSING, 1, 30, 100);
};	

//#####################################################################
//##
//##
//##					TALENTE: Item_Charmer
//##
//##
//#####################################################################
INSTANCE CH_Training_Item_Charmer (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Item_Charmer_Condition;
	information		= CH_Training_Item_Charmer_Info;
	important		= 0;
	permanent		= 1;
	description		= "W³adanie magicznymi szponami(5 PN 100 pkt. maks. many)"; 
};

FUNC INT CH_Training_Item_Charmer_Condition()
{		
	if	(TALENT_ITEM_CHARMER == 0) 
	{
		return TRUE;
	};
};

func void CH_Training_Item_Charmer_Info()
{
    Hack_B_GiveSkill			(hero, HACK_NPC_TALENT_ITEM_CHARMER, 1, 5, 100);
};	

//#####################################################################
//##
//##
//##					TALENTE: LP_REGENERATION
//##
//##
//#####################################################################
INSTANCE CH_Training_LP_REGENERATION (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_LP_REGENERATION_Condition;
	information		= CH_Training_LP_REGENERATION_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie regeneracji ¿ycia."; 
};

FUNC INT CH_Training_LP_REGENERATION_Condition()
{		
	if(Npc_GetTalentSkill(hero, NPC_TALENT_REGEN_HP) != 2)
	{
		return TRUE;
	};
};

func void CH_Training_LP_REGENERATION_Info()
{
	Info_ClearChoices	(CH_Training_LP_REGENERATION);	
	Info_AddChoice		(CH_Training_LP_REGENERATION, DIALOG_BACK			 , CH_Training_LP_REGENERATION_BACK);    
   
 	if	(Npc_GetTalentSkill(hero, NPC_TALENT_REGEN_HP) == 1)
	{
		Info_AddChoice	(CH_Training_LP_REGENERATION, B_BuildLearnString(NAME_LearnRegenHP_2,20,0,0,0,0,0)		, CH_Training_LP_REGENERATION2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_REGEN_HP) == 0)
	{ 
	    Info_AddChoice	(CH_Training_LP_REGENERATION, B_BuildLearnString(NAME_LearnRegenHP_1,10,0,0,0,0,0)		, CH_Training_LP_REGENERATION1);
	};  
};	

func void CH_Training_LP_REGENERATION_BACK()
{
	Info_ClearChoices	(CH_Training_LP_REGENERATION);
};

func void CH_Training_LP_REGENERATION1()
{
   B_GiveSkill			(hero, NPC_TALENT_REGEN_HP, 1, 10, 100);
	Info_ClearChoices	(CH_Training_LP_REGENERATION);
};

func void CH_Training_LP_REGENERATION2()
{
   B_GiveSkill			(hero, NPC_TALENT_REGEN_HP, 2, 20, 100);
	Info_ClearChoices	(CH_Training_LP_REGENERATION);
};

//#####################################################################
//##
//##
//##					TALENTE: MP_REGENERATION
//##
//##
//#####################################################################
INSTANCE CH_Training_MP_REGENERATION (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_MP_REGENERATION_Condition;
	information		= CH_Training_MP_REGENERATION_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie regeneracji many."; 
};

FUNC INT CH_Training_MP_REGENERATION_Condition()
{		
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_REGEN_MP) != 2)
	{
		return TRUE;
	};
};


func void CH_Training_MP_REGENERATION_Info()
{
	Info_ClearChoices	(CH_Training_MP_REGENERATION);	
	Info_AddChoice		(CH_Training_MP_REGENERATION, DIALOG_BACK			 , CH_Training_MP_REGENERATION_BACK);    
 	if	(Npc_GetTalentSkill(hero, NPC_TALENT_REGEN_MP) == 1)
	{
		Info_AddChoice	(CH_Training_MP_REGENERATION, B_BuildLearnString(NAME_LearnRegenMP_2,20,0,0,0,0,0)		, CH_Training_MP_REGENERATION2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_REGEN_MP) == 0)
	{ 
	    Info_AddChoice	(CH_Training_MP_REGENERATION, B_BuildLearnString(NAME_LearnRegenMP_1,10,0,0,0,0,0)		, CH_Training_MP_REGENERATION1);
	};  
};	

func void CH_Training_MP_REGENERATION_BACK()
{
		Info_ClearChoices	(CH_Training_MP_REGENERATION);

};

func void CH_Training_MP_REGENERATION1()
{
   		B_GiveSkill			(hero, NPC_TALENT_REGEN_MP, 1, 10, 100);
		Info_ClearChoices	(CH_Training_MP_REGENERATION);

};

func void CH_Training_MP_REGENERATION2()
{
   		B_GiveSkill			(hero, NPC_TALENT_REGEN_MP, 2, 20, 100);
		Info_ClearChoices	(CH_Training_MP_REGENERATION);

};

//#####################################################################
//##
//##
//##					TALENTE: EVASION
//##
//##
//#####################################################################
INSTANCE CH_Training_EVASION (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_EVASION_Condition;
	information		= CH_Training_EVASION_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie unikania ciosów."; 
};

FUNC INT CH_Training_EVASION_Condition()
{		
	if (HERO_EVASION_LEVEL != 2)
	{
		return TRUE;
	};
};


func void CH_Training_EVASION_Info()
{
	Info_ClearChoices	(CH_Training_EVASION);	
	Info_AddChoice		(CH_Training_EVASION, DIALOG_BACK			 , CH_Training_EVASION_BACK);    
 	if	(HERO_EVASION_LEVEL == 1)
	{
		Info_AddChoice	(CH_Training_EVASION, B_BuildLearnString(NAME_LearnEvasion_2,20,0,0,0,0,0)		, CH_Training_EVASION2);
	};
	if	(HERO_EVASION_LEVEL == 0)
	{ 
	    Info_AddChoice	(CH_Training_EVASION, B_BuildLearnString(NAME_LearnEvasion_1,10,0,0,0,0,0)		, CH_Training_EVASION1);
	};  
};	

func void CH_Training_EVASION_BACK()
{
		Info_ClearChoices	(CH_Training_EVASION);

};

func void CH_Training_EVASION2()
{
	
   		B_GiveSkill			(hero, NPC_TALENT_EVASION, 2, 20, 100);
		Info_ClearChoices	(CH_Training_EVASION);
};

func void CH_Training_EVASION1()
{
   		B_GiveSkill			(hero, NPC_TALENT_EVASION, 1, 10, 100);
		Info_ClearChoices	(CH_Training_EVASION);
};



//#####################################################################
//##
//##
//##					TALENT: SMITH
//##
//##
//#####################################################################
INSTANCE CH_Training_Smith (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Smith_Condition;
	information		= CH_Training_Smith_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka Kowalstwa."; 
};

FUNC INT CH_Training_Smith_Condition()
{		
		return TRUE;
};

func void CH_Training_Smith_Info()
{
	Info_ClearChoices	(CH_Training_Smith);
	Info_AddChoice		(CH_Training_Smith, DIALOG_BACK	     					, CH_Training_Smith_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_SMITH);
	    Info_AddChoice	(CH_Training_Smith, B_BuildLearnString(NAME_LearnSmith_1,1,0,ATR_STRENGTH,talval+1,ATR_DEXTERITY,Math_Round((talval+1)/2))		, CH_Smith1);
		Info_AddChoice	(CH_Training_Smith, B_BuildLearnString(NAME_LearnSmith_5,5,0,ATR_STRENGTH,talval+5,ATR_DEXTERITY,Math_Round((talval+5)/2))		, CH_Smith5);
	
};
 
func void CH_Smith1()
{
   	B_GiveSkill			(hero, NPC_TALENT_SMITH, 1, 1, 100);
	Info_ClearChoices	(CH_Training_Smith);
	Info_AddChoice		(CH_Training_Smith, DIALOG_BACK	     					, CH_Training_Smith_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_SMITH);
		Info_AddChoice	(CH_Training_Smith, B_BuildLearnString(NAME_LearnSmith_5,5,0,ATR_STRENGTH,talval+5,ATR_DEXTERITY,Math_Round((talval+5)/2))		, CH_Smith5);
	    Info_AddChoice	(CH_Training_Smith, B_BuildLearnString(NAME_LearnSmith_1,1,0,ATR_STRENGTH,talval+1,ATR_DEXTERITY,Math_Round((talval+1)/2))		, CH_Smith1);
  

}; 

func void CH_Smith5()
{
   	B_GiveSkill			(hero, NPC_TALENT_SMITH, 5, 5, 100);
    
   CH_Training_Smith_Info();
	
};
func void CH_Training_Smith_BACK()
{
	Info_ClearChoices	(CH_Training_Smith);
};




//#####################################################################
//##
//##
//##					TALENT: ALCHEMY
//##
//##
//#####################################################################
INSTANCE CH_Training_ALCHEMY (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_ALCHEMY_Condition;
	information		= CH_Training_ALCHEMY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka Alchemii."; 
};

FUNC INT CH_Training_ALCHEMY_Condition()
{		
		return TRUE;
};

func void CH_Training_ALCHEMY_Info()
{
	Info_ClearChoices	(CH_Training_ALCHEMY);
	Info_AddChoice		(CH_Training_ALCHEMY, DIALOG_BACK	     					, CH_Training_ALCHEMY_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_ALCHEMY);
	    Info_AddChoice	(CH_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_1,1,0,ATR_MANA_MAX,talval+1,0,0)		, CH_ALCHEMY1);
		Info_AddChoice	(CH_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_5,5,0,ATR_MANA_MAX,talval+5,0,0)		, CH_ALCHEMY5);

};
 
func void CH_ALCHEMY1()
{
   	B_GiveSkill			(hero, NPC_TALENT_ALCHEMY, 1, 1, 100);
	Info_ClearChoices	(CH_Training_ALCHEMY);
	Info_AddChoice		(CH_Training_ALCHEMY, DIALOG_BACK	     					, CH_Training_ALCHEMY_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_ALCHEMY);
		Info_AddChoice	(CH_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_5,5,0,ATR_MANA_MAX,talval+5,0,0)		, CH_ALCHEMY5);
	    Info_AddChoice	(CH_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_1,1,0,ATR_MANA_MAX,talval+1,0,0)		, CH_ALCHEMY1);
    

}; 

func void CH_ALCHEMY5()
{
   	B_GiveSkill			(hero, NPC_TALENT_ALCHEMY, 5, 5, 100);
    
	CH_Training_ALCHEMY_Info();

};
func void CH_Training_ALCHEMY_BACK()
{
	Info_ClearChoices	(CH_Training_ALCHEMY);
};


//#####################################################################
//##
//##
//##					ANIMALTHROPHY
//##
//##
//#####################################################################
INSTANCE CH_Training_TROPHY (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_TROPHY_Condition;
	information		= CH_Training_TROPHY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka oprawianie zwierzyny."; 
};

FUNC INT CH_Training_TROPHY_Condition()
{		
		return TRUE;
};

func void CH_Training_TROPHY_Info()
{
	Info_ClearChoices	(CH_Training_TROPHY);
	Info_AddChoice		(CH_Training_TROPHY, DIALOG_BACK	     					, CH_Training_TROPHY_BACK);
	if(!Knows_GetTeeth)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetTeeth		, CH_TROPHY_TEETH);
	};
	if(!Knows_GetClaws)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetClaws		, CH_TROPHY_CLAWS);
	};	
	if(!Knows_GetFur)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetFur		, CH_TROPHY_FUR);
	};	
	if(!Knows_GetHide)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetHide		, CH_TROPHY_HIDE);
	};	
	if(!Knows_GetTongue)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetTongue		, CH_TROPHY_TONGUE);
	};	
	if(!Knows_GetMCMandibles)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetMCMandibles		, CH_TROPHY_GetMCMandibles);
	};	
	if(!Knows_GetMCThread)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetMCThread		, CH_TROPHY_GetMCThread);
	};	
	if(!Knows_GetMCPlates)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetMCPlates		, CH_TROPHY_GetMCPlates);
	};	
	if(!Knows_GetBFSting)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetBFSting		, CH_TROPHY_GetBFSting);
	};		
	if(!Knows_GetWings)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetWings		, CH_TROPHY_GetWings);
	};	
	if(!Knows_GetHorn)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetHorn		, CH_TROPHY_GetHorn);
	};		
	if(!Knows_GetLiver)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetLiver		, CH_TROPHY_GetLiver);
	};	
	if(!Knows_GetFeather)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetFeather		, CH_TROPHY_GetFeather);
	};		
	if(!Knows_GetWTF)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetWTF		, CH_TROPHY_GetWTF);
	};
	if(!Knows_GetWool)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetWool		, CH_TROPHY_GetWool);
	};		
	if(!Knows_GetHeart)
	{
    Info_AddChoice		(CH_Training_TROPHY, TEXT_LERN_GetHeart		, CH_TROPHY_GetHeart);
	};										
};
func void CH_Training_TROPHY_BACK()
{
	Info_ClearChoices	(CH_Training_TROPHY);
	
}; 
func void CH_TROPHY_TEETH()
{
	
	if	(hero.LP >= LPCOST_GetTeeth)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetTeeth)
	{
		 PrintScreen	("Nowa umiejêtnoœæ: Zdobywanie k³ów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		 Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		 B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ zdobywania k³ów wilków, orkowych psów, zêbaczy, k¹saczy, ogarów i cieniostworów.");	
		 hero.lp-=LPCOST_GetTeeth;
		 Knows_GetTeeth=TRUE;
		 B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetTeeth);
		 Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetTeeth);
		 
	}
	else if(hero.LP >= LPCOST_GetTeeth)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

}; 

func void CH_TROPHY_CLAWS()
{
	if	(hero.LP >= LPCOST_GetClaws)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetClaws)
	{
		PrintScreen	("Nowa umiejêtnoœæ: Zdobywanie pazurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ wyci¹gania pazurów jaszczurów, zêbaczy, topielców, k¹saczy i brzytew");
		hero.lp-=LPCOST_GetClaws;
		Knows_GetClaws=TRUE;
		 B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetClaws);
		 Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetClaws);
		 
	}
	else if(hero.LP >= LPCOST_GetClaws)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

}; 

func void CH_TROPHY_FUR()
{
	if	(hero.LP >= LPCOST_GetFur)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetFur)
	{
			PrintScreen	("Nowa umiejêtnoœæ: Œci¹ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ œci¹gania futer z wilków, orkowych psów, cieniostworów i trolli");
		hero.lp-=LPCOST_GetFur;
		Knows_GetFur=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetFur);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetFur);
		 
	}
	else if(hero.LP >= LPCOST_GetFur)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

}; 

func void CH_TROPHY_HIDE()
{
	if	(hero.LP >= LPCOST_Gethide)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_Gethide)
	{
		PrintScreen	("Nowa umiejêtnoœæ: Skórowanie jaszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ skórowania jaszczurów i b³otnych wê¿y");
		hero.lp-=LPCOST_Gethide;
		Knows_GetHide=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_Gethide);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_Gethide);
		 
	}
	else if(hero.LP >= LPCOST_Gethide)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

}; 

func void CH_TROPHY_TONGUE()
{
	if	(hero.LP >= LPCOST_GetTongue)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetTongue)
	{
		PrintScreen	("Nowa umiejêtnoœæ: Usuwanie jêzyków", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ usuwania jêzyków jaszczurów, ognistych jaszczurów i jaszczurocz³eków.");
		hero.lp-=LPCOST_GetTongue;
		Knows_GetTongue=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetTongue);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetTongue);
		 
	}
	else if(hero.LP >= LPCOST_GetTongue)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

}; 

func void CH_TROPHY_GetMCMandibles()
{
	if	(hero.LP >= LPCOST_GetMCMandibles)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetMCMandibles)
	{
		PrintScreen	("Nowa umiejêtnoœæ: usuwanie ¿uwaczek", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ usuwania ¿uwaczek pe³zaczy i pe³zaczy wojowników.");		
		hero.lp-=LPCOST_GetMCMandibles;
		Knows_GetMCMandibles=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetMCMandibles);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetMCMandibles);
		 
	}
	else if(hero.LP >= LPCOST_GetMCMandibles)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

}; 

func void CH_TROPHY_GetMCThread()
{
	if	(hero.LP >= LPCOST_GetMCThread)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetMCThread)
	{
		PrintScreen	("Nowa umiejêtnoœæ: pozyskiwanie sieci pe³zacza", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania sieci pe³zaczy i pe³zaczy wojowników.");		
		hero.lp-=LPCOST_GetMCThread;
		Knows_GetMCThread=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetMCThread);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetMCThread);
		 
	}
	else if(hero.LP >= LPCOST_GetMCThread)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

}; 

func void CH_TROPHY_GetMCPlates()
{
	if	(hero.LP >= LPCOST_GetMCPlates)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetMCPlates)
	{
		PrintScreen	("Nowa umiejêtnoœæ: Usuwanie pancerzy pe³zacza", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ usuwania pancerzy pe³zaczy wojowników.");		
		hero.lp-=LPCOST_GetMCPlates;
		Knows_GetMCPlates=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetMCPlates);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetMCPlates);
		 
	}
	else if(hero.LP >= LPCOST_GetMCPlates)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

}; 

func void CH_TROPHY_GetBFSting()
{
	if	(hero.LP >= LPCOST_GetBFSting)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetBFSting)
	{
		PrintScreen	("Nowa umiejêtnoœæ: pozyskiwanie ¿¹d³a.", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania ¿ad³a krwiopijcy.");		
		hero.lp-=LPCOST_GetBFSting;
		Knows_GetBFSting=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetBFSting);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetBFSting);
		 
	}
	else if(hero.LP >= LPCOST_GetBFSting)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

}; 

func void CH_TROPHY_GetWings()
{
	if	(hero.LP >= LPCOST_GetWings)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetWings)
	{
		PrintScreen	("Nowa umiejêtnoœæ: pozyskiwanie skrzyde³.", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania skrzyd³a krwiopijcy.");		
		hero.lp-=LPCOST_GetWings;
		Knows_GetWings=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetWings);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetWings);
		 
	}
	else if(hero.LP >= LPCOST_GetWings)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

}; 

func void CH_TROPHY_GetHorn()
{
	if	(hero.LP >= LPCOST_GetHorn)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetHorn)
	{
		PrintScreen	("Nowa umiejêtnoœæ: Pozyskiwanie rogu.", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania rogu smoczego zêbacza i cieniostwora.");		
		hero.lp-=LPCOST_GetHorn;
		Knows_GetHorn=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetHorn);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetHorn);
		 
	}
	else if(hero.LP >= LPCOST_GetHorn)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

};

func void CH_TROPHY_GetLiver()
{
	if	(hero.LP >= LPCOST_GetLiver)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetLiver)
	{
		PrintScreen	("Nowa umiejêtnoœæ: pozyskiwanie w¹troby kretoszczura.", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania w¹troby kretoszczura.");		
		hero.lp-=LPCOST_GetLiver;
		Knows_GetLiver=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetLiver);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetLiver);
		 
	}
	else if(hero.LP >= LPCOST_GetLiver)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

};  

func void CH_TROPHY_GetFeather()
{
	if	(hero.LP >= LPCOST_GetFeather)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetFeather)
	{
		PrintScreen	("Nowa umiejêtnoœæ: pozyskiwanie piór.", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania piór scierwojada i harpii.");		
		hero.lp-=LPCOST_GetFeather;
		Knows_GetFeather=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetFeather);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetFeather);
		 
	}
	else if(hero.LP >= LPCOST_GetFeather)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

};  

func void CH_TROPHY_GetWTF()
{
	if	(hero.LP >= LPCOST_GetWTF)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetWTF)
	{
		PrintScreen	("Nowa umiejêtnoœæ: pozyskiwanie jelita cieniostwora.", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania jelita cieniostwora.");		
		hero.lp-=LPCOST_GetWTF;
		Knows_GetWTF=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetWTF);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetWTF);
		 
	}
	else if(hero.LP >= LPCOST_GetWTF)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

};  

func void CH_TROPHY_GetWool()
{
	if	(hero.LP >= LPCOST_GetWool)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetWool)
	{
		PrintScreen	("Nowa umiejêtnoœæ: pozyskiwanie we³ny.", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania owczej we³ny.");		
		hero.lp-=LPCOST_GetWool;
		Knows_GetWool=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetWool);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetWool);
		 
	}
	else if(hero.LP >= LPCOST_GetWool)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

};  

func void CH_TROPHY_GetHeart()
{
	if	(hero.LP >= LPCOST_GetHeart)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetHeart)
	{
		PrintScreen	("Nowa umiejêtnoœæ: pozyskiwanie we³ny.", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania owczej we³ny.");		
		hero.lp-=LPCOST_GetHeart;
		Knows_GetHeart=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetHeart);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetHeart);
		 
	}
	else if(hero.LP >= LPCOST_GetHeart)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    

};  