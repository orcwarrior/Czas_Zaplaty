instance ORG_1833_BusterBrother (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Bosto";
	Npctype =						Npctype_Main;
	guild =							GIL_SLV;      
	level =							198;
	
	voice =							2;
	id =							1833;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		40;
	attribute[ATR_DEXTERITY] =		45;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	288;
	attribute[ATR_HITPOINTS] =		288;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",39,2,ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);	
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente --------                                    
	
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,13);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoBooze,4);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,16);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItAt_Claws_01);
	EquipItem (self,MTR_RW_01);
	CreateInvItems (self,ItAmArrow,10);
	EquipItem 		(self,ItMw_1H_HSword_Short_10);
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_1833;

};

FUNC VOID Rtn_Start_1833 ()
{
    TA_Sleep		(03,30,07,30,"NC_HUT30_IN");
    TA_PracticeSwordBB	(07,30,01,01,"NC_HUT30_OUT");
   TA_HSmallTalk		(01,01,03,30,"NC_HUT30_IN");
};










