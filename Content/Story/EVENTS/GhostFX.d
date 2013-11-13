func void GhostFx(var C_NPC ghost, var int variant)
{
	var oCNpc gh;
	var c_item readyweap; var int id;
	id = Hlp_GetInstanceID(ghost);
	readyweap = Npc_GetReadiedWeapon(ghost);
	gh = hlp_getnpc(id);
	gh._zCVob_vob_bitfield[0] = gh._zCVob_vob_bitfield[0] & ~zCvob_bitfield0_castDynShadow;
	gh._zCVob_vob_bitfield[0] = gh._zCVob_vob_bitfield[0] | zCVob_bitfield0_visualAlphaEnabled;
	gh._zCVob_visualAlpha = fracf(25,100);
	gh.bloodEnabled = 0;
// 	TurnToGhost(id,5); 
	Wld_PlayEffect("GhostFXHead", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("GhostFXRUpperArm", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("GhostFXLUpperArm", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("GhostFXLForeArm", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("GhostFXRForeArm", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("GhostFXLCalf", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("GhostFXRCalf", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("GhostFXRThigh", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("GhostFXLThigh", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);			
	Wld_PlayEffect("GhostFXSpine2", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);
	Wld_PlayEffect("GhostFXBip01", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);
	
   if(variant==1)
	{
		if(Hlp_IsItem(readyweap,GhostSword1))
		{
			Wld_PlayEffect("GHOST_SWD1_1", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);	
		}
		else
		{
			Wld_PlayEffect("GHOST_SWD1_0", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);			
		};
		
      Wld_PlayEffect("GhostFXSmoke2", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);			
	}
	else if(Npc_HasItems(ghost,GhostAxe1))
	{
		if(Npc_HasReadiedMeleeWeapon(ghost))
		{
			Wld_PlayEffect("GHOST_AXE1_1", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);	
		}
		else
		{
			Wld_PlayEffect("GHOST_AXE1_0", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);			
		};
		
      Wld_PlayEffect("GhostFXSmoke", ghost, ghost, 1, 0, DAM_MAGIC, FALSE);	
	};
};
func void PlayGhostsFx()
{
	//TODO: Add there Ghosts Npc
	VAR C_NPC MD_TRUAN;	VAR C_NPC MD_RODERIC; VAR C_NPC ARODERIC;
	MD_TRUAN = Hlp_GetNpc(Truan);
	ARODERIC = Hlp_GetNpc(Roderic);
	MD_RODERIC = Hlp_GetNpc(RodericMD);
	
   if(Hlp_IsValidNpc(MD_TRUAN)&& ((Npc_GetDistToPlayer(MD_TRUAN)<4000)|| (Npc_CanSeeNpc(hero,MD_TRUAN))))
	{
      GhostFx(MD_TRUAN,1);
	};
 	
   if(Hlp_IsValidNpc(RODERIC)&&  ((Npc_GetDistToPlayer(ARODERIC)<4000)|| (Npc_CanSeeNpc(hero,ARODERIC))))
 	{	
      GhostFx(ARODERIC,2);
	};
	
   if(Hlp_IsValidNpc(MD_RODERIC)&&  ((Npc_GetDistToPlayer(MD_RODERIC)<4000)|| (Npc_CanSeeNpc(hero,MD_RODERIC))))
	{
      GhostFx(MD_RODERIC,2);	
	};
};
