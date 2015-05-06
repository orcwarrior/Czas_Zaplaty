
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cooper_Exit (C_INFO)
{
	npc			= Stt_339_Cooper;
	nr			= 999;
	condition	= DIA_Cooper_Exit_Condition;
	information	= DIA_Cooper_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cooper_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cooper_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

var int cooper_pay;

INSTANCE DIA_Cooper_Hello (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 1;
	condition		= DIA_Cooper_Hello_Condition;
	information		= DIA_Cooper_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Cooper_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_Hello_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (self, other, "DIA_Cooper_Hello_12_01"); //Ej, Ty! PodejdŸ no tu.
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Cooper_Hello_12_02"); //Œmierdzisz sol¹ morsk¹. Mam racjê?
	AI_Output (other, self, "DIA_Cooper_Hello_15_03"); //Byæ mo¿e. Kim jesteœ?
	AI_Output (self, other, "DIA_Cooper_Hello_12_04"); //Odk¹d Gomez wykopa³ Diego, powsta³ wakat poganiaczy tych têpych Cieni.
	AI_Output (self, other, "DIA_Cooper_Hello_12_05"); //By³ tylko jeden chêtny, ale znaleŸli go na drugi dzieñ z poder¿niêtym gard³em.
	AI_Output (other, self, "DIA_Cooper_Hello_15_06"); //Cienie?
	AI_Output (self, other, "DIA_Cooper_Hello_12_07"); //No raczej sam tego nie zrobi³. Bystrzacha siê znalaz³...
	AI_Output (self, other, "DIA_Cooper_Hello_12_08"); //I wtedy Gomez raczy³ mnie 'nagrodziæ' t¹ posadk¹.
	AI_Output (self, other, "DIA_Cooper_Hello_12_09"); //W sumie nie jest Ÿle. Zrobi³em porz¹dek z kilkoma krzykaczami, a reszta siê nie wychyla.
	AI_Output (other, self, "DIA_Cooper_Hello_15_10"); //To œwietnie, ale co to mnie obchodzi?
	AI_Output (self, other, "DIA_Cooper_Hello_12_11"); //Po prostu jestem towarzyski. I lubiê nowe twarze.
	AI_Output (other, self, "DIA_Cooper_Hello_15_12"); //Wybacz, ale nie mam ca³ego dnia na pogawêdki...
	AI_Output (self, other, "DIA_Cooper_Hello_12_13"); //To bardzo nietaktowanie, marynarzyku. Ale zapomnê o tym, je¿eli op³acisz wejœciówkê.
	AI_Output (other, self, "DIA_Cooper_Hello_15_14"); //Nie rozumiem...
	AI_Output (self, other, "DIA_Cooper_Hello_12_15"); //Wszed³eœ do Starego Obozu, prawda?
	AI_Output (other, self, "DIA_Cooper_Hello_15_16"); //Tak.
	AI_Output (self, other, "DIA_Cooper_Hello_12_17"); //I ¿yjesz, prawda?
	AI_Output (other, self, "DIA_Cooper_Hello_15_18"); //Tak.
	AI_Output (self, other, "DIA_Cooper_Hello_12_19"); //Do tego korzystasz z takich przywilejów jak przebywanie w moim towarzystwie. A to kosztuje. Teraz rozumiesz?
	AI_Output (other, self, "DIA_Cooper_Hello_15_20"); //Tak.
	AI_Output (self, other, "DIA_Cooper_Hello_12_21"); //Bystrzacha z Ciebie, nie ma co. Lubiê Ciê, dam Ci dwa dni na uiszczenie zap³aty.
	AI_Output (other, self, "DIA_Cooper_Hello_15_22"); //Ile?
	AI_Output (self, other, "DIA_Cooper_Hello_12_23"); //Wystarczy tysi¹c bry³ek rudy, nie bêdê zdziera³ z marynarza.
	AI_Output (other, self, "DIA_Cooper_Hello_15_24"); //Niech ciê szlag... Tysi¹c bry³ek to za du¿o!
	AI_Output (self, other, "DIA_Cooper_Hello_12_25"); //Gówno mnie obchodzi Twoje zdanie. Masz dwa dni, póŸniej powycinam Ci niektóre czêœci cia³a. A teraz spadaj.
	
   cooper_pay = B_SetDayTolerance()+2;
	Log_CreateTopic	(CH3_Grd_Payment, LOG_MISSION);
	Log_SetTopicStatus	(CH3_Grd_Payment, LOG_RUNNING);
	B_LogEntry		(CH3_Grd_Payment, "Cholerny Stary Obóz! Zaczepi³ mnie przywódca Cieni - Cooper. Mam mu zap³aciæ wejœciówkê - 1000 bry³ek rudy. Je¿eli nie uwinê siê z tym w dwa dni, to mogê mieæ z nim spore problemy.");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Cooper_Seaman (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 2;
	condition		= DIA_Cooper_Seaman_Condition;
	information		= DIA_Cooper_Seaman_Info;
	permanent		= 0;
	important		= 0;
	description		= "Sk¹d wiedzia³eœ, ¿e by³em marynarzem?"; 
};

FUNC INT DIA_Cooper_Seaman_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cooper_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_Seaman_Info()
{
	AI_Output (other, self, "DIA_Cooper_Seaman_15_01"); //Sk¹d wiedzia³eœ, ¿e by³em marynarzem?
	AI_Output (self, other, "DIA_Cooper_Seaman_12_02"); //Zdradzi³ Ciê chód. Ka¿dy wilk morski to zauwa¿y.
	AI_Output (other, self, "DIA_Cooper_Seaman_15_03"); //Gdzie p³ywa³eœ?
	AI_Output (self, other, "DIA_Cooper_Seaman_12_04"); //Z kupieckimi okrêtami. By³em pilotem.
	AI_Output (self, other, "DIA_Cooper_Seaman_12_05"); //Pewnego razu na statku wybuch³ bunt, a ja stan¹³em po niew³aœciwej stronie i tak trafi³em do Kolonii.
	AI_Output (self, other, "DIA_Cooper_Seaman_12_06"); //Ale to stare dzieje. Mam ju¿ doœæ morza. Kiedy tylko szlag trafi barierê kupiê jak¹œ ober¿ê i rozkrêcê interes.
};

var int coop_pay;

// **************************************************

INSTANCE DIA_Cooper_Pay (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 3;
	condition		= DIA_Cooper_Pay_Condition;
	information		= DIA_Cooper_Pay_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcê zap³aciæ."; 
};

FUNC INT DIA_Cooper_Pay_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cooper_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_Pay_Info()
{
	AI_Output (other, self, "DIA_Cooper_Pay_15_01"); //Chcê zap³aciæ.
	if (cooper_pay <= (Wld_GetDay()))
	{
		AI_Output (self, other, "DIA_Cooper_Pay_12_02"); //Trochê póŸno, ale niech bêdzie.
	}
	else
	{
		AI_Output (self, other, "DIA_Cooper_Pay_12_03"); //Ale¿ proszê bardzo!
	};
   
	AI_Output (self, other, "DIA_Cooper_Pay_12_04"); //Pytanie tylko czy masz tyle rudy?
	
   if (NPC_HasItems(other,ItMiNugget)>=1000)
	{
		coop_pay = true;
      
		AI_Output (other, self, "DIA_Cooper_Pay_15_05"); //Bierz bry³ki!
		B_GiveInvItems (other, self, ItMiNugget, 1000);
		AI_Output (self, other, "DIA_Cooper_Pay_12_06"); //Ca³a przyjemnoœæ po mojej stronie. Dobrze, ¿e po œwiecie chodzi tylu frajerów...
		AI_Output (self, other, "DIA_Cooper_Pay_12_07"); //Czuj siê tu jak u siebie w domu.
		Log_SetTopicStatus	(CH3_Grd_Payment, LOG_SUCCESS);
		B_LogEntry		(CH3_Grd_Payment, "Zap³aci³em Cooperowi i chyba wyszed³em na frajera. Ale przynamniej mam z nim teraz spokój.");
	}
	else
	{
      coop_pay = 2;
      
		AI_Output (self, other, "DIA_Cooper_Pay_12_08"); //Nie masz tyle rudy! Chcia³eœ mnie obraziæ?
		AI_Output (self, other, "DIA_Cooper_Pay_12_09"); //Wiesz co? Zapomnij o wejœciówce. Za³atwimy to inaczej...
		Log_SetTopicStatus	(CH3_Grd_Payment, LOG_FAILED);
		B_LogEntry		(CH3_Grd_Payment, "Nie zap³aci³em Cooperowi, zapomnia³em, ¿e nie mam tyle rudy!");
		B_StopProcessInfos	(self); 
      B_StartAfterDialogFight(self,other,true);
	};
};

// **************************************************

INSTANCE DIA_Cooper_Payment (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 4;
	condition		= DIA_Cooper_Payment_Condition;
	information		= DIA_Cooper_Payment_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Cooper_Payment_Condition()
{
	if  (Npc_KnowsInfo (hero, DIA_Cooper_Hello))&&(Npc_GetDistToNpc(self,hero) < 400)&&(cooper_pay <= (Wld_GetDay()))&&(coop_pay == false)
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_Payment_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (self, other, "DIA_Cooper_Payment_12_01"); //Hej, marynarzyku!
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Cooper_Payment_12_02"); //Zdaje siê, ¿e o czymœ zapomnia³eœ...
	AI_Output (other, self, "DIA_Cooper_Payment_15_03"); //A tak, wejœciówka. Daj mi jeszcze kilka dni.
	AI_Output (self, other, "DIA_Cooper_Payment_12_04"); //Nie jestem idiot¹! Skoro brak Ci œmia³oœci, to zabiorê wszystko, co masz.
	B_GiveInvItems (other, self,ItMiNugget,NPC_HasItems(other,ItMiNugget));
	AI_Output (other, self, "DIA_Cooper_Payment_15_05"); //Ty cholerny z³odzieju!
	AI_Output (self, other, "DIA_Cooper_Payment_12_06"); //I jeszcze mnie obra¿asz... Sam siê o to prosi³eœ!

	Log_SetTopicStatus	(CH3_Grd_Payment, LOG_FAILED);
	B_LogEntry		(CH3_Grd_Payment, "Ten sukinsyn Cooper zabra³ mi ca³¹ rudê!");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Cooper_Thief (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 5;
	condition		= DIA_Cooper_Thief_Condition;
	information		= DIA_Cooper_Thief_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Cooper_Thief_Condition()
{

/********************************
ITKECOOPERKEY ma przy sobie Cooper, tylko tym kluczem mo¿na otworzyæ skrzyniê w chacie diego
dialog ma siê odpalaæ jak wsadzimy Royal_Ring do skrzyni cooper w chacie Diego

********************************/
	if  (Npc_KnowsInfo (hero, DIA_Harf_ProposalOk))&&(Npc_GetDistToNpc(self,hero) < 2000)&&(NPC_HasItems(other,ITKECOOPERKEY)>=1)&&Mob_HasItems ("OC_CHEST_COOPER", Royal_Ring)
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_Thief_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Cooper_Thief_12_01"); //Co Ty tu robisz, z³odzieju?!
	AI_Output (other, self, "DIA_Cooper_Thief_15_02"); //Ja tylko...
	AI_Output (self, other, "DIA_Cooper_Thief_12_03"); //£apska precz od tej skrzyni, ³achmyto!
	AI_Output (other, self, "DIA_Cooper_Thief_15_04"); //Nic nie zrobi³em...
	AI_Output (self, other, "DIA_Cooper_Thief_12_05"); //Wynoœ siê st¹d!
	B_LogEntry		(CH3_Grd_Thief, "Wsadzi³em sygnet do skrzyni Coopera. Czas porozmawiaæ z Harfordem i odebraæ nagrodê.");
	/*****************************
Trzebaby dodaæ wp poza chat¹ Diego/Coopera ¿eby gracza mo¿naby³o wywaliæ, albo skorzystaæ z istniej¹cego wp
****************************/
	B_StopProcessInfos	(self); 
	AI_GotoWP (other, "OCR_CAMPFIRE_A_MOVEMENT1");
};

// **************************************************

INSTANCE DIA_Cooper_End (C_INFO)
{
	npc				= Stt_339_Cooper;
	nr				= 5;
	condition		= DIA_Cooper_End_Condition;
	information		= DIA_Cooper_End_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak Ci leci?"; 
};

FUNC INT DIA_Cooper_End_Condition()
{
	if  (Npc_KnowsInfo (hero, DIA_Harf_ProposalEnd))&&(Npc_KnowsInfo (hero, DIA_Cooper_Thief))
	{
		return 1;
	};
};

FUNC VOID DIA_Cooper_End_Info()
{
	AI_Output (other, self, "DIA_Cooper_End_15_01"); //Jak Ci leci?
	AI_Output (self, other, "DIA_Cooper_End_12_02"); //Jak krew z nosa! I chyba wiem, przez kogo tu trafi³em!
	AI_Output (self, other, "DIA_Cooper_End_12_03"); //To Ty skurwielu ukrad³eœ mi klucz i wsadzi³eœ sygnet Gomeza do mojej skrzyni!
	AI_Output (self, other, "DIA_Cooper_End_12_04"); //Niech Ciê szlag trafi!
	
   B_StopProcessInfos(self);
}; 
