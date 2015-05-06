// ************************************************************
// 			  		TEACHERS OUTWORLD 
// ************************************************************
//
//-Cavalorn
//-?
//

// ************************************************************
// 			  		Cavalorn
// ************************************************************

//#####################################################################
//##
//##
//##					TALENTE: Sneak
//##
//##
//#####################################################################
INSTANCE HUN_336_CAVALORN_Training_Sneak (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	condition		= HUN_336_CAVALORN_Training_Sneak_Condition;
	information		= HUN_336_CAVALORN_Training_Sneak_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= name_learning_sneak; 
};

FUNC INT HUN_336_CAVALORN_Training_Sneak_Condition()
{		
	if	((TALENT_SNEAK == 0) && Npc_KnowsInfo(hero, DIA_Cavalorn_CanYouTeachMe))
	{
		return TRUE;
	};
};

func void HUN_336_CAVALORN_Training_Sneak_Info()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK,100);
};	

//#####################################################################
//##
//##
//##					TALENTE: Kampf BOW
//##
//##
//#####################################################################
INSTANCE HUN_336_CAVALORN_Training_Combat_BOW (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	condition		= HUN_336_CAVALORN_Training_Combat_BOW_Condition;
	information		= HUN_336_CAVALORN_Training_Combat_BOW_Info;
	important		= 0;
	permanent		= 1;
	nr				= 901;
	description		= name_learning_bow; 
};

FUNC INT HUN_336_CAVALORN_Training_Combat_BOW_Condition()
{		
	if	(Npc_KnowsInfo(hero, DIA_Cavalorn_CanYouTeachMe))
	{
		return TRUE;
	};
};

func void HUN_336_CAVALORN_Training_Combat_BOW_Info()
{
	Info_ClearChoices	(HUN_336_CAVALORN_Training_Combat_BOW);
	
   if(Npc_GetTalentValue(other, NPC_TALENT_BOW)==30)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
   
	Info_AddChoice(HUN_336_CAVALORN_Training_Combat_BOW, DIALOG_BACK, HUN_336_CAVALORN_Training_Combat_BOW_BACK);
	Info_AddChoice(HUN_336_CAVALORN_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_1,0,0)			, HUN_336_CAVALORN_BOWL1);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_BOW)<26)
	{    
	    Info_AddChoice(HUN_336_CAVALORN_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_5,0,0)			, HUN_336_CAVALORN_BOWL2);
	};	
};
//----------------------------
// BOW Funcs
//============================
func void HUN_336_CAVALORN_BOWL1()
{
   B_GiveSkill(hero, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1,30);
	Info_ClearChoices	(HUN_336_CAVALORN_Training_Combat_BOW);    
	
   if(Npc_GetTalentValue(other, NPC_TALENT_BOW)==30)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
   
	Info_AddChoice(HUN_336_CAVALORN_Training_Combat_BOW, DIALOG_BACK, HUN_336_CAVALORN_Training_Combat_BOW_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_BOW)<26)
	{    
	    Info_AddChoice(HUN_336_CAVALORN_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_5,0,0)			, HUN_336_CAVALORN_BOWL2);
	};		
	 
    Info_AddChoice(HUN_336_CAVALORN_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_1,0,0)			, HUN_336_CAVALORN_BOWL1);
};  

func void HUN_336_CAVALORN_BOWL2()
{
   B_GiveSkill(hero, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_5,30);
	HUN_336_CAVALORN_Training_Combat_BOW_Info();    
};  

func void HUN_336_CAVALORN_Training_Combat_BOW_BACK()
{
	Info_ClearChoices	(HUN_336_CAVALORN_Training_Combat_BOW);
};

INSTANCE Cav_Training_DEX (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	condition		= Cav_Training_DEX_Condition;
	information		= Cav_Training_DEX_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_dexterity; 
};

FUNC INT Cav_Training_DEX_Condition()
{		
	if	(Npc_KnowsInfo(hero, DIA_Cavalorn_CanYouTeachMe))
	{
		return TRUE;
	};
};

func void Cav_Training_DEX_Info ()
{
	Info_ClearChoices	(Cav_Training_DEX);
	Info_AddChoice(Cav_Training_DEX, DIALOG_BACK, Cav_Training_DEX_BACK);
	if	(hero.LP >= 1)
	{ 
	    Info_AddChoice(Cav_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, Cav_Dexterity1);
	};	
	if	(hero.LP >= 5)
	{
		Info_AddChoice(Cav_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, Cav_Dexterity5);
	};
};

func void Cav_Dexterity1()
{
   B_BuyAttributePoints(hero,self, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY,60);
    
   Info_ClearChoices	(Cav_Training_DEX);
	Info_AddChoice(Cav_Training_DEX, DIALOG_BACK, Cav_Training_DEX_BACK);
	if	(hero.LP >= 5)
	{
		Info_AddChoice(Cav_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, Cav_Dexterity5);
	};   
	if	(hero.LP >= 1)
	{ 
	   Info_AddChoice(Cav_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, Cav_Dexterity1);
	};		 
}; 

func void Cav_Dexterity5()
{
   B_BuyAttributePoints(hero,self, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY,60);
    
   Info_ClearChoices	(Cav_Training_DEX);
	Info_AddChoice(Cav_Training_DEX, DIALOG_BACK, Cav_Training_DEX_BACK);
    
 	if	(hero.LP >= 1)
	{ 
	   Info_AddChoice(Cav_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, Cav_Dexterity1);
	};	
	if	(hero.LP >= 5)
	{
		Info_AddChoice(Cav_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, Cav_Dexterity5);
	};   
};
func void Cav_Training_DEX_BACK()
{
	Info_ClearChoices	(Cav_Training_DEX);
};

// ************************************************************
// 			  		Aidan
// ************************************************************

//#####################################################################
//##
//##
//##					TALENT: SMITH
//##
//##
//#####################################################################
INSTANCE HUN_859_Aidan_Training_Smith (C_INFO)
{
	npc				= HUN_859_Aidan;
	condition		= HUN_859_Aidan_Training_Smith_Condition;
	information		= HUN_859_Aidan_Training_Smith_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= name_learning_smith; 
};

FUNC INT HUN_859_Aidan_Training_Smith_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Aidan_CanYouTeachMe))
	{
		return 1;
	};
};

func void HUN_859_Aidan_Training_Smith_Info()
{
	Info_ClearChoices	(HUN_859_Aidan_Training_Smith);
	Info_AddChoice(HUN_859_Aidan_Training_Smith, DIALOG_BACK, HUN_859_Aidan_Training_Smith_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_SMITH);
	
   Info_AddChoice(HUN_859_Aidan_Training_Smith, B_BuildLearnString(NAME_LearnSmith_1,1,0,ATR_STRENGTH,talval+1,ATR_DEXTERITY,Math_Round((talval+1)/2))		, HUN_859_Aidan_Smith1);
	Info_AddChoice(HUN_859_Aidan_Training_Smith, B_BuildLearnString(NAME_LearnSmith_5,5,0,ATR_STRENGTH,talval+5,ATR_DEXTERITY,Math_Round((talval+5)/2))		, HUN_859_Aidan_Smith5);
};
 
