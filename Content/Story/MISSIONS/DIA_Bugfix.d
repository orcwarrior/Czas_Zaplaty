INSTANCE Cavalorn_OM_Bugfix (C_Item)
{
	name 				=	"Cavalorn - bugfix";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;
   visual 					=	"ItWr_Scroll_01.3ds";

	material 			=	MAT_LEATHER;
	on_state[0]			=  Bugfix_Cavalorn_OM;
	scemeName			=	"MAP";
	description			=	"Czytaj i porozmawiaj z Cavalornem po zdobyciu SK";
};

FUNC void Bugfix_Cavalorn_OM()
{
   OldCampGrds = 19;
};

INSTANCE Ratford_guards_killed_Bugfix (C_Item)
{
	name 				=	"Ratford - bugfix";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;
   visual 					=	"ItWr_Scroll_01.3ds";

	material 			=	MAT_LEATHER;
	on_state[0]			=  Bugfix_Ratford_guards_killed;
	scemeName			=	"MAP";
	description			=	"Czytaj i porozmawiaj z Ratfordem";
};

FUNC void Bugfix_Ratford_guards_killed()
{
   OR_ATTACKED = 76;
   GrdsInAttack = 0;
};

INSTANCE Print_OR_ATTACKED_GrdsInAttack_Bugfix (C_Item)
{
	name 				=	"OR_ATTACKED, GrdsInAttack - bugfix";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;
   visual 					=	"ItWr_Scroll_01.3ds";

	material 			=	MAT_LEATHER;
	on_state[0]			=  Bugfix_Print_OR_ATTACKED_GrdsInAttack;
	scemeName			=	"MAP";
	description			=	"Wyúwietla wartoúci zmiennych";
};

FUNC void Bugfix_Print_OR_ATTACKED_GrdsInAttack()
{
   var string text_or_attacked;
   var string text_GrdsInAttack;

   text_or_attacked = ConcatStrings("OR attacked == ",IntToString(OR_ATTACKED));
   text_GrdsInAttack = ConcatStrings(", Grd2Kill == ",IntToString(GrdsInAttack));
   PrintScreen	(ConcatStrings(text_or_attacked, text_GrdsInAttack), -1,40,"font_old_10_white.tga",_TIME_MESSAGE_LOGENTRY);	
};

INSTANCE Nekroman_Bugfix (C_Item)
{
	name 				=	"Nekromanta - bugfix";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;
   visual 					=	"ItWr_Scroll_01.3ds";

	material 			=	MAT_LEATHER;
	on_state[0]			=  Bugfix_Nekroman;
	scemeName			=	"MAP";
	description			=	"Czytaj i idü do opuszczonej kopalni";
};

FUNC void Bugfix_Nekroman()
{
   Black_mag_arrived = true;
};

INSTANCE DreamZen_Bugfix (C_Item)
{
	name 				=	"DreamZen - bugfix";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;
   visual 					=	"ItWr_Scroll_01.3ds";

	material 			=	MAT_LEATHER;
	on_state[0]			=  Bugfix_DreamZen;
	scemeName			=	"MAP";
	description			=	"Czytaj i porozmawiaj z Tondralem";
};

FUNC void Bugfix_DreamZen()
{
   Dream_finished = true;
};

INSTANCE Print_Aidan_sword_hammer_debug (C_Item)
{
	name 				=	"Aidan, sword, hammer - debug";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;
   visual 					=	"ItWr_Scroll_01.3ds";

	material 			=	MAT_LEATHER;
	on_state[0]			=  Debug_Print_Aidan_sword_hammer;
	scemeName			=	"MAP";
	description			=	"Wyúwietla wartoúci zmiennych";
};
FUNC INT DIA_AIDAN_SteelOk2_Condition_debug()
{
	if (Npc_KnowsInfo(hero, DIA_AIDAN_SteelOk) && (aid_steel) 
   && ((!Wait4Hammer) || (aid_hammer)) && (aidan_sword <= Wld_GetDay()))
	{
		return 1;
	};
};
FUNC void Debug_Print_Aidan_sword_hammer()
{
   var string text_aid_steel;
   var string text_Wait4Hammer;
   var string text_aid_hammer;
   var string text_aidan_sword;

   text_aid_steel = ConcatStrings("aid_steel == ",IntToString(aid_steel));
   text_Wait4Hammer = ConcatStrings(", Wait4Hammer == ",IntToString(Wait4Hammer));
   text_aid_hammer = ConcatStrings("aid_hammer == ",IntToString(aid_hammer));
   text_aidan_sword = ConcatStrings(", aidan_sword == ",IntToString(aidan_sword));
   PrintScreen	(ConcatStrings(text_aid_steel, text_Wait4Hammer), -1,40,"font_old_10_white.tga",_TIME_MESSAGE_LOGENTRY);	
   PrintScreen	(ConcatStrings(text_aid_hammer, text_aidan_sword), -1,50,"font_old_10_white.tga",_TIME_MESSAGE_LOGENTRY);	
   
   PrintScreen	(IntToString(DIA_AIDAN_SteelOk2_Condition_debug()), -1,30,"font_old_10_white.tga",_TIME_MESSAGE_LOGENTRY);
   PrintScreen	(IntToString(aidan_sword <= Wld_GetDay()), -1,20,"font_old_10_white.tga",_TIME_MESSAGE_LOGENTRY);
   PrintScreen	(IntToString(((!Wait4Hammer) || (aid_hammer))), -1,10,"font_old_10_white.tga",_TIME_MESSAGE_LOGENTRY);
   printScreen	(IntToString(Npc_KnowsInfo(hero, DIA_AIDAN_SteelOk)), -1,0,"font_old_10_white.tga",_TIME_MESSAGE_LOGENTRY);
};