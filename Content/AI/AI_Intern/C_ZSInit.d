// ---- C_ZSInit(); genereller "Constuctor" für Zustände ---- //


func void C_ZSInit()
{
	Npc_SetAivar(self,AIV_FIGHTSPEACHFLAG,  0);

	C_StopLookAt(self);
	
	//CS: WorkAround, bis Bug #3023 gefixt ist
	if Npc_GetAivar(self,AIV_INVINCIBLE)==TRUE
	{
	    Npc_SetAivar(self,AIV_INVINCIBLE,FALSE);
	    Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);
	};    
	
	Npc_PercEnable(Self,PERC_NPCCOMMAND,B_CHECKSHEATH);
	
	
};

func void C_Orc_ZSInit()
{
	Npc_SetPercTime( self, 2 );

	Npc_SetAivar(self,AIV_FIGHTSPEACHFLAG,  0);
};
