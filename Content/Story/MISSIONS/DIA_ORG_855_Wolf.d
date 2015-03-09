//****************************************
//					Hallo
//****************************************
var int Wolf_TradeInvGiven;

INSTANCE DIA_Wolf_Hello (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_Hello_Condition;
	information	= DIA_Wolf_Hello_Info;
	permanent	= 0;
	description = "Kim jesteœ?";
};                       

FUNC INT DIA_Wolf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Wolf_Hello_Info()
{
	AI_Output(other, self,"DIA_Wolf_Hello_15_00"); //Kim jesteœ?
	AI_Output(self, other,"DIA_Wolf_Hello_09_01"); //Jestem p³atnerzem. Mówi¹ na mnie Wilk.
};

var int wolf_trade_info;

//****************************************
//				TRADE
//****************************************

instance Org_855_Wolf_TRADE (C_INFO) //edytowane 2012-11-14
{
	npc				= Org_855_Wolf;
	nr				= 800;
	condition		= Org_855_Wolf_TRADE_Condition;
	information		= Org_855_Wolf_TRADE_Info;
	permanent		= 1;
	description		= "Gdzie mogê kupiæ jakiœ ³uk?"; 
};

FUNC int Org_855_Wolf_TRADE_Condition()
{	
   if (!wolf_trade_info)
   {
      return 1;
   };
};

FUNC void  Org_855_Wolf_TRADE_Info()
{
   wolf_trade_info = TRUE;
   
   AI_Output (other, self,"Org_855_Wolf_SELLBOW_Info_15_01"); //Gdzie mogê kupiæ jakiœ ³uk?
	AI_Output (self, other,"Org_855_Wolf_SELLBOW_Info_09_02"); //Trafi³eœ pod w³aœciwy adres. Mam tu dobry towar za bardzo przystêpn¹ cenê.
	
   AI_Output (other, self,"Org_855_Wolf_TRADE_15_03"); //Zajmujesz siê czymœ jeszcze?
   AI_Output (self, other,"Org_855_Wolf_TRADE_09_04"); //Skupujê skóry i futra od myœliwych. Gdybyœ mia³ kiedyœ taki towar na zbyciu, to zg³oœ siê do mnie.
   
   Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Wilk sprzedaje ³uki, warto bli¿ej przyjrzeæ siê jego ofercie.");
};

instance Wolf_Container(Npc_Default)
{
	name	=	"Magazynek Wilka";
	//trader start inventory
	CreateInvItems(self,ItMINugget, 500);
	
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems (self,ItMiNugget,12);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,1);
	CreateInvItems (self,ItLsTorch,1);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItAt_Claws_01);		
	CreateInvItem 	(self,ItMw_1H_Sword_06);

	CreateInvItems (self,ItFo_wineberrys_01,5);
   CreateInvItem(self,ItRw_Bow_Small_03);	
	CreateInvItem(self,ItRw_Bow_Long_02);	
	CreateInvItem(self,ItRw_Bow_Long_01);	
	CreateInvItem(self,ItRw_Crossbow_01);	
	CreateInvItem(self,ItRw_Crossbow_Old_01);	

	CreateInvItems(self,ItAmArrow_25,10);
	CreateInvItems(self,ItAmArrow_15,15);
	CreateInvItems(self,ItAmFireArrow,3);
	CreateInvItems(self,ItAmIceArrow,2);
   
   CreateInvItem (self,ItRw_Bow_Long_06);
	CreateInvItem (self,ItRw_Bow_Long_07);
	CreateInvItems (self,ItAmArrow,800);
	CreateInvItems (self,ItAmBolt,800);
	CreateInvItem (self,ItRw_Bow_Long_08);
	
   CreateInvItem (self,ItRw_Crossbow_01);
   CreateInvItem (self,ItRw_Crossbow_02);
   CreateInvItem (self,ItRw_Crossbow_03);

	CreateInvItem(self,ItRw_Bow_Small_01);	
	CreateInvItem(self,ItRw_Bow_Long_01);	
	CreateInvItem(self,ItRw_Crossbow_01);	

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};

