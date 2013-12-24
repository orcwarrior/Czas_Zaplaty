func void B_GiveDeathInv ()
{
	//-------- Abfragen, ob die Trophy schon mal verteilt wurde --------
	if	(Npc_GetAivar(self,AIV_MM_DEATHINVGIVEN))
	{
		return;
	};

	//-------- Trophy ins Inventory packen --------
	if (Knows_GetTeeth == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_WOLF)||(Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_MIS_SNAFWOLF)
      {	
         CreateInvItems(self,ItAt_WolfTeeth,2);	
      };
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SNAPPER)     		{	CreateInvItems(self,ItAt_SnapperTeeth,4);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_ORCBITER)   			{	CreateInvItems(self,ItAt_BiterTeeth,4);	};	
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SHADOWBEAST)			{	CreateInvItems(self,ItAt_ShadTeeth,4);	};	
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_BLOODHOUND)			{	CreateInvItems(self,ItAt_BloodHoTeeth,4);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_RAZOR)				{	CreateInvItems(self,ItAt_RazorTeeth,4);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_WARAN)				{	CreateInvItems(self,ItAt_WaranTeeth,4);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_FIREWARAN)			{	CreateInvItems(self,ItAt_FireWaranTeeth,4);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_LURKER)				{	CreateInvItems(self,ItAt_LurkerTeeth,2);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_BLACKWOLF)			{	CreateInvItems(self,ItAt_OrcDogTeeth,2);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_ALIGATOR)			{	CreateInvItems(self,ItAt_AligatTeeth,2);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SWAMPSHARK)			{	CreateInvItems(self,ItAt_SwampshTeeth,	3); };	//Zähne eines Sumpfhais
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_TROLL)				{	CreateInvItems(self,ItAt_TrollTeeth,	2);	};	//Hauer eines Trolls
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_YOUNGTROLL)			{	CreateInvItems(self,ItAt_YoTroTeeth,	2);	};	//Hauer eines Younges Trolls		
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_KINGTROLL)			{	CreateInvItems(self,ItAt_KingTroTeeth,	2);	};	//Hauer eines Younges Trolls	
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_BLACKTROLL)||(Npc_GetAivar(self,AIV_MM_REAL_ID)==MIS_KIRABLACKTROLL)
      {	
         CreateInvItems(self, ItAt_BlackTroTeeth, 2);	
      };	//Hauer eines Younges Trolls					
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_ORC)					{	CreateInvItems(self,ItAt_OrcTeeth,	2);		};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_ALIGATORBOSS)		{	CreateInvItems(self,ItAt_BossAlgTeeth,	4);		};	
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_DIRK)		{	CreateInvItems(self,ItAt_DirkTeeth,	4);		};	
	};

	if (Knows_GetClaws == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_WARAN)				{	CreateInvItems(self,ItAt_WaranClaws,4);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_FIREWARAN)			{	CreateInvItems(self,ItAt_FireWaranClaws,4);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SNAPPER)   			{	CreateInvItems(self,ItAt_SnapperClaws,2);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_RAZOR)				{	CreateInvItems(self,ItAt_RazorClaws,2);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_ORCBITER)    		{	CreateInvItems(self,ItAt_BiterClaws,2);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_LURKER)				{	CreateInvItems(self,ItAt_LurkerClaws,2);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_WOLF)||(Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_MIS_SNAFWOLF)					
      {	
         CreateInvItems(self, ItAt_WolfClaws, 2);	
      };		
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_BLOODHOUND)			{	CreateInvItems(self,ItAt_BloodHoundClaws,2);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SHADOWBEAST)			{	CreateInvItems(self,ItAt_ShadClaws,4);	};	
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_BLACKWOLF)			{	CreateInvItems(self,ItAt_OrcDogClaws,2);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_ALIGATOR)			{	CreateInvItems(self,ItAt_AligatClaws,4);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_DIRK)			{	CreateInvItems(self,ItAt_DirkClaws,		4); };
	};
	
	if (Knows_GetWTF == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SHADOWBEAST)			{	CreateInvItems(self,ItAt_WTF,1);	};
	};
   
	if (Knows_GetWool == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SHEEP)			{	CreateInvItems(self,ItMa_Wool,2);	};
	};
   
	if (Knows_GetMCThread == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_MINECRAWLER)			{	CreateInvItems(self,ItMa_ClawlerThread,3);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_MINECRAWLERWARRIOR)	{	CreateInvItems(self,ItMa_ClawlerThread,2);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_MINECRAWLERQUEEN)	{	CreateInvItems(self,ItMa_ClawlerThread,15);	};		
	};	
   
	if (Knows_GetFur == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_WOLF)||(Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_MIS_SNAFWOLF)					
      {	
         CreateInvItems(self, ItAt_WolfSkin, 1);
      };
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_BLACKWOLF)			{	CreateInvItems(self,ItAt_WolfSkin2,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SHADOWBEAST)			{	CreateInvItems(self,ItAt_ShadowSkin,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_TROLL)				{	CreateInvItems(self,ItAt_TrollSkin,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_YOUNGTROLL)			{	CreateInvItems(self,ItAt_YoTroSkin,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_BLACKTROLL)			{	CreateInvItems(self,ItAt_BlackTroSkin,	1);	};						
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_KINGTROLL)			{	CreateInvItems(self,ItAt_KingTroSkin,	1);	};						
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_BLOODHOUND)			{	CreateInvItems(self,ItAt_BloodhoundSkin,1);	};
	};

	if (Knows_GetHide == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_LURKER)				{	CreateInvItems(self,ItAt_LurkerSkin,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SWAMPSHARK)			{	CreateInvItems(self,ItAt_SwampsharkSkin,1); };
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SNAPPER)   			{	CreateInvItems(self,ItAt_SnapperSkin,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_RAZOR)				{	CreateInvItems(self,ItAt_RazorSkin,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_WARAN)				{	CreateInvItems(self,ItAt_WaranSkin,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_FIREWARAN)			{	CreateInvItems(self,ItAt_FireWSkin,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_ALIGATOR)			{	CreateInvItems(self,ItAt_AligatSkin,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_ORCBITER)    		{	CreateInvItems(self,ItAt_BiterSkin,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_DIRK)			{	CreateInvItems(self,ItAt_DirkSkin,		1); };
	};
	
	if (Knows_GetMCMandibles == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_MINECRAWLER)			{	CreateInvItems(self,ItAt_Crawler_01,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_MINECRAWLERWARRIOR)	{	CreateInvItems(self,ItAt_Crawler_01,1);	};
	};
	
	if (Knows_GetMCPlates == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_MINECRAWLERWARRIOR)	{	CreateInvItems(self,ItAt_CrawlerPlate,2);	};
	};
	
	if (Knows_GetBFSting == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_BLOODFLY)			{	CreateInvItems(self,ItAt_Bloodfly_02,1);};
	};
   
	if (Knows_GetWings == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_BLOODFLY)			{	CreateInvItems(self,ItAt_BloodflyWings,2);};
	};	
   
	if (Knows_GetHorn == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SHADOWBEAST)			{	CreateInvItems(self,ItAt_Shadow_02,		1); };	//Horn eines Shadowbeasts
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_DIRK)			{	CreateInvItems(self,ItAt_DS_Horn,		4); };	//Horn eines Shadowbeasts
	};
   
	if (Knows_GetTongue== TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_FIREWARAN)			{	CreateInvItems(self,ItAt_FWaranTongue,	1);	};	//Zunge eines Feuerwarans
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_WARAN)				{	CreateInvItems(self,ItAt_WaranTongue,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_DRACONIANSCOUT
		||  Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_DRACONIANSOLIDER
		||  Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_DRACONIANOFFICER) 	{	CreateInvItems(self,ItAt_DraconianTongue,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_DEMON)				{	CreateInvItems(self,ItAt_DemonTongue,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_DEMONLORD)			{	CreateInvItems(self,ItAt_DemonLordTongue,1);	};
	};	
   
	if (Knows_GetHeart== TRUE)
	{      
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_STONEGOLEM)			{	CreateInvItems(self,ItAt_StoneGolem_01,	1);	};	//Zunge eines Feuerwarans
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_FIREGOLEM)				{	CreateInvItems(self,ItAt_FireGolem_01,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_ICEGOLEM)			{	CreateInvItems(self,ItAt_IceGolem_01,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_DEMON)			{	CreateInvItems(self,ItAt_DemonHeart,1);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_DEMONLORD)	
		{	
         CreateInvItems(self,ItAt_DemonLordHeart,1);	
      };
	};		
   
	if (Knows_GetLiver == TRUE)
	{
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_MOLERAT)			
		{	
			//exception: Snaf molerats (they have 50 bl prot)
			if(self.protection	[PROT_BLUNT]!=50)
			{
				CreateInvItems(self,ItAt_WatMRat,	1);	
			};
		};
	};	
   
	if (Knows_GetFeather == TRUE)
	{	
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_HARPIE)			{	CreateInvItems (self, ItAt_HarFeather,20);	};
		if (Npc_GetAivar(self,AIV_MM_REAL_ID)==ID_SCAVENGER)			{	CreateInvItems (self, ItAt_ScaFeather,10);	};
	};
	//-------- Merken --------
	Npc_SetAivar(self,AIV_MM_DEATHINVGIVEN,  TRUE);
};


