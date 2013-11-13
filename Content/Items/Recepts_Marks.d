INSTANCE Recept_ItMa_Iron(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS_FIRE;
	product_amount			=	1;
	product				=	ItMa_Iron;
	needitm[0]				=	ItMa_ironore; needitm_amount[0]	=5;//Brylka Zelaza[1]
	value 				=	50;
	range 				=	15;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dziêki tej recepcie mogê wytworzyæ sztabkê ¿elaza";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMa_Steel(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS_FIRE;
	product_amount			=	1;
	product				=	ItMa_Steel;
	needitm[0]				=	ItMa_ironore; needitm_amount[0]	=5;//Brylka Zelaza[1]
	needitm[1]				=	ItMa_carbon; needitm_amount[1]	=2;//Wegiel[5]
	value 				=	50;
	range 				=	25;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dziêki tej recepcie mogê wytworzyæ sztabkê stali";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMa_GoodSteel(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS_FIRE;
	product_amount			=	1;
	product				=	ItMa_GoodSteel;
	needitm[0]				=	ItMa_ironore; needitm_amount[0]	=10;//Brylka Zelaza[1]
	needitm[1]				=	ItMa_carbon; needitm_amount[1]	=6;//Wegiel[5]
	value 				=	50;
	range 				=	30;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dziêki tej recepcie mogê wytworzyæ sztabkê utwardzanej stali";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMa_ExclusiveSteel(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS_FIRE;
	product_amount			=	1;
	product				=	ItMa_ExclusiveSteel;
	needitm[0]				=	ItMa_ironore; needitm_amount[0]	=15;//Brylka Zelaza[1]
	needitm[1]				=	ItMa_carbon; needitm_amount[1]	=8;//Wegiel[5]
	value 				=	125;
	range 				=	50;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dziêki tej recepcie mogê wytworzyæ";
   text[1]  				=	"sztabkê hartowanej stali";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMa_MagicBillet(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS_FIRE;
	product_amount			=	1;
	product				=	ItMa_MagicBillet;
	needitm[0]				=	ItMa_ironore; needitm_amount[0]	=15;//Brylka Zelaza[1]
	needitm[1]				=	ItMa_carbon; needitm_amount[1]	=8;//Wegiel[5]
	needitm[2]				=	ItMiNugget; needitm_amount[2]	=300;//Brylka rudy[1]
	value 				=	375;
	range 				=	55;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dziêki tej recepcie mogê wytworzyæ sztabkê magicznego kruszcu";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMa_silverbillet(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS_FIRE;
	product_amount			=	1;
	product				=	ItMa_silverbillet;
	needitm[0]				=	ItMa_silverore; needitm_amount[0]	=9;//Brylka Srebra[10]
	value 				=	100;
	range 				=	25;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dziêki tej recepcie mogê wytworzyæ sztabkê srebra";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItMa_goldbillet(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_BS_FIRE;
	product_amount			=	1;
	product				=	ItMa_goldbillet;
	needitm[0]				=	ItMa_goldore; needitm_amount[0]	=6;//Brylka Zlota"[30]
	value 				=	200;
	range 				=	45;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dziêki tej recepcie mogê wytworzyæ sztabkê z³ota";
	on_state[0]				=	UseRecept;	
};

INSTANCE Recept_ItFo_Poison(C_Item)
{
	name 					=	"Recepta";
	mainflag 				=	ITEM_KAT_DOCS;
	makingmob				=	R_LAB_PSI;
	product_amount			=	1;
	product				=	ItFo_Poison;
	needitm[0]				=	ItAt_Bloodfly_02; needitm_amount[0]	=2;//Zadlo Krwiopijcy[25]
	value 				=	50;
	range 				=	50;

	visual 				=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	scemeName 				=	"NONE";
	text[0]  				=	"Dziêki tej recepcie mogê wytworzyæ truciznê";
	on_state[0]				=	UseRecept;	
};