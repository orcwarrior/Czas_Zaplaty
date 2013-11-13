/*****************************************
*    Templer sucht MC und greift sie an  *
*****************************************/


func void ZS_FAHunting	()
// Gibt es Konzept, im Augenblick werden die Minecrawler sowieso nicht gefunden, 
// da nur AssessEnemy die Wahrnehmung füllen würde
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_FAHunting" );
    
	ObservingPerception ();
	AI_SetWalkmode (self,NPC_RUN);		// Walkmode für den Zustand
	AI_GotoWP (self,self.wp);			// Gehe zum Tagesablaufstart
};

func void ZS_FAHunting_Loop ()
{
    //PrintDebugNpc (PD_TA_LOOP,"ZS_FAHunting_End" );

	// sollte Minecrawlerjäger was rumlaufen noch ?
	if (Wld_DetectNpc (self,-1,NOFUNC,GIL_WOLF||GIL_SHADOWBEAST||GIL_BLOODFLY||GIL_ORCDOG||GIL_LURKER||GIL_ORCSCOUT
||GIL_WARAN||GIL_GOBBO||GIL_TROLL||GIL_SNAPPER||GIL_SCAVENGER||GIL_MOLERAT) ) // ist hier ein Animal? 
	{
		//PrintDebugNpc(PD_TA_CHECK,"MineCrawler detect");
		Npc_SetTarget (self,other);
		
		Npc_GetTarget	( self);

		AI_GotoWP (self, Npc_GetNextWP (self));
	}
	else 
	{
		AI_GotoWP (self, Npc_GetNextWP (self));
	};
};

func void ZS_FAHunting_End ()
{
	//PrintDebugNpc (PD_TA_FRAME,"ZS_FAHunting_End" );
};

