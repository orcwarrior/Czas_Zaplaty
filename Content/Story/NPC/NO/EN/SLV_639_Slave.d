instance SLV_639_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Slave;
	npctype =						npctype_ambient;
	guild =							GIL_SLV;      
	level =							4;
	voice =							3;
	id =							639;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",19,3,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self,ItFoRice,3);
	CreateInvItem (self,ItMiHammer);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_639;
};

FUNC VOID Rtn_start_639 ()
{
	TA_RepairHut	(00,10,10,10,"NC_EN_BARACK_REPAIR_05");
   TA_SlaveRest    (10,10,16,10,"NC_EN_SLVCAMP_03");	
   TA_RepairHut	(16,10,19,10,"NC_EN_BARACK_REPAIR_06");
	TA_RepairHut	(19,10,00,10,"NC_EN_BARACK_REPAIR_07");
};

