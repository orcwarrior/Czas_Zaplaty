instance BAU_903_Rufus (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Rufus";
	npctype		=	NPCTYPE_AMBIENT; // mark - main->ambient
	guild 		=	GIL_GRD;      
	level 		=	11;
	voice 		=	2;
	id 			=	903;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		65;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Bald",2,1,GRD_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	                            	
	//-------- Talente -------- 	                                  
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);		
	
	
	//-------- inventory --------                                    

		
	EquipItem (self,GRD_MW_02);
	CreateInvItems (self,ItFoRice,1);
	CreateInvItems (self,ItFoRice,1);
	CreateInvItems (self,ItFoBooze,1);
	CreateInvItems (self,ItFo_Fish,1);
	CreateInvItems (self,ItFo_Milk,1);
	
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_903;
};



FUNC VOID Rtn_start_903 ()
{
	TA_Stand	(07,10,17,45,"NC_LO_11"); 
	TA_SitAround	(17,45,23,45,"NC_HUT01_IN");
	TA_Sleep	(23,45,07,10,"NC_HUT01_IN");
};


FUNC VOID Rtn_NC2_903 ()
{
	TA_Stand	(07,10,17,45,"NC_LO_11"); 
	TA_SitAround	(17,45,23,45,"NC_HUT01_IN");
	TA_Sleep	(23,45,07,10,"NC_HUT01_IN");
};











