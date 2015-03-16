// **************************************************
// 						 EXIT 
// **************************************************

func void B_Attack_OC_GuardsGate()
{
   B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self, other, true);

	/************************
	Jakaœ fajna funkcja z atakiem iluœ tam stra¿ników
	***********************/
	B_IntruderAlert(self, other);
	B_SetAttackReason	(self, AIV_AR_INTRUDER);
};

func void B_open_gate_to_Old_Camp()
{
   B_ExchangeRoutine(grd_230, "FMTaken");
	Wld_SendUnTrigger("EVT_OC_MAINGATE01_01");
	isOpenedGateOC = true;
};

INSTANCE DIA_Grd_215_Exit (C_INFO)
{
	npc			= Grd_215_Torwache;
	nr			= 999;
	condition	= DIA_Grd_215_Exit_Condition;
	information	= DIA_Grd_215_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_215_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_215_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					Hallo
// **************************************************

INSTANCE DIA_Grd_215_First (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 1;
	condition		= DIA_Grd_215_First_Condition;
	information		= DIA_Grd_215_First_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Grd_215_First_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Urt_Hello)) && (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_First_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_DrawWeapon		(self);
	var C_ITEM myarmor;
	
	myarmor = Npc_GetEquippedArmor(hero);
   
	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{

		AI_Output (self, other,"DIA_Grd_215_First_06_00"); //Kim Ty do cholery jesteœ? Pierwszy raz widzê tak¹ zakazan¹ mordê!
		AI_Output (other, self,"DIA_Grd_215_First_15_01"); //Nie poznajesz mnie?
		AI_Output (self, other,"DIA_Grd_215_First_06_02"); //Mów sk¹d siê wzi¹³eœ albo wo³am ch³opaków!

		Info_ClearChoices (DIA_Grd_215_First);
		Info_AddChoice (DIA_Grd_215_First, "Jestem... handlarzem.", DIA_Grd_215_First_Trader);	
		Info_AddChoice (DIA_Grd_215_First, "Jestem kurierem magów.", DIA_Grd_215_First_Deliver);
		Info_AddChoice (DIA_Grd_215_First, "Wracam z patrolu.", DIA_Grd_215_First_Patrol);
		Info_AddChoice (DIA_Grd_215_First, "Zgubi³em siê.", DIA_Grd_215_First_Lost);		
	}
	else
	{
		AI_Output (self, other,"DIA_Grd_215_First_06_03"); //Po¿egnaj siê z ¿yciem idioto!
		
      B_Attack_OC_GuardsGate();
	};
};

