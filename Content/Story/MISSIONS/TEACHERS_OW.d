// ************************************************************
// 			  		TEACHERS OUTWORLD 
// ************************************************************
//
//-Hank
//-?
//

// ************************************************************
// 			  		Hank
// ************************************************************
//#####################################################################
//##
//##
//##					TALENTE: Kampf 2H
//##
//##
//#####################################################################
INSTANCE PIR_2601_Hank_Training_Combat_2H (C_INFO)
{
	npc				= PIR_2601_Hank;
	condition		= PIR_2601_Hank_Training_Combat_2H_Condition;
	information		= PIR_2601_Hank_Training_Combat_2H_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= name_learning_combat_2h; 
};

FUNC INT PIR_2601_Hank_Training_Combat_2H_Condition()
{		
   if(Npc_KnowsInfo(other, DIA_PIR_2601_Hank_CanUTeachMe)) //dodane przez Adanosa 2012-03-07
	{
		return TRUE;
	};
};

func void PIR_2601_Hank_Training_Combat_2H_Info()
{
	Info_ClearChoices	(PIR_2601_Hank_Training_Combat_2H);
   if(Npc_GetTalentValue(other, NPC_TALENT_2H)==60)
   {
      B_Say (self, other, "$NoLearnOverMax");
      return;
   };	
	Info_AddChoice(PIR_2601_Hank_Training_Combat_2H, DIALOG_BACK, PIR_2601_Hank_Training_Combat_2H_BACK);
	Info_AddChoice	(PIR_2601_Hank_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_1, LPCOST_TALENT_2H_1, 0, ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1)/2))			, PIR_2601_Hank_2HL1);
	if	(Npc_GetTalentValue(other, NPC_TALENT_2H)<56)
	{    
	   Info_AddChoice	(PIR_2601_Hank_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_5, LPCOST_TALENT_2H_5,	0, ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5)/2))			, PIR_2601_Hank_2HL2);
	};		
};
//----------------------------
// 2H Funcs
//============================
func void PIR_2601_Hank_2HL1()
{
   B_GiveSkill(hero, NPC_TALENT_2H, 1, LPCOST_TALENT_2H_1,30);
	Info_ClearChoices	(PIR_2601_Hank_Training_Combat_2H);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_2H)==60)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(PIR_2601_Hank_Training_Combat_2H, DIALOG_BACK, PIR_2601_Hank_Training_Combat_2H_BACK);
	if	(Npc_GetTalentValue(other, NPC_TALENT_2H)<56)
	{    
	   Info_AddChoice	(PIR_2601_Hank_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_5,			LPCOST_TALENT_2H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5)/2))			, PIR_2601_Hank_2HL2);
	};		
	Info_AddChoice	(PIR_2601_Hank_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_1,			LPCOST_TALENT_2H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1)/2))			, PIR_2601_Hank_2HL1);
};  

func void PIR_2601_Hank_2HL2()
{
    B_GiveSkill(hero, NPC_TALENT_2H, 2, LPCOST_TALENT_2H_5,30);
	PIR_2601_Hank_Training_Combat_2H_Info();    
};  

func void PIR_2601_Hank_Training_Combat_2H_BACK()
{
	Info_ClearChoices	(PIR_2601_Hank_Training_Combat_2H);
};

//#####################################################################
//##
//##
//##					ATTRIBUTE: Stärke
//##
//##
//#####################################################################
INSTANCE PIR_2601_Hank_Training_STR (C_INFO) //dodane przez Adanosa 2012-03-07
{
	npc				= PIR_2601_Hank;
	condition		= PIR_2601_Hank_Training_STR_Condition;
	information		= PIR_2601_Hank_Training_STR_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= name_learning_strength; 
};

FUNC INT PIR_2601_Hank_Training_STR_Condition()
{		
	if(Npc_KnowsInfo(other, DIA_PIR_2601_Hank_CanUTeachMe))
	{
		return TRUE;
	};
};

func void PIR_2601_Hank_Training_STR_Info()
{
	Info_ClearChoices	(PIR_2601_Hank_Training_STR);
	
	Info_AddChoice(PIR_2601_Hank_Training_STR, DIALOG_BACK, PIR_2601_Hank_Training_STR_BACK);    
	Info_AddChoice	(PIR_2601_Hank_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)		, PIR_2601_Hank_Strength1);
	Info_AddChoice	(PIR_2601_Hank_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)	 	, PIR_2601_Hank_Strength5);
};

func void PIR_2601_Hank_Strength1()
{
   B_BuyAttributePoints(hero,self, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH,60);
   Info_ClearChoices	(PIR_2601_Hank_Training_STR);    
	Info_AddChoice(PIR_2601_Hank_Training_STR, DIALOG_BACK, PIR_2601_Hank_Training_STR_BACK);    
	Info_AddChoice	(PIR_2601_Hank_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0), PIR_2601_Hank_Strength5);
	Info_AddChoice	(PIR_2601_Hank_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0), PIR_2601_Hank_Strength1);
};

func void PIR_2601_Hank_Strength5()
{
   B_BuyAttributePoints(hero,self, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH,60);
    
   Info_ClearChoices	(PIR_2601_Hank_Training_STR);
 	
	Info_AddChoice(PIR_2601_Hank_Training_STR, DIALOG_BACK, PIR_2601_Hank_Training_STR_BACK);    
	Info_AddChoice	(PIR_2601_Hank_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)		, PIR_2601_Hank_Strength1);
	Info_AddChoice	(PIR_2601_Hank_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)	 	, PIR_2601_Hank_Strength5);
};

func void PIR_2601_Hank_Training_STR_BACK()
{
	Info_ClearChoices	(PIR_2601_Hank_Training_STR);
};

// ************************************************************
// 			  		Carson
// ************************************************************

//#####################################################################
//##
//##
//##					TALENT: SMITH
//##
//##
//#####################################################################
INSTANCE RBL_2617_Carlson_Training_Smith (C_INFO)
{
	npc				= RBL_2617_Carlson;
	condition		= RBL_2617_Carlson_Training_Smith_Condition;
	information		= RBL_2617_Carlson_Training_Smith_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= name_learning_smith; 
};

FUNC INT RBL_2617_Carlson_Training_Smith_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Carlson_CanYouTeachMe))
	{
		return 1;
	};
};

func void RBL_2617_Carlson_Training_Smith_Info()
{
	Info_ClearChoices	(RBL_2617_Carlson_Training_Smith);
	Info_AddChoice(RBL_2617_Carlson_Training_Smith, DIALOG_BACK, RBL_2617_Carlson_Training_Smith_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_SMITH);
	Info_AddChoice	(RBL_2617_Carlson_Training_Smith, B_BuildLearnString(NAME_LearnSmith_1,1,0,ATR_STRENGTH,talval+1,ATR_DEXTERITY,Math_Round((talval+1)/2))		, RBL_2617_Carlson_Smith1);
	Info_AddChoice	(RBL_2617_Carlson_Training_Smith, B_BuildLearnString(NAME_LearnSmith_5,5,0,ATR_STRENGTH,talval+5,ATR_DEXTERITY,Math_Round((talval+5)/2))		, RBL_2617_Carlson_Smith5);
};
 
