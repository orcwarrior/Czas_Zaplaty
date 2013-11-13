instance NON_4072_Urksh (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Urksh'Est";
	Npctype =				Npctype_Main;
	guild =					GIL_NONE;      
	level =					35;
	
	voice =					11;
	id =					4072;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		115;
	attribute[ATR_DEXTERITY] =		100;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12;
	attribute[ATR_HITPOINTS] =		self.level*12;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",10,1,CRW_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	

	EquipItem (self,ItMw_2H_Axe_Old_01);

	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_urksh_4072;
};
FUNC VOID Rtn_urksh_4072 ()
{
	TA_BOSS			(22,00,04,00,"urksh");	
	TA_BOSS			(04,00,22,00,"urksh");
};
