//P¯ przy ostatnim uruchomieniu ReactToDamage przez hera
func void B_CheckEvasion(var C_NPC slf,var C_NPC attacker)
{
	var int rnd;
	rnd = Hlp_Random(100)+1;
	if(rnd<=Npc_GetTalentValue(slf,NPC_TALENT_EVASION))
	{
			PutMsg("Unik!","font_default.tga",RGBAToZColor(255,255,255,255),1,"");
			Npc_ClearAIQueue(hero);
			Snd_Play("EVASION_SUCESS");
			hero.attribute[ATR_HITPOINTS]=HeroLastHP;			
	}
	else if((!Npc_GetTalentSkill(hero,NPC_TALENT_EVASION))||(rnd>Npc_GetTalentValue(hero,NPC_TALENT_EVASION)))&&(Npc_IsPlayer(slf))&&(HeroLastHP!=hero.attribute[ATR_HITPOINTS])
	{
		Snd_Play3D(slf,ConcatStrings("SVMD_5_AARGH_",IntToString(Hlp_Random(4)+1)));			
	};		
	HeroLastHP=hero.attribute[ATR_HITPOINTS];
		
};
func void B_CheckIceSword(var C_NPC slf,var C_NPC attacker)
{
	var C_ITEM readyweap;
	readyweap = Npc_GetReadiedWeapon(attacker);	
	if (Hlp_IsItem(readyweap,ItMw_2h_IceSword_3)||Hlp_IsItem(readyweap,ItMw_1h_IceSword_3))
	{
			var int specialdamageradomizer;
			specialdamageradomizer = Hlp_Random(1000);
			var int damage;
			damage = Hlp_random(50);
			if (specialdamageradomizer+attacker.attribute[ATR_STRENGTH]+attacker.attribute[ATR_DEXTERITY]+(attacker.level*5)>1000)
			{
				Wld_PlayEffect("itemFX_DAM_2", slf, slf, 1,30+damage , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)
				Wld_PlayEffect("itemFX_DAM_ICE", slf, slf, 1,30+damage , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)		
				
				//Pr/int("effect played|spec damage");
			//	Npc_ClearAIQueue(slf);	
				AI_StartState		(slf,	ZS_ShortMagicFreeze,	1,	"");	
			}
			else
			{
					Wld_PlayEffect("itemFX_DAM", slf, slf, 1, 0, DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)
					//Print("effect played|non-specdamage");
			};
	};
};