func void RBL_2617_Carlson_Smith1()
{
   B_GiveSkill(hero, NPC_TALENT_SMITH, 1, 1, 100);
	Info_ClearChoices	(RBL_2617_Carlson_Training_Smith);
	Info_AddChoice(RBL_2617_Carlson_Training_Smith, DIALOG_BACK, RBL_2617_Carlson_Training_Smith_BACK);
	var int talval;
	talval = Npc_GetTalentValue(hero,NPC_TALENT_SMITH);
	Info_AddChoice	(RBL_2617_Carlson_Training_Smith, B_BuildLearnString(NAME_LearnSmith_5,5,0,ATR_STRENGTH,talval+5,ATR_DEXTERITY,Math_Round((talval+5)/2))		, RBL_2617_Carlson_Smith5);
   Info_AddChoice	(RBL_2617_Carlson_Training_Smith, B_BuildLearnString(NAME_LearnSmith_1,1,0,ATR_STRENGTH,talval+1,ATR_DEXTERITY,Math_Round((talval+1)/2))		, RBL_2617_Carlson_Smith1);

}; 

func void RBL_2617_Carlson_Smith5()
{
   B_GiveSkill(hero, NPC_TALENT_SMITH, 5, 5, 100);
    
   RBL_2617_Carlson_Training_Smith_Info();
	
};
func void RBL_2617_Carlson_Training_Smith_BACK()
{
	Info_ClearChoices	(RBL_2617_Carlson_Training_Smith);
};

// ************************************************************
// 			  		Scorpio
// ************************************************************

//#####################################################################
//##
//##
//##					TALENTE: Kampf CROSSBOW
//##
//##
//#####################################################################
INSTANCE Grd_205_ScorpioTraining_Combat_CROSSBOW (C_INFO)
{
	npc				= Grd_205_Scorpio;
	condition		= Grd_205_ScorpioTraining_Combat_CROSSBOW_Condition;
	information		= Grd_205_ScorpioTraining_Combat_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	nr				= 900;
	description		= name_learning_crossbow; 
};

FUNC INT Grd_205_ScorpioTraining_Combat_CROSSBOW_Condition()
{		
   if (Scorpio_teacher)
   {
      return TRUE;
   };
};

func void Grd_205_ScorpioTraining_Combat_CROSSBOW_Info()
{
	Info_ClearChoices	(Grd_205_ScorpioTraining_Combat_CROSSBOW);
	if(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)==60)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};
   
	Info_AddChoice(Grd_205_ScorpioTraining_Combat_CROSSBOW, DIALOG_BACK, Grd_205_ScorpioTraining_Combat_CROSSBOW_BACK);
	Info_AddChoice	(Grd_205_ScorpioTraining_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_1,0,0)			, Grd_205_ScorpioCROSSBOWL1);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)<56)
	{    
	   Info_AddChoice	(Grd_205_ScorpioTraining_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_5,0,0)			, Grd_205_ScorpioCROSSBOWL2);
	};	
};
//----------------------------
// CROSSBOW Funcs
//============================
func void Grd_205_ScorpioCROSSBOWL1()
{
   B_GiveSkill(hero, NPC_TALENT_CROSSBOW, 1, LPCOST_TALENT_CROSSBOW_1,60);
	Info_ClearChoices	(Grd_205_ScorpioTraining_Combat_CROSSBOW);  
   
	if(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)==60)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(Grd_205_ScorpioTraining_Combat_CROSSBOW, DIALOG_BACK, Grd_205_ScorpioTraining_Combat_CROSSBOW_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)<56)
	{    
	    Info_AddChoice	(Grd_205_ScorpioTraining_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_5,0,0)			, Grd_205_ScorpioCROSSBOWL2);
	};		
	
   Info_AddChoice	(Grd_205_ScorpioTraining_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_1,0,0)			, Grd_205_ScorpioCROSSBOWL1);
};  

func void Grd_205_ScorpioCROSSBOWL2()
{
   B_GiveSkill(hero, NPC_TALENT_CROSSBOW, 2, LPCOST_TALENT_CROSSBOW_5,60);
	Grd_205_ScorpioTraining_Combat_CROSSBOW_Info();    
};  

func void Grd_205_ScorpioTraining_Combat_CROSSBOW_BACK()
{
	Info_ClearChoices	(Grd_205_ScorpioTraining_Combat_CROSSBOW);
};

// ************************************************************
// 			  		Jack Alligator                                              
// ************************************************************
//#####################################################################
//##
//##
//##					TALENTE: EVASION
//##
//##
//#####################################################################
INSTANCE PIR_2612_JackAlligatorTraining_EVASION (C_INFO)
{
	npc				= PIR_2612_JackAlligator;
	condition		= PIR_2612_JackAlligatorTraining_EVASION_Condition;
	information		= PIR_2612_JackAlligatorTraining_EVASION_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_evasion; 
	nr				= 900;
};

FUNC INT PIR_2612_JackAlligatorTraining_EVASION_Condition()
{		
	if ((HERO_EVASION_LEVEL <= 1) && (Npc_KnowsInfo(hero, DIA_JACKALLIGATOR_CanYouTeachMe)))
	{
		return TRUE;
	};
};

func void PIR_2612_JackAlligatorTraining_EVASION_Info()
{
	Info_ClearChoices	(PIR_2612_JackAlligatorTraining_EVASION);	
	Info_AddChoice(PIR_2612_JackAlligatorTraining_EVASION, DIALOG_BACK, PIR_2612_JackAlligatorTraining_EVASION_BACK);    
   
   if	(HERO_EVASION_LEVEL == 1)
	{
		Info_AddChoice(PIR_2612_JackAlligatorTraining_EVASION, B_BuildLearnString(NAME_LearnEvasion_2,20,0,0,0,0,0), PIR_2612_JackAlligatorTraining_EVASION2);
	};
	if	(HERO_EVASION_LEVEL == 0)
	{ 
	   Info_AddChoice(PIR_2612_JackAlligatorTraining_EVASION, B_BuildLearnString(NAME_LearnEvasion_1,10,0,0,0,0,0), PIR_2612_JackAlligatorTraining_EVASION1);
	};  
};	

func void PIR_2612_JackAlligatorTraining_EVASION_BACK()
{
	Info_ClearChoices	(PIR_2612_JackAlligatorTraining_EVASION);
};

func void PIR_2612_JackAlligatorTraining_EVASION1()
{
   B_GiveSkill(hero, NPC_TALENT_EVASION, 1, 10, 100);
	Info_ClearChoices(PIR_2612_JackAlligatorTraining_EVASION);
};

func void PIR_2612_JackAlligatorTraining_EVASION2()
{
   B_GiveSkill(hero, NPC_TALENT_EVASION, 2, 20, 100);
	Info_ClearChoices(PIR_2612_JackAlligatorTraining_EVASION);
};

