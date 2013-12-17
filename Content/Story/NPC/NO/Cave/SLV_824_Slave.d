instance SLV_824_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Slave;
	Npctype =				Npctype_Ambient;
	guild =						GIL_SLV;      
	level =						5;
		
	voice =						13;
	id =						824;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	146;
	attribute[ATR_HITPOINTS] =		146;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald",16,2,-1);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self,ItFoRice,5);
	CreateInvItems(self,ItMi_Broom,1);

	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_824;
};

FUNC VOID Rtn_start_824 ()
{

	TA_SitCampfire	(00,16,09,10,"NC_SLVCAMPFIRE");
	TA_Brooming		(09,10,0,16,"NC_KDW06_IN");
};










