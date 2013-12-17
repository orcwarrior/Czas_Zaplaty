instance Grd_631_Smith (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Kowal";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	12;
	id 			=	631;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 250;
	attribute[ATR_HITPOINTS] 	= 250;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",51,1,SMITH_ARMOR);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,1.5);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sledgehammer_01);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	CreateInvItem	(self,ItFoBeer);
	CreateInvItem	(self,ItLsTorch);
	CreateInvItem 		(self,ItMw_1H_Sledgehammer_01);

	CreateInvItems	(self,ItMiSwordRaw,1);
	CreateInvItems	(self,ItMiSwordRawHot,1);
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_631;
};

FUNC VOID Rtn_start_631 ()
{
	TA_Smith_Fire	(09,00,09,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(09,10,09,20,"NC_EN_SMITH_03");
	TA_Smith_Fire	(09,20,09,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(09,30,09,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(09,40,09,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(09,50,10,00,"NC_EN_SMITH_03");

	TA_Smith_Fire	(10,00,10,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(10,10,10,20,"NC_EN_SMITH_03");
	TA_Smith_Fire	(10,20,10,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(10,30,10,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(10,40,10,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(10,50,11,00,"NC_EN_SMITH_03");    
          
	TA_Smith_Fire	(11,00,11,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(11,10,11,20,"NC_EN_SMITH_03");
	TA_Smith_Fire	(11,20,11,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(11,30,11,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(11,40,11,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(11,50,12,00,"NC_EN_SMITH_03");


	TA_Smith_Anvil	(12,00,12,10,"NC_EN_SMITH_03");
	TA_Smith_Fire	(12,10,12,20,"NC_EN_SMITH_03");
	TA_Smith_Fire	(12,20,12,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(12,30,12,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(12,40,12,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(12,50,13,00,"NC_EN_SMITH_03");
          
	TA_Smith_Fire	(13,00,13,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(13,10,13,20,"NC_EN_SMITH_03");
	TA_Smith_Fire	(13,20,13,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(13,30,13,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(13,40,13,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(13,50,14,00,"NC_EN_SMITH_03");
           
	TA_Smith_Fire	(14,00,13,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(14,10,13,20,"NC_EN_SMITH_03");
	TA_Smith_Fire	(14,20,13,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(14,30,13,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(14,40,13,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(14,50,15,00,"NC_EN_SMITH_03");      

	TA_Smith_Fire	(15,00,15,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(15,40,15,50,"NC_EN_SMITH_03");
	TA_Smith_Fire	(15,50,16,00,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(16,00,16,10,"NC_EN_SMITH_03");


	TA_Smith_Fire	(15,00,15,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(15,10,15,20,"NC_EN_SMITH_03");
	TA_Smith_Fire	(15,20,15,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(15,30,15,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(15,40,15,50,"NC_EN_SMITH_03");
 	TA_Smith_Anvil	(15,50,16,00,"NC_EN_SMITH_03");

	TA_Smith_Fire	(16,00,16,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(16,10,16,20,"NC_EN_SMITH_03");
	TA_Smith_Fire	(16,20,16,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(16,30,16,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(16,40,16,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(16,50,17,00,"NC_EN_SMITH_03");
	TA_STAND		(17,00,18,00,"NC_EN_SMITH_CORNER");//with cavalorn 
	TA_Smith_Fire	(18,00,18,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(18,10,18,20,"NC_EN_SMITH_03");
	TA_Smith_Fire	(18,20,18,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(18,30,18,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(18,40,18,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(18,50,19,00,"NC_EN_SMITH_03");
	TA_Smith_Fire	(19,00,19,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(19,10,19,20,"NC_EN_SMITH_03");
	TA_Smith_Fire	(19,20,19,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(19,30,19,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(19,40,19,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(19,50,20,00,"NC_EN_SMITH_03");
	TA_Smith_Fire	(20,00,20,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(20,10,20,20,"NC_EN_SMITH_03");
	TA_Smith_Fire	(20,20,20,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(20,30,20,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(20,40,20,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(20,50,21,00,"NC_EN_SMITH_03");
    TA_Stand        (21,00,21,30,"NC_EN_SMITH_CORNER");
	TA_Smith_Fire	(21,30,21,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(21,40,21,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(21,50,22,00,"NC_EN_SMITH_03");
	TA_Stand		(22,00,22,30,"NC_EN_SMITH_CORNER"); 	
	TA_Smith_Fire	(22,00,20,30,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(22,30,22,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(22,40,22,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(22,50,23,00,"NC_EN_SMITH_03");
	TA_Smith_Fire	(23,30,23,40,"NC_EN_SMITH_03");
	TA_Smith_Fire	(23,40,23,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(23,50,00,00,"NC_EN_SMITH_03");	
	TA_Smith_Fire	(00,00,00,10,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(00,10,00,30,"NC_EN_SMITH_03");
	TA_Smith_Fire	(00,30,00,50,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(00,50,01,00,"NC_EN_SMITH_03");
	TA_Smith_Fire	(01,30,01,40,"NC_EN_SMITH_03");
	TA_Smith_Anvil	(01,40,01,50,"NC_EN_SMITH_03");
	TA_Smith_Fire	(01,50,02,00,"NC_EN_SMITH_03");		
	TA_Stand		(02,00,09,00,"NC_EN_SMITH_CORNER"); 		
	};



