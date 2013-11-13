instance ORG_2500_Kasztan (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Kasztan";
	Npctype =				Npctype_Main;
	guild =					GIL_GRD;      
	level =					15;
	id =					2500;
   flags = NPC_FLAG_IMMORTAL;

	//-------- abilities --------

	attribute[ATR_STRENGTH] 	= 60; 
	attribute[ATR_DEXTERITY] 	= 36; 
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,GRD_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- inventory --------   
	                                 
	CreateInvItems	(self,ItKeLockpick,2);		
	CreateInvItems	(self,ItMiNugget,11);
	CreateInvItems	(self,ItFoRice,8);
	CreateInvItems	(self,ItFoBooze,3);
	CreateInvItems	(self,ItLsTorch,2);
	CreateInvItems	(self,ItFo_Potion_Health_01,3);
	CreateInvItem	(self,ItMi_Stuff_Plate_01);
	CreateInvItem	(self,ItMi_Stuff_Cup_01);
	CreateInvItem	(self,ItFoLoaf);
	CreateInvItem	(self,ItAt_Teeth_01);
	EquipItem 		(self,ItMw_1H_Sword_02);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_2500;
};

FUNC VOID Rtn_PreStart_2500 ()
{
	TA_SitCampfire(22,00,10,00, "OC_ROUND_22_CF_2");
   TA_Position(10,00,22,00, "OC_ROUND_22_CF_2");
};