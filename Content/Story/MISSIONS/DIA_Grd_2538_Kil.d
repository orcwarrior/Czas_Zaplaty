// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kil_Exit (C_INFO)
{
	npc			= Grd_2538_Kil;
	nr			= 999;
	condition	= DIA_Kil_Exit_Condition;
	information	= DIA_Kil_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kil_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kil_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					
// **************************************************

var int kil_talk;

INSTANCE DIA_Kil_First (C_INFO)
{
	npc				= Grd_2538_Kil;
	nr				= 1;
	condition		= DIA_Kil_First_Condition;
	information		= DIA_Kil_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Kil_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(!Npc_KnowsInfo (hero, DIA_Gorn_Guards))
	{
		return 1;
	};
};

FUNC VOID DIA_Kil_First_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
   
	if (kil_talk == FALSE)
	{
		kil_talk = TRUE;
		AI_Output (self, other, "DIA_Kil_First_11_01"); //Co tu tak œmierdzi? 
		AI_Output (other, self, "DIA_Kil_First_15_02"); //Ekhm... Chcia³bym wejœæ do obozu.
		AI_Output (self, other, "DIA_Kil_First_11_03"); //A ja chcia³bym wytrzeæ ty³ek perfumowanym papierem. 
		var C_ITEM myarmor;
		myarmor = Npc_GetEquippedArmor(hero);
		
      if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
		{
			AI_Output (other, self, "DIA_Kil_First_15_04"); //Spójrz na zbrojê, jestem stra¿nikiem.
			AI_Output (self, other, "DIA_Kil_First_11_05"); //Mo¿e tak, a mo¿e nie. Pe³no teraz przebierañców pa³êta siê po goœciñcu.
			AI_Output (other, self, "DIA_Kil_First_15_06"); //Ale...
			AI_Output (self, other, "DIA_Kil_First_11_07"); //Won mi st¹d!
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Kil_First_11_08"); //Powiedzia³em - won mi st¹d!
	};

	B_StopProcessInfos	(self);

	/*****************
	Gdzieœ poza ze 20m od bramy
	****************/
	AI_GotoWP(other, "NC_PATH50");
};

// **************************************************

var int kill_talk;

INSTANCE DIA_Kil_Gate (C_INFO)
{
	npc				= Grd_2538_Kil;
	nr				= 2;
	condition		= DIA_Kil_Gate_Condition;
	information		= DIA_Kil_Gate_Info;
	permanent		= 1;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Kil_Gate_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Gorn_Guards))&&(!grd_NC_pass)
	{
		return 1;
	};
};

