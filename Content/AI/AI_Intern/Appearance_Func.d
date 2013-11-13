//********************************
// Mdl_SetHeroAppearance
//****
// Just refresh hero appearance
//********************************
func void Mdl_SetHeroAppearance()
{
	var int face; var int body; var int armor; var c_item itm;
	itm = Npc_GetEquippedArmor(hero);
	armor = Hlp_GetInstanceID(itm);
   
	if(HerohasEquipedHunLArmor)
	{
		if(HERO_TATTOO==TATTOO_NONE) { body=9; }
		else if(HERO_TATTOO==TATTOO_BROTHERHOOD) { body=10; }
		else if(HERO_TATTOO==TATTOO_WARRIOR) { body=11; }		
		else if(HERO_TATTOO==TATTOO_LIZARDAGILITY) { body=12; }	
		else if(HERO_TATTOO==TATTOO_RUNE) { body=13; };					
	}
	else
	{
		if(HERO_TATTOO==TATTOO_NONE) { body=0; }
		else if(HERO_TATTOO==TATTOO_BROTHERHOOD) { body=14; }
		else if(HERO_TATTOO==TATTOO_WARRIOR) { body=6; }		
		else if(HERO_TATTOO==TATTOO_LIZARDAGILITY) { body=7; }	
		else if(HERO_TATTOO==TATTOO_RUNE) { body=8; };					
	};
   
	face=HERO_TATTOO+(HERO_BEARD*BEARD_MULTIPILER)+(HERO_HAIR*HAIR_MULTIPILER);	
	Mdl_SetVisualBody (hero,"hum_body_Naked0", body, 1,HERO_FACEMESH, face, 0, armor);	
};

func void Mdl_RecoverHeroAppearance()
{
	var int face; var int body; var int armor; var c_item itm; var int tatto;
	tatto=hero_last_face%10;
	itm = Npc_GetEquippedArmor(hero);
	armor = Hlp_GetInstanceID(itm);
	if(HerohasEquipedHunLArmor)
	{
		if(tatto==TATTOO_NONE) { body=9; }
		else if(tatto==TATTOO_BROTHERHOOD) { body=10; }
		else if(tatto==TATTOO_WARRIOR) { body=11; }		
		else if(tatto==TATTOO_LIZARDAGILITY) { body=12; }	
		else if(tatto==TATTOO_RUNE) { body=13; };					
	}
	else
	{
		if(tatto==TATTOO_NONE) { body=0; }
		else if(tatto==TATTOO_BROTHERHOOD) { body=14; }
		else if(tatto==TATTOO_WARRIOR) { body=6; }		
		else if(tatto==TATTOO_LIZARDAGILITY) { body=7; }	
		else if(tatto==TATTOO_RUNE) { body=8; };					
	};
   
	HERO_FACEMESH	=	HERO_FACEMESH_LASTAPLIED;	
	face=hero_last_face;	
	HERO_TATTOO=face%10;
	HERO_BEARD=((face%100)-HERO_TATTOO)/10;
	HERO_HAIR=(face-((HERO_BEARD*10)+HERO_TATTOO))/100;	
	Mdl_SetVisualBody (hero,"hum_body_Naked0", body, 1,HERO_FACEMESH, face, 0, armor);	
};

