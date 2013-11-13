func void B_CreateMiscInvItems (var C_NPC Owner,var int GrdType)//GrdTalents 1,2,3
{
	//-------- inventory --------
	var int MiscVariant;
	MiscVariant	= Hlp_Random (10);
	var int MiscAmountL;
	MiscAmountL	= Hlp_Random (3);
	var int MiscAmountM;
	MiscAmountM	= Hlp_Random (5);
	var int MiscAmountH;
	MiscAmountH	= Hlp_Random (7);
	var int MiscAmountVH;
	MiscAmountVH	= Hlp_Random (10);
//	EquipItem	(Owner, ItMw_1H_Sword_03);
//	EquipItem	(Owner, ItRw_Crossbow_01);
//	B_BugfixAmount	(Owner, ItAmBolt, 1);
//	CreateInvItem	(Owner, ItFoCheese);
//	CreateInvItem	(Owner, ItFoApple);
//	B_BugfixAmount	(Owner, ItMiNugget, 10);
//	CreateInvItem	(Owner, ItLsTorch);
   if (MiscVariant == 10)
   {
   //Hungry /MEN :D
   //	B_BugfixAmount	(Owner, ItAmBolt, 1);
      B_BugfixAmount	(Owner, ItFoCheese,1+Hlp_Random(5));
      B_BugfixAmount	(Owner, ItFoApple,1+Hlp_Random(3)*(1+Hlp_Random(3)));
      B_BugfixAmount	(Owner, ItFo_wineberrys_01,1+Hlp_Random(1)+1);
      B_BugfixAmount	(Owner, ItFoMutton,1+Hlp_Random(6)+3);
      B_BugfixAmount	(Owner, ItFoRice,Hlp_Random(2)+4);
      B_BugfixAmount	(Owner, ItFo_Potion_Water_01,1+Hlp_Random(5)+2);
      B_BugfixAmount	(Owner, ItMiNugget, (1+Hlp_Random(5))*(1+Hlp_Random(5)));
   }
   else if (MiscVariant == 9)
   {
   //Alcacholic
   //	B_BugfixAmount	(Owner, ItAmBolt, 1);
      B_BugfixAmount	(Owner, ItFoBooze,1+Hlp_Random(5)+1);
      B_BugfixAmount	(Owner, ItFoBeer,1+Hlp_Random(8));
      B_BugfixAmount	(Owner, ItFoWine,1+Hlp_Random(2));
      B_BugfixAmount	(Owner, ItMi_Alchemy_Alcohol_01,1+Hlp_Random(2));
      B_BugfixAmount	(Owner, ItFoRice,1+Hlp_Random(2));
      B_BugfixAmount	(Owner, ItFo_Potion_Water_01,1+Hlp_Random(3));
   }
   else if (MiscVariant == 8)
   {
   //Herb Eater//Z¿eracz :D
   //	B_BugfixAmount	(Owner, ItAmBolt, 1);
      B_BugfixAmount	(Owner, ItFo_Plants_Stoneroot_02,Hlp_Random(2));
      B_BugfixAmount	(Owner, ItFo_Plants_Herb_02,1+Hlp_Random(3));
      B_BugfixAmount	(Owner, ItFo_Plants_Herb_01,1+Hlp_Random(5));
      B_BugfixAmount	(Owner, ItFo_Potion_Water_01,1+Hlp_Random(3));
      B_BugfixAmount	(Owner, ItFo_Plants_mushroom_01,1+Hlp_Random(2));
   }
   else if (MiscVariant == 7)
   {
   //Weed Smoker
   //	B_BugfixAmount	(Owner, ItAmBolt, 1);
      B_BugfixAmount	(Owner, ItMiJoint_3,Hlp_Random(2));
      B_BugfixAmount	(Owner, ItMiJoint_2,1+Hlp_Random(2));
      B_BugfixAmount	(Owner, ItMiJoint_1,1+Hlp_Random(4));
      B_BugfixAmount	(Owner, ItFo_Plants_Herb_01,1+Hlp_Random(2));
      B_BugfixAmount	(Owner, ItMi_Stuff_Pipe_01,1);
      B_BugfixAmount	(Owner, ItMi_Plants_Swampherb_01,1+Hlp_Random(7));
   }
   else if (MiscVariant == 5)
   {
   //CashCollector
   //	B_BugfixAmount	(Owner, ItAmBolt, 1);
      B_BugfixAmount	(Owner, ItMiNugget, 1+Hlp_Random(70));
      B_BugfixAmount	(Owner, ItMi_Stuff_OldCoin_01, 1+Hlp_Random(16));
      B_BugfixAmount	(Owner, ItMi_Stuff_OldCoin_02, 1+Hlp_Random(12));
   }
   else if (MiscVariant == 4)
   {
   //Home Stuff + JEwelery
   //	B_BugfixAmount	(Owner, ItAmBolt, 1);
      B_BugfixAmount	(Owner, ItMi_Stuff_Mug_01, 1+Hlp_Random(2));
      B_BugfixAmount	(Owner, ItMi_Stuff_Amphore_01, 1+Hlp_Random(2));
      B_BugfixAmount	(Owner, ItMi_GoldCandleHolder, Hlp_Random(2));
      B_BugfixAmount	(Owner, ItMi_SilverRing,Hlp_Random(2));
      
      if(Hlp_Random(10)==0)
      {
         B_BugfixAmount	(Owner, ItMi_GoldChest,1);
      };
   }
   else if (MiscVariant == 3)
   {
   // Misc nr.1
   //	B_BugfixAmount	(Owner, ItAmBolt, 1);
      B_BugfixAmount	(Owner, ItMi_Stuff_Mug_01,Hlp_Random(2));
      B_BugfixAmount	(Owner, ItMiNugget, 1+Hlp_Random(65));
      B_BugfixAmount	(Owner, ItMi_SilverRing, Hlp_Random(2));
   }
   else if (MiscVariant == 2)
   {
   // Misc nr.2
   //	B_BugfixAmount	(Owner, ItAmBolt, 1);

      B_BugfixAmount	(Owner, ItMi_Stuff_Cup_01, 1+Hlp_Random(1));
      B_BugfixAmount	(Owner, ItMi_Stuff_Barbknife_01, 1);
      B_BugfixAmount	(Owner, ItFo_Potion_Health_01,  1+Hlp_Random(4));
      
      if (Hlp_Random(25)==0)
      {
         CreateInvItem	(Owner, ItFo_Potion_Strength_02);// Unique ;]
      };
      
      B_BugfixAmount	(Owner, ItFoMutton, 1+Hlp_Random(8));
   }
   else
   {
   // Misc nr.3
   //	B_BugfixAmount	(Owner, ItAmBolt, 1);
      B_BugfixAmount	(Owner, ItMiNugget,  1+Hlp_Random(120));
      B_BugfixAmount	(Owner, ItFoCheese,  1+Hlp_Random(2));
      B_BugfixAmount	(Owner, ItFoBeer,  1+Hlp_Random(5));
      
      if (MiscAmountL > 2)
      {
         CreateInvItem	(Owner, ItMw_1H_Sword_Long_04);//Unique SWD ;]//the Worst "Unique" :P
      };
      
      B_BugfixAmount	(Owner, ItFoWine, 1+Hlp_Random(2));
   };

   if (GrdType == 3)//CrossBowMan
   {
      if(Owner.id==2770)
      {
         B_BugfixAmount	(Owner, ItAmBluntBolt,  20+Hlp_Random(30));
      }
      else
      {
         B_BugfixAmount	(Owner, ItAmBolt,  20+Hlp_Random(30));
      };
   };
	//-------- inventory --------

//	EquipItem	(Owner, ItMw_1H_Sword_03);
//	EquipItem	(Owner, ItRw_Crossbow_01);
//	B_BugfixAmount	(Owner, ItAmBolt, 1);
//	CreateInvItem	(Owner, ItFoCheese);
//	CreateInvItem	(Owner, ItFoApple);
//	B_BugfixAmount	(Owner, ItMiNugget, 10);
//	CreateInvItem	(Owner, ItLsTorch);
};

