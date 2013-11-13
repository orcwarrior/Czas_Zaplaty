/***************************************************

CHAPTER 4 ITEMS

***************************************************/

//Items by Sher

//****************G³owy szkodników************
prototype head_org(c_item)
{
   name = "G³owa szkodnika";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual 				=	"Sly_Head.3DS";
	material = MAT_LEATHER;
	description			= 	name;
	text[2] = "To makabryczne trofeum";
	text[3] = "to g³owa jednego z uciekinierów,";
	text[4] = "których mia³em zabiæ dla Laresa.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

instance HEAD1_org(head_org)
{
};

instance HEAD2_org(head_org)
{
};

instance HEAD3_org(head_org)
{
};

instance HEAD4_org(head_org)
{
};

/************************
Orle gniazdo
*************************/
INSTANCE EN_Bandage (WeaponsMelee)
{	
	name 				=	"Banda¿";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
INSTANCE almanach_res (C_Item)
{	
	name 					=	"Almanach odrodzenia";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	500;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Almanach odrodzenia";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usealmanach_res;
};

FUNC VOID Usealmanach_res()
{   
   var int nDocID;
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
            
            //1.Seite
               Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Almanach odrodzenia"			);
            Doc_PrintLine	( nDocID,  0, "-----------");
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Ksiêga jest oprawiona w ¿elazo i miedŸ. Na ok³adzinach wyryto insygnia trzech bogów. Ta ksiêga musi byæ niezwykle stara. Ciekawe kto j¹ napisa³?");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Nie rozumiem nic z tego co tu napisano. To jakiœ dziwny, archaiczny jêzyk.");
            Doc_Show		( nDocID );
         
            if (alman_read == FALSE)
            {
               Snd_Play("FoundRiddler");
               B_LogEntry(CH4_GRD_RuneSwd, "Znalaz³em almanach! Nic nie zrozumia³em z zapisanego tam be³kotu. Muszê czym prêdzej zanieœæ ksiêgê Lerenowi.");
            
               alman_read = TRUE;
            };
};

INSTANCE alm_log (C_Item)
{	
	name 					=	"Kartka od Lerena";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	Usealm_log;
	description				=	"Kartka od Lerena";

	TEXT[0]					=	"Mag spisa³ tu ca³y tekst, który zdo³a³";
	TEXT[1]					=	"odczytaæ z almanachu.";
};
func void Usealm_log ()
{
   var int nDocID;
   
   nDocID = 	Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
            Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
            Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
            
            Doc_PrintLines	( nDocID,  0, "Formu³a rytua³u"					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, "W zasadzie jest to opowieœæ, a nie konkretna odpowiedŸ na nasze pytania."					);
            Doc_PrintLines	( nDocID,  0, ""	);
            Doc_PrintLines	( nDocID,  0, "Tylko ja pozosta³em po pogromie... Bestia po¿ar³a cia³a i dusze mych przyjació³... Kiedy objawi³ siê sam Beliar, nie mia³em ju¿ ¿adnych z³udzeñ - nasta³ kres naszej rasy, orkowie zalali nas niczym mo¿e wœciek³oœci... Dusze i pragnienia najmê¿niejszych spoœród mych braci zosta³y po wsze czasy uwiêzione w plugawym sercu Bestii! Moi bracia odzyskaj¹ wolnoœæ tylko wtedy, gdy Bestia zostanie zg³adzona, a jej serce zniszczone z pomoc¹ mocy gwiezdnych kryszta³ów... Jednak moc jaka wtedy zostanie wyzwolona, musi zostaæ zamkniêta w potê¿nym artefakcie, inaczej zniszczy ca³¹ krainê, w której zosta³a uwolniona! Strze¿cie siê Bestii, lecz nie traæcie nadziei, bo ka¿de z³o mo¿na zwyciê¿yæ..."					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_PrintLines	( nDocID,  0, ""					);
            Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
         
            Doc_Show		( nDocID );
		
   if (!alm_log_read)
   {
      alm_log_read = TRUE;
      Log_CreateTopic	(CH4_RBL_Almanach, LOG_MISSION);
      Log_SetTopicStatus	(CH4_RBL_Almanach, LOG_RUNNING);
      B_LogEntry		(CH4_RBL_Almanach, "W koñcu pozna³em historiê spisan¹ w 'Almanachu odrodzenia'. Aby przywróciæ ostrzu jego moc, muszê zg³adziæ jak¹œ Bestiê i zniszczyæ jej serce za pomoc¹ gwiezdnych kryszta³ów - czymkolwiek by one nie by³y. Muszê porozmawiaæ z Lerenem, mo¿e on rozwik³a tê zagadkê.");
   };
};

/******************************************************************************************/
INSTANCE ItMiJoint_Lester(C_Item)
{
	name 				=	"Podejrzany narkotyk od Lestera";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	2*Value_Joint3;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_4;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_4()
{
	if (!lester_joint)
	&& Npc_IsPlayer (self)
	{
		AI_PlayAni(self,	"T_PSI_VICTIM");
		PutMsg("Moja g³owa!","font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_LOGENTRY,"");
		lester_joint = TRUE;
      
      DreamID = DREAM_BLOODYSWAMP;

	/******************
	Ork nie mam pojêcia jak to chcesz zrobiæ tu masz opis od aragorna

   Opis snu:

   Podbiega do nas wiarus. W tle ma miejsce walka miêdzy templariuszami a besti¹. Obóz p³onie

   wiarus- Nie stój tak! Dob¹dŸ broni i ruszaj ku chwale œni¹cego!

   Wiarus do³¹cza do walki, a my zostajemy sami poœród rzezi
   Nie mo¿emy daæ siê zabiæ ( mówi nam o tym Lester we wczeœniejszym dialogu).
   Death = game over
   Trwa walka, w której potwór wyrzyna kolejne zastêpy wiarusów. Walczymy z pomocnikami bestii, staraj¹c siê do niej nie zbli¿aæ.
   Po jakimœ czasie zjawia siê przy nas Baal Tondral>

   Baal Tondral- Œni¹cy oœwieci³ mój umys³! Bestia z³o¿y mu pok³on, a ty bêdziesz tym, który ugnie jej kolana!
   Rick- Cz³owieku, dobrze siê czujesz?
   Baal...- Milcz psubracie! Wypij ten wywar i do boju!!!
   Rick- Oszala³eœ? przecie¿ to trucizna!
   Baal...- Powiedzia³em pij! Nie sprzeciwiaj siê woli Œni¹cego!

   Budzimy siê ze snu. Stoi przy nas Lester i rozpoczyna dialog 

   L- Ma³o brakowa³o, a przyp³aci³byœ ten eksperyment ¿yciem. Zauwa¿y³eœ coœ szczególnego? 
   R- Wiem ju¿ jak zabiæ bestiê... Potrzebujemy trucizny, bardzo silnego wywaru... 
   L- Zastanów siê trochê! Sk¹d weŸmiesz odpowiedni¹ truciznê i w jaki sposób nakarmisz ni¹ potwora?
   R- O to siê nie martw. W obu przypadkach pomo¿e nam Baal który przyby³ ostatnio do naszego obozu.
   L- Nie rozumiem...
   R- Zrozumiesz gdy z nim pogadam. Za mn¹.

   DZIENNIK
   Zabiæ smoka
   3. Mia³em dziwny sen... Dziêki niemu dowiedzia³em siê jak zabiæ bestiê. Potrzebujê silnej trucizny i kogoœ kto dostarczy j¹ kreaturze. W obu przypadkach pomo¿e mi Baal Tondral

   *********************************/
	};
};


/*******************************

Ork dorób te itemy bo nie wiem jaki model:
beast_heart - serce Bestii
bal_heart - serce Tondrala

Ork zrób knif, ¿e jak dick zje serce bestii to siê zamieni w jakiegoœ ochydnego potwora, mo¿e nawet w t¹ bestiê. To oczywiœcie bêdzie game over, chyba, ¿e gracz bêdzie chcia³ zabiæ wszystko co ¿yje w kolonii pod now¹ postaci¹ ;)
******************************/

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/**************
Ork trzeba stworzyæ ³¹cznie 10 takich kawa³ków, czyli 9 bez tego od nefariusa. To bêdzie taki nasz Chromanin xD
Porozsiewaj je gdzie siê da, to moje propozycje:
- wie¿a gomeza, jedna ze skrzyñ, albo rzucona gdzieœ za pakami, ¿eby nie da³o siê ³atwo znaleŸæ.
- zatopiona wie¿a Xardasa, jedna ze skrzyñ.
- chata Cavalorne'a, prywatna skrzynia szefa rblwó.
- szczyt klasztoru zmiennokszta³tnych tam gdzie jest ta skrzynia i trol
- karczma w Nowym Obozie, jedna ze skrzyñ, tam gdzie siê pêdzi bimber
- 2 kawa³ki w skrzyniach wie¿ na terenie orków
- œwi¹tynia na bagnach, jedna ze skrzyñ
- jak siê idzie do orków, mija siê Pacho, po prawej s¹ te kamienne wystêpy p[o których mo¿na wejœæ wy¿ej. Tam jest jaskinia po drodze, wrzuæ tam skrzyniê i jeden kawa³ek mapy


Te kawa³ki to powinny byæ puzle, po z³o¿eniu wska¿¹ jakieœ charakterystyczne miejsce ukrycia tego "skarbu". Oczywiœcie skarb to nie jest góra diamentów, super pancerz z kosmosu czy 5m miecz, ale bezcenny dla kap³anów adanosa Kilt Pierwszego Kap³ana [szatê sêdziego mo¿na do tego wykorzystaæ czy t¹ zdobion¹ szatê magów co chyba nie by³a wykorzystana w grze], albo jakaœ ksiêga czy tam pos¹¿ek, sam zdecyduj.
oczywiœcie mo¿esz tam te¿ wrzuciæ jak¹œ super receptê, czarn¹ rudê, mo¿e jak¹œ runê, etc. Chodzi o to, ¿eby zrekompensowaæ graczowi poszukiwania tego "skarbu"

Jak dick przyniesie nefariusowi wszystkie kawa³ki to ten skleci z tego mapê do skarbu i razem rusz¹ na wyprawê

**************/
prototype treasure_piece(c_item)
{
   name 					=	"Kawa³ek mapy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION|ITEM_MULTI;

	value 					=	10;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseTRM1;

	description				= "Kawa³ek starej mapy";

	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

INSTANCE treasure_piece1(treasure_piece)
{	
	on_state[0]				=	UseTRM1;
};

FUNC VOID UseTRM1()
{
   var int nDocID;
   //TODO:
   //Jedna funkcja która ³aczy wszstkie kawa³ki jezeli je posiadasz
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_1.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece2(treasure_piece)
{		
	on_state[0]				=	UseTRM2;
};

FUNC VOID UseTRM2()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_2.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece3(treasure_piece)
{	
	on_state[0]				=	UseTRM3;
};

FUNC VOID UseTRM3()
{
   var int nDocID;
   
   nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_3.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece4(treasure_piece)
{	
	on_state[0]				=	UseTRM4;
};

FUNC VOID UseTRM4()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_4.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece5(treasure_piece)
{	
	on_state[0]				=	UseTRM5;
};

FUNC VOID UseTRM5()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_5.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece6(treasure_piece)
{		
	on_state[0]				=	UseTRM6;
};

FUNC VOID UseTRM6()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_6.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece7(treasure_piece)
{	
	on_state[0]				=	UseTRM7;
};

FUNC VOID UseTRM7()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_7.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_piece8(treasure_piece)
{		
	on_state[0]				=	UseTRM8;
};

FUNC VOID UseTRM8()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TORN_8.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

INSTANCE treasure_map(treasure_piece)
{	
	name 					=	"Mapa do skarbu";

	value 					=	1000;

	on_state[0]				=	UseTRM11;

	description				= name;
};

FUNC VOID UseTRM11()
{
   var int nDocID;
   
   nDocID = Doc_CreateMap	()			  ;							// DocManager 
            Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
            Doc_SetPages	( nDocID, 1 );                         
            Doc_SetPage 	( nDocID, 0, "MAP_TREASURE.tga", 1	);  //  1 -> DO NOT SCALE 
            Doc_Show		( nDocID 	);
};

instance treasure_statu(C_ITEM)
{
	name = "Pos¹¿ek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 250;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
// 	text[2] = "Piêknie wykonany";
// 	text[3] = "pos¹¿ek Innosa,";
// 	text[4] = "boga Ognia.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

//------------------------------
// FOCI
//------------------------------
prototype Focus(C_Item)
{
	name 				=	"Kamieñ ogniskuj¹cy";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Jeden z piêciu artefaktów u¿ytych";
	TEXT[2]				=	"przy tworzeniu Bariery.";
};

INSTANCE Focus_1(Focus)
{	
	name 				=	"Kamieñ z morskiego klifu";
};
INSTANCE Focus_2(Focus)
{	
	name 				=	"Kamieñ z kanionu trolli";
};
INSTANCE Focus_3(Focus)
{	
	name 				=	"Kamieñ z górskiej fortecy";
};
INSTANCE Focus_4(Focus)
{	
	name 				=	"Kamieñ ze starego klasztoru";
};
INSTANCE Focus_5(Focus)
{	
	name 				=	"Kamieñ z kamiennego krêgu";
};

INSTANCE beast_heart (C_Item)
{
	name 				=	"Serce";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 				=	1000;

	visual 				=	"ItAt_FireGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "To serce pochodzi ze szcz¹tków";
	TEXT[1]				= "bestii która pokona³em na bagnach.";
// 	TEXT[2]				= "Jego magiczna moc pozwala";
// 	TEXT[3]				= "podpaliæ przeciwnika.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Feuerherz;
};
INSTANCE baal_heart (C_Item)
{
	name 				=	"Serce";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 				=	1;

	visual 				=	"ItAt_Molerat_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "Wyjête z Baala Tondrala!";
// 	TEXT[2]				= "Jego magiczna moc pozwala";
// 	TEXT[3]				= "podpaliæ przeciwnika.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Feuerherz;
};
