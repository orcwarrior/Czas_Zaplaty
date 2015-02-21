instance SLV_850_Wedge (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Klin";
	Npctype =				NPCTYPE_AMBIENT; // mark - main->ambient
	guild =					GIL_SLV;      
	level =					6;
	
	voice =					5;
	id =					850;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	172;
	attribute[ATR_HITPOINTS] =		172;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fatbald",37,1,-1);
	
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);	

	//-------- inventory --------
	                                    
	CreateInvItems (self,ItKeLockpick,2);		
	CreateInvItems(self,ItMi_Broom,2);
	CreateInvItems (self,ItFoRice,1);
	CreateInvItems (self,ItLsTorch,2);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_850;
};

FUNC VOID Rtn_start_850 ()
{
	TA_Boss			(00,02,01,20,"NC_SLVCAMPFIRE2");
	TA_SitCampfire	(01,20,05,00,"NC_SLVCAMPFIRE");
	TA_Boss			(05,00,09,20,"NC_SLVCAMPFIRE2");
	TA_Brooming		(09,20,12,20,"NC_KDW01_IN");
	TA_Brooming		(12,00,19,20,"NC_KDW02_IN");
	TA_Brooming		(19,20,0,02,"NC_KDW05_IN");
};
