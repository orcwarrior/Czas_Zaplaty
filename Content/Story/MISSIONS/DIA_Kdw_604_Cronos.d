// ************************ EXIT **************************
instance KDW_604_Cronos_Exit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  999;	
	condition	=  KDW_604_Cronos_Exit_Condition;
	information	=  KDW_604_Cronos_Exit_Info;
	permanent	=  1;
	important	=  0;
	description = DIALOG_ENDE;
};                       

FUNC int KDW_604_Cronos_Exit_Condition()
{
	return 1;
};

FUNC VOID KDW_604_Cronos_Exit_Info()
{
	B_StopProcessInfos(self);
};

// *****************************************
//					Greet
// *****************************************

instance DIA_Cronos_Greet (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  DIA_Cronos_Greet_Condition;
	information	=  DIA_Cronos_Greet_Info;
	permanent	= 0;
	important 	= 0;
	description = "Witaj, magu!";
};                       

FUNC int DIA_Cronos_Greet_Condition()
{
	return 1;
};

FUNC VOID DIA_Cronos_Greet_Info()
{
	AI_Output (other, self,"DIA_Cronos_Greet_15_00"); //Witaj, magu!
	AI_Output (self, other,"DIA_Cronos_Greet1_08_01"); //Czego tu szukasz?
	AI_Output (other, self,"DIA_Cronos_Greet1_15_02"); //Odpoczynku przed dalsz¹ podró¿¹.
	AI_Output (self, other,"DIA_Cronos_Greet1_08_03"); //Ruszaj w swoj¹ stronê i lepiej tu nie wracaj!
	
   B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Cronos_Map (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  2;	
	condition	=  DIA_Cronos_Map_Condition;
	information	=  DIA_Cronos_Map_Info;
	permanent	= 0;
	important 	= 0;
	description = "To tobie mam sk³adaæ raporty z poszukiwañ?";
};                       

FUNC int DIA_Cronos_Map_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_Ornament))&&(Npc_KnowsInfo(hero,DIA_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID DIA_Cronos_Map_Info()
{
	AI_Output (other, self,"DIA_Cronos_Map_15_00"); //To tobie mam sk³adaæ raporty z poszukiwañ?
	AI_Output (self, other,"DIA_Cronos_Map_08_01"); //Tak. ZnaleŸliœcie w koñcu jakiœ ornament?
	AI_Output (other, self,"DIA_Cronos_Map_15_02"); //I tak, i nie.
	AI_Output (self, other,"DIA_Cronos_Map_08_03"); //Mów do rzeczy.
	AI_Output (other, self,"DIA_Cronos_Map_15_04"); //Jeden z najemników znalaz³ ornament, ale przep³aci³ to ¿yciem. Zabójca ukrad³ fragment.
	AI_Output (other, self,"DIA_Cronos_Map_15_05"); //Tak samo sta³o siê z drug¹ czêœci¹, tym razem trafi³o na mnie. Jakoœ zdo³a³em siê z tego wykaraskaæ.
	AI_Output (self, other,"DIA_Cronos_Map_08_06"); //To niemo¿liwe! Nikt prócz nas nie wie o ornamentach i portalu...
	AI_Output (other, self,"DIA_Cronos_Map_15_07"); //Jakim portalu?
	AI_Output (self, other,"DIA_Cronos_Map_08_08"); //To nie twoja sprawa! Wiesz, kim byli napastnicy?
	AI_Output (other, self,"DIA_Cronos_Map_15_09"); //To nie twoja sprawa, magu.
	AI_Output (self, other,"DIA_Cronos_Map_08_10"); //Nie drwij ze mnie ³achmyto, bo...
	
   AI_DrawWeapon (other);
	
   AI_Output (other, self,"DIA_Cronos_Map_15_11"); //Pos³uchaj sukinsynie! Jestem tutaj dla Lee, nie dla was.
	AI_Output (other, self,"DIA_Cronos_Map_15_12"); //Obieca³em pomóc i mimo uprzedzeñ do cuchn¹cych magów, staram siê dotrzymaæ danego s³owa.
	AI_Output (other, self,"DIA_Cronos_Map_15_13"); //Masz jeszcze coœ do powiedzenia?
	
   AI_TurnToNpc(self, other);
	Ai_Wait (self,1.0);
	
   AI_Output (self, other,"DIA_Cronos_Map_08_14"); //OdejdŸ i pamiêtaj o raporcie!
	
   AI_RemoveWeapon (other);
	
   B_LogEntry(CH3_NON_Ornament, "Ci magowie to zadufana w sobie banda. Je¿eli znajdê ornament, muszê go przynieœæ Cronosowi.");
	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Cronos_Wait (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  DIA_Cronos_Wait_Condition;
	information	=  DIA_Cronos_Wait_Info;
	permanent	= 0;
	important 	= 1;
	description = "";
};                       

FUNC int DIA_Cronos_Wait_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cronos_Map))
	{
		return 1;
	};
};