INSTANCE DIA_ORG_855_Wolf_Exit (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 999;
	condition	= DIA_ORG_855_Wolf_Exit_Condition;
	information	= DIA_ORG_855_Wolf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ORG_855_Wolf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_855_Wolf_Exit_Info()
{
	Wolf_TradeInvGiven=FALSE;
	var c_npc container; container = HLP_GetNpc(Wolf_Container);
	B_ClearTraderInv(self,container);
	B_StopProcessInfos(self);
};

//-----------------------------------------------------------------
// WOLF TRADE
//-----------------------------------------------------------------
instance ORG_855_Wolf_TRADE2(C_INFO)
{
	npc				= ORG_855_Wolf;
	condition		= ORG_855_Wolf_TRADE2_Condition;
	information		= ORG_855_Wolf_TRADE2_Info;
	//important		= 1;
	permanent		= 1;
	trade 			= 1;
	nr				= 990;
	description		= DIALOG_TRADE;
};

FUNC int ORG_855_Wolf_TRADE2_Condition()
{
   return wolf_trade_info;
};
func void  ORG_855_Wolf_TRADE2_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRADE2_Info_15_01"); //Poka¿ mi swoje towary.
	AI_Output (self, other,"ORG_855_Wolf_TRADE2_Info_08_02"); //Zapraszam...
	
   if(!Wolf_TradeInvGiven)
	{
      var c_npc container; container = HLP_GetNpc(Wolf_Container);
      B_ClearTraderInv(container,self);		
	};
	Wolf_TradeInvGiven=TRUE;
	
	//Giving "Friendly" prices
	//BEST ONE FOR ARMORS
	Trade_EraseValue();	//BUGFIX has to be in every trade dialog
	Trade_WEAPON_Mul	= mulf(Trade_ALL_Mul,1040187392);	//0.125
	Trade_ARMOR_Mul	 	= mulf(Trade_ALL_Mul,1040187392);	//0.125
	Trade_RUNE_Mul	 	= mulf(Trade_ALL_Mul,1041865113);	//0.15
	Trade_MAGIC_Mul	 	= mulf(Trade_ALL_Mul,1045220557);	//0.20
	Trade_FOOD_Mul	 	= mulf(Trade_ALL_Mul,1049414861);	//0.275
	Trade_POTION_Mul	= mulf(Trade_ALL_Mul,1043542835);	//0.175
	Trade_DOC_Mul	 	= mulf(Trade_ALL_Mul,1045220557);	//0.20
};

//****************************************

INSTANCE DIA_Wolf_RBL2 (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 13;
	condition	= DIA_Wolf_RBL2_Condition;
	information	= DIA_Wolf_RBL2_Info;
	important		= 0;
	permanent		= 0;
	description = "'Chcia³em zapytaæ o ³uki.'";
	trade 			= 1;
};                       

FUNC INT DIA_Wolf_RBL2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pluskwa_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_RBL2_Info()
{
	AI_Output(other, self,"DIA_Wolf_RBL2_15_00"); //'Chcia³em zapytaæ o ³uki.'
	AI_Output(self, other,"DIA_Wolf_RBL2_09_01"); //Dobrze trafi³eœ, mam najlepszy towar w ca³ej cholernej Kolonii.
	AI_Output(self, other,"DIA_Wolf_RBL2_09_02"); //(szeptem) Pozb¹dŸ siê jakoœ Pluskwy, inaczej nie pogadamy...
	AI_Output(self, other,"DIA_Wolf_RBL2_09_03"); //To moczymorda, jakiœ trunek powinien za³atwiæ sprawê.
	B_LogEntry(CH4_NC_RBLBosses, "Nie us³yszê odpowiedzi, dopóki nie pozbêdê siê Pluskwy. Stra¿nik podobno nie wylewa za kirys.");
   
   ORG_855_Wolf_TRADE2_Info();
};
//****************************************
//			RBL info
//****************************************

INSTANCE DIA_Wolf_RBL (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 11;
	condition	= DIA_Wolf_RBL_Condition;
	information	= DIA_Wolf_RBL_Info;
	important		= 0;
	permanent		= 0;
	description = "Gorn napomkn¹³, ¿e dobrze siê ustawi³eœ po ataku.";
};                       

FUNC INT DIA_Wolf_RBL_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_RebelTalk))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_RBL_Info()
{
	AI_Output(other, self,"DIA_Wolf_RBL_15_00"); //Gorn napomkn¹³, ¿e dobrze siê ustawi³eœ po ataku.
	AI_Output(self, other,"DIA_Wolf_RBL_09_01"); //A Tobie co do tego?
	AI_Output(other, self,"DIA_Wolf_RBL_15_02"); //Powiedzmy, ¿e kogoœ interesuje to, co dzieje siê w Waszym obozie.
	AI_Output(self, other,"DIA_Wolf_RBL_09_03"); //Hmm... Na pierwszy rzut oka œmierdzisz stra¿nikiem, ale wyczuwam te¿ subtelny sw¹d rebelianta.
	AI_Output(self, other,"DIA_Wolf_RBL_09_04"); //Cavalorn Ciê tu przys³a³?
	AI_Output(other, self,"DIA_Wolf_RBL_15_05"); //Widzê, ¿e celnie strzelasz nie tylko z ³uku.
	AI_Output(self, other,"DIA_Wolf_RBL_09_06"); //Masz jak¹œ propozycjê?
	AI_Output(other, self,"DIA_Wolf_RBL_15_07"); //Tak. Przejêcie Nowego Obozu przez Gomeza nie tylko na Was rzuci³o blady cieñ strachu.
	AI_Output(other, self,"DIA_Wolf_RBL_15_08"); //W odwecie zaatakowaliœmy Star¹ Kopalniê.
	AI_Output(self, other,"DIA_Wolf_RBL_09_09"); //NieŸle. Co Gomez zrobi³?
	AI_Output(other, self,"DIA_Wolf_RBL_15_10"); //Stra¿nicy zaatakowali nasz obóz, ale odes³aliœmy ich z pozdrowieniami dla Gomeza. Przynajmniej tych, którzy prze¿yli.
	AI_Output(self, other,"DIA_Wolf_RBL_09_11"); //Porz¹dna jatka! Sporo mnie ominê³o. Mamy tu marny przep³yw informacji.
	AI_Output(self, other,"DIA_Wolf_RBL_09_12"); //Rzeczywiœcie, mamy zbie¿ne cele. Jak Cavalorn chce to za³atwiæ?
	AI_Output(other, self,"DIA_Wolf_RBL_15_13"); //Najpierw mam siê rozejrzeæ w sytuacji i je¿eli zajdzie taka potrzeba, mam Wam pomóc.
	AI_Output(other, self,"DIA_Wolf_RBL_15_14"); //PóŸniej nadejdzie pora na wykopanie st¹d stra¿ników.
	AI_Output(self, other,"DIA_Wolf_RBL_09_15"); //W porz¹dku. Co chcesz wiedzieæ?

	B_LogEntry(CH4_NC_RBLBosses, "Wilk z chêci¹ odpowie na moje pytania.");
};

