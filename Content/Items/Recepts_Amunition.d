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
PROTOTYPE ReceptAmunition_Proto(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS_ANVIL;
	product_amount			=	50;	
	needitm_amount[0]				=	1;	
	needitm_amount[1]				=	1;	
	needitm_amount[2]				=	1;	
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
	TEXT[4]				= NAME_Value;					COUNT[4]	= item.value;
	
};

INSTANCE Recept_ItAmArrow (ReceptAmunition_Proto)
{
	product					=	ItAmArrow;
	
	needitm_amount[0]				=	1;//10 +...	
	needitm_amount[1]				=	25;//25 +...	
	needitm_amount[2]				=	1;//10 = 45/zarobek 5 bry³ek
	
	needitm[0]						=	ItMa_lumber;
	needitm[1]						=	ItAt_ScaFeather;		
	needitm[2]						=	ItMa_Iron;				
	value 					=	25;//50 - cena strza³(50)
	range				=	10;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ strza³y.";//Wpisana nazwa miecza!			
};

INSTANCE Recept_ItAmArrow_15 (ReceptAmunition_Proto)
{
	product					=	ItAmArrow_15;
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	25;
	needitm_amount[2]				=	1;
	
	needitm[0]						=	ItMa_lumber;
	needitm[1]						=	ItAt_HarFeather;		
	needitm[2]						=	ItMa_Iron;				
	value 					=	100;//50 - cena strza³(50)
	range				=	25;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ strza³y z piór harpii.";			
};

INSTANCE Recept_ItAmArrow_25 (ReceptAmunition_Proto)
{
	product					=	ItAmArrow_25;
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	1;
	needitm_amount[2]				=	1;
	
	needitm[0]						=	ItMa_Goodlumber;
	needitm[1]						=	ItAt_HarFeather;		
	needitm[2]						=	ItMa_goldbillet;				
	value 					=	500;//50 - cena strza³(50)
	range				=	40;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ z³ote strza³y.";//Wpisana nazwa miecza!			
};

INSTANCE Recept_ItAmFireArrow (ReceptAmunition_Proto)
{
	product					=	ItAmFireArrow;
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	1;
	needitm_amount[2]				=	1;
	protection[0]				=	1;
	
	needitm[0]						=	ItMa_Goodlumber;
	needitm[1]						=	ItAt_ScaFeather;		
	needitm[2]						=	ItMa_ExclusiveSteel;		
	damage[0]						=	ItAt_FireGolem_01;				
	value 					=	1500;//3000 - cena strza³(50)
	range				=	75;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ ogniste strza³y.";//Wpisana nazwa miecza!			
};

INSTANCE Recept_ItAmIceArrow (ReceptAmunition_Proto)
{
	product					=	ItAmIceArrow;
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	1;
	needitm_amount[2]				=	1;
	protection[0]				=	1;
	
	needitm[0]						=	ItMa_Goodlumber;
	needitm[1]						=	ItAt_ScaFeather;		
	needitm[2]						=	ItMa_Iron;		
	damage[0]						=	ItAt_IceGolem_01;				
	value 					=	1250;//50 - cena strza³(50)
	range				=	60;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ lodowe strza³y.";//		
};

INSTANCE Recept_ItAmPoisonArrow(ReceptAmunition_Proto)
{
	product					=	ItAmPoisonArrow;
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	1;
	needitm_amount[2]				=	1;
	damage[0]				=	2;
	
	needitm[0]						=	ItMa_Goodlumber;
	needitm[1]						=	ItAt_ScaFeather;		
	needitm[2]						=	ItMa_Iron;		
	protection[0]						=	ItFo_Poison;				
	value 					=	300;//600 - cena strza³(50)
	range				=	35;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ zatrute strza³y.";//		
};

INSTANCE Recept_ItAmBluntArrow(ReceptAmunition_Proto)
{
	product					=	ItAmBluntArrow;
	
	needitm_amount[0]				=	1;//10 +...	
	needitm_amount[1]				=	25;//25 +...	
	needitm_amount[2]				=	1;//10 = 45/zarobek 5 bry³ek
	
	needitm[0]						=	ItMa_lumber;
	needitm[1]						=	ItAt_ScaFeather;		
	needitm[2]						=	ItMa_Iron;				
	value 					=	25;//50 - cena strza³(50)
	range				=	10;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ og³uszaj¹ce strza³y.";//Wpisana nazwa miecza!		
};
//==================
// BOLTS
//==================

