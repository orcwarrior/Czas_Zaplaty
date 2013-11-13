// *********************************************************************
// change keys menu
// *********************************************************************

instance MENU_OPT_CONTROLS2(C_MENU_DEF) 
{
	backpic			= MENU_BACK_PIC;
	
	items[0]		= "MENU_ITEM_CHG_KEYS_HEADLINE2";
	
	// Items
	
	items[1]		= "MENU_ITEM_KEY_LAMEHP";
 	items[2]		= "MENU_ITEM_KEY_LAMEMP";
 	items[3]		= "MENU_ITEM_KEY_PREVA";
 	items[4]		= "MENU_ITEM_KEY_NEXTA";
 	items[5]		= "MENU_ITEM_KEY_RUNESWD";
 	
 	items[6]		= "MENU_ITEM_KEY_PFollow";	 			
 	items[7]		= "MENU_ITEM_KEY_PWait";	
 	items[8]		= "MENU_ITEM_KEY_PHeal";	
 	items[9]		= "MENU_ITEM_KEY_PNear";	
 	items[10]		= "MENU_ITEM_KEY_PFar";
 	items[11]		= "MENU_ITEM_KEY_PFav";		
// 	items[12]		= "MENU_ITEM_KEY_LOOK";
//	items[13]		= "MENU_ITEM_KEY_LOOK_FP";
// 	
// 	items[14]		= "MENU_ITEM_KEY_INVENTORY";	
// 	items[15]		= "MENU_ITEM_KEY_SCREEN_STATUS";
// 	items[16]		= "MENU_ITEM_KEY_SCREEN_LOG";
		
	// Input
	
	items[17]		= "MENU_ITEM_INP_LAMEHP";
 	items[18]		= "MENU_ITEM_INP_LAMEMP";
 	items[19]		= "MENU_ITEM_INP_PREVA";
 	items[20]		= "MENU_ITEM_INP_NEXTA";
 	items[21]		= "MENU_ITEM_INP_RuneSWD";
 	items[22]		= "MENU_ITEM_INP_PFollow";	 			
 	items[23]		= "MENU_ITEM_INP_PWait";	     
 	items[24]		= "MENU_ITEM_INP_PHeal";	     
 	items[25]		= "MENU_ITEM_INP_PNear";	     
 	items[26]		= "MENU_ITEM_INP_PFar";       
 	items[27]		= "MENU_ITEM_INP_PFav";		     
// 	items[28]		= "MENU_ITEM_INP_LOOK";		
// 	items[29]		= "MENU_ITEM_INP_LOOK_FP";		
// 	
// 	items[30]		= "MENU_ITEM_INP_INVENTORY";	
// 	items[31]		= "MENU_ITEM_INP_SCREEN_STATUS";
// 	items[32]		= "MENU_ITEM_INP_SCREEN_LOG";
	
	// 
	
	items[33]		= "MENU_ITEM_CHG_KEYS_HOWTO";			
	
	items[35]		= "MENUITEM_CHG_KEYS_PREV";
		

	flags = flags | MENU_SHOW_INFO;
	flags		= 	flags & ~MENU_DONTSCALE_DIM;
	
};
const int ctrl_sp1_0 	= 1400;						// 1/8
const int ctrl_sp1_3 	= ctrl_sp1_1 + 2250;		// 1.Spalte (Taste)
const int ctrl_sp1_4 	= ctrl_sp1_3 + 250;		// 1.Spalte (Taste)
const int line_step = 170;

INSTANCE MENU_ITEM_CHG_KEYS_HEADLINE2(C_MENU_ITEM_DEF) 
{
	text[0]		=	"USTAWIENIA KLAWIATURY 2";
	type		=	MENU_ITEM_TEXT;	
	// Position und Dimension	
	posx		=	MENU_OPT_X;		posy		=	MENU_TITLE_Y;
	dimx		=	8192;
	
	flags		= flags & ~IT_SELECTABLE;
};


	

//
// Group 1
//

INSTANCE MENU_ITEM_KEY_LAMEHP(C_MENU_ITEM_DEF)
{
	text[0]			=	"Szybka Mikstura ¯ycia";
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 1 + CTRL_GROUP1;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENU_ITEM_INP_LAMEHP";	
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};

INSTANCE MENU_ITEM_KEY_LAMEMP(C_MENU_ITEM_DEF)
{
	text[0]			=	"Szybka Mikstura Many";
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 2 + CTRL_GROUP1;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENU_ITEM_INP_LAMEMP";	
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};

