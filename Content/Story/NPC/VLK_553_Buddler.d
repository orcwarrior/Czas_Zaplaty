instance VLK_553_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_ambient;
	guild =							GIL_SLV;      
	level =							3;
	
	
	voice =							1;
	id =							553;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		115;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	176;
	attribute[ATR_HITPOINTS] =		176;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald",67,4,VLK_ARMOR_L);

        B_Scale (self); 
        Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self,ALL_MW_02);
	CreateInvItem (self,ItMwPickaxe);
	CreateInvItem (self,ItLsTorch);


	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_553;

};

FUNC VOID Rtn_start_553 ()
{
	TA_Sleep		(22,00,08,00,"OCR_HUT_51");
	TA_Smalltalk	(08,00,22,00,"OCR_TO_HUT_51_SMALLTALK");
};





