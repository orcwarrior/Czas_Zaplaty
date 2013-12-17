instance Grd_1245_Cad (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Cad";
	npctype		= 	npctype_ambient;
	guild 		=	GIL_GRD;
	level 		=	50;
	voice		=	7;
	id 			=	1245;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 380;
	attribute[ATR_HITPOINTS] 	= 380;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Psionic",2,1,GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,ItMw_2H_Sword_01);
	EquipItem	(self,ItRw_Crossbow_02);
	CreateInvItems	(self,ItAmBolt,10);
	CreateInvItem	(self,ItFoMutton);
	CreateInvItems	(self,ItMiNugget,90);
	CreateInvItem	(self,ItFo_Potion_Health_03);
	CreateInvItem	(self,ItLsTorch);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_1245;
};

FUNC VOID Rtn_start_1245 ()
{
	TA_Stand		(05,00,10,00,"OCR_OUTSIDESMALLTALK");
	TA_Guard		(10,00,10,30,"OCR_ARENABATTLE_OUTSIDE");
	TA_Guard		(10,30,11,00,"OCR_OUTSIDE_HUT_78");
	TA_Guard		(11,00,11,30,"OCR_OUTSIDE_HUT_65");
	TA_Guard		(11,30,12,00,"OCR_WASH_8");
	TA_Guard		(12,00,12,20,"ALEWIDOK!!!");
	TA_Guard		(12,20,12,40,"OCR_LAKE_4");
	TA_Guard		(12,40,13,00,"OCR_CAULDRON_2");
	TA_PracticeSword (13,00,16,00,"OCC_FIGHTTRAINING");
	TA_SmallTalk		(16,00,16,30,"OCR_OUTSIDE_HUT_36");
	TA_Guard		(16,30,17,00,"OCR_ARENABATTLE_OUTSIDE");
	TA_Guard		(17,00,17,30,"PRZYWISIELCU");
	TA_Guard		(17,30,18,00,"OCR_OUTSIDE_HUT_65");
	TA_Guard		(18,00,18,30,"OCR_WASH_8");
	TA_Guard		(18,30,19,00,"OCR_LAKE_4");
	TA_Guard		(19,00,19,30,"OCR_CAULDRON_2");
	TA_Teaching1h (19,30,22,00,"OCC_FIGHTTRAINING");
	TA_Sleep (22,00,03,00,"OCC_MERCS_LEFT_ROOM_BED6");

};

FUNC VOID Rtn_CHASE_1245 ()
{
	TA_MIS_ChaseHero		(05,00,10,00,"OCR_OUTSIDE_HUT_16");
	TA_MIS_ChaseHero (10,00,05,00,"OCR_OUTSIDE_HUT_16");

};
FUNC VOID Rtn_DEAD_1245 ()
{
	TA_Stay		(05,00,10,00,"INVISIBLE2");
	TA_Stay 	(10,00,05,00,"INVISIBLE2");

};