instance SLV_648_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Slave;
	npctype =						npctype_ambient;
	guild =							GIL_SLV;      
	level =							5;
	
	
	voice =							5;
	id =							648;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		55;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",54,3,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self,ItFoRice,3);
	CreateInvItem (self,ItMiHammer);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_648;
};

FUNC VOID Rtn_start_648 ()
{
	TA_RepairHut	(00,10,02,10,"NC_EN_MAINHALL2_REPAIR_04");
    TA_SlaveRest    (02,10,08,10,"NC_EN_SLVCAMP_02");				
	TA_RepairHut	(08,10,12,10,"NC_EN_MAINHALL2_REPAIR_04");
	TA_RepairHut	(12,10,19,10,"NC_EN_MAINHALL2_REPAIR_03");
	TA_RepairHut	(19,10,00,10,"NC_EN_MAINHALL2_REPAIR_01");
	
};

