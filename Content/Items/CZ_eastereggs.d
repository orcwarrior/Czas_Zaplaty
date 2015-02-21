/*
   Pewien z³y mag autorstwa XLukasGX.
   Pisownia oryginalna.
*/

var int przeczytane_PZM; //ksi¹¿ki z³ego maga
var int ksiazka_PZM_01;
var int ksiazka_PZM_02;
var int ksiazka_PZM_03;
var int ksiazka_PZM_04;
var int ksiazka_PZM_05;
var int ksiazka_PZM_06;
var int ksiazka_PZM_07;
var int ksiazka_PZM_08;
var int ksiazka_PZM_09;
var int ksiazka_PZM_10;
var int ksiazka_PZM_11;
var int ksiazka_PZM_12;
var int ksiazka_PZM_13;
var int ksiazka_PZM_14;
var int ksiazka_PZM_15;
const int liczba_ksiazek_PZM = 15;

func void B_czytanie_pewnego_zlego_maga()
{
   if (przeczytane_PZM == liczba_ksiazek_PZM)
   {
      przeczytane_PZM += 1;
      
      PrintScreen("JESTEŒ WIELKIM FANEM 'PEWNEGO Z£EGO MAGA'!!!", -1, _YPOS_MESSAGE_LEVELUP, "font_old_20_white.tga", 5);
      PrintScreen("DOSTAJESZ +10 DO ZAJEBISTOŒCI!!!", -1, _YPOS_MESSAGE_LEVELUP + 20, "font_old_20_white.tga", 5);
   };
};