func void HUN_859_Aidan_Smith1()
{
   B_GiveSkill(hero, NPC_TALENT_SMITH, 1, 1, 50);
	Info_ClearChoices	(HUN_859_Aidan_Training_Smith);
	Info_AddChoice(HUN_859_Aidan_Training_Smith, DIALOG_BACK, HUN_859_Aidan_Training_Smith_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_SMITH);
	Info_AddChoice(HUN_859_Aidan_Training_Smith, B_BuildLearnString(NAME_LearnSmith_5,5,0,ATR_STRENGTH,talval+5,ATR_DEXTERITY,Math_Round((talval+5)/2))		, HUN_859_Aidan_Smith5);
	Info_AddChoice(HUN_859_Aidan_Training_Smith, B_BuildLearnString(NAME_LearnSmith_1,1,0,ATR_STRENGTH,talval+1,ATR_DEXTERITY,Math_Round((talval+1)/2))		, HUN_859_Aidan_Smith1);
}; 

func void HUN_859_Aidan_Smith5()
{
   B_GiveSkill(hero, NPC_TALENT_SMITH, 5, 5, 50);
    
   HUN_859_Aidan_Training_Smith_Info();
};

func void HUN_859_Aidan_Training_Smith_BACK()
{
	Info_ClearChoices	(HUN_859_Aidan_Training_Smith);
};

// ************************************************************
// 			  		Vam
// ************************************************************

//#####################################################################
//##
//##
//##					ATTRIBUTE: Stärke
//##
//##
//#####################################################################
INSTANCE RBL_2613_Vam_Training_STR (C_INFO)
{
	npc				= RBL_2613_Vam;
	condition		= RBL_2613_Vam_Training_STR_Condition;
	information		= RBL_2613_Vam_Training_STR_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= Name_learning_strength; 
};

FUNC INT RBL_2613_Vam_Training_STR_Condition()
{		
	if (Npc_KnowsInfo(hero, RBL_2613_Vam_Ok))
	{
		return TRUE;
	};
};

func void RBL_2613_Vam_Training_STR_Info()
{
	Info_ClearChoices	(RBL_2613_Vam_Training_STR);
	
	Info_AddChoice(RBL_2613_Vam_Training_STR, DIALOG_BACK, RBL_2613_Vam_Training_STR_BACK);    
	Info_AddChoice(RBL_2613_Vam_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)		, RBL_2613_Vam_Strength1);
	Info_AddChoice(RBL_2613_Vam_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)	 	, RBL_2613_Vam_Strength5);
};

func void RBL_2613_Vam_Strength1()
{
	B_BuyAttributePoints	(hero,self, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH,120);
	Info_ClearChoices	(RBL_2613_Vam_Training_STR);    
	Info_AddChoice(RBL_2613_Vam_Training_STR, DIALOG_BACK, RBL_2613_Vam_Training_STR_BACK);    
	Info_AddChoice(RBL_2613_Vam_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)	 	, RBL_2613_Vam_Strength5);
	Info_AddChoice(RBL_2613_Vam_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)		, RBL_2613_Vam_Strength1);
};

func void RBL_2613_Vam_Strength5()
{
	B_BuyAttributePoints(hero,self, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH,120);
    
	Info_ClearChoices	(RBL_2613_Vam_Training_STR);
 	
	Info_AddChoice(RBL_2613_Vam_Training_STR, DIALOG_BACK, RBL_2613_Vam_Training_STR_BACK);    
	Info_AddChoice(RBL_2613_Vam_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)		, RBL_2613_Vam_Strength1);
	Info_AddChoice(RBL_2613_Vam_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)	 	, RBL_2613_Vam_Strength5);
};

func void RBL_2613_Vam_Training_STR_BACK()
{
	Info_ClearChoices	(RBL_2613_Vam_Training_STR);
};

//#####################################################################
//##
//##
//##					TALENTE: PickLock
//##
//##
//#####################################################################
INSTANCE RBL_2613_Vam_Training_PickLock (C_INFO)
{
	npc				= RBL_2613_Vam;
	condition		= RBL_2613_Vam_Training_PickLock_Condition;
	information		= RBL_2613_Vam_Training_PickLock_Info;
	important		= 0;
	permanent		= 1;
	nr				= 899;
	description		= name_learning_picklock; 
};

FUNC INT RBL_2613_Vam_Training_PickLock_Condition()
{		
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PickLock) < 1)
	&& (Npc_KnowsInfo(hero, RBL_2613_Vam_Ok))
	{
		return TRUE;
	};
};

func void RBL_2613_Vam_Training_PickLock_Info()
{
	Info_ClearChoices	(RBL_2613_Vam_Training_PickLock);
	Info_AddChoice(RBL_2613_Vam_Training_PickLock, DIALOG_BACK, RBL_2613_Vam_Training_PickLock_BACK);
		
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{    
	    Info_AddChoice(RBL_2613_Vam_Training_PickLock, B_BuildLearnString(NAME_LearnPicklock_1,		LPCOST_TALENT_PICKLOCK_1,	0,0,0,0,0),		RBL_2613_Vam_Picklock1);
	};
};

func void RBL_2613_Vam_Picklock1()
{
    B_GiveSkill(hero, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1,100);
	RBL_2613_Vam_Training_PickLock_Info();
};

func void RBL_2613_Vam_Training_PickLock_BACK()
{
	Info_ClearChoices	(RBL_2613_Vam_Training_PickLock);
};  

// ************************************************************
// 			  		Mordrag
// ************************************************************
//#####################################################################
//##
//##
//##					TALENTE: Kampf BOW
//##
//##
//#####################################################################
/*
Temp Disabled
TODO


INSTANCE RBL_826_Mordrag_Training_Combat_BOW (C_INFO)
{
	npc				= RBL_826_Mordrag;
	condition		= RBL_826_Mordrag_Training_Combat_BOW_Condition;
	information		= RBL_826_Mordrag_Training_Combat_BOW_Info;
	important		= 0;
	permanent		= 1;
	description		= Name_learning_bow; 
};

FUNC INT RBL_826_Mordrag_Training_Combat_BOW_Condition()
{		
		return TRUE;
};

func void RBL_826_Mordrag_Training_Combat_BOW_Info()
{
	Info_ClearChoices	(RBL_826_Mordrag_Training_Combat_BOW);
		if(	Npc_GetTalentValue(other, NPC_TALENT_BOW)==100)
		{
			B_Say (self, other, "$NoLearnOverMax");
			return;
		};	
	Info_AddChoice(RBL_826_Mordrag_Training_Combat_BOW, DIALOG_BACK, RBL_826_Mordrag_Training_Combat_BOW_BACK);
	    Info_AddChoice(RBL_826_Mordrag_Training_Combat_BOW, B_BuildLearnString(NAME_LearnCrossbow_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_1,0,0)			, RBL_826_Mordrag_BOWL1);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_BOW)<96)
	{    
	    Info_AddChoice(RBL_826_Mordrag_Training_Combat_BOW, B_BuildLearnString(NAME_LearnCrossbow_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_5,0,0)			, RBL_826_Mordrag_BOWL2);
	};	
};
//----------------------------
// BOW Funcs
//============================
func void RBL_826_Mordrag_BOWL1()
{
    B_GiveSkill(hero, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1,30);
	Info_ClearChoices	(RBL_826_Mordrag_Training_Combat_BOW);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_BOW)==100)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(RBL_826_Mordrag_Training_Combat_BOW, DIALOG_BACK, RBL_826_Mordrag_Training_Combat_BOW_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_BOW)<96)
	{    
	    Info_AddChoice(RBL_826_Mordrag_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_5,0,0)			, RBL_826_Mordrag_BOWL2);
	};		
	    Info_AddChoice(RBL_826_Mordrag_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_1,0,0)			, RBL_826_Mordrag_BOWL1);
};  

func void RBL_826_Mordrag_BOWL2()
{
    B_GiveSkill(hero, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_5,30);
	RBL_826_Mordrag_Training_Combat_BOW_Info();    
};  

func void RBL_826_Mordrag_Training_Combat_BOW_BACK()
{
	Info_ClearChoices	(RBL_826_Mordrag_Training_Combat_BOW);
};


*/
// ************************************************************
// 			  		R¹czka
// ************************************************************

