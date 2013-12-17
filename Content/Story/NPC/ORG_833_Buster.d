instance ORG_833_Buster (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Buster";
	Npctype =						Npctype_Main;
	guild =							GIL_SLV;      
	level =							14;
	voice =							2;
	id =							833;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		45;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	488;
	attribute[ATR_HITPOINTS] =		488;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",39,2,ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);	
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente --------                                    
	
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,13);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoBooze,4);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,2);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItAt_Claws_01);
	EquipItem 		(self,ItMw_1H_HSword_Short_08);
	EquipItem (self,ItRw_Bow_Small_04);
	CreateInvItems (self,ItAmArrow,40);
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_833;

};

FUNC VOID Rtn_PreStart_833 ()
{
   TA_Sleep		(03,30,07,30,"NC_HUT30_IN");
   TA_Teaching1h (07,30,01,01,"NC_HUT30_OUT");
   TA_HSmallTalk		(01,01,03,30,"NC_HUT30_IN");
};

FUNC VOID Rtn_Start_833 ()
{
   TA_SitAround	(23,00,10,00,"OW_PATH_056");
	TA_Stand(10,00,18,00,"PATH_AROUND_HILL03");
   TA_Teaching1h (18,00,23,00,"PATH_AROUND_HILL02");
};

FUNC VOID Rtn_NC_833 ()
{
	TA_Stand(08,00,18,00,"OW_PATH_064");    
	TA_Stand(18,00,08,00,"OW_PATH_07_20");
};