prototype ItWr_Pewien_zly_mag(C_Item)
{
   name 					=	"Pewien z³y mag";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Opowiadanie - Pewien z³y mag,";
   TEXT[0]				= "co chce zniszczyc kolonie i œwiat";
   TEXT[2]				= "Bestseller";
	TEXT[3]				= "autorstwa XLukasGX";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

instance ItWr_Pewien_zly_mag_01_01(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 1, tom 1";

	on_state[0] = UseItWr_Pewien_zly_mag_01_01;
};

FUNC VOID UseItWr_Pewien_zly_mag_01_01()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 1, tom 1");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Pewnego wieczornego dnia jeden mag rozmyœla³ jak zniszczyæ œwiat i kolonie.Ten mag stworzy³ pewnego demona który mia³ mu s³u¿yæ i pilnowaæ tajemnic zapisanych w swojej bibliotece. Mai³a jedn¹ ksi¹¿kê któr¹ by³a napisane:'By stworzyæ portal by wszy³y na œwiat armie ciemnoœci potrzeba 6 magów'Ale mag nie pos³ucha³ co by³o napisane spróbowa³ bez jednego maga.");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Gdy zaczêli tworzyæ portal to pojawi³o sie iskra czerwona i zgas³a . magowie byli tak s³abi jak ze drugi raz nie próbowali.Mag powiedzia³ 'trzeba czekaæ na wybrañca który bêdzie móg³ tworzyæ portal tak jak my wszyscy razem wziêci moc¹ bêdzie mia³ sile mocy jak nikt inny z magów na ty m œwiecie i koloni.gdy pewne go dnia mag imieniem Rox widzia³ to zdarzenie co sie dzia³ nad niebem pojawia³a sie czerwona iskra i znik³a to go nie zaniepokoi³o ,a by³ z znanym magiem wy¿szej rangi.Napisa³ list do Króla Rhobara II.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_01)
   {
      ksiazka_PZM_01 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_01_02(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 1, tom 2";

	on_state[0] = UseItWr_Pewien_zly_mag_01_02;
};

FUNC VOID UseItWr_Pewien_zly_mag_01_02()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 1, tom 2");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy list dotar³ to król Rohobar II on nie pos³ucha³ maga Roxa i napisa³ :'¯e ¿adne g³upia iskra co pojawi³a sie w koloni nie jest naszym za gro¿eniem 'Ale mag imieniem Rox ni przesta³ zacz¹³ szukaæ w bibliotece w zamku po 24 godzinach spêdzeniu szukania ksi¹¿ki, znalaz³ ja mia³a tytu³ 6 magów.I przewraca³ strony i znalaz³ treœæ, dziwna iskra i by³o napisane: 'Dawno temu przed lat temu byli");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "magowie robili to w z³ej wierze gdy to chcieli by³ pewien mag który dosta³ sie do wie¿y i zniszczy³ tych magów by³ to potê¿ny od tych magów razem wziêtych mag imieniem Daster który zauwa¿y³ dziwna iskrê zniszczy³ i zapomniane w tej bibliotece.'Rox zrozumia³ ze ten wybraniec ju¿ dawno nie ¿yje.i zacz¹³ czekaæ na swoje go wybrañca.A¿ pewnego dnia powi³ sie na skraju pewien cz³owiek i on nie wiedzia³ ze dwaj magowie czekaj¹ na niego. i on mia³ z mieniæ los ca³ego œwiata.Magowie sie obwiali po czyjej stronie stanie.... C.D.N.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_02)
   {
      ksiazka_PZM_02 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_02_01(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 2, tom 1";

	on_state[0] = UseItWr_Pewien_zly_mag_02_01;
};

FUNC VOID UseItWr_Pewien_zly_mag_02_01()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 2, tom 1");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy przyby³ nasz bohater do koloni po drodze na potka³ dwóch stra¿ników.I zaczêli go biæ i go kopaæ a¿ nagle b³ysnê³a iskra nagle zniknêli stra¿nicy.To by³ Rox który uratowa³ nasz go bohatera.Rox nie wiedzia³ ze nasz bohater to ten cz³owiek który mia³ po krzy¿owaæ plany z³ego maga .Bezimienny spyta³ :'Dlaczego mi pomog³eœ przecie¿ mnie nie znasz.");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Rox odpowiedzia³ mu na to pytanie:Wiem pomog³em ci bo ty mi sie wydajesz inny ni¿ wszyscy skazañcy razem wziêci. Rox w myœlach: Nie wiem czy to ten cz³owiek ale zobaczymy.Bezimienny spyta³ Roxa :Kto to byli za stra¿nicy którzy mnie zaatakowali byli inni ni¿ my wszyscy mieli jakiœ pentagram na rêkach. Rox powiedzia³ mu: To byli nowicjusze z³ego maga nie wiem dlaczego ciebie zaatakowali sie dziwie trochê. Musia³eœ byæ cenny dala nich.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_03)
   {
      ksiazka_PZM_03 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_02_02(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 2, tom 2";

	on_state[0] = UseItWr_Pewien_zly_mag_02_02;
};

FUNC VOID UseItWr_Pewien_zly_mag_02_02()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 2, tom 2");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Bo rzadko wysy³a nowicjuszy na tak¹ wyprawê z³y mag. Bezimienny spyta³: A sk¹d o tym wiesz czci godny magu przecie¿ do nich nie nale¿a³eœ?? Rox odpowiedzia³: ¯e kiedyœ nale¿a³em do pewnego z³ego maga w samotnej wie¿y by³em 6 magiem studiowa³em u niego kiedyœ by³em u niego dobrym uczniem ale opuœci³em go dawno temu.Ale to d³uga historia póŸniej ci opowiem.");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, " Opowiem ci dalszy ci¹g gdy przyjdzie odpowiedni pora. gdy bezimienny poszed³ z magiem roxem. W opuszczonej wie¿y z³e go mag juz poinformowali zwiadowcy ze ich wybraniec ju¿ jest tu.Mag ju¿ wiedzia³ ze jego by³y uczeñ zwany rox chce mu odebraæ wybrañca i nakaza³ zabiæ roxa jak bêdzie sprawia³ k³opoty pojmanie nasze go bohatera. Pewnej nocy przyœni³o bezimiennemu mu sie : Gdy rox opowiada³ zaatakowali i sen sie urywa...C.D.N.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_04)
   {
      ksiazka_PZM_04 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_03_01(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 3, tom 1";

	on_state[0] = UseItWr_Pewien_zly_mag_03_01;
};

FUNC VOID UseItWr_Pewien_zly_mag_03_01()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 3, tom 1");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy bezimienny natychmiast sie obudzi³ sie poczu³ jakieœ dreszcze nagle zemdla³. pewnego ranka przechodzi³ tam stra¿nik(imieniem goth) który sprawdza³ domki .Nagle przechodzi³ ko³o domku bezimiennego ze ktoœ le¿y na ziemi. Stra¿nik Goth szybko wezwa³ maga Roxa bo on zna³ sie na tych sprawach. Stra¿nik Goth spyta³ maga Roxa :Co jest z nim??");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Rox odpowiedzia³: Nie wiem ale wydaje mi sie ze coœ z nim sie dzieje. Rox spojrza³ swoja dawno ksiêgê któr¹ ma pod rêkom .ta ksiêga mia³a nazwê ' Dawne i zakazane moce' i wyszuka³ informacje takie: Pewnego dnia by³ kiedyœ mag który by³ modrym alchemikiem stworzy³ miksturê któr¹ by³a zrobiona z bagiennego ziela o na dawa³ moc odzysku pe³ni si³ po pewnym koszmarze którym sie triwia tylko nie licznym i co os³abia cz³owieka.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_05)
   {
      ksiazka_PZM_05 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_03_02(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 3, tom 2";

	on_state[0] = UseItWr_Pewien_zly_mag_03_02;
};

FUNC VOID UseItWr_Pewien_zly_mag_03_02()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 3, tom 2");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Rox sie doczyta³ ile trzeba sk³adników:20 sztuk bagiennego ziela i 5 fiolka krwi wilka oraz menzurka by wymieszaæ sk³adniki. By stworzyæ miksturê:Pierw wrzucamy 20 sztuk bagiennego ziela mieszamy 5 minut oraz 5 fiolek trochu wlewamy fiolki krwi wilka. ");
            Doc_PrintLine	( nDocID,  0, "");
            
            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Rox na szczêœcie mia³ pod rêkom 5 fiolek krwi ale mu brakowa³o bagiennego ziela 5 sztuk. Goth obrazu ruszy³ do zamku podwêdzaæ 5 sztuk bagiennego ziela C.D.N");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_06)
   {
      ksiazka_PZM_06 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_04(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 4";

	on_state[0] = UseItWr_Pewien_zly_mag_04;
};

FUNC VOID UseItWr_Pewien_zly_mag_04()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 4");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy w tym czasie stra¿nik goth zdobywa³ bagienne ¿ele dla maga roxa. W tym czasie z³y mag ju¿ knu³ pewien plan. Kaza³a pewnemu stra¿nikowi z obozu zwany imieniem Taz. Powiedzia³ mu tak z³y mag:Bêdziesz donosi³ mi co robi mój uczeñ zwany rox i bêdziesz póŸniej musia³ zbiæ moje go uczni to ci powiem jak przyjdzie pora.Rox czeka³ na bagienne ziele. zacz¹³ sie martwic czy zd¹¿y go uratowaæ.Swojego przyjaciela.A¿nagle w biegu przyby³ goth");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLines	( nDocID,  1, "z zielem. Rox od razu wzi¹³ do roboty zacz¹³ mieszaæ sk³adniki.Stworzy³ miksturê da³ popiæ bezimiennemu a¿ nagle sie obudzi³ spyta³ sie roxa: rox ty ¿yjesz myœla³em ze nie ¿yjesz.Rox spyta:³ ale o co chodzi?? bo ca³y czas ¿y³em.bezimienny od powiedzia³: Rox to by³ tylko sen to dobrze œni³o mi sie ze ty mi opowiadasz jak¹œ historie o z³ym magu i jego wie¿y a tu nagle stwory sie pojawiaj¹ ciê zbijaj¹ tu mi sen sie urywa. Rox mówi Wiesz co zdaje mi sie ze trzeba ciê przygotowaæ walce i sztukach magi. Ja ciê nucze w sztuce magi a mój przyjaciel goth nuczy ciê sztuki walki.C.D.N");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_07)
   {
      ksiazka_PZM_07 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_05_01(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 5, tom 1";

	on_state[0] = UseItWr_Pewien_zly_mag_05_01;
};

FUNC VOID UseItWr_Pewien_zly_mag_05_01()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 5, tom 1");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Naszego bohatera po³udniowego dnia zacz¹³ trenowaæ Goth. Goth powiedzia³ do bezimiennego:To bêdzie ciê¿ka walka nie spodziewaj sie ze ci dam fory. Bezimienny spyta³ pewny siebie:A co jak ciê pokonam.Goth opowiedzia³:Nie b¹dŸ taki pewny walczy³em kiedyœ w oddzia³ach królewskich jako dowódca prawej flanki. Jeszcze pamiêtam jak Lee walczy³");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "i dobrze kierowa³ dzia³ami to by³ najlepszy dowódca i wybitny strateg. Od niego du¿o sie nauczy³em walczyæ raz przewidywaæ zagro¿enie.Bezimienny spyta³ :Za co tu trafiliœcie dlaczego??Goth odpowiedzia³ ze z³oœci¹:Wiesz do dzisiaj jestem z³y na naszego króla,o skar¿y³ mnie i Lee o spiskowanie zabójstwa.Napisali to sêdzi¹ i burmistrz.Ze my szykujemy plan zabicia króla i jego ca³¹ rodzinne .Mnie oskar¿yli o spiskowanie przeciwko królowi a Lee zosta³ oskar¿ony o zbicie ¿ony króla.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_08)
   {
      ksiazka_PZM_08 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_05_02(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 5, tom 2";

	on_state[0] = UseItWr_Pewien_zly_mag_05_02;
};

FUNC VOID UseItWr_Pewien_zly_mag_05_02()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 5, tom 2");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Do dziœ czekamy a¿ z st¹d sie wydostaniemy zemœcimy sie na króla.Dobra bierzmy sie do walki póŸniej ci opowiem wieczorem przy piwie.Gdy w tedy bezimienny walczy³ z gothem z³y mag ju¿ mia³ pierwsze wieœci od stra¿nika Taza:Czci godny magu mam z³e wieœci pewien stra¿nik imieniem goth uczy jakiegoœ cz³owieka walki mieczem. Mag z³y odpowiedzia³ spokojnie.");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Przygotuj sie by zabiæ Roxa lale to juz wieczorem bo on ma go nauczyæ pewnej sztuki co ode mnie sie nauczy³.dam ci dobry miecza nosi³ go jeszcze pewien mag który ju¿ dawno nie ¿yje. ten miecza ma taka moc ze tylko wybraniec opanowaæ jego miecza.Ale dla ciebie bêdzie potrzebny do zbicia maga Roxa.Tylko go nie zgub bo to artefakt cenny.Taz odpowiada:Mistrzu ten miecz jeszcze do ciebie powróci. Ruszy³ w drogê Taz.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_09)
   {
      ksiazka_PZM_09 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_05_03(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 5, tom 3";

	on_state[0] = UseItWr_Pewien_zly_mag_05_03;
};

FUNC VOID UseItWr_Pewien_zly_mag_05_03()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 5, tom 3");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy Goth trenowa³ bezimiennego.Goth zobaczy³ ze cienko mu idzie walczyæ i mu odpowiedzia³:U¿yj si³y woli swojego umys³u. niech twoja rêka bêdzie jak piórko a miecz jak trzyma³ kij to ca³a sztuczka w mojej walce.Gdy bezimienny skupi³ pojawi³o mus sie nagle przysz³oœæ jak goth próbuje zrobiæ pewn¹ sztuczkê która bezi nie wiedzia³ sam.");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Nagle goth w biego robi obrót bezimienny obroni³ sie przed uderzeniem . Goth zaskoczony.sk¹d wiedzia³eœ ze sie zrobiê obrót przecie¿ ci nie pokazywa³em.Bezimienny odpowiedzia³ to co mi kaza³eœ skupi³em sie i nagle pojawi³ sen jak ty mnie atakujesz przed twoim uderzeniem .Goth zdziwiony widzê ze jesteœ inny ni¿ wszyscy moi uczniowie do stanierz bron i pancerz o de mnie .Bezimienny odpowiedzia³ : dziêki goth to spotykamy sie wieczorem przy ognisku.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_10)
   {
      ksiazka_PZM_10 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_05_04(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 5, tom 4";

	on_state[0] = UseItWr_Pewien_zly_mag_05_04;
};

FUNC VOID UseItWr_Pewien_zly_mag_05_04()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 5, tom 4");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy bezimienny poszed³ spaæ po treningu. Goth poszed³ do roxa do zamku. Goth :Witaj Rox wiesz co sie zdarzy³o przy treningu zaskoczy³ mnie swoja walkom powiedzia³em mu jedn¹ z moich tajemnic w walce on wykorzysta³ o sto razy lepiej u¿y³ swoje go umys³u wiedzia³ kiedy atak nast¹pi. Rox odpowiedzia³:");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Wiesz ja to ju¿ od dawna wiedzia³ ze ten cz³owiek jest inny to mo¿e byæ nasz wybraniec. wiedzia³em w tedy jak jak by³ os³abiony itakiej mocy widzenia przez sen.Jak co Zostanie to nasz tajemnica nikt wiêcej sie nie do wie ze mamy wybrañca. goth i nie mów nawet naszemu cz³owiekowi którego trenowa³eœ dziœ.Gdy zbli¿a³ sie wieczór bezimiennemu znowu przyœni³o. C.D.N");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_11)
   {
      ksiazka_PZM_11 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_06_01(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 6, tom 1";

	on_state[0]	= UseItWr_Pewien_zly_mag_06_01;
};

FUNC VOID UseItWr_Pewien_zly_mag_06_01()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 6, tom 1");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Pewnego wieczora zaczê³o bezimiennemu sie œnic. Œni³o mu sie porwali go dwaj uczniowie z³e go maga do wie¿y gdy mia³ ju¿ gadaæ z³ym magiem . Nagle go budzi Rox: Wstawaj co ciê tak trening wymêczy³ cho za mn¹.czekamy na ciebie chyba ju¿ chyba godzinê.Bezimienny wiesz œni³o mi sie znów. Rox za niepokojony : Co ci sie œni³o???");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "bezimienny Odpowiedzia³ pewni uczniowie mnie porwali ci którzy na pocz¹tku no wiesz. Zaprowadzili mnie do maga z³ego nie widzia³em jego twarzy mia³ czerwone oczy za kaptura iskrzy³y moc¹. I w tedy mnie obudzi³eœ. Rox odpowiedzia³ :Ten sen coœ znaczy. bezimienny :Co znaczy??Rox ja wiem sie objawiam sie .Gdy ju¿ dochodz¹ do ogniska.Goth podochodzi mówi :Co tak d³ugo ???Gdy by nie ja to by ca³e piwo wam wypili. Rox odpowiedzia³ :posz³êm go obudziæ spa³.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_12)
   {
      ksiazka_PZM_12 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_06_02(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 6, tom 2";

	on_state[0]	= UseItWr_Pewien_zly_mag_06_02;
};

FUNC VOID UseItWr_Pewien_zly_mag_06_02()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 6, tom 2");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Bezimienny spyta³ przy ognisku :Pamiêtasz na pocz¹tku jak mnie uratowa³eœ mia³eœ mi opowiedzieæ o sobie i tym z³y magu.Rox opowiedzia³:Dobra opowiem ci.Gdy by³em jeszcze by³em uczniem Pyrokara to by³o jeszcze gdy bariery nie by³o przyby³ pewien mag .Który teraz jest z³ym magiem.Ten mag by³ pos³añcem tez nale¿a³ do z Rady magów Wy¿szej.pamiêtam jak to dziœ.");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Przyszed³ lis od króla.Pyrokar wys³a³ 13 magów by stworzyli barierê.Gdy ja zosta³em przyjêty do rady magów wys³ali mnie do koloni pomóc temu magu co ci mówi³em.Gdy przyby³em do zamku . mistrz spyta³ : idziesz ze mn¹ do starej wie¿y??ja gdy zosta³em magiem rady. Pyrokar³ kaza³ s³uchaæ go pomagaæ mu. I w tedy od powiedzia³em ze pójdê z nim.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_13)
   {
      ksiazka_PZM_13 = true;
      
      przeczytane_PZM+=1;
   };
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_06_03(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 6, tom 3";

	on_state[0]	= UseItWr_Pewien_zly_mag_06_03;
};

