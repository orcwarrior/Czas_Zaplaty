instance ORG_890_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				Npctype_MINE_Ambient;
	guild =						GIL_SLV;      
	level =						8;

	
	voice =						7;
	id =						890;


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
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",37,2,ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	

	//-------- inventory --------   
	                                   
	CreateInvItems (self,ItFoRice,1);
	CreateInvItems (self,ItFoBooze,1);
	EquipItem (self,DEF_MW_2H);
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMCstart_890;
};

FUNC VOID Rtn_FMCstart_890 ()
{
	TA_SitAround	(01,00,13,00,"FMC_HUT06_OUT");
	TA_SitAround	(13,00,01,00,"FMC_HUT06_OUT");
};







