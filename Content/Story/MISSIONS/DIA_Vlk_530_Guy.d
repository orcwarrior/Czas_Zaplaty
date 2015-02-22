// **************************************************
//                    EXIT 
// **************************************************

INSTANCE DIA_Guy_Exit (C_INFO)
{
   npc         = Vlk_530_Guy;
   nr         = 999;
   condition   = DIA_Guy_Exit_Condition;
   information   = DIA_Guy_Exit_Info;
   permanent   = 1;
   description = DIALOG_ENDE;
};                       

FUNC INT DIA_Guy_Exit_Condition()
{
   return 1;
};

FUNC VOID DIA_Guy_Exit_Info()
{
   B_StopProcessInfos   (self );
};

// **************************************************
//             
// **************************************************

INSTANCE DIA_Guy_Hello (C_INFO)
{
   npc            = Vlk_530_Guy;
   nr            = 2;
   condition      = DIA_Guy_Hello_Condition;
   information      = DIA_Guy_Hello_Info;
   permanent      = 0;
   description    = "Witam!";
};

FUNC INT DIA_Guy_Hello_Condition()
{   
   return 1;
};

FUNC VOID DIA_Guy_Hello_Info()
{
   AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Witam!
   AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Mhm? Nie widzia³em Ciê tutaj. Jesteœ nowy, prawda?
   AI_Output (other, self,"DIA_Guy_Hello1_15_02"); //Przyby³em niedawno. Mo¿esz powiedzieæ mi coœ wiêcej o tym obozie?
   AI_Output (self, other,"DIA_Guy_Hello1_03_03"); //A co tutaj jest do opowiadania? Ca³ym burdelem rz¹dz¹ stra¿nicy i magnaci.
   AI_Output (self, other,"DIA_Guy_Hello_03_04"); //Jak chcesz ¿yæ, to s³uchasz i robisz wszystko czego od Ciebie za¿¹daj¹.
   AI_Output (other, self,"DIA_Guy_Hello1_15_05"); //I wy siê na to godzicie?
   AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Ciszej! Jeszcze nas ktoœ us³yszy... Muszê ju¿ iœæ.
   B_StopProcessInfos   (self);
};

var int guy_again;
var int guy_pers1;
var int guy_pers;
var int guy_pers2;
// **************************************************

INSTANCE DIA_Guy_Rebel (C_INFO)
{
   npc            = Vlk_530_Guy;
   nr            = 3;
   condition      = DIA_Guy_Rebel_Condition;
   information      = DIA_Guy_Rebel_Info;
   important      = 0;
   permanent      = 0;
   description    = "Nie chcia³byœ postawiæ siê stra¿nikom?";
};

FUNC INT DIA_Guy_Rebel_Condition()
{   
   if (Npc_KnowsInfo (hero,DIA_Guy_Hello ))&&(Npc_KnowsInfo (hero,DIA_Urt_Packages)) 
   {
      return 1;
   };
};

FUNC VOID DIA_Guy_Rebel_Info()
{
   AI_Output (other, self,"DIA_Guy_Rebel_15_00"); //Nie chcia³byœ postawiæ siê stra¿nikom?
   AI_Output (self, other,"DIA_Guy_Rebel_03_01"); //Co Ty wygadujesz?! Nie jestem idiot¹. To prowokacja? Nie dam siê nabraæ!
   AI_Output (other, self,"DIA_Guy_Rebel_15_02"); //Nie jestem stra¿nikiem. Nale¿ê do rebeliantów...
   AI_Output (self, other,"DIA_Guy_Rebel_03_03"); //Nie chcê mieæ z tym nic wspólnego - odejdŸ albo zawo³am stra¿e!
   B_StopProcessInfos   (self);
};

var int belief_Guy;

INSTANCE DIA_Guy_Rebel1 (C_INFO)
{
   npc            = Vlk_530_Guy;
   nr            = 3;
   condition      = DIA_Guy_Rebel1_Condition;
   information      = DIA_Guy_Rebel1_Info;
   important      = 0;
   permanent      = 1;
   description    = "Porozmawiajmy jeszcze raz.";
};

FUNC INT DIA_Guy_Rebel1_Condition()
{   
   if (Npc_KnowsInfo (hero,DIA_Guy_Rebel) && !belief_Guy) 
   {
      return 1;
   };
};

