instance SLV_635_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Slave;
	npctype =						npctype_ambient;
	guild =							GIL_SLV;      
	level =							5;
	
	
	voice =							4;
	id =							635;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",106,3,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	CreateInvItem (self,ItFoRice);
	CreateInvItem (self,ItMiHammer);
	CreateInvItem (self,ItMi_SilverRing);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_635;
};

FUNC VOID Rtn_start_635 ()
{
	TA_RepairHut	(00,10,02,00,"NC_EN_BARACK_REPAIR_08");
	TA_RepairHut	(08,00,12,10,"NC_EN_PALLISADE1");
	TA_RepairHut	(12,10,19,10,"NC_EN_BARACK_REPAIR_08");
	TA_RepairHut	(19,10,00,10,"NC_EN_BARACK_REPAIR_11");
    TA_SlaveRest    (02,00,8,00,"NC_EN_SLVCAMP_02");
	
};