//#####################################################################
//##
//##
//##					TALENTE: PickPocket
//##
//##
//#####################################################################
INSTANCE RBL_331_Fingers_Training_PickPocket (C_INFO)
{
	npc				= RBL_331_Fingers;
	condition		= RBL_331_Fingers_Training_PickPocket_Condition;
	information		= RBL_331_Fingers_Training_PickPocket_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= name_learning_pickpocket; 
};

FUNC INT RBL_331_Fingers_Training_PickPocket_Condition()
{		
	if	((Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) < 1) && (Npc_KnowsInfo (hero, DIA_Fingers_Lehrer)))
	{
		return TRUE;
	};
};

func void RBL_331_Fingers_Training_PickPocket_Info()
{
	Info_ClearChoices	(RBL_331_Fingers_Training_PickPocket);
	Info_AddChoice(RBL_331_Fingers_Training_PickPocket, DIALOG_BACK, RBL_331_Fingers_Training_PickPocket_BACK);
		
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{    
	   Info_AddChoice(RBL_331_Fingers_Training_PickPocket,	B_BuildLearnString(NAME_LearnPickpocket_1,	LPCOST_TALENT_PICKPOCKET_1,	0,0,0,0,0),	RBL_331_Fingers_Pickpocket1);
	};
};	

func void RBL_331_Fingers_Pickpocket1()
{
   B_GiveSkill	(hero, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1,100);
   
	AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
	AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Poka¿ê Ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
	AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie, jeœli w pobli¿u ofiary nie ma osób trzecich.
	AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
      
	RBL_331_Fingers_Training_PickPocket_Info();
}; 

func void RBL_331_Fingers_Training_PickPocket_BACK()
{
	Info_ClearChoices	(RBL_331_Fingers_Training_PickPocket);
};   
// ************************************************************
// 			  		Quentin
// ************************************************************

//#####################################################################
//##
//##
//##					TALENTE: Kampf 1H
//##
//##
//#####################################################################
INSTANCE HUN_858_Quentin_Training_Combat_1H (C_INFO)
{
	npc				= HUN_858_Quentin;
	condition		= HUN_858_Quentin_Training_Combat_1H_Condition;
	information		= HUN_858_Quentin_Training_Combat_1H_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= name_learning_combat_1h; 
};

FUNC INT HUN_858_Quentin_Training_Combat_1H_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Quentin_CanYouTeachMe))
	{
		return 1;
	};
};

func void HUN_858_Quentin_Training_Combat_1H_Info()
{
	Info_ClearChoices	(HUN_858_Quentin_Training_Combat_1H);
		
   if(Npc_GetTalentValue(other, NPC_TALENT_1H)==60)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
   
	Info_AddChoice(HUN_858_Quentin_Training_Combat_1H, DIALOG_BACK, HUN_858_Quentin_Training_Combat_1H_BACK);
	Info_AddChoice(HUN_858_Quentin_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_1,	LPCOST_TALENT_1H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1)/2)), HUN_858_Quentin_1hL1);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_1H)<56)
	{    
	   Info_AddChoice(HUN_858_Quentin_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_5, LPCOST_TALENT_1H_5, 0, ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5)/2)), HUN_858_Quentin_1hL2);
	};	
};
//----------------------------
// 1H Funcs
//============================
func void HUN_858_Quentin_1hL1()
{
	B_GiveSkill(hero, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1,60);
	Info_ClearChoices	(HUN_858_Quentin_Training_Combat_1H);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_1H)==60)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(HUN_858_Quentin_Training_Combat_1H, DIALOG_BACK, HUN_858_Quentin_Training_Combat_1H_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_1H)<56)
	{    
	   Info_AddChoice(HUN_858_Quentin_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_5, LPCOST_TALENT_1H_5, 0, ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5)/2))			, HUN_858_Quentin_1hL2);
	};	
	
	Info_AddChoice(HUN_858_Quentin_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1, 0, ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1)/2))			, HUN_858_Quentin_1hL1);
};  

func void HUN_858_Quentin_1hL2()
{
   B_GiveSkill(hero, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_5,60);
	HUN_858_Quentin_Training_Combat_1H_Info();    
};  

func void HUN_858_Quentin_Training_Combat_1H_BACK()
{
	Info_ClearChoices	(HUN_858_Quentin_Training_Combat_1H);
};


//#####################################################################
//##
//##
//##					TALENTE: Kampf 2H
//##
//##
//#####################################################################
INSTANCE HUN_858_Quentin_Training_Combat_2H (C_INFO)
{
	npc				= HUN_858_Quentin;
	condition		= HUN_858_Quentin_Training_Combat_2H_Condition;
	information		= HUN_858_Quentin_Training_Combat_2H_Info;
	important		= 0;
	permanent		= 1;
	nr				= 901;
	description		= name_learning_combat_2h; 
};

FUNC INT HUN_858_Quentin_Training_Combat_2H_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Quentin_CanYouTeachMe))
	{
		return 1;
	};
};