INSTANCE Recept_ItAmBolt(ReceptAmunition_Proto)
{
	product					=	ItAmBolt;
	
	needitm_amount[0]				=	2;//20 +...	
	needitm_amount[1]				=	2;//20=40	
	
	needitm[0]						=	ItMa_lumber;
	needitm[1]						=	ItMa_Iron;		
	value 					=	25;//50 - cena strza³(50)
	range				=	15;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ be³ty.";//Wpisana nazwa miecza!		
};


INSTANCE Recept_ItAmBolt_10(ReceptAmunition_Proto)
{
	product					=	ItAmBolt_10;
	
	needitm_amount[0]				=	2;//20 +...	
	needitm_amount[1]				=	2;//80=100	
	
	needitm[0]						=	ItMa_lumber;
	needitm[1]						=	ItMa_Steel;		
	value 					=	125;//50 - cena strza³(50)
	range				=	25;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ stalowe be³ty.";//Wpisana nazwa miecza!		
};

INSTANCE Recept_ItAmBolt_25(ReceptAmunition_Proto)
{
	product					=	ItAmBolt_25;
	
	needitm_amount[0]				=	2;//20 +...	
	needitm_amount[1]				=	2;//800=820	
	
	needitm[0]						=	ItMa_lumber;
	needitm[1]						=	ItMa_goldbillet;		
	value 					=	900;//50 - cena strza³(50)
	range				=	50;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ z³ote be³ty.";//Wpisana nazwa miecza!		
};

INSTANCE Recept_ItAmFireBolt(ReceptAmunition_Proto)
{
	product					=	ItAmFireBolt;
	
	needitm_amount[0]				=	2;//20 +...	
	needitm_amount[1]				=	2;//20 +...	
	needitm_amount[2]				=	1;//20=820	
	
	needitm[0]						=	ItMa_goodlumber;
	needitm[1]						=	ItMa_GoodSteel;		
	needitm[2]						=	ItAt_FireGolem_01;		
	
	value 					=	1500;//50 - cena strza³(50)
	range				=	80;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ ogniste be³ty.";//Wpisana nazwa miecza!		
};

INSTANCE Recept_ItAmIceBolt(ReceptAmunition_Proto)
{
	product					=	ItAmIceBolt;
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	2;
	needitm_amount[2]				=	1;
	
	needitm[0]						=	ItMa_goodlumber;
	needitm[1]						=	ItMa_iron;		
	needitm[2]						=	ItAt_IceGolem_01;		
	
	value 					=	1250;//50 - cena strza³(50)
	range				=	65;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ lodowe be³ty.";	
};

INSTANCE Recept_ItAmPoisonBolt(ReceptAmunition_Proto)
{
	product					=	ItAmPoisonBolt;
	
	needitm_amount[0]				=	2;
	needitm_amount[1]				=	2;
	needitm_amount[2]				=	2;
	
	needitm[0]						=	ItMa_lumber;
	needitm[1]						=	ItMa_iron;		
	needitm[2]						=	ItFo_Poison;		
	
	value 					=	300;//50 - cena strza³(50)
	range				=	40;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ zatrute be³ty.";	
};

INSTANCE Recept_ItAmBluntBolt(ReceptAmunition_Proto)
{
	product					=	ItAmBluntBolt;
	
	
	needitm_amount[0]				=	2;//20 +...	
	needitm_amount[1]				=	2;//20=40	
	
	needitm[0]						=	ItMa_lumber;
	needitm[1]						=	ItMa_Iron;		
	value 					=	25;//50 - cena strza³(50)
	range				=	15;//na 100% szans wykucia

	text[0] 				=	"Dziêki tej recepcie mogê wytworzyæ og³uszaj¹ce be³ty.";//Wpisana nazwa miecza!		
};