FUNC VOID DIA_Kil_Gate_Info()
{
	/*************************
Zmiana rutyny Carlosa, który do tej pory sta³ przed bram¹ na Pola Ry¿owe.
Teraz ma staæ ze 20 m za bram¹ do NO przez któr¹ przepuszcza Kil

*************************/

	var C_NPC car; car = Hlp_GetNpc(Grd_4087_Carlos);
	Npc_ExchangeRoutine(car,"STAY");

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
   
	if (kill_talk == 0)
	{
		if (Npc_KnowsInfo (hero, DIA_Kil_First))
		{
			AI_Output (self, other, "DIA_Kil_Gate_11_01"); //To znowu Ty? Ale z ciebie uparte bydlê!
		};
      
		AI_Output (self, other, "DIA_Kil_Gate_11_02"); //Czego chcesz?
		AI_Output (other, self, "DIA_Kil_Gate_15_03"); //Przejœæ przez bramê.
		AI_Output (self, other, "DIA_Kil_Gate_11_04"); //Pos³uchaj...
		AI_Output (other, self, "DIA_Kil_Gate_15_05"); //Nie, to ty pos³uchaj!
	}
	else
	{
		AI_Output (self, other, "DIA_Kil_Gate_11_06"); //Czego znowu?
	};
   
	Info_ClearChoices (DIA_Kil_Gate);
	Info_AddChoice (DIA_Kil_Gate, "Wpuœcisz mnie i to zaraz!", DIA_Kil_Gate_Want);
	Info_AddChoice (DIA_Kil_Gate, "Wracam z patrolu.", DIA_Kil_Gate_Patrol);
	Info_AddChoice (DIA_Kil_Gate, "Chcê zaoferowaæ swoje us³ugi.", DIA_Kil_Gate_Hire);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Want()
{
	AI_Output (other, self, "DIA_Kil_Gate_Want_15_01"); //Wpuœcisz mnie i to zaraz!
   
	if (kill_talk == 0)
	{
		kill_talk = 1;
		AI_Output (self, other, "DIA_Kil_Gate_Want_11_02"); //A co zrobisz, ¿eby mnie przekonaæ? Bêdziesz tupa³ nog¹?
		AI_Output (self, other, "DIA_Kil_Gate_Want_11_03"); //Cz³owieku sk¹d Ty siê urwa³eœ?
		AI_Output (self, other, "DIA_Kil_Gate_Want_11_04"); //Masz szczêœcie, ¿e wypi³em za du¿o ry¿ówki, bo inaczej postrzela³bym sobie do ruchomego celu. Niestety w tym stanie nie trafi³bym nawet w stodo³ê.
		AI_Output (self, other, "DIA_Kil_Gate_Want_11_05"); //Spadaj!
	}
	else
	{
		AI_Output (self, other, "DIA_Kil_Gate_Want_11_06"); //Ju¿ to s³ysza³em - won!
	};
   
	B_StopProcessInfos(self);
	
	AI_GotoWP(other, "NC_PATH50");
};


// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Hire()
{
	AI_Output (other, self, "DIA_Kil_Gate_Hire_15_01"); //Chcê zaoferowaæ swoje us³ugi.
   
	if (kill_talk == 0)
	{
		kill_talk = 1;
		AI_Output (self, other, "DIA_Kil_Gate_Hire_11_02"); //Mamy ju¿ wystarczaj¹c¹ iloœæ mêskich dziwek, a Ty zbyt urokliwy nie jesteœ.
		AI_Output (self, other, "DIA_Kil_Gate_Hire_11_03"); //IdŸ uszczêœliwiæ kogoœ... bardziej zdeterminowanego. Mo¿e orków?
	}
	else
	{
		AI_Output (self, other, "DIA_Kil_Gate_Hire_11_04"); //Robisz siê nudny...
	};
   
	B_StopProcessInfos(self);
	
	
	AI_GotoWP(other, "NC_PATH50");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol()
{
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_15_01"); //Wracam z patrolu.
   
	if (kill_talk == 0)
	{
		kill_talk = 1;
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_02"); //Czy¿by? Coœ ma³y ten patrol. Jednoosobowy... Ciekawa taktyka.
		AI_Output (other, self, "DIA_Kil_Gate_Patrol_15_03"); //Dorwali nas rebelianci. Tylko ja zdo³a³em siê przebiæ.
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_04"); //Powiedz po prostu, ¿e najszybciej ucieka³eœ. Brakuje nam tu tylko kolejnego tchórza.
		AI_Output (other, self, "DIA_Kil_Gate_Patrol_15_05"); //Mówiê prawdê!
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_06"); //Mo¿e tak, a mo¿e nie. Rzeczywiœcie czekaliœmy na wsparcie i mo¿e jest tak jak mówisz.
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_07"); //Zadam Ci jedno pytanie, na które tylko prawdziwy stra¿nik bêdzie zna³ odpowiedŸ.
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_08"); //Kto teraz rz¹dzi w Nowym Obozie?
	}
	else
	{
		AI_Output (self, other, "DIA_Kil_Gate_Patrol_11_08"); //Dobra, spróbujmy jeszcze raz. Kto NAPRAWDÊ rz¹dzi w Nowym Obozie?
	};
   
	Info_ClearChoices (DIA_Kil_Gate);
	Info_AddChoice (DIA_Kil_Gate, "Ekhm... Ty?", DIA_Kil_Gate_Patrol_U);
	Info_AddChoice (DIA_Kil_Gate, "Hrabia.", DIA_Kil_Gate_Patrol_H);
	Info_AddChoice (DIA_Kil_Gate, "Gomez.", DIA_Kil_Gate_Patrol_G);
	Info_AddChoice (DIA_Kil_Gate, "Fletcher.", DIA_Kil_Gate_Patrol_F);
	Info_AddChoice (DIA_Kil_Gate, "Kruk.", DIA_Kil_Gate_Patrol_K);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol_U()
{
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_U_15_01"); //Ekhm... Ty?
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_U_11_02"); //Nie doœæ, ¿e tchórz i k³amca to jeszcze dupow³az.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_U_11_03"); //ZejdŸ mi z oczu!
	
   B_StopProcessInfos(self);
	
	AI_GotoWP(other, "NC_PATH50");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol_G()
{
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_G_15_01"); //Gomez.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_G_11_02"); //Sprytna odpowiedŸ. Niby bezpieczna i przekonywuj¹ca.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_G_11_03"); //Tylko, ¿e Gomez jest daleko st¹d i niektórym to bardzo odpowiada.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_G_11_04"); //OdejdŸ i daj mi siê ur¿n¹æ w spokoju.
	
   B_StopProcessInfos(self);
	
	AI_GotoWP(other, "NC_PATH50");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol_K()
{
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_K_15_01"); //Kruk.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_K_11_02"); //Nic mi o tym nie wiadomo - pud³o.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_K_11_03"); //IdŸ pownerwiaæ orków.
	
   B_StopProcessInfos(self);
	
	AI_GotoWP(other, "NC_PATH50");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol_F()
{
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_F_15_01"); //Fletcher.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_F_11_02"); //Hmm. Niby trafi³eœ. Ale Fletcher to tylko... wyeksponowana figura.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_F_11_03"); //Coœ mi siê w Tobie nie podoba. Chyba jednak nie wpuszczê ciê poza bramê.
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_F_15_04"); //Przecie¿ to Fletcher jest waszym szefem!
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_F_11_05"); //Ja trzymam z kimœ innym, kimœ kto stoi w cieniu. Bywaj.
	
   B_StopProcessInfos(self);
	
	AI_GotoWP(other, "NC_PATH50");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Kil_Gate_Patrol_H()
{
	grd_NC_pass = TRUE;
   
	AI_Output (other, self, "DIA_Kil_Gate_Patrol_H_15_01"); //Hrabia.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_H_11_02"); //No proszê, swój ch³op. Dobrze wiedzieæ, ¿e przybêdzie nam kolejny miecz.
	AI_Output (self, other, "DIA_Kil_Gate_Patrol_H_11_03"); //Mo¿esz przejœæ, przyjacielu.
	
   B_LogEntry		(CH4_RBL_NCRebel, "W koñcu uda³o mi siê przekonaæ Kila, ¿eby przepuœci³ mnie przez bramê! Czas trochê pozwiedzaæ.");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Kil_Talk (C_INFO)
{
	npc				= Grd_2538_Kil;
	nr				= 3;
	condition		= DIA_Kil_Talk_Condition;
	information		= DIA_Kil_Talk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co s³ychaæ?"; 
};

FUNC INT DIA_Kil_Talk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Kil_Gate))&&(grd_NC_pass)
	{
		return 1;
	};
};

FUNC VOID DIA_Kil_Talk_Info()
{
	AI_Output (other, self, "DIA_Kil_Talk _15_02"); //Co s³ychaæ?
	AI_Output (self, other, "DIA_Kil_Talk _11_03"); //Podobno Hrabia coœ szykuje... Mam nadziejê, ¿e bêdê wtedy daleko st¹d.
};