//*************
// DIALOGUES
//*************
INSTANCE PC_Stylist_End (c_Info)
{
	npc				= PC_Hero;
	nr				= 997;
	condition		= PC_Stylist_End_Condition;
	information		= PC_Stylist_End_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_Stylist_End_Condition()
{		
	if((MOBSIDIALOG < 31)&&(MOBSIDIALOG > 20))
	{		
		return 1;
	};
};

func VOID PC_Stylist_End_Info()
{
	var int id; id=hlp_getinstanceid(prestylize_armor);
	AI_EquipArmor				(hero,id);		
	Mdl_RecoverHeroAppearance();	
	AI_StopProcessInfos (self);
	Npc_SetAivar(self,AIV_INVINCIBLE,FALSE);
	MOBSIDIALOG = NONE;	
	changes_price=0;
};

INSTANCE PC_Stylist_Reset (c_Info)
{
	npc				= PC_Hero;
	nr				= 996;
	condition		= PC_Stylist_Reset_Condition;
	information		= PC_Stylist_Reset_Info;
	important		= 0;
	permanent		= 1;
	description		= "(PrzywrÛÊ)"; 
};

FUNC INT PC_Stylist_Reset_Condition()
{		
	if((MOBSIDIALOG < 31)&&(MOBSIDIALOG > 20))&&(changes_price_hair+changes_price_beard+changes_price_TATTOO>0)
	{		
		return 1;
	};
};

func VOID PC_Stylist_Reset_Info()
{
	Mdl_RecoverHeroAppearance();	
	changes_price=0;
	changes_price_beard=0;
	changes_price_TATTOO=0;
	changes_price_hair=0;
};

INSTANCE PC_Stylist_Accept (c_Info)
{
	npc				= PC_Hero;
	nr				= 995;
	condition		= PC_Stylist_Accept_Condition;
	information		= PC_Stylist_Accept_Info;
	important		= 0;
	permanent		= 1;
	description		= "(Zatwierdü)"; 
};

FUNC INT PC_Stylist_Accept_Condition()
{		
	if((MOBSIDIALOG < 31)&&(MOBSIDIALOG > 20))&&(changes_price_hair+changes_price_beard+changes_price_TATTOO>0)
	{		
		return 1;
	};
};

func VOID PC_Stylist_Accept_Info()
{
	changes_price=changes_price_hair+changes_price_beard+changes_price_TATTOO;
	hero_last_face=HERO_TATTOO+HERO_BEARD*BEARD_MULTIPILER+HERO_HAIR*HAIR_MULTIPILER;
	var int id; id=hlp_getinstanceid(prestylize_armor);
	AI_EquipArmor				(hero,id);			
	Mdl_SetHeroAppearance();
	HERO_FACEMESH_LAST=HERO_FACEMESH;	
	AI_StopProcessInfos (self);
	Npc_SetAivar(self,AIV_INVINCIBLE,FALSE);
	MOBSIDIALOG = NONE;			
	Npc_ClearAIQueue(stylist);
	B_ProcessInfos	(stylist);		
};

INSTANCE PC_Stylist_Tattoo (c_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_Stylist_Tattoo_Condition;
	information		= PC_Stylist_Tattoo_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zmiana: tatuaø"; 
};

FUNC INT PC_Stylist_Tattoo_Condition()
{		
	if((MOBSIDIALOG == STYLIST_1_DIALOG))//&&(MOBSIDIALOG > 20))
	{		
		return 1;
	};
};

func VOID PC_Stylist_Tattoo_Info()
{	
	AI_UnequipArmor	(hero);	
	Info_ClearChoices	(PC_Stylist_Tattoo);
	Info_AddChoice		(PC_Stylist_Tattoo,"Zatwierdü."	,PC_Stylist_Tattoo_Accept);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Anuluj"												,PC_Stylist_Tattoo_BACK);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Brak (50 bry≥ek rudy)."		,PC_Stylist_Tattoo_none);
	Info_AddChoice		(PC_Stylist_Tattoo,"Bractwo åniπcego (100 bry≥ek rudy)."			,PC_Stylist_Tattoo_BROTHERHOOD);
	//Info_AddChoice		(PC_Stylist_Tattoo,"ZnamiÍ wojownika (200 bry≥ek rudy)."	,PC_Stylist_Tattoo_WARRIOR);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Jaszczurcza skÛra (450 bry≥ek rudy)."	,PC_Stylist_Tattoo_LIZARD);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Runiczne ornamenty (750 bry≥ek rudy)."	,PC_Stylist_Tattoo_RUNE);	
};

func void PC_Stylist_Tattoo_Accept()
{
	Info_ClearChoices	(PC_Stylist_Tattoo);	
};

func void PC_Stylist_Tattoo_BACK()
{
	HERO_Tattoo=hero_last_face%10;
	Mdl_SetHeroAppearance();
	AI_UnequipArmor	(hero);		
	changes_price_Tattoo=0;	
	Info_ClearChoices	(PC_Stylist_Tattoo);
};

