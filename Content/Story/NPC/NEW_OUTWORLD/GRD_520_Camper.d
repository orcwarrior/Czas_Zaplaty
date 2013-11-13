instance GRD_520_Camper (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Stra¿nik";
	npctype =						npctype_main;
	guild =							GIL_DMB;      
	level =							10;
	
	
	voice =							1;
	id =							520;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		53;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	124;
	attribute[ATR_HITPOINTS] =		124;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Thief",68,2,GRD_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	

	//-------- Talents --------                                    

	
	//-------- inventory --------                                    

	EquipItem (self,GRD_MW_01_short);
	CreateInvItem (self,ItFoApple);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_520;
	};

FUNC VOID Rtn_start_520 ()
{
	TA_SitCampfire 	(10,00,22,00,"OC_ROUND_22_CF_1");
	TA_SitCampfire 	(10,00,22,00,"OC_ROUND_22_CF_1");
};















