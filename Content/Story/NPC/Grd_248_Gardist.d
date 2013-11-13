instance Grd_248_Gardist (Npc_Default)
{
	//-------- primary data --------
	//Chase Hero
	name 		=	NAME_Gardist;
	npctype		=	NPCTYPE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	7;
	id 			=	248;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 105;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 260;
	attribute[ATR_HITPOINTS] 	= 260;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",57,1,GRD_ARMOR_M);

	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoBeer);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_248;
};

FUNC VOID Rtn_start_248 ()
{
    TA_MIS_ChaseHero	(00,30,20,00,"OCR_GATE_SQUARE");	//
    TA_MIS_ChaseHero		(20,00,07,00,"OCR_GATE_SQUARE"); //
};


FUNC VOID Rtn_DEAD_248 ()
{
	TA_Stay		(05,00,10,00,"INVISIBLE2");
	TA_Stay 	(10,00,05,00,"INVISIBLE2");

};