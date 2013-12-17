instance ORG_873_Cipher (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Cipher";
	Npctype =				Npctype_Main;
	guild =					GIL_GRD;      
	level =					8;
	voice =					12;
	id =					873;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,32hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",90,2,ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	//-------- inventory --------   
	CreateInvItems (self,ItKeLockpick,3);		
	CreateInvItems(self,ItMiNugget,500);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItAt_Claws_01);
	EquipItem (self,ItMw_1H_Mace_03);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems (self,ItAmArrow,20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_873;
};

FUNC VOID Rtn_start_873 ()
{
    TA_StandAround		(22,00,08,00,"FM_138");
    TA_StandAround		(08,00,22,00,"FM_138");
};

FUNC VOID Rtn_Pick_873 ()
{
	TA_PickOre		(00,00,23,00,"FM_105");
	TA_PickOre		(23,00,24,00,"FM_105");
};
