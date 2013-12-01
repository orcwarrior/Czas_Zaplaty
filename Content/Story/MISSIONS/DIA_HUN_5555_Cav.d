//********************************************************
instance DIA_Cav_Dungeon_Exit (C_INFO)
{
   npc         =  HUN_5555_Cav;
   nr          =  999;
   condition   =  DIA_Cav_Dungeon_Exit_Condition;
   information =  DIA_Cav_Dungeon_Exit_Info;
   important   =  0;   
   permanent   =  1;
   description = DIALOG_ENDE;
};                       

FUNC int DIA_Cav_Dungeon_Exit_Condition()
{
   return TRUE;
};

FUNC VOID DIA_Cav_Dungeon_Exit_Info()
{
   B_StopProcessInfos(self);
};

INSTANCE DIA_Cav_TooEarlyDungeon (C_INFO)
{
   npc         = HUN_5555_Cav;
   //nr         = 66;
   condition   = DIA_Cav_TooEarlyDungeon_Condition;
   information = DIA_Cav_TooEarlyDungeon_Info;
   permanent   = 0;
   important   = 1;
   description = "."; 
};

FUNC INT DIA_Cav_TooEarlyDungeon_Condition()
{
   if (Kapitel < 6)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_TooEarlyDungeon_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_TooEarlyDungeon_12_01"); //Co ty tu robisz? Dlaczego uzy³eœ kodów?!
   AI_Output (hero, self, "DIA_Cav_TooEarlyDungeon_15_02"); //Ja...
   AI_Output (self, other, "DIA_Cav_TooEarlyDungeon_12_03"); //GIÑ, WSTRÊTNY OSZUŒCIE!

   B_StopProcessInfos(self);
   
   Npc_ChangeAttribute   (hero, ATR_HITPOINTS, -hero.attribute[ATR_HITPOINTS_MAX]);
};

INSTANCE DIA_Cav_Dungeon (C_INFO)
{
   npc         = HUN_5555_Cav;
   //nr         = 66;
   condition   = DIA_Cav_Dungeon_Condition;
   information = DIA_Cav_Dungeon_Info;
   permanent   = 0;
   important   = 1;
   description = "."; 
};

FUNC INT DIA_Cav_Dungeon_Condition()
{
   if (Npc_GetDistToWP (self,"DUNG1") < 500) && C_IsChapter(6)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_Dungeon_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_Dungeon_12_01"); //Twoi kompani zostali na górze, os³aniaj¹ nasze plecy.
   AI_Output (hero, self, "DIA_Cav_Dungeon_15_02"); //Randka we dwoje?
   AI_Output (self, other, "DIA_Cav_Dungeon_12_03"); //Mniej wiêcej. Widzia³em jak Gomez zszed³ na dó³. Co ty na to, ¿eby dopaœæ tego szczura?
   AI_Output (hero, self, "DIA_Cav_Dungeon_15_04"); //Tylko ten skurwiel stoi miêdzy mn¹ a ucieczk¹ z tego szamba. Bêdê tu¿ za tob¹.   
   AI_Output (self, other, "DIA_Cav_Dungeon_12_05"); //Tylko ostro¿nie, nie podoba mi siê to miejsce. Miej oczy szeroko otwarte.
   
   B_LogEntry(CH6_RBL_PayDay, "Podziemia cuchn¹ truposzami, musimy zachowaæ ostro¿noœæ, ¿eby nie zostaæ tu na zawsze.");
   Npc_ExchangeRoutine(self, "GUIDE");

   B_StopProcessInfos(self);
};

//********************************************************

INSTANCE DIA_Cav_DungeonInside (C_INFO)
{
   npc         = HUN_5555_Cav;
   //nr         = 67;
   condition   = DIA_Cav_DungeonInside_Condition;
   information = DIA_Cav_DungeonInside_Info;
   permanent   = 0;
   important   = 1;
   description = "."; 
};

FUNC INT DIA_Cav_DungeonInside_Condition()
{
   /****************************
wp w podziemiach, przy ciele pierwszego martwego stra¿nika i szcz¹tkach szkieleciora

****************************/

   if (Npc_KnowsInfo (hero,DIA_Cav_Dungeon))&&(Npc_GetDistToWP (self,"DUNG5") < 500)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_DungeonInside_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_DungeonInside_12_01"); //Sukinsyny maj¹ ciê¿k¹ przeprawê z umarlakami.
   AI_Output (other, self, "DIA_Cav_DungeonInside_15_02"); //I dobrze, niech ich koœcieje wykrwawi¹, zanim siê do nich dobierzemy.
   AI_Output (self, other, "DIA_Cav_DungeonInside_12_03"); //Uwa¿ajmy, ¿eby i nas nie poharatali.
   AI_Output (self, other, "DIA_Cav_DungeonInside_12_04"); //Co to za dŸwiêk?
   AI_Output (self, other, "DIA_Cav_DungeonInside_12_05"); //To koœciaki, do broni!   
   
   B_LogEntry(CH6_RBL_PayDay, "Idziemy dobrym œladem. Cia³a stra¿ników i szcz¹tki umarlaków œwiadcz¹, ¿e Gomez nie ma ³atwej ucieczki.");
   Npc_ExchangeRoutine(self, "GUIDE2");
   B_StopProcessInfos(self);

   Wld_InsertNpc(Skeleton2HSwdWarrior,"DUNG6");
   Wld_InsertNpc(Skeleton2HAxeWarrior,"DUNG8");
   Wld_InsertNpc(SkeletonWarrior,"DUNG6");
   Wld_InsertNpc(SkeletonIceRanger,"DUNG8");
   Wld_InsertNpc(SkeletonFireRanger,"DUNG6");
};

