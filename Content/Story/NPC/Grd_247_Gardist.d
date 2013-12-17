instance Grd_247_Gardist (Npc_Default)
{
	//-------- primary data --------
	//When Hero Runs - headshoot
	name 		=	NAME_Gardist;
	npctype		=	NPCTYPE_GUARD;
	guild 		=	GIL_DMB;
	level 		=	15;
	voice 		=	7;
	id 			=	247;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 140;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Fighter",1,1,GRD_ARMOR_M);

	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_03);
	CreateInvItem	(self,ItFoBeer);
	CreateInvItem	(self,ItFoWine);
	CreateInvItems	(self,ItMiNugget,50);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_247;
};

FUNC VOID Rtn_start_247 ()
{
    TA_Stay	(00,30,20,00,"OCC_CELLAR_SECOND_ROOM");	//2/3
    TA_Stay		(20,00,07,00,"OCC_CELLAR_SECOND_ROOM"); //CF1
};


FUNC VOID Rtn_DEAD_247 ()
{
	TA_Stay		(05,00,10,00,"INVISIBLE2");
	TA_Stay 	(10,00,05,00,"INVISIBLE2");

};