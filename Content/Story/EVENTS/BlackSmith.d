func void BS_SHARP_S1 ()
{
	if (Npc_IsPlayer(self)) 
	{	
		if(CreationMethod == R_BS && max_itemamount != 0)
		{
			var float a;
			Npc_SetAivar(self,AIV_INVINCIBLE,TRUE);				
			a	=	IntToFloat((R_CreateColdown*2)/7);			
			AI_Wait(hero,a);	
			AI_UseMob		(hero,	MOBNAME,	-1);			
			TRIG_FIRST_SEND	=	TRUE;
			Wld_SendTrigger("TIMETRIGGER4");
		};
	};
};

func void BS_ANVIL_S1 ()
{
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if (Npc_IsPlayer(self))
	{
	Npc_SetAivar(self,AIV_INVINCIBLE,TRUE);		
		if(CreationMethod == R_BS_ANVIL && max_itemamount != 0)
		{		
			TRIG_FIRST_SEND	=	TRUE;				
			Wld_SendTrigger("TIMETRIGGER4");
		};
	};
};

func int BS_ANVIL_COND ()
{
// 	pr/int("Anvil_COND");
// 	if(npc_isplayer(self))
// 	{
// 	CreateInvItem(hero,ItMw_1H_Sledgehammer_01);	
// 	};
	return 1;
};

func void BS_COOL_S1 ()
{

	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if (Npc_IsPlayer(self))
	{	
			Npc_SetAivar(self,AIV_INVINCIBLE,TRUE);			
		//Empty
	};
};

func void BS_FIRE_S1 ()
{
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if (Npc_IsPlayer(self)) 
	{	
			Npc_SetAivar(self,AIV_INVINCIBLE,TRUE);				
		if(CreationMethod == R_BS_FIRE && max_itemamount != 0)
		{
			TRIG_FIRST_SEND	=	TRUE;
			Npc_SetAivar(self,AIV_INVINCIBLE,TRUE);				
			Wld_SendTrigger("TIMETRIGGER4");
		};
	};
};
