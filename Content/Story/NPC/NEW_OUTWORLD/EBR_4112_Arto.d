//TODO: Useless? 
/*
instance EBR_4112_Arto (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Arto";
	npctype 	= 	npctype_main;
   	guild 		=	GIL_GRD;
	level 		=	50;
	voice 		=	13;
	id 			=	4112;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 588;
	attribute[ATR_HITPOINTS] 	= 588;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",10,1,EBR_ARMOR_H2);

	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente --------  	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    
	CreateInvItem(self,Artos_Schwert);
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,Ring_des_Geschicks);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);		daily_routine = Rtn_start_4112;
};

FUNC VOID Rtn_start_4112 ()
{
	TA_HostileGuard    		(23,00,07,00,"DUNG_TRAP4");
	TA_HostileGuard    		(23,00,07,00,"DUNG_TRAP4");
};
*/