instance STT_2503_Ramon (Npc_Default)
{
	//orc: tak samo jak w wypadku innych NPC...musisz sam dobraæ jakieœ parametry ;P
	//-------- primary data --------
	name 			=		"Ramon";
	npctype			=		npctype_Main;
	guild 			=		GIL_GRD;
	level 			=		7;
	
	
	voice 			=		5;
	id 				=		2503;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	25;
	attribute[ATR_DEXTERITY] 		=	28;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_HITPOINTS_MAX]	=	124;
	attribute[ATR_HITPOINTS] 		=	124;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",45,1,STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
		
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 

	Npc_SetTalentSkill 	( self,NPC_TALENT_BOW,1 );
	Npc_SetTalentSkill 	( self,NPC_TALENT_1H,1 );	
		
	//-------- inventory --------
	CreateInvItem	(self,RamonAmulet);
	
	EquipItem	( self,GRD_MW_01 );
	EquipItem	( self,ItRw_Bow_Small_02);
	CreateInvItems	(self,ItAmArrow,18);
	CreateInvItems	(self,ItKeLockpick,3);
	CreateInvItems	(self,ItFoBeer,2);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2503;
};

FUNC VOID Rtn_start_2503 ()
{        
	//musisz mu ustawiæ jakiœ WP
	TA_Boss		(00,00,20,00,"OC1");
};
