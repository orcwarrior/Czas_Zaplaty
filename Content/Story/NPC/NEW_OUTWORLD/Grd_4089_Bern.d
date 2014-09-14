instance Grd_4089_Bern (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Bern";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	30;
	voice 		=	11;
	id 			=	4089;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 380;
	attribute[ATR_HITPOINTS] 	= 380;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",11,1,GRD_ARMOR_M);
        
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
	EquipItem	(self,GRD_MW_02U);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,24);
	CreateInvItem	(self,ItLsTorch);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4089;
};

FUNC VOID Rtn_Start_4089 ()
{
	/*****************
	stoi na stra?y wej?cia do kopalni zamiast Carlosa
	******************/

	TA_Guard(07,00,20,00,"FMC_FM_ENTRANCE");
	TA_Guard(20,00,07,00,"FMC_FM_ENTRANCE");
};

FUNC VOID Rtn_GO_4089 ()
{
	TA_RunToWP(07,00,20,00,"NC_PATH70");
	TA_RunToWP(20,00,07,00,"NC_PATH70");
};