func void HUN_858_Quentin_Training_Combat_2H_Info()
{
	Info_ClearChoices	(HUN_858_Quentin_Training_Combat_2H);
		
   if(Npc_GetTalentValue(other, NPC_TALENT_2H)==100)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
   
	Info_AddChoice(HUN_858_Quentin_Training_Combat_2H, DIALOG_BACK, HUN_858_Quentin_Training_Combat_2H_BACK);
	Info_AddChoice(HUN_858_Quentin_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_1,			LPCOST_TALENT_2H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1)/2))			, HUN_858_Quentin_2HL1);
	if	(Npc_GetTalentValue(other, NPC_TALENT_2H)<96)
	{    
	    Info_AddChoice(HUN_858_Quentin_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_5,			LPCOST_TALENT_2H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5)/2))			, HUN_858_Quentin_2HL2);
	};		
};
//----------------------------
// 2H Funcs
//============================
func void HUN_858_Quentin_2HL1()
{
	B_GiveSkill(hero, NPC_TALENT_2H, 1, LPCOST_TALENT_2H_1,50);
	Info_ClearChoices	(HUN_858_Quentin_Training_Combat_2H);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_2H)==100)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(HUN_858_Quentin_Training_Combat_2H, DIALOG_BACK, HUN_858_Quentin_Training_Combat_2H_BACK);
	if	(Npc_GetTalentValue(other, NPC_TALENT_2H)<96)
	{    
	    Info_AddChoice(HUN_858_Quentin_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_5,			LPCOST_TALENT_2H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5)/2))			, HUN_858_Quentin_2HL2);
	};		
	    Info_AddChoice(HUN_858_Quentin_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_1,			LPCOST_TALENT_2H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1)/2))			, HUN_858_Quentin_2HL1);
};  

func void HUN_858_Quentin_2HL2()
{
	B_GiveSkill(hero, NPC_TALENT_2H, 2, LPCOST_TALENT_2H_5,50);
	HUN_858_Quentin_Training_Combat_2H_Info();    
};  

func void HUN_858_Quentin_Training_Combat_2H_BACK()
{
	Info_ClearChoices	(HUN_858_Quentin_Training_Combat_2H);
};


//#####################################################################
//##
//##
//##					ATTRIBUTE: Geschick
//##
//##
//#####################################################################
INSTANCE HUN_858_Quentin_Training_DEX (C_INFO)
{
	npc				= HUN_858_Quentin;
	condition		= HUN_858_Quentin_Training_DEX_Condition;
	information		= HUN_858_Quentin_Training_DEX_Info;
	important		= 0;
	permanent		= 1;
	nr				= 899;
	description		= name_learning_dexterity; 
};

FUNC INT HUN_858_Quentin_Training_DEX_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Quentin_CanYouTeachMe))
	{
		return 1;
	};
};

func void HUN_858_Quentin_Training_DEX_Info ()
{
	Info_ClearChoices	(HUN_858_Quentin_Training_DEX);
	Info_AddChoice(HUN_858_Quentin_Training_DEX, DIALOG_BACK, HUN_858_Quentin_Training_DEX_BACK);
	Info_AddChoice(HUN_858_Quentin_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, HUN_858_Quentin_Dexterity1);
	Info_AddChoice(HUN_858_Quentin_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, HUN_858_Quentin_Dexterity5);
};

func void HUN_858_Quentin_Dexterity1()
{
   B_BuyAttributePoints(hero,self, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY,60);
    
   Info_ClearChoices	(HUN_858_Quentin_Training_DEX);
	Info_AddChoice(HUN_858_Quentin_Training_DEX, DIALOG_BACK, HUN_858_Quentin_Training_DEX_BACK);
	Info_AddChoice(HUN_858_Quentin_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, HUN_858_Quentin_Dexterity5);
	Info_AddChoice(HUN_858_Quentin_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, HUN_858_Quentin_Dexterity1);
}; 

func void HUN_858_Quentin_Dexterity5()
{
   B_BuyAttributePoints(hero,self, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY,60);
    
   Info_ClearChoices	(HUN_858_Quentin_Training_DEX);
	Info_AddChoice(HUN_858_Quentin_Training_DEX, DIALOG_BACK, HUN_858_Quentin_Training_DEX_BACK);
    
	Info_AddChoice(HUN_858_Quentin_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, HUN_858_Quentin_Dexterity1);
	Info_AddChoice(HUN_858_Quentin_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, HUN_858_Quentin_Dexterity5);
};

func void HUN_858_Quentin_Training_DEX_BACK()
{
	Info_ClearChoices	(HUN_858_Quentin_Training_DEX);
};
//#####################################################################
//##
//##
//##					TALENTE: LP_REGENERATION
//##
//##
//#####################################################################
INSTANCE HUN_858_Quentin_Training_LP_REGENERATION (C_INFO)
{
	npc				= HUN_858_Quentin;
	condition		= HUN_858_Quentin_Training_LP_REGENERATION_Condition;
	information		= HUN_858_Quentin_Training_LP_REGENERATION_Info;
	important		= 0;
	permanent		= 1;
	nr				= 903;
	description		= name_learning_regeneration_HP; 
};

FUNC INT HUN_858_Quentin_Training_LP_REGENERATION_Condition()
{		
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_REGEN_HP) < 1) && (Npc_KnowsInfo(hero, DIA_Quentin_CanYouTeachMe)))
	{
		return TRUE;
	};
};

func void HUN_858_Quentin_Training_LP_REGENERATION_Info()
{
	Info_ClearChoices	(HUN_858_Quentin_Training_LP_REGENERATION);	
	Info_AddChoice(HUN_858_Quentin_Training_LP_REGENERATION, DIALOG_BACK , HUN_858_Quentin_Training_LP_REGENERATION_BACK);    
	if (Npc_GetTalentSkill(hero, NPC_TALENT_REGEN_HP) == 0)
	{ 
	   Info_AddChoice(HUN_858_Quentin_Training_LP_REGENERATION, B_BuildLearnString(NAME_LearnRegenHP_1,10,0,0,0,0,0), HUN_858_Quentin_Training_LP_REGENERATION1);
	};  
};	

func void HUN_858_Quentin_Training_LP_REGENERATION_BACK()
{
	Info_ClearChoices	(HUN_858_Quentin_Training_LP_REGENERATION);
};

func void HUN_858_Quentin_Training_LP_REGENERATION1()
{
   B_GiveSkill(hero, NPC_TALENT_REGEN_HP, 1, 10, 100);
	Info_ClearChoices	(HUN_858_Quentin_Training_LP_REGENERATION);
};
 
// ************************************************************
// 			  		Taran
// ************************************************************

//#####################################################################
//##
//##
//##					ATTRIBUTE: Mana
//##
//##
//#####################################################################
INSTANCE RBL_1331_BaalTaran_Training_Mana (C_INFO)
{
	npc				= RBL_1331_BaalTaran;
	condition		= RBL_1331_BaalTaran_Training_Mana_Condition;
	information		= RBL_1331_BaalTaran_Training_Mana_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= name_learning_mana; 
};

FUNC INT RBL_1331_BaalTaran_Training_Mana_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_CanYouTeachMe))
	{
		return 1;
	};
};

func void RBL_1331_BaalTaran_Training_Mana_Info()
{
	Info_ClearChoices	(RBL_1331_BaalTaran_Training_Mana);
	Info_AddChoice(RBL_1331_BaalTaran_Training_Mana, DIALOG_BACK, RBL_1331_BaalTaran_Training_Mana_BACK);
	    Info_AddChoice(RBL_1331_BaalTaran_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, RBL_1331_BaalTaran_Mana1);
		Info_AddChoice(RBL_1331_BaalTaran_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, RBL_1331_BaalTaran_Mana5);
};
 
