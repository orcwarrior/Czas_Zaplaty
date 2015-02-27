//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_OrcGhost_EXIT (C_INFO)
{
	npc			= ORC_GHOST;
	nr			= 999;
	condition	= Info_OrcGhost_EXIT_Condition;
	information	= Info_OrcGhost_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_OrcGhost_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_OrcGhost_EXIT_Info()
{
	B_StopProcessInfos(self);
};

//---------------------------------------------------------------------
instance  Info_OrcGhost_Kill (C_INFO)
{
	npc			= ORC_GHOST;
	condition	= Info_OrcGhost_Kill_Condition;
	information	= Info_OrcGhost_Kill_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcGhost_Kill_Condition()
{	
	if /*(npc_getdisttowp(hero,"OGY_SHAMAN_5")<600)&&*/(Npc_KnowsInfo (hero, DIA_Roderic_OldNote1))
	{
		return 1;
	};
};

FUNC void  Info_OrcGhost_Kill_Info()
{
	AI_GotoWP(self, "OGY_SHAMAN_5");
   
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_01"); //Cuchniesz jak ¿ywa troll... G³upcem jesteœ myœl¹c, ¿e skalasz to miejsce sw¹ obecnoœci¹!
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_02"); //Coœ mam pecha do rozgadanych duchów...
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_03"); //Ka¿da cz³owiek to zdradzieckie nasienie Innosa. ¯yjecie tylko po to, by taplaæ siê w k³amstwie i zdradzie...
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_04"); //Nie chcê z Tob¹ walczyæ. Szukam... odpowiedzi.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_05"); //Niewa¿ne jest to czego Ty chcesz, ale to o co upominaj¹ siê duchy mych braci. A one spragnione s¹ krwi!
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_06"); //Zaczekaj! Na pewno mo¿emy siê dogadaæ. Ty mi coœ dasz, a ja dam coœ tobie.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_07"); //Hmm, wyczuwam w twym g³osie prawdê. Niech bêdzie - wymiana.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_08"); //Mów czego chcesz.
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_09"); //Muszê wejœæ do podziemi Klasztoru Zmiennokszta³tnych. Szukam klucza, który znajduje siê gdzieœ tutaj.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_10"); //Wiem kogo szukasz. Pos³uchaj tej opowieœci.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_11"); //Rzadko siê zdarza, ¿e orkowie i ludzie ¿yj¹ razem, a jeszcze rzadziej, gdy wzajemnie siê szanuj¹ i ze sob¹ nie walcz¹.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_12"); //By³ kiedyœ cz³owiek, taki jak Ty, silny i bezczelny, który zdoby³ szacunek orków.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_13"); //By³ wspania³ym wojownikiem, walczy³ jak demon, zabija³ jak w¹¿.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_14"); //Nazwali go Urksh'Est, co w czarnej mowie znaczy Zimny P³omieñ. Nigdy nie okazywa³ emocji ani litoœci.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_15"); //Kiedy jeszcze krew p³ynê³a w mych ¿y³ach byliœmy przyjació³mi. Zaufa³em mu, zdradzi³em mu sekrety, które skrzêtnie skrywaliœmy w czeluœciach klasztoru.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_16"); //Morra nas zdradzi³, zdradzi³ mnie, a ja dla niego zdradzi³em swych braci...
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_17"); //Od tamtego czasu jestem potêpiony...
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_18"); //Znasz ludzkie imiê tego zdrajcy?
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_19"); //Tak, bracia nazywali go Truan.
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_20"); //Jak¹ mia³ odegraæ rolê podczas ataku na ludzk¹ osadê?
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_21"); //Mia³ siê pozbyæ stra¿nika, uœpi³ go, a wtedy zrównaliœmy osadê z ziemi¹.
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_22"); //Po co zaatakowaliœcie osadê?
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_23"); //Ludzie stali nam na drodze do reliktu, który musieliœmy zdobyæ.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_24"); //Ale Urksh'Est zdradzi³ i nas. Pchn¹³ mnie sztyletem w serce, ¿eby dostaæ siê do ukrytych komnat. Tylko krew szamana otwiera³a drogê do pradawnego artefaktu...
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_25"); //Nie wiem jaki los spotka³ go w podziemiach klasztoru, ale nigdy stamt¹d nie wyszed³.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_26"); //Wiem tylko, ¿e duch zdrajcy zosta³ uwiêziony w mroku pomiêdzy ¿yciem, a œmierci¹.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_27"); //Od dawna ju¿ nikt... 
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_28"); //Wystarczy Morra. Teraz zap³ata.
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_29"); //Mów czego pragniesz orku.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_30"); //Uwolnij mnie od œwiata œmiertelników, daj mi wolnoœæ Morra. Choæ tak zma¿ przewiny swego brata.
	AI_Output 	(other,self,"Info_OrcGhost_Kill_15_31"); //Zrobiê to.
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_32"); //Szkoda, ¿e Urksh'Est nie by³ taki jak Ty. W Tobie wyczuwam si³ê i prawdê. Twe myœli i s³owa s¹ jednym...
	AI_Output 	(self, hero,"Info_OrcGhost_Kill_17_33"); //Stawaj wiêc Morra...
	
   B_LogEntry		(CH3_RBL_RodneyHelp, "W orkowej nekropolii spotka³em ducha orka, który opowiedzia³ mi historiê Urksh'Est - Zimnego P³omienia. Cz³owieka, który zdoby³ zaufanie orków, a potem ich zdradzi³. Cz³owieka, który zdradzi³ swych braci, aby posi¹œæ potê¿ny artefakt ukryty w podziemiach klasztoru. Imiê jego brzmi Truan.");
	self.guild = GIL_UNDEADORC;

	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget(self,other); 
	//AI_StartState(self,ZS_ATTACK,0,""); 
	
	var c_npc nameless; nameless = Hlp_GetNpc(Nameless_ThirdMeetGYD);
	if(Hlp_IsValidNpc(nameless))
	{
		B_StartAfterDialogFight(nameless,self,true);	
	};	
   
	B_StopProcessInfos(self); 
};
