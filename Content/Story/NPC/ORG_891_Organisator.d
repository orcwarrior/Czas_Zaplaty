instance ORG_891_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				Npctype_MINE_Ambient;
	guild =					GIL_SLV;      
	level =					8;
	
	voice =					13;
	id =					891;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",9,3,ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	

	//-------- inventory --------   
	                                   
	CreateInvItems (self,ItFoRice,1);
	EquipItem (self,DEF_MW_2H);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMCstart_891;
	
	//------------ //MISSIONs-------------------
};

FUNC VOID Rtn_FMCstart_891 ()
{
	TA_SitAround	(01,00,13,00,"FMC_HUT06_IN");
	TA_SitAround	(13,00,01,00,"FMC_HUT06_IN");
};
