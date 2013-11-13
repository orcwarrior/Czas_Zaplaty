instance Grd_4086_Pluskwa (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Pluskwa";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	20;
	voice 		=	11;
	id 			=	4086;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 60;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",23,1,GRD_ARMOR_M);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Mdl_SetModelScale(self,1.0,1.0,1.0);

	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
			
	//-------- inventory --------                                    

	EquipItem	(self,GRD_MW_01_short);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);
	CreateInvItem	(self,ItLsTorch);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4086;
};

FUNC VOID Rtn_Start_4086 ()
{
   /*****************
   Zawsze w pobli¿u Wilka,ma przeszkadzaæ w gadaniu
   ******************/

	TA_BOSS(07,00,20,00,"NC_PATH11");
	TA_BOSS(20,00,07,00,"NC_PATH11");
};

FUNC VOID Rtn_GO_4086 ()
{
   /*****************
   w tawernie
   ******************/

    TA_StandAround(08,00,21,00,"NC_TAVERN_BAR");
    TA_StandAround(21,00,08,00,"NC_TAVERN_BAR");
};