func void PC_Stylist_Tattoo_none()
{
	HERO_Tattoo=TATTOO_NONE;
	Mdl_SetHeroAppearance();
	AI_UnequipArmor	(hero);		
	changes_price_Tattoo=50;	
	Info_ClearChoices	(PC_Stylist_Tattoo);
	Info_AddChoice		(PC_Stylist_Tattoo,"Zatwierdü."	,PC_Stylist_Tattoo_Accept);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Anuluj"												,PC_Stylist_Tattoo_BACK);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Brak (50 bry≥ek rudy)."		,PC_Stylist_Tattoo_none);
	Info_AddChoice		(PC_Stylist_Tattoo,"Bractwo åniπcego (100 bry≥ek rudy)."			,PC_Stylist_Tattoo_BROTHERHOOD);
	//Info_AddChoice		(PC_Stylist_Tattoo,"ZnamiÍ wojownika (200 bry≥ek rudy)."	,PC_Stylist_Tattoo_WARRIOR);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Jaszczurcza skÛra (450 bry≥ek rudy)."	,PC_Stylist_Tattoo_LIZARD);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Runiczne ornamenty (750 bry≥ek rudy)."	,PC_Stylist_Tattoo_RUNE);	
};

func void PC_Stylist_Tattoo_BROTHERHOOD()
{
	HERO_Tattoo=TATTOO_BROTHERHOOD;
	Mdl_SetHeroAppearance();
	AI_UnequipArmor	(hero);		
	changes_price_Tattoo=100;	
	Info_ClearChoices	(PC_Stylist_Tattoo);
	Info_AddChoice		(PC_Stylist_Tattoo,"Zatwierdü."	,PC_Stylist_Tattoo_Accept);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Anuluj"												,PC_Stylist_Tattoo_BACK);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Brak (50 bry≥ek rudy)."		,PC_Stylist_Tattoo_none);
	Info_AddChoice		(PC_Stylist_Tattoo,"Bractwo åniπcego (100 bry≥ek rudy)."			,PC_Stylist_Tattoo_BROTHERHOOD);
	//Info_AddChoice		(PC_Stylist_Tattoo,"ZnamiÍ wojownika (200 bry≥ek rudy)."	,PC_Stylist_Tattoo_WARRIOR);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Jaszczurcza skÛra (450 bry≥ek rudy)."	,PC_Stylist_Tattoo_LIZARD);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Runiczne ornamenty (750 bry≥ek rudy)."	,PC_Stylist_Tattoo_RUNE);	
};

func void PC_Stylist_Tattoo_WARRIOR()
{
	HERO_Tattoo=TATTOO_WARRIOR;
	Mdl_SetHeroAppearance();
	AI_UnequipArmor	(hero);		
	changes_price_Tattoo=200;	
	Info_ClearChoices	(PC_Stylist_Tattoo);
	Info_AddChoice		(PC_Stylist_Tattoo,"Zatwierdü."	,PC_Stylist_Tattoo_Accept);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Anuluj"												,PC_Stylist_Tattoo_BACK);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Brak (50 bry≥ek rudy)."		,PC_Stylist_Tattoo_none);
	Info_AddChoice		(PC_Stylist_Tattoo,"Bractwo åniπcego (100 bry≥ek rudy)."			,PC_Stylist_Tattoo_BROTHERHOOD);
	//Info_AddChoice		(PC_Stylist_Tattoo,"ZnamiÍ wojownika (200 bry≥ek rudy)."	,PC_Stylist_Tattoo_WARRIOR);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Jaszczurcza skÛra (450 bry≥ek rudy)."	,PC_Stylist_Tattoo_LIZARD);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Runiczne ornamenty (750 bry≥ek rudy)."	,PC_Stylist_Tattoo_RUNE);	
};