//****************************************

INSTANCE DIA_Wolf_RBL1 (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 12;
	condition	= DIA_Wolf_RBL1_Condition;
	information	= DIA_Wolf_RBL1_Info;
	important		= 0;
	permanent		= 0;
	description = "Na pocz¹tek powiesz mi jak wygl¹da sytuacja.";
};                       

FUNC INT DIA_Wolf_RBL1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wolf_RBL))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_RBL1_Info()
{
	var C_NPC plus; plus = Hlp_GetNpc(Grd_4086_Pluskwa);

	AI_Output(other, self,"DIA_Wolf_RBL1_15_00"); //Na pocz¹tek powiesz mi jak wygl¹da sytuacja.
	AI_Output(self, other,"DIA_Wolf_RBL1_09_01"); //Nieciekawie, ale z perspektyw¹ na przysz³oœæ.
	AI_TurnToNpc(self, plus);
	AI_Output(self, other,"DIA_Wolf_RBL1_09_02"); //Cholera... Znowu ten gnojek. Udawaj, ¿e pytasz o ³uki...
	AI_TurnToNpc(self, other);
	B_StopProcessInfos	(self);

	/*******************
	Niech do nich podejdzie Pluskwa
	****************/

	AI_GotoWP		(plus, "NC_PLACE04");
};

//****************************************

INSTANCE DIA_Wolf_Reward (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 14;
	condition	= DIA_Wolf_Reward_Condition;
	information	= DIA_Wolf_Reward_Info;
	important		= 0;
	permanent		= 0;
	description = "Pozby³em siê Pluskwy.";
};                       

FUNC INT DIA_Wolf_Reward_Condition()
{
	if (plusk_drink == TRUE)||(plusk_fear == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_Reward_Info()
{
	B_GiveXP(500);
	AI_Output(other, self,"DIA_Wolf_Reward_15_00"); //Pozby³em siê Pluskwy.
	AI_Output(self, other,"DIA_Wolf_Reward_09_01"); //Nie masz pojêcia, jaki Ci jestem wdziêczny.
	AI_Output(self, other,"DIA_Wolf_Reward_09_02"); //Mam dla Ciebie propozycjê.
	AI_Output(other, self,"DIA_Wolf_Reward_15_03"); //Ca³y zamieniam siê w s³uch.
	AI_Output(self, other,"DIA_Wolf_Reward_09_04"); //Przynieœ mi 15 p³ytek pe³zaczy, a zrobiê Ci porz¹dny pancerz.
	AI_Output(other, self,"DIA_Wolf_Reward_15_05"); //Dziêki, Wilk. Pomyœlê o tym.

	Log_CreateTopic(CH4_MCPlateArmor, LOG_MISSION);
	Log_SetTopicStatus(CH4_MCPlateArmor, LOG_RUNNING);
	B_LogEntry(CH4_MCPlateArmor, "Wilk z wdziêcznoœci zrobi dla mnie pancerz z p³ytek pe³zaczy. Tylko najpierw muszê siê dowiedzieæ jak pozyskiwaæ p³ytki i przynieœæ mu co najmniej 15 sztuk.");
};

//****************************************

INSTANCE DIA_Wolf_Questions (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 15;
	condition	= DIA_Wolf_Questions_Condition;
	information	= DIA_Wolf_Questions_Info;
	important		= 0;
	permanent		= 0;
	description = "Czas zadaæ kilka pytañ.";
};                       

FUNC INT DIA_Wolf_Questions_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wolf_Reward))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_Questions_Info()
{
	AI_Output(other, self,"DIA_Wolf_Questions_15_00"); //Czas zadaæ kilka pytañ.
	AI_Output(self, other,"DIA_Wolf_Questions_09_01"); //Strzelaj, brachu!
};

