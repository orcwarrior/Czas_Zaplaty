INSTANCE Info_Ambient_EXIT(C_INFO)
{
	nr			= 999;
	condition	= Info_Ambient_EXIT_Condition;
	information	= Info_Ambient_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT Info_Ambient_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Ambient_EXIT_Info()
{	
	AI_StopProcessInfos(self);
};

FUNC VOID B_AssignAmbientInfos_NPC(var c_NPC slf)
{
	Info_Ambient_EXIT.npc = Hlp_GetInstanceID(slf);
};

FUNC VOID B_AssignAmbientInfos(var c_NPC amb_self)
{
   if ((amb_self.npctype==NPCTYPE_AMBIENT) || (amb_self.npctype==npctype_mine_ambient)
   || (Hlp_StrCmp(amb_self.name, NAME_Gardist)) || (Hlp_StrCmp(amb_self.name, NAME_Schlaeger)) 
   || (Hlp_StrCmp(amb_self.name, NAME_Soeldner)))
	{	
      B_AssignAmbientInfos_NPC(amb_self);
   };
	
	//PartyAmbientInfos (commands)
	if (Npc_GetAivar(amb_self,AIV_PARTYMEMBER))
	{
		B_AssignPartyAmbientInfos(amb_self);
	};
};