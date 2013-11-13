instance HUN_20254_Grd (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Stra¿nik G³êbi";
	Npctype =						NPCTYPE_MAIN;
	guild =							GIL_HUN;      
	level =							30;
	
	voice =							6;
	id =							20254;


	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12+100;
	attribute[ATR_HITPOINTS] =		self.level*12+100;
	protection	[PROT_BLUNT]		=	25;
	protection	[PROT_EDGE]			=	25;
	protection	[PROT_POINT]		=	5;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",13,2,HUN_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);			
Npc_SetTalentValue(self,NPC_TALENT_1H,75); 	
Npc_SetTalentValue(self,NPC_TALENT_BOW,85); 	
	
	//-------- inventory --------
	                                    	
	CreateInvItems(self,ItMiNugget,3);
	CreateInvItems (self,ItFoRice,1);
	CreateInvItems (self,ItFoBeer,1);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItAt_Teeth_01);		
	EquipItem (self,HUN_MW_01);
	EquipItem (self,HUN_RW_01);
	CreateInvItems (self,ItAmArrow,20);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_20254;
};

FUNC VOID Rtn_start_20254 ()
{
    TA_BOSS	(07,02,16,15,"DEEP_WP");
    TA_BOSS	(16,16,07,01,"DEEP_WP");

};
