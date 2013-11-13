/////////////////////////////////
// ARTIFACT EVENTS                     ////
/////////////////////////////////
//Events in small orc arena indoor ////
//                ////
/////////////////////////////////
FUNC int EVT_ART_BUT_COND_ALL ()
{
   if (QUESTSTART == TRUE)&&(USEONEOFSWITCH != TRUE)
   {
      return true;	
   }
   else
   {
      return /*false*/true;	
   };
};

FUNC int EVT_ART_BUT_COND_5()
{
   if (Npc_HasItems(hero,ItArArifact_01) > 0)
   {
      Npc_RemoveInvItem(hero,ItArArifact_01);
      return true;
   }
   else
   {
      PutMsg(_STR_CANNOTUSE_MOB,"font_default.tga",RGBAToZColor(255,100,100,255),2,"");	
      return 0;	
   };
};

FUNC void EVT_ART_SCRIPT_1_A()
{
   //B_LogEntry...
   USEONEOFSWITCH = TRUE;
   BETTERSWITCH = FALSE;
};

FUNC void EVT_ART_SCRIPT_1_B()
{
	USEONEOFSWITCH = TRUE;
	BETTERSWITCH = TRUE;	
   //B_LogEntry...
   Wld_InsertNpc(Guard_Golem,"WP_ART_GOLEM");
};
FUNC void EVT_ART_SCRIPT_1_DAM()
{
//	PRI/NT("KILL");
	B_FullStop(hero);
	B_KillNpc(pc_hero);
	
	Wld_PlayEffect("", self, self, 1,9990 , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)
	
//B_LogEntry...
};

FUNC void EVT_ART_BUT_5()
{
   Wld_InsertNpc(ArtifactGuardian,"WP_ART_DARKMASTER");
   //	Wld_SendTrigger("EVT_ART_MOVER_3");
   //B_LogEntry...
   Wld_InsertNpc(Guard_Demon,"WP_ART_DEMON");
};

FUNC void EVT_SEE_ORNAMENT()
{
   //B_LogEntry...
   AI_GotoWP 				(hero,"WP_ORNAMENT");
   //Pri/nt("ORNAMENTSEE");
};

FUNC void EVT_ART_CHEST()
{
//pr/int("Hmmm..ciekawa zbroja");
};
