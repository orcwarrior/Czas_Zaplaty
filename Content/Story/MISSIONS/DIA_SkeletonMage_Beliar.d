INSTANCE SkelMag_Helper	(Mst_Default_Skeleton)
{
	name							=	"Szkielet";
	Set_SkeletonWarrior_Visuals();
	level							=	12;
	attribute	[ATR_STRENGTH]		=	40;
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	15;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	20;		
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONWARRIOR);

	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
	CreateInvItems (self, ItAt_Kosc, 1);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
	
};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Mag_Beliar_Exit (C_INFO)
{
	npc			= SkeletonMage_Beliar;
	nr			= 999;
	condition	= DIA_Mag_Beliar_Exit_Condition;
	information	= DIA_Mag_Beliar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Mag_Beliar_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Mag_Beliar_Exit_Info()
{
	B_StopProcessInfos	( self );
};


// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Mag_Beliar_Hello (C_INFO)
{
	npc				= SkeletonMage_Beliar;
	nr				= 1;
	condition		= DIA_Mag_Beliar_Hello_Condition;
	information		= DIA_Mag_Beliar_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Mag_Beliar_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Next1))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Mag_Beliar_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_00"); //Kolejny zb³¹kany œmiertelnik. Mój Pan ucieszy siê na tê duszê.
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_01"); //Zdaje siê, ¿e masz coœ co jest mi potrzebne.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_02"); //Zach³annoœæ. Mój Pan szanuje tê przywarê. Czego pragniesz zb³¹kana duszo?
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_03"); //Szukam pos¹¿ku Beliara. Bior¹c pod uwagê z kim rozmawiam i kogo nazywasz swym Panem, to chyba znalaz³em siê we w³aœciwym miejscu.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_04"); //Dociekliwoœæ. Tak, posiadam figurkê. Jednak wszystko ma swoj¹ cenê.
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_05"); //Rzeczywiœcie. Pozwól, ¿e wyt³umaczê Ci to bardziej przystêpnie.
	AI_DrawWeapon (hero);
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_06"); //Oddasz mi pos¹¿ek, albo naprawdê staniesz siê cuchn¹cym truch³em!
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_07"); //GroŸba, szanta¿. Tak, wyczuwam w Tobie potencja³. Zainteresowa³eœ mojego Pana.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_08"); //Wiedz jednak, ¿e nie mo¿na zdobyæ tego czego szukasz si³¹. Musisz zas³u¿yæ na ³askê mojego Pana.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_09"); //Dostaniesz pos¹¿ek w zamian za nieœmierteln¹ duszê.
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_10"); //O czym Ty mówisz? Nikomu nie oddam duszy!
	AI_RemoveWeapon (hero);
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_11"); //Zawziêtoœæ, ale nie ma takiej koniecznoœci. Niedaleko st¹d znajdziesz inn¹ zagubion¹ duszê o s³abym umyœle, który ci¹gle b³¹dzi.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_12"); //Zabij go, uwolnij duszê tego potêpieñca ku chwale mego Pana, a ofiarujê Ci pos¹¿ek. Dla niego to bêdzie ³aska...
	AI_Output (other, self, "DIA_Mag_Beliar_Hello_15_13"); //Niech ciê szlag, nie jestem morderc¹!
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_14"); //Ale¿ jesteœ, zabija³eœ ju¿ wczeœniej, dlaczego nie mia³byœ tego uczyniæ ponownie?
	AI_Output (self, other, "DIA_Mag_Beliar_Hello_11_15"); //Bêdê tu na Ciebie czeka³ œmiertelniku.
	B_LogEntry		(CH2_RBL_Tritetra, "Muszê zabiæ jakiegoœ cz³owieka, aby zdobyæ pos¹¿ek Beliara. Znajdê tego pechowca gdzieœ w pobli¿u brzegu.");	
	B_StopProcessInfos	(self);
	Wld_InsertNpc				(VLK_4000_Buddler,"OW_PIR_CAMPFIRE");
};

