instance SLV_641_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Slave;
	npctype =						npctype_ambient;
	guild =							GIL_SLV;      
	level =							7;
	
	
	voice =							3;
	id =							641;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		65;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_FatBald",5,3,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,2);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------                                    
		Npc_SetTalentSkill (self,NPC_TALENT_1H,1);

	//-------- inventory --------                                    

	CreateInvItems (self,ItFoRice,2);
	CreateInvItem (self,ItMiHammer);
	CreateInvItem 		(self,ItMw_1H_Sledgehammer_01);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_641;
};

FUNC VOID Rtn_start_641 ()
{
	TA_Smith_Anvil	(16,10,00,09,"NC_EN_SMITH_03");
	TA_STAND		(00,10,01,00,"NC_EN_SMITH_02");
    TA_SlaveRest    (10,10,16,10,"NC_EN_SLVCAMP_01");		
};