INSTANCE MENU_ITEM_KEY_PREVA(C_MENU_ITEM_DEF)
{
	text[0]			=	"Poprzednia Amunicja";
	text[1]			=   "Ustawia poprzedni¹ amunicje dla ³uku/kuszy."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 3 + CTRL_GROUP1;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENU_ITEM_INP_PREVA";	
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};

INSTANCE MENU_ITEM_KEY_NEXTA(C_MENU_ITEM_DEF)
{
	text[0]			=	"Nastêpna Amunicja";
	text[1]			=   "Ustawia nastepn¹ amunicje dla ³uku/kuszy."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 4 + CTRL_GROUP1;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENU_ITEM_INP_NEXTA";	
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};


INSTANCE MENU_ITEM_KEY_RuneSWD(C_MENU_ITEM_DEF)
{
	text[0]			=	"W³ó¿ runê do M. Runicznego";
	text[1]			=   "Wk³ada zaznaczon¹ runê do Miecza Runicznego."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 5 + CTRL_GROUP1;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENU_ITEM_INP_RuneSWD";	
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};







INSTANCE MENU_ITEM_KEY_PFollow(C_MENU_ITEM_DEF)
{
	text[0]			=	"Zespó³: Pod¹¿aj za mn¹";
	text[1]			=   "Dajesz znak kompanom, po czym zaczynaj¹ za tob¹ pod¹¿¹æ."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 6 + CTRL_GROUP2;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENU_ITEM_INP_PFollow";	
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};


INSTANCE MENU_ITEM_KEY_PWait(C_MENU_ITEM_DEF)
{
	text[0]			=	"Zespó³: Utrzymaj pozycjê";
	text[1]			=   "Dajesz znak kompanom, po czym utrzymuj¹ obecn¹ pozycjê."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 7 + CTRL_GROUP2;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENU_ITEM_INP_PWait";	
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};


INSTANCE MENU_ITEM_KEY_PHeal(C_MENU_ITEM_DEF)
{
	text[0]			=	"Zespó³: Lecz Rany";
	text[1]			=   "Nakazujesz kompanom leczyæ rany."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 8 + CTRL_GROUP2;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENU_ITEM_INP_PHeal";	
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};



INSTANCE MENU_ITEM_KEY_PNear(C_MENU_ITEM_DEF)
{
	text[0]			=	"Zespó³: Walcz w zwarciu";
	text[1]			=   "Nakazujesz kompanom walczyæ u¿ywaj¹c broni do walki w zwarciu."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 9 + CTRL_GROUP2;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENU_ITEM_INP_PNear";	
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};
INSTANCE MENU_ITEM_KEY_PFar(C_MENU_ITEM_DEF)
{
	text[0]			=	"Zespó³: Atakuj z dystansu";
	text[1]			=   "Nakazujesz kompanom walczyæ u¿ywaj¹c broni dystansowej oraz magii."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 10 + CTRL_GROUP2;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENU_ITEM_INP_PFar";	
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};
INSTANCE MENU_ITEM_KEY_PFav(C_MENU_ITEM_DEF)
{
	text[0]			=	"Zespó³: Walcz ulubiona broni¹";
	text[1]			=   "Nakazujesz kompanom walczyæ u¿ywaj¹c najefektywniejszych broni."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 11 + CTRL_GROUP2;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENU_ITEM_INP_PFav";	
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};
//
// Group 1
//