FUNC VOID DIA_Cronos_Wait_Info()
{
	AI_Output (self, other,"DIA_Cronos_Wait_08_01"); //Zaczekaj!
	
   AI_TurnToNpc 	(other, self);
	
   AI_Output (other, self,"DIA_Cronos_Wait_15_02"); //Co chcesz?
	AI_Output (self, other,"DIA_Cronos_Wait_08_03"); //Powiedz Merdarionowi o tych, którzy zabrali ornamenty. On ma wiêksz¹ cierpliwoœæ do... ludzi.
	AI_Output (other, self,"DIA_Cronos_Wait_15_04"); //Przemyœlê to.
	AI_Output (self, other,"DIA_Cronos_Wait_08_05"); //ZejdŸ mi z oczu!
	
   Log_CreateTopic(CH3_NON_Seekers, LOG_MISSION);
	Log_SetTopicStatus(CH3_NON_Seekers, LOG_RUNNING);
	B_LogEntry(CH3_NON_Seekers, "Mam porozmawiaæ z Merdarionem o stra¿nikach, którzy zabrali ornamenty. Mo¿e to nie jest taki z³y pomys³?");
	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Cronos_Ornament (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  4;	
	condition	=  DIA_Cronos_Ornament_Condition;
	information	=  DIA_Cronos_Ornament_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mam ornament.";
};                       

FUNC int DIA_Cronos_Ornament_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_SaveDick))&&(NPC_HasItems(hero,orn3)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Cronos_Ornament_Info()
{
	B_GiveXP(1500);
   
	AI_Output (other, self,"DIA_Cronos_Ornament_15_00"); //Mam ornament.
	AI_Output (self, other,"DIA_Cronos_Ornament_08_01"); //W koñcu! Daj mi go natychmiast!
	
   B_GiveInvItems (other, self, orn3, 1);
	Npc_RemoveInvItems(self,orn3,1);
	
   AI_Output (self, other,"DIA_Cronos_Ornament_08_02"); //Ruszaj po nastêpny!
	AI_Output (other, self,"DIA_Cronos_Ornament_15_03"); //Nie ma za co... Cholerni magowie nawet podziêkowaæ nie potrafi¹!
	
   B_LogEntry(CH3_NON_Ornament, "Odda³em Cronosowi ornament. Nie us³ysza³em nawet 'dziêkujê'. Ci magowie a¿ siê prosz¹ o naukê dobrych manier...");
};

// *****************************************

instance DIA_Cronos_OrnamentAll (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  5;	
	condition	=  DIA_Cronos_OrnamentAll_Condition;
	information	=  DIA_Cronos_OrnamentAll_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mam pozosta³e ornamenty.";
};                       

FUNC int DIA_Cronos_OrnamentAll_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cronos_Ornament))&&(ritual_time_ok == TRUE)&&(NPC_HasItems(hero,orn1)>=1)&&(NPC_HasItems(hero,orn2)>=1)&&(NPC_HasItems(hero,orn4)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Cronos_OrnamentAll_Info()
{
	AI_Output (other, self,"DIA_Cronos_OrnamentAll_15_00"); //Mam pozosta³e ornamenty.
	
   if (ornament_wait >= Wld_GetDay())
	{
		AI_Output (self, other,"DIA_Cronos_OrnamentAll_08_01"); //Szybko, daj mi je.
		
      B_GiveInvItems (other, self, orn1, 1);
		Npc_RemoveInvItems(self,orn1,1);
		B_GiveInvItems (other, self, orn2, 1);
		Npc_RemoveInvItems(self,orn2,1);
		B_GiveInvItems (other, self, orn4, 1);
		Npc_RemoveInvItems(self,orn4,1);
		
      AI_Output (other, self,"DIA_Cronos_OrnamentAll_15_02"); //Saturas czeka na dziedziñcu.
		AI_Output (self, other,"DIA_Cronos_OrnamentAll_08_03"); //Ju¿ tam idê...
		
      B_LogEntry(CH3_NON_Ornament, "Odda³em Cronosowi ornamenty, powiedzia³em mu te¿, ¿eby stawi³ siê na dziedziñcu.");
		Npc_ExchangeRoutine(self,"RIT");
	}
	else
	{
		AI_Output (self, other,"DIA_Cronos_OrnamentAll_08_04"); //Teraz?! Mo¿esz je sobie wsadziæ w rzyæ! ZejdŸ mi z oczu...
	};
};

