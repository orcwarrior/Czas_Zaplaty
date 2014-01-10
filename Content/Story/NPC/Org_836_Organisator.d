instance Org_836_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Organisator;
	Npctype =						Npctype_Ambient;
	guild =							GIL_SLV;       
	level =							4;
	
	voice =							13;
	id =							836;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",48 ,1,ORG_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
	
	Npc_SetTalentSkill (self,HACK_NPC_TALENT_SNEAK,1);	
	
	//-------- inventory --------                                    
	EquipItem (self,MTR_MW_01);
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,12);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoBooze,2);
	CreateInvItems (self,ItLsTorch,1);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Teeth_01);
	

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_836;

};

FUNC VOID Rtn_start_836 ()
{
	TA_Sleep		(00,00,07,30,"NC_HUT26_IN");	
	TA_SitCampfire	(07,30,00,00,"NC_PATH17_MOVEMENT2");	
};

FUNC VOID Rtn_NC1_836 ()
{
	TA_Guard		(00,00,07,30,"NC_KDW05+06_OUT");	
	TA_Guard	(07,30,00,00,"NC_KDW05+06_OUT");	
};


FUNC VOID Rtn_NC2_836 ()
{
	TA_Sleep		(00,00,07,30,"NC_HUT26_IN");	
	TA_SitCampfire	(07,30,00,00,"NC_PATH17_MOVEMENT2");	
};