func void PC_Stylist_Tattoo_LIZARD()
{
	HERO_Tattoo=TATTOO_LIZARDAGILITY;
	Mdl_SetHeroAppearance();
	AI_UnequipArmor	(hero);		
	changes_price_Tattoo=450;	
	Info_ClearChoices	(PC_Stylist_Tattoo);
	Info_AddChoice		(PC_Stylist_Tattoo,"Zatwierdü."	,PC_Stylist_Tattoo_Accept);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Anuluj"												,PC_Stylist_Tattoo_BACK);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Brak (50 bry≥ek rudy)."		,PC_Stylist_Tattoo_none);
	Info_AddChoice		(PC_Stylist_Tattoo,"Bractwo åniπcego (100 bry≥ek rudy)."			,PC_Stylist_Tattoo_BROTHERHOOD);
	//Info_AddChoice		(PC_Stylist_Tattoo,"ZnamiÍ wojownika (200 bry≥ek rudy)."	,PC_Stylist_Tattoo_WARRIOR);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Jaszczurcza skÛra (450 bry≥ek rudy)."	,PC_Stylist_Tattoo_LIZARD);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Runiczne ornamenty (750 bry≥ek rudy)."	,PC_Stylist_Tattoo_RUNE);	
};

func void PC_Stylist_Tattoo_RUNE()
{
	HERO_Tattoo=TATTOO_RUNE;
	Mdl_SetHeroAppearance();
	AI_UnequipArmor	(hero);		
	changes_price_Tattoo=750;	
	Info_ClearChoices	(PC_Stylist_Tattoo);
	Info_AddChoice		(PC_Stylist_Tattoo,"Zatwierdü."	,PC_Stylist_Tattoo_Accept);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Anuluj"												,PC_Stylist_Tattoo_BACK);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Brak (50 bry≥ek rudy)."		,PC_Stylist_Tattoo_none);
	Info_AddChoice		(PC_Stylist_Tattoo,"Bractwo åniπcego (100 bry≥ek rudy)."			,PC_Stylist_Tattoo_BROTHERHOOD);
	//Info_AddChoice		(PC_Stylist_Tattoo,"ZnamiÍ wojownika (200 bry≥ek rudy)."	,PC_Stylist_Tattoo_WARRIOR);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Jaszczurcza skÛra (450 bry≥ek rudy)."	,PC_Stylist_Tattoo_LIZARD);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Runiczne ornamenty (750 bry≥ek rudy)."	,PC_Stylist_Tattoo_RUNE);	
};

INSTANCE PC_Stylist_Beard (c_Info)
{
	npc				= PC_Hero;
	nr				= 10;
	condition		= PC_Stylist_Beard_Condition;
	information		= PC_Stylist_Beard_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zmiana: zarost"; 
};

FUNC INT PC_Stylist_Beard_Condition()
{		
	if((MOBSIDIALOG == STYLIST_1_DIALOG))//&&(MOBSIDIALOG > 20))
	{		
		return 1;
	};
};

func VOID PC_Stylist_Beard_Info()
{	
	AI_UnequipArmor	(hero);	
	Info_ClearChoices	(PC_Stylist_Beard);
	Info_AddChoice		(PC_Stylist_Beard,"Zatwierdü."	,PC_Stylist_Beard_Accept);	
	Info_AddChoice		(PC_Stylist_Beard,"Anuluj"												,PC_Stylist_Beard_BACK);	
	Info_AddChoice		(PC_Stylist_Beard,"Brak (5 bry≥ek rudy)."		,PC_Stylist_Beard_none);
	Info_AddChoice		(PC_Stylist_Beard,"Wπsy (10 bry≥ek rudy)."			,PC_Stylist_Beard_MOUSTACHEANDSTRIPE);
	Info_AddChoice		(PC_Stylist_Beard,"Wπsy i broda (10 bry≥ek rudy)."	,PC_Stylist_Beard_MOUSTACHEANDBEARD);	
};

func void PC_Stylist_Beard_Accept()
{
	Info_ClearChoices	(PC_Stylist_Beard);	
};

func void PC_Stylist_Beard_BACK()
{
	HERO_BEARD=((hero_last_face%100)-HERO_TATTOO)/10;
	Mdl_SetHeroAppearance();		
	AI_UnequipArmor	(hero);		
	changes_price_Beard=0;	
	Info_ClearChoices	(PC_Stylist_Beard);
};

