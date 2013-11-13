instance MENU_LOG(C_MENU_DEF) 
{
	items[8]		= "MENU_ITEM_SEL_MISSIONS_ACT";		
	items[9]		= "MENU_ITEM_SEL_MISSIONS_OLD";
	items[10]		= "MENU_ITEM_SEL_MISSIONS_FAILED";	
	items[11]		= "MENU_ITEM_SEL_LOG";

	items[4]		= "MENU_ITEM_DAY_TITLE";
	items[5]		= "MENU_ITEM_TIME_TITLE";
	items[6]		= "MENU_ITEM_DAY";
	items[7]		= "MENU_ITEM_TIME";
	
	items[0]		= "MENU_ITEM_LIST_MISSIONS_ACT";
	items[1]		= "MENU_ITEM_LIST_MISSIONS_FAILED";
	items[2]		= "MENU_ITEM_LIST_MISSIONS_OLD";	
	items[3]		= "MENU_ITEM_LIST_LOG";	
	
	items[12]		= "MENU_ITEM_CONTENT_VIEWER";
	alpha			= 255;
	posx			= 0;
	posy			= 0;
	dimx			= 8191;
	dimy			= 8191;
	backPic			= LOG_BACK_PIC;

	flags = flags | MENU_SHOW_INFO;
	flags		= 	flags & ~MENU_DONTSCALE_DIM;
};
//
// Menüpunkte
//

const int LOG_ITEM_Y1 	= 750;
const int LOG_ITEM_DX1 	= 1800;

const int LOG_ITEM_LIST_X 		= 1400;
const int LOG_ITEM_LIST_Y 		= 1500;
const int LOG_ITEM_LIST_HEIGHT 	= 6100;
const int LOG_ITEM_LIST_WIDTH	= 4500;

const int LOG_ITEM_CONT_X 		= 4350;

INSTANCE MENU_ITEM_SEL_MISSIONS_ACT(C_MENU_ITEM_DEF)
{
	text[0]		=	"Bie¿¹ce Misje";
	posx		=	500;
	posy		=   	LOG_ITEM_Y1+120;
	dimx 		= 	LOG_ITEM_DX1;
	dimy		=   	1000;
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_SELECTABLE|IT_MULTILINE|IT_TXT_CENTER;	
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]=	"EFFECTS MENU_ITEM_LIST_MISSIONS_ACT";	
};

INSTANCE MENU_ITEM_SEL_MISSIONS_OLD(C_MENU_ITEM_DEF)
{
	text[0]		=	"Zakoñczone\nMisje";
	
	posx		=	1550;
	posy		=   	LOG_ITEM_Y1-70;
	dimx 		= 	LOG_ITEM_DX1;
	dimy		=   	1000;
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_SELECTABLE|IT_MULTILINE|IT_TXT_CENTER;	
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]=	"EFFECTS MENU_ITEM_LIST_MISSIONS_OLD";		
};


INSTANCE MENU_ITEM_SEL_MISSIONS_FAILED(C_MENU_ITEM_DEF)
{
	text[0]		=	"Niezaliczone\nMisje";
	
	posx		=	2580;
	posy		=   	LOG_ITEM_Y1-50;
	dimx 		= 	LOG_ITEM_DX1;
	dimy		=   	1000;	
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_SELECTABLE|IT_MULTILINE|IT_TXT_CENTER;	
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]=	"EFFECTS MENU_ITEM_LIST_MISSIONS_FAILED";		
};


INSTANCE MENU_ITEM_SEL_LOG(C_MENU_ITEM_DEF)
{
	text[0]		=	"Informacje Ogólne";
	
	posx		=	5770;
	posy		=   	LOG_ITEM_Y1;
	dimx 		= 	LOG_ITEM_DX1;
	dimy		=   	1000;
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_SELECTABLE|IT_MULTILINE|IT_TXT_CENTER;	
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]=	"EFFECTS MENU_ITEM_LIST_LOG";		
};


//
// Listen
//