func void RBL_1331_BaalTaran_Mana1()
{
	B_BuyAttributePoints(hero,self, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA,50);	
	hero.attribute[ATR_MANA]+=LPCOST_ATTRIBUTE_MANA;	    
    
	Info_ClearChoices	(RBL_1331_BaalTaran_Training_Mana);
	Info_AddChoice(RBL_1331_BaalTaran_Training_Mana, DIALOG_BACK, RBL_1331_BaalTaran_Training_Mana_BACK);
	Info_AddChoice(RBL_1331_BaalTaran_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, RBL_1331_BaalTaran_Mana5);
	Info_AddChoice(RBL_1331_BaalTaran_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, RBL_1331_BaalTaran_Mana1);
}; 

func void RBL_1331_BaalTaran_Mana5()
{
	B_BuyAttributePoints(hero,self, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA,50);	
	hero.attribute[ATR_MANA]+=5*LPCOST_ATTRIBUTE_MANA;	

	Info_ClearChoices	(RBL_1331_BaalTaran_Training_Mana);
	Info_AddChoice(RBL_1331_BaalTaran_Training_Mana, DIALOG_BACK, RBL_1331_BaalTaran_Training_Mana_BACK);
	Info_AddChoice(RBL_1331_BaalTaran_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, RBL_1331_BaalTaran_Mana1);
	Info_AddChoice(RBL_1331_BaalTaran_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, RBL_1331_BaalTaran_Mana5);
};
func void RBL_1331_BaalTaran_Training_Mana_BACK()
{
	Info_ClearChoices	(RBL_1331_BaalTaran_Training_Mana);
};
 
// ************************************************************
// 			  		Milten
// ************************************************************

//#####################################################################
//##
//##
//##					TALENTE: QUICK LERNING
//##
//##
//#####################################################################
INSTANCE PC_MAGE_Training_QLERNING (C_INFO)
{
	npc				= PC_MAGE;
	condition		= PC_MAGE_Training_QLERNING_Condition;
	information		= PC_MAGE_Training_QLERNING_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= name_learning_quick_learning; 
};

FUNC INT PC_MAGE_Training_QLERNING_Condition()
{		
	if (TALENT_QUICK_LERNING < 2) && (Npc_KnowsInfo(hero, DIA_Milten_CanYouTeachMe))
	{
		return TRUE;
	};
};

func void PC_MAGE_Training_QLERNING_Info()
{
	Info_ClearChoices	(PC_MAGE_Training_QLERNING);
	Info_AddChoice(PC_MAGE_Training_QLERNING, DIALOG_BACK, PC_MAGE_Training_QLERNING_BACK);
		
	if	(TALENT_QUICK_LERNING == 0) 
	{    
	    Info_AddChoice(PC_MAGE_Training_QLERNING, B_BuildLearnString(NAME_LearnQuickLerning_1, LPCOST_TALENT_QLERNING_1,	0,0,0,0,0),	PC_MAGE_Training_QLERNING1);
	};
   if	(TALENT_QUICK_LERNING == 1) 
	{    
	    Info_AddChoice(PC_MAGE_Training_QLERNING, B_BuildLearnString(NAME_LearnQuickLerning_2, LPCOST_TALENT_QLERNING_2,	0,0,0,0,0),	PC_MAGE_Training_QLERNING2);
	};
};

func void PC_MAGE_Training_QLERNING1()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_QUICK_LERNING, 1, LPCOST_TALENT_QLERNING_1,100);
	PC_MAGE_Training_QLERNING_Info();
};

func void PC_MAGE_Training_QLERNING2()
{
    Hack_B_GiveSkill(hero, HACK_NPC_TALENT_QUICK_LERNING, 2, LPCOST_TALENT_QLERNING_2,100);
	PC_MAGE_Training_QLERNING_Info();
}; 

func void PC_MAGE_Training_QLERNING_BACK()
{
	Info_ClearChoices	(PC_MAGE_Training_QLERNING);
};  

INSTANCE Milten_Training_ALCHEMY (C_INFO)
{
	npc				= PC_MAGE;
	condition		= Milten_Training_ALCHEMY_Condition;
	information		= Milten_Training_ALCHEMY_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_alchemy; 
   nr				= 900;
};

FUNC INT Milten_Training_ALCHEMY_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Milten_CanYouTeachMe))
	{
		return TRUE;
	};
};

func void Milten_Training_ALCHEMY_Info()
{
	Info_ClearChoices	(Milten_Training_ALCHEMY);
	Info_AddChoice(Milten_Training_ALCHEMY, DIALOG_BACK, Milten_Training_ALCHEMY_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_ALCHEMY);
	Info_AddChoice(Milten_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_1,1,0,ATR_MANA_MAX,talval+1,0,0)		, Milten_ALCHEMY1);
	Info_AddChoice(Milten_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_5,5,0,ATR_MANA_MAX,talval+5,0,0)		, Milten_ALCHEMY5);
};
 
func void Milten_ALCHEMY1()
{
   B_GiveSkill(hero, NPC_TALENT_ALCHEMY, 1, 1, 100);
	Info_ClearChoices	(Milten_Training_ALCHEMY);
	Info_AddChoice(Milten_Training_ALCHEMY, DIALOG_BACK, Milten_Training_ALCHEMY_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_ALCHEMY);
	Info_AddChoice(Milten_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_5,5,0,ATR_MANA_MAX,talval+5,0,0)		, Milten_ALCHEMY5);
	Info_AddChoice(Milten_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_1,1,0,ATR_MANA_MAX,talval+1,0,0)		, Milten_ALCHEMY1);
}; 

func void Milten_ALCHEMY5()
{
   B_GiveSkill(hero, NPC_TALENT_ALCHEMY, 5, 5, 100);
    
	Milten_Training_ALCHEMY_Info();
};

func void Milten_Training_ALCHEMY_BACK()
{
	Info_ClearChoices	(Milten_Training_ALCHEMY);
};

//#####################################################################
//##
//##
//##					ATTRIBUTE: Mana
//##
//##
//#####################################################################
INSTANCE Milten_Training_Mana (C_INFO)
{
	npc				= PC_MAGE;
	condition		= Milten_Training_Mana_Condition;
	information		= Milten_Training_Mana_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_mana; 
   nr				= 900;
};

FUNC INT Milten_Training_Mana_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Milten_CanYouTeachMe))
	{
		return TRUE;
	};
};

func void Milten_Training_Mana_Info()
{
	Info_ClearChoices	(Milten_Training_Mana);
	Info_AddChoice(Milten_Training_Mana, DIALOG_BACK, Milten_Training_Mana_BACK);
	if	(hero.LP >= 1)
	{ 
	   Info_AddChoice(Milten_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, Milten_Mana1);
	};	
	if	(hero.LP >= 5)
	{
		Info_AddChoice(Milten_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, Milten_Mana5);
	};
};
 
func void Milten_Mana1()
{
   B_BuyAttributePoints(hero,self, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA,300);	
   hero.attribute[ATR_MANA]+=LPCOST_ATTRIBUTE_MANA;	    
    
   Info_ClearChoices	(Milten_Training_Mana);
	Info_AddChoice(Milten_Training_Mana, DIALOG_BACK, Milten_Training_Mana_BACK);
	if	(hero.LP >= 5)
	{
		Info_AddChoice(Milten_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, Milten_Mana5);
	};
	if	(hero.LP >= 1)
	{ 
	   Info_AddChoice(Milten_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, Milten_Mana1);
	};    
}; 