//****************************************

INSTANCE DIA_Wolf_Questions1 (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 16;
	condition	= DIA_Wolf_Questions1_Condition;
	information	= DIA_Wolf_Questions1_Info;
	important		= 0;
	permanent		= 0;
	description = "Co planujesz?";
};                       

FUNC INT DIA_Wolf_Questions1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wolf_Questions))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_Questions1_Info()
{
	AI_Output(other, self,"DIA_Wolf_Questions1_15_00"); //Co planujesz?
	AI_Output(self, other,"DIA_Wolf_Questions1_09_01"); //To zale¿y od rozwoju sytuacji.
	AI_Output(self, other,"DIA_Wolf_Questions1_09_02"); //W tej chwili czekam, patrzê i s³ucham.
	AI_Output(other, self,"DIA_Wolf_Questions1_15_03"); //Mo¿e nadesz³a pora, ¿eby zrobiæ pierwszy ruch?
	AI_Output(self, other,"DIA_Wolf_Questions1_09_04"); //Mo¿liwe, ale ja go nie wykonam, to zbyt ryzykowne.
	AI_Output(other, self,"DIA_Wolf_Questions1_15_05"); //Rozumiem. Postaram siê znaleŸæ jak¹œ zachêtê.

	B_LogEntry(CH4_NC_RBLBosses, "Wilk woli siê nie wychylaæ. Muszê go przekonaæ, ¿e nie jest sam, i ¿e najwy¿sza pora wykopaæ stra¿ników jak najdalej st¹d.");
};

//****************************************

INSTANCE DIA_Wolf_Questions2 (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 17;
	condition		= DIA_Wolf_Questions2_Condition;
	information		= DIA_Wolf_Questions2_Info;
	important		= 0;
	permanent		= 0;
	description = "Mam dla Ciebie ciekaw¹ wiadomoœæ.";
};                       

FUNC INT DIA_Wolf_Questions2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wolf_Questions1))&&(lares_cooperate > 0)
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_Questions2_Info()
{
	wolf_cooperate = TRUE;

	AI_Output(other, self,"DIA_Wolf_Questions2_15_00"); //Mam dla Ciebie ciekaw¹ wiadomoœæ.
	AI_Output(self, other,"DIA_Wolf_Questions2_09_01"); //Mów.
	AI_Output(other, self,"DIA_Wolf_Questions2_15_02"); //Lares te¿ ma ju¿ doœæ stra¿ników. Mam Ci przekazaæ, ¿e on i jego ludzie tylko czekaj¹ na sygna³.
	AI_Output(self, other,"DIA_Wolf_Questions2_09_03"); //No proszê, jednak coœ siê dzieje. Jestem z Wami, ale pod jednym warunkiem.
	AI_Output(other, self,"DIA_Wolf_Questions2_15_04"); //Chyba domyœlam siê do czego zmierzasz...
	AI_Output(self, other,"DIA_Wolf_Questions2_09_05"); //Do walki musi nas poprowadziæ Lee!
	AI_Output(other, self,"DIA_Wolf_Questions2_15_06"); //Zajmê siê tym. Najwa¿niejsze, ¿e jesteœ z nami.
	AI_Output(self, other,"DIA_Wolf_Questions2_09_07"); //Porozmawiam z ludŸmi, przygotujê wszystko jak nale¿y. Wystarczy, ¿e dacie sygna³, a Kocio³ sp³ynie krwi¹ stra¿ników.

	lee_back = lee_back + 1;
	B_LogEntry(CH4_NC_RBLBosses, "Wilk i jego ludzie wezmê udzia³ w powstaniu, ale najpierw muszê przekonaæ Lee, ¿eby stan¹³ na czele rebelii.");
};

//****************************************

INSTANCE DIA_Wolf_Questions3 (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 18;
	condition	= DIA_Wolf_Questions3_Condition;
	information	= DIA_Wolf_Questions3_Info;
	important		= 0;
	permanent		= 0;
	description = "Co wiesz o Hrabim?";
};                       

