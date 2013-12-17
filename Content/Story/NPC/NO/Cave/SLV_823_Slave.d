instance SLV_823_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Slave;
	Npctype =				Npctype_Ambient;
	guild =						GIL_SLV;      
	level =						8;

	
	voice =						7;
	id =						823;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	176;
	attribute[ATR_HITPOINTS] =		176;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,2,"Hum_Head_Bald",5,2,-1);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);	
	
	fight_tactic	=	FAI_HUMAN_MASTER;	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems (self,ItFoRice,2);
	CreateInvItems (self,ItLsTorch,1);
	CreateInvItems(self,ItMi_Broom,2);
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_823;
};

FUNC VOID Rtn_start_823 ()
{
	TA_SitCampfire	(00,06,09,10,"NC_SLVCAMPFIRE");
	TA_Brooming			(09,10,19,20,"NC_KDW03_IN");
	TA_Brooming		(12,00,0,06,"NC_KDW04_IN");
};