INSTANCE MENU_ITEM_INP_LAMEHP(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	// text[1] 	=   "Naciœnij ¿¹dany klawisz.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_4;	posy		=	ctrl_y_start + ctrl_y_step * 1 + CTRL_GROUP1;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyLAMEHP";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};


INSTANCE MENU_ITEM_INP_LAMEMP(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	// text[1] 	=   "Naciœnij ¿¹dany klawisz.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_4;	posy		=	ctrl_y_start + ctrl_y_step * 2 + CTRL_GROUP1;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyLAMEMP";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};


INSTANCE MENU_ITEM_INP_PREVA(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	// text[1] 	=   "Naciœnij ¿¹dany klawisz.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_4;	posy		=	ctrl_y_start + ctrl_y_step * 3 + CTRL_GROUP1;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyPrevA";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};


INSTANCE MENU_ITEM_INP_NEXTA(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	// text[1] 	=   "Naciœnij ¿¹dany klawisz.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_4;	posy		=	ctrl_y_start + ctrl_y_step * 4 + CTRL_GROUP1;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyNextA";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};


INSTANCE MENU_ITEM_INP_RuneSWD(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	// text[1] 	=   "Naciœnij ¿¹dany klawisz.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_4;	posy		=	ctrl_y_start + ctrl_y_step * 5 + CTRL_GROUP1;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyRuneSWD";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};


INSTANCE MENU_ITEM_INP_PFollow(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	// text[1] 	=   "Naciœnij ¿¹dany klawisz.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_4;	posy		=	ctrl_y_start + ctrl_y_step * 6 + CTRL_GROUP2;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyPFollow";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};


INSTANCE MENU_ITEM_INP_PWait(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	// text[1] 	=   "Naciœnij ¿¹dany klawisz.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_4;	posy		=	ctrl_y_start + ctrl_y_step * 7 + CTRL_GROUP2;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyPWait";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};


INSTANCE MENU_ITEM_INP_PHeal(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	// text[1] 	=   "Naciœnij ¿¹dany klawisz.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_4;	posy		=	ctrl_y_start + ctrl_y_step * 8 + CTRL_GROUP2;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyPHeal";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};


INSTANCE MENU_ITEM_INP_PNear(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	// text[1] 	=   "Naciœnij ¿¹dany klawisz.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_4;	posy		=	ctrl_y_start + ctrl_y_step * 9 + CTRL_GROUP2;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyPNear";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};

INSTANCE MENU_ITEM_INP_PFar(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	// text[1] 	=   "Naciœnij ¿¹dany klawisz.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_4;	posy		=	ctrl_y_start + ctrl_y_step * 10 + CTRL_GROUP2;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyPFar";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};

INSTANCE MENU_ITEM_INP_PFav(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	// text[1] 	=   "Naciœnij ¿¹dany klawisz.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_4;	posy		=	ctrl_y_start + ctrl_y_step * 11 + CTRL_GROUP2;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyPFav";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};








INSTANCE MENU_ITEM_CHG_KEYS_HOWTO(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Jak wprowadzaæ klawisze";
	// Position und Dimension	
	posx		=	ctrl_sp1_1;		posy		=	ctrl_y_start + ctrl_y_step * 16 + CTRL_GROUP3;
	dimy		=	300;
	// Aktionen
	fontName 	= 	MENU_FONT_SMALL;
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_OPT_CONTROLS_HOWTO";	
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_CHG_KEYS_PREV(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Poprzednie";
	// Position und Dimension	
	posx		=	ctrl_sp1_1;		posy		=	ctrl_y_start + ctrl_y_step * 17 + CTRL_GROUP5;
	dimy		=	300;
	// Aktionen
	fontName 	= 	MENU_FONT_SMALL;
	onSelAction[0]	= 	SEL_ACTION_BACK;	
	flags = flags | IT_TXT_CENTER;
};






//-----------------------------------------------------
//	H O W   T O   C H A N G E   K E Y S
//-----------------------------------------------------


instance MENU_OPT_CONTROLS_HOWTO(C_MENU_DEF) 
{
	backpic			= MENU_BACK_PIC;
	
	items[0]		= "MENU_OPT_CONTROLS_HOWTO_HEADLINE2";
	
	items[1]		= "MENU_OPT_CONTROLS_HOWTO_TEXT1";
	items[2]		= "MENU_OPT_CONTROLS_HOWTO_TEXT2";
	items[3]		= "MENU_OPT_CONTROLS_HOWTO_TEXT3";
	items[4]		= "MENU_OPT_CONTROLS_HOWTO_TEXT4";
	items[5]		= "MENU_OPT_CONTROLS_HOWTO_TEXT5";
	
	items[6]		= "MENU_OPT_CONTROLS_HOWTO_TEXT6";	
	items[7]		= "MENU_OPT_CONTROLS_HOWTO_TEXT7";
	
	items[8]		= "MENU_OPT_CONTROLS_HOWTO_TEXT8";	
	items[9]		= "MENU_OPT_CONTROLS_HOWTO_TEXT9";	
	
	items[10]		= "MENU_OPT_CONTROLS_HOWTO_TEXT10";	
	items[11]		= "MENU_OPT_CONTROLS_HOWTO_TEXT11";	
	
	items[12]		= "MENU_OPT_CONTROLS_HOWTO_TEXT12";	
	items[13]		= "MENU_OPT_CONTROLS_HOWTO_TEXT13";	
	
	items[14]		= "MENU_OPT_CONTROLS_HOWTO_TEXT14";	
	items[15]		= "MENU_OPT_CONTROLS_HOWTO_TEXT15";	
	
	items[16]		= "MENU_OPT_CONTROLS_HOWTO_TEXT16";	
	items[17]		= "MENU_OPT_CONTROLS_HOWTO_TEXT17";	
	
	items[18]		= "MENU_OPT_CONTROLS_HOWTO_TEXT18";	
	items[19]		= "MENU_OPT_CONTROLS_HOWTO_TEXT19";	
	
	items[20]		= "MENU_OPT_CONTROLS_HOWTO_TEXT20";	
	items[21]		= "MENU_OPT_CONTROLS_HOWTO_TEXT21";	
	
	items[22]		= "MENU_OPT_CONTROLS_HOWTO_TEXT22";	
	items[23]		= "MENU_OPT_CONTROLS_HOWTO_TEXT23";	
	

	
	items[24]		= "MENU_OPT_CONTROLS_HOWTO_TEXT14a";	
	items[25]		= "MENU_OPT_CONTROLS_HOWTO_TEXT15a";	
	
	items[26]		= "MENU_OPT_CONTROLS_HOWTO_TEXT16a";	
	items[27]		= "MENU_OPT_CONTROLS_HOWTO_TEXT17a";	
	
	items[28]		= "MENU_OPT_CONTROLS_HOWTO_TEXT18a";	
	items[29]		= "MENU_OPT_CONTROLS_HOWTO_TEXT19a";	
	
	items[30]		= "MENU_OPT_CONTROLS_HOWTO_TEXT20a";	
	items[31]		= "MENU_OPT_CONTROLS_HOWTO_TEXT21a";	
	
	items[32]		= "MENU_OPT_CONTROLS_HOWTO_TEXT22a";	
	items[33]		= "MENU_OPT_CONTROLS_HOWTO_TEXT23a";	
	
	//ops
	items[34]		= "MENU_OPT_CONTROLS_HOWTO_TEXT15_B";		
	items[35]		= "MENU_OPT_CONTROLS_HOWTO_TEXT15_Ba";	

	items[40]		= "MENUITEM_CHG_KEYS_PREV";	
	flags = flags | MENU_SHOW_INFO;
	flags		= 	flags & ~MENU_DONTSCALE_DIM;
	
};

INSTANCE MENU_OPT_CONTROLS_HOWTO_HEADLINE2(C_MENU_ITEM_DEF) 
{
	text[0]		=	"Jak wprowadzaæ klawisze";
	type		=	MENU_ITEM_TEXT;	
	// Position und Dimension	
	posx		=	ctrl_sp1_0+1200;		posy		=	MENU_TITLE_Y+170;
	dimx		=	8192;
	
	flags		= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT1(C_MENU_ITEM_DEF)
{
	text[0]			=	"W poprzednim menu widzia³eœ wszystkie dodatkowe klawisze stworzone";
	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_0;	posy	= 	ctrl_y_start  + line_step * 1 + CTRL_GROUP1;
	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};
INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT2(C_MENU_ITEM_DEF)
{
	text[0]			=	"specjalnie na potrzeby Modyfikacji Czas Zap³aty.";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_0;	posy	= 	ctrl_y_start + line_step * 2 + CTRL_GROUP1;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};
INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT3(C_MENU_ITEM_DEF)
{
	text[0]			=	"Niestety nie by³o mo¿liwe edytowanie nowych klawiszy tak jak w wypadku ";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_0;	posy	= 	ctrl_y_start + line_step * 3 + CTRL_GROUP1;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};
INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT4(C_MENU_ITEM_DEF)
{
	text[0]			=	"tych podstawowych. Wprowadzane klawisze musz¹ byæ identycznie z tymi na";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_0;	posy	= 	ctrl_y_start + line_step * 4 + CTRL_GROUP1;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};
INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT5(C_MENU_ITEM_DEF)
{
	text[0]			=	"liœcie wymienionej poni¿ej, inaczej nie bêda one dzia³a³y.";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_0;	posy	= 	ctrl_y_start + line_step * 5 + CTRL_GROUP1;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT6(C_MENU_ITEM_DEF)
{
	text[0]			=	"Klawisze Alfabetyczne:";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 6 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT7(C_MENU_ITEM_DEF)
{
	text[0]			=	"'A'-'Z'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_4;	posy	= 	ctrl_y_start + line_step * 6 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};


INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT8(C_MENU_ITEM_DEF)
{
	text[0]			=	"Klawisze Liczbowe:";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 8 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT9(C_MENU_ITEM_DEF)
{
	text[0]			=	"'0'-'9'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_4;	posy	= 	ctrl_y_start + line_step * 8 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT10(C_MENU_ITEM_DEF)
{
	text[0]			=	"Klawisze Funkcyjne:";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 10 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT11(C_MENU_ITEM_DEF)
{
	text[0]			=	"'F1'-'F12'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_4;	posy	= 	ctrl_y_start + line_step * 10 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT12(C_MENU_ITEM_DEF)
{
	text[0]			=	"Klawiatura Numeryczna: 'N1'-'N0' / 'N+' 'NENTER'...";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 12 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT13(C_MENU_ITEM_DEF)
{
	text[0]			=	"";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_4;	posy	= 	ctrl_y_start + line_step * 12 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};


INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT14(C_MENU_ITEM_DEF)
{
	text[0]			=	"Zn. Mniejszoœci: ";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 14 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT15(C_MENU_ITEM_DEF)
{
	text[0]			=	"Zn. Wiekszoœci:";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 15 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};



INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT15_B(C_MENU_ITEM_DEF)
{
	text[0]			=	"Zn. Zapytania: ";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 16 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT16(C_MENU_ITEM_DEF)
{
	text[0]			=	"Srednik:  ";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 17 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};


INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT17(C_MENU_ITEM_DEF)
{
	text[0]			=	"Apostrof:    ";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 18 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT18(C_MENU_ITEM_DEF)
{
	text[0]			=	"Nawias Kw. Otw.: ";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 19 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};


INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT19(C_MENU_ITEM_DEF)
{
	text[0]			=	"Nawias Kw. Zam.:  ";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 20 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT20(C_MENU_ITEM_DEF)
{
	text[0]			=	"Myœlnik:      ";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 21 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT21(C_MENU_ITEM_DEF)
{
	text[0]			=	"Plus:        ";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 22 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT22(C_MENU_ITEM_DEF)
{
	text[0]			=	"Pipe(Backslash): ";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 23 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};


INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT23(C_MENU_ITEM_DEF)
{
	text[0]			=	"Tylda:   ";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + line_step * 24 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

//
//
//
//

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT14a(C_MENU_ITEM_DEF)
{
	text[0]			=	"'LE'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_2;	posy	= 	ctrl_y_start + line_step * 14 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT15a(C_MENU_ITEM_DEF)
{
	text[0]			=	"'GR'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_2;	posy	= 	ctrl_y_start + line_step * 15 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};



INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT15_Ba(C_MENU_ITEM_DEF)
{
	text[0]			=	"'ASK'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_2;	posy	= 	ctrl_y_start + line_step * 16 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT16a(C_MENU_ITEM_DEF)
{
	text[0]			=	"'SR'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_2;	posy	= 	ctrl_y_start + line_step * 17 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};


INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT17a(C_MENU_ITEM_DEF)
{
	text[0]			=	"'AP'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_2;	posy	= 	ctrl_y_start + line_step * 18 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT18a(C_MENU_ITEM_DEF)
{
	text[0]			=	"'QO'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_2;	posy	= 	ctrl_y_start + line_step * 19 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};


INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT19a(C_MENU_ITEM_DEF)
{
	text[0]			=	"'QC'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_2;	posy	= 	ctrl_y_start + line_step * 20 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT20a(C_MENU_ITEM_DEF)
{
	text[0]			=	"'MY'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_2;	posy	= 	ctrl_y_start + line_step * 21 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT21a(C_MENU_ITEM_DEF)
{
	text[0]			=	"'PL'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_2;	posy	= 	ctrl_y_start + line_step * 22 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};

INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT22a(C_MENU_ITEM_DEF)
{
	text[0]			=	"'PP'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_2;	posy	= 	ctrl_y_start + line_step * 23 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};


INSTANCE MENU_OPT_CONTROLS_HOWTO_TEXT23a(C_MENU_ITEM_DEF)
{
	text[0]			=	"'TY'";	
	
	// text[1]			=   "DEL - usuwa, ENTER - przypisuje klawisz."; // Kommentar
	posx			= 	ctrl_sp1_2;	posy	= 	ctrl_y_start + line_step * 24 + CTRL_GROUP2;

	fontName 	= 	MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;

};