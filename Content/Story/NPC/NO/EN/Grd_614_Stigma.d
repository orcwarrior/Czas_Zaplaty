instance Grd_614_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Znamiê";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice 		=	6;
	id 			=	614;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 250;
	attribute[ATR_HITPOINTS] 	= 250;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",18,1,GRD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_03);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	CreateInvItem	(self,ItFo_Stew);
	CreateInvItem	(self,ItFoWine);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_614;
};

FUNC VOID Rtn_start_614 ()
{
	TA_StandAround		(07,00,20,00,"STI_STAY");
	TA_Sleep	(20,00,07,00,"NC_EN_BARACK_SMALLTALK");
};

FUNC VOID Rtn_watch_614 ()
{
	TA_Guard	(22,00,10,00,"NC_EN_TAVERN_ONFRONT");	
	TA_Guard	(10,00,22,00,"NC_EN_TAVERN_ONFRONT");	
};

