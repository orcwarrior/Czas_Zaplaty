instance VLK_4000_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Zagubiony skazaniec";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							2;
	voice =							3;
	id =							4000;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		13;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",67,2,-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- inventory --------                                    

	EquipItem (self,ItMw_1h_Club_01);
	CreateInvItem (self,ItFoApple);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4000;
};

FUNC VOID Rtn_start_4000 ()
{
	/*******************
	Gdzieœ na pla¿y
	********************/

	TA_SitCampfire	(08,00,20,00,"OW_PIR_CAMPFIRE");
	TA_SitCampfire		(20,00,08,00,"OW_PIR_CAMPFIRE");
};