//#####################################################################
//##
//##
//##					ANIMALTHROPHY
//##
//##
//#####################################################################
INSTANCE PIR_2612_JackAlligator_Training_TROPHY (C_INFO)
{
	npc				= PIR_2612_JackAlligator;
	condition		= PIR_2612_JackAlligator_Training_TROPHY_Condition;
	information		= PIR_2612_JackAlligator_Training_TROPHY_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_animaltrophy; 
	nr				= 901;
};

FUNC INT PIR_2612_JackAlligator_Training_TROPHY_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_JACKALLIGATOR_CanYouTeachMe))
	{
		return 1;
	};
};

func void PIR_2612_JackAlligator_Training_TROPHY_Info()
{
	Info_ClearChoices	(PIR_2612_JackAlligator_Training_TROPHY);
	Info_AddChoice(PIR_2612_JackAlligator_Training_TROPHY, DIALOG_BACK, PIR_2612_JackAlligator_Training_TROPHY_BACK);
	if(!Knows_GetHide)
	{
    Info_AddChoice(PIR_2612_JackAlligator_Training_TROPHY, TEXT_LERN_GetHide		, PIR_2612_JackAlligator_TROPHY_HIDE);
	};	
	if(!Knows_GetTongue)
	{
    Info_AddChoice(PIR_2612_JackAlligator_Training_TROPHY, TEXT_LERN_GetTongue		, PIR_2612_JackAlligator_TROPHY_TONGUE);
	};							
};

func void PIR_2612_JackAlligator_Training_TROPHY_BACK()
{
	Info_ClearChoices	(PIR_2612_JackAlligator_Training_TROPHY);
	
}; 

func void PIR_2612_JackAlligator_TROPHY_HIDE()
{
	if	(hero.LP >= LPCOST_Gethide)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_Gethide)
	{
		PrintScreen	("Nowa umiejêtnoœæ: skórowanie jaszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ skórowania jaszczurów i b³otnych wê¿y");
		hero.lp-=LPCOST_Gethide;
		Knows_GetHide=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_Gethide);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_Gethide);
	}
	else if(hero.LP >= LPCOST_Gethide)
	{
		AI_Output (self,other,"PIR_2612_JackAlligator_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    
}; 

func void PIR_2612_JackAlligator_TROPHY_TONGUE()
{
	if	(hero.LP >= LPCOST_GetTongue)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetTongue)
	{
		PrintScreen	("Nowa umiejêtnoœæ: usuwanie jêzyków", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ usuwania jêzyków jaszczurów, ognistych jaszczurów i jaszczurocz³eków.");
		hero.lp-=LPCOST_GetTongue;
		Knows_GetTongue=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetTongue);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetTongue);
	}
	else if(hero.LP >= LPCOST_GetTongue)
	{
		AI_Output (self,other,"PIR_2612_JackAlligator_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    
}; 
// ************************************************************
// 			  		Gestath                                              
// ************************************************************
//#####################################################################
//##
//##
//##					ANIMALTHROPHY
//##
//##
//#####################################################################
INSTANCE HUN_2609_GESTATH_Training_TROPHY (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	condition		= HUN_2609_GESTATH_Training_TROPHY_Condition;
	information		= HUN_2609_GESTATH_Training_TROPHY_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_animaltrophy; 
	nr				= 900;
};

FUNC INT HUN_2609_GESTATH_Training_TROPHY_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Gestath_CanYouTeachMe))
	{
		return 1;
	};
};

func void HUN_2609_GESTATH_Training_TROPHY_Info()
{
	Info_ClearChoices	(HUN_2609_GESTATH_Training_TROPHY);
	Info_AddChoice(HUN_2609_GESTATH_Training_TROPHY, DIALOG_BACK, HUN_2609_GESTATH_Training_TROPHY_BACK);
	if(!Knows_GetFur)
	{
    Info_AddChoice(HUN_2609_GESTATH_Training_TROPHY, TEXT_LERN_GetFur		, HUN_2609_GESTATH_TROPHY_FUR);
	};	
	if(!Knows_GetHide)
	{
    Info_AddChoice(HUN_2609_GESTATH_Training_TROPHY, TEXT_LERN_GetHide		, HUN_2609_GESTATH_TROPHY_HIDE);
	};	
	if(!Knows_GetBFSting)
	{
    Info_AddChoice(HUN_2609_GESTATH_Training_TROPHY, TEXT_LERN_GetBFSting		, HUN_2609_GESTATH_TROPHY_GetBFSting);
	};		
	if(!Knows_GetWings)
	{
    Info_AddChoice(HUN_2609_GESTATH_Training_TROPHY, TEXT_LERN_GetWings		, HUN_2609_GESTATH_TROPHY_GetWings);
	};	
	if(!Knows_GetFeather)
	{
    Info_AddChoice(HUN_2609_GESTATH_Training_TROPHY, TEXT_LERN_GetFeather		, HUN_2609_GESTATH_TROPHY_GetFeather);
	};	
	if(!Knows_GetHeart)
	{
    Info_AddChoice(HUN_2609_GESTATH_Training_TROPHY, TEXT_LERN_GetHeart		, HUN_2609_GESTATH_TROPHY_GetHeart);
	};										
};

func void HUN_2609_GESTATH_Training_TROPHY_BACK()
{
	Info_ClearChoices	(HUN_2609_GESTATH_Training_TROPHY);
	
}; 

func void HUN_2609_GESTATH_TROPHY_FUR()
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
		AI_Output (self,other,"HUN_2609_GESTATH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    
}; 

func void HUN_2609_GESTATH_TROPHY_HIDE()
{
	if	(hero.LP >= LPCOST_Gethide)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_Gethide)
	{
		PrintScreen	("Nowa umiejêtnoœæ: skórowanie jaszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ skórowania jaszczurów i b³otnych wê¿y.");
		hero.lp-=LPCOST_Gethide;
		Knows_GetHide=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_Gethide);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_Gethide);
	}
	else if(hero.LP >= LPCOST_Gethide)
	{
		AI_Output (self,other,"HUN_2609_GESTATH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    
}; 

func void HUN_2609_GESTATH_TROPHY_GetBFSting()
{
	if	(hero.LP >= LPCOST_GetBFSting)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetBFSting)
	{
		PrintScreen	("Nowa umiejêtnoœæ: pozyskiwanie ¿¹d³a.", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ pozyskiwania ¿¹d³a krwiopijcy.");		
		hero.lp-=LPCOST_GetBFSting;
		Knows_GetBFSting=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetBFSting);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetBFSting);
		 
	}
	else if(hero.LP >= LPCOST_GetBFSting)
	{
		AI_Output (self,other,"HUN_2609_GESTATH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    
}; 

func void HUN_2609_GESTATH_TROPHY_GetWings()
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
		AI_Output (self,other,"HUN_2609_GESTATH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    
}; 

func void HUN_2609_GESTATH_TROPHY_GetFeather()
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
		AI_Output (self,other,"HUN_2609_GESTATH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    
};  

func void HUN_2609_GESTATH_TROPHY_GetHeart()
{
	if	(hero.LP >= LPCOST_GetHeart)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GetHeart)
	{
		PrintScreen	("Nowa umiejêtnoœæ: usuwanie serc.", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ usuwania serc.");		
		hero.lp-=LPCOST_GetHeart;
		Knows_GetHeart=TRUE;
		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GetHeart);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GetHeart);
	}
	else if(hero.LP >= LPCOST_GetHeart)
	{
		AI_Output (self,other,"HUN_2609_GESTATH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};    
};  

INSTANCE Torlof_Training_TROPHY (C_INFO)
{
	npc				= Sld_737_Torlof;
	condition		= Torlof_Training_TROPHY_Condition;
	information		= Torlof_Training_TROPHY_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_animaltrophy; 
};

FUNC INT Torlof_Training_TROPHY_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Torlof_CanYouTeachMe))
	{
		return 1;
	};
};


