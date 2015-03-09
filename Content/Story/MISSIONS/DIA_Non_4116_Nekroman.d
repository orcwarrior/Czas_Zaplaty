
// Ork: Ten tutaj, to nekro w orctemple.zen
// **************************************************
// 						 EXIT 
// **************************************************
INSTANCE DIA_Necromanus_Exit (C_INFO)
{
	npc			= Non_4116_Nekroman;
	nr			= 999;
	condition	= DIA_Necromanus_Exit_Condition;
	information	= DIA_Necromanus_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Necromanus_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Necromanus_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_NecromanusD_Exit (C_INFO)
{
	npc			= Non_4116_NekromanD;
	nr			= 999;
	condition	= DIA_Necromanus_Exit_Condition;
	information	= DIA_Necromanus_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

INSTANCE DIA_Necromanus_First (C_INFO)
{
	npc				= Non_4116_Nekroman;
	nr				= 1;
	condition		= DIA_Necromanus_First_Condition;
	information		= DIA_Necromanus_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necromanus_First_Condition()
{
	var C_NPC cor; cor = Hlp_GetNpc(KDF_4115_Corristo);
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_IsDead(cor))&&((necro_appear == 1)||(necro_appear == 3))
	{
		return 1;
	};
};

FUNC VOID DIA_Necromanus_First_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Necromanus_First_11_01"); //Wystarczy ju¿ wyg³upów, czas na prawdziw¹ walkê!
	AI_Output (other, self, "DIA_Necromanus_First_15_02"); //Dlaczego mnie uratowa³eœ?
	AI_Output (self, other, "DIA_Necromanus_First_11_03"); //Mia³em swoje powody. A teraz odejdziesz ze mn¹...

	B_LogEntry		(CH6_RBL_PayDay, "Z deszczu pod rynnê. Jeden nekromanta uratowa³ mnie z r¹k drugiego... Zaczyna mnie niepokoiæ to zainteresowanie moj¹ osob¹.");
	B_StopProcessInfos	(self);
	
	//Ork: No chyba pora wy³¹czyæ muzyke dla bitwy w SO
	BOSSFIGHT_CURRENT = BOSSFIGHT_NONE;

	/***********************
Teleport do œwi¹tyni Œpiocha, zrób to bo ja nie wiem co dzia³a a co nie ;P
Aha niech Dick stoi pomiêdzy Xardem a Nekro tak bêdzie najlepiej dla dialogu.

***********************/
};


// **************************************************

INSTANCE DIA_Necromanus_First1 (C_INFO)
{
	npc				= Non_4116_Nekroman;
	nr				= 1;
	condition		= DIA_Necromanus_First1_Condition;
	information		= DIA_Necromanus_First1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necromanus_First1_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Necromanus_First))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Necromanus_First1_Info()
{
   B_StopProcessInfos(self);
   B_StopProcessInfos(hero);
	AI_Teleport  (hero, "DUNG_EXIT");
};

// **************************************************

