instance VLK_4083_Krzywy (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Krzywy";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							4;
	id =							4083;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Thief",109,2,-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents --------                                    
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);

	
	//-------- inventory --------                                    

	CreateInvItem (self,ItFo_Potion_Water_01);
	CreateInvItem (self,ItMwPickaxe); 


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4083;
};


FUNC VOID Rtn_Start_4083 ()
{

	/*************
	Ork zostaw mu smalltalk,¿e niby gada do siebie
	*************/

	TA_StandAround 	 (08,00,23,00,"MINE_PATH10");
	TA_SitAround 	 (23,00,08,00,"MINE_PATH10");
};

