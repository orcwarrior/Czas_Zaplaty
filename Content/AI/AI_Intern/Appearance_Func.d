// Utilities (Exctracted Methods)


func int Appr__FaceExtractTattoo(var int face) { return  face%10; };
func int Appr__FaceExtractBeard(var int face) { return (face%100)/10; };
func int Appr__FaceExtractHair(var int face) { return  face/100; };
func void Appr__FaceExtractComponents(var int faceCurrentNr)
{ // Niestety, nie wiedzia³em co z tym zrobiæ wiec wrzucam do zmiennych glob. _CURRENT :(
	APPR_HERO_TATTOO_CURRENT 	= 	Appr__FaceExtractTattoo(faceCurrentNr);
	APPR_HERO_BEARD_CURRENT 	=   Appr__FaceExtractBeard(faceCurrentNr);
	APPR_HERO_HAIR_CURRENT 		= 	Appr__FaceExtractHair(faceCurrentNr);
};
func int Appr__FacePackComponents(var int tattoo,var int beard, var int hair)
{
	return tattoo+(beard*BEARD_MULTIPILER)+(hair*HAIR_MULTIPILER);	
};
// Odœwie¿ wygl¹d bazuj¹c na wartoœci ustawionej w
// Appr_heroFace_Current
// ***
var int Appr_tmpHlp;
func void Appr_RefreshHeroAppearance()
{	
	// Definicje 
	var int body; var int armor; var c_item itmArmor;
	itmArmor = Npc_GetEquippedArmor(hero);
	if !Hlp_IsValidItem(itmArmor) { armor = -1; }
	else { 	armor = Hlp_GetInstanceID(itmArmor); };
	
	// Odœwie¿ zmienne "cz¹stkowe"
	Appr__FaceExtractComponents(Appr_heroFace_Current);
	
	// Ustaw odpowiedni numerek wersji dla ciala:
	if(Appr_HerohasEquipedHunLArmor)
	{ //Ork: Aha, to chyba w wypadku zbroi HUN_L zapewnia ten "pasek" do naramiennika na ciele...
		if(APPR_HERO_TATTOO_CURRENT==TATTOO_NONE) 			{ body=9; }
		else if(APPR_HERO_TATTOO_CURRENT==TATTOO_BROTHERHOOD) 	{ body=10; }
		else if(APPR_HERO_TATTOO_CURRENT==TATTOO_WARRIOR) 		{ body=11; }		
		else if(APPR_HERO_TATTOO_CURRENT==TATTOO_LIZARDAGILITY) { body=12; }	
		else if(APPR_HERO_TATTOO_CURRENT==TATTOO_RUNE)			{ body=13; };					
	}
	else
	{
		if(APPR_HERO_TATTOO_CURRENT==TATTOO_NONE) 			{ body=0; }
		else if(APPR_HERO_TATTOO_CURRENT==TATTOO_BROTHERHOOD)	{ body=14; }
		else if(APPR_HERO_TATTOO_CURRENT==TATTOO_WARRIOR) 		{ body=6; }		
		else if(APPR_HERO_TATTOO_CURRENT==TATTOO_LIZARDAGILITY) { body=7; }	
		else if(APPR_HERO_TATTOO_CURRENT==TATTOO_RUNE) 			{ body=8; };					
	};
	// Wybierz odpowiedni facemesh bazujac na "enumeratorze":
	var string headMesh; headMesh = "Hum_Head_Bald";
	if(APPR_HERO_FACEMESH_CURRENT == FACEMESH_FIGHTER) {
		headMesh = "Hum_Head_Fighter";
	}
	else if(APPR_HERO_FACEMESH_CURRENT == FACEMESH_BALD) {
		headMesh = "Hum_Head_Bald";
	}
	else if(APPR_HERO_FACEMESH_CURRENT == FACEMESH_PONY) {
		headMesh = "Hum_Head_Pony";
	}
	else if(APPR_HERO_FACEMESH_CURRENT == FACEMESH_THIEF) {
		headMesh = "Hum_Head_Thief";
	};
	//Hum_Head_Bald
	// Ustaw nowy wygl¹d:
	Appr_tmpHlp = (Appr_tmpHlp + 3)%100;
	// printscreen_s_i_s_i("Setting new Face: ",Appr_heroFace_Current," armor: ",armor,
	// 5,Appr_tmpHlp,20);
	if(armor != -1) {
		Npc_RemoveInvItem(hero,armor); // Ork: To powinno pomoc jeœli chodzi o temat duplikacji zbroji
	};
	Mdl_SetVisualBody (hero,"hum_body_Naked0", body, 1,headMesh, Appr_heroFace_Current, 0, armor);	
};
//********************************
// Appr_ApplyHeroAppearance
//****
// Just set hero appearance
//********************************
func void Appr_ApplyHeroAppearance()
{
	Appr_heroFace_Current =  Appr__FacePackComponents(APPR_HERO_TATTOO_CURRENT, APPR_HERO_BEARD_CURRENT,APPR_HERO_HAIR_CURRENT);	
	Appr_RefreshHeroAppearance();
};

