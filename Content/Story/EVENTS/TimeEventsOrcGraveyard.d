//Events in Orc graveyard

var int nameless_light_timer;

func void TimeEventsOrcGraveyard()
{
	if (WORLD_CURRENT == WORLD_OGY)
	{
		if(Hero_GotoGYD == 1)
		{
			var c_npc nameless; nameless = Hlp_GetNpc(Nameless_ThirdMeetGYD);
			
			if(Hlp_IsValidNpc(nameless) && !NPC_isDead(nameless))
			{
				nameless_light_timer=nameless_light_timer+1;
				
				if(nameless_light_timer>=5*60)&&(!Npc_HasReadiedWeapon(nameless))
				{
					nameless_light_timer=0;
					Npc_ClearAiQueue(nameless);
					Npc_SetTarget(nameless,nameless);
					AI_ReadySpell         (nameless,   SPL_LIGHT,   5);
					AI_PlayAni(nameless,"T_MAGRUN_2_SLESHOOT");
					Wld_PlayEffect("SPELLFX_LIGHT_ACTIVE", nameless, nameless, 1,0 , DAM_MAGIC, 0);
					AI_PlayAni(nameless,"T_SLESHOOT_2_STAND");
					AI_UnReadySpell         (nameless);
				};
			};
			
			if(npc_getdisttowp(hero,"OGY_SHAMAN_5")<300)
			{
				var c_npc ghost; ghost = hlp_getnpc(ORC_GHOST);
				
				if(Hlp_IsValidNpc(ghost))
				{
					B_CheckForImportantInfo (ghost,hero);
				};
			};
		};
	};
};