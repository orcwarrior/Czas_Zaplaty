//////////////////////////////////////////////////////////////////////////
//	B_MagicHurtNpc
//	==============
//	Verwundet den NSC und berücksichtigt dabei den magischen Rüstschutz
//	'self' ist der zu verwundende NSC
//////////////////////////////////////////////////////////////////////////
func void B_MagicHurtNpc (var C_NPC attacker, var int damage)
{
	//PrintDebugNpc		(PD_ZS_FRAME,	"B_MagicHurtNpc");

	var int effectiveDamage;
	
	effectiveDamage = damage - self.protection[PROT_MAGIC];
	if (effectiveDamage < 0)
	{
		effectiveDamage = 0;
	};

	B_ChangeAttribute (self,	ATR_HITPOINTS, -effectiveDamage);

	if	Npc_IsDead(self)
	{
		if	Npc_IsPlayer   (attacker)
		||	(C_NpcIsHuman  (attacker) && Npc_GetAivar(attacker,AIV_PARTYMEMBER))
		||	(C_NpcIsMonster(attacker) && Npc_GetAivar(attacker,AIV_MM_PARTYMEMBER))
		{
			B_DeathXP(1);	// vergibt XP an SC
		};
	};
};