func void Torlof_Training_TROPHY_Info()
{
	Info_ClearChoices	(Torlof_Training_TROPHY);
	Info_AddChoice(Torlof_Training_TROPHY, DIALOG_BACK, Torlof_Training_TROPHY_BACK);

	if(!Knows_GetMCMandibles)
	{
    Info_AddChoice(Torlof_Training_TROPHY, TEXT_LERN_GetMCMandibles		, Torlof_TROPHY_GetMCMandibles);
	};	
	if(!Knows_GetMCThread)
	{
    Info_AddChoice(Torlof_Training_TROPHY, TEXT_LERN_GetMCThread		, Torlof_TROPHY_GetMCThread);
	};	
   if(!Knows_GetMCPlates)
	{
    Info_AddChoice(Torlof_Training_TROPHY, TEXT_LERN_GetMCPlates		, Torlof_TROPHY_GetMCPlates);
	};	
};
func void Torlof_Training_TROPHY_BACK()
{
	Info_ClearChoices	(Torlof_Training_TROPHY);
}; 

func void Torlof_TROPHY_GetMCMandibles()
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

func void Torlof_TROPHY_GetMCThread()
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

func VOID Torlof_TROPHY_GetMCPlates()
{
   if	(hero.LP >= LPCOST_GETMCPLATES)&&(Npc_HasItems(hero,itminugget)>=50*LPCOST_GETMCPLATES)
	{
		AI_Output(hero,self,"TROPHY_GetMCPlates_15_01"); //W jaki sposób mam oddzieliæ p³ytki od zw³ok pe³zaczy?
      AI_Output(self,hero,"TROPHY_GetMCPlates_09_02"); //To proste. P³ytki na grzbiecie przymocowane s¹ tylko przy krawêdziach.
      AI_Output(self,hero,"TROPHY_GetMCPlates_09_03"); //Wystarczy wzi¹æ ostry nó¿ i 'ci¹æ wzd³u¿ przerywanej linii'.

      Knows_GetMCPlates = TRUE;
      PrintScreen	("Nowa umiejêtnoœæ: Wycinanie p³ytek pancerza", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
      
      Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
      Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);

      Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
      B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ usuwania pancerzy z martwych pe³zaczy-wojowników.");		
		hero.lp-=LPCOST_GETMCPLATES;

		B_GiveInvItems(other,self,ItMiNugget,50*LPCOST_GETMCPLATES);
		Npc_RemoveInvItems(self,ItMiNugget,50*LPCOST_GETMCPLATES);
	}
	else if(hero.LP >= LPCOST_GETMCPLATES)
	{
		AI_Output (self,other,"CH_TROPHY_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!			
	}
	else
	{ 
		PrintScreen	("Za ma³o punktów nauki!", -1,-1,"FONT_OLD_10_WHITE.TGA",2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};
};

INSTANCE Xardas_Training_Magic (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Xardas_Training_Magic_Condition;
	information		= Xardas_Training_Magic_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_magic; 
};

FUNC INT Xardas_Training_Magic_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Xardas_CanYouTeachMe) && (hero.guild == gil_mag))
	{
		return 1;
	};
};

func void Xardas_Training_Magic_Info()
{
	Info_ClearChoices	(Xardas_Training_Magic);
	Info_AddChoice(Xardas_Training_Magic, DIALOG_BACK, Xardas_Training_Magic_BACK);

	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE)== 3)&&(Kapitel>=4)  
	{
		Info_AddChoice(Xardas_Training_Magic, B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,	0,ATR_MANA_MAX,80,0,0), Xardas_Magic4);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 4)&&(Kapitel>=5)  
	{
		Info_AddChoice(Xardas_Training_Magic, B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,	0,ATR_MANA_MAX,100,0,0), Xardas_Magic5);
	}
	else if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 5)&&(Kapitel>=5)   
	{
		Info_AddChoice	(Xardas_Training_Magic,	B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,	0,ATR_MANA_MAX,120,0,0),	Xardas_Magic6);
	};
};

func void Xardas_Magic4()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 4, LPCOST_TALENT_MAGE_4,100);
 	Xardas_Training_Magic_Info();
};  

func void Xardas_Magic5()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 5, LPCOST_TALENT_MAGE_5,100);
 	Xardas_Training_Magic_Info(); 
}; 

func void Xardas_Magic6()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6,100);
 	Xardas_Training_Magic_Info();
};  

func void Xardas_Training_Magic_BACK()
{
	Info_ClearChoices	(Xardas_Training_Magic);
};

INSTANCE Saturas_Training_Magic (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= Saturas_Training_Magic_Condition;
	information		= Saturas_Training_Magic_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_magic; 
};

FUNC INT Saturas_Training_Magic_Condition()
{		
	if (Npc_KnowsInfo(hero, DIA_Saturas_CanYouTeachMe) && (hero.guild == gil_mag))
	{
		return 1;
	};
};

func void Saturas_Training_Magic_Info()
{
	Info_ClearChoices	(Saturas_Training_Magic);
	Info_AddChoice(Saturas_Training_Magic, DIALOG_BACK, Saturas_Training_Magic_BACK);


	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 4)&&(Kapitel>=5)  
	{
		Info_AddChoice	(Saturas_Training_Magic, B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,	0,ATR_MANA_MAX,100,0,0), Saturas_Magic5);
	};
	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE)== 3)&&(Kapitel>=4)  
	{
		Info_AddChoice	(Saturas_Training_Magic, B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,	0,ATR_MANA_MAX,80,0,0), Saturas_Magic4);
	};
	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 2)&&(Kapitel>=3)  
	{
		Info_AddChoice	(Saturas_Training_Magic, B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,	0,ATR_MANA_MAX,60,0,0), Saturas_Magic3);
	};
	if (Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 1)&&(Kapitel>=2)  
	{
		Info_AddChoice	(Saturas_Training_Magic, B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,	0,ATR_MANA_MAX,40,0,0), Saturas_Magic2);
	};
	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 0)&&(Kapitel>=1) 
	{
		Info_AddChoice	(Saturas_Training_Magic, B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,	0,ATR_MANA_MAX,20,0,0), Saturas_Magic1);
	};
};