// **************************************************

INSTANCE DIA_Mag_Beliar_HelloAgain (C_INFO)
{
	npc				= SkeletonMage_Beliar;
	nr				= 1;
	condition		= DIA_Mag_Beliar_HelloAgain_Condition;
	information		= DIA_Mag_Beliar_HelloAgain_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Mag_Beliar_HelloAgain_Condition()
{
	var C_NPC mad; mad = Hlp_GetNpc(VLK_4000_Buddler);

	if (Npc_KnowsInfo(hero,DIA_Mag_Beliar_Hello))&&(Npc_GetDistToNpc(self,hero) < 500)&&(Npc_IsDead(mad))
	{
		return 1;
	};


};

FUNC VOID DIA_Mag_Beliar_HelloAgain_Info()
{
	B_GiveXP (300);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Mag_Beliar_HelloAgain_11_00"); //Dokona³o siê. Oto Twoja zap³ata, œmiertelniku.
	AI_Output (other, self, "DIA_Mag_Beliar_HelloAgain_15_01"); //Nawet s³ugusy Beliara dotrzymuj¹ s³owa. Kto by pomyœla³?
	AI_Output (self, other, "DIA_Mag_Beliar_HelloAgain_11_02"); //Wraz z pos¹¿kiem sp³ynie na Ciebie ³aska mojego Pana!
	
	/*************************
	Przyda³o by siê zrobiæ pos¹¿ek beliara
	*************************/

	CreateInvItems (self, tri_beliar_statue,1); 	
	B_GiveInvItems (self, other, tri_beliar_statue, 1);
	/****************************
	Nie wiem, jakaœ zmiana rutyny, pfx, etc.
	****************************/
	B_LogEntry		(CH2_RBL_Tritetra, "Zdoby³em pierwszy pos¹¿ek Beliara. Muszê jak najszybciej odnieœæ figurkê Lerenowi. Dziwnie siê czujê...");
	B_StopProcessInfos	(self);

};

// **************************************************


INSTANCE DIA_Mag_Beliar_Hello2 (C_INFO)
{
	npc				= SkeletonMage_Beliar;
	nr				= 1;
	condition		= DIA_Mag_Beliar_Hello2_Condition;
	information		= DIA_Mag_Beliar_Hello2_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Mag_Beliar_Hello2_Condition()
{

	if (Npc_KnowsInfo(hero,DIA_Leren_NextStatu))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};


};

FUNC VOID DIA_Mag_Beliar_Hello2_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	CreateInvItems (self, tri_beliar_statue,1); 
	CreateInvItems (self, tri_innos_statue,1); 
	AI_Output (self, other, "DIA_Mag_Beliar_Hello2_11_00"); //Znowu siê spotykamy œmiertelniku.
	AI_Output (other, self, "DIA_Mag_Beliar_Hello2_15_01"); //Przyby³em po pos¹¿ki.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello2_11_02"); //Nie po to zagarn¹³em to plugactwo Innosa, ¿eby oddaæ je jakiemuœ œmiertelnikowi.
	AI_Output (other, self, "DIA_Mag_Beliar_Hello2_15_03"); //Jak rozumiem tym razem nie obejdzie siê bez walki.
	AI_Output (self, other, "DIA_Mag_Beliar_Hello2_11_04"); //Tym razem czeka Ciê œmieræ!
	Wld_SpawnNpcRange (self, SkelMag_Helper,2,800);
	B_LogEntry		(CH2_RBL_Tritetra, "¯eby odzyskaæ pos¹¿ki muszê wys³aæ Koœca do jego Pana.");
	B_StopProcessInfos	(self); 
	Npc_ExchangeRoutine(self,"GraveyardAttack");
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget(self,other); 
	AI_StartState(self,ZS_MM_AttackMage,1,"");
}; 
