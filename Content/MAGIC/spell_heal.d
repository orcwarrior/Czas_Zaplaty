//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_Heal(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Heal");
	
	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]) 
	{
		B_ChangeAttribute	(self,ATR_HITPOINTS, +SPL_HEALING_HP_PER_MP);
		return SPL_NEXTLEVEL;
	};
	// Kein weiteres Invest mehr möglich -> Der Kerl ist geheilt.
	return SPL_SENDSTOP;
};


func int Spell_Heal_Npc(var c_npc slf)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Heal_Npc");
	var int mp;
	
	B_DrawSpell		(slf,	SPL_HEAL,	10);	
	if(slf.attribute[ATR_MANA]*SPL_HEALING_HP_PER_MP>=(slf.attribute[ATR_HITPOINTS_MAX]-slf.attribute[ATR_HITPOINTS]))
	{
		mp=(slf.attribute[ATR_HITPOINTS_MAX]-slf.attribute[ATR_HITPOINTS])/SPL_HEALING_HP_PER_MP;
		mp=mp-(mp%1);
		slf.attribute[ATR_HITPOINTS]=slf.attribute[ATR_HITPOINTS_MAX];
		slf.attribute[ATR_MANA]-=mp;
		AI_PlayAni(slf,"T_MAGRUN_2_HEASHOOT");
		Wld_PlayEffect("spellFX_Heal_START", slf, slf, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
		Wld_PlayEffect("spellFX_Heal_ORIGIN_SCRIPT", slf, slf, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)								
		Ai_wait(slf,5);
		AI_PlayAni(slf,"T_HEASHOOT_2_STAND");
		
	}
	else if(slf.attribute[ATR_MANA])
	{
		slf.attribute[ATR_HITPOINTS]+=(slf.attribute[ATR_MANA]*SPL_HEALING_HP_PER_MP);	
		slf.attribute[ATR_MANA]=0;	
		AI_PlayAni(slf,"T_MAGRUN_2_HEASHOOT");
		Wld_PlayEffect("spellFX_Heal_START", slf, slf, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
		Wld_PlayEffect("spellFX_Heal_ORIGIN_SCRIPT", slf, slf, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)								
		Ai_wait(slf,5);
		AI_PlayAni(slf,"T_HEASHOOT_2_STAND");
	};
	AI_UnreadySpell(slf);
};