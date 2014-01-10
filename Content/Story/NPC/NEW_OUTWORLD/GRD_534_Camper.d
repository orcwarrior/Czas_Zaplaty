instance GRD_534_Camper (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Stra?nik";
	npctype =						npctype_main;
	guild =							GIL_DMB;      
	level =							13;
	
	voice =							2;
	id =							534;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		65;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	176;
	attribute[ATR_HITPOINTS] =		176;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald",74,1,GRD_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	

	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self,GRD_MW_01);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItFoBeer);
	CreateInvItem (self,ItLsTorch);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_534;
};

FUNC VOID Rtn_start_534 ()
{
	TA_SitCampfire 	(10,00,22,00,"OC_ROUND_22_CF_2");
	TA_SitCampfire 	(10,00,22,00,"OC_ROUND_22_CF_2");
};
