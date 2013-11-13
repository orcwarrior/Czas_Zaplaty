instance EBR_4444_Stern (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Stern";
	npctype 	= 	npctype_main;
   guild 		=	GIL_GRD;
	level 		=	80;
	voice 		=	13;
	id 			=	4444;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 220;
	attribute[ATR_DEXTERITY] 	= 170;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 788;
	attribute[ATR_HITPOINTS] 	= 788;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",15,1,EBR_ARMOR_H2);

	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente --------  	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------               
	EquipItem	(self,ItMw_1H_Sword_Bastard_04);	
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,Ring_des_Geschicks);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4444;
};

FUNC VOID Rtn_START_4444 ()
{
	TA_Boss    		(23,00,07,00,"STRAZNICA1");
	TA_Boss    		(23,00,07,00,"STRAZNICA1");
};