func void PC_Stylist_Beard_none()
{
	HERO_Beard=BEARD_NONE;
	Mdl_SetHeroAppearance();
	AI_UnequipArmor	(hero);		
	changes_price_Beard=5;	
	Info_ClearChoices	(PC_Stylist_Beard);
	Info_AddChoice		(PC_Stylist_Beard,"Zatwierdü."	,PC_Stylist_Beard_Accept);	
	Info_AddChoice		(PC_Stylist_Beard,"Anuluj"												,PC_Stylist_Beard_BACK);	
	Info_AddChoice		(PC_Stylist_Beard,"Brak (5 bry≥ek rudy)."		,PC_Stylist_Beard_none);
	Info_AddChoice		(PC_Stylist_Beard,"Wπsy (10 bry≥ek rudy)."			,PC_Stylist_Beard_MOUSTACHEANDSTRIPE);
	Info_AddChoice		(PC_Stylist_Beard,"Wπsy i broda (10 bry≥ek rudy)."	,PC_Stylist_Beard_MOUSTACHEANDBEARD);		
};

func void PC_Stylist_Beard_MOUSTACHEANDSTRIPE()
{
	HERO_Beard=BEARD_MOUSTACHEANDSTRIPE;
	Mdl_SetHeroAppearance();
	AI_UnequipArmor	(hero);		
	changes_price_Beard=10;	
	Info_ClearChoices	(PC_Stylist_Beard);
	Info_AddChoice		(PC_Stylist_Beard,"Zatwierdü."	,PC_Stylist_Beard_Accept);	
	Info_AddChoice		(PC_Stylist_Beard,"Anuluj"												,PC_Stylist_Beard_BACK);	
	Info_AddChoice		(PC_Stylist_Beard,"Brak (5 bry≥ek rudy)."		,PC_Stylist_Beard_none);
	Info_AddChoice		(PC_Stylist_Beard,"Wπsy (10 bry≥ek rudy)."			,PC_Stylist_Beard_MOUSTACHEANDSTRIPE);
	Info_AddChoice		(PC_Stylist_Beard,"Wπsy i broda (10 bry≥ek rudy)."	,PC_Stylist_Beard_MOUSTACHEANDBEARD);		
};

func void PC_Stylist_Beard_MOUSTACHEANDBEARD()
{
	HERO_Beard=BEARD_MOUSTACHEANDBEARD;
	Mdl_SetHeroAppearance();
	AI_UnequipArmor	(hero);		
	changes_price_Beard=10;	
	Info_ClearChoices	(PC_Stylist_Beard);
	Info_AddChoice		(PC_Stylist_Beard,"Zatwierdü."	,PC_Stylist_Beard_Accept);	
	Info_AddChoice		(PC_Stylist_Beard,"Anuluj"												,PC_Stylist_Beard_BACK);	
	Info_AddChoice		(PC_Stylist_Beard,"Brak (5 bry≥ek rudy)."		,PC_Stylist_Beard_none);
	Info_AddChoice		(PC_Stylist_Beard,"Wπsy (10 bry≥ek rudy)."			,PC_Stylist_Beard_MOUSTACHEANDSTRIPE);
	Info_AddChoice		(PC_Stylist_Beard,"Wπsy i broda (10 bry≥ek rudy)."	,PC_Stylist_Beard_MOUSTACHEANDBEARD);		
};

INSTANCE PC_Stylist_Hair (c_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_Stylist_Hair_Condition;
	information		= PC_Stylist_Hair_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zmiana: w≥osy"; 
};

FUNC INT PC_Stylist_Hair_Condition()
{		
	if((MOBSIDIALOG == STYLIST_1_DIALOG))//&&(MOBSIDIALOG > 20))
	{		
		return 1;
	};
};

func VOID PC_Stylist_Hair_Info()
{	
	AI_UnequipArmor	(hero);	
	Info_ClearChoices	(PC_Stylist_Hair);
	Info_AddChoice		(PC_Stylist_Hair,"Zatwierdü."	,PC_Stylist_Hair_Accept);	
	Info_AddChoice		(PC_Stylist_Hair,"Anuluj"												,PC_Stylist_Hair_BACK);	
	Info_AddChoice		(PC_Stylist_Hair,"£ysy (10 bry≥ek rudy)."		,PC_Stylist_Hair_Bald);
	Info_AddChoice		(PC_Stylist_Hair,"KrÛtko ostrzyøony (25 bry≥ek rudy)."			,PC_Stylist_Hair_Short);
	Info_AddChoice		(PC_Stylist_Hair,"D≥ugie ciemne (50 bry≥ek rudy)."	,PC_Stylist_Hair_Normal);	
	Info_AddChoice		(PC_Stylist_Hair,"D≥ugie rude (75 bry≥ek rudy)."	,PC_Stylist_Hair_Red);			
};

