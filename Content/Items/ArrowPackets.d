FUNC VOID ArrowPack01()
{
   CreateInvItems(hero,ItAmArrow,25);	
   PrintScreen("Otrzyma³eœ 25 strza³.",-1,-1,"font_old_20_white.tga",2);
};

/******************************************************************************************/
INSTANCE ItMi_ArrowPack_01 (C_Item)
{
	name 				=	"Ko³czan";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMw_QUIVER.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= "W ko³czanie znajduje siê kilka strza³.";
	scemeName				=	"MAPSEALED";	
	on_state[0]			=	ArrowPack01;
};