func void Appr_RecoverHeroAppearance()
{
	Appr_heroFace_Current = Appr_heroFace_Previous;	
	APPR_HERO_FACEMESH_CURRENT = APPR_HERO_FACEMESH_LAST;
	Appr_RefreshHeroAppearance();	
};

// Ork: Wczesniej: EVT_Stylist w pliku MiscEVT.d
// Obecnie: Wywo³ywane przez
func void Appr_StartMonologue()
{
	// bloops=bloops+1; //bloops... WTF? anway..
	// if(bloops==2)
	// {
	// 	// B_PrintDebug("orly?");	// Japierdole...	
	// }
	// else if(bloops==3)
	// {
	// 	B_PrintDebug("yarly!"); // Ok, wiêc to pewnie czeka 3 obroty jakiejœ smiesznej pêtli na rozpoczêcie nowego dialogu
								// -ork
		MOBSIDIALOG = STYLIST_1_DIALOG;			
		Appr_preStylizationArmor = Npc_GetEquippedArmor(hero);
		Appr_heroFace_Previous = Appr_heroFace_Current; // Ustawiamy ostatnia "zakupiona" twarz na obecna
		APPR_HERO_FACEMESH_LAST = APPR_HERO_FACEMESH_CURRENT;
		AI_TurnAway(hero,Appr_Stylist);
		AI_UnequipArmor	(hero);	
		B_ProcessInfos	(hero);	
		// Ustaw tymczasow¹ rutyne styliscie: (zeby nigdzie nie spierdolil)
		AI_StartState(Appr_Stylist,ZS_StylistWait,1,"");
	// };
	
	// B_PrintDebug(inttostring(Appr_heroFace_Current));
	// Wld_SendTrigger("STYLIST");		
};


// Dialog [Monolog]
// ****
func void Appr_Init()
{
	// After game load var will be set to 2
	if(Appr_Inited==true) 
	{ 
		Appr_Inited = 2; //re-init
		return;
	};
	
	Print("APPEARENCE INIT");
	Appr_Inited = true;
	APPR_HERO_TATTOO_CURRENT = 0;
	APPR_HERO_BEARD_CURRENT = 4;
	APPR_HERO_HAIR_CURRENT = 3;
	APPR_HERO_FACEMESH_CURRENT = FACEMESH_FIGHTER;
	Appr_heroFace_Current=340;
	APPR_HERO_FACEMESH_LAST=APPR_HERO_FACEMESH_CURRENT;	   
	Appr_tmpHlp = 1;
};

// Call it by all stylist dialogs when it ends(in fact it start and then just end)
// So There I can reset prices and signal to trigger that Monologue need to be started -orc
func void PC_Stylist_Dialog_Init()
{
	Appr_Wait4Monolouge = true;
	Appr_changesPriceAll = 0;
	Appr_changesPriceHair = 0;
	Appr_changesPriceBeard = 0;
	Appr_changesPriceTattoo = 0;
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
	description		= "(Anuluj)"; 
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
	var int id; id=hlp_getinstanceid(Appr_preStylizationArmor);
	AI_EquipArmor				(hero,id);		
	Appr_RecoverHeroAppearance();	
	AI_StopProcessInfos (self);
	Npc_SetAivar(self,AIV_INVINCIBLE,FALSE);
	MOBSIDIALOG = NONE;	
	Appr_changesPriceAll=0;
	Appr_CurrentStylist_Posibilities = Appr_Posibilities_Base; // Resetuj mo¿liwosci stylisty.
};