FUNC VOID DIA_Guy_Rebel1_Info()
{
   AI_Output (other, self,"DIA_Guy_Rebel1_15_01"); //Porozmawiajmy jeszcze raz.
   AI_Output (self, other,"DIA_Guy_Rebel1_03_02"); //Jak chcesz mnie przekonaæ?

   Info_ClearChoices (DIA_Guy_Rebel1);
   Info_AddChoice (DIA_Guy_Rebel1, "Nie b¹dŸ tchórzem!", DIA_Guy_Rebel_Coward);
   Info_AddChoice (DIA_Guy_Rebel1, "Musimy walczyæ!", DIA_Guy_Rebel_Fight);
   if (buddler_join > 0)
   {
      Info_AddChoice (DIA_Guy_Rebel1, "Nie jesteœ sam.", DIA_Guy_Rebel_Alone);
   };
   Info_AddChoice (DIA_Guy_Rebel1, "Porozmawiamy o tym póŸniej.", DIA_Guy_Rebel_Later);
};

// ---------------------------coward----------------------------------------

FUNC VOID DIA_Guy_Rebel_Coward()
{
   if (guy_pers1 == FALSE)
   {
      guy_pers = TRUE;
      AI_Output (other, self,"DIA_Guy_Rebel_Coward_15_00"); //Nie b¹dŸ tchórzem!
      AI_Output (self, other,"DIA_Guy_Rebel_Coward_03_01"); //A co w tym z³ego, przynajmniej d³u¿ej po¿yjê.
      AI_Output (self, other,"DIA_Guy_Rebel_Coward_03_02"); //ZejdŸ mi z oczu, a zapomnê o tym co powiedzia³eœ.
   }
   else
   {
      AI_Output (other, self,"DIA_Guy_Rebel_Coward_15_03"); //Nie b¹dŸ tchórzem!
      AI_Output (self, other,"DIA_Guy_Rebel_Coward_03_04"); //Nie bêdê tego s³ucha³ - stra¿!
      /***************************
      Ork tutaj atak stra¿y trzeba zrobiæ, jak¹œ funkcje, etc.
      ***************************/
      B_CallComrades();
   };
   B_StopProcessInfos   (self);
};

// ---------------------------fight----------------------------------------

FUNC VOID DIA_Guy_Rebel_Fight()
{
   if (guy_pers2 == FALSE)
   {
      guy_pers = TRUE;
      AI_Output (other, self,"DIA_Guy_Rebel_Fight_15_00"); //Musimy walczyæ!
      AI_Output (self, other,"DIA_Guy_Rebel_Fight_03_01"); //Ze stra¿nikami? Nie b¹dŸ idiot¹, nie mamy szans.
      AI_Output (self, other,"DIA_Guy_Rebel_Fight_03_02"); //OdejdŸ i nigdy ju¿ o tym nie rozmawiajmy.
   }
   else
   {
      AI_Output (other, self,"DIA_Guy_Rebel_Fight_15_03"); //Musimy walczyæ!
      AI_Output (self, other,"DIA_Guy_Rebel_Fight_03_04"); //Nie bêdê tego s³ucha³ - stra¿!
      /***************************
      Ork tutaj atak stra¿y trzeba zrobiæ, jak¹œ funkcje, etc.
      ***************************/
      B_CallComrades();
   };
   B_StopProcessInfos   (self);
};

// ---------------------------later----------------------------------------

FUNC VOID DIA_Guy_Rebel_Later()
{
   AI_Output (other, self,"DIA_Guy_Rebel_Later_15_00"); //Porozmawiamy o tym póŸniej.
   AI_Output (self, other,"DIA_Guy_Rebel_Later_03_01"); //A niby po co. Szkoda Twojego czasu.
   B_StopProcessInfos   (self);
};


// ---------------------------alone----------------------------------------

FUNC VOID DIA_Guy_Rebel_Alone()
{
   B_GiveXP(250);
   buddler_join = buddler_join + 1;
   belief_Guy = true;
   AI_Output (other, self,"DIA_Guy_Rebel_Alone_15_00"); //Nie jesteœ sam.
   AI_Output (self, other,"DIA_Guy_Rebel_Alone_03_01"); //O czym Ty mówisz?
   AI_Output (other, self,"DIA_Guy_Rebel_Alone_15_02"); //S¹ inni, którzy maj¹ doœæ stra¿ników. Wiêc jak bêdzie?
   AI_Output (self, other,"DIA_Guy_Rebel_Alone_03_03"); //Inni? I oni chc¹ walczyæ?
   AI_Output (other, self,"DIA_Guy_Rebel_Alone_15_04"); //Nie tylko walczyæ, ale i zwyciê¿yæ. Dni stra¿ników s¹ ju¿ policzone.
   AI_Output (self, other,"DIA_Guy_Rebel_Alone_03_05"); //Ja... Ja te¿ stanê u waszego boku. Porozmawiam z innymi kopaczami.
   AI_Output (other, self,"DIA_Guy_Rebel_Alone_15_06"); //S³uszna decyzja.
   B_LogEntry      (CH3_RBL_Buddler, "Guy zgodzi³ siê stan¹æ przeciwko stra¿nikom.");
   B_StopProcessInfos   (self);
}; 
