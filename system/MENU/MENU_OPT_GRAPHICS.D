// *********************************************************************
// game options menu
// *********************************************************************

INSTANCE MENU_OPT_GRAPHICS(C_MENU_DEF)
{
	backpic			= MENU_BACK_PIC;
	
	items[0]		= "MENUITEM_GRA_HEADLINE";
				
	items[1]		= "MENUITEM_GRA_TEXQUAL";	
	items[2]		= "MENUITEM_GRA_TEXQUAL_SLIDER";	
	
	items[3]		= "MENUITEM_GRA_MODEL_DETAIL";	
	items[4]		= "MENUITEM_GRA_MODEL_DETAIL_SLIDER";

	items[5]		= "MENUITEM_GRA_SIGHT";
	items[6]		= "MENUITEM_GRA_SIGHT_CHOICE";		
		
	items[7]		= "MENUITEM_GRA_SKY_EFFECTS";
	items[8]		= "MENUITEM_GRA_SKY_EFFECTS_CHOICE";	
	
	items[9]		= "MENUITEM_GRA_FRAMELIMIT";
	items[10]		= "MENUITEM_GRA_FRAMELIMIT_CHOICE";			
					
	items[11]		= "MENUITEM_GRA_BACK";	
	

	flags = flags | MENU_SHOW_INFO;
	flags		= 	flags & ~MENU_DONTSCALE_DIM;};


INSTANCE MENUITEM_GRA_HEADLINE(C_MENU_ITEM_DEF) 
{
	text[0]		=	"USTAWIENIA GRAFICZNE";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension	
	posx		=	MENU_OPT_X;		posy		=	MENU_TITLE_Y;
	dimx		=	8192;
	
	flags		= flags & ~IT_SELECTABLE;
};


//
// Texture-Quality
//

INSTANCE MENUITEM_GRA_TEXQUAL(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Tekstury";
	// text[1]		= 	"Szczegó³owoœæ tekstur."; // Kommentar
	// Position und Dimension	
	posx		=	MENU_OPT_X;	posy		=	MENU_START_Y + MENU_DY*0;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;		
};

INSTANCE MENUITEM_GRA_TEXQUAL_SLIDER(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_SLIDER_BACK_PIC;
	type		=	MENU_ITEM_SLIDER;	
	// Position und Dimension	
	posx		= MENU_OPT_X2;		posy		= MENU_START_Y + MENU_DY*0 + MENU_SLIDER_YPLUS + 170;
	dimx = 2*MENUOPT_SLIDER_DX;	dimy 		= 	MENUOPT_SLIDER_DY;
	// Aktionen	
	onChgSetOption													= "texDetailIndex";
	onChgSetOptionSection 											= "INTERNAL";

	
	// Weitere Eigenschaften	
	userFloat[0]	= 20;
	userString[0]	= MENU_SLIDER_POS_PIC;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;	
};

//
// Modell-Detail-Level
//

INSTANCE MENUITEM_GRA_MODEL_DETAIL(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Modele";
	// text[1]		= 	"Szczegó³owoœæ modeli 3D."; // Kommentar
	// Position und Dimension	
	posx		=	MENU_OPT_X;	posy		=	MENU_START_Y + MENU_DY*1;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;	
};

instance MENUITEM_GRA_MODEL_DETAIL_SLIDER(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_SLIDER_BACK_PIC;
	type		=	MENU_ITEM_SLIDER;	

	// Aktionen
	onChgSetOption													= "modelDetail";
	onChgSetOptionSection 											= "PERFORMANCE";
	// Weitere Eigenschaften
	posx		= MENU_OPT_X2;		posy		= MENU_START_Y + MENU_DY*1 + MENU_SLIDER_YPLUS + 170;
	dimx = 2*MENUOPT_SLIDER_DX;	dimy 		= 	MENUOPT_SLIDER_DY;	
	// Weitere Eigenschaften	
	userFloat[0]	= 20;
	userString[0]	= MENU_SLIDER_POS_PIC;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;	
};



//
// Sight
//

instance MENUITEM_GRA_SIGHT(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Widok";
	// text[1]		= "Zasiêg generowania obrazu."; // Kommentar
	// Position und Dimension	
	posx		=	MENU_OPT_X;	posy		=	MENU_START_Y + MENU_DY*2;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;	
};


INSTANCE MENUITEM_GRA_SIGHT_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		=   "20%|40%|60%|80%|100%|120%|140%|160%|180%|200%|220%|240%|260%|280%|300%";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	// Aktionen	
	onChgSetOption													= "sightValue";
	onChgSetOptionSection 											= "PERFORMANCE";
	// Weitere Eigenschaften	
	posx		= MENU_OPT_X2;		posy		= MENU_START_Y + MENU_DY*2 + MENU_CHOICE_YPLUS;
	dimx = MENUOPT_SLIDER_DX;	dimy 		= 	MENUOPT_SLIDER_DY;
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;
};



//
// Himmels-Effekte
//


INSTANCE MENUITEM_GRA_SKY_EFFECTS(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Niebo";
	// text[1]		= 	"Specjalne efekty nieba."; // Kommentar
	// Position und Dimension	
	posx		=	MENU_OPT_X;	posy		=	MENU_START_Y + MENU_DY*3;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;	
};

instance MENUITEM_GRA_SKY_EFFECTS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	"wy³.|w³.";
	fontName	=   MENU_FONT_SMALL;
	// Aktionen
	onChgSetOption													= "skyEffects";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	posx		= MENU_OPT_X2;		posy		= MENU_START_Y + MENU_DY*3 + MENU_CHOICE_YPLUS;
	dimx = MENUOPT_SLIDER_DX;	dimy 		= 	MENUOPT_SLIDER_DY;
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;
};


INSTANCE MENUITEM_GRA_FRAMELIMIT(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Limit Klatek";
	text[1]		= 	"Wy³¹czony limit klatek znacznie poprawia p³ynnoœæ wyœwietl. obrazu."; // Kommentar
	// Position und Dimension	
	posx		=	MENU_OPT_X;	posy		=	MENU_START_Y + MENU_DY*4;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;	
};

instance MENUITEM_GRA_FRAMELIMIT_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	"wy³.|w³.";
	fontName	=   MENU_FONT_SMALL;
	// Aktionen
	onChgSetOption													= "frameLimit";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	posx		= MENU_OPT_X2;		posy		= MENU_START_Y + MENU_DY*4 + MENU_CHOICE_YPLUS;
	dimx = MENUOPT_SLIDER_DX;	dimy 		= 	MENUOPT_SLIDER_DY;
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;
};



INSTANCE MENUITEM_GRA_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Wstecz";
	// Position und Dimension	
	posx		=	MENU_OPT_X;			posy		=	MENU_BACK_Y;
	dimx		=	4000;		dimy		=	MENU_OPT_DY;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;
	// Weitere Eigenschaften
};

