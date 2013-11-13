instance Stt_341_Ronald (Npc_Default)
{
	//-------- primary data --------
	name =							"Ronald";
	npctype =						npctype_ambient;
	guild =							GIL_GRD;
	level =							5;
	
	
	voice =							1;
	id =							341;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,"Hum_Body_Naked0",0,1,"Hum_Head_Fighter",7,1,STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente -------- 
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);		
			
	
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Nailmace_01);
	CreateInvItem	(self,ItMi_Stuff_Cup_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_341;
};

FUNC VOID Rtn_start_341 ()
{
    TA_Stand		(08,00,22,00,"OCR_HUT_14");
	TA_Sleep	(22,00,08,00,"OCR_HUT_14");
};


