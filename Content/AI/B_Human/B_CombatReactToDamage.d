func void B_CombatReactToDamage ()
{
	////PrintDebugNpc		(PD_ZS_FRAME, "B_CombatReactToDamage" );	
	
	//PRINTGlobals 		(PD_ZS_CHECK);
	// Wywo³ywane przez Hook_oCNpc__OnDamage
	//if ( Npc_IsPlayer( self ) )
	//{
	//	B_SpecialCombatDamageReaction(self,other);	
	//};
	//	if (Npc_GetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION))
	//{
	//	B_SpecialCombatDamageReaction(self,other);
	//};
	//-------- friendly NSC wird von Spieler attackiert --------
	if (Npc_IsPlayer(other) && (((self.flags & NPC_FLAG_FRIEND) == NPC_FLAG_FRIEND)||(Npc_GetPermAttitude(self,other)==ATT_FRIENDLY)))
	{
		return;
	};
	
// 	if (Npc_IsPlayer(other) && C_NpcBelongsToRebelCamp(self) && (GrdsInAttack))//GRD's attacking - hit by mistake
// 	{
// 		//trying to set npc unfocusable;
// 		var int ptr;
// 		ptr = oCNpc_GetPointer(self);
// 		MEM_WriteInt(ptr+160,0);//npc.type offset
// 		return;
// 	};
	//-------- Merken ob Schaden durch Fernkampfwaffe/Magie verursacht wurde --------
	if (Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		Npc_SetAivar(self,AIV_LASTHITBYRANGEDWEAPON,  1);
	}
	else
	{
		Npc_SetAivar(self,AIV_LASTHITBYRANGEDWEAPON,  0);
	};

	//-------- ! --------
	if ( Npc_IsPlayer( other ) )&&((self.flags & NPC_FLAG_FRIEND) != NPC_FLAG_FRIEND)
	{
		Npc_SetTempAttitude	(self,	ATT_HOSTILE);

		if ( (Npc_GetAttitude( self, other ) == ATT_HOSTILE) || (Npc_GetAttitude( self, other ) == ATT_ANGRY) )
		{
			Npc_SetTarget	(self,	other);
		/*
		}
		// JP: Ich mach das mal raus, weil der Nsc sich nur aus zwei Gründen im Kampf befinden kann, erstens wenn er Hostile ist oder den Kampf sonst wie beginnt und somit nicht 
		// angefangen hat, oder wenn er Angegriffen wurde und über ZS_ReactToDamage  (NewsEintrag) im ZS_Attack ist
		// JP: Außerdem kommen Attack_News raus
		else
		{
			B_AssessAndMemorize( NEWS_ATTACK, NEWS_SOURCE_WITNESS, self, other, self );
		*/	
		};
	};
	//-------- spezielle Reaktionen im Kampf --------

};
