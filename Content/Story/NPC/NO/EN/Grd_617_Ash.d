instance Grd_617_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Ash";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	14;
	voice 		=	6;
	id 			=	617;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 200;
	attribute[ATR_HITPOINTS] 	= 200;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody	(self,"Hum_Body_CookSmith",0,1,"Hum_Head_FatBald",45,1,-1);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoBeer);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,42);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_617;
};

FUNC VOID Rtn_start_617 ()
{
	TA_Cook		(07,00,20,00,"NC_EN_TAVERN_ONFRONT");
	TA_Sleep	(20,00,07,00,"NC_EN_BARACK_03");
};