FUNC INT DIA_Wolf_Questions3_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wolf_Questions))&&((Npc_KnowsInfo (hero, DIA_Hrabia_Ore))||(Npc_KnowsInfo (hero, DIA_Hrabia_Trap)))
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_Questions3_Info()
{
	AI_Output(other, self,"DIA_Wolf_Questions3_15_00"); //Co wiesz o Hrabim?
	AI_Output(self, other,"DIA_Wolf_Questions3_09_01"); //To i owo. Ale to doœæ grz¹ski temat.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_02"); //Muszê dowiedzieæ siê jak najwiêcej o tym bydlaku!
	AI_Output(self, other,"DIA_Wolf_Questions3_09_03"); //Nie wiem czy to dobry pomys³. Czasami lepiej wiedzieæ mniej, d³u¿ej siê wtedy ¿yje, przyjacielu.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_04"); //Nie przyszed³em tu po dobre rady, tylko po odpowiedzi.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_05"); //W porz¹dku. Powiem Ci co wiem.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_06"); //Prawdziwym przywódc¹ stra¿ników w tym obozie jest Hrabia.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_07"); //Fletcher to tylko pionek, który w ka¿dej chwili mo¿e znikn¹æ z gry.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_08"); //Hrabia jest bezwzglêdny, ale nie szalony. Zmierza do celu po trupach, jednak zawsze ch³odno rachuje.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_09"); //Wydaje mi siê, ¿e Hrabia nie dzia³a sam. Raz widzia³em go w towarzystwie Kruka. Ci dwaj znaj¹ siê podobno z lepszych czasów.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_10"); //Coœ Ci powiem, ten duet mo¿e pogr¹¿yæ ca³¹ Koloniê. 
	AI_Output(self, other,"DIA_Wolf_Questions3_09_11"); //Wszyscy trzês¹ portkami przed Gomezam, ale tak naprawdê trzeba baæ siê Kruka i jego popleczników.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_12"); //To wszystko?
	AI_Output(self, other,"DIA_Wolf_Questions3_09_13"); //Jeszcze jedno. Hrabia... On czegoœ szuka. Lub raczej kogoœ. Jestem pewien, ¿e nikt o tym nie wie, nawet Kruk.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_14"); //I móg³bym daæ sobie uci¹æ wszystkie cz³onki, ¿e dlatego znalaz³ siê w Kolonii.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_15"); //Sk¹d te przypuszczenia?
	AI_Output(self, other,"DIA_Wolf_Questions3_09_16"); //Hrabia rozmawia³ ze mn¹, tu¿ po ataku. Jeszcze nigdy siê tak nie spoci³em ze strachu jak w obecnoœci tego cz³owieka.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_17"); //On jest pusty od œrodka, wypalony i zimny...
	AI_Output(self, other,"DIA_Wolf_Questions3_09_18"); //Zapyta³ mnie czy kiedyœ s³ysza³em o Xardasie. Oczywiœcie zaprzeczy³em.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_19"); //Ale nie tylko o niego pyta³.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_20"); //Niedawno trafi³ tu taki jeden, który te¿ zd¹¿y³ ju¿ sporo namieszaæ.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_21"); //Nikt nie wie jak naprawdê siê nazywa, wiêc wszyscy mówi¹ na niego Bezimienny.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_22"); //Bezimienny? Ma³o oryginalnie.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_23"); //Mo¿liwe, ale to swój ch³op i te¿ chce siê st¹d jak najszybciej wyrwaæ. Powiedzia³em tylko to co i tak wiedz¹ wszyscy. 
	AI_Output(self, other,"DIA_Wolf_Questions3_09_24"); //Przeszy³ mnie wtedy tymi swoimi zimnymi œlepiami i kaza³ odejœæ. Brrry...
	AI_Output(self, other,"DIA_Wolf_Questions3_09_25"); //Hmm. Wy dwaj jesteœcie jakby... szalami tej samej wagi. Ty i Hrabia.
	AI_Output(other, self,"DIA_Wolf_Questions3_15_26"); //Nie rozumiem.
	AI_Output(self, other,"DIA_Wolf_Questions3_09_27"); //Myœlê, ¿e dobrze wiesz o czym mówiê. Do zobaczenia, przyjacielu.
	B_LogEntry(CH1_Rbl_Hrabia, "Stra¿nikom w Nowym Obozie naprawdê przewodzi Hrabia. Wilk twierdzi te¿, ¿e Hrabia pracuje dla Kruka. Mimo to najemnik uwa¿a, ¿e Hrabia nie trafi³ do Kolonii przez przypadek. Podobno wypytywa³ go o Xardasa i jakiegoœ Bezimiennego. Ta historia zaczyna siê robiæ coraz ciekawsza.");
	B_LogEntry(CH1_Rbl_NoName, "Wilk powiedzia³ mi, ¿e Hrabia wypytywa³ o Xardasa i Bezimiennego. Najemnik uwa¿a, ¿e to w³aœnie ci dwaj mog¹ byæ powodem przybycia Hrabiego do Kolonii.");
};

/*********************

Ork zostawi³em naukê wycinania p³ytek, to bêdzie nagroda dla dicka jak pomo¿e wilkowi.

*******************/

//---------------------------------------------------------------------
//	Info SKIN
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SKIN (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SKIN_Condition;
	information	= Info_Wolf_SKIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "W jaki sposób mam oddzieliæ te p³ytki od zw³ok pe³zaczy?";
};                       

