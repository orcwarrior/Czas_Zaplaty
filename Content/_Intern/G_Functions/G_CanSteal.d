/*************************************************************************
**																		**
**		B_BugfixAmount													**
**		=============													**
**																		**
**		In Random CreateInvItems used									**
**																		**
*************************************************************************/
func void B_BugfixAmount(var C_NPC slf,var int itemid,var int amount)
{
var int a;
if(a!=0)
{
a = (amount)-(amount%1);
};
	if (a>0)
	{
		CreateInvItems(slf,itemid,amount);
	};	
};
func void G_GiveSomeInv()
{
	if(Kapitel>Npc_GetAivar(other,AIV_LASTROBBED))
	{
		B_BugfixAmount(other,ItMiNugget,Hlp_Random(10*Kapitel));
		if(HLP_RANDOM(5)==0)
		{
		B_BugfixAmount	(other, ItFo_Potion_Health_01,Hlp_Random(3));
		};
		if(Hlp_Random(21+Kapitel)>=20)
		{
		var int rnd;
		rnd = Hlp_Random(4);
			if(rnd==0)
			{
				CreateInvItem(other,ItMi_GoldNecklace);
			}	
			else if(rnd==1)
			{
				CreateInvItem(other,ItMi_SilverRing);
			}
			else if(rnd==2)
			{
				CreateInvItem(other,ItMi_SilverPlate);
			}	
			else
			{
							
			};	
		};
	};
};
/************************************************************************* 
 * 							 G_CanSteal
 *************************************************************************
 * PRCONDITIONS: self 	:	Burgler	
 *				 other	:	Victim
 *************************************************************************/
func int G_CanSteal()
{
		G_GiveSomeInv();
		Npc_SetAivar(other,AIV_LASTROBBED,Kapitel);
		Npc_SetAivar(other,AIV_LASTROBBED,  Kapitel);
		return TRUE;
};
