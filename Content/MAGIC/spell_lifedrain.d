//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	SPL_LIFEDRAIN_INCOME_PER_MP;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_LifeDrain	(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_LifeDrain"	);
	if(Manainvested==4){Multicast();};
	if(other.attribute[ATR_HITPOINTS]<=SPL_LIFEDRAIN_DRAIN_PER_MP)
	{
		B_ClearPerceptions	();			
		Npc_ClearAiQueue(other);
		AI_StartState 		(other, ZS_Dead, 1, "");	
		if(Npc_IsPlayer(self))
		{
			B_GiveXP (other.level*XP_PER_LEVEL_DEAD);
		};
	};	
 	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])&&(other.attribute[ATR_HITPOINTS]>SPL_LIFEDRAIN_INCOME_PER_MP) 
 	{
		Npc_SendPassivePerc(other, PERC_ASSESSFIGHTSOUND, other, self);
		B_ChangeAttribute	(self,ATR_HITPOINTS, +SPL_LIFEDRAIN_INCOME_PER_MP);
		B_ChangeAttribute	(other,ATR_HITPOINTS, -SPL_LIFEDRAIN_DRAIN_PER_MP);	
		
		if(manainvested==SPL_LIFEDRAIN_INCOME_PER_MP)||(manainvested%15==0)
		{
			Wld_PlayEffect("spellFX_LifeDrain_COLLIDE",other,other,SPL_LIFEDRAIN_INCOME_PER_MP,0,0,0);
		
		};
		if(manainvested==7)||(manainvested%SPL_LIFEDRAIN_INCOME_PER_MP*10+1==0)
		{
			Wld_PlayEffect("spellFX_LifeDrain_INCOME",self,self,SPL_LIFEDRAIN_INCOME_PER_MP,0,0,0);
		
		};			
		return SPL_NEXTLEVEL;
	}
	else if (other.attribute[ATR_HITPOINTS]>0) 
 	{

		Npc_SendPassivePerc(other, PERC_ASSESSFIGHTSOUND, other, self);
		B_ChangeAttribute	(self,ATR_HITPOINTS, +SPL_LIFEDRAIN_INCOME_PER_MP);
		B_ChangeAttribute	(other,ATR_HITPOINTS, -SPL_LIFEDRAIN_DRAIN_PER_MP);
		if(manainvested==5)||(manainvested%SPL_LIFEDRAIN_INCOME_PER_MP*10==0)
		{
			Wld_PlayEffect("spellFX_LifeDrain_COLLIDE",other,other,SPL_LIFEDRAIN_INCOME_PER_MP,0,0,0);
		
		};		
		if(manainvested==7)||(manainvested%SPL_LIFEDRAIN_INCOME_PER_MP*10+1==0)
		{
			Wld_PlayEffect("spellFX_LifeDrain_INCOME",self,self,SPL_LIFEDRAIN_INCOME_PER_MP,0,0,0);
		
		};					
		return SPL_NEXTLEVEL;	
	}
	else
	{
	Snd_Play("MFX_LIFEDRAIN_END");
	return SPL_SENDSTOP;			
	};

	return SPL_SENDSTOP;	
	// Kein weiteres Invest mehr möglich -> Der Kerl ist geheilt.

};