FUNC INT Info_Wolf_SKIN_Condition()
{
	if	(Npc_KnowsInfo(hero, DIA_Wolf_Reward) && (!Knows_GetMCPlates))
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SKIN_Info()
{
	AI_Output(hero,self,"Info_Wolf_SKIN_15_01"); //W jaki sposób mam oddzieliæ te p³ytki od zw³ok pe³zaczy?
	AI_Output(self,hero,"Info_Wolf_SKIN_09_02"); //To proste. P³ytki na grzbiecie przymocowane s¹ tylko przy krawêdziach.
	AI_Output(self,hero,"Info_Wolf_SKIN_09_03"); //Wystarczy wzi¹æ ostry nó¿ i 'ci¹æ wzd³u¿ przerywanej linii'.
	AI_Output(hero,self,"Info_Wolf_SKIN_15_04"); //W porz¹dku. Postaram siê przynieœæ Ci kilka p³ytek z pancerzy pe³zaczy.

	Knows_GetMCPlates = TRUE;
	PrintScreen	("Nowa umiejêtnoœæ: Wycinanie p³ytek pancerza", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	
	Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);
	B_LogEntry			(CH4_MCPlateArmor,	"Wilk, szkodnik z Nowego Obozu, zaproponowa³ mi wykonanie zbroi z pancerzy pe³zaczy. Pokaza³ mi, jak nale¿y je usuwaæ z martwych potworów."); 
	
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ usuwania pancerzy z martwych pe³zaczy-wojowników.");

	B_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info MCPLATESFEW
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESFEW (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESFEW_Condition;
	information	= Info_Wolf_MCPLATESFEW_Info;
	important	= 0;	
	permanent	= 0;
	description = "Przynios³em Ci kilka p³ytek, o które prosi³eœ.";
};                       

FUNC INT Info_Wolf_MCPLATESFEW_Condition()
{
	if	(Knows_GetMCPlates) && (!Npc_KnowsInfo(hero, Info_Wolf_MCPLATESENOUGH))
	&& (Npc_KnowsInfo(hero, DIA_Wolf_Reward))
	&&	(Npc_HasItems(hero, ItAt_CrawlerPlate) > 0)
	&&	(Npc_HasItems(hero, ItAt_CrawlerPlate) < 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //Przynios³em Ci kilka p³ytek, o które prosi³eœ.
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //To za ma³o, nie wystarczy na ca³¹ zbrojê.
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //Przynieœ mi wiêcej p³ytek!
};

//---------------------------------------------------------------------
//	Info MCPLATESENOUGH
//---------------------------------------------------------------------
var int wolf_armor;
INSTANCE Info_Wolf_MCPLATESENOUGH (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESENOUGH_Condition;
	information	= Info_Wolf_MCPLATESENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Zebra³em mnóstwo p³ytek z pancerzy pe³zaczy.";
};                       

FUNC INT Info_Wolf_MCPLATESENOUGH_Condition()
{
	if	(Knows_GetMCPlates)
	&& (Npc_KnowsInfo(hero, DIA_Wolf_Reward))
	&&	(Npc_HasItems(hero, ItAt_CrawlerPlate) >= 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESENOUGH_Info()
{
   wolf_armor = B_SetDayTolerance()+5;
   
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //Zebra³em mnóstwo p³ytek z pancerzy pe³zaczy.
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Fantastycznie! Natychmiast zabieram siê do roboty!
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //Jak d³ugo to zajmie?
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH1_09_04"); //Trochê to potrwa, tym bardziej, ¿e mam te¿ sporo innych zleceñ. Daj mi kilka dni.
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH1_15_05"); //W porz¹dku.

	MCPlatesDelivered = TRUE;

	B_LogEntry			(CH4_MCPlateArmor,	"Da³em Wilkowi 15 tych p³ytek z pancerzy. Teraz potrzebuje trochê czasu, ¿eby sporz¹dziæ z nich dla mnie now¹ zbrojê.");
	B_GiveXP			(500);
	
	Give_and_remove(ItAt_CrawlerPlate, 15);
	B_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORFINISHED
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORFINISHED (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORFINISHED_Condition;
	information	= Info_Wolf_ARMORFINISHED_Info;
	important	= 1;	
	permanent	= 0;
	description = "";
};                       

FUNC INT Info_Wolf_ARMORFINISHED_Condition()
{
	if	(MCPlatesDelivered == TRUE)
	&&(wolf_armor <= Wld_GetDay())
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED1_09_02"); //Dobrze, ¿e jesteœ. W³aœnie skoñczy³em pracê nad pancerzem.
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED1_15_03"); //Nareszcie sam siê przekonam ile warta jest taka zbroja.
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Dok³adnie, oto i ona! Jest twardsza ni¿ jakikolwiek pancerz jaki widzia³em na oczy!
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //Dziêki, jestem twoim d³u¿nikiem.
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //Nie ma o czym mówiæ. Na pewno na tym nie stracê. Co to, to nie!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_07"); //Teraz jesteœmy ju¿ kwita, przyjacielu.
	
   B_LogEntry			(CH4_MCPlateArmor,	"Wilk skoñczy³ ju¿ moj¹ now¹ zbrojê. To najlepszy pancerz, jaki w ¿yciu widzia³em!");
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_SUCCESS);
	B_GiveXP			(500);

	CreateInvItem		(self, CRW_ARMOR_H);
	B_GiveInvItems      (self,hero,CRW_ARMOR_H,1);
};

//---------------------------------------------------------------------
INSTANCE DIA_Wolf_Sudden (C_INFO)
{
	npc		= Org_855_Wolf;
	condition	= DIA_Wolf_Sudden_Condition;
	information	= DIA_Wolf_Sudden_Info;
	important	= 1;	
	permanent	= 0;
	description 	= "";
};                       

FUNC INT DIA_Wolf_Sudden_Condition()
{
	if (task_choice == 1)&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return TRUE;
	};
};

func VOID DIA_Wolf_Sudden_Info()
{
	B_FullStop (hero);
	AI_GotoNpc (other,self);
	AI_DrawWeapon (self);
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_01"); //Lepiej ¿ebyœ mia³... To Ty!
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_02"); //Cholera, ma³o brakowa³o, a zrobi³bym Ci dodatkow¹ dziurê na oko.
	AI_RemoveWeapon (self);
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_03"); //Cieszê siê, ¿e masz stalowe nerwy. Poza tym dwa oczodo³y w zupe³noœci mi wystarcz¹.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_04"); //Niesamowite, przedar³eœ siê tutaj noc¹. Niez³a robota.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_05"); //Mia³em wa¿ny powód. Lee wróci³.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_06"); //W koñcu! Czyli nadszed³ czas ¿eby wyjœæ zza barykady.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_07"); //Spokojnie. Musimy uderzyæ jednoczeœnie ze wszystkich stron, wtedy zgnieciemy stra¿ników zanim zorientuj¹ siê co siê sta³o.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_08"); //Kiedy wszystko bêdzie gotowe nas³uchuj krzyku harpii, to bêdzie znak do ataku.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_09"); //Przeka¿ê to moim ludziom.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_10"); //Jak siê tu trzymacie?
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_11"); //Ca³kiem nieŸle. Magowie zostawili spore zapasy, a na brak strza³, ³uków i ry¿ówki te¿ nie mo¿emy narzekaæ.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_12"); //Do tego od czasu do czasu udaje siê ustrzeliæ jakiegoœ stra¿nika.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_13"); //Ale cieszê siê, ¿e Lee wróci³. Na d³u¿sz¹ metê bym tu nie wytrzyma³.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_14"); //Ju¿ nied³ugo wyjdziecie zza barykady.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_15"); //Naprawdê mi³o by³o zobaczyæ Twoj¹ paskud¹ mordê. Ale zmykaj ju¿, póki stra¿nicy rozprawiaj¹ siê z ry¿ówk¹.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_16"); //Pamiêtaj, krzyk harpii.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_17"); //¯ebym tylko nie pomyli³ sygna³u ze œmiechem Fletchera, he, he.
	AI_Output(hero,self,"DIA_Wolf_Sudden_15_18"); //Bywaj, Wilk i trzymaj tê swoj¹ sforê na krótkim postronku. Przynajmniej na razie.
	AI_Output(self,hero,"DIA_Wolf_Sudden_09_19"); //Wracaj ostro¿nie, przyjacielu.

	B_LogEntry(CH5_NO_Wolf, "Uda³o siê, porozmawia³em z Wilkiem. Przekaza³em mu wiadomoœæ od Lee. Sfora bêdzie czekaæ na krzyk harpii. Oby nie czekali za d³ugo... Muszê porozmawiaæ z Lee.");
};

//---------------------------------------------------------------------
INSTANCE DIA_Wolf_Trunk (C_INFO)
{
	npc		= Org_855_Wolf;
	condition	= DIA_Wolf_Trunk_Condition;
	information	= DIA_Wolf_Trunk_Info;
	important	= 1;	
	permanent	= 0;
	description 	= "";
};                       

FUNC INT DIA_Wolf_Trunk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_TheRock))
	{
		return TRUE;
	};
};

