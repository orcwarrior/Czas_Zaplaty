//**////////////////////////////////////////////**
//**	R E C E P T S							**
//**////////////////////////////////////////////**
//** F O R   M O R E   S E E - ReceptStuff.d	**
//**////////////////////////////////////////////**
//** - O R C W A R R I O R						**
//**////////////////////////////////////////////**

/*Jezeli 3 podstawowe zmienne poswiêcone na skladniki produktu recepty nie wystarczaj¹, 
mozna uzyæ protection(Instance sk³adników) i damage(wymagana iloœæ sk³adnika). 
Max. dodatkowych przedmiotów to 8 (od 0 do 7)
*/

//ALL RECEPTS PROTO
//
/*
INSTANCE Recept_$instanceproduktu(C_Item)
{
	name 					=	"Recepta";//Nazwa:Nie zmieniaæ
	mainflag 				=	ITEM_KAT_DOCS;//Kategoria:nie zmieniac
	makingmob				=	1;//Nieu¿ywane!
	product_amount			=	1;//iloœæ wyprodukowanych produktów np. 50 = 50 strza³
	product					=	1;//instance produktu
	needitm_amount[0]				=	1;	//wymagana iloœc przedmiotu 1
	needitm_amount[1]				=	1;	//wymagana iloœc przedmiotu 2	
	needitm_amount[2]				=	1;	//wymagana iloœc przedmiotu 3
	damage[0]				=	1;	//wymagana iloœc przedmiotu 4
	damage[1]				=	1;	//wymagana iloœc przedmiotu 5		
	damage[2]				=	1;	//wymagana iloœc przedmiotu 6	
	damage[3]				=	1;	//wymagana iloœc przedmiotu 7
	damage[4]				=	1;	//wymagana iloœc przedmiotu 8	
	damage[5]				=	1;	//wymagana iloœc przedmiotu 9
	damage[6]				=	1;	//wymagana iloœc przedmiotu 10	
	damage[7]				=	1;	//wymagana iloœc przedmiotu 11	
	needitm[0]				=	1;	//instance przedmiotu 1
	needitm[1]				=	1;	//instance przedmiotu 2
	needitm[2]				=	1;	//instance przedmiotu 3	
	protection[0]				=	1;	//instance przedmiotu 4	
	protection[1]				=	1;	//instance przedmiotu 5		
	protection[2]				=	1;	//instance przedmiotu 6	
	protection[3]				=	1;	//instance przedmiotu 7
	protection[4]				=	1;	//instance przedmiotu 8	
	protection[5]				=	1;	//instance przedmiotu 9
	protection[6]				=	1;	//instance przedmiotu 10	
	protection[7]				=	1;	//instance przedmiotu 11			
	value 					=	50;    //wartosc :P raczej pozostawiac bez zmian
	range				=	1;  //wymagana ilosc umiejetnosci (umiejetnosc zalezna od makingmob, puki makingmob nie ustalony daj tylko liczby)

	visual 					=	"ItWr_Scroll_01.3ds";    //wiadomo
	material 				=	MAT_LEATHER;                      //wiadomo

	scemeName				=	"NONE";	
	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ Przedmiot";		
	on_state[0]			=	UseRecept;		
	//zrób tak ze jezeli nie ustalono jakiegos instance albo amounta to zeby sie nie dopisywa³, a jak nie ustalono amounta itema a instance jest to  zeby jakis alert sie pojawia³( i na odwrót tez)
	
};*/

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Small_01 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Small_01;
	makingmob				=	R_BS;	
	needitm_amount[0]				=	2;//50 +...	
	needitm_amount[1]				=	1;//30 = 80 zarobek 20 (im lepszy ³uk tym wiekszy zarobek	
	
	needitm[0]						=	ItMa_Bowlumber_01;//drewno
	needitm[1]						=	ItMa_Wool;//we³na
	//Inne materia³y w ReceptMarks.d		
	value 					=	50;//200 - cena broni
	range				=	40;//pk. umiejetnosci kowalskich na 100% szans wyrobu

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"krótki ³uk";//Wpisana nazwa broni!		
	on_state[0]			=	UseRecept;		
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Small_02 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Small_02;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	1;//25 +...	
	needitm_amount[1]				=	1;//15 +...
	needitm_amount[2]				=	2;//28 =  68 zarobek 74
	
	needitm[0]						=	ItMa_Goodlumber;//drewno akacjowe
	needitm[1]						=	ItMa_Wool;//we³na
	needitm[2]						=	ItAt_WolfTeeth;//k³y wilka
	//Inne materia³y w ReceptMarks.d		
	value 					=	50;//288 - cena broni
	range				=	46;//+2 /pk. umiejetnosci kowalskich na 100% szans wyrobu

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk kawaleryjski";//Wpisana nazwa broni!		
	on_state[0]			=	UseRecept;		
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Small_03 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Small_03;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	1;
	needitm_amount[2]				=	3;

	needitm[0]						=	ItMa_Goodlumber;//50
	needitm[1]						=	ItMa_Wool;//15
	needitm[2]						=	ItAt_WolfTeeth;//42 =107 89?
	
	value 					=	50;
	range					=	48;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk polowy";//Wpisana nazwa broni!		
	on_state[0]			=	UseRecept;		
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Small_04 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Small_04;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	2;//50
	needitm_amount[1]				=	1;//55
	needitm_amount[2]				=	4;//56

	needitm[0]						=	ItMa_Goodlumber;
	needitm[1]						=	ItMa_ClawlerThread;
	needitm[2]						=	ItAt_WolfTeeth;
	
	value 					=	50;
	range					=	50;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk myœliwski";	
	on_state[0]			=	UseRecept;		
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Small_05 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Small_05;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	2;//30
	needitm_amount[1]				=	1;//60
	needitm_amount[2]				=	2;//40
	damage[0]						=	1;//14=144
	
	needitm[0]						=	ItAt_GobKosc;
	needitm[1]						=	ItAt_WolfSkin2;
	needitm[2]						=	ItAt_Kosc;	
	protection[0]					=	ItAt_WolfTeeth;
	
	value 					=	50;
	range					=	52;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk koœciany";	
	on_state[0]			=	UseRecept;		
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Long_01 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Long_01;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	2;
	needitm_amount[2]				=	2;
	damage[0]						=	1;
	damage[1]						=	5;
	
	needitm[0]						=	ItMa_Wool;
	needitm[1]						=	ItMa_ClawlerThread;
	needitm[2]						=	ItAt_WaranTeeth;	
	protection[0]					=	ItMa_Bowlumber_01;
	protection[1]					=	ItAt_WolfTeeth;
		
	value 					=	150;
	range					=	56;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"d³ugi ³uk";	
	on_state[0]			=	UseRecept;		
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Long_02 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Long_02;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	1;
	needitm_amount[2]				=	2;
	damage[0]						=	2;
	damage[1]						=	1;
	damage[2]						=	2;
	damage[3]						=	2;
	
	needitm[0]						=	ItAt_WaranSkin;
	needitm[1]						=	ItAt_WolfTeeth;
	needitm[2]						=	ItAt_WaranTeeth;	
	protection[0]					=	ItMa_Bowlumber_01;
	protection[1]					=	ItMa_Goodlumber;
	protection[2]					=	ItAt_RazorTeeth;
	protection[3]					=	ItAt_LurkerTeeth;
	
	value 					=	150;
	range					=	58;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk kolczasty";	
	on_state[0]			=	UseRecept;		
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Long_03 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Long_03;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	3;
	needitm_amount[1]				=	5;
	needitm_amount[2]				=	3;
	
	needitm[0]						=	ItMa_Bowlumber_01;
	needitm[1]						=	ItAt_LurkerTeeth;
	needitm[2]						=	ItMa_ClawlerThread;	
	
	value 					=	150;
	range					=	60;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk wierzbowy";	
	on_state[0]			=	UseRecept;	
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Long_04 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Long_04;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	1;
	needitm_amount[1]				=	4;
	needitm_amount[2]				=	1;
	damage[0]						=	4;
	damage[1]						=	3;

	needitm[0]						=	ItMa_Bowlumber_02;
	needitm[1]						=	ItAt_LurkerTeeth;
	needitm[2]						=	ItAt_LurkerSkin;	
	protection[0]					=	ItAt_BiterTeeth;
	protection[1]					=	ItMa_Bowlumber_01;	
	
	value 					=	150;
	range					=	62;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk dêbowy";	
	on_state[0]			=	UseRecept;	
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Long_05 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Long_05;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	1;
	needitm_amount[2]				=	2;
	damage[0]						=	9;
	damage[1]						=	8;
	
	needitm[0]						=	ItMa_Bowlumber_02;
	needitm[1]						=	ItAt_WolfSkin;
	needitm[2]						=	ItMa_lumber;	
	protection[0]					=	ItAt_WolfTeeth;
	protection[1]					=	ItAt_OrcDogTeeth;
	
	value 					=	150;
	range					=	64;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"wilcze k³y";	
	on_state[0]			=	UseRecept;
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Long_06 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Long_06;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	5;
	needitm_amount[1]				=	4;
	needitm_amount[2]				=	8;
	
	needitm[0]						=	ItMa_Bowlumber_01;
	needitm[1]						=	ItMa_ClawlerThread;
	needitm[2]						=	ItAt_SnapperTeeth;	
	
	value 					=	150;
	range					=	66;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"podmuch wiatru";	
	on_state[0]			=	UseRecept;
   description = name;
};
/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Long_07 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Long_07;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	2;
	needitm_amount[2]				=	1;
	damage[0]						=	4;
	damage[1]						=	4;
	damage[2]						=	3;
	damage[3]						=	1;
	
	needitm[0]						=	ItMa_Bowlumber_01;
	needitm[1]						=	ItMa_Bowlumber_02;
	needitm[2]						=	ItAt_SnapperTeeth;	
	protection[0]					=	ItAt_ShadTeeth;
	protection[1]					=	ItAt_RazorTeeth;
	protection[2]					=	ItAt_OrcTeeth;
	protection[3]					=	ItMa_ClawlerThread;
	
	value 					=	150;
	range					=	70;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk ¿o³nierski";	
	on_state[0]			=	UseRecept;		
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Long_08 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Long_08;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	3;
	needitm_amount[1]				=	2;
	needitm_amount[2]				=	3;
	damage[0]						=	1;
	damage[1]						=	1;	

	needitm[0]						=	ItMa_Bowlumber_02;
	needitm[1]						=	ItMa_Bowlumber_01;
	needitm[2]						=	ItAt_Shadow_02;	
	protection[0]					=	ItAt_DS_Horn;
	protection[1]					=	ItMa_ClawlerThread;	

	value 					=	150;
	range					=	72;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk z poro¿a";	
	on_state[0]			=	UseRecept;
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_Long_09 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_Long_09;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	6;
	needitm_amount[1]				=	7;
	needitm_amount[2]				=	1;
	
	needitm[0]						=	ItMa_Bowlumber_02;
	needitm[1]						=	ItAt_RazorTeeth;
	needitm[2]						=	ItAt_WolfSkin2;	
	
	value 					=	150;
	range					=	74;//+2 ka¿dy ³uk + 4 przejscie z Small do Long i z Long do War =  78 /pk. umiejetnosci kowalskich na 100% szans wyrobu

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk Nimroda";	
	on_state[0]			=	UseRecept;
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_War_01 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_War_01;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	3;
	needitm_amount[1]				=	3;
	needitm_amount[2]				=	2;
	damage[0]						=	1;
	damage[1]						=	3;
	damage[2]						=	4;
	
	needitm[0]						=	ItMa_Bowlumber_03;
	needitm[1]						=	ItMa_ClawlerThread;
	needitm[2]						=	ItAt_RazorTeeth;
	protection[0]				=	ItAt_FireWSkin;	
	protection[1]				=	ItAt_GobKosc;
	protection[2]				=	ItAt_OrcTeeth;
	
	//Inne materia³y w ReceptMarks.d		
	value 					=	350;
	range				=	78;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk wojenny";	
	on_state[0]			=	UseRecept;
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_War_02 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_War_02;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	4;
	needitm_amount[1]				=	10;
	needitm_amount[2]				=	1;
	damage[0]						=	1;

	needitm[0]						=	ItMa_Bowlumber_03;
	needitm[1]						=	ItAt_OrcTeeth;
	needitm[2]						=	ItMa_ClawlerThread;
	protection[0]				=	ItAt_GobKosc;

	value 					=	350;
	range				=	80;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"pogromcê orków";	
	on_state[0]			=	UseRecept;
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_War_03 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_War_03;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	2;
	needitm_amount[2]				=	1;
	damage[0]						=	1;
	damage[1]						=	2;
	damage[2]						=	6;
	
	needitm[0]						=	ItMa_Bowlumber_03;
	needitm[1]						=	ItMa_Bowlumber_02;
	needitm[2]						=	ItMa_ClawlerThread;
	protection[0]					=	ItAt_FireWSkin;	
	protection[1]					=	ItAt_TrollTeeth;
	protection[2]					=	ItAt_BiterTeeth;	
	
	value 					=	350;
	range				=	82;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"gromow³adnego";	
	on_state[0]			=	UseRecept;
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_War_04 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_War_04;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	6;
	needitm_amount[1]				=	6;
	needitm_amount[2]				=	6;
	damage[0]						=	6;
	damage[1]						=	6;
	damage[2]						=	6;	
	damage[3]						=	1;	
	
	needitm[0]						=	ItMa_Bowlumber_01;
	needitm[1]						=	ItMa_Wool;
	needitm[2]						=	ItAt_BloodHoTeeth;
	protection[0]					=	ItAt_FireWaranTeeth;	
	protection[1]					=	ItAt_Kosc;
	protection[2]					=	ItAt_GobKosc;
	protection[3]					=	ItAt_WaranTongue;
			
	value 					=	350;
	range				=	84;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"piekielny ³uk";	
	on_state[0]			=	UseRecept;
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Bow_War_05 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Bow_War_05;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	4;
	needitm_amount[1]				=	2;
	needitm_amount[2]				=	1;
	damage[0]						=	3;
	damage[1]						=	1;
	damage[2]						=	1;
	damage[3]						=	2;
	damage[4]						=	3;
	
	needitm[0]						=	ItMa_Bowlumber_03;
	needitm[1]						=	ItMa_ClawlerThread;
	needitm[2]						=	ItAt_Kosc;
	protection[0]					=	ItAt_BloodHoTeeth;	
	protection[1]					=	ItAt_WaranTongue;
	protection[2]					=	ItAt_OrcTeeth;	
	protection[3]					=	ItAt_AligatTeeth;	
	protection[4]					=	ItAt_RazorTeeth;	
		
	value 					=	350;
	range					=	86;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"³uk œmierci";	
	on_state[0]			=	UseRecept;
   description = name;
};

