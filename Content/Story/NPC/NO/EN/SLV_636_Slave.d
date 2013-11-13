instance SLV_636_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Slave;
	npctype =						npctype_ambient;
	guild =							GIL_SLV;      
	level =							5;
	
	
	voice =							2;
	id =							636;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		45;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",10,3,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self,ItFoRice,2);
	CreateInvItem (self,ItMiHammer);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_636;
};

FUNC VOID Rtn_start_636 ()
{
	TA_RepairHut	(00,10,02,00,"NC_EN_PALLISADE1");
	TA_RepairHut	(08,00,12,10,"NC_EN_BARACK_REPAIR_08");
	TA_RepairHut	(12,10,19,10,"NC_EN_PALLISADE2");
	TA_RepairHut	(19,10,00,10,"NC_EN_PALLISADE2");
    TA_SlaveRest    (02,00,8,00,"NC_EN_SLVCAMP_02");
};