FUNC VOID DIA_Grd_215_First_Deliver()
{
	AI_Output (other, self,"DIA_Grd_215_First_Deliver_15_01"); //Jestem kurierem magów.
	AI_Output (self, other,"DIA_Grd_215_First_Deliver_06_02"); //Tak? Mo¿e nikt Ci nie powiedzia³, ale magowie ju¿ dawno u¿yŸniaj¹ ziemiê.
	AI_Output (self, other,"DIA_Grd_215_First_Deliver_06_03"); //Ale nie przejmuj siê, zaraz do nich do³¹czysz...

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Trader()
{
	AI_Output (other, self,"DIA_Grd_215_First_Trader_15_04"); //Jestem... handlarzem.
	AI_Output (self, other,"DIA_Grd_215_First_Trader_06_05"); //Oczywiœcie, a ja jestem kap³anem Adanosa.

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Lost()
{
	AI_Output (other, self,"DIA_Grd_215_First_Lost_15_06"); //Zgubi³em siê.
	AI_Output (self, other,"DIA_Grd_215_First_Lost_06_07"); //To straszne, zaraz wska¿ê Ci najkrótsz¹ drogê do Beliara!

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Patrol()
{
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_15_08"); //Wracam z patrolu.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_06_09"); //Hmm, a z którego? Coœ Ciê nie kojarzê.

	Info_ClearChoices (DIA_Grd_215_First);
	Info_AddChoice (DIA_Grd_215_First, "A co ciê to obchodzi?!", DIA_Grd_215_First_Patrol_What);	
	Info_AddChoice (DIA_Grd_215_First, "By³em razem z Dukiem.", DIA_Grd_215_First_Patrol_Duke);
	Info_AddChoice (DIA_Grd_215_First, "Patrolowaliœmy okolice Obozu.", DIA_Grd_215_First_Patrol_Routine);
};

FUNC VOID DIA_Grd_215_First_Patrol_Routine()
{
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Routine_15_10"); //Patrolowaliœmy okolice Obozu.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Routine_06_11"); //Ale ze mnie idiota, a ja myœla³em, ¿e wszyscy zginêli...
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Routine_06_12"); //Nie wierzê w ani jedno Twoje s³owo!

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Patrol_What()
{
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_What_15_13"); //A co ciê to obchodzi?!
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_What_06_14"); //Mnie nic, ale Gomeza bardzo.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_What_06_15"); //Skoro wolisz zabraæ swoj¹ tajemnicê do grobu to proszê bardzo...

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Patrol_Duke()
{
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Duke_15_16"); //By³em razem z Dukiem.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_06_17"); //Mo¿liwe, rzeczywiœcie w tym œwietle wygl¹dasz bardziej znajomo...

	Info_ClearChoices (DIA_Grd_215_First);
   
	if (NPC_HasItems(other,ItFo_Special_Booz)>=1)
	{
		Info_AddChoice (DIA_Grd_215_First, "Mam coœ co odœwie¿y Ci pamiêæ.", DIA_Grd_215_First_Patrol_Duke_Drink);
	};
   
	Info_AddChoice (DIA_Grd_215_First, "To wpuœæ mnie i skoñczmy to przedstawienie.", DIA_Grd_215_First_Patrol_Duke_Into);
};

FUNC VOID DIA_Grd_215_First_Patrol_Duke_Into()
{
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Duke_Into_15_18"); //To wpuœæ mnie i skoñczmy to przedstawienie.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Into_06_19"); //Wiesz co? Jednak siê rozmyœli³em...

	B_Attack_OC_GuardsGate();
};

FUNC VOID DIA_Grd_215_First_Patrol_Duke_Drink()
{
	B_GiveXP(750);
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Duke_Drink_15_20"); //Mam coœ co odœwie¿y ci pamiêæ.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_21"); //Co takiego?
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Duke_Drink_15_22"); //Pierwszorzêdny spiryt!
	AI_RemoveWeapon (self);	
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_23"); //Trzaby³o tak od razu mówiæ. Daj butelkê.
   
	B_GiveInvItems (other, self,ItFo_Special_Booz, 1);
	AI_UseItem (self,ItFo_Special_Booz);
   
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_24"); //Cholera, ale to ma kopa...
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_25"); //O czym to myœmy gadali... hik...
	AI_Output (other, self,"DIA_Grd_215_First_Patrol_Duke_Drink_15_26"); //W³aœnie mia³eœ mnie wpuœciæ do obozu.
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_27"); //To po co tracisz mój... hik... czas....
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_28"); //W³aŸ do œrodka... hik. 
	AI_Output (self, other,"DIA_Grd_215_First_Patrol_Duke_Drink_06_29"); //O kurde! Ró¿owy ork! Te¿ go widzia³eœ? Hik...

   B_StopProcessInfos(self);
   B_open_gate_to_Old_Camp();

	Npc_ExchangeRoutine(RBL_4062_Urt,"OC1");
	AI_Teleport(RBL_4062_Urt,"OCR_MAINGATE_SQUARE");
	//var c_npc urt; urt = hlp_getnpc(RBL_4062_Urt);
	 //	CreateInvItem(urt,GRD_ARMOR_M);
	 //	AI_EquipArmor				(urt, GRD_ARMOR_M);
	//Mdl_SetVisualBody (urt,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 44,  1, GRD_ARMOR_M);

	B_LogEntry(CH3_RBL_OldCampSpy, "Nalewka rzeczywiœcie zadzia³a³a! Stra¿nik wpuœci³ mnie do œrodka. Teraz muszê tylko nie daæ siê zabiæ i nie zwracaæ uwagi stra¿ników. Ciekawe, gdzie znajdê tego Kelvina?");
   //Wld_SendUnTrigger("EVT_OC_MAINGATE01_01");
};

// **************************************************