//********************************************************

INSTANCE DIA_Cav_DungeonInside1 (C_INFO)
{
   npc         = HUN_5555_Cav;
   //nr         = 67;
   condition   = DIA_Cav_DungeonInside1_Condition;
   information = DIA_Cav_DungeonInside1_Info;
   permanent   = 0;
   important   = 1;
   description = "."; 
};

FUNC INT DIA_Cav_DungeonInside1_Condition()
{
   if (Npc_KnowsInfo (hero,DIA_Cav_DungeonInside))&&(Npc_GetDistToWP (self,"DUNG22") < 500)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_DungeonInside1_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_DungeonInside1_12_01"); //Coœ mi tu œmierdzi, trzymaj rêkê na broni!
   
   Npc_ExchangeRoutine(self, "GUIDE3");
   B_StopProcessInfos(self);
   
   Wld_InsertNpc(Skeleton2HSwdWarrior,"DUNG24");
   Wld_InsertNpc(Skeleton2HAxeWarrior,"DUNG25");
   Wld_InsertNpc(Skeleton2HSwdWarrior,"DUNG26");
   Wld_InsertNpc(Skeleton2HAxeWarrior,"DUNG23");
   Wld_InsertNpc(SkeletonPoisonranger,"DUNG27");
   Wld_InsertNpc(SkeletonMage,"DUNG23");   
};

//********************************************************

INSTANCE DIA_Cav_DungeonInside11 (C_INFO)
{
   npc            = HUN_5555_Cav;
   //nr            = 67;
   condition      = DIA_Cav_DungeonInside11_Condition;
   information      = DIA_Cav_DungeonInside11_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cav_DungeonInside11_Condition()
{
   if (Npc_KnowsInfo (hero,DIA_Cav_DungeonInside1))&&(Npc_GetDistToWP (self,"DUNG32") < 500)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_DungeonInside11_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_DungeonInside11_12_01"); //Za cicho jak na mój gust, miej oczy dooko³a g³owy.
   
   Npc_ExchangeRoutine(self, "GUIDE4");
   B_StopProcessInfos(self);
   
   Wld_InsertNpc(Skeleton2HSwdWarrior,"DUNG31");
   Wld_InsertNpc(Skeleton2HAxeWarrior,"DUNG31");
   Wld_InsertNpc(Skeleton2HSwdWarrior,"DUNG50");
   Wld_InsertNpc(Skeleton2HAxeWarrior,"DUNG50");
   Wld_InsertNpc(SkeletonPoisonranger,"DUNG51");
   
   Wld_InsertNpc(EBR_101_ScarD,"DUNG39");
   Wld_InsertNpc(EBR_102_ArtoD,"DUNG40");   
};   
   
//********************************************************

INSTANCE DIA_Cav_DungeonInside111 (C_INFO)
{
   npc            = HUN_5555_Cav;
   //nr            = 67;
   condition      = DIA_Cav_DungeonInside111_Condition;
   information      = DIA_Cav_DungeonInside111_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cav_DungeonInside111_Condition()
{
   if (Npc_KnowsInfo (hero,DIA_Cav_DungeonInside11))&&(Npc_GetDistToWP (self,"DUNG36") < 500)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_DungeonInside111_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cav_DungeonInside111_12_01"); //Chyba zbli¿amy siê do celu, mam z³e przeczucia...
   
   Npc_ExchangeRoutine(self, "GUIDE5");
   B_StopProcessInfos(self);   
   Wld_InsertNpc(RBL_4108_UrtD,"DUNG41");
};   

//********************************************************

INSTANCE DIA_Cav_DungeonInside1111 (C_INFO)
{
   npc            = HUN_5555_Cav;
   //nr            = 67;
   condition      = DIA_Cav_DungeonInside1111_Condition;
   information      = DIA_Cav_DungeonInside1111_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cav_DungeonInside1111_Condition()
{
   if (Npc_KnowsInfo (hero,DIA_Cav_DungeonInside111))&&(Npc_GetDistToWP (self,"DUNG46") < 400)
   {
      return 1;
   };
};

FUNC VOID DIA_Cav_DungeonInside1111_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   
   AI_Output (self, other, "DIA_Cav_DungeonInside1111_12_01"); //Dopadliœmy skurwiela! Kto to?
   AI_Output (self, other, "DIA_Cav_DungeonInside1111_12_02"); //O kurwa, przecie¿ to niemo¿liwe!    
   AI_Output (self, other, "DIA_Cav_DungeonInside1111_12_03"); //Ty nie ¿yjesz!   
   B_StopProcessInfos(self);   
   Npc_ExchangeRoutine(self, "DEAD");
   
   Wld_InsertNpc(KDF_4115_Corristo,"DUNG48");
   Wld_InsertNpc(Ebr_4114_GomezD,"DUNG47");
};   