func VOID DIA_Wolf_Trunk_Info()
{
	B_FullStop (hero);
	AI_GotoNpc (other,self);
	AI_DrawWeapon (self);
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_01"); //Znowu siê zgubi³eœ?
	AI_Output(hero,self,"DIA_Wolf_Trunk_15_02"); //Mniej wiêcej. Widzê, ¿e w koñcu zrobiliœcie porz¹dek ze stra¿nikami.
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_03"); //W ¿yciu nie s³ysza³em gorszego krzyku harpii ni¿ ten w wykonaniu Gorna, nawet stra¿ników to zaskoczy³o, he, he.
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_04"); //Wystrzelaliœmy ilu siê da³o, a resztê wyr¿nêliœmy z bliska.
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_05"); //A teraz mam tu staæ i pilnowaæ szparga³ów magów. To rozkaz Lee, a ja g³upi cieszy³em siê z jego powrotu.
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_06"); //Powinienem teraz le¿eæ pod ³aw¹ w tawernie...
	AI_Output(hero,self,"DIA_Wolf_Trunk_15_07"); //To mo¿e ja Ciê na chwilê zast¹piê?
	AI_Output(self,hero,"DIA_Wolf_Trunk_09_08"); //Tak za darmo? Coœ mi tu œmierdzi. Pewnie masz ochotê na magiczny szmelc, hê?
	AI_Output(hero,self,"DIA_Wolf_Trunk_15_09"); //Chcê tylko pomóc. Pomyœleæ tylko jaka w tawernie p³ynie teraz rzeka ry¿ówki...
	
   if (DICK_CHOOSE == 1)
	{
		AI_Output(self,hero,"DIA_Wolf_Trunk_09_10"); //Na milê œmierdzisz magiem, nie dam siê nabraæ na pozorn¹ dobroæ.
	}
	else
	{
		AI_Output(self,hero,"DIA_Wolf_Trunk_09_11"); //Jesteœmy w Kolonii, nie wierzê w bezinteresownoœæ.
	};
	
   AI_Output(self,hero,"DIA_Wolf_Trunk_09_12"); //Mów prawdê.

	Info_ClearChoices (DIA_Wolf_Trunk);
	Info_AddChoice (DIA_Wolf_Trunk, "Po prostu chcê pomóc.", DIA_Wolf_Trunk_Help);
	Info_AddChoice (DIA_Wolf_Trunk, "Szukam pewnej skrzyni.", DIA_Wolf_Trunk_True);
	Info_AddChoice (DIA_Wolf_Trunk, "A co ci do tego?", DIA_Wolf_Trunk_What);
};

