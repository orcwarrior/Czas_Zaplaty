INSTANCE DIA_Budd_First (C_INFO)
{
	npc				= VLK_4101_Buddler;
	nr				= 1;
	condition		= DIA_Budd_First_Condition;
	information		= DIA_Budd_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Budd_First_Condition()
{
	var C_NPC con1; con1 = Hlp_GetNpc(Grd_4102_Convoy);
	var C_NPC con2; con2 = Hlp_GetNpc(Grd_4103_Convoy);
	var C_NPC con3; con3 = Hlp_GetNpc(Grd_4104_Convoy);
	var C_NPC con4; con4 = Hlp_GetNpc(Grd_4105_Convoy);

	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Cord_ConvoysPeople))
	&& ((Npc_IsDead(con1))&&(Npc_IsDead(con2))&&(Npc_IsDead(con3))&&(Npc_IsDead(con4)))
	{
		return 1;
	};
};

FUNC VOID DIA_Budd_First_Info()
{
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};

	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Budd_First_11_01"); //Zat³uk³eœ tych skurwieli! Myœla³em, ¿e ju¿ po mnie...
	AI_Output (other, self, "DIA_Budd_First_15_02"); //Spokojnie ju¿ po wszystkim. Ostro siê z wami zabawili.
	AI_Output (self, other, "DIA_Budd_First_11_03"); //Czêsto tak robi¹. Niektóre transporty w ogóle nie docieraj¹ do Nowego Obozu.
	AI_Output (self, other, "DIA_Budd_First_11_04"); //Oczywiœcie magnaci przymykaj¹ na to oko.
	AI_Output (self, other, "DIA_Budd_First_11_05"); //Kopacz to coœ gorszego ni¿ gówno na czubku buta...
	AI_Output (other, self, "DIA_Budd_First_15_06"); //Doprowadzê Ciê do Nowego obozu, masz na to moje s³owo!
	AI_Output (self, other, "DIA_Budd_First_11_07"); //Naprawdê?! Zrobisz to? Nie mam czym zap³aciæ...
	AI_Output (other, self, "DIA_Budd_First_15_08"); //Zrobiê to za darmo, tylko nikomu o tym ani s³owa! Nie chcê popsuæ sobie reputacji...
	AI_Output (self, other, "DIA_Budd_First_11_09"); //Bêdê milcza³ jak grób. Pomodlê siê za Ciebie...
	AI_Output (other, self, "DIA_Budd_First_15_10"); //Wola³bym, aby bogowie siê do tego nie mieszali... Ale dziêki, za dobre chêci.
	B_LogEntry		(CH5_NC_Convoys, "Uratowa³em jednego z kopaczy. Nie zazdroszczê im losu... Niech mnie szlag trafi, je¿eli nie zdo³am bezpiecznie doprowadziæ tego nieszczêœnika do Nowego Obozu!");	

	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Budd_Safe (C_INFO)
{
	npc				= VLK_4101_Buddler;
	nr				= 2;
	condition		= DIA_Budd_Safe_Condition;
	information		= DIA_Budd_Safe_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Budd_Safe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Budd_First ))&&(Npc_GetDistToWP (self,"NC_PATH86_MOVEMENT") < 500 )
	{
		return 1;
	};
};

FUNC VOID DIA_Budd_Safe_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Budd_Safe_11_01"); //Nie wierzê w³asnym oczom... Jestem bezpieczny...
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_Budd_Safe_11_02"); //Masz moj¹ dozgonn¹ wdziêcznoœæ, dobry cz³owieku.
	AI_Output (other, self, "DIA_Budd_Safe_15_03"); //Dobrze ju¿ dobrze, nie rozklejaj siê. Powodzenia, przyjacielu.
	AI_Output (other, self, "DIA_Budd_Safe_15_04"); //I nie daj siê ju¿ wiêcej kopaæ przez ¿ycie w dupê!
	AI_Output (self, other, "DIA_Budd_Safe_11_05"); //Zapamiêtam to.
	B_LogEntry		(CH5_NC_Convoys, "Doprowadzi³em kopacza do Nowego Obozu. Dobrze jest czasami zrobiæ coœ... za darmo.");
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"StayCamp");
	B_StopProcessInfos	(self); 
};
