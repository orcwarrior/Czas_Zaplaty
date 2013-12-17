instance SLV_640_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Ranny cz³owiek";
	npctype =						npctype_ambient;
	guild =							GIL_SLV;      
	level =							5;
	
	
	voice =							3;
	id =							640;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Bald",4,3,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self,ItFoRice,2);
	CreateInvItem (self,ItMiHammer);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_prestart_640;
};

FUNC VOID Rtn_start_640 ()
{
	TA_RepairHut	(00,10,10,10,"NC_EN_BARACK_REPAIR_04");
    TA_SlaveRest    (10,10,16,10,"NC_EN_SLVCAMP_03");		
	TA_RepairHut	(16,10,00,10,"NC_EN_BARACK_REPAIR_04");
};

FUNC VOID Rtn_prestart_640 ()
{
    TA_SlaveRest    (10,00,22,00,"NC_EN_MAINPATH_05");	
    TA_SlaveRest    (22,00,10,00,"NC_EN_MAINPATH_05");			

};