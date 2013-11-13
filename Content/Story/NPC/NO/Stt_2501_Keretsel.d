instance STT_2501_Keretsel (Npc_Default)
{
	//orc: nie wiem jakie tam macie parametry przy cieniach wiêc musisz pozmieniac tutaj
	
	//-------- primary data --------
	name 		=		"Keretsel";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_GRD;
	level 		=		15;
	
	
	voice 		=		11;
	id 			=		2501;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	50;
	attribute[ATR_DEXTERITY] 		=	35;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    


	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,56headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_naked0",4,1,"Hum_Head_Pony",108,1,STT_ARMOR_H);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
    		
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
		
	EquipItem	(self,GRD_MW_01_short );
				
	CreateInvItems	(self,ItMiJoint_1,1);
	
	CreateInvItems	(self,ItFo_Potion_Health_01,2);
	CreateInvItems	(self,ItFo_Potion_Health_02,2);
	
	//------------- ai -------------
	B_InitNPCAddins(self);		
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2501;
};

FUNC VOID Rtn_start_2501 ()
{
	//ustaw go tam gdzie powinien byc.. ;)
	TA_Boss				(00,00,00,00,"OC1");
};