INSTANCE PC_Stylist_Reset (c_Info)
{
	npc				= PC_Hero;
	nr				= 996;
	condition		= PC_Stylist_Reset_Condition;
	information		= PC_Stylist_Reset_Info;
	important		= 0;
	permanent		= 1;
	description		= "(Przywróæ)"; 
};

FUNC INT PC_Stylist_Reset_Condition()
{		
	if((MOBSIDIALOG < 31)&&(MOBSIDIALOG > 20))&&(Appr_changesPriceHair+Appr_changesPriceBeard+Appr_changesPriceTattoo>0)
	{		
		return 1;
	};
};

func VOID PC_Stylist_Reset_Info()
{
	Appr_RecoverHeroAppearance();	
	Appr_changesPriceAll=0;
	Appr_changesPriceBeard=0;
	Appr_changesPriceTattoo=0;
	Appr_changesPriceHair=0;
};

INSTANCE PC_Stylist_Accept (c_Info)
{
	npc				= PC_Hero;
	nr				= 995;
	condition		= PC_Stylist_Accept_Condition;
	information		= PC_Stylist_Accept_Info;
	important		= 0;
	permanent		= 1;
	description		= "(ZatwierdŸ)"; 
};

FUNC INT PC_Stylist_Accept_Condition()
{		
	if((MOBSIDIALOG < 31)&&(MOBSIDIALOG > 20))&&(Appr_changesPriceHair+Appr_changesPriceBeard+Appr_changesPriceTattoo>0)
	{		
		return 1;
	};
};

func VOID PC_Stylist_Accept_Info()
{
	Appr_changesPriceAll	= Appr_changesPriceHair+Appr_changesPriceBeard+Appr_changesPriceTattoo;
	Appr_heroFace_Current 	= APPR_HERO_TATTOO_CURRENT+(APPR_HERO_BEARD_CURRENT*BEARD_MULTIPILER)+(APPR_HERO_HAIR_CURRENT*HAIR_MULTIPILER);
	var int id; id=hlp_getinstanceid(Appr_preStylizationArmor);
	AI_EquipArmor				(hero,id);			
	Appr_ApplyHeroAppearance();
	//Ork: To powinno pomoc (po przywroceniu, mesh pozostawa³)
	//APPR_HERO_FACEMESH_LAST=APPR_HERO_FACEMESH_CURRENT;	
	AI_StopProcessInfos (self);
	Npc_SetAivar(self,AIV_INVINCIBLE,FALSE);
	MOBSIDIALOG = NONE;			
	Npc_ClearAIQueue(Appr_Stylist);
	B_ProcessInfos	(Appr_Stylist);	
	Appr_CurrentStylist_Posibilities = Appr_Posibilities_Base; // Resetuj mo¿liwosci stylisty.	
};


// Zestaw "do wyboru" tatuazy, zrobilem exctract method bo to by³o 
// przeciez okropne w poprzedniej formie..
func void PC_Stylist_CreateChoices_Tattoo()
{
	Info_ClearChoices	(PC_Stylist_Tattoo);
	Info_AddChoice		(PC_Stylist_Tattoo,"ZatwierdŸ."	,PC_Stylist_Tattoo_Accept);	
	Info_AddChoice		(PC_Stylist_Tattoo,"Anuluj"												,PC_Stylist_Tattoo_BACK);	
	if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Tattoo_None))
	{
		Info_AddChoice		(PC_Stylist_Tattoo,"Brak (50 bry³ek rudy)."				,PC_Stylist_Tattoo_none);
	};
	if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Tattoo_Brotherhood))
	{
		Info_AddChoice		(PC_Stylist_Tattoo,"Bractwo Œni¹cego (100 bry³ek rudy).",PC_Stylist_Tattoo_BROTHERHOOD);
	};
	// if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Tattoo_Warrior))
	// {
	// 	Info_AddChoice		(PC_Stylist_Tattoo,"Znamiê wojownika (200 bry³ek rudy)."	,PC_Stylist_Tattoo_WARRIOR);
	// };
	if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Tattoo_LizardAgi))
	{
		Info_AddChoice		(PC_Stylist_Tattoo,"Jaszczurcza skóra (450 bry³ek rudy)."	,PC_Stylist_Tattoo_LIZARD);	
	};
	if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Tattoo_Rune))
	{
		Info_AddChoice		(PC_Stylist_Tattoo,"Runiczne ornamenty (750 bry³ek rudy)."	,PC_Stylist_Tattoo_RUNE);	
	};
};