func void Saturas_Magic1()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 1, LPCOST_TALENT_MAGE_1,100);
	Saturas_Training_Magic_Info();
};  

func void Saturas_Magic2()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 2, LPCOST_TALENT_MAGE_2,100);
	Saturas_Training_Magic_Info();
};  

func void Saturas_Magic3()
{   
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 3, LPCOST_TALENT_MAGE_3,100);
 	Saturas_Training_Magic_Info();
}; 

func void Saturas_Magic4()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 4, LPCOST_TALENT_MAGE_4,100);
 	Saturas_Training_Magic_Info();
};  

func void Saturas_Magic5()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 5, LPCOST_TALENT_MAGE_5,100);
 	Saturas_Training_Magic_Info(); 
}; 

func void Saturas_Training_Magic_BACK()
{
	Info_ClearChoices	(Saturas_Training_Magic);
};

INSTANCE Necro_Training_Magic (C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;
	condition		= Necro_Training_Magic_Condition;
	information		= Necro_Training_Magic_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_magic; 
};

FUNC INT Necro_Training_Magic_Condition()
{		
	if (Npc_KnowsInfo (hero, DIA_Necro_Learn) && (hero.guild == gil_mag))
	{
		return 1;
	};
};

func void Necro_Training_Magic_Info()
{
	Info_ClearChoices	(Necro_Training_Magic);
	Info_AddChoice(Necro_Training_Magic, DIALOG_BACK, Necro_Training_Magic_BACK);

	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 5)&&(Kapitel>=6)  
	{
		Info_AddChoice	(Necro_Training_Magic,	B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,	0,ATR_MANA_MAX,120,0,0),	Necro_Magic6);
	};
	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 4)&&(Kapitel>=5)  
	{
		Info_AddChoice	(Necro_Training_Magic, B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,	0,ATR_MANA_MAX,100,0,0), Necro_Magic5);
	};
	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE)== 3)&&(Kapitel>=4)  
	{
		Info_AddChoice	(Necro_Training_Magic, B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,	0,ATR_MANA_MAX,80,0,0), Necro_Magic4);
	};
	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 2)&&(Kapitel>=3)  
	{
		Info_AddChoice	(Necro_Training_Magic, B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,	0,ATR_MANA_MAX,60,0,0), Necro_Magic3);
	};
	if (Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 1)&&(Kapitel>=2)  
	{
		Info_AddChoice	(Necro_Training_Magic, B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,	0,ATR_MANA_MAX,40,0,0), Necro_Magic2);
	};
	if	(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) == 0)&&(Kapitel>=1) 
	{
		Info_AddChoice	(Necro_Training_Magic, B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,	0,ATR_MANA_MAX,20,0,0), Necro_Magic1);
	};
};

func void Necro_Magic1()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 1, LPCOST_TALENT_MAGE_1,100);
	Necro_Training_Magic_Info();
};  

func void Necro_Magic2()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 2, LPCOST_TALENT_MAGE_2,100);
	Necro_Training_Magic_Info();
};  

func void Necro_Magic3()
{   
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 3, LPCOST_TALENT_MAGE_3,100);
 	Necro_Training_Magic_Info();
}; 

func void Necro_Magic4()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 4, LPCOST_TALENT_MAGE_4,100);
 	Necro_Training_Magic_Info();
};  

func void Necro_Magic5()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 5, LPCOST_TALENT_MAGE_5,100);
 	Necro_Training_Magic_Info(); 
}; 

func void Necro_Magic6()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6,100);
 	Necro_Training_Magic_Info();
};  

func void Necro_Training_Magic_BACK()
{
	Info_ClearChoices	(Necro_Training_Magic);
};

INSTANCE Seven_Training_Combat_CROSSBOW (C_INFO)
{
	npc				= Grd_613_Gardist;
	condition		= Seven_Training_Combat_CROSSBOW_Condition;
	information		= Seven_Training_Combat_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_crossbow; 
};

FUNC INT Seven_Training_Combat_CROSSBOW_Condition()
{		
	if (Npc_KnowsInfo (hero, DIA_Seven_CanYouTeachMe))
	{
		return 1;
	};
};

func void Seven_Training_Combat_CROSSBOW_Info()
{
	Info_ClearChoices	(Seven_Training_Combat_CROSSBOW);
   if(	Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)==100)
   {
      B_Say (self, other, "$NoLearnOverMax");
      return;
   };	
	Info_AddChoice(Seven_Training_Combat_CROSSBOW, DIALOG_BACK, Seven_Training_Combat_CROSSBOW_BACK);

	Info_AddChoice	(Seven_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_1,0,0)			, Seven_CROSSBOWL1);

	if	(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)<96)
	{    
	   Info_AddChoice	(Seven_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_5,0,0)			, Seven_CROSSBOWL2);
	};	
};
//----------------------------
// CROSSBOW Funcs
//============================
func void Seven_CROSSBOWL1()
{
   B_GiveSkill(hero, NPC_TALENT_CROSSBOW, 1, LPCOST_TALENT_CROSSBOW_1,100);
	Info_ClearChoices	(Seven_Training_Combat_CROSSBOW);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)==100)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(Seven_Training_Combat_CROSSBOW, DIALOG_BACK, Seven_Training_Combat_CROSSBOW_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)<96)
	{    
	   Info_AddChoice	(Seven_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_5,0,0)			, Seven_CROSSBOWL2);
	};		
	
   Info_AddChoice	(Seven_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_1,0,0)			, Seven_CROSSBOWL1);
};  

func void Seven_CROSSBOWL2()
{
    B_GiveSkill(hero, NPC_TALENT_CROSSBOW, 2, LPCOST_TALENT_CROSSBOW_5,100);
	Seven_Training_Combat_CROSSBOW_Info();    
};  

func void Seven_Training_Combat_CROSSBOW_BACK()
{
	Info_ClearChoices	(Seven_Training_Combat_CROSSBOW);
};

INSTANCE Scorpio_Training_Combat_CROSSBOW (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	condition		= Scorpio_Training_Combat_CROSSBOW_Condition;
	information		= Scorpio_Training_Combat_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_crossbow; 
};

FUNC INT Scorpio_Training_Combat_CROSSBOW_Condition()
{		
	if (Npc_KnowsInfo (hero, DIA_Scorpio_CanYouTeachMe))
	{
		return 1;
	};
};

