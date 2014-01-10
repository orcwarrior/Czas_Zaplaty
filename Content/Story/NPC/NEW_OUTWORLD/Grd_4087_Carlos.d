instance Grd_4087_Carlos (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Carlos";
	npctype 	= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	40;
	voice 		=	11;
	id 			=	4087;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 320;
	attribute[ATR_HITPOINTS] 	= 320;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",14,1,GRD_ARMOR_M);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Mdl_SetModelScale(self,1.0,1.0,1.0);

	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
			
	//-------- inventory --------                                    

	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,120);
	CreateInvItem	(self,ItLsTorch);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4087;
};

FUNC VOID Rtn_Start_4087 ()
{
	TA_Guard(07,00,20,00,"OW_PATH_07_21_GUARD_MIDDLE"); // stoi na stra?y wej?ciem na pola ry?owe
	TA_GuardPassage(20,00,07,00,"OW_PATH_07_21_GUARD_MIDDLE");
};

FUNC VOID Rtn_STAY_4087 ()
{
	TA_Guard(07,00,20,00,"NC_PATH49"); // czeka na Ricka, za bram?, kt?r? pilnuje Kil
	TA_Guard(20,00,07,00,"NC_PATH49");
};

FUNC VOID Rtn_Kociol_4087 ()
{
	TA_Guard(07,00,20,00,"NC_PATH75");
	TA_Guard(20,00,07,00,"NC_PATH75");
};

FUNC VOID Rtn_DEAD_4087 ()
{
	TA_Guard(07,00,20,00,"OW_ORC_LOOKOUT_2_02"); //tam gdzie ma le?e? martwy,gdzie? u orkow
	TA_Guard(20,00,07,00,"OW_ORC_LOOKOUT_2_02");
};

//FMC_FM_ENTRANCE
/***********************
Stoi na stra?y przed kopalni?

*************************/
