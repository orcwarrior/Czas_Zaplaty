// *********************************************************************
// main menu (startup)
// *********************************************************************
INSTANCE MENU_MAIN(C_MENU_DEF) 
{
	backpic			= "menu_book.tga";
	musictheme		= "SYS_Menu";
	
 	items[0]		= "MENUITEM_MAIN_HEADLINE";
 	items[1]		= "MENUITEM_MAIN_HEADLINE2";
	items[2]		= "MENUITEM_MAIN_NEWGAME";
	items[3]		= "MENUITEM_MAIN_SAVEGAME_LOAD";	
	items[4]		= "MENUITEM_MAIN_SAVEGAME_SAVE";	
	items[5]		= "MENUITEM_MAIN_RESUME"; 
	items[6]		= "MENUITEM_MAIN_OPTIONS";
	items[7]		= "MENUITEM_MAIN_INTRO"; 
	items[8]		= "MENUITEM_MAIN_CREDITS";	
	items[9]		= "MENUITEM_MAIN_EXIT"; 
	items[149]		= "MENUITEM_MAIN_VER";
	

	defaultOutGame	= 2;	// NEWGAME
	defaultInGame	= 4;	// SAVEGAME
	
	flags = MENU_SHOW_INFO;
};
// INSTANCE MENU_MAIN(C_MENU_DEF) 
// {
// 	//backpic			= MENU_BACK_PIC;
// 	musictheme		= "SYS_Menu";
// 	
// 	items[0]		= "MENUITEM_MAIN_HEADLINE";
// 	items[1]		= "MENUITEM_MAIN_HEADLINE2";
// 	items[2]		= "MENUITEM_MAIN_NEWGAME";
// 	items[3]		= "MENUITEM_MAIN_SAVEGAME_LOAD";	
// 	items[4]		= "MENUITEM_MAIN_SAVEGAME_SAVE";	
// 	items[5]		= "MENUITEM_MAIN_RESUME"; 
// 	items[6]		= "MENUITEM_MAIN_OPTIONS";
// 	items[7]		= "MENUITEM_MAIN_INTRO"; 
// 	items[8]		= "MENUITEM_MAIN_CREDITS";	
// 	items[9]		= "MENUITEM_MAIN_EXIT"; 
// 	
// 	defaultOutGame	= 2;	// NEWGAME
// 	defaultInGame	= 4;	// SAVEGAME
// 	
// 	flags = flags | MENU_SHOW_INFO;
// };
	
	
const int MENU_MAIN_DY = 350;
const int MENU_MAIN_Y = 4500;
const int MENU_MAIN_X = 500;
const int menuitm_flg = MENU_DONTSCALE_DIM | IT_SELECTABLE; 
//
// NEW GAME
//
instance MENUITEM_MAIN_NEWGAME(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Nowa gra";
	// text[1]		= "Rozpocznij now¹ przygodê.";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		= MENU_MAIN_X;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*0;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_CLOSE;
	onSelAction_S[0]= "NEW_GAME";
	// Weitere Eigenschaften
	flags			= menuitm_flg;
};
instance MENUITEM_MAIN_VER(C_MENU_ITEM_DEF) 
{
	text[0]		= 	MENU_VERSION;
	posx 		= 	1900; // see dimx of MENU_ITEM_DAY!!
	posy		= 	7780;
	fontName	=	MENU_FONT_VERSION;
	flags		= 	flags & ~IT_SELECTABLE;
	
};


//
// LOAD & SAVE GAME
//


INSTANCE MENUITEM_MAIN_SAVEGAME_LOAD(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Wczytaj";
	// text[1]		=	"Wczytaj zapisan¹ grê.";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		=  MENU_MAIN_X;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*1;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction_S[0]= "MENU_SAVEGAME_LOAD";
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	// Weitere Eigenschaften
	flags			= menuitm_flg;
};

instance MENUITEM_MAIN_SAVEGAME_SAVE(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Zapisz";
	// text[1]		= "Zapisz bie¿¹c¹ grê.";  // Kommentar
	
	// Positionen  und Dimensionen
	posx		= MENU_MAIN_X;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*2;
	dimx		=  8100;	dimy		= 750;
	// Aktionen
	onSelAction_S[0]= "MENU_SAVEGAME_SAVE";
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	// Weitere Eigenschaften
	flags			= menuitm_flg | IT_ONLY_IN_GAME;
};


//
// RESUME
//


INSTANCE MENUITEM_MAIN_RESUME(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Dalej";
	// text[1]		=   "Powrót do gry.";  // Kommentar
	
	// Position und Dimension
	posx		=	MENU_MAIN_X;		posy		=	MENU_MAIN_Y + MENU_MAIN_DY*3;
	dimx		=	8192;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;
	// Weitere Eigenschaften
	flags			= menuitm_flg | IT_ONLY_IN_GAME;
};


//
// OPTIONS, INTRO & CREDITS
//

instance MENUITEM_MAIN_OPTIONS(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Ustawienia";
	// text[1]		= "Ustawienia dŸwiêku, grafiki i klawiatury.";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		= MENU_MAIN_X;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*4;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_OPTIONS";
	// Weitere Eigenschaften
	flags			= menuitm_flg;
};


instance MENUITEM_MAIN_INTRO(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Wprowadzenie";
	// text[1]		= "Odtwórz sekwencjê wprowadzaj¹c¹.";
	// Positionen  und Dimensione	
	posx		= MENU_MAIN_X;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*5;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	
	// Ork: LOLWUT?
	onEventAction[EVENT_EXECUTE] 	= ShowIntro;
	// Weitere Eigenschaften
	flags			= menuitm_flg;
};

INSTANCE MENUITEM_MAIN_CREDITS(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Autorzy";
	// text[1]		= "Wyœwietl autorów gry.";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		= MENU_MAIN_X;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*6;
	dimx		= 8100;		dimy		=  750;	
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onEventAction[EVENT_EXECUTE] = ShowCredits;
	// Weitere Eigenschaften
	flags			= menuitm_flg;
};

//
// EXIT
//


INSTANCE MENUITEM_MAIN_EXIT(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Wyjœcie";
	// text[1]		= "Powrót do odch³ani systemu Windows.";  // Kommentar
	
	// Positionen  und Dimensionen
	posx		= MENU_MAIN_X;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*7;	
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_LEAVE_GAME";
	// Weitere Eigenschaften
	flags			= menuitm_flg;
};



//
// Statische Items
//

INSTANCE MENUITEM_MAIN_HEADLINE2(C_MENU_ITEM_DEF) 
{
	backPic		= "menu_logo.tga";
	// Positionen  und Dimensionen	
	posx		=  0;		posy		=  0;	
	dimx		= 8191;		dimy		= 8191;		
	// Weitere Eigenschaften
	//alphaMode 		= "BLEND";	
	alpha			= 255;		

	flags			= IT_TXT_CENTER | MENU_EXCLUSIVE;	
};

INSTANCE MENUITEM_MAIN_HEADLINE(C_MENU_ITEM_DEF) 
{
//	backPic		= "menu_gothicshadow.tga";
	// Positionen  und Dimensionen	
	posx		=  250;		posy		=  500;
	dimx		= 7900;		dimy		= 2300;				
	// Weitere Eigenschaften
	alphaMode		= "BLEND";	
	alpha			= 220;			
	flags			= menuitm_flg;
	flags			= flags & ~IT_SELECTABLE;
};


func int ShowIntro()
{
	PlayVideo("intro.bik");
	return 1;
};

func int ShowCredits()
{
	PlayVideo("CZ_credits.bik");
	PlayVideo("credits.bik");
	return 1;
};