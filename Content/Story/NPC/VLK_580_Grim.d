instance VLK_580_Grim (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Grim";
	npctype =						npctype_main;
	guild =							GIL_GRD;      
	level =							15;
	
	
	voice =							6;
	id =							580;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		85;
	attribute[ATR_DEXTERITY] =		35;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;  
	attribute[ATR_HITPOINTS] =		220;  

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief",72,2,GRD_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	
	//-------- Talents  --------                                    
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	EquipItem (self,GRD_MW_02);
	CreateInvItem (self,Itfo_Potion_Water_01);
	CreateInvItem (self,ItLsTorch);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_580;
};

FUNC VOID Rtn_Start_580 ()
{
	TA_Stand	(07,30,22,30,"OCR_OUTSIDE_HUT_48");
	TA_Sleep 	(22,30,07,30,"OCR_OUTSIDE_SMALLTALK_49");
};

func void Rtn_Guide_580 ()
{
	TA_GuidePC (10,00,22,00,"OC_ROUND_22_CF_2_MOVEMENT");
	TA_GuidePC (22,00,10,00,"OC_ROUND_22_CF_2_MOVEMENT");
};

func void Rtn_InExtremo_580 ()
{
	TA_WatchInextremo (10,00,22,00,"OCR_AUDIENCE_01");
	TA_WatchInextremo (22,00,10,00,"OCR_AUDIENCE_01");
};