INSTANCE PC_Stylist_Tattoo (c_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_Stylist_Tattoo_Condition;
	information		= PC_Stylist_Tattoo_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zmiana: tatua¿"; 
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
	PC_Stylist_CreateChoices_Tattoo();	
};

func void PC_Stylist_Tattoo_Accept()
{
	Info_ClearChoices	(PC_Stylist_Tattoo);	
};

func void PC_Stylist_Tattoo_BACK()
{
	APPR_HERO_TATTOO_CURRENT = Appr__FaceExtractTattoo(Appr_heroFace_Previous);
	Appr_ApplyHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceTattoo=0;	
	Info_ClearChoices	(PC_Stylist_Tattoo);
};

func void PC_Stylist_Tattoo_none()
{
	APPR_HERO_TATTOO_CURRENT=TATTOO_NONE;
	Appr_ApplyHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceTattoo=50;	
	PC_Stylist_CreateChoices_Tattoo();
};

func void PC_Stylist_Tattoo_BROTHERHOOD()
{
	APPR_HERO_TATTOO_CURRENT=TATTOO_BROTHERHOOD;
	Appr_ApplyHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceTattoo=100;	
	PC_Stylist_CreateChoices_Tattoo();
};

func void PC_Stylist_Tattoo_WARRIOR()
{
	APPR_HERO_TATTOO_CURRENT=TATTOO_WARRIOR;
	Appr_ApplyHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceTattoo=200;	
	PC_Stylist_CreateChoices_Tattoo();
};

func void PC_Stylist_Tattoo_LIZARD()
{
	APPR_HERO_TATTOO_CURRENT=TATTOO_LIZARDAGILITY;
	Appr_ApplyHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceTattoo=450;	
	PC_Stylist_CreateChoices_Tattoo();	
};

func void PC_Stylist_Tattoo_RUNE()
{
	APPR_HERO_TATTOO_CURRENT=TATTOO_RUNE;
	Appr_ApplyHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceTattoo=750;	
	PC_Stylist_CreateChoices_Tattoo();
};

// Broooda
// ***
func void PC_Stylist_CreateChoices_Beard()
{
	Info_ClearChoices	(PC_Stylist_Beard);
	Info_AddChoice		(PC_Stylist_Beard,"ZatwierdŸ."	,PC_Stylist_Beard_Accept);	
	Info_AddChoice		(PC_Stylist_Beard,"Anuluj"												,PC_Stylist_Beard_BACK);	
	
	if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Beard_None))
	{
		Info_AddChoice		(PC_Stylist_Beard,"Brak (5 bry³ek rudy)."		,PC_Stylist_Beard_none);
	};
	if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Beard_Mouthstache))
	{
		Info_AddChoice		(PC_Stylist_Beard,"W¹sy (10 bry³ek rudy)."			,PC_Stylist_Beard_MOUSTACHEANDSTRIPE);
	};
	if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Beard_MouthstacheBrd))
	{
		Info_AddChoice		(PC_Stylist_Beard,"W¹sy i broda (10 bry³ek rudy)."	,PC_Stylist_Beard_MOUSTACHEANDBEARD);
	};		
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
	//Ork: W przypadku zarostu, mo¿na sobie darowaæ...
	//AI_UnequipArmor	(hero);	
	PC_Stylist_CreateChoices_Beard();
};

