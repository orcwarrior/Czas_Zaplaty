instance Grd_4107_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Stra¿nik lochów";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	30;
	voice 		=	11;
	id 			=	4107;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 440;
	attribute[ATR_HITPOINTS] 	= 440;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",44,1,EBR_ARMOR_H2);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    

	EquipItem	(self,ItMw_1H_Sword_Bastard_03);
	CreateInvItems(self,ItFo_Potion_Health_03,4);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4107;
};


FUNC VOID Rtn_Start_4107 ()
{
	TA_Guard(07,00,20,00,"OCC_CELLAR_HALLWAY_BACK");
	TA_Guard(20,00,07,00,"OCC_CELLAR_HALLWAY_BACK");
};

