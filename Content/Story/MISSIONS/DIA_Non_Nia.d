
// ************************************************************
//                           EXIT 
// ************************************************************


INSTANCE Info_Nia_EXIT(C_INFO)
{
   npc         = Non_660_Nia;
   nr         = 999;
   condition         = Info_Nia_EXIT_Condition;
   information         = Info_Nia_EXIT_Info;
   permanent         = 1;
   description       = DIALOG_ENDE;
};                       

FUNC INT Info_Nia_EXIT_Condition()
{
   return 1;
};

FUNC VOID Info_Nia_EXIT_Info()
{   
   B_StopProcessInfos   (self);
};

// ************************************************************
//       Hello
// ************************************************************

INSTANCE Info_Nia_Hello (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Hello_Condition;
   information      = Info_Nia_Hello_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Hello_Condition()
{   
   if (Npc_KnowsInfo (hero, Info_Kris_Hello2))&&(Npc_GetDistToNpc(self,hero) < 600)
   {
      return 1;
   };

};
FUNC VOID Info_Nia_Hello_Info()
{   
   var C_NPC man; man = Hlp_GetNpc(SLV_640_Slave);

   B_FullStop (hero);
   AI_GotoNpc(other,self);
   AI_TurnToNpc (self, man);
   AI_Output (self, other,"Info_Nia_Hello_16_01"); //Nie dam rady sama. Pomó¿ mi, przytrzymaj g³owê. Muszê podaæ mu miksturê...
   AI_Output (other, self,"Info_Nia_Hello_15_02"); //Zrobiê co w mojej mocy.
   B_StopProcessInfos   (self);
   AI_GotoWP          (self,   "NIA_GO");
   AI_GotoWP          (hero,   "NC_EN_MAINPATH_05_01");
   AI_AlignToWP      (self);
   AI_AlignToWP      (other);
   AI_PlayAni         (self,   "T_PLUNDER");
   AI_PlayAni         (hero,   "T_PLUNDER");

   /*********************************
Dick i Nia maj¹ zbli¿yæ siê do le¿¹cego (najlepiej, ¿eby nie móg³ wstaæ, gadaæ, etc. czyli jak ta rutyna xardasa po uœniêciu)
Niech zbli¿¹ siê w ró¿ne miejsca, Nia od strony g³owy, Dick nogi.

********************************/

};

// ************************************************************

INSTANCE Info_Nia_Again (C_INFO)
{
   npc         = Non_660_Nia;
   nr         = 2;
   condition      = Info_Nia_Again_Condition;
   information      = Info_Nia_Again_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Again_Condition()
{   

   if (Npc_KnowsInfo (hero, Info_Nia_Hello))&& (Npc_GetDistToNpc(self,hero) < 600)
   {
      return 1;
   };

};
FUNC VOID Info_Nia_Again_Info()
{   
   var C_NPC geo; geo = Hlp_GetNpc(Grd_611_Gardist);

   B_FullStop (hero);
   AI_TurnToNpc (other, self);
   AI_Output (self, other,"Info_Nia_Again_16_01"); //Ciê¿ko z nim. Chyba nie przetrzyma nocy.
   AI_Output (other, self,"Info_Nia_Again_15_02"); //Co siê sta³o?
   AI_Output (self, other,"Info_Nia_Again_16_03"); //To kolejna ofiara. Kris nikogo nie wypuszcza z twierdzy, za wszelk¹ cenê chce znaleŸæ sprawcê.
   AI_Output (other, self,"Info_Nia_Again_15_04"); //A cen¹ s¹ ¿ycia kolejnych ofiar.
   AI_Output (self, other,"Info_Nia_Again_16_05"); //Niestety. Jedyne co mogê zrobiæ to ul¿yæ cierpieniom konaj¹cych. Ka¿da rana jest zadana z chirurgiczn¹ precyzj¹ i ka¿da jest œmiertelna.
   AI_Output (other, self,"Info_Nia_Again_15_06"); //D³ugo to trwa?
   AI_Output (self, other,"Info_Nia_Again_16_07"); //Odk¹d Hrabia opuœci³ Gniazdo. Nikt zdrowy na umyœle nie zabija³by bliŸnich...
   AI_Output (other, self,"Info_Nia_Again_15_08"); //Hmm. Na pewno ma jakiœ powód.
   AI_Output (self, other,"Info_Nia_Again_16_09"); //Nie rozumiem.
   AI_Output (other, self,"Info_Nia_Again_15_10"); //Mieliœmy kiedyœ na statku podobny przypadek. Ginêli marynarze. 
   AI_Output (other, self,"Info_Nia_Again_15_11"); //Jak siê okaza³o, to kucharz wyrzuca³ za burtê tych, którzy drwili z jego potraw.
   AI_Output (other, self,"Info_Nia_Again_15_12"); //Przeci¹gnêliœmy sukinsyna pod kilem.
   AI_Output (other, self,"Info_Nia_Again_15_13"); //Niestety, nastêpca gotowa³ tak paskudnie, ¿e w³asnorêcznie wyrzuci³em go za burtê. Ca³e szczêœcie, ¿e akurat zawinêliœmy do portu.
   AI_Output (self, other,"Info_Nia_Again_16_14"); //Ciekawa historia. Jesteœ marynarzem?
   AI_Output (other, self,"Info_Nia_Again_15_15"); //Mo¿na tak powiedzieæ. 
   AI_Output (other, self,"Info_Nia_Again_15_16"); //S³uchaj, muszê wyrwaæ siê z tego wiêzienia. Mo¿esz mi pomóc?
   AI_Output (self, other,"Info_Nia_Again_16_17"); //Sama jestem tu jeñcem. Pilnuje mnie ten drab Georg. Nie odstêpuje mnie na krok.
   AI_Output (other, self,"Info_Nia_Again_15_18"); //Jak tu trafi³aœ?
   AI_Output (self, other,"Info_Nia_Again_16_19"); //To proste. Znudzi³am siê Gomezowi, ten odda³ mnie Krukowi.
   AI_Output (self, other,"Info_Nia_Again_16_20"); //Ale magnata nie interesowa³ mój ty³ek. Wpad³am w oko Hrabiemu i tak znalaz³am siê tutaj.
   AI_Output (other, self,"Info_Nia_Again_15_21"); //Przykro mi...
   AI_Output (self, other,"Info_Nia_Again_16_22"); //Nie jest tak Ÿle. Mo¿na siê przyzwyczaiæ. Przynajmniej nikt mnie ju¿ nie bije.
   AI_Output (other, self,"Info_Nia_Again_15_23"); //Mo¿e uciekniesz razem ze mn¹?
   AI_Output (self, other,"Info_Nia_Again_16_24"); //I co dalej? Komu bêdê musia³a us³ugiwaæ, ¿eby dali mi ¿yæ?
   AI_Output (self, other,"Info_Nia_Again_16_25"); //Tu przynajmniej nie muszê trzymaæ no¿a pod siennikiem. 
   AI_Output (self, other,"Info_Nia_Again_16_26"); //Dziêkujê za propozycjê, ale nie skorzystam.
   AI_Output (other, self,"Info_Nia_Again_15_27"); //Rozumiem.
   AI_Output (self, other,"Info_Nia_Again_16_28"); //Ale mo¿e zdo³am pomóc Tobie. 
   AI_Output (other, self,"Info_Nia_Again_15_29"); //Ca³y zamieniam siê w s³uch.
   AI_Output (self, other,"Info_Nia_Again_16_30"); //Muszê siê zastanowiæ. Tymczasem porozmawiaj z niemow¹, powiedz, ¿e potrzebujê czystych szmat na opatrunki.
   AI_Output (other, self,"Info_Nia_Again_15_31"); //Co to za niemowa?
   AI_Output (self, other,"Info_Nia_Again_16_32"); //Mówi¹ na niego Znamiê. Krêci siê w pobli¿u.
   AI_Output (other, self,"Info_Nia_Again_15_33"); //W porz¹dku, nied³ugo wrócê.

   Log_CreateTopic   (CH4_Non_NiaHelp, LOG_MISSION);
   Log_SetTopicStatus   (CH4_Non_NiaHelp, LOG_RUNNING);
   B_LogEntry      (CH4_Non_NiaHelp, "Pozna³em Niê, kobietê Herszta. Pomo¿e mi wydostaæ siê z Gniazda. Nie podoba mi siê to, co siê tutaj dzieje. Jakiœ psychopata zabija innych. Muszê znaleŸæ kolesia o imieniu Znamiê i przynieœæ felczerce czyste szmaty na opatrunki.");
   Npc_ExchangeRoutine   (self,"start");
   Npc_ExchangeRoutine   (geo,"start");
};

// ************************************************************

INSTANCE Info_Nia_Again1 (C_INFO)
{
   npc         = Non_660_Nia;
   nr         = 3;
   condition      = Info_Nia_Again1_Condition;
   information      = Info_Nia_Again1_Info;
   important      = 0;
   permanent      = 0;
   description       = "Mam szmaty na banda¿e.";
};                       

FUNC INT Info_Nia_Again1_Condition()
{   
   if (Npc_KnowsInfo (hero, Info_Nia_Hello))&&(NPC_HasItems(other,EN_Bandage)>=1)
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Again1_Info()
{   
   var C_NPC sti; sti = Hlp_GetNpc(Grd_614_Gardist);
   Npc_ExchangeRoutine   (sti,"WATCH");
   
   var C_NPC geo; geo = Hlp_GetNpc(Grd_611_Gardist);
   Npc_ExchangeRoutine   (geo,"PRESTART");
   
   AI_Output (other, self,"Info_Nia_Again1_15_00"); //Mam szmaty na banda¿e.
   AI_Output (self, other,"Info_Nia_Again1_16_01"); //Najwy¿sza pora, przewi¹¿ê rany temu biedakowi...
   B_GiveInvItems(other,self,EN_Bandage,1);
   Npc_RemoveInvItems(self,EN_Bandage,1);
   Log_SetTopicStatus   (CH4_Non_NiaHelp, LOG_SUCCESS);
   B_LogEntry      (CH4_Non_NiaHelp, "Przynios³em szmaty na banda¿e, mo¿e teraz Nia zechce mi pomóc.");
   B_StopProcessInfos   (self);
   AI_GotoWP          (self,   "NIA_GO");
   AI_GotoWP          (hero,   "NC_EN_MAINPATH_05_01");
   AI_AlignToWP      (self);
   AI_AlignToWP      (other);
   AI_PlayAni         (self,   "T_PLUNDER");
   AI_PlayAni         (hero,   "T_PLUNDER");
};

// ************************************************************

INSTANCE Info_Nia_Def (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Def_Condition;
   information      = Info_Nia_Def_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Def_Condition()
{   
   if (Npc_KnowsInfo (hero, Info_Nia_Again1))&& (Npc_GetDistToNpc(self,hero) < 600)
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Def_Info()
{   
   var C_NPC sti; sti = Hlp_GetNpc(Grd_614_Gardist);
   var C_NPC geo; geo = Hlp_GetNpc(Grd_611_Gardist);
   var C_NPC man; man = Hlp_GetNpc(SLV_640_Slave);
   B_FullStop (hero);
   AI_GotoNpc(other,self);
   AI_TurnToNpc (self, geo);
   AI_Output (self, other,"Info_Nia_Def_16_01"); //Bardzo mi pomog³eœ, mam nadziejê, ¿e ten biedny...
   AI_TurnToNpc (self, sti);
   AI_Output (other, self,"Info_Nia_Def_15_02"); //Co siê dzieje?
   AI_TurnToNpc (sti, self);
   AI_Output (self, other,"Info_Nia_Def_16_01"); //Znamiê oszala³. Georg!

   B_StopProcessInfos   (self);
   AI_GotoWP          (sti,   "NIA_INSPECT");
   AI_GotoWP          (geo,   "NC_EN_TAVERN_ONFRONT");
   AI_AlignToWP      (self);
   AI_AlignToWP      (other);

   /*********************************
Znamiê i Georg maj¹ podejœæ do Nii.

********************************/
   Npc_ExchangeRoutine   (man,"start");   
};

// ************************************************************

INSTANCE Info_Nia_Def1 (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Def1_Condition;
   information      = Info_Nia_Def1_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Def1_Condition()
{   
   if (Npc_KnowsInfo (hero, Info_Georg_Again2))&& (Npc_GetDistToNpc(self,hero) < 600)
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Def1_Info()
{   
   B_FullStop (hero);
   AI_GotoNpc(other,self);
   AI_TurnToNpc (self, other);
   AI_Output (self, other,"Info_Nia_Def1_16_01"); //To by³o straszne... Znamiê kompletnie postrada³ zmys³y.
   AI_Output (other, self,"Info_Nia_Def1_15_02"); //Wygl¹da³ zupe³nie normalnie.
   AI_Output (self, other,"Info_Nia_Def1_16_03"); //Jak mo¿esz tak mówiæ?! On chcia³ mnie zabiæ!
   AI_Output (other, self,"Info_Nia_Def1_15_04"); //Wybacz, nie to mia³em na myœli. 
   AI_Output (other, self,"Info_Nia_Def1_15_05"); //Kiedy z nim rozmawia³em sprawia³ wra¿enie przera¿onego, ale nie szalonego.
   AI_Output (self, other,"Info_Nia_Def1_16_06"); //To ponad moje si³y, muszê odpocz¹æ...
   AI_Output (other, self,"Info_Nia_Def1_15_07"); //Oczywiœcie, ale co z nasz¹ umow¹?
   AI_Output (self, other,"Info_Nia_Def1_16_08"); //Nie masz serca, w³aœnie cudem uniknê³am œmierci, a Ty myœlisz tylko o sobie...
   AI_Output (other, self,"Info_Nia_Def1_15_09"); //Wybacz, ja...
   AI_Output (self, other,"Info_Nia_Def1_16_10"); //Wróæ jutro, wtedy dotrzymam s³owa. A teraz zostaw mnie sam¹.
   AI_Output (other, self,"Info_Nia_Def1_15_11"); //Oczywiœcie, bywaj.
   B_LogEntry      (CH4_Non_Eagle, "To miejsce jest co najmniej dziwne. W³aœnie by³em œwiadkiem jak niemowa rzuci³ siê na kobietê i chcia³ j¹ zabiæ. Mo¿e i nie by³oby w tym nic dziwnego, gdyby nie wyraz jego twarzy. On siê ba³, wygl¹da³, tak jakby spojrza³ w oblicze œmierci.");
   B_LogEntry      (CH4_Non_Eagle, "Nia pomo¿e mi jutro, w miêdzyczasie mogê rozejrzeæ siê po twierdzy.");

   /****************************
Ork niech Nia pójdzie spaæ gdzieœ, a Georg niech stoi przed wjeœciem do tego miejsca ¿eby nikt jej nie przeszkadza³.

****************************/
   nia_rest = B_SetDayTolerance()+1;
   B_StopProcessInfos   (self);
};

// ************************************************************

INSTANCE Info_Nia_Meet (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Meet_Condition;
   information      = Info_Nia_Meet_Info;
   important      = 0;
   permanent      = 0;
   description       = "Jak siê czujesz?";
};                       

FUNC INT Info_Nia_Meet_Condition()
{   
   if (Npc_KnowsInfo (hero,Info_Pinto_Warn1))&&(nia_rest <= (Wld_GetDay()))
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Meet_Info()
{   
   AI_Output (other, self,"Info_Nia_Meet_15_01"); //Jak siê czujesz?
   AI_Output (self, other,"Info_Nia_Meet_16_02"); //Ju¿ lepiej. Bardzo to prze¿y³am. Biedny niemowa...
   AI_Output (other, self,"Info_Nia_Meet_15_03"); //Dobrze, ¿e Georg go powstrzyma³. Nie chcia³bym, ¿eby zrobi³ Ci krzywdê.
   AI_Output (self, other,"Info_Nia_Meet_16_04"); //Naprawdê? Odnios³am zupe³nie inne wra¿enie...
   AI_Output (other, self,"Info_Nia_Meet_15_05"); //Wybacz, pomyli³em siê. Nigdy w ¿yciu nie widzia³em tak piêknej kobiety, twa uroda przyæmi³a mi umys³.
   AI_Output (self, other,"Info_Nia_Meet_16_06"); //Jesteœ bardzo mi³y. Potrafisz piêknie mówiæ, prawie jak Hrabia.
   AI_Output (other, self,"Info_Nia_Meet_15_07"); //Odk¹d Ciê ujrza³em, nie mogê myœleæ o niczym innym. Jesteœ jak letnia mgie³ka wœród traw i kwiatów.
   AI_Output (self, other,"Info_Nia_Meet_16_08"); //Jeszcze nikt... Nie przerywaj!
   AI_Output (other, self,"Info_Nia_Meet_15_09"); //Móg³bym spijaæ nektar s³odyczy spomiêdzy Twych ud, móg³bym...
   AI_Output (self, other,"Info_Nia_Meet_16_10"); //Wystarczy ju¿ tego be³kotu. Bêdê czeka³a po zmierzchu, mam nadziejê, ¿e mnie znajdziesz.
   AI_Output (other, self,"Info_Nia_Meet_15_11"); //Mo¿esz byæ tego pewna, o najdro¿sza.
   AI_Output (self, other,"Info_Nia_Meet_16_12"); //A teraz odejdŸ, nie chcê wzbudzaæ podejrzeñ.
   B_LogEntry      (CH4_Non_Eagle, "Nia spotka siê ze mn¹ po zmroku. Muszê jeszcze zebraæ resztê widowni.");

   /************************************
Ork zmiej jej teraz rutynê, ¿eby pomiêdzy 23 a 4 sta³¹ gdzieœ w ustronnym miejscu.

*********************************/

   Npc_ExchangeRoutine   (self,"WAIT");   
};

//  Info_Seven_MystEnd1  
//  Info_Bartender_StigmaMeet   
//  Info_Pinto_Warn1  
//  Info_Ormus_MeetAgain  

// ************************************************************

INSTANCE Info_Nia_Meet1 (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Meet1_Condition;
   information      = Info_Nia_Meet1_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Meet1_Condition()
{   
   if (Npc_KnowsInfo (hero,Info_Nia_Meet))&& (Wld_IsTime (22,00,04,00)&& (Npc_GetDistToNpc(self,hero) < 600))
   &&(Npc_KnowsInfo (hero, Info_Seven_MystEnd1))&&(Npc_KnowsInfo (hero, Info_Bartender_StigmaMeet))&&(Npc_KnowsInfo (hero, Info_Ormus_MeetAgain))&&(Npc_KnowsInfo (hero, Info_Pinto_Warn1))
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Meet1_Info()
{   
   var C_NPC seven; seven = Hlp_GetNpc(Grd_613_Gardist);

   B_FullStop (hero);
   AI_GotoNpc(other,self);
   AI_Output (self, other,"Info_Nia_Meet1_16_01"); //W koñcu przyszed³eœ!
   AI_Output (other, self,"Info_Nia_Meet1_15_02"); //W blasku gwiazd wygl¹dasz jak zjawa, która...
   AI_Output (self, other,"Info_Nia_Meet1_16_03"); //Nie przyszliœmy tu rozmawiaæ. Wiesz, czego chcê!

   AI_Output (self, other,"Info_Nia_Meet1_16_04"); //Widzia³am kogoœ w cieniu! 
   AI_Output (other, self,"Info_Nia_Meet1_15_05"); //Wydawa³o Ci siê, nie przestawaj...
   AI_Output (self, other,"Info_Nia_Meet1_16_06"); //Widzê twarz! To...
   B_StopProcessInfos   (self);
   AI_TurnToNpc (self, seven);
   AI_SetWalkmode(self,NPC_RUN); 
   AI_GotoNpc(seven, self);
   //Az boje sie sprawdzac poprawnosc tego questa w grze ;D
}; 

// ************************************************************

INSTANCE Info_Nia_Meet12 (C_INFO)
{
   npc      = Non_660_Nia;
   nr         = 1;
   condition      = Info_Nia_Meet12_Condition;
   information      = Info_Nia_Meet12_Info;
   important      = 1;
   permanent      = 0;
   description       = "";
};                       

FUNC INT Info_Nia_Meet12_Condition()
{   
   if (Npc_KnowsInfo (hero,Info_Nia_Meet1))&& (Wld_IsTime (22,00,04,00)&& (Npc_GetDistToNpc(self,hero) < 600))
   {
      return 1;
   };
};

FUNC VOID Info_Nia_Meet12_Info()
{   
   B_FullStop (hero);
   AI_GotoNpc(other,self);
   AI_Output (self, other,"Info_Nia_Meet12_16_01"); //Nie!!!

   B_StopProcessInfos(self);
   //self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX] - self.attribute[ATR_HITPOINTS_MAX];

   B_LogEntry(CH4_Non_Eagle, "Siódemka zabi³ Niê!");
};