func void PC_Stylist_Beard_Accept()
{
	Info_ClearChoices	(PC_Stylist_Beard);	
};

func void PC_Stylist_Beard_BACK()
{
	APPR_HERO_BEARD_CURRENT = Appr__FaceExtractBeard(Appr_heroFace_Previous);
	Appr_ApplyHeroAppearance();		
	AI_UnequipArmor	(hero);		
	Appr_changesPriceBeard=0;	
	Info_ClearChoices	(PC_Stylist_Beard);
};

func void PC_Stylist_Beard_none()
{
	APPR_HERO_BEARD_CURRENT=BEARD_NONE;
	Appr_ApplyHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceBeard=5;	
	PC_Stylist_CreateChoices_Beard();		
};

func void PC_Stylist_Beard_MOUSTACHEANDSTRIPE()
{
	APPR_HERO_BEARD_CURRENT=BEARD_MOUSTACHEANDSTRIPE;
	Appr_ApplyHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceBeard=10;	
	PC_Stylist_CreateChoices_Beard();	
};

func void PC_Stylist_Beard_MOUSTACHEANDBEARD()
{
	APPR_HERO_BEARD_CURRENT=BEARD_MOUSTACHEANDBEARD;
	Appr_ApplyHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceBeard=10;		
	PC_Stylist_CreateChoices_Beard();
};


// W³osy + W³osy Mesh
// ***
// Pierwszy dialog wybieramy dlugoœæ (kolor) w³osów:
func void PC_Stylist_CreateChoices_Hair()
{
	Info_ClearChoices	(PC_Stylist_Hair);
	Info_AddChoice		(PC_Stylist_Hair,"ZatwierdŸ."							,PC_Stylist_Hair_Accept);	
	Info_AddChoice		(PC_Stylist_Hair,"Anuluj"								,PC_Stylist_Hair_BACK);		
	
	if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Hair_Bald))
	{
		Info_AddChoice		(PC_Stylist_Hair,"£ysy (10 bry³ek rudy)."				,PC_Stylist_Hair_Bald);
	};		
	if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Hair_Short))
	{
		Info_AddChoice		(PC_Stylist_Hair,"Krótko ostrzy¿ony (25 bry³ek rudy)."	,PC_Stylist_Hair_Short);
	};		
	if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Hair_Normal))
	{
		Info_AddChoice		(PC_Stylist_Hair,"D³ugie ciemne (50 bry³ek rudy)."		,PC_Stylist_Hair_Normal);
	};	
	if(C_VarHasFlag(Appr_CurrentStylist_Posibilities, Appr_PossibFlags_Hair_Red))
	{
		Info_AddChoice		(PC_Stylist_Hair,"D³ugie rude (75 bry³ek rudy)."		,PC_Stylist_Hair_Red);	
	};		
};
// Po wyborze d³ugoœci w³osów, jeœli wybralismy NIE ³yse, krótkie
// pojawi siê ten dialog z wyborem "u³ozenia w³osów" czyli face-mesha:
func void PC_Stylist_CreateChoices_HairMesh()
{
	Info_ClearChoices	(PC_Stylist_Hair);
	Info_AddChoice		(PC_Stylist_Hair,"ZatwierdŸ."		,PC_Stylist_HairMesh_Accept);	
	Info_AddChoice		(PC_Stylist_Hair,"Anuluj"			,PC_Stylist_Hair_A_BACK);		
	Info_AddChoice		(PC_Stylist_Hair,"Proste."			,PC_Stylist_Hair_bald1);
	Info_AddChoice		(PC_Stylist_Hair,"Kucyk."			,PC_Stylist_Hair_pony);
	Info_AddChoice		(PC_Stylist_Hair,"Grzywka."			,PC_Stylist_Hair_fighter);	
	Info_AddChoice		(PC_Stylist_Hair,"Grzywka i kucyk."	,PC_Stylist_Hair_thief);		
};