func void PC_Stylist_Hair_Accept()
{
	Info_ClearChoices	(PC_Stylist_Hair);	
};

func void PC_Stylist_Hair_BACK()
{
	HERO_HAIR=(hero_last_face-((HERO_BEARD*10)+HERO_TATTOO))/100;	
	HERO_FACEMESH=HERO_FACEMESH_LASTAPLIED;		
	Mdl_SetHeroAppearance();	
	AI_UnequipArmor	(hero);		
	changes_price_hair=0;	
	Info_ClearChoices	(PC_Stylist_Hair);
};

func void PC_Stylist_Hair_Bald()
{
	HERO_HAIR=HAIR_BALD;
	HERO_FACEMESH="Hum_Head_Bald";
	Mdl_SetHeroAppearance();
	AI_UnequipArmor	(hero);		
	changes_price_hair=10;	
	Info_ClearChoices	(PC_Stylist_Hair);
	Info_AddChoice		(PC_Stylist_Hair,"Zatwierdü."	,PC_Stylist_Hair_Accept);	
	Info_AddChoice		(PC_Stylist_Hair,"Anuluj"												,PC_Stylist_Hair_BACK);	
	Info_AddChoice		(PC_Stylist_Hair,"£ysy (10 bry≥ek rudy)."		,PC_Stylist_Hair_Bald);
	Info_AddChoice		(PC_Stylist_Hair,"KrÛtko ostrzyøony (25 bry≥ek rudy)."			,PC_Stylist_Hair_Short);
	Info_AddChoice		(PC_Stylist_Hair,"D≥ugie ciemne (50 bry≥ek rudy)."	,PC_Stylist_Hair_Normal);	
	Info_AddChoice		(PC_Stylist_Hair,"D≥ugie rude (75 bry≥ek rudy)."	,PC_Stylist_Hair_Red);			
};

func void PC_Stylist_Hair_Short()
{
	HERO_HAIR=HAIR_SHORT;
	HERO_FACEMESH="Hum_Head_Bald";	
	Mdl_SetHeroAppearance();
	AI_UnequipArmor	(hero);		
	changes_price_hair=25;	
	Info_ClearChoices	(PC_Stylist_Hair);
	Info_AddChoice		(PC_Stylist_Hair,"Zatwierdü."	,PC_Stylist_Hair_Accept);	
	Info_AddChoice		(PC_Stylist_Hair,"Anuluj"												,PC_Stylist_Hair_BACK);	
	Info_AddChoice		(PC_Stylist_Hair,"£ysy (10 bry≥ek rudy)."		,PC_Stylist_Hair_Bald);
	Info_AddChoice		(PC_Stylist_Hair,"KrÛtko ostrzyøony (25 bry≥ek rudy)."			,PC_Stylist_Hair_Short);
	Info_AddChoice		(PC_Stylist_Hair,"D≥ugie ciemne (50 bry≥ek rudy)."	,PC_Stylist_Hair_Normal);	
	Info_AddChoice		(PC_Stylist_Hair,"D≥ugie rude (75 bry≥ek rudy)."	,PC_Stylist_Hair_Red);			
};

func void PC_Stylist_Hair_Normal()
{
	HERO_HAIR=HAIR_NORMAL;
	Mdl_SetHeroAppearance();	
	AI_UnequipArmor	(hero);		
	changes_price_hair=50;	
	Info_ClearChoices	(PC_Stylist_Hair);
	Info_AddChoice		(PC_Stylist_Hair,"Zatwierdü."	,PC_Stylist_Hair_A_Accept);	
	Info_AddChoice		(PC_Stylist_Hair,"Anuluj"												,PC_Stylist_Hair_A_BACK);		
	Info_AddChoice		(PC_Stylist_Hair,"Proste."		,PC_Stylist_Hair_bald1);
	Info_AddChoice		(PC_Stylist_Hair,"Kucyk."			,PC_Stylist_Hair_pony);
	Info_AddChoice		(PC_Stylist_Hair,"Grzywka."	,PC_Stylist_Hair_fighter);	
	Info_AddChoice		(PC_Stylist_Hair,"Grzywka i kucyk."	,PC_Stylist_Hair_thief);			
};

