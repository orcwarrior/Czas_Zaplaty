instance VLK_586_Grimes (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Grimes";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							4;
	id =							586;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Thief",110,2,-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents --------                                    
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);

	
	//-------- inventory --------                                    

	CreateInvItem (self,ItFo_Potion_Water_01);
	CreateInvItem (self,ItMwPickaxe); 


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_586;
};


FUNC VOID Rtn_Start_586 ()
{
	TA_Stand 	 (10,00,17,00,"OCR_OUTSIDE_HUT_44");
	TA_CookForMe	 (17,00,20,00,"OCR_OUTSIDE_HUT_44");
	TA_SitAround 	 (20,00,10,00,"OCR_OUTSIDE_HUT_44");
};