func void B_CheckSpecialAmunition(var C_NPC slf,var C_NPC attacker)
{
	var C_ITEM readyweap;
	readyweap = Npc_GetReadiedWeapon(attacker);	
	if (Npc_HasReadiedRangedWeapon(attacker))//&&(Npc_IsPlayer(attacker))
	{
		if ((((A_munition==A_ICE)&&(readyweap.makingmob==1))||((B_munition==B_ICE)&&(readyweap.makingmob==2)))&&Npc_IsPlayer(attacker))||((readyweap.munition==ItAmIceArrow)||(readyweap.munition==ItAmIceBolt))
		{				
		//	Npc_ClearAIQueue(slf);
			Wld_PlayEffect("spellFX_IceSpell_TARGET", slf, slf, 1,0 , DAM_MAGIC, TRUE);			
			AI_StartState		(slf,	ZS_MagicFreeze,	1,	"");	
		}	
		else if ((((A_munition==A_POISON)&&(readyweap.makingmob==1))||((B_munition==B_POISON)&&(readyweap.makingmob==2)))&&Npc_IsPlayer(attacker))||((readyweap.munition==ItAmPoisonArrow)||(readyweap.munition==ItAmPoisonBolt))
		{		
			add_poison(attacker,slf,50);
		}
		else if ((((A_munition==A_FIRE)&&(readyweap.makingmob==1))||((B_munition==B_FIRE)&&(readyweap.makingmob==2)))&&Npc_IsPlayer(attacker))||((readyweap.munition==ItAmFireArrow)||(readyweap.munition==ItAmFireBolt))
		{
			Snd_Play3D 					(slf,"MFX_Firespell_Humanburn");
		};
		
		if(cri_time)
		{	
			Npc_ChangeAttribute(slf,ATR_HITPOINTS, -readyweap.damageTotal);
		};
		
		//ATTACH Arrow?
		if(readyweap.makingmob==1)&&(Hlp_Random(100)>40)&&(Npc_GetDistToPlayer(slf)>400)
		{
			//PR/INT("OUCH!");
			Wld_PlayEffect(concatstrings("V_RANDOM_ARROW_",inttostring(Hlp_Random(7)+2)), slf, slf, 0, 0, DAM_INVALID, FALSE);					
		};
	};
	
	
};
func void B_CheckMirror(var c_npc slf, var c_npc attacker)
{
	if(Npc_GetAivar(attacker,AIV_MIRROR_DURATION))
	{
	//anti getin looped	
	return;	
	};
	if(Npc_GetAivar(slf,AIV_MIRROR_DURATION))
	{
		var int dmg; var int dmgtyp;
		var c_item itm;
		if(Npc_HasReadiedMeleeWeapon(attacker)||Npc_HasReadiedRangedWeapon(attacker))&&(C_NpcIsHuman(attacker))
		{
			itm=Npc_GetReadiedWeapon(attacker);
			dmg=Math_Round((itm.damagetotal+attacker.attribute[ATR_STRENGTH])/4);
			if(Npc_HasReadiedRangedWeapon(attacker))
			{
			dmg=Math_Round((itm.damagetotal+attacker.attribute[ATR_STRENGTH])/6);	
			};
			dmgtyp=itm.damagetype;
			
		}
		else if(Npc_IsInFightMode		(attacker,FMODE_FIST))||((Npc_HasReadiedMeleeWeapon(attacker)||Npc_HasReadiedRangedWeapon(attacker))&&(!C_NpcIsHuman(attacker)))
		{
			dmg=Math_Round((attacker.attribute[ATR_STRENGTH])/4);
			dmgtyp=DAM_EDGE;
			//B_PrintDebug(inttostring(dmg));			
		}
		else if(Npc_IsInFightMode		(attacker,FMODE_MAGIC))
		{
			if 		( Npc_GetActiveSpell 	(attacker) == SPL_FIREBOLT			)		{	dmgtyp=DAM_FIRE; dmg=Math_Round(SPL_DAMAGE_FIREBOLT/4);	}
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_Meteor		)			{	dmgtyp=DAM_FIRE; dmg=Math_Round(SPL_DAMAGE_METEOR*2/4);	}
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_FIREBALL			)		{	dmgtyp=DAM_FIRE; dmg=Math_Round(SPL_DAMAGE_FIREBALL);} 
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_FIRESTORM		)		{	dmgtyp=DAM_FIRE; dmg=Math_Round(SPL_DAMAGE_FIRESTORM);	} 
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_FIRERAIN			)		{	dmgtyp=DAM_FIRE; dmg=Math_Round(SPL_DAMAGE_FIRERAIN*2/4); } 
    		
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_CHAINLIGHTNING	)		{	dmgtyp=DAM_MAGIC; dmg=Math_Round(SPL_ZAPPED_DAMAGE_PER_SEC/4);	} 
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_THUNDERBOLT		)		{	dmgtyp=DAM_MAGIC; dmg=Math_Round(SPL_DAMAGE_THUNDERBOLT/4);	} 
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_THUNDERBALL		)		{	dmgtyp=DAM_MAGIC; dmg=Math_Round(SPL_DAMAGE_THUNDERBALL);	} 
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_ICECUBE			)		{	dmgtyp=DAM_MAGIC; dmg=Math_Round(SPL_FREEZE_DAMAGE/4);	} 
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_ICEWAVE			)		{	dmgtyp=DAM_MAGIC; dmg=Math_Round(SPL_FREEZE_DAMAGE/4);	} 
    		
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_MASSDEATH		)		{	dmgtyp=DAM_MAGIC; dmg=Math_Round(SPL_DAMAGE_MASSDEATH/4);	} 
    		
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_WINDFIST			)		{	dmgtyp=DAM_FLY; dmg=Math_Round(SPL_DAMAGE_WINDFIST/4);} 
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_STORMFIST		)		{	dmgtyp=DAM_FLY; dmg=Math_Round(SPL_DAMAGE_WINDFIST/4);	} 
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_PYROKINESIS  	) 		{	dmgtyp=DAM_FIRE; dmg=Math_Round(SPL_PYRO_DAMAGE_PER_SEC/4);	}
			else if ( Npc_GetActiveSpell 	(attacker) == SPL_BREATHOFDEATH	)		{	dmgtyp=DAM_MAGIC; dmg=Math_Round(SPL_DAMAGE_BREATHOFDEATH/4);	} 
    		
			else if (Npc_GetActiveSpell(other) == SPL_THUNDER	)	{	dmgtyp=DAM_MAGIC; dmg=Math_Round(SPL_DAMAGE_THUNDER/4);		}
			else { return; };
		};
		if((dmgtyp==DAM_BLUNT)&&(attacker.protection[PROT_BLUNT]>dmg)) || ((dmgtyp==DAM_EDGE)&&(attacker.protection[PROT_EDGE]>dmg)) || ((dmgtyp==DAM_FIRE)&&(attacker.protection[PROT_FIRE]>dmg)) || ((dmgtyp==DAM_FLY)&&(attacker.protection[PROT_FLY]>dmg)) || ((dmgtyp==DAM_MAGIC)&&(attacker.protection[PROT_MAGIC]>dmg))
		{
			attacker.attribute[ATR_HITPOINTS]-=15;
			AI_PlayAni(attacker,"T_HURT");
			if(attacker.attribute[ATR_HITPOINTS]<=0)
			{
				B_GiveXP(attacker.level*XP_PER_LEVEL_DEAD);
			};
		}
		else
		{
			Wld_PlayEffect("SPELLFX_INVISIBLEDMG_FIREBALL", slf, attacker, 1, dmg, dmgtyp, TRUE);
		};
		Wld_PlayEffect("spellFX_MIRROR_HIT", slf, slf, 2, 0, 0, FALSE);
		Snd_Play3D 					(slf,"MFX_MIRROR_HIT");
		
		
	};	
};