INSTANCE DIA_Grd_215_Again (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 2;
	condition		= DIA_Grd_215_Again_Condition;
	information		= DIA_Grd_215_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Grd_215_Again_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grd_215_First))&&(Npc_KnowsInfo(hero, DIA_Cord_ConvoysPeopleDone4))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_Again_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);

	var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
   
	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other,"DIA_Grd_215_Again_06_00"); //To znowu Ty. D³ugo Ciê nie by³o. Gdzie siê szwêda³eœ?
		AI_Output (other, self,"DIA_Grd_215_Again_15_01"); //Tu i tam. Dzieje siê coœ ciekawego?
		AI_Output (self, other,"DIA_Grd_215_Again_06_02"); //Nudy jak zawsze. Tylko Orkan biega jak ze sraczk¹, bo magnaci zrobili go dowódc¹ transportu z broni¹ do Nowego Obozu.
		AI_Output (self, other,"DIA_Grd_215_Again_06_03"); //On to ma pecha... Wczeœniej patrole poza palisad¹, wyprawa na tereny orków, a teraz to. Chleje ju¿ drugi dzieñ i próbuje zebraæ ludzi do konwoju.
		AI_Output (other, self,"DIA_Grd_215_Again_15_04"); //Mo¿e te¿ siê zaci¹gnê...
		AI_Output (self, other,"DIA_Grd_215_Again_06_05"); //Zdurnia³eœ do reszty? Przecie¿ po³owa tych transportów nie wraca.
		AI_Output (self, other,"DIA_Grd_215_Again_06_06"); //Jak nie rebelianci to orkowie, albo cholera wie kto jeszcze ma w tym interes.
		AI_Output (other, self,"DIA_Grd_215_Again_15_07"); //Jak to nie wraca?
		AI_Output (self, other,"DIA_Grd_215_Again_06_08"); //Normalnie. Rozp³ywaj¹ siê jak we mgle. Znaczy na cztery doszed³ jeden, ale to by³o na samym pocz¹tku.
		AI_Output (self, other,"DIA_Grd_215_Again_06_09"); //Fletcher skomli o ludzi i sprzêt. Gomez wysy³a nadwy¿ki, ale z tego co wiem, to w skrzyniach jest pe³no z³omu.
		AI_Output (other, self,"DIA_Grd_215_Again_15_10"); //Coœ tu œmierdzi...
		AI_Output (self, other,"DIA_Grd_215_Again_06_11"); //Raczej cuchnie jak onuce orka! Ale to nie moja sprawa. W³aŸ do obozu i daj sobie spokój z tym konwojem.
		B_LogEntry(CH5_NC_Convoys, "Dowiedzia³em siê, ¿e dowódc¹ konwoju jest jakiœ Orkan. Ale stra¿nik przy bramie powiedzia³ coœ dziwnego. Podobno z kilku transportów do tej pory tylko jeden dotar³. Do tego w skrzyniach podobno jest z³om a nie porz¹dna broñ. Coœ mi tu nie pasuje... Muszê porozmawiaæ z tym Orkanem.");

		Wld_InsertNpc(Grd_4106_Orkan, "OCR_HUT_1");
      B_open_gate_to_Old_Camp();
	}
	else
	{
		AI_Output (self, other,"DIA_Grd_215_First_06_12"); //Œmierdzisz rebeliantem!
		B_StopProcessInfos	(self); 
		B_StartAfterDialogFight(self,other,true);
	};
};

// **************************************************