func void Scorpio_Training_Combat_CROSSBOW_Info()
{
	Info_ClearChoices	(Scorpio_Training_Combat_CROSSBOW);
   if(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)==60)
   {
      B_Say (self, other, "$NoLearnOverMax");
      return;
   };	
	Info_AddChoice(Scorpio_Training_Combat_CROSSBOW, DIALOG_BACK, Scorpio_Training_Combat_CROSSBOW_BACK);

	Info_AddChoice	(Scorpio_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_1,0,0)			, Scorpio_CROSSBOWL1);

	if	(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)<56)
	{    
	   Info_AddChoice	(Scorpio_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_5,0,0)			, Scorpio_CROSSBOWL2);
	};	
};
//----------------------------
// CROSSBOW Funcs
//============================
func void Scorpio_CROSSBOWL1()
{
   B_GiveSkill(hero, NPC_TALENT_CROSSBOW, 1, LPCOST_TALENT_CROSSBOW_1,60);
	Info_ClearChoices	(Scorpio_Training_Combat_CROSSBOW);    
	if(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)==60)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(Scorpio_Training_Combat_CROSSBOW, DIALOG_BACK, Scorpio_Training_Combat_CROSSBOW_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_CROSSBOW)<56)
	{    
	   Info_AddChoice	(Scorpio_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_5,0,0)			, Scorpio_CROSSBOWL2);
	};		
	Info_AddChoice	(Scorpio_Training_Combat_CROSSBOW, B_BuildLearnString(NAME_LearnCROSSBOW_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+LPCOST_TALENT_CROSSBOW_1,0,0)			, Scorpio_CROSSBOWL1);
};  

func void Scorpio_CROSSBOWL2()
{
   B_GiveSkill(hero, NPC_TALENT_CROSSBOW, 2, LPCOST_TALENT_CROSSBOW_5,60);
	Scorpio_Training_Combat_CROSSBOW_Info();    
};  

func void Scorpio_Training_Combat_CROSSBOW_BACK()
{
	Info_ClearChoices	(Scorpio_Training_Combat_CROSSBOW);
};

INSTANCE Diego_Training_DEX (C_INFO)
{
	npc				= PC_Thief;
	condition		= Diego_Training_DEX_Condition;
	information		= Diego_Training_DEX_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_dexterity; 
};

FUNC INT Diego_Training_DEX_Condition()
{		
	if (Npc_KnowsInfo (hero, DIA_Diego_CanYouTeachMe))
	{
		return 1;
	};
};

func void Diego_Training_DEX_Info ()
{
	Info_ClearChoices	(Diego_Training_DEX);
	Info_AddChoice(Diego_Training_DEX, DIALOG_BACK, Diego_Training_DEX_BACK);
	if	(hero.LP >= 1)
	{ 
	   Info_AddChoice	(Diego_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, Diego_Dexterity1);
	};	
	if	(hero.LP >= 5)
	{
		Info_AddChoice	(Diego_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, Diego_Dexterity5);
	};
};

func void Diego_Dexterity1()
{
   B_BuyAttributePoints(hero,self, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY,200);
    
   Info_ClearChoices	(Diego_Training_DEX);
	Info_AddChoice(Diego_Training_DEX, DIALOG_BACK, Diego_Training_DEX_BACK);
	if	(hero.LP >= 5)
	{
		Info_AddChoice	(Diego_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, Diego_Dexterity5);
	};   
	if	(hero.LP >= 1)
	{ 
	   Info_AddChoice	(Diego_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, Diego_Dexterity1);
	};		 
}; 

func void Diego_Dexterity5()
{
   B_BuyAttributePoints(hero,self, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY,200);
    
   Info_ClearChoices	(Diego_Training_DEX);
	Info_AddChoice(Diego_Training_DEX, DIALOG_BACK, Diego_Training_DEX_BACK);
    
 	if	(hero.LP >= 1)
	{ 
	   Info_AddChoice	(Diego_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)		, Diego_Dexterity1);
	};	
	if	(hero.LP >= 5)
	{
		Info_AddChoice	(Diego_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0,0,0,0,0)	, Diego_Dexterity5);
	};   
};
func void Diego_Training_DEX_BACK()
{
	Info_ClearChoices	(Diego_Training_DEX);
};

//#####################################################################
//##
//##
//##					TALENTE: Kampf BOW
//##
//##
//#####################################################################
INSTANCE Diego_Training_Combat_BOW (C_INFO)
{
	npc				= PC_Thief;
	condition		= Diego_Training_Combat_BOW_Condition;
	information		= Diego_Training_Combat_BOW_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_bow; 
};

FUNC INT Diego_Training_Combat_BOW_Condition()
{		
	if (Npc_KnowsInfo (hero, DIA_Diego_CanYouTeachMe))
	{
		return 1;
	};
};

func void Diego_Training_Combat_BOW_Info()
{
	Info_ClearChoices	(Diego_Training_Combat_BOW);
   if(Npc_GetTalentValue(other, NPC_TALENT_BOW)==100)
   {
      B_Say (self, other, "$NoLearnOverMax");
      return;
   };	
	Info_AddChoice(Diego_Training_Combat_BOW, DIALOG_BACK, Diego_Training_Combat_BOW_BACK);
	Info_AddChoice	(Diego_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_1,0,0)			, Diego_BOWL1);

	if	(Npc_GetTalentValue(other, NPC_TALENT_BOW)<96)
	{    
	   Info_AddChoice	(Diego_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_5,0,0)			, Diego_BOWL2);
	};	
};
//----------------------------
// BOW Funcs
//============================
func void Diego_BOWL1()
{
   B_GiveSkill(hero, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1,100);
	Info_ClearChoices	(Diego_Training_Combat_BOW);    
	if(Npc_GetTalentValue(other, NPC_TALENT_BOW)==100)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(Diego_Training_Combat_BOW, DIALOG_BACK, Diego_Training_Combat_BOW_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_BOW)<96)
	{    
	   Info_AddChoice	(Diego_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_5,0,0)			, Diego_BOWL2);
	};		
	Info_AddChoice	(Diego_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_1,0,0)			, Diego_BOWL1);
};  

func void Diego_BOWL2()
{
   B_GiveSkill(hero, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_5,100);
	Diego_Training_Combat_BOW_Info();    
};  

func void Diego_Training_Combat_BOW_BACK()
{
	Info_ClearChoices	(Diego_Training_Combat_BOW);
};

INSTANCE Wolf_Training_Combat_BOW (C_INFO)
{
	npc				= Org_855_Wolf;
	condition		= Wolf_Training_Combat_BOW_Condition;
	information		= Wolf_Training_Combat_BOW_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_bow; 
};

FUNC INT Wolf_Training_Combat_BOW_Condition()
{		
	if (Npc_KnowsInfo (hero, DIA_Wolf_CanYouTeachMe))
	{
		return 1;
	};
};