func void Milten_Mana5()
{
   B_BuyAttributePoints(hero,self, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA,300);	
   hero.attribute[ATR_MANA]+=5*LPCOST_ATTRIBUTE_MANA;	

   Info_ClearChoices	(Milten_Training_Mana);
	Info_AddChoice(Milten_Training_Mana, DIALOG_BACK, Milten_Training_Mana_BACK);
	if	(hero.LP >= 1)
	{ 
	    Info_AddChoice(Milten_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, Milten_Mana1);
	};	
	if	(hero.LP >= 5)
	{
		Info_AddChoice(Milten_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, Milten_Mana5);
	};  
};

func void Milten_Training_Mana_BACK()
{
	Info_ClearChoices	(Milten_Training_Mana);
};

INSTANCE Milten_Training_Magic (C_INFO)
{
	npc				= PC_MAGE;
	condition		= Milten_Training_Magic_Condition;
	information		= Milten_Training_Magic_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_magic; 
   nr				= 900;
};

FUNC INT Milten_Training_Magic_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Milten_CanYouTeachMe))
	{
		return TRUE;
	};
};

func void Milten_Training_Magic_Info()
{
	Info_ClearChoices	(Milten_Training_Magic);
	Info_AddChoice(Milten_Training_Magic, DIALOG_BACK, Milten_Training_Magic_BACK);

	// Rozumiem ze Milten ucyz tylko do 5 kregu?
	// 11:16 PM 10/15/2012 orc
	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 0)&&(Kapitel>=1) 
	{
		Info_AddChoice(Milten_Training_Magic, B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,	0,ATR_MANA_MAX,20,0,0), Milten_Magic1);
	}
	else if (Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 1)&&(Kapitel>=2)  
	{
		Info_AddChoice(Milten_Training_Magic, B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,	0,ATR_MANA_MAX,40,0,0), Milten_Magic2);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 2)&&(Kapitel>=3)  
	{
		Info_AddChoice(Milten_Training_Magic, B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,	0,ATR_MANA_MAX,60,0,0), Milten_Magic3);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE)== 3)&&(Kapitel>=4)  
	{
		Info_AddChoice(Milten_Training_Magic, B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,	0,ATR_MANA_MAX,80,0,0), Milten_Magic4);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 4)&&(Kapitel>=5)  
	{
		Info_AddChoice(Milten_Training_Magic, B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,	0,ATR_MANA_MAX,100,0,0), Milten_Magic5);
	};
};

func void Milten_Magic1()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 1, LPCOST_TALENT_MAGE_1,100);
	Milten_Training_Magic_Info();
};  

func void Milten_Magic2()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 2, LPCOST_TALENT_MAGE_2,100);
	Milten_Training_Magic_Info();
};  

func void Milten_Magic3()
{   
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 3, LPCOST_TALENT_MAGE_3,100);
 	Milten_Training_Magic_Info();
}; 

func void Milten_Magic4()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 4, LPCOST_TALENT_MAGE_4,100);
 	Milten_Training_Magic_Info();
};  

func void Milten_Magic5()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 5, LPCOST_TALENT_MAGE_5,100);
 	Milten_Training_Magic_Info(); 
}; 

func void Milten_Training_Magic_BACK()
{
	Info_ClearChoices(Milten_Training_Magic);
};

// ************************************************************
// 			  		Parvez
// ************************************************************

//#####################################################################
//##
//##
//##					TALENT: ALCHEMY
//##
//##
//#####################################################################
INSTANCE MAG_1330_BaalParvez_Training_ALCHEMY (C_INFO)
{
	npc				= MAG_1330_BaalParvez;
	condition		= MAG_1330_BaalParvez_Training_ALCHEMY_Condition;
	information		= MAG_1330_BaalParvez_Training_ALCHEMY_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= name_learning_alchemy; 
};

FUNC INT MAG_1330_BaalParvez_Training_ALCHEMY_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Parvez_CanYouTeachMe))
	{
		return TRUE;
	};
};

func void MAG_1330_BaalParvez_Training_ALCHEMY_Info()
{
	Info_ClearChoices	(MAG_1330_BaalParvez_Training_ALCHEMY);
	Info_AddChoice(MAG_1330_BaalParvez_Training_ALCHEMY, DIALOG_BACK, MAG_1330_BaalParvez_Training_ALCHEMY_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_ALCHEMY);
	Info_AddChoice(MAG_1330_BaalParvez_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_1,1,0,ATR_MANA_MAX,talval+1,0,0)		, MAG_1330_BaalParvez_ALCHEMY1);
	Info_AddChoice(MAG_1330_BaalParvez_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_5,5,0,ATR_MANA_MAX,talval+5,0,0)		, MAG_1330_BaalParvez_ALCHEMY5);
};
 
func void MAG_1330_BaalParvez_ALCHEMY1()
{
   B_GiveSkill(hero, NPC_TALENT_ALCHEMY, 1, 1, 50);
	Info_ClearChoices	(MAG_1330_BaalParvez_Training_ALCHEMY);
	Info_AddChoice(MAG_1330_BaalParvez_Training_ALCHEMY, DIALOG_BACK, MAG_1330_BaalParvez_Training_ALCHEMY_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_ALCHEMY);
	Info_AddChoice(MAG_1330_BaalParvez_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_5,5,0,ATR_MANA_MAX,talval+5,0,0)		, MAG_1330_BaalParvez_ALCHEMY5);
	Info_AddChoice(MAG_1330_BaalParvez_Training_ALCHEMY, B_BuildLearnString(NAME_LearnALCHEMY_1,1,0,ATR_MANA_MAX,talval+1,0,0)		, MAG_1330_BaalParvez_ALCHEMY1);
}; 

func void MAG_1330_BaalParvez_ALCHEMY5()
{
   B_GiveSkill(hero, NPC_TALENT_ALCHEMY, 5, 5, 50);
    
	MAG_1330_BaalParvez_Training_ALCHEMY_Info();
};

func void MAG_1330_BaalParvez_Training_ALCHEMY_BACK()
{
	Info_ClearChoices	(MAG_1330_BaalParvez_Training_ALCHEMY);
};
// ************************************************************
// 			  		Leren
// ************************************************************

//#####################################################################
//##
//##
//##					ATTRIBUTE: Mana
//##
//##
//#####################################################################
INSTANCE MAG_1604_Leren_Training_Mana (C_INFO)
{
	npc				= MAG_1604_Leren;
	condition		= MAG_1604_Leren_Training_Mana_Condition;
	information		= MAG_1604_Leren_Training_Mana_Info;
	important		= 0;
	permanent		= 1;
	nr				= 901;
	description		= name_learning_mana; 
};

FUNC INT MAG_1604_Leren_Training_Mana_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Leren_CanYouTeachMe))
	{
		return 1;
	};
};

