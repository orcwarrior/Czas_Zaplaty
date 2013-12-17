instance Grd_2513_Kasacz (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"K¹sacz";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	50;
	voice 		=	11;
	id 			=	2513;


	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",13,1,EBR_ARMOR_H2);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Mdl_SetModelScale(self,1.2,1.2,1.2);

	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  

	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    

	EquipItem	(self,ItMw_1H_Sword_Bastard_03);
	CreateInvItems(self,ItFo_Potion_Health_03,4);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_2513;
};


FUNC VOID Rtn_Start_2513 ()
{
	TA_Guard		    (07,00,20,00,"OW_PATH_224");
	TA_Guard		    (20,00,07,00,"OW_PATH_224");
};

FUNC VOID Rtn_Attack_2513 ()
{
	TA_HostileGuard		    (07,00,20,00,"OW_PATH_225");
	TA_HostileGuard		    (20,00,07,00,"OW_PATH_225");
};