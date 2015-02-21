instance SLV_901_Horatio (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Horacy";
	npctype	 	=	NPCTYPE_AMBIENT; // mark - main->ambient
	guild 		=	GIL_SLV;      
	level 		=	10;
	voice 		= 	9;
	id 			=	901;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 45;
	attribute[ATR_DEXTERITY] 	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 136;
	attribute[ATR_HITPOINTS] 	= 136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh	,bdytex,skin,head mesh,1headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter",99,2,SMITH_ARMOR);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
		
	//-------- Talente --------                                    
	
		Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);		
	
	//-------- inventory --------                                    

		
		CreateInvItems (self,ItFoRice,5);
		CreateInvItem (self,ItMi_Stuff_Plate_01);
		CreateInvItem (self,ItFoBooze);
		EquipItem (self,ItMw_1H_Sledgehammer_01); 		
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_901;

};

FUNC VOID Rtn_start_901 ()
{
	TA_Sleep	(21,00,06,00,"NC_HUT04_IN");//CF3
	TA_Sleep	(06,00,09,00,"NC_HUT04_IN");//CF3
	TA_Smith_Fire	(09,00,09,10,"NC_PLACE01");
	TA_Smith_Anvil	(09,10,09,20,"NC_PLACE01");
	TA_Smith_Fire	(09,20,09,30,"NC_PLACE01");
	TA_Smith_Anvil	(09,30,09,40,"NC_PLACE01");
	TA_Smith_Cool	(09,40,09,50,"NC_PLACE01");
	TA_Smith_Anvil	(09,50,10,00,"NC_PLACE01");

	TA_Smith_Fire	(10,00,10,10,"NC_PLACE01");
	TA_Smith_Anvil	(10,10,10,20,"NC_PLACE01");
	TA_Smith_Fire	(10,20,10,30,"NC_PLACE01");
	TA_STAND		(10,30,11,00,"NC_HUT04_OUT");

          
	TA_Smith_Fire	(11,00,11,10,"NC_PLACE01");
	TA_Smith_Anvil	(11,10,11,20,"NC_PLACE01");
	TA_Smith_Fire	(11,20,11,30,"NC_PLACE01");
	TA_Smith_Anvil	(11,30,11,40,"NC_PLACE01");
	TA_Smith_Cool	(11,40,11,50,"NC_PLACE01");
	TA_Smith_Anvil	(11,50,12,00,"NC_PLACE01");


	TA_Smith_Anvil	(12,00,12,10,"NC_PLACE01");
	TA_STAND		(12,10,13,00,"NC_HUT04_OUT");
          
	TA_Smith_Fire	(13,00,13,10,"NC_PLACE01");
	TA_Smith_Anvil	(13,10,13,20,"NC_PLACE01");
	TA_Smith_Fire	(13,20,13,30,"NC_PLACE01");
	TA_Smith_Anvil	(13,30,13,40,"NC_PLACE01");
	TA_Smith_Cool	(13,40,13,50,"NC_PLACE01");
	TA_Smith_Anvil	(13,50,14,00,"NC_PLACE01");
           
	TA_Smith_Fire	(14,00,13,10,"NC_PLACE01");
	TA_Smith_Anvil	(14,10,13,20,"NC_PLACE01");
	TA_Smith_Fire	(14,20,13,30,"NC_PLACE01");
	TA_Smith_Anvil	(14,30,13,40,"NC_PLACE01");
	TA_Smith_Cool	(14,40,13,50,"NC_PLACE01");
	TA_Smith_Anvil	(14,50,15,00,"NC_PLACE01");      

	TA_Smith_Fire	(15,00,15,10,"NC_PLACE01");
	TA_Smith_Anvil	(15,40,15,50,"NC_PLACE01");
	TA_Smith_Fire	(15,50,16,00,"NC_PLACE01");
	TA_Smith_Anvil	(16,00,16,10,"NC_PLACE01");


	TA_Smith_Fire	(15,00,15,10,"NC_PLACE01");
	TA_Smith_Anvil	(15,10,15,20,"NC_PLACE01");
	TA_Smith_Fire	(15,20,15,30,"NC_PLACE01");
	TA_Smith_Anvil	(15,30,15,40,"NC_PLACE01");
	TA_Smith_Cool	(15,40,15,50,"NC_PLACE01");
 	TA_Smith_Anvil	(15,50,16,00,"NC_PLACE01");

	TA_Smith_Fire	(16,00,16,10,"NC_PLACE01");
	TA_Smith_Anvil	(16,10,16,20,"NC_PLACE01");
	TA_Smith_Fire	(16,20,16,30,"NC_PLACE01");
	TA_Smith_Anvil	(16,30,16,40,"NC_PLACE01");
	TA_Smith_Cool	(16,40,16,50,"NC_PLACE01");
	TA_Smith_Anvil	(16,50,17,00,"NC_PLACE01");
	TA_STAND		(17,00,18,00,"NC_PLACE01");
	TA_Smith_Fire	(18,00,18,10,"NC_PLACE01");
	TA_Smith_Anvil	(18,10,18,20,"NC_PLACE01");
	TA_Smith_Fire	(18,20,18,30,"NC_PLACE01");
	TA_Smith_Anvil	(18,30,18,40,"NC_PLACE01");
	TA_Smith_Cool	(18,40,18,50,"NC_PLACE01");
	TA_Smith_Anvil	(18,50,19,00,"NC_PLACE01");
	TA_Smith_Fire	(19,00,19,10,"NC_PLACE01");
	TA_Smith_Anvil	(19,10,19,20,"NC_PLACE01");
	TA_Smith_Fire	(19,20,19,30,"NC_PLACE01");
	TA_Smith_Anvil	(19,30,19,40,"NC_PLACE01");
	TA_Smith_Cool	(19,40,19,50,"NC_PLACE01");
	TA_Smith_Anvil	(19,50,20,00,"NC_PLACE01");
	TA_Smith_Fire	(20,00,20,10,"NC_PLACE01");
	TA_Smith_Anvil	(20,10,20,20,"NC_PLACE01");
	TA_Smith_Fire	(20,20,20,30,"NC_PLACE01");
	TA_Smith_Anvil	(20,30,20,40,"NC_PLACE01");
	TA_Smith_Cool	(20,40,20,50,"NC_PLACE01");
	TA_Smith_Anvil	(20,50,21,00,"NC_PLACE01");
	
};











