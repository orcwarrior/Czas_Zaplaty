func void B_SetDificult(var C_NPC Guard , var int GrdTalents, var int GrdDificult)//GrdClass 1,2,3
{
	Guard.level 		= 	GrdDificult-15;
	if(Guard.level<1){Guard.level 		= 1;};

	//-- abilities --------
	Guard.attribute[ATR_STRENGTH] 	= GrdDificult+20;
	Guard.attribute[ATR_DEXTERITY] 	= GrdDificult+20;
	Guard.attribute[ATR_MANA_MAX] 	= 0;
	Guard.attribute[ATR_MANA] 		= 0;
	Guard.attribute[ATR_HITPOINTS_MAX]= Guard.level*12+80;//80=StartHp+12HP each level
	Guard.attribute[ATR_HITPOINTS] 	= Guard.level*12+80;
	
	Guard.protection	[PROT_EDGE]		=		GrdDificult/5;
	Guard.protection	[PROT_BLUNT]	=		GrdDificult/5;
	Guard.protection	[PROT_POINT]	=		GrdDificult/8;
	Guard.protection	[PROT_FIRE]		=		GrdDificult/6;
	Guard.protection	[PROT_MAGIC]	=		GrdDificult/10;	
	
   const int grd_difficult_level = GrdDificult/2+25;
   
	if (grd_difficult_level > 80)
	{
      Mdl_SetModelFatness(Guard,2.5);
	}
	else if (grd_difficult_level > 60)
	{
      Mdl_SetModelFatness(Guard,2);
	}
	else if (grd_difficult_level > 40)
	{
      Mdl_SetModelFatness(Guard,1);
	}
	else
	{
      Mdl_SetModelFatness(Guard,0.8);
	};
    	
   Npc_SetAivar(Guard,AIV_IMPORTANT,  TRUE);
		
	Guard.senses			=	SENSE_HEAR | SENSE_SEE ;
	Guard.senses_range	=	2000;		//SN: am 30.11.00 von 15m auf 20m erhöht (WICHTIG für Profilings!)       	
   
   var int value_talent_1h;
   var int value_talent_2h;
   var int value_talent_crossbow;
   var int first_talent;
   var int second_talent;
   var int range_difficult;
   var int range_difficult2;
   
	if (GrdTalents == 3)//CrossBowMan
	{
    	Guard.fight_tactic	=	FAI_HUMAN_RANGED;

      //-------- Talente -------- 
      value_talent_1h = GrdDificult/2;
      value_talent_2h = GrdDificult/2;
      value_talent_crossbow = 3*GrdDificult/2;
	
      first_talent = NPC_TALENT_CROSSBOW;
      second_talent = NPC_TALENT_1H;
      range_difficult = 35;
      range_difficult2 = 17;
	} ////////////////////////////////////////////////2h Fighter
	else if (GrdTalents == 2)
	{
    	Guard.fight_tactic	=	FAI_HUMAN_STRONG;
	
      if (GrdDificult > 45)
      {
         Guard.fight_tactic	=	FAI_HUMAN_MASTER;
      };
      
      value_talent_1h = GrdDificult;
      value_talent_2h = GrdDificult;
      value_talent_crossbow = GrdDificult/2;
	
      first_talent = NPC_TALENT_2H;
      second_talent = NPC_TALENT_1H;
      range_difficult = 45;
      range_difficult2 = 22;
	
      Guard.attribute[ATR_STRENGTH] = 3*Guard.attribute[ATR_STRENGTH]/2;	
	}
	else//GrdTalents=1
	{
      Guard.fight_tactic	=	FAI_HUMAN_STRONG;
	
      if (GrdDificult > 40)
      {
         Guard.fight_tactic	=	FAI_HUMAN_MASTER;
      };
      
      value_talent_1h = 3*GrdDificult/2;
      value_talent_2h = GrdDificult;
      value_talent_crossbow = GrdDificult/2;
	
      first_talent = NPC_TALENT_1H;
      second_talent = NPC_TALENT_2H;
      range_difficult = 35;
      range_difficult2 = 22;
	};
   
   /*Npc_SetTalentValue(Guard, NPC_TALENT_1H, value_talent_1h);
   Npc_SetTalentValue(Guard, NPC_TALENT_2H, value_talent_2h);
   Npc_SetTalentValue(Guard, NPC_TALENT_CROSSBOW, value_talent_crossbow);	*/

   if (GrdDificult > range_difficult)
   {
      Npc_SetTalentSkill (Guard, first_talent,2); 
      Npc_SetTalentSkill (Guard, second_talent,1); 	
   }
   else if (GrdDificult > range_difficult2)
   {
      Npc_SetTalentSkill (Guard, first_talent, 1); 
   }
   else
   {
      Npc_SetTalentSkill (Guard, first_talent, 0); 	
   };
   
   Npc_SetTalentValue	(Guard, NPC_TALENT_BOW, 0);
   Npc_SetTalentValue	(Guard, NPC_TALENT_PICKLOCK, 90);
   Npc_SetTalentValue	(Guard, NPC_TALENT_PICKPOCKET, 90);	
      
	//exceptions
	if(guard.id==2770)
	{
      guard.fight_tactic = FAI_HUMAN_BATTLE;	
	};
};
