instance SLD_751_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_MINE_GUARD;
	guild =					GIL_SLV;       
	level =					16;
	
	voice =					1;
	id =					751;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =	    55;
	attribute[ATR_MANA_MAX] =		 0;
	attribute[ATR_MANA] =			 0;
	attribute[ATR_HITPOINTS_MAX] =	232;
	attribute[ATR_HITPOINTS] =		232;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",50,2,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
			
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);

	//-------- inventory --------                                    

	EquipItem (self,MTR_MW_03);
	EquipItem (self,ItRw_Bow_Long_04);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,12);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,8);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
	
	

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMCstart_751;

};

FUNC VOID Rtn_FMCstart_751()
{
	TA_Guard	(01,00,13,00,"FMC_ENTRANCE");
	TA_Guard 	(13,00,01,00,"FMC_ENTRANCE");
};

FUNC VOID Rtn_NC1_751()
{
	TA_Guard	(01,00,13,00,"NC_MAINGATE_VWHEEL");
	TA_Guard 	(13,00,01,00,"NC_MAINGATE_VWHEEL");
};

FUNC VOID Rtn_NC2_751()
{
	TA_Guard	(01,00,13,00,"FMC_ENTRANCE");
	TA_Guard 	(13,00,01,00,"FMC_ENTRANCE");
};


FUNC VOID Rtn_NC3_751 ()
{
	TA_FollowPC		(02,00,14,00,"NC_PATH66");	
	TA_FollowPC		(14,00,02,00,"NC_PATH66");
};

FUNC VOID Rtn_NC4_751 ()
{
	TA_Guard		(02,00,14,00,"NC_PATH66");	
	TA_Guard		(14,00,02,00,"NC_PATH66");
};

FUNC VOID Rtn_NC5_751 ()
{
	TA_Guard		(02,00,14,00,"OC_ROUND_13");	
	TA_Guard		(14,00,02,00,"OC_ROUND_13");
};