func void B_CheckShield (var C_NPC slf,var C_NPC attacker)
{
	if(Npc_GetAivar(slf,AIV_MAGICSHIELD_DURATION) > 0)&&(Npc_GetAivar(slf,AIV_MAGICSHIELD_DURATION) != 6)
	{
	
		var int a;
		a=Npc_GetAivar(slf,AIV_LASTHP)-slf.attribute[ATR_HITPOINTS];
		if(a==0){return;};			
		if(a<=slf.attribute[ATR_MANA])	
		{
			slf.attribute[ATR_MANA]-=a;
			slf.attribute[ATR_HITPOINTS]=Npc_GetAivar(slf,AIV_LASTHP);	
			Npc_ClearAIQueue(slf);
			Wld_PlayEffect("spellFX_MagicShield_HIT", slf, slf, 2, 0, 0, FALSE);
			Snd_Play3D 					(slf,"MFX_MAGICSHIELD_HIT");
			
		}
		else if(slf.attribute[ATR_MANA])
		{
			slf.attribute[ATR_HITPOINTS]+=slf.attribute[ATR_MANA];		
			slf.attribute[ATR_MANA]=0;
			Npc_ClearAIQueue(slf);
			Wld_PlayEffect("spellFX_MagicShield_HIT", slf, slf, 2, 0, 0, FALSE);
			Snd_Play3D 					(slf,"MFX_MAGICSHIELD_HIT");
			
		};
		
	};
	

};
func void B_CheckImmunity (var C_NPC slf,var C_NPC attacker)
{
	//Switched to much more simple changing hero flags to immune
	return;
	
	if(imu_time)&&(Npc_IsPlayer(slf))
	{
// 		if(Npc_GetAivar(slf,AIV_LASTHP)==0){Npc_GetAivar(slf,AIV_LASTHP)=slf.attribute[ATR_HITPOINTS_MAX];};	
// 		slf.attribute[ATR_HITPOINTS]=Npc_GetAivar(slf,AIV_LASTHP);	
// 		Npc_ClearAIQueue(slf);
	
	};
	

};