// ------------------------------------------------------------------

FUNC VOID DIA_Wolf_Trunk_Help()
{
	AI_Output(hero,self,"DIA_Wolf_Trunk_Help_15_01"); //Po prostu chcê pomóc.
	AI_Output(self,hero,"DIA_Wolf_Trunk_Help_09_02"); //Ta, a ja trafi³em do Kolonii za zbyt d³ugie w³osy.
	AI_Output(self,hero,"DIA_Wolf_Trunk_Help_09_03"); //Cz³owieku, nie jestem idiot¹!
	Info_ClearChoices (DIA_Wolf_Trunk);
};

// ------------------------------------------------------------------

FUNC VOID DIA_Wolf_Trunk_What()
{
	AI_Output(hero,self,"DIA_Wolf_Trunk_What_15_01"); //A co ci do tego?
	AI_Output(self,hero,"DIA_Wolf_Trunk_What_09_02"); //Niby nic, ale jak nie powiesz prawdy, to Ciê nie przepuszczê.
};

// ------------------------------------------------------------------

FUNC VOID DIA_Wolf_Trunk_True()
{
	AI_Output(hero,self,"DIA_Wolf_Trunk_True_15_01"); //Szukam pewnej skrzyni.
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_02"); //Wiedzia³em!
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_03"); //Ty cholerny z³odzieju, mów co jest w tej skrzyni, podzielimy siê po po³owie.
	AI_Output(hero,self,"DIA_Wolf_Trunk_True_15_04"); //Nic ciekawego, to prywatne rzeczy Hrabiego.
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_05"); //I ty chcesz w tym dobrowolnie grzebaæ?!
	AI_Output(hero,self,"DIA_Wolf_Trunk_True_15_06"); //Niezupe³nie dobrowolnie, to pomys³ Lee. Mo¿e znajdê tam coœ, co pomo¿e mi dostaæ siê do Orlego Gniazda.
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_07"); //Ludzie wy jesteœcie nienormalni! Kto zdrowy na umyœle pcha³by siê do sto³pu?!
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_08"); //Pierdolê, idê siê schlaæ do tawerny. 
	AI_Output(self,hero,"DIA_Wolf_Trunk_True_09_09"); //Jak spotkasz Lee, to pozdrów go ode mnie i powiedz, ¿e mo¿e sobie sam pilnowaæ magicznego szmelcu.
	AI_Output(hero,self,"DIA_Wolf_Trunk_True_15_10"); //Powiedzmy, ¿e to przemilczê.
	B_LogEntry (CH5_NC_TheRock, "Wilk pozwoli³ mi przejœæ, muszê znaleŸæ skrzyniê Hrabiego.");
	B_StopProcessInfos	(self);

	/*****************
Wilk idzie chlaæ do knajpy w NO

*******************/

	Npc_ExchangeRoutine(self,"DRUNK");
};

INSTANCE DIA_Wolf_CanYouTeachMe (C_INFO)
{
	npc				= Org_855_Wolf;
	//nr				= 71;
	condition		= DIA_Wolf_CanYouTeachMe_Condition;
	information		= DIA_Wolf_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Wolf_CanYouTeachMe_Condition()
{
	return wolf_trade_info;
};

FUNC VOID DIA_Wolf_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Wolf_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Wolf_CanYouTeachMe_12_02"); //NieŸle radzê sobie z ³ukiem, mogê pokazaæ Ci to i owo.
	
	Log_CreateTopic(GE_TeacherNC, LOG_NOTE);
	B_LogEntry(GE_TeacherNC, "Wilk nauczy mnie strzelaæ z ³uku.");
};