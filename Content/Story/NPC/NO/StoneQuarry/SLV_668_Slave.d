instance SLV_668_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Slave;
	npctype =						npctype_ambient;
	guild =							GIL_SLV;      
	level =							5;
	
	
	voice =							4;
	id =							668;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Bald",12,2,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self,ItFoRice,2);



	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_668;
};

FUNC VOID Rtn_start_668 ()
{
    TA_PickStonesWall	(08,10,14,35,"OW_QUARRY_TOP2_02");
    TA_PickStonesWall  (14,35,02,10,"OW_QUARRY_TOP_03");  
    TA_SlaveRest       (02,10,08,10,"NC_EN_SLVCAMP_03");
	
};

