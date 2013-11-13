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
//	makingmob				=	1;//na czym sie robi item
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
	range				=	1;  //wymagana ilosc umiejetnosci (umiejetnosc zalezna od //	makingmob, puki //	makingmob nie ustalony daj tylko liczby)

	visual 					=	"ItWr_Scroll_01.3ds";    //wiadomo
	material 				=	MAT_LEATHER;                      //wiadomo

	scemeName				=	"NONE";	
	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ przedmiot";		
	on_state[0]			=	UseRecept;		
	//zrób tak ze jezeli nie ustalono jakiegos instance albo amounta to zeby sie nie dopisywa³, a jak nie ustalono amounta itema a instance jest to  zeby jakis alert sie pojawia³( i na odwrót tez)
	
};*/
PROTOTYPE Recept_Proto(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS;
	product_amount			=	1;	
	needitm[0]				=	ItMiNugget;	//instance przedmiotu 1	
	needitm_amount[0]				=	1;	
	needitm_amount[1]				=	0;	
	needitm_amount[2]				=	0;	
	protection[0]				=	0;		
	protection[1]				=	0;		
	protection[2]				=	0;		
	protection[3]				=	0;		
	protection[4]				=	0;		
	protection[5]				=	0;		
	protection[6]				=	0;		
	protection[7]				=	0;		
	damage[0]				=	1;	
	damage[1]				=	1;		
	damage[2]				=	1;	
	damage[3]				=	1;
	damage[4]				=	1;	
	damage[5]				=	1;
	damage[6]				=	1;	
	damage[7]				=	1;			
	value 					=	50;
	range				=	1;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"NONE";	
	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ przedmiot";			
	on_state[0]			=	UseRecept;		
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
   description = name;
};

INSTANCE Rc_BS (Recept_Proto)
{
	product					=	ItAmArrow_15;
	makingmob				=	R_BS;	
	
	text[0] 				=	"R_BS";//Wpisana nazwa miecza!			
};

INSTANCE Rc_BS_FIRE (Recept_Proto)
{
	product					=	ItAmArrow_15;
	makingmob				=	R_BS_FIRE;	
	
	text[0] 				=	"R_BS_FIRE";//Wpisana nazwa miecza!			
};

INSTANCE Rc_BS_ANVIL (Recept_Proto)
{
	product					=	ItAmArrow_15;
	makingmob				=	R_BS_ANVIL;	
	
	text[0] 				=	"R_BS_ANVIL";//Wpisana nazwa miecza!			
};

INSTANCE Rc_LAB_PSI (Recept_Proto)
{
	product					=	ItAmArrow_15;
	makingmob				=	R_LAB_PSI;	
	
	text[0] 				=	"R_LAB_PSI";//Wpisana nazwa miecza!			
};

INSTANCE Rc_MOB_CAULDRON (Recept_Proto)
{
	product					=	ItAmArrow_15;
	makingmob				=	R_MOB_CAULDRON;	
	
	text[0] 				=	"R_MOB_CAULDRON";//Wpisana nazwa miecza!			
};

INSTANCE Rc_MOB_PAN (Recept_Proto)
{
	product					=	ItAmArrow_15;
	makingmob				=	Rc_MOB_PAN;	
	
	text[0] 				=	"R_MOB_PAN";//Wpisana nazwa miecza!			
};

INSTANCE Rc_HERB_PSI (Recept_Proto)
{
	product					=	ItAmArrow_15;
	makingmob				=	R_HERB_PSI;	
	
	text[0] 				=	"R_HERB_PSI";//Wpisana nazwa miecza!			
};