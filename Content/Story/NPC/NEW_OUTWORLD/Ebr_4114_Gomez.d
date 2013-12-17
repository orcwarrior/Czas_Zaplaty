instance EBR_4114_GomezD (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Gomez";
   npctype  	= 	npctype_main;
   guild 		=	GIL_GRD;
	level 		=	50;
	voice 		=	11;
	id 			=	4114;
	
	//-------- abilities --------
	
	attribute[ATR_STRENGTH] 	= 190;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 600;
	attribute[ATR_HITPOINTS] 	= 600;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",85,4,EBR_ARMOR_H);

	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
    	
   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	//-------- Talente --------  
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    
	CreateInvItem(self,Innos_Zorn);
	CreateInvItem (self,ItKe_Gomez_01);
	
	CreateInvItem (self,Amulett_der_Macht);
	CreateInvItem (self,Schutzring_Total2);
	
	//------------- ai -------------
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	/*B_InitNPCAddins(self);*/		daily_routine	=	Rtn_Start_4114;
};

/****************
Zrób mu rutynê z klêczeniem mo¿e xD

****************/

FUNC VOID Rtn_start_4114 ()
{
	TA_Stand	(00,00,08,00,"DUNG47");
	TA_Stand	(08,00,00,00,"DUNG47");
};
