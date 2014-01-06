instance STT_346_Virat (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_AMBIENT	;
	guild 		=		GIL_GRD;
	level 		=		11;

	
	voice 		=		12;
	id 			=		318;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	35;
	attribute[ATR_DEXTERITY] 		=	28;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	154;
	attribute[ATR_HITPOINTS] 		=	154;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     57,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",108 ,1,STT_ARMOR_H);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	////Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self,STT_MW_01);
	EquipItem	(self,ItRw_Bow_Small_03);
	CreateInvItems	(self,ItAmArrow,20);
	CreateInvItem	(self,ItKeLockpick);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_346;
};

FUNC VOID Rtn_start_346 ()
{
	TA_Sleep		(00,00,07,00,"OCR_HUT_73");           
	TA_Boss			(07,00,07,30,"OCR_OUTSIDE_HUT_73");   
	TA_Smalltalk	(07,30,12,00,"OCR_OUTSIDE_HUT_73");
	TA_SitAround	(12,00,00,00,"OCR_OUTSIDE_HUT_73");

};


