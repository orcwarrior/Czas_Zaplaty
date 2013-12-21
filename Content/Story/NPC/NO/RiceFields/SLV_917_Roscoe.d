instance SLV_917_Roscoe (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Roscoe";
	Npctype =				npctype_ambient;
	guild =					GIL_SLV;       
	level =					111;
	
	voice =					10;
	id =					917;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	172;
	attribute[ATR_HITPOINTS] =		172;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,2,"Hum_Head_Pony",9,1,-1);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	

	//-------- inventory --------
	                                    
	CreateInvItems (self,ItFoRice,1);
	CreateInvItems (self,ItFoBooze,1);

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_917;
};

FUNC VOID Rtn_start_917 () //vor Lares Hütte
{
	TA_Sleep		(20,35,07,35,"NC_PATH_PEASANT_SLEEP");
	TA_PickRice		(07,35,20,35,"NC_PATH80");
};