func void Wolf_Training_Combat_BOW_Info()
{
	Info_ClearChoices	(Wolf_Training_Combat_BOW);
   if(Npc_GetTalentValue(other, NPC_TALENT_BOW)==60)
   {
      B_Say (self, other, "$NoLearnOverMax");
      return;
   };	
	Info_AddChoice(Wolf_Training_Combat_BOW, DIALOG_BACK, Wolf_Training_Combat_BOW_BACK);
	Info_AddChoice	(Wolf_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_1,0,0)			, Wolf_BOWL1);

	if	(Npc_GetTalentValue(other, NPC_TALENT_BOW)<56)
	{    
	   Info_AddChoice	(Wolf_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_5,0,0)			, Wolf_BOWL2);
	};	
};
//----------------------------
// BOW Funcs
//============================
func void Wolf_BOWL1()
{
   B_GiveSkill(hero, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1,60);
	Info_ClearChoices	(Wolf_Training_Combat_BOW);    
	if(Npc_GetTalentValue(other, NPC_TALENT_BOW)==60)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(Wolf_Training_Combat_BOW, DIALOG_BACK, Wolf_Training_Combat_BOW_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_BOW)<56)
	{    
	   Info_AddChoice	(Wolf_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_5,	5,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_5,0,0)			, Wolf_BOWL2);
	};		
	Info_AddChoice	(Wolf_Training_Combat_BOW, B_BuildLearnString(NAME_Learnbow_1,	1,	0,ATR_DEXTERITY,Npc_GetTalentValue(hero, NPC_TALENT_BOW)+LPCOST_TALENT_BOW_1,0,0)			, Wolf_BOWL1);
};  

func void Wolf_BOWL2()
{
   B_GiveSkill(hero, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_5,60);
	Wolf_Training_Combat_BOW_Info();    
};  

func void Wolf_Training_Combat_BOW_BACK()
{
	Info_ClearChoices	(Wolf_Training_Combat_BOW);
};
/*******************
INSTANCE Angus_Training_Combat_2H (C_INFO)
{
	npc				= PIR_2600_Angus;
	condition		= Angus_Training_Combat_2H_Condition;
	information		= Angus_Training_Combat_2H_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_combat_2h; 
};

FUNC INT Angus_Training_Combat_2H_Condition()
{		
	return TRUE;
};

func void Angus_Training_Combat_2H_Info()
{
	Info_ClearChoices	(Angus_Training_Combat_2H);
   if(Npc_GetTalentValue(other, NPC_TALENT_2H)==60)
   {
      B_Say (self, other, "$NoLearnOverMax");
      return;
   };	
	Info_AddChoice(Angus_Training_Combat_2H, DIALOG_BACK, Angus_Training_Combat_2H_BACK);
	Info_AddChoice	(Angus_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_1,			LPCOST_TALENT_2H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1)/2))			, Angus_2HL1);

	if	(Npc_GetTalentValue(other, NPC_TALENT_2H)<56)
	{    
	   Info_AddChoice	(Angus_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_5,			LPCOST_TALENT_2H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5)/2))			, Angus_2HL2);
	};		
};
//----------------------------
// 2H Funcs
//============================
func void Angus_2HL1()
{
   B_GiveSkill(hero, NPC_TALENT_2H, 1, LPCOST_TALENT_2H_1,100);
	Info_ClearChoices	(Angus_Training_Combat_2H);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_2H)==60)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(Angus_Training_Combat_2H, DIALOG_BACK, Angus_Training_Combat_2H_BACK);
	if	(Npc_GetTalentValue(other, NPC_TALENT_2H)<56)
	{    
	    Info_AddChoice	(Angus_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_5,			LPCOST_TALENT_2H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5)/2))			, Angus_2HL2);
	};		
	Info_AddChoice	(Angus_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_1,			LPCOST_TALENT_2H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1)/2))			, Angus_2HL1);
};  

func void Angus_2HL2()
{
   B_GiveSkill(hero, NPC_TALENT_2H, 2, LPCOST_TALENT_2H_5,100);
	Angus_Training_Combat_2H_Info();    
};  

func void Angus_Training_Combat_2H_BACK()
{
	Info_ClearChoices	(Angus_Training_Combat_2H);
};
**************************/

INSTANCE Gorn_Training_STR (C_INFO)
{
	npc				= PC_Fighter;
	condition		= Gorn_Training_STR_Condition;
	information		= Gorn_Training_STR_Info;
	important		= 0;
	permanent		= 1;
	description		= Name_learning_strength; 
};

FUNC INT Gorn_Training_STR_Condition()
{		
	if (Npc_KnowsInfo (hero, DIA_Gorn_CanYouTeachMe))
	{
		return 1;
	};
};

func void Gorn_Training_STR_Info()
{
	Info_ClearChoices	(Gorn_Training_STR);
	
	Info_AddChoice(Gorn_Training_STR, DIALOG_BACK, Gorn_Training_STR_BACK);    
	if	(hero.LP >= LPCOST_ATTRIBUTE_STRENGTH)
	{ 
	   Info_AddChoice	(Gorn_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)		, Gorn_Strength1);
	};
	if	(hero.LP >= 5*LPCOST_ATTRIBUTE_STRENGTH)
	{
		Info_AddChoice	(Gorn_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)	 	, Gorn_Strength5);
	};	
};

func void Gorn_Strength1()
{
   B_BuyAttributePoints(hero,self, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH,200);
   Info_ClearChoices	(Gorn_Training_STR);    
	Info_AddChoice(Gorn_Training_STR, DIALOG_BACK, Gorn_Training_STR_BACK);    
	if	(hero.LP >= 5*LPCOST_ATTRIBUTE_STRENGTH)
	{
		Info_AddChoice	(Gorn_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)	 	, Gorn_Strength5);
	};	
	if	(hero.LP >= LPCOST_ATTRIBUTE_STRENGTH)
	{ 
	   Info_AddChoice	(Gorn_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)		, Gorn_Strength1);
	};  	
};

func void Gorn_Strength5()
{
   B_BuyAttributePoints(hero,self, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH,200);
    
   Info_ClearChoices	(Gorn_Training_STR);
 	
	Info_AddChoice(Gorn_Training_STR, DIALOG_BACK, Gorn_Training_STR_BACK);    
	if	(hero.LP >= LPCOST_ATTRIBUTE_STRENGTH)
	{ 
	    Info_AddChoice	(Gorn_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)		, Gorn_Strength1);
	};
	if	(hero.LP >= 5*LPCOST_ATTRIBUTE_STRENGTH)
	{
		Info_AddChoice	(Gorn_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0,0,0,0,0)	 	, Gorn_Strength5);
	};	   
};

func void Gorn_Training_STR_BACK()
{
	Info_ClearChoices	(Gorn_Training_STR);
};

INSTANCE Lee_Training_RuneSword (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Lee_Training_RuneSword_Condition;
	information		= Lee_Training_RuneSword_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_runesword; 
};

FUNC INT Lee_Training_RuneSword_Condition()
{		
	if	(TALENT_RUNESWORDUSING == 0) &&(Npc_KnowsInfo (hero, DIA_Lee_CanYouTeachMe1))
	{
		return TRUE;
	};
};

func void Lee_Training_RuneSword_Info()
{
    Hack_B_GiveSkill(hero, HACK_NPC_TALENT_RUNESWORDUSING, 1, 30, 100);
};	

//#####################################################################
//##
//##
//##					TALENTE: Kampf 2H
//##
//##
//#####################################################################
INSTANCE Lee_Training_Combat_2H (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Lee_Training_Combat_2H_Condition;
	information		= Lee_Training_Combat_2H_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_combat_2h; 
};

FUNC INT Lee_Training_Combat_2H_Condition()
{		
	if (Npc_KnowsInfo (hero, DIA_Lee_CanYouTeachMe))
	{
		return 1;
	};
};

