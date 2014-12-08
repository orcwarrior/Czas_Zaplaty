instance SLD_7501_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	Name_Soeldner;
	npctype 	= 	npctype_main;
	guild 		=	GIL_SLV;
	level 		=	15;
	voice 		=	11;
	id 			=	7501;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 320;
	attribute[ATR_HITPOINTS] 	= 320;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self, "hum_body_Naked0", 0, 0, "Hum_Head_FatBald", 10, 1, SLD_ARMOR_M);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);

	Mdl_SetModelScale(self,1.0,1.0,1.0);

	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    

	EquipItem	(self,GRD_MW_02U);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItLsTorch);

	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_7501;
};

FUNC VOID Rtn_Start_7501 ()
{
	TA_BOSS(07,00,20,00,"FM_07");
	TA_BOSS(20,00,07,00,"FM_07");
};
