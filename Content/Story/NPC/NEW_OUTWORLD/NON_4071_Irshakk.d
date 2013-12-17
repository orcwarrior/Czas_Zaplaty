/********************

Ork to ma byæ ork,zmieñ mu wygl¹da

*********************/


instance NON_4071_Irshakk (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Irshakk";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=	25;
	voice 		=	11;
	id 			=	4071;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 110;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 320;
	attribute[ATR_HITPOINTS] 	= 320;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",15,1,GRD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_02);
	CreateInvItem(self,BlowPerl);
	CreateInvItems	(self,ItAmArrow,15);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);
	CreateInvItem	(self,ItLsTorch);
	        
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_monstary_4071;
};


/***************Daj mu rutynê,¿eby tylko w nocy siê pokazywa³ w klasztorze
***************/


FUNC VOID Rtn_monstary_4071 ()
{
	TA_Guard		(22,00,04,00,"WP");//klasztor
	TA_Guard 	(04,00,22,00,"WP");//gdzieœ tam	
};
