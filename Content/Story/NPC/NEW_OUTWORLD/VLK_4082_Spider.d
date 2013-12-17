instance VLK_4082_Spider (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Paj¹k";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							2;
	id =							4082;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief",71,4,VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents --------                                    
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	CreateInvItems (self,ItKeLockpick,20);
	
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4082;
	
	//------------ //MISSIONs-------------------
	
};

FUNC VOID Rtn_start_4082 ()
{
    TA_StandAround	(07,00,22,00,"MINE_PATH28");	                                      
	TA_SitAround	(22,00,07,00,"MINE_PATH28");                                   
};

