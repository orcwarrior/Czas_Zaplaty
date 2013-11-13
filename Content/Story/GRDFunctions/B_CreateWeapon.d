func void B_CreateWeapon (var C_NPC NpcUser,var int GrdWeaponType,var int GrdDifcult)//GrdTalents 1,2,3
{
	var int str_req; var int dex_req;
	//////////////////////////////////////////////////////////////////////////////
	//CROSSBOW MAN  WEAPONS
	/////////////////////////////////////////////////////////////////////////////	
 	if (GrdWeaponType == 3)//CrossBowMan
	{
      if (GrdDifcult*(3/2)+25 > 25+(3/2)*70)
      {
         EquipItem	(NpcUser, GRD_RW_02);	
      
         if(npcuser.id==2770)
         {	
            CreateInvItems(npcuser,ItAmBluntBolt,10);
         }
         else
         {
            CreateInvItems(npcuser,ItAmBolt,20);
         };
      
         dex_req = 90;
         EquipItem	(NpcUser, GRD_MW_02);	
         str_req = 60;
      }
      else
      {
         EquipItem	(NpcUser, GRD_RW_01);
      
         if(npcuser.id==2770)
         {	
            CreateInvItems(npcuser,ItAmBluntBolt,10);
         }
         else
         {
            CreateInvItems(npcuser,ItAmBolt,20);
         };	
      
         dex_req = 50;	
         EquipItem	(NpcUser, GRD_MW_01);	
         str_req = 27;	
      };
	}
	//////////////////////////////////////////////////////////////////////////////
	// 2H FIGHTER WEAPONS
	/////////////////////////////////////////////////////////////////////////////
	else if (GrdWeaponType == 2)//2hFighter
	{
      if (GrdDifcult*(3/2)+25 > 25+(3/2)*55)//5%
      {
			EquipItem	(NpcUser, GRD_MW_04);		
			str_req = 90;
      }
      else
      {
			EquipItem	(NpcUser, GRD_MW_03);		
			str_req = 75;	
      };
   }	
	//////////////////////////////////////////////////////////////////////////////
	// 1H FIGHTER WEAPONS
	/////////////////////////////////////////////////////////////////////////////	
	else
	{
      if (GrdDifcult*(3/2)+25 > 25+(3/2)*35)//5%
      {
			EquipItem	(NpcUser, GRD_MW_02);	
			str_req = 60;
      }
      else
      {
			EquipItem	(NpcUser, GRD_MW_01);
			str_req = 27;			
      };
	};	
/*	else
	{
		var int ShortoneH_WDRnd;
	ShortoneH_WDRnd  = Hlp_Random (100);//5swd
		if (ShortoneH_WDRnd > 25+(3/2)*85)
		{
		EquipItem	(NpcUser, ItMw_1H_Sword_Short_05);	
		}
		else if (ShortoneH_WDRnd > 25+(3/2)*70)
		{
		EquipItem	(NpcUser, ItMw_1H_Sword_Short_04);	
		}	
		else if (ShortoneH_WDRnd > 25+(3/2)*50)
		{
		EquipItem	(NpcUser, ItMw_1H_Sword_Short_03);	
		}	
		else if (ShortoneH_WDRnd > 25+(3/2)*30)
		{
		EquipItem	(NpcUser, ItMw_1H_Sword_Short_02);	
		}			
		else
		{
		EquipItem	(NpcUser, ItMw_1H_Sword_Short_01);	
		};	
	};*/
	if(npcuser.attribute[ATR_STRENGTH] < str_req)
	{
      npcuser.attribute[ATR_STRENGTH] = str_req;	
	};
	if(npcuser.attribute[ATR_DEXTERITY] < dex_req)
	{
      npcuser.attribute[ATR_DEXTERITY] = dex_req;	
	};	
};

