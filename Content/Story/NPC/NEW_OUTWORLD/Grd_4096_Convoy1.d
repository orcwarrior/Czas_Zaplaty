instance Grd_4096_Convoy1 (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Dowódca konwoju";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	25;
	voice 		=	11;
	id 			=	4096;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 420;
	attribute[ATR_HITPOINTS] 	= 420;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",14,2,GRD_ARMOR_H);
        
   B_Scale (self);
   Mdl_SetModelFatness(self,0);
    	
   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
   fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_04);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4096;
};

FUNC VOID Rtn_start_4096 ()
{
   TA_SmallTalk(06,00,21,00,"OW_PATH_056");
   TA_SmallTalk(21,00,06,00,"OW_PATH_056");	
};