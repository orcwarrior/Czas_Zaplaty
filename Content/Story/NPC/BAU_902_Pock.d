instance BAU_902_Pock (Npc_Default)
{
	//-------- primary data --------
	
	name		=	"Pock";
	npctype		=	NPCTYPE_AMBIENT; // mark - main->ambient
	guild 		=	GIL_GRD;    
	level 		=	12;
	voice 		=	4;
	id 			=	902; 

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		45;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12+90;
	attribute[ATR_HITPOINTS] =		self.level*12+90;    

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_MILITIA.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony",3,2,GRD_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);		
	
	//-------- inventory --------                                    

		CreateInvItems (self,ItFoApple,2);
		CreateInvItem (self,ItMi_Stuff_Plate_01);
		CreateInvItem (self,ItFoBooze);
		EquipItem (self,GRD_MW_02); 		

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_902;
};

FUNC VOID Rtn_start_902 ()
{
	TA_Sleep	    (22,15,09,15,"NC_HUT06_IN");
	TA_SitCampfireEat    (09,15,12,15,"NC_HUT06_OUT"); 
	TA_SitAround	(12,15,22,15,"NC_PLACE03");
};


FUNC VOID Rtn_NC2_902 ()
{
	TA_Sleep	    (22,15,09,15,"NC_HUT06_IN");
	TA_SitCampfireEat    (09,15,12,15,"NC_HUT06_OUT"); 
	TA_SitAround	(12,15,22,15,"NC_PLACE03");
};




