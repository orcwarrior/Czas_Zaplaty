var int NamelessBugfixINFOR;
var int end_attack_grds;

func void ZS_Dead ()
{
	//TODO: if misson on call	
	B_Story_Mis_AdanWaves_SpawnNextWave();
	//MultiMissle Orgin of death - player
	B_SpecialDmg_PSIDemon(self,other);	
	
	//if self==hero quit save (if it meet with condition)
	Dream_HeroDead();
	// Ork: Bugfix materia³ów do mobów:
	B_RemoveMobItems(self);
	
	if(self.id==2770)//OR Attack GRD - make them un-aim-able
	{
		var int ptr;
		ptr = oCNpc_GetPointer(self);
      
		if(ptr)
		{
			MEM_WriteInt(ptr+160,0);//npc.type offset
			CALL__thiscall (ptr, oCNpc__StartFadingAway_offset);		
		};
      
      if (GrdsInAttack > 0)
      {
         GrdsInAttack -= 1;
      };
		//Pri/nt(ConcatStrings("Grd2Kill == ",IntToString(GrdsInAttack)));
				
		if ((!GrdsInAttack) && (OR_ATTACKED==76) && (!end_attack_grds))
		{
         PutMsg("UDA£O SIÊ ODEPRZEÆ ATAK!","font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_LOGENTRY,"");
         //PrintScreen		("Uda³o siê odeprzeæ atak!", -1,40,"font_old_10_white.tga",_TIME_MESSAGE_LOGENTRY);		
         B_Givexp(hero.level*100+1000);
         B_STORY_HunterCampBack2Live();
         end_attack_grds = true;
		};	
	};
   
   if (self.guild == GIL_PUPIL)
   {
      Party_RemoveNpc(self);
   };
	//AIV_XPGIVEN
	/*if(Npc_GetAivar(self,AIV_DEALDAY)==0)&&(!Npc_Isplayer(self))
	{
		//B_GiveXp(self.level*10);
      B_DeathXP(1);
		Npc_SetAivar(self,AIV_DEALDAY, 1);
	};*/
	
	//Killing Truan wave minion hurts him:
	if(Npc_GetAivar(self,AIV_MM_REAL_ID) == ID_SKELETON_MDWAVE)
	{
		var c_npc tru; tru = Hlp_GetNpc(truan);		
		Wld_PlayEffect("spellFX_Thunder_TARGET",  tru, tru, 0, 0, DAM_MAGIC, TRUE); 
		B_ChangeAttribute (tru,	ATR_HITPOINTS, -(42+(2*MD_FinalBattle_Wave)));
		AI_PlayAni(tru,"T_HURT");		
	};
	
	//If truan dead, instert Rune Sword: (truan.id=28)
	if(self.id == 352)&&(npc_hasitems(self,ItAt_Kosc)==0)//TRUAN /anti skel mdwave
	{
      MD_InsertMR=TRUE;		
	};
	
	if(Npc_GetAivar(self,AIV_MM_REAL_ID) == ID_MIS_SNAFWOLF)
	{
		snaf_wolfs_killed=snaf_wolfs_killed+1;
      
		if(snaf_wolfs_killed==2)
		{
			B_LogEntry(CH1_Rbl_SnafHelp, "W drodzê na pastwisko zaatakowa³y mnie wyg³odnia³e wilki, lepiej bêdzie chyba ju¿ wracaæ do obozu.");	
		};
	};
	if(Npc_GetAivar(self,AIV_MM_REAL_ID) == ID_SKELETONLORD)
	{
		Mdl_RemoveOverlayMDS(self,	"humans_skeleton.mds");
	};
	if(Npc_GetAivar(self,AIV_MM_REAL_ID) == ID_CAVESTATUE)
	{
      Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");	
      CaveStatueDestroyed=CaveStatueDestroyed+1;
	};
	if(Npc_GetAivar(self,AIV_MM_REAL_ID) == ID_SKELETONRANGER)
	{
      Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");	
	};	

	C_ZSInit();
   
	if(C_BodyStateContains(self,BS_UNCONSCIOUS))
	{
      AI_PlayAniBS(self,"S_DEADB",BS_DEAD);	
	};
   
	if(Npc_GetAivar(self,AIV_PLUNDERED) != 3)//3- DO NOT PLUNDER!
	{	
      Npc_SetAivar(self,AIV_PLUNDERED,  FALSE);
	};
   
   if (self.id >= 3000)&&(self.id <= 3022)
	{	
      OldCampGrds+=1;
	};
   
 	B_SpecialDmg_RuneSword(self,other);	
	//-------- Erfahrungspunkte für den Spieler ? --------
	//SN: VORSICHT, auch in B_MagicHurtNpc() vorhanden!
	if(self.id == 4064)
	{
		var C_npc crossbowman;
		crossbowman = Hlp_GetNpc(GRD_2732_Gardist);
         
		if(Npc_IsDead(crossbowman))
		{ return; };
		B_ExchangeRoutine(crossbowman,"FOLLOW");		
	};
	if (self.id >= 2730)&&(self.id <= 2733)
	{	
		if(!Npc_IsDead(rbl_4064_Info))
		{
         var c_npc infor; infor = HLP_GetNpc(rbl_4064_Info);
         Npc_ChangeAttribute(infor,ATR_HITPOINTS,-45);
		};		
		if (NamelessBugfixINFOR)&&((Npc_IsDead(GRD_2730_Gardist)+Npc_IsDead(GRD_2731_Gardist)+Npc_IsDead(GRD_2732_Gardist)+Npc_IsDead(GRD_2733_Gardist))>=4)
		{
			NamelessBugfixINFOR=TRUE;
			var C_npc nameless;
			nameless = Hlp_GetNpc(Nameless_SecondMeet);	
			B_ExchangeRoutine(nameless,"FOLLOW");	
		};
	};
   
	if(C_NpcIsHuman(other) && Npc_GetAivar(other,AIV_PARTYMEMBER))||(C_NpcIsMonster(other) && Npc_GetAivar(other,AIV_MM_PARTYMEMBER))
	{
      B_DeathXP(2);
      
		if(HeroHasPupil)&&(CmpNpc(MyWolf,other))
		{
			Pupil_DeathXP(1);		
		}
		else if(HeroHasPupil)
		{
			Pupil_DeathXP(2);			
		};
	}
   else if	(Npc_IsPlayer   (other))
	{
      B_DeathXP(1);
		//exp points GIVEN in DamageSystem_Func!!!
		/*if(!Npc_IsInFightMode(other,FMODE_MELEE))
		{
         B_DeathXP(1);
		};*/
		if(HeroHasPupil)
		{
			Pupil_DeathXP(2);		
		};
	};
	if	C_NpcIsMonster(self)||C_NpcIsOrc(self)
	{
		if (self.guild != GIL_PUPIL)
		{
			B_GiveDeathInv (); 	// für Monster
		};
		if(!Npc_IsPlayer(other))
		{		
		};
	};
	B_CheckDeadMissionNPCs ();
	//resp
 	if(Npc_GetAivar(self,AIV_MM_DrohRange) != 1)&&(C_NpcIsMonster(self))
 	{
      Respawn_Include(self);
 	};
   
	Npc_SetAivar(self,AIV_MM_DrohRange,  1);
	B_Check_Challenge();
	var C_ITEM readyweap;
	readyweap = Npc_GetReadiedWeapon(other);			
//
	//special react to damage:
	//special react to damage: 
	//(for hero it's done in damage system)
	//if (!Npc_IsPlayer(other))
	//{
	//	B_SpecialCombatDamageReaction(self,other);
	//};
};