INSTANCE DIA_Grd_215_Surprice (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 3;
	condition		= DIA_Grd_215_Surprice_Condition;
	information		= DIA_Grd_215_Surprice_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Grd_215_Surprice_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grd_215_Again))&&(Npc_KnowsInfo(hero,DIA_Cavalorn_NCFinish))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_Surprice_Info()
{
	/***********************

Ork zmiana rutyny Diego, niech siedzi w lochach zamkniêty

*************************/

	var C_NPC diego; diego = Hlp_GetNpc(PC_Thief);
	Npc_ExchangeRoutine	(diego, "JAIL");

	B_FullStop (hero);
	AI_GotoNpc(other, self);

	var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
   
	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_00"); //Cholera Ty ¿yjesz?!
		AI_Output (other, self,"DIA_Grd_215_Surprice_15_01"); //Tak jakoœ wysz³o. Wybacz je¿eli Ciê rozczarowa³em...
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_02"); //Cz³owieku, magnaci powyskakuj¹ z gaci, jak siê dowiedz¹, ¿e ktoœ z konwoju ocala³!
		AI_Output (other, self,"DIA_Grd_215_Surprice_15_03"); //Wola³bym, ¿eby póki co nikt siê o tym nie dowiedzia³.
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_04"); //Co Ty pieprzysz. Przecie¿...
		AI_Output (other, self,"DIA_Grd_215_Surprice_15_05"); //S³uchaj. Ca³y ten konwój z broni¹ to jeden wielki szwindel.
		AI_Output (other, self,"DIA_Grd_215_Surprice_15_06"); //Magnaci wysy³aj¹ do Nowej Kopalni z³om, a stra¿nicy nie wracaj¹ mimo, ¿e to nie robota rebeliantów czy najemników. Rozumiesz?
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_07"); //Nie bardzo... Ale niech Ci bêdzie. Te¿ mi to œmierdzi... czymœ. 
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_08"); //No nic, dobrze widzieæ Ciê wœród ¿ywych.
		AI_Output (other, self,"DIA_Grd_215_Surprice_15_09"); //I nikomu ani s³owa!
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_10"); //Bêdê milcza³ jak grób. A teraz spadaj, bo zas³aniasz mi widok...
      
      B_open_gate_to_Old_Camp();
	}
	else
	{
		AI_Output (self, other,"DIA_Grd_215_Surprice_06_11"); //Œmierdzisz rebeliantem!
		B_StopProcessInfos(self); 
		B_StartAfterDialogFight(self,other,true);

		/************************
	Jakaœ fajna funkcja z atakiem iluœ tam stra¿ników
	***********************/
	};
};

// **************************************************

INSTANCE DIA_Grd_215_Attack (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 4;
	condition		= DIA_Grd_215_Attack_Condition;
	information		= DIA_Grd_215_Attack_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nied³ugo mo¿e tu byæ gor¹co."; 
};

FUNC INT DIA_Grd_215_Attack_Condition()
{	
	if (CHEST_KNOW == TRUE)&&(Npc_KnowsInfo(hero,DIA_Grd_215_Surprice))
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_Attack_Info()
{
	AI_Output (other, self,"DIA_Grd_215_Attack_15_01"); //Nied³ugo mo¿e tu byæ gor¹co.
	AI_Output (self, other,"DIA_Grd_215_Attack_06_02"); //Oby nie. Gomez przerzuci³ wiêkszoœæ stra¿ników do zamku.
	AI_Output (other, self,"DIA_Grd_215_Attack_15_03"); //Czyli zewnêtrzne bramy s¹ najs³abiej strze¿one?
	AI_Output (self, other,"DIA_Grd_215_Attack_06_04"); //Tego nie powiedzia³em, ale wola³bym siedzieæ w zamku.
};

INSTANCE DIA_Grd_215_OpenGate (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 4;
	condition		= DIA_Grd_215_OpenGate_Condition;
	information		= DIA_Grd_215_OpenGate_Info;
	permanent		= 1;
	important		= 0;
	description		= "(otwarcie bramy)"; 
};

FUNC INT DIA_Grd_215_OpenGate_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Grd_215_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_OpenGate_Info()
{
   AI_Output (self, other, "DIA_Grd_215_Attack_15_01"); //OTWORZYÆ BRAMÊ!
   
   B_StopProcessInfos(self);
	B_open_gate_to_Old_Camp();
};

INSTANCE DIA_GRD_230_OpenGate (C_INFO)
{
	npc				= GRD_230_Gardist;
	nr				= 4;
	condition		= DIA_GRD_230_OpenGate_Condition;
	information		= DIA_GRD_230_OpenGate_Info;
	permanent		= 1;
	important		= 0;
	description		= "(otwarcie bramy)"; 
};

FUNC INT DIA_GRD_230_OpenGate_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Grd_215_First))
	{
		return 1;
	};
};

FUNC VOID DIA_GRD_230_OpenGate_Info()
{
   B_StopProcessInfos(self);
	B_open_gate_to_Old_Camp();
};