INSTANCE PC_Stylist_Hair (c_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_Stylist_Hair_Condition;
	information		= PC_Stylist_Hair_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zmiana: w³osy"; 
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
	PC_Stylist_CreateChoices_Hair();		
};

func void PC_Stylist_Hair_Accept()
{
	Info_ClearChoices	(PC_Stylist_Hair);	
};

func void PC_Stylist_Hair_BACK()
{
	APPR_HERO_HAIR_CURRENT = Appr__FaceExtractHair(Appr_heroFace_Previous);
	APPR_HERO_FACEMESH_CURRENT=APPR_HERO_FACEMESH_LAST;		
	Appr_ApplyHeroAppearance();	
	AI_UnequipArmor	(hero);		
	Appr_changesPriceHair=0;	
	Info_ClearChoices	(PC_Stylist_Hair);
};


func void PC_Stylist_Hair_Bald()
{
	APPR_HERO_HAIR_CURRENT=HAIR_BALD;
	APPR_HERO_FACEMESH_CURRENT = FACEMESH_BALD;
	Appr_ApplyHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceHair=10;	
	PC_Stylist_CreateChoices_Hair();		
};

func void PC_Stylist_Hair_Short()
{
	APPR_HERO_HAIR_CURRENT=HAIR_SHORT;
	APPR_HERO_FACEMESH_CURRENT = FACEMESH_BALD;
	Appr_ApplyHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceHair=25;	
	PC_Stylist_CreateChoices_Hair();			
};

// Ork: Tutaj mamy dodatkowo wybór faceMesha:
func void PC_Stylist_Hair_Normal()
{
	APPR_HERO_HAIR_CURRENT=HAIR_NORMAL;
	Appr_ApplyHeroAppearance();	
	AI_UnequipArmor	(hero);		
	Appr_changesPriceHair=50;	
	PC_Stylist_CreateChoices_HairMesh();				
};

func void PC_Stylist_Hair_Red()
{
	APPR_HERO_HAIR_CURRENT=HAIR_RED;
	Appr_ApplyHeroAppearance();	
	AI_UnequipArmor	(hero);		
	Appr_changesPriceHair=75;	
	PC_Stylist_CreateChoices_HairMesh();			
};

func void PC_Stylist_Hair_bald1()
{
	APPR_HERO_FACEMESH_CURRENT = FACEMESH_BALD;
	Appr_ApplyHeroAppearance();	
	Info_ClearChoices	(PC_Stylist_Hair);
	//PC_Stylist_CreateChoices_HairMesh();		
};

func void PC_Stylist_Hair_pony()
{
	APPR_HERO_FACEMESH_CURRENT = FACEMESH_PONY;
	Appr_ApplyHeroAppearance();	
	Info_ClearChoices	(PC_Stylist_Hair);
	//PC_Stylist_CreateChoices_HairMesh();				
};

func void PC_Stylist_Hair_fighter()
{
	APPR_HERO_FACEMESH_CURRENT = FACEMESH_FIGHTER;
	Appr_ApplyHeroAppearance();	
	Info_ClearChoices	(PC_Stylist_Hair);
	//PC_Stylist_CreateChoices_HairMesh();			
};

func void PC_Stylist_Hair_thief()
{
	APPR_HERO_FACEMESH_CURRENT = FACEMESH_THIEF;
	Appr_ApplyHeroAppearance();		
	Info_ClearChoices	(PC_Stylist_Hair);
	//PC_Stylist_CreateChoices_HairMesh();			
};

func void PC_Stylist_HairMesh_Accept()
{ 
	Info_ClearChoices	(PC_Stylist_Hair);
	//PC_Stylist_CreateChoices_Hair();			   
};

func void PC_Stylist_Hair_A_BACK()
{
	Appr_RecoverHeroAppearance();
	AI_UnequipArmor	(hero);		
	Appr_changesPriceHair=0;	
	PC_Stylist_CreateChoices_Hair();   
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
	if((MOBSIDIALOG < 30)&&(MOBSIDIALOG > 20))&&(Appr_stylistInit)
	{		
		return 1;
	};
};

func VOID PC_Stylist_Init_Info()
{
	Appr_stylistInit=0;
};