func void MAG_1604_Leren_Training_Mana_Info()
{
	Info_ClearChoices	(MAG_1604_Leren_Training_Mana);
	Info_AddChoice(MAG_1604_Leren_Training_Mana, DIALOG_BACK, MAG_1604_Leren_Training_Mana_BACK);
	Info_AddChoice(MAG_1604_Leren_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, MAG_1604_Leren_Mana1);
   Info_AddChoice(MAG_1604_Leren_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, MAG_1604_Leren_Mana5);
};
 
func void MAG_1604_Leren_Mana1()
{
   B_BuyAttributePoints(hero,self, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA,200);	
   hero.attribute[ATR_MANA]+=LPCOST_ATTRIBUTE_MANA;	    
    
   Info_ClearChoices	(MAG_1604_Leren_Training_Mana);
	Info_AddChoice(MAG_1604_Leren_Training_Mana, DIALOG_BACK, MAG_1604_Leren_Training_Mana_BACK);
   Info_AddChoice(MAG_1604_Leren_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, MAG_1604_Leren_Mana5);
   Info_AddChoice(MAG_1604_Leren_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, MAG_1604_Leren_Mana1);
}; 

func void MAG_1604_Leren_Mana5()
{
   B_BuyAttributePoints(hero,self, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA,200);	
   hero.attribute[ATR_MANA]+=5*LPCOST_ATTRIBUTE_MANA;	

   Info_ClearChoices	(MAG_1604_Leren_Training_Mana);
	Info_AddChoice(MAG_1604_Leren_Training_Mana, DIALOG_BACK, MAG_1604_Leren_Training_Mana_BACK);
   Info_AddChoice(MAG_1604_Leren_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, MAG_1604_Leren_Mana1);
   Info_AddChoice(MAG_1604_Leren_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0,0,0,0,0)		, MAG_1604_Leren_Mana5);
};
func void MAG_1604_Leren_Training_Mana_BACK()
{
	Info_ClearChoices	(MAG_1604_Leren_Training_Mana);
};

//#####################################################################
//##
//##
//##					TALENTE: Magie
//##
//##
//#####################################################################
INSTANCE MAG_1604_Leren_Training_Magic (C_INFO)
{
	npc				= MAG_1604_Leren;
	condition		= MAG_1604_Leren_Training_Magic_Condition;
	information		= MAG_1604_Leren_Training_Magic_Info;
	important		= 0;
	permanent		= 1;
	nr				= 901;
	description		= name_learning_magic; 
};

FUNC INT MAG_1604_Leren_Training_Magic_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Leren_Eqqupiment))
	{
		return 1;
	};
};

func void MAG_1604_Leren_Training_Magic_Info()
{
	Info_ClearChoices	(MAG_1604_Leren_Training_Magic);
	Info_AddChoice(MAG_1604_Leren_Training_Magic, DIALOG_BACK, MAG_1604_Leren_Training_Magic_BACK);

	// Rozumiem ze Leren ucyz tylko do 5 kregu?
	// 11:16 PM 10/15/2012 orc
	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 0)&&(Kapitel>=1) 
	{
		Info_AddChoice(MAG_1604_Leren_Training_Magic, B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,	0,ATR_MANA_MAX,20,0,0), MAG_1604_Leren_Magic1);
	}
	else if (Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 1)&&(Kapitel>=2)  
	{
		Info_AddChoice(MAG_1604_Leren_Training_Magic, B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,	0,ATR_MANA_MAX,40,0,0), MAG_1604_Leren_Magic2);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 2)&&(Kapitel>=3)  
	{
		Info_AddChoice(MAG_1604_Leren_Training_Magic, B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,	0,ATR_MANA_MAX,60,0,0), MAG_1604_Leren_Magic3);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE)== 3)&&(Kapitel>=4)  
	{
		Info_AddChoice(MAG_1604_Leren_Training_Magic, B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,	0,ATR_MANA_MAX,80,0,0), MAG_1604_Leren_Magic4);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 4)&&(Kapitel>=5)  
	{
		Info_AddChoice(MAG_1604_Leren_Training_Magic, B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,	0,ATR_MANA_MAX,100,0,0), MAG_1604_Leren_Magic5);
	};
};

func void MAG_1604_Leren_Magic1()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 1, LPCOST_TALENT_MAGE_1,100);
	MAG_1604_Leren_Training_Magic_Info();
};  

func void MAG_1604_Leren_Magic2()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 2, LPCOST_TALENT_MAGE_2,100);
	MAG_1604_Leren_Training_Magic_Info();
};  

func void MAG_1604_Leren_Magic3()
{   
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 3, LPCOST_TALENT_MAGE_3,100);
 	MAG_1604_Leren_Training_Magic_Info();
}; 

func void MAG_1604_Leren_Magic4()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 4, LPCOST_TALENT_MAGE_4,100);
 	MAG_1604_Leren_Training_Magic_Info();
};  

func void MAG_1604_Leren_Magic5()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 5, LPCOST_TALENT_MAGE_5,100);
 	MAG_1604_Leren_Training_Magic_Info(); 
}; 

func void MAG_1604_Leren_Training_Magic_BACK()
{
	Info_ClearChoices	(MAG_1604_Leren_Training_Magic);
};

//#####################################################################
//##
//##
//##					TALENTE: MP_REGENERATION
//##
//##
//#####################################################################
INSTANCE MAG_1604_Leren_Training_MP_REGENERATION (C_INFO)
{
	npc				= MAG_1604_Leren;
	condition		= MAG_1604_Leren_Training_MP_REGENERATION_Condition;
	information		= MAG_1604_Leren_Training_MP_REGENERATION_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_regeneration_mana; 
	nr				= 903;
};

FUNC INT MAG_1604_Leren_Training_MP_REGENERATION_Condition()
{		
	if	((Npc_GetTalentSkill(hero, NPC_TALENT_REGEN_MP) != 2) && (Npc_KnowsInfo(hero, DIA_Leren_CanYouTeachMe)))
	{
		return TRUE;
	};
};

func void MAG_1604_Leren_Training_MP_REGENERATION_Info()
{
	Info_ClearChoices	(MAG_1604_Leren_Training_MP_REGENERATION);	
	Info_AddChoice(MAG_1604_Leren_Training_MP_REGENERATION, DIALOG_BACK , MAG_1604_Leren_Training_MP_REGENERATION_BACK);    
 	if	(Npc_GetTalentSkill(hero, NPC_TALENT_REGEN_MP) == 1)
	{
		Info_AddChoice(MAG_1604_Leren_Training_MP_REGENERATION, B_BuildLearnString(NAME_LearnRegenMP_2,20,0,0,0,0,0)		, MAG_1604_Leren_Training_MP_REGENERATION2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_REGEN_MP) == 0)
	{ 
	    Info_AddChoice(MAG_1604_Leren_Training_MP_REGENERATION, B_BuildLearnString(NAME_LearnRegenMP_1,10,0,0,0,0,0)		, MAG_1604_Leren_Training_MP_REGENERATION1);
	};  
};	

