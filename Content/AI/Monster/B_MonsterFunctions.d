//////////////////////////////////////////////////////////////////////////
//	B_SetMonsterLevel
//	==================
//	Set Monster Level & Attidutes
//	June 06, 2007 - Only HP 2x(NPC HP x2) and prot 125% + str *1,5
//////////////////////////////////////////////////////////////////////////
func void B_SetMonsterLevel ()
{
	var int n;	
/*	if (self.level+n < Npc_GetAivar(self,AIV_MM_MAXLEVEL))||(Npc_GetAivar(self,AIV_MM_MAXLEVEL)%1 != 0)
	{
	self.level = self.level+n;
//---------------------------------------------------------
	var int allatt;
	allatt = self.attribute[ATR_STRENGTH]+self.attribute[ATR_STRENGTH]*self.attribute[ATR_DEXTERITY]+self.attribute[ATR_HITPOINTS_MAX]+self.attribute[ATR_MANA_MAX];
	self.attribute	[ATR_STRENGTH]		=	self.attribute	[ATR_STRENGTH]+n*(self.attribute	[ATR_STRENGTH]/allatt);
*/
//	self.attribute	[ATR_STRENGTH]		=	self.attribute	[ATR_STRENGTH]*4/3;
//	self.attribute	[ATR_STRENGTH]		-=	(self.attribute	[ATR_STRENGTH]%1);//round
/*
	self.attribute	[ATR_DEXTERITY]		=	self.attribute	[ATR_DEXTERITY]+n*(self.attribute	[ATR_DEXTERITY]/allatt);
	self.attribute	[ATR_DEXTERITY]		=	self.attribute	[ATR_DEXTERITY]-(self.attribute	[ATR_DEXTERITY]%1);	

	self.attribute	[ATR_HITPOINTS_MAX]		=	self.attribute	[ATR_HITPOINTS_MAX]+n*(self.attribute	[ATR_HITPOINTS_MAX]/allatt);
*/
	self.attribute	[ATR_HITPOINTS_MAX]		=	self.attribute	[ATR_HITPOINTS_MAX]*3;	
	self.attribute	[ATR_HITPOINTS]		=	self.attribute	[ATR_HITPOINTS_MAX];
	self.attribute	[ATR_STRENGTH]		=	(self.attribute	[ATR_STRENGTH]*3)/4;
	self.attribute	[ATR_STRENGTH]		-=	self.attribute	[ATR_STRENGTH]%1;
/*	self.attribute	[ATR_HITPOINTS]		=	self.attribute	[ATR_HITPOINTS_MAX]-(self.attribute	[ATR_HITPOINTS_MAX]%1);	
	
	self.attribute	[ATR_MANA_MAX]		=	self.attribute	[ATR_MANA_MAX]+n*(self.attribute	[ATR_MANA_MAX]/allatt);
	self.attribute	[ATR_MANA_MAX]		=	self.attribute	[ATR_MANA_MAX]-(self.attribute	[ATR_MANA_MAX]%1);	
	
	self.attribute	[ATR_MANA]		=	self.attribute	[ATR_MANA_MAX]+n*(self.attribute	[ATR_MANA_MAX]/allatt);
	self.attribute	[ATR_MANA]		=	self.attribute	[ATR_MANA_MAX]-(self.attribute	[ATR_MANA_MAX]%1);
//---------------------------------------------------------
	var int allprot;
	allprot = self.protection[PROT_BLUNT]+self.protection[PROT_EDGE]+fgself.protection[PROT_POINT]*self.protection[PROT_FIRE]*self.protection[PROT_FLY]*self.protection[PROT_MAGIC];
*/	
	self.protection	[PROT_BLUNT]	=	self.protection	[PROT_BLUNT]*5/4-(self.protection	[PROT_EDGE]%1);
	self.protection	[PROT_EDGE]		=	self.protection	[PROT_EDGE]*5/4-(self.protection	[PROT_EDGE]%1);		
	self.protection	[PROT_POINT]	=	self.protection	[PROT_POINT]*5/4-(self.protection	[PROT_POINT]%1);
	self.protection	[PROT_FIRE]		=	self.protection	[PROT_FIRE]*5/4-(self.protection	[PROT_FIRE]%1);
	self.protection	[PROT_FLY]		=	self.protection	[PROT_FLY]*5/4-(self.protection		[PROT_FLY]%1);		
	self.protection	[PROT_MAGIC]	=	self.protection	[PROT_MAGIC]*5/4-(self.protection	[PROT_MAGIC]%1);	
	
	//Power up zombies, they slow as FUCK!
	if(self.guild == GIL_ZOMBIE)
	{
	self.attribute	[ATR_HITPOINTS_MAX]	=	self.attribute	[ATR_HITPOINTS_MAX]*2;	
	self.attribute	[ATR_HITPOINTS]		=	self.attribute	[ATR_HITPOINTS_MAX];
	self.attribute	[ATR_STRENGTH]		=	self.attribute	[ATR_STRENGTH]*2;
	};
/*	}
	else
	{
	n = Npc_GetAivar(self,AIV_MM_MAXLEVEL)-self.level;
	self.level = self.level+n;
//---------------------------------------------------------
	self.attribute	[ATR_STRENGTH]		=	self.attribute	[ATR_STRENGTH]+self.attribute	[ATR_STRENGTH]*n;
	self.attribute	[ATR_DEXTERITY]		=	self.attribute	[ATR_DEXTERITY]+self.attribute	[ATR_DEXTERITY]*n;
	
	self.attribute	[ATR_HITPOINTS_MAX]	=	self.attribute	[ATR_HITPOINTS_MAX]+self.attribute	[ATR_HITPOINTS_MAX]*n;
	self.attribute	[ATR_HITPOINTS]		=	self.attribute	[ATR_HITPOINTS]+self.attribute	[ATR_HITPOINTS]*n;

	self.attribute	[ATR_MANA_MAX] 		=	self.attribute	[ATR_MANA_MAX]+self.attribute	[ATR_MANA_MAX]*n;
	self.attribute	[ATR_MANA] 			=	self.attribute	[ATR_MANA]+self.attribute	[ATR_MANA]*n;
//---------------------------------------------------------
	self.protection	[PROT_BLUNT]		=	self.protection	[PROT_BLUNT]+(self.protection	[PROT_BLUNT]*n)/2;
	self.protection	[PROT_BLUNT]		=	self.protection	[PROT_BLUNT]-(self.protection	[PROT_BLUNT]%1);
	self.protection	[PROT_EDGE]		=	self.protection	[PROT_EDGE]+(self.protection	[PROT_EDGE]*n)/2;
	self.protection	[PROT_EDGE]		=	self.protection	[PROT_EDGE]-(self.protection	[PROT_EDGE]%1);		
	self.protection	[PROT_POINT]		=	self.protection	[PROT_POINT]+(self.protection	[PROT_POINT]*n)/2;
	self.protection	[PROT_POINT]		=	self.protection	[PROT_POINT]-(self.protection	[PROT_POINT]%1);
	self.protection	[PROT_FIRE]		=	self.protection	[PROT_FIRE]+(self.protection	[PROT_FIRE]*n)/2;
	self.protection	[PROT_FIRE]		=	self.protection	[PROT_FIRE]-(self.protection	[PROT_FIRE]%1);
	self.protection	[PROT_FLY]		=	self.protection	[PROT_FLY]+(self.protection	[PROT_FLY]*n)/2;
	self.protection	[PROT_FLY]		=	self.protection	[PROT_FLY]-(self.protection	[PROT_FLY]%1);		
	self.protection	[PROT_MAGIC]		=	self.protection	[PROT_MAGIC]+(self.protection	[PROT_MAGIC]*n)/2;
	};
*/


// 	self.SpawnDelay=30+self.level*6*60;
// 	if(Kapitel>1)
// 	{
// 	self.SpawnDelay=self.SpawnDelay/Kapitel;
// 		
// 	};
// 	self.SpawnDelay=self.SpawnDelay-(self.SpawnDelay%1);
};
//added some balance to func April 23, 2011 
func void B_CreateGobboInv()//Gobbo=Robber=SomeStuffInInv
{
	var int rnd;
	rnd = 1+Hlp_Random(1000);
	if(rnd==1000)
	{
		CreateInvItems(self,ItMi_JeweleryChest,1);	
	}
	else if(rnd>995)
	{
		CreateInvItems(self,ItMi_GoldChest,1);	
	}
	else if(rnd>985)
	{
		CreateInvItems(self,Schutzring_Magie2_Fire2,1);	
	}
	else if(rnd>970)
	{
		//Goblinie jagody
		CreateInvItems(self,Schutzring_Magie2_Fire2,1);	
	};	
	if(1+Hlp_Random(100)==100)
	{
		CreateInvItems(self,ItMi_GoldRing,1);	
	};
	if(1+Hlp_Random(100)==100)
	{
		CreateInvItems(self,ItMi_SilverNecklace,1);	
	};	
	if(1+Hlp_Random(100)==100)
	{
		CreateInvItems(self,ItMi_SilverRing,1);	
	};		
	if(1+Hlp_Random(100)==100)
	{
		CreateInvItems(self,ItMi_SilverCandleHolder,1);	
	};	
	if(1+Hlp_Random(100)>=95)
	{
		CreateInvItems(self,ItKeLockpick,1);	
	};		
	if(1+Hlp_Random(100)>=70)
	{
		CreateInvItems(self,ItFoApple,1);	
	};
	if(1+Hlp_Random(100)>=75)
	{
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);	
	};	
	if(1+Hlp_Random(100)>=50)
	{		
		var int nuggetamount;
		nuggetamount=Hlp_Random(12);
		nuggetamount=nuggetamount*Hlp_Random(3);
		if(nuggetamount)
		{
		CreateInvItems(self,ItMiNugget,nuggetamount);
		};
	};
};
 