func void B_CheckIceArmor (var C_NPC slf,var C_NPC attacker)
{
	if(Npc_GetAivar(slf,AIV_icearmor_DURATION))
	{
			Snd_Play3D 					(slf,"MFX_ICEARMOR_HIT");


	};
	

};
func void B_CheckPSIDemonspecialFX(var c_npc slf, var c_npc attacker)
{
	if((Npc_GetAivar(attacker,AIV_MM_REAL_ID) == ID_DEMONPSI))
	{
		
		Wld_PlayEffect("spellFX_Thunder_TARGET",  slf, slf, 0, 0, DAM_MAGIC, TRUE); 
		B_ChangeAttribute (slf,	ATR_HITPOINTS, -200);
	};
};
var int Npc_IgnoreBash;
func void B_CheckBash(var c_npc slf, var c_npc attacker)
{
	if((Npc_IsPlayer(attacker))&&(!bsh_time))||((!Npc_IsPlayer(attacker))&&(!Npc_GetAivar(attacker,AIV_TPBASH)))
	||(!Npc_HasReadiedMeleeWeapon(attacker)){return;};
	var int rnd; rnd = Hlp_Random(100)+1;
	printdebug("CheckBash!");
	if(rnd>80)
	{
	printdebug("DoBash!");
	Npc_IgnoreBash=hlp_getinstanceid(attacker);
	AI_StopAim					(slf);
	Npc_ClearAiQueue(slf);	
	AI_StandUpQuick(slf);
	AI_SetNpcsToState			(slf,ZS_Bashed,500);
	if(Npc_GetDistToPlayer(slf)<501)&&(!Npc_IsPlayer(attacker))//bugfix hero dont react to setnpctostate
	{
	Npc_ClearAiQueue(hero);  rnd = Hlp_Random (800);
	AI_PlayAni			(hero, "T_FALLB_2_FALLENB" );
	AI_PlayAni			(hero, "S_FALLENB" );
	AI_PlayAni			(hero, "T_FALLENB_2_STAND" );			
	B_MagicHurtNpc 		(hero,	30);	
	};
	AI_StartState		(slf,	ZS_Bashed,	1,	"");		
	Wld_PlayEffect("TempPotionFX_StunBash_1", attacker, attacker, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("TempPotionFX_StunBash_2", attacker, attacker, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("TempPotionFX_StunBash_3", attacker, attacker, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("TempPotionFX_StunBash_4", attacker, attacker, 1, 0, DAM_MAGIC, FALSE);	
	};
};
func void B_CheckDual(var c_npc slf, var c_npc attacker)
{
	var c_item itm; var int dmg;
	itm = Npc_GetReadiedWeapon(attacker);
	
	if(itm.weight != 123)&&((npc_isplayer(slf))&&(DualEquiped)){return;};
	//I don't know why, but this formula works good
	dmg = /*attacker.attribute[ATR_STRENGTH]*/+LSWD_DMG;//-slf.protection[PROT_EDGE];	
	if(dmg<1){dmg=0;};
	//if(slf.attribute[ATR_HITPOINTS]-dmg<1){dmg=slf.attribute[ATR_HITPOINTS]-1;};
	//B_PrintDebug(inttostring(dmg));
	if(dmg<1){dmg=0;};
	if(self.attribute[ATR_HITPOINTS]-dmg<1){dmg=self.attribute[ATR_HITPOINTS]-1;};
	Npc_ChangeAttribute	(self, ATR_HITPOINTS, -dmg);

};
func void B_SpecialCombatDamageReaction (var C_NPC slf,var C_NPC attacker)
{
	var C_NPC runenow;	
	runenow				=	Hlp_GetNpc(RuneSword_Now);
	
	//change of rules: npc's with this aiv's sat to 2 are invunerable to special weapons
	if (Npc_GetAivar(slf,AIV_SPECIALCOMBATDAMAGEREACTION) == 2)
	{
		return;
	};
// 	if((slf.spawnDelay & NPC_FLAG_INSTANTDEATH) == NPC_FLAG_INSTANTDEATH)&&(slf.attribute[ATR_HITPOINTS]<=1)
// 	{
// 		
// 		Pri/nt("KILL");		
// 		Npc_ClearAIQueue(slf);		
// 		B_ChangeAttribute	(slf, ATR_HITPOINTS, -slf.attribute[ATR_HITPOINTS_MAX]);
// 		
// 		B_ClearPerceptions	();	
// 		AI_PlayAniBS(self,"T_DEADB",BS_DEAD);		
// 		AI_StartState 		(slf, ZS_Dead, 1, "");						
// 		PrintDebugNpc	(PD_ZS_CHECK, "...NSC ertrinkt!" );		
// 		return;	
// 	};
	
	RS_SpecialDamage(slf,attacker);
	B_CheckIceSword(slf,attacker);
	B_CheckSpecialAmunition(slf,attacker);
	B_CheckPSIDemonspecialFX(slf,attacker);
	
	if(!CmpNpc(slf,attacker))&&(Hlp_IsValidNpc(attacker))&&(Npc_GetAivar(slf,AIV_LASTHP)!=slf.attribute[ATR_HITPOINTS])&&(!C_NpcIsMonster(attacker))
	{
		B_CheckMirror(slf,attacker);
		B_CheckShield(slf,attacker);
		B_CheckIceArmor(slf,attacker);	
		B_CheckEvasion(slf,attacker);	
		B_CheckBash(slf,attacker);
		B_CheckImmunity(slf,attacker);		
		//B_CheckDual(slf,attacker);		
		//pupil
		//TODO
// 		if (HeroHasPupil)&&(Npc_IsPlayer(slf))&&(!Npc_IsInState(mywolf,ZS_Pupil_Attack))
// 		{
// 			Npc_SetTarget	(mywolf, attacker);
// 			Npc_ClearAIQueue(mywolf);
// 			AI_StartState	(mywolf, ZS_Pupil_Attack, 0, "");
// 		};
	};
	if(Npc_HasBodyflag(slf,BS_STUMBLE))
	{
		Npc_SetAivar(slf,AIV_LASTHP,  slf.attribute[ATR_HITPOINTS]);	
	};
};