func void PC_Stylist_Hair_Red()
{
	HERO_HAIR=HAIR_RED;
	Mdl_SetHeroAppearance();	
	AI_UnequipArmor	(hero);		
	changes_price_hair=75;	
	Info_ClearChoices	(PC_Stylist_Hair);
	Info_AddChoice		(PC_Stylist_Hair,"Zatwierdü."	,PC_Stylist_Hair_A_Accept);	
	Info_AddChoice		(PC_Stylist_Hair,"Anuluj"												,PC_Stylist_Hair_A_BACK);		
	Info_AddChoice		(PC_Stylist_Hair,"Proste."		,PC_Stylist_Hair_bald1);
	Info_AddChoice		(PC_Stylist_Hair,"Kucyk."			,PC_Stylist_Hair_pony);
	Info_AddChoice		(PC_Stylist_Hair,"Grzywka."	,PC_Stylist_Hair_fighter);	
	Info_AddChoice		(PC_Stylist_Hair,"Grzywka i kucyk."	,PC_Stylist_Hair_thief);			
};

func void PC_Stylist_Hair_bald1()
{
	HERO_FACEMESH="Hum_Head_Bald";
	Mdl_SetHeroAppearance();	
	Info_ClearChoices	(PC_Stylist_Hair);
	Info_AddChoice		(PC_Stylist_Hair,"Zatwierdü."	,PC_Stylist_Hair_A_Accept);	
	Info_AddChoice		(PC_Stylist_Hair,"Anuluj"												,PC_Stylist_Hair_A_BACK);		
	Info_AddChoice		(PC_Stylist_Hair,"Proste."		,PC_Stylist_Hair_bald1);
	Info_AddChoice		(PC_Stylist_Hair,"Kucyk."			,PC_Stylist_Hair_pony);
	Info_AddChoice		(PC_Stylist_Hair,"Grzywka."	,PC_Stylist_Hair_fighter);	
	Info_AddChoice		(PC_Stylist_Hair,"Grzywka i kucyk."	,PC_Stylist_Hair_thief);		
};

func void PC_Stylist_Hair_pony()
{
   HERO_FACEMESH="Hum_Head_Pony";
   Mdl_SetHeroAppearance();	
   Info_ClearChoices	(PC_Stylist_Hair);	
   Info_AddChoice		(PC_Stylist_Hair,"Zatwierdü."	,PC_Stylist_Hair_A_Accept);	
   Info_AddChoice		(PC_Stylist_Hair,"Anuluj"		,PC_Stylist_Hair_A_BACK);		
   Info_AddChoice		(PC_Stylist_Hair,"Proste."		,PC_Stylist_Hair_bald1);
   Info_AddChoice		(PC_Stylist_Hair,"Kucyk."			,PC_Stylist_Hair_pony);
   Info_AddChoice		(PC_Stylist_Hair,"Grzywka."	,PC_Stylist_Hair_fighter);	
   Info_AddChoice		(PC_Stylist_Hair,"Grzywka i kucyk."	,PC_Stylist_Hair_thief);				
};

func void PC_Stylist_Hair_fighter()
{
   HERO_FACEMESH="Hum_Head_Fighter";
   Mdl_SetHeroAppearance();	
   Info_ClearChoices	(PC_Stylist_Hair);	
   Info_AddChoice		(PC_Stylist_Hair,"Zatwierdü."	,PC_Stylist_Hair_A_Accept);	
   Info_AddChoice		(PC_Stylist_Hair,"Anuluj"		,PC_Stylist_Hair_A_BACK);		
   Info_AddChoice		(PC_Stylist_Hair,"Proste."		,PC_Stylist_Hair_bald1);
   Info_AddChoice		(PC_Stylist_Hair,"Kucyk."			,PC_Stylist_Hair_pony);
   Info_AddChoice		(PC_Stylist_Hair,"Grzywka."	,PC_Stylist_Hair_fighter);	
   Info_AddChoice		(PC_Stylist_Hair,"Grzywka i kucyk."	,PC_Stylist_Hair_thief);				
};