instance MENU_ITEM_LIST_MISSIONS_ACT(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_LISTBOX;	
	text[0]		= 	"Bie¿¹ce misje";
	
	posx		=	LOG_ITEM_LIST_X;
	posy		=   LOG_ITEM_LIST_Y;
	dimx 		= 	LOG_ITEM_LIST_WIDTH;
	dimy		=	LOG_ITEM_LIST_HEIGHT;
	
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_EFFECTS_NEXT;
	flags		= 	flags & ~IT_SELECTABLE;	
	flags		= 	flags & ~IT_TXT_CENTER;	
	userString[0]	=	"CURRENTMISSIONS";	
	
	frameSizeX	= 	250;
	frameSizeY	= 	0;
};

instance MENU_ITEM_LIST_MISSIONS_FAILED(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_LISTBOX;	
	text[0]		= 	"Stare misje";
	
	posx		=	LOG_ITEM_LIST_X;
	posy		=   LOG_ITEM_LIST_Y;
	dimx 		= 	LOG_ITEM_LIST_WIDTH;
	dimy		=	LOG_ITEM_LIST_HEIGHT;
	
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_EFFECTS_NEXT;	
	flags		= 	flags & ~IT_SELECTABLE;
	flags		= 	flags & ~IT_TXT_CENTER;	
	userString[0]	=	"OLDMISSIONS";
	
	frameSizeX	= 	250;
	frameSizeY	= 	0;
};

instance MENU_ITEM_LIST_MISSIONS_OLD(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_LISTBOX;	
	text[0]		= 	"Niezaliczone misje";
	
	posx		=	LOG_ITEM_LIST_X;
	posy		=   LOG_ITEM_LIST_Y;
	dimx 		= 	LOG_ITEM_LIST_WIDTH;
	dimy		=	LOG_ITEM_LIST_HEIGHT;
	
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_EFFECTS_NEXT;	
	flags		= 	flags & ~IT_SELECTABLE;
	flags		= 	flags & ~IT_TXT_CENTER;	
	userString[0]	=	"FAILEDMISSIONS";
		
	frameSizeX	= 	250;
	frameSizeY	= 	0;
};

instance MENU_ITEM_LIST_LOG(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_LISTBOX;	
	text[0]		= 	"Dziennik";
	
	posx		=	LOG_ITEM_LIST_X;
	posy		=   LOG_ITEM_LIST_Y;
	dimx 		= 	LOG_ITEM_LIST_WIDTH;
	dimy		=	LOG_ITEM_LIST_HEIGHT;
	
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_EFFECTS_NEXT;	
	flags		= 	flags & ~IT_SELECTABLE;
	flags		= 	flags & ~IT_TXT_CENTER;		
	userString[0]	=	"LOG";
	
	frameSizeX	= 	250;
	frameSizeY	= 	0;
};

//
// Content-Viewer
//

INSTANCE MENU_ITEM_CONTENT_VIEWER(C_MENU_ITEM_DEF)
{
	text[0]		=	"brak zawartoœci";
	
	posx		=	LOG_ITEM_CONT_X;
	posy		=   700;	
	dimx 		= 	LOG_ITEM_LIST_WIDTH-1300;
	dimy		=	LOG_ITEM_LIST_HEIGHT;
	fontName	=	LOG_FONT_VIEWER;
	
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_MULTILINE;
	flags		= 	flags & ~IT_SELECTABLE;	
	
	frameSizeX	= 	150;
	frameSizeY	= 	1000;
	
};
const int INF_POSY = 7250;
INSTANCE MENU_ITEM_DAY_TITLE(C_MENU_ITEM_DEF)
{
	text[0]		= 	"Dzieñ";
	posx 		= 	2750; // see dimx of MENU_ITEM_DAY!!
	posy		= 	INF_POSY;
	fontName	=	LOG_FONT_DATETIME;
	flags		= 	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_TIME_TITLE(C_MENU_ITEM_DEF)
{
	text[0]		= 	"Czas:";
	posx 		= 	5050;
	posy		= 	INF_POSY;
	fontName	=	LOG_FONT_DATETIME;
	flags		= 	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_DAY(C_MENU_ITEM_DEF)
{	
	text[0]		=	"XX.";
	posx 		= 	3220;
	posy		= 	INF_POSY;
	dimx		=	300;
	fontName	=	LOG_FONT_DATETIME;
	flags		= 	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_TIME(C_MENU_ITEM_DEF)
{
	text[0]		= 	"XX:XX";
	posx 		= 	5450;
	posy		= 	INF_POSY;
	fontName	=	LOG_FONT_DATETIME;
	flags		= 	flags & ~IT_SELECTABLE;
};