FUNC VOID UseItWr_Pewien_zly_mag_06_03()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 6, tom 3");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy doszliœmy do wie¿y pilnowa³ jeden demon.Pewien czar b³ysnê³a iskra nagle demon zacz¹³ mówiæ s³uchaæ mistrza.W tedy domyœli³em sie ze jest nekromanta wie¿y w beliara.Ale chcia³em poznaæ moc beliara uczy³em sie z nim.gdy pewnego latach zaczê³o ³ sie z nim coraz gorzej stawa³ sie coraz bardziej mamrota³ przez sen.Zniszczê œwiat ii kolonie .Dla tego go opuœci³em.");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Do dziœ mnie nie na widzi.Bezimienny odpowiedzia³:czy wiedz¹ ze znasz ta Inoosa i Beliara. Rox odpowiedzia³: tak ale gdy na pocz¹tku przyszy³em prawie magowie chcieli mnie zbiæ za to chcieli. Im powiedzia³em ze nie wykorzystam na nich tej mocy i ni kogo nie bêdê uczy³.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_14)
   {
      ksiazka_PZM_14 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance ItWr_Pewien_zly_mag_06_04(ItWr_Pewien_zly_mag)
{
   TEXT[1] = "Czêœæ 6, tom 4";

	on_state[0]	= UseItWr_Pewien_zly_mag_06_04;
};

FUNC VOID UseItWr_Pewien_zly_mag_06_04()
{   
   var int nDocID;
   
   nDocID = Doc_Create		()			  ;								// DocManager 
            Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

            Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
            Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
            
            //1.Seite
            
            Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
            Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
            Doc_PrintLine	( nDocID,  0, "Pewien z³y");
            Doc_PrintLine	( nDocID,  0, "mag");
            Doc_PrintLine	( nDocID,  0, " "			);
            Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
            Doc_PrintLine	( nDocID,  0, "Czêœæ 6, tom 4");
            Doc_PrintLine	( nDocID,  0, "");
            Doc_PrintLines	( nDocID,  0, "Gdy wszyscy poszli spaæ zosta³ trojka przy ognisku.Nagle pojawi³ sie Taz. Goth spyta³ a ty nie nawarcie??Taz ze z³oœciom opowiedzia³:teraz was zabije oprócz a wsze go ucznia który nam sie przyda. Wiem ze chcecie go wykorzystaæ i wiem ze ma potêznom moc.Bezimienny Zaskoczony:Jak¹ moc i o co mu chodzi??Rox: nie s³ucha go bo to k³amca.");
            Doc_PrintLine	( nDocID,  0, "");

            //2.Seite
            Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLines	( nDocID,  1, "Taz : to jest prawda od pocz¹tku wiemy ze przyby³eœ .Nagle przy Rozmowie pojawili sie uczniowie z³e go maga.Taz rozkazuje: bierzcie ich ucznia ja sie zajmie roxem i gothem.");	
            Doc_PrintLine	( nDocID,  1, "");
            Doc_PrintLine	( nDocID,  1, "");
            Doc_Show		( nDocID );
            
   if (!ksiazka_PZM_15)
   {
      ksiazka_PZM_15 = true;
      
      przeczytane_PZM+=1;
   };
   
   B_czytanie_pewnego_zlego_maga();
};

instance worek(C_Item)
{
   name 					=	"Worek";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;
   
   scemeName			=	"FOOD";

	description			= "Pewien z³y mag, co chce zniszczyc kolonie i œwiat";
   TEXT[0]				= "";
   TEXT[1]				= "Bestseller";
	TEXT[2]				= "autorstwa XLukasGX";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
   
   on_state[0]	= UseWorek;
};

func void UseWorek()
{
   var c_npc hero; hero = hlp_getnpc(PC_Hero);
   
   CreateInvItem(hero, ItWr_Pewien_zly_mag_01_01);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_01_02);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_02_01);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_02_02);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_03_01);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_03_02);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_04);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_05_01);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_05_02);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_05_03);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_05_04);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_06_01);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_06_02);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_06_03);
   CreateInvItem(hero, ItWr_Pewien_zly_mag_06_04);
};