
/***************************************************

CHAPTER 2 ITEMS

***************************************************/

//Items by Sher

INSTANCE ItMw_2h_Post (WeaponsMelee) 
{	
	name 				=	"Mary";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	75;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	  visual 				=	"ItMw_2H_Sword_Heavy_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/**************************
Itemy by Sher
****************************/
var int nikolas_list;

INSTANCE debt_list(C_Item)
{	
	name 					=	"Lista d³u¿ników";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	UseDebt_List;
	description				=	"Lista d³u¿ników od Nikolasa";

	TEXT[0]					=	"Nikolas spisa³ na tej kartce";
	TEXT[1]					=	"listê wszystkich d³u¿ników.";
};
func void UseDebt_List ()
{   
	var int nDocID;
		
	nDocID = Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
				Doc_PrintLine	( nDocID,  0, "K³amliwe sukinsyny, które wisz¹ mi rudê:"					);
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLines	( nDocID,  0, "Leaf - 200 bry³ek + 50 bry³ek odsetek"					);
				Doc_PrintLine	( nDocID,  0, "Lewy - 150 bry³ek + 30 bry³ek odsetek"	);
				Doc_PrintLine	( nDocID,  0, "Prawy - chyba 250 bry³ek, bez odsetek"					);
				Doc_PrintLine	( nDocID,  0, "Aidan - 400 bry³ek + 200 bry³ek odsetek"					);
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLine	( nDocID,  0, "Lewy i Prawy to bracia, obozuj¹ na szlaku"					);
				Doc_PrintLines	( nDocID,  0, "z prze³êczy. Nieopodal Starego Obozu - to œwiry uwa¿aj."					);
				Doc_PrintLine	( nDocID,  0, "Leaf i Aidan to cwaniaki z twojego obozu, wiêc"					);
				Doc_PrintLine	( nDocID,  0, "nie powinieneœ mieæ problemu z odzyskaniem"					);
				Doc_PrintLine	( nDocID,  0, "rudy."					);
				Doc_PrintLine	( nDocID,  0, "Nie zapomnij o odsetkach!"					);
				Doc_PrintLine	( nDocID,  0, "Powodzenia."					);
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
				Doc_Show		( nDocID );

				if (nikolas_list == FALSE)
				{
                 nikolas_list = TRUE;
                 debt_read = TRUE;
                 B_LogEntry		(CH2_TRL_Debt, "Przeczyta³em listê d³u¿ników: Leaf 200 bry³ek + 50 odsetki, Lewy 150 bry³ek + 30 odsetki, Prawy 250 bry³ek i Aidan 400 bry³ek + 200 odsetki. Ciekawe jak im siê spodobaj¹ odsetki...");
				};
};

var int Know_DrunkmanSecret;

/**********************
Paczka ziela od Gilberta
*************************/

INSTANCE package_stuff (C_Item)
{
	name 				=	"Paczka ziela";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_Packet.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	text[2] = "Paczka napchana jest";
	text[3] = "zielskiem. A¿ mi siê";
	text[4] = "krêci w g³owie...";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItWrPiwoszNote(C_Item)
{	
	name 					=	"Notatki Piwosza";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	ItWrPiwoszNote_List;
	description				=	"Notatki Piwosza";

	TEXT[0]					=	"Kto by pomysla³ ¿e";
	TEXT[1]					=	"Piwosz potrafi pisaæ.";
};
func void ItWrPiwoszNote_List ()
{   
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "..."					);
					Doc_PrintLines	( nDocID,  0, "Nie wiem, co mnie dziœ trafi³o, ale wlaz³em do opuszczonej jaskini na skraju lasu."					);
					Doc_PrintLine	( nDocID,  0, "..."					);
					Doc_PrintLines	( nDocID,  0, "W jaskini musia³ mieszkaæ jakiœ alchemik, postanowi³em, ¿e to jakoœ wykorzystam, u¿yjê jego sprzêtu do pêdzenia bimbru, he he."	);
					Doc_PrintLine	( nDocID,  0, "..."					);
					Doc_PrintLines	( nDocID,  0, "Nie mam pojêcia ile tego napêdzi³em, ale na pewno od cholery, wezmê czêœæ do obozu, resztê zostawiê sobie na póŸniej.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Próbowa³em wróciæ po jeszcze kilka sztuk lazurowego trzmiela, ale zrobi³o siê tam cholernie niebezpiecznie..."					);

					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );

					if (Know_DrunkmanSecret == FALSE)
					{
                  Know_DrunkmanSecret = TRUE;
                  Log_CreateTopic	(CH2_RBL_DrunkmanSecret, LOG_MISSION);
                  B_LogSetTopicStatus	(CH2_RBL_DrunkmanSecret, LOG_RUNNING);
                  B_LogEntry		(CH2_RBL_DrunkmanSecret, "W skrzyni Piwosza znalaz³em notatki. Wed³ug tego co tam napisano ten pijak produkowa³ alkohol w jakiejœ jaskini na skraju lasu.");
					};
};
/******************************************************************************************/
INSTANCE ItKeLeftChest(C_Item)
{
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

// INSTANCE	ItAt_BlackTroSkin	(ItAt_Troll_01)
// {
// 	name				=	"Futro Czarnego Trola";
// 	
// 	value				=	500;
// 	
// 	description			= name;
// 	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
// };

/*******************************************
Katr'akanat
*******************************************/

//**********************Inkunabu³y*********************************
INSTANCE Katrakanat_book(C_Item)
{	
	name 					=	"Zmursza³y inkunabu³";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	500;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Stara ksiêga";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Use_Katrakanat_book;
};

FUNC VOID Use_Katrakanat_book()
{   
	var int nDocID;
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //Iloœæ stron

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1 Strona
   					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "(Ksiêga oprawiona jest w... ludzk¹ skórê!)"			);
					Doc_PrintLine	( nDocID,  0, "(Pod spodem, ktoœ napisa³ coœ nierównym pismem)");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Ten, który zechce wyrzec siê œcie¿ki mroku i pod¹¿y drog¹ œwiat³a, pozna prawdziwe Ÿród³o pradawnej potêgi. Dane mu bêdzie u¿yæ jej, aby skruszyæ ³añcuchy zapomnienia i zg³êbiæ tajemnicê przeklêtego imienia, z pierwszych znaków s³ów spisanych winem ¿ycia...");

					//2 Strona
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "(ten tekst napisany jest w jakimœ nieznanym jezyku)");
					Doc_PrintLine	( nDocID,  1, "Ekh'r angh Irr'atis moones seghill derthan got'h...");
					Doc_PrintLine	( nDocID,  1, "(reszta napisana jest czerwonym inkaustem, albo krwi¹)");
					Doc_PrintLine	( nDocID,  1, "Khatar'Egh I'omin Urthen'Ghat est Perths Unisath.");
					Doc_PrintLine	( nDocID,  1, "A'nistur mightr E'night ynerth urthang Mooreth.");
					Doc_PrintLine	( nDocID,  1, "Tehir Un'Athor Methum iseth Yther klothhs.");
					Doc_PrintLine	( nDocID,  1, "Regtun Moostern Inass'Arn erst Ethill Minns Prooth's.");
					Doc_PrintLine	( nDocID,  1, "Anub Is'Artheng Mythn Enis gorth porthal.");
					Doc_PrintLine	( nDocID,  1, "Kenis Broth Innas meriath Vesierth'Sithen urgath.");
					Doc_PrintLine	( nDocID,  1, "Anestor Omin'th Erhran Veris Bhorn tylhr Cethl Enis.");
					Doc_PrintLine	( nDocID,  1, "Nesth Omines Urghat!");
					Doc_PrintLine	( nDocID,  1, "Aestor Nethis Verthon Morrthes Illath...");
					Doc_PrintLine	( nDocID,  1, "T'henn aris!");
					Doc_Show		( nDocID );
				
					
					
					//	Snd_Play 		("FoundRiddler");
					if (katar_rytual == FALSE)
					{
						Wld_PlayEffect("spellFX_MassDeath_GROUND", self, null, 0, 0, 0, true);
                  
						if (!open_kart)
						{
							Wld_SpawnNpcRange (self, Skeleton,4,800);
							Wld_SpawnNpcRange (self, SkeletonWarrior, 2, 800);
							Wld_SpawnNpcRange (self, SkeletonMage, 1, 800);
							Npc_RemoveInvItems(self, Katrakanat_book,1);
						}
						else
						{
							self.attribute[ATR_HITPOINTS] -= self.attribute[ATR_HITPOINTS_MAX] / 4;
						};
					};	
               
               open_kart = TRUE;
};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSTANCE KatarMap_Tomb(C_Item)
{	
	name 					=	"Mapa do grobowca";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	10;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseKatarMap_Tomb;

	description				= "Mapa do grobowca";

	TEXT[0]				= "Ratford zaznaczy³ na niej grobowiec.";

	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

FUNC VOID UseKatarMap_Tomb()
{
	var int nDocID;
		
	nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_MIS_WORLD_TOMB_KATRAKANAT.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSTANCE KatarMap(C_Item)
{	
	name 					=	"Mapa Katrakanat";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	200;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseKatarMap;

	description				= "Mapa Katrakanat";

	TEXT[0]					= "Mapa wskazuj¹ca miejsca ukrycia czêœci Katrakanat.";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]				= ;
	//TEXT[3] 				= "";
	//COUNT[3]				= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseKatarMap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_MIS_WORLD_KATRAKANAT2.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};
	
	
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSTANCE JackMap1(C_Item)
{	
	name 					=	"Mapa Aligatora";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	200;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseJackMap1;

	description				= "Mapa Aligatora";

	TEXT[0]					= "Brakuje du¿ej czêœci.";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]				= ;
	//TEXT[3] 				= "";
	//COUNT[3]				= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseJackMap1()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_ALIGATOR_1.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};	
/*****************************
Jakiœ model ork trzeba zrobiæ do tego
*****************************/


PROTOTYPE Proto_Katrakanat_piece (C_Item)
{
	name 				=	"Kawa³ek kamienia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Münze;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
INSTANCE Katrakanat_piece(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
INSTANCE Katrakanat_piece2(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
INSTANCE Katrakanat_piece3(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
INSTANCE Katrakanat_piece4(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
INSTANCE Katrakanat_piece5(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
INSTANCE Katrakanat_piece6(Proto_Katrakanat_piece)
{
	visual 				=	"ItMi_Focus_01.3ds";
};
//#############################################
//			Grog
//#############################################
	
INSTANCE ItFo_Innos_Booz(C_Item)
{
	name 			=	"Œwiêcony bimber";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Grog;	

	visual 			=	"ItMi_Rum_01.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHolybooze;
	scemeName		=	"POTIONFAST";

	description		= 	"Œwiêcony bimber";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Grog;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Grog;
};

FUNC VOID UseHolybooze()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS, HP_Grog);
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",90000);
	
   if(Npc_IsPlayer(self))
	{
		PutMsg("Ale ten samogon ma kopa!","font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_LOGENTRY,"");
	};
};		

//#############################################
	
INSTANCE ItFo_Lazur(C_Item)
{
	name 			=	"Lazurowy trzmiel";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	2*Value_Grog;	

	visual 			=	"ItMi_Rum_01.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLazur;
	scemeName		=	"POTIONFAST";

	description		= 	"Legendarny lazurowy trzmiel";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	(2*HP_Grog);
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	(2*Value_Grog);

};

FUNC VOID UseLazur()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS, 2*HP_Grog);
};

//******************pos¹¿ek inosa*****************
instance innos_statue(C_ITEM)
{
	name = "Pos¹¿ek Innosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Piêknie wykonany";
	text[3] = "pos¹¿ek Innosa.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

//tritiera
instance tri_innos_statue(C_ITEM)
{
	name = "Pos¹¿ek Innosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 250;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
 	text[2] = "Piêknie wykonany";
 	text[3] = "pos¹¿ek Innosa,";
 	text[4] = "boga ognia.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance tri_adan_statue(C_ITEM)
{
	name = "Pos¹¿ek Adanosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 250;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Elegancko zdobiony";
	text[3] = "pos¹¿ek Adanosa,";
	text[4] = "boga równowagi.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance tri_beliar_statue(C_ITEM)
{
	name = "Pos¹¿ek Beliara";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 250;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "";
	text[3] = "Pos¹¿ek Beliara,";
	text[4] = "boga ciemnoœci.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

//---------------------------------------------------------------------
INSTANCE Katrakanat(C_Item)
{	
	name 				=	"Katrakanat";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	//hp 					=	1;
	//hp_max 				=	1;
//	//weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Katrakanat - mroczny kamieñ";
	TEXT[2]				=	"z zaklêtem jestestwem.";
};

INSTANCE GRD_Prl_Swd (WeaponsMelee)
{	
	name 				=	"Miecz patrolowca";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	150; 	

	damageTotal			= 	58;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40; //12 
	cond_value[2]  		=	(3*cond_value[2])/2; 
	visual 				=	"ITMW_1H_SWORD_LONG_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE magpass(C_Item)
{	
	name 					=	"Przepustka";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	Usemagpass;
	description				=	"Przepustka do magów";

	TEXT[0]					=	"Papier jest zniszczony, ale woskowa";
	TEXT[1]					=	"pieczêæ jest w dobrym stanie";

};
func void Usemagpass ()
{   
		var int nDocID;
		
		nDocID = Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLines	( nDocID,  0, "(wielka, zalakowana pieczêæ i dziwny tekst)"					);
					Doc_PrintLines	( nDocID,  0, "powtarzaj stare zaklêcia ludzkoœci bajki i legendy,"					);
					Doc_PrintLines	( nDocID,  0, "bo tak zdobêdziesz dobro, którego nie zdobêdziesz,"					);
					Doc_PrintLines	( nDocID,  0, "powtarzaj wielkie s³owa, powtarzaj je z uporem,"					);
					Doc_PrintLines	( nDocID,  0, "jak ci co szli przez pustyniê i ginêli w piasku,"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "a nagrodz¹ ciê za to tym, co maj¹ pod rêk¹"					);
					Doc_PrintLines	( nDocID,  0, "ch³ost¹ œmiechu, zabójstwem na œmietniku,"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "idŸ, bo tylko tak bêdziesz przyjêty do grona zimnych czaszek,"					);
					Doc_PrintLines	( nDocID,  0, "do grona twoich przodków..."					);
					Doc_PrintLines	( nDocID,  0, "obroñców królestwa bez kresu i miasta popio³ów"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "B¹dŸ wierny, IdŸ i przejdŸ! "					);
					
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
};

INSTANCE milten_list(C_Item)
{	
	name 					=	"Lista ingrediencji";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	Usemilten_list;
	description				=	"Lista ingrediencji od Miltena";

	TEXT[0]					=	"Na tym pergaminie Milten spisa³";
	TEXT[1]					=	"listê roœlin, których potrzebuje";
};

func void Usemilten_list ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLines	( nDocID,  0, "Spis sk³adników niezbêdnych do stworzenia eliksirów:"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "- 3 serafisy, noœnik."					);
					Doc_PrintLines	( nDocID,  0, "- 5 piekielników, wzmacniacz."					);
					Doc_PrintLines	( nDocID,  0, "- 3 orkowych zielsk, wyt³umiacz."					);
					Doc_PrintLines	( nDocID,  0, "- 5 wilczych k³ów, absorben."					);
					Doc_PrintLines	( nDocID,  0, "- smoczy korzeñ, zespalacz."					);
					Doc_PrintLines	( nDocID,  0, "- czysty alkohol, destylant."					);
					Doc_PrintLines	( nDocID,  0, "- ¿¹d³o krwiopijcy, neutralizator."					);
					Doc_PrintLines	( nDocID,  0, "- 2 krucze ziela, do smaku."					);
					Doc_PrintLines	( nDocID,  0, "- liœæ dêbu, identyfikator."					);
					Doc_PrintLines	( nDocID,  0, "- nasienie czerwonego buka, ???"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Proszê nie prze¿uwaæ niczego z tej listy!"					);
					
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );

					if (milten_inged == FALSE)
					{
                  milten_inged = TRUE;
                  B_LogEntry		(CH2_RBL_Plants, "Lista ingrediencji: 3 serafisy, 5 piekielników, 3 orkowe ziela, 5 wilczych k³ów, smoczy korzeñ, czysty alkohol, ¿¹d³o krwiopilcy, liœæ dêbu i nasienie czerwonego buka. Lista jest imponuj¹ca i gdzie ja do cholery znajdê d¹b i czerwony buk?");
					};
};

INSTANCE dragon_root(C_Item)
{	
	name 				=	"Smoczy korzeñ";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	200;

	visual 				=	"ItFo_Plants_OrcHerb_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	USE_dragon_root1;
	scemeName			=	"FOOD";

	description			= 	name;

	TEXT[1]				= 	NAME_Bonus_Str;				
	COUNT[1]			= 	1;

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	200;
};

FUNC VOID USE_dragon_root1 ()
{
	B_AddAttributePoints(self,ATR_STRENGTH,1);
};

INSTANCE Mis_Jack_BlackPearl(C_Item)
{	
	name 				=	"Czarna per³a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;	

	value 				=	1000;

	visual 				=	"ItMi_DarkPearl.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;

// 	TEXT[1]				= 	NAME_Bonus_Str;				
// 	COUNT[1]			= 	1;

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	200;
};	

//---------------------------------------------------------------------
INSTANCE dusk_power (C_Item) 
{	
	name 				=	"Zorza potêgi";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	10;

	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Ten miecz nale¿a³ do zamienionego w o¿ywieñca";
	TEXT[1]				=	"kap³ana orków.";
	TEXT[2]				=	"Niestety, po tych wszystkich latach";
	TEXT[3]				=	"nie nadaje siê ju¿ do u¿ytku!";
	TEXT[4]				=	"Zimne ¿elazo emanuje mroczn¹ moc¹";
	TEXT[5]				=	"i dziwnie pulsuje.";
};

instance akw_ring(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	250;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_akw_ring;
	on_unequip				=	UnEquip_akw_ring;

	description		= "Pierœcieñ z akwamarynem";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Prot_Fire;
	COUNT[3]		= 10;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_akw_ring()
{
	self.protection [PROT_MAGIC] 		+=  5;
	self.protection [PROT_FIRE]		+=  10;
};

FUNC VOID UnEquip_akw_ring()
{
	self.protection [PROT_MAGIC] 		-=  5;
	self.protection [PROT_FIRE]		-=  10;
};

instance poor_sack(C_ITEM)
{
	name = "Sakiewka Œwistaka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = "Sakiewka z rud¹ nale¿¹ca do Œwistaka.";
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

/******************************************************************************************/
	INSTANCE Adan_Ring(C_ITEM)
{
	name 					=	"Pierœcieñ";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItRi_Prot_Mage_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Adan_Ring;
	on_unequip				=	UnEquip_Adan_Ring;

	description		= "Pierœcieñ duchowej równowagi";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 1;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Adan_Ring()
{
	self.protection [PROT_MAGIC] 		+=  10;
};

FUNC VOID UnEquip_Adan_Ring()
{
	self.protection [PROT_MAGIC] 		-=  10;
};
	
/******************************************************************************************/
INSTANCE Rat_ring(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	300;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Rat_ring;
	on_unequip				=	UnEquip_Rat_ring;

	description		= "Pierœcieñ si³y wojownika";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Bonus_Dex;
	COUNT[3]		= 5;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Rat_ring()
{
	B_ChangeAttribute(self,ATR_STRENGTH, 5);
	B_ChangeAttribute(self,ATR_DEXTERITY, 5);
};

FUNC VOID UnEquip_Rat_ring()
{
	B_ChangeAttribute(self,ATR_STRENGTH,- 5);
	B_ChangeAttribute(self,ATR_DEXTERITY, -5);
};

	