instance VLK_4201_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mine_ambient;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							3;
	id =							590;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter",73,1,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self,ItMw_1h_Nailmace_01);
	CreateInvItem (self,ItMwPickaxe);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItFoBeer);
	CreateInvItem (self,ItLsTorch);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4201;
};

FUNC VOID Rtn_start_4201 ()
{
	TA_StandAround	(07,00,21,00,"OCR_HUT_Z4");
	TA_StandAround	(21,00,07,00,"OCR_HUT_Z4");
};