func void MAG_1604_Leren_Training_MP_REGENERATION_BACK()
{
	Info_ClearChoices	(MAG_1604_Leren_Training_MP_REGENERATION);
};

func void MAG_1604_Leren_Training_MP_REGENERATION1()
{
   B_GiveSkill(hero, NPC_TALENT_REGEN_MP, 1, 10, 100);
	Info_ClearChoices	(MAG_1604_Leren_Training_MP_REGENERATION);
};

func void MAG_1604_Leren_Training_MP_REGENERATION2()
{
   B_GiveSkill(hero, NPC_TALENT_REGEN_MP, 2, 20, 100);
	Info_ClearChoices	(MAG_1604_Leren_Training_MP_REGENERATION);
};

//#####################################################################
//##
//##
//##					ANIMALTHROPHY
//##
//##
//#####################################################################
INSTANCE HUN_818_Ratford_Training_TROPHY (C_INFO)
{
	npc				= HUN_818_Ratford;
	condition		= HUN_818_Ratford_Training_TROPHY_Condition;
	information		= HUN_818_Ratford_Training_TROPHY_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_animaltrophy; 
	nr				= 900;
};

FUNC INT HUN_818_Ratford_Training_TROPHY_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Ratford_CanYouTeachMe))
	{
		return 1;
	};
};

func void HUN_818_Ratford_Training_TROPHY_Info()
{
	Info_ClearChoices	(HUN_818_Ratford_Training_TROPHY);
	Info_AddChoice(HUN_818_Ratford_Training_TROPHY, DIALOG_BACK, HUN_818_Ratford_Training_TROPHY_BACK);
   
	if(!Knows_GetTeeth)
	{
    Info_AddChoice(HUN_818_Ratford_Training_TROPHY, TEXT_LERN_GetTeeth		, HUN_818_Ratford_TROPHY_TEETH);
	};
	if(!Knows_GetClaws)
	{
    Info_AddChoice(HUN_818_Ratford_Training_TROPHY, TEXT_LERN_GetClaws		, HUN_818_Ratford_TROPHY_CLAWS);
	};	
	if(!Knows_GetFur)
	{
    Info_AddChoice(HUN_818_Ratford_Training_TROPHY, TEXT_LERN_GetFur		, HUN_818_Ratford_TROPHY_FUR);
	};			
};

func void HUN_818_Ratford_Training_TROPHY_BACK()
{
	Info_ClearChoices	(HUN_818_Ratford_Training_TROPHY);
}; 

func void HUN_818_Ratford_TROPHY_TEETH()
{
	if	(hero.LP >= LPCOST_GetTeeth)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetTeeth)
	{
		PrintScreen	("Nowa umiejêtnoœæ: zdobywanie k³ów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ zdobywania k³ów wilków, orkowych psów, zêbaczy, k¹saczy, ogarów i cieniostworów.");	
		hero.lp-=LPCOST_GetTeeth;
	   Knows_GetTeeth=TRUE;
	   B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetTeeth);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetTeeth);
	}
	else if(hero.LP >= LPCOST_GetTeeth)
	{
		AI_Output (self,other,"HUN_818_Ratford_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    
}; 

func void HUN_818_Ratford_TROPHY_CLAWS()
{
	if	(hero.LP >= LPCOST_GetClaws)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetClaws)
	{
		PrintScreen	("Nowa umiejêtnoœæ: zdobywanie pazurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ wyci¹gania pazurów jaszczurów, zêbaczy, topielców, k¹saczy i brzytew.");
		hero.lp-=LPCOST_GetClaws;
		Knows_GetClaws=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetClaws);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetClaws);
	}
	else if(hero.LP >= LPCOST_GetClaws)
	{
		AI_Output (self,other,"HUN_818_Ratford_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    
}; 

func void HUN_818_Ratford_TROPHY_FUR()
{
	if	(hero.LP >= LPCOST_GetFur)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetFur)
	{
		PrintScreen	("Nowa umiejêtnoœæ: œci¹ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ œci¹gania futer z wilków, orkowych psów, cieniostworów i trolli.");
		hero.lp-=LPCOST_GetFur;
		Knows_GetFur=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetFur);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetFur);
	}
	else if(hero.LP >= LPCOST_GetFur)
	{
		AI_Output (self,other,"HUN_818_Ratford_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    
}; 

//#####################################################################
//##
//##
//##					SHERGAR :D
//##
//##
//#####################################################################
INSTANCE Snaf_Training_TROPHY (C_INFO)
{
	npc				= RBL_581_Snaf;
	condition		= Snaf_Training_TROPHY_Condition;
	information		= Snaf_Training_TROPHY_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_animaltrophy; 
   nr				= 900;
};

FUNC INT Snaf_Training_TROPHY_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Snaf_CanYouTeachMe))
	{
		return 1;
	};
};

func void Snaf_Training_TROPHY_Info()
{
	Info_ClearChoices	(Snaf_Training_TROPHY);
	Info_AddChoice(Snaf_Training_TROPHY, DIALOG_BACK, Snaf_Training_TROPHY_BACK);
	
	if(!Knows_GetLiver)
	{
    Info_AddChoice(Snaf_Training_TROPHY, TEXT_LERN_GetLiver		, Snaf_TROPHY_GetLiver);
	};	
	
	if(!Knows_GetWTF)
	{
    Info_AddChoice(Snaf_Training_TROPHY, TEXT_LERN_GetWTF		, Snaf_TROPHY_GetWTF);
	};
	if(!Knows_GetWool)
	{
    Info_AddChoice(Snaf_Training_TROPHY, TEXT_LERN_GetWool		, Snaf_TROPHY_GetWool);
	};								
};
func void Snaf_Training_TROPHY_BACK()
{
	Info_ClearChoices	(Snaf_Training_TROPHY);
}; 

func void Snaf_TROPHY_GetLiver()
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

func void Snaf_TROPHY_GetWTF()
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

func void Snaf_TROPHY_GetWool()
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

INSTANCE Aidan_Training_TROPHY (C_INFO)
{
	npc				= HUN_859_AIDAN;
	condition		= Aidan_Training_TROPHY_Condition;
	information		= Aidan_Training_TROPHY_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_animaltrophy; 
   nr				= 900;
};

FUNC INT Aidan_Training_TROPHY_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Aidan_CanYouTeachMe))
	{
		return 1;
	};
};

func void Aidan_Training_TROPHY_Info()
{
	Info_ClearChoices(Aidan_Training_TROPHY);
	Info_AddChoice(Aidan_Training_TROPHY, DIALOG_BACK, Aidan_Training_TROPHY_BACK);

	if(!Knows_GetHorn)
	{
      Info_AddChoice(Aidan_Training_TROPHY, TEXT_LERN_GetHorn, Aidan_TROPHY_GetHorn);
	};							
};
func void Aidan_Training_TROPHY_BACK()
{
	Info_ClearChoices	(Aidan_Training_TROPHY);
}; 

func void Aidan_TROPHY_GetHorn()
{
	if	(hero.LP >= LPCOST_GetHorn)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetHorn)
	{
		PrintScreen	("Nowa umiejêtnoœæ: pozyskiwanie rogu.", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