func void PC_Stylist_Hair_thief()
{
   HERO_FACEMESH="Hum_Head_Thief";
   Mdl_SetHeroAppearance();		
   Info_ClearChoices	(PC_Stylist_Hair);
   Info_AddChoice		(PC_Stylist_Hair,"Zatwierdü."	,PC_Stylist_Hair_A_Accept);	
   Info_AddChoice		(PC_Stylist_Hair,"Anuluj"		,PC_Stylist_Hair_A_BACK);		
   Info_AddChoice		(PC_Stylist_Hair,"Proste."		,PC_Stylist_Hair_bald1);
   Info_AddChoice		(PC_Stylist_Hair,"Kucyk."			,PC_Stylist_Hair_pony);
   Info_AddChoice		(PC_Stylist_Hair,"Grzywka."	,PC_Stylist_Hair_fighter);	
   Info_AddChoice		(PC_Stylist_Hair,"Grzywka i kucyk."	,PC_Stylist_Hair_thief);				
};
		
func void PC_Stylist_Hair_A_Accept()
{
   Info_ClearChoices	(PC_Stylist_Hair);
   Info_AddChoice		(PC_Stylist_Hair,"Zatwierdü."	,PC_Stylist_Hair_Accept);	
   Info_AddChoice		(PC_Stylist_Hair,"Anuluj"												,PC_Stylist_Hair_BACK);	
   Info_AddChoice		(PC_Stylist_Hair,"£ysy (10 bry≥ek rudy)."		,PC_Stylist_Hair_Bald);
   Info_AddChoice		(PC_Stylist_Hair,"KrÛtko ostrzyøony (25 bry≥ek rudy)."			,PC_Stylist_Hair_Short);
   Info_AddChoice		(PC_Stylist_Hair,"D≥ugie ciemne (50 bry≥ek rudy)."	,PC_Stylist_Hair_Normal);	
   Info_AddChoice		(PC_Stylist_Hair,"D≥ugie rude (75 bry≥ek rudy)."	,PC_Stylist_Hair_Red);				   
};

func void PC_Stylist_Hair_A_BACK()
{
   Mdl_RecoverHeroAppearance();
   AI_UnequipArmor	(hero);		
   changes_price_hair=0;				
   Info_ClearChoices	(PC_Stylist_Hair);
   Info_AddChoice		(PC_Stylist_Hair,"Zatwierdü."	,PC_Stylist_Hair_Accept);	
   Info_AddChoice		(PC_Stylist_Hair,"Anuluj"												,PC_Stylist_Hair_BACK);	
   Info_AddChoice		(PC_Stylist_Hair,"£ysy (10 bry≥ek rudy)."		,PC_Stylist_Hair_Bald);
   Info_AddChoice		(PC_Stylist_Hair,"KrÛtko ostrzyøony (25 bry≥ek rudy)."			,PC_Stylist_Hair_Short);
   Info_AddChoice		(PC_Stylist_Hair,"D≥ugie ciemne (50 bry≥ek rudy)."	,PC_Stylist_Hair_Normal);	
   Info_AddChoice		(PC_Stylist_Hair,"D≥ugie rude (75 bry≥ek rudy)."	,PC_Stylist_Hair_Red);				
};		
		
INSTANCE PC_Stylist_Init (c_Info)

{
	npc				= PC_Hero;
	nr				= 933;
	condition		= PC_Stylist_Init_Condition;
	information		= PC_Stylist_Init_Info;
	important		= 1;
	permanent		= 1;
};

FUNC INT PC_Stylist_Init_Condition()
{		
	if((MOBSIDIALOG < 30)&&(MOBSIDIALOG > 20))&&(stylist_init)
	{		
		return 1;
	};
};

func VOID PC_Stylist_Init_Info()
{
	stylist_init=0;
};