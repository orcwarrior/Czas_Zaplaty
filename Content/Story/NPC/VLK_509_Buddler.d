instance VLK_509_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							15;
	
	
	voice =							2;
	id =							509;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		23;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fatbald",33,4,VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talents --------                                    
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);	

	//-------- inventory --------                                    

	EquipItem (self,ItMw_1h_Nailmace_01);
	CreateInvItem (self,ItMwPickaxe);
	
	CreateInvItem (self,ItFoBeer);
	CreateInvItem (self,ItLsTorch);
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_509;
};

FUNC VOID Rtn_start_509 ()
{
	TA_Sleep 			(23,00,08,00,"OCR_HUT_56");
	TA_SitAround		(08,00,10,00,"OCR_OUTSIDE_HUT_56");
	TA_SitAround		(10,00,14,00,"OCR_OUTSIDE_HUT_26");
	TA_SitAround		(14,00,18,00,"OCR_OUTSIDE_HUT_66");
	TA_SitAround		(18,00,20,00,"OCR_OUTSIDE_HUT_16");
	TA_SitAround		(20,00,23,00,"OCR_OUTSIDE_HUT_76");
};



