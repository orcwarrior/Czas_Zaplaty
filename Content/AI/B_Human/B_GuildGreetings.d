func void B_GuildGreetings ()
// 24.05. Läuft
{
	PrintDebugNpc( PD_ZS_FRAME, "B_GuilGreetings" );
	if (  C_NpcIsHuman(other) && (C_NpcBelongsToPsiCamp(self)) && (Npc_GetTempAttitude (self,other) == ATT_FRIENDLY))
	{
		PrintDebugNpc( PD_ZS_CHECK, "B_GuilGreetings Guru ");
		B_Say (self, other, "$SECTGREETINGS");
	}
	else if  (C_NpcBelongsToOldCamp(other))  &&  (C_NpcBelongsToOldCamp(self)) && (Npc_GetTempAttitude (self, other) == ATT_FRIENDLY  || Npc_GetTempAttitude (self, other) == ATT_NEUTRAL )
	{
		PrintDebugNpc( PD_ZS_CHECK, "B_GuilGreetings OC both" );
		B_Say (self, other, "$ALGREETINGS");
	}
	else if (self.guild==GIL_MAG) && (other.guild==GIL_MAG) && ( Npc_GetTempAttitude (self,other) ==  ATT_FRIENDLY ||  Npc_GetTempAttitude (self,other) == ATT_NEUTRAL)
	{
		PrintDebugNpc( PD_ZS_CHECK, "B_GuilGreetings NC both");
		B_Say (self, other, "$MAGEGREETINGS");
	}
	else 
	{
		if (Npc_GetTempAttitude (self,other) == ATT_FRIENDLY) || ((C_NpcBelongsToRebelCamp(other)) && ( C_NpcBelongsToRebelCamp(self)) && ( Npc_GetTempAttitude (self,other) ==  ATT_FRIENDLY ||  Npc_GetTempAttitude (self,other) == ATT_NEUTRAL))	
		{
			PrintDebugNpc( PD_ZS_CHECK, "B_GuilGreetings friend");
			B_Say (self, other, "$FRIENDLYGREETINGS");
		};
	};
};


// Sicherheitskopie für Abfragen auf Nsc´s

/*func void B_GuildGreetings ()
{
	if ((Wld_DetectNpc (self,-1,NOFUNC,GIL_SEPERATOR_HUM)||  other.guild <= GIL_SEPERATOR_HUM) && ( self.guild == GIL_GUR  ||  self.guild == GIL_PUP) && (Npc_GetAttitude (self,other) == ATT_FRIENDLY  || Npc_GetAttitude (self,other) ==  ATT_NEUTRAL))
	{
		B_Say (self,"$SECTGREETINGS");
	}
	else if ((Wld_DetectNpc (self,-1,NOFUNC,GIL_HUN)  || Wld_DetectNpc (self,-1,NOFUNC,GIL_GRD ) || Wld_DetectNpc (self,-1,NOFUNC, GIL_RBL )|| Wld_DetectNpc (self,-1,NOFUNC, GIL_VLK)) || ( other.guild == GIL_HUN  || other.guild == GIL_GRD  || other.guild ==  GIL_RBL  || other.guild ==  GIL_VLK ) &&  (self.guild ==  GIL_GRD  || self.guild ==  GIL_RBL  || self.guild == GIL_VLK ) && (Npc_GetAttitude (self, other) == ATT_FRIENDLY  || Npc_GetAttitude (self, other) == ATT_NEUTRAL ))
	{
		B_Say (self,"$ALGREETINGS");
	}
	else if ((Wld_DetectNpc (self,-1, NOFUNC,GIL_MAG ) || Wld_DetectNpc (self,-1, NOFUNC,GIL_KDW) ) || ( other.guild == GIL_MAG  || other.guild == GIL_KDW ) && ( self.guild ==  GIL_MAG || self.guild == GIL_KDW) && ( Npc_GetAttitude (self,other) ==  ATT_FRIENDLY ||  Npc_GetAttitude (self,other) == ATT_NEUTRAL))
	{
		B_Say (self,"$MAGEGREETINGS");
	}
	else 
	{
		if (Npc_GetAttitude (self,other) == ATT_FRIENDLY)
		{
			B_Say (self,"$FRIENDLYGREETINGS");
		}
		else 
		{
			Print ("Keine Grüße vorhanden");
		};
	};
};*/