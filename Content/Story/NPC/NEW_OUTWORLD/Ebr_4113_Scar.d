instance EBR_4113_Scar (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Blizna";
	npctype 	= 	npctype_main;
	guild 		=	GIL_SLV;
	level 		=	80;
	voice 		=	8;
	id 			=	4113;


	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 125;
	attribute[ATR_DEXTERITY] 	= 85;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 550;
	attribute[ATR_HITPOINTS] 	= 550;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",79,1,EBR_ARMOR_H2);
        
    	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    
	CreateInvItem(self,Scars_Schwert);
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,ItRw_Crossbow_04);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4113;
};


FUNC VOID Rtn_start_4113 ()
{
	TA_Guard		    (07,00,20,00,"DUNG_TRAP4");
	TA_Guard		    (20,00,07,00,"DUNG_TRAP4");
};