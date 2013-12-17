instance Non_20250_Grd (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Uciekinier";
	Npctype =				NPCTYPE_ROGUE;
	guild =					GIL_NONE;      
	level =					15;
	
	voice =					6;
	id =					20250;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	204;
	attribute[ATR_HITPOINTS] =		204;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	CreateInvItems (self,Lares_Axt,1);	 
	CreateInvItems (self,HEAD1_org,1);		 
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,13);
	CreateInvItems (self,ItFoRice,6);
	CreateInvItems (self,ItFoBooze,2);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,2);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Claws_01);
	EquipItem (self,ItMw_1H_Mace_03);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems (self,ItAmArrow,20);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_20250;
};

FUNC VOID Rtn_start_20250 ()
{
    TA_Guard		(13,00,14,00,"LOCATION_23_CAVE_1_IN");	
    TA_Guard		(14,00,13,00,"LOCATION_23_CAVE_1_IN");
};












