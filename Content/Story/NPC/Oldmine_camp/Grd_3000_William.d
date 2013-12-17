instance Grd_3000_William (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Willam";
	npctype		=	npctype_main;
	guild 		=	GIL_DMB;
	level 		=	30;
	voice 		=	13;
	id 			=	3000;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 520;
	attribute[ATR_HITPOINTS] 	= 520;
	senses			=	SENSE_HEAR | SENSE_SEE ;
	senses_range	=	500;
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",49,1,GRD_ARMOR_H);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);
			
	//-------- inventory --------
	EquipItem	(self,William_Sword);	
	EquipItem	(self,GRD_RW_02);
	CreateInvItems	(self,ItAmFireBolt,8);
	CreateInvItems	(self,ItAmBolt,30);	
	CreateInvItem	(self,ItFoCheese);
	CreateInvItems	(self,ItMiNugget,124);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_3000;
	
};

FUNC VOID Rtn_start_3000 ()
{
	TA_Stand	(06,00,21,00,"OW_OM_ENTRANCE02");
	TA_Stand	(21,00,06,00,"OW_OM_ENTRANCE02");
};