//*************************************************
//CROSSBOWS
//*************************************************
INSTANCE Recept_ItRw_Crossbow_01 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Crossbow_01;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	3;//3*125 +...	
	needitm_amount[1]				=	1;//4*15 +...
	needitm_amount[2]				=	2;//2*10 +...
	damage[0]						=	1;//56 = 511 zarobek 114
	damage[1]						=	4;
	
	needitm[0]						=	ItMa_Bowlumber_02;//drewno jesionowe
	needitm[1]						=	ItMa_Wool;//we³na
	needitm[2]						=	ItMa_Iron;//¿elazo tylko kusze!
	protection[0]				=	ItAt_WaranSkin;	//Skóra jaszczura	
	protection[1]				=	ItAt_WaranTeeth;
	
	//Inne materia³y w ReceptMarks.d		
	value 					=	200;//1250 - cena broni
	range				=	60;//kusza = 70 ciezka kusza = 85 kusza wojenna 100 /pk. umiejetnosci kowalskich na 100% szans wyrobu

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"lekk¹ kuszê";//Wpisana nazwa broni!		
	on_state[0]			=	UseRecept;
   description = name;
};
/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Crossbow_02 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Crossbow_02;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	4;
	needitm_amount[1]				=	2;
	needitm_amount[2]				=	4;
	damage[0]						=	8;
	damage[1]						=	3;
	damage[2]						=	10;
	damage[3]						=	5;
	damage[4]						=	4;
	
	needitm[0]						=	ItMa_Bowlumber_02;
	needitm[1]						=	ItMa_ClawlerThread;
	needitm[2]						=	ItMa_Steel;
	protection[0]				=	ItAt_OrcDogTeeth;
	protection[1]				=	ItAt_WolfSkin2;
	protection[2]				=	ItMa_Iron;
	protection[3]				=	ItMa_Wool;
	protection[4]				=	ItMa_Bowlumber_01;
		
	value 					=	300;
	range				=	70;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"kuszê";
	on_state[0]			=	UseRecept;
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Crossbow_03 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Crossbow_03;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	2;
	needitm_amount[2]				=	10;
	damage[0]						=	6;
	damage[1]						=	3;
	damage[2]						=	3;

	needitm[0]						=	ItMa_Bowlumber_03;
	needitm[1]						=	ItMa_Bowlumber_02;
	needitm[2]						=	ItMa_Steel;
	protection[0]					=	ItAt_SnapperTeeth;
	protection[1]					=	ItAt_SnapperSkin;
	protection[2]					=	ItMa_ClawlerThread;

	value 					=	400;
	range				=	85;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"ciê¿k¹ kuszê";
	on_state[0]			=	UseRecept;
   description = name;
};

/////////////////////////////////////////////////////////////////////
INSTANCE Recept_ItRw_Crossbow_04 (Recept_Proto)
{
	product_amount			=	1;	
	product					=	ItRw_Crossbow_04;
	makingmob				=	R_BS;	
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	3;
	needitm_amount[2]				=	1;
	damage[0]						=	3;
	damage[1]						=	2;
	damage[2]						=	5;
	damage[3]						=	2;
	
	needitm[0]						=	ItMa_Bowlumber_03;
	needitm[1]						=	ItMa_GoodSteel;
	needitm[2]						=	ItMa_MagicBillet;
	protection[0]					=	ItAt_AligatTeeth;
	protection[1]					=	ItAt_ShadTeeth;
	protection[2]					=	ItMa_ClawlerThread;
	protection[3]					=	ItAt_AligatSkin;
		
	value 					=	500;
	range				=	100;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[1] 				=	"kuszê wojenn¹";
	on_state[0]			=	UseRecept;
	description = name;
};