func void Lee_Training_Combat_2H_Info()
{
	Info_ClearChoices	(Lee_Training_Combat_2H);
   if(Npc_GetTalentValue(other, NPC_TALENT_2H)==100)
   {
      B_Say (self, other, "$NoLearnOverMax");
      return;
   };	
	Info_AddChoice(Lee_Training_Combat_2H, DIALOG_BACK, Lee_Training_Combat_2H_BACK);
	Info_AddChoice	(Lee_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_1,			LPCOST_TALENT_2H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1)/2))			, Lee_2HL1);

	if	(Npc_GetTalentValue(other, NPC_TALENT_2H)<96)
	{    
	   Info_AddChoice	(Lee_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_5,			LPCOST_TALENT_2H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5)/2))			, Lee_2HL2);
	};		
};
//----------------------------
// 2H Funcs
//============================
func void Lee_2HL1()
{
   B_GiveSkill(hero, NPC_TALENT_2H, 1, LPCOST_TALENT_2H_1,100);
	Info_ClearChoices	(Lee_Training_Combat_2H);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_2H)==100)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(Lee_Training_Combat_2H, DIALOG_BACK, Lee_Training_Combat_2H_BACK);
	if	(Npc_GetTalentValue(other, NPC_TALENT_2H)<96)
	{    
	   Info_AddChoice	(Lee_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_5,			LPCOST_TALENT_2H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_5)/2))			, Lee_2HL2);
	};		
	
   Info_AddChoice	(Lee_Training_Combat_2H, B_BuildLearnString(NAME_Learn2H_1,			LPCOST_TALENT_2H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_2H)+LPCOST_TALENT_2H_1)/2))			, Lee_2HL1);
};  

func void Lee_2HL2()
{
   B_GiveSkill(hero, NPC_TALENT_2H, 2, LPCOST_TALENT_2H_5,100);
	Lee_Training_Combat_2H_Info();    
};  

func void Lee_Training_Combat_2H_BACK()
{
	Info_ClearChoices	(Lee_Training_Combat_2H);
};

INSTANCE Cord_Training_Combat_1H (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= Cord_Training_Combat_1H_Condition;
	information		= Cord_Training_Combat_1H_Info;
	important		= 0;
	permanent		= 1;
	description		= name_learning_combat_1h; 
};

FUNC INT Cord_Training_Combat_1H_Condition()
{		
	if (Npc_KnowsInfo (hero, DIA_Cord_CanYouTeachMe))
	{
		return 1;
	};
};

func void Cord_Training_Combat_1H_Info()
{
	Info_ClearChoices	(Cord_Training_Combat_1H);
   if(Npc_GetTalentValue(other, NPC_TALENT_1H)==100)
   {
      B_Say (self, other, "$NoLearnOverMax");
      return;
   };	
	Info_AddChoice(Cord_Training_Combat_1H, DIALOG_BACK, Cord_Training_Combat_1H_BACK);
	Info_AddChoice	(Cord_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_1,			LPCOST_TALENT_1H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1)/2))			, Cord_1hL1);

	if	(Npc_GetTalentValue(other, NPC_TALENT_1H)<96)
	{    
	    Info_AddChoice	(Cord_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_5,			LPCOST_TALENT_1H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5)/2))			, Cord_1hL2);
	};	
};
//----------------------------
// 1H Funcs
//============================
func void Cord_1hL1()
{
    B_GiveSkill(hero, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1,100);
	Info_ClearChoices	(Cord_Training_Combat_1H);    
	if(	Npc_GetTalentValue(other, NPC_TALENT_1H)==100)
	{
		B_Say (self, other, "$NoLearnOverMax");
		return;
	};	
	Info_AddChoice(Cord_Training_Combat_1H, DIALOG_BACK, Cord_Training_Combat_1H_BACK);
	
	if	(Npc_GetTalentValue(other, NPC_TALENT_1H)<96)
	{    
	    Info_AddChoice	(Cord_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_5,			LPCOST_TALENT_1H_5,	0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_5)/2))			, Cord_1hL2);
	};		
	    Info_AddChoice	(Cord_Training_Combat_1H, B_BuildLearnString(NAME_Learn1h_1,			LPCOST_TALENT_1H_1,0,ATR_STRENGTH,Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1,ATR_DEXTERITY,Math_Round((Npc_GetTalentValue(hero, NPC_TALENT_1H)+LPCOST_TALENT_1H_1)/2))			, Cord_1hL1);
};  

func void Cord_1hL2()
{
   B_GiveSkill(hero, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_5,100);
	Cord_Training_Combat_1H_Info();    
};  

func void Cord_Training_Combat_1H_BACK()
{
	Info_ClearChoices	(Cord_Training_Combat_1H);
};

//#####################################################################
//##
//##
//##					TALENTE: Dual
//##
//##
//#####################################################################
INSTANCE Cord_Training_Dual (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= Cord_Training_Dual_Condition;
	information		= Cord_Training_Dual_Info;
	important		= 0;
	permanent		= 1;
	description		= NAME_DUALSLERN; 
};

FUNC INT Cord_Training_Dual_Condition()
{		
	if	(TALENT_DUALUSING == 0) &&(Npc_KnowsInfo (hero, DIA_Cord_CanYouTeachMe11))
	{
		return TRUE;
	};
};

func void Cord_Training_Dual_Info()
{
   Hack_B_GiveSkill(hero, HACK_NPC_TALENT_DUALUSING, 1, 30,100);
};	

INSTANCE Buster_Training_Acrobat (C_INFO)
{
	npc				= ORG_833_Buster;
	condition		= Buster_Training_Acrobat_Condition;
	information		= Buster_Training_Acrobat_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka: akrobatyka (10 PN)"; 
};

FUNC INT Buster_Training_Acrobat_Condition()
{		
	if(TALENT_ACROBAT == 0) && Npc_KnowsInfo(hero, DIA_ORG_833_Buster3)
	{
		return TRUE;
	};
};

func void Buster_Training_Acrobat_Info()
{
   if (Hack_B_GiveSkill(hero, HACK_NPC_TALENT_ACROBAT, 1, LPCOST_TALENT_ACROBAT,100))
   {
      AI_Output (self, other,"DIA_ORG_833_Buster3_02_02"); //Po kilku lekcjach nauczysz siê skakaæ na wiêksze odleg³oœci.
      AI_Output (self, other,"DIA_ORG_833_Buster3_02_03"); //Poka¿ê ci w jaki sposób mo¿na z³agodziæ efekt upadku z du¿ej wysokoœci. Tylko nie myœl sobie, ¿e bêdziesz móg³ skakaæ bóg wie sk¹d!
      AI_Output (self, other,"DIA_ORG_833_Buster3_02_04"); //Akrobatyka przyda ci siê równie¿ w trakcie walki. Poka¿ê ci jak bardzo szybko zmniejszyæ lub zwiêkszyæ odleg³oœæ dziel¹c¹ ciê od przeciwnika. Powodzenia!
   };
};	