INSTANCE DIA_Necromanus_Again (C_INFO)
{
	npc				= Non_4116_NekromanD;
	nr				= 2;
	condition		= DIA_Necromanus_Again_Condition;
	information		= DIA_Necromanus_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necromanus_Again_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero,DIA_Necromanus_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Necromanus_Again_Info()
{
	var C_NPC xar; xar = Hlp_GetNpc(KDF_406_OTXardas);

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	//AI_GotoNpc(other,self);//najlepiej ¿eby dick sta³ pomiêdzy xardasem a nekro
	AI_Output (self, other, "DIA_Necromanus_Again_11_01"); //To tutaj wszystko siê zaczê³o...
	AI_PlayAni (other, "T_SEARCH");
	AI_TurnToNpc (other, self);
	AI_Output (other, self, "DIA_Necromanus_Again_15_02"); //Co to za miejsce? Œmierdzi stêchlizn¹ i... œmierci¹.
	AI_Output (self, other, "DIA_Necromanus_Again_11_03"); //Tutaj narodzi³o siê moje ¿ycie. Ka¿dy kamieñ tej œwi¹tyni, ka¿da koœæ walaj¹ca siê po klepisku, ka¿da umêczona dusza... S³odki dom!
	AI_Output (self, other, "DIA_Necromanus_Again_11_04"); //To jedna z ukrytych œwi¹tyñ Beliara. Orkowie wybudowali j¹, aby s³u¿yæ wys³annikowi naszego Pana - Œni¹cemu.
	AI_Output (self, other, "DIA_Necromanus_Again_11_05"); //W nagrodê stali siê jego doczesnymi s³ugami.
	AI_Output (other, self, "DIA_Necromanus_Again_15_06"); //Wola³bym nie podzieliæ ich losu.
	AI_Output (self, other, "DIA_Necromanus_Again_11_07"); //To Ci nie grozi. Wybra³ Ciê Nasz Pan, abyœ by³ przed³u¿eniem Jego woli. Czyœ gotów?
	AI_Output (other, self, "DIA_Necromanus_Again_15_08"); //Z kim mamy walczyæ?
	AI_Output (self, other, "DIA_Necromanus_Again_11_09"); //Ze zdrajc¹ i renegatem, który sprzeciwi³ siê woli Beliara!
	AI_TurnToNpc(other, xar);
	AI_Output (other, self, "DIA_Necromanus_Again_15_10"); //Mówisz o Xardasie?
	AI_Output (self, other, "DIA_Necromanus_Again_11_11"); //Tak! Ten parszywy kuglarz chce wch³on¹æ moc Œni¹cego!
	B_LogEntry		(CH6_RBL_PayDay, "Nie ma to jak dwóch, k³óc¹cych siê nekromantów...");
	B_StopProcessInfos	(self);
   
   necro_dead = 0;
};

// **************************************************

INSTANCE DIA_Necromanus_Final (C_INFO)
{
	npc				= Non_4116_NekromanD;
	nr				= 3;
	condition		= DIA_Necromanus_Final_Condition;
	information		= DIA_Necromanus_Final_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necromanus_Final_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, Info_XardasOT_Final))
	{
		return 1;
	};
};

FUNC VOID DIA_Necromanus_Final_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Necromanus_Final_11_01"); //Czas Wybrañcze abyœ zatopi³ miecz w sercu zdrajcy!
	AI_Output (other, self, "DIA_Necromanus_Final_15_02"); //Masz racjê, tak te¿ uczyniê.
	AI_DrawWeapon (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Necromanus_Final_11_03"); //Co Ty robisz?!
	AI_Output (other, self, "DIA_Necromanus_Final_15_04"); //Œni¹cy musi wróciæ do cuchn¹cej nory, z której wype³zn¹³. Tak samo jak ka¿dy kto pragnie jego powrotu.
	AI_Output (self, other, "DIA_Necromanus_Final_11_05"); //Jak œmiesz podwa¿aæ wolê Beliara?! Nasz Pan...
	AI_Output (other, self, "DIA_Necromanus_Final_15_06"); //Twój, Pan! Nigdy nie bêdê s³u¿y³ ¿adnemu bogu!
	AI_Output (other, self, "DIA_Necromanus_Final_15_07"); //Kiedy Bezimienny odeœle Œni¹cego w cholerê, barierê szlag trafi, a na niczym innym mi nie zale¿y.
	AI_Output (self, other, "DIA_Necromanus_Final_11_08"); //Gorzko tego po¿a³ujesz...
	AI_Output (self, other, "DIA_Necromanus_Final_11_09"); //ARGH!

	Log_SetTopicStatus	(CH6_RBL_PayDay, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_PayDay, "Podj¹³em decyzjê. Nie bêdê s³u¿y³ ¿adnemu bogu! Niech szlag trafi wszystkich nekromantów i tê cholern¹ barierê!");

	/*************************
Da³em standarowo atak.
Mo¿e by jednak DIck móg³ zabiæ nekrosa a ten dopiero po œmierci by siê odrodzi³ jako demon? Tak by³oby chyba ciekawiej i trudniej.

***************************/

	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,true);
};
