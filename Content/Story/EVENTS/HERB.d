//****************************
// 		HERB 
//****************************

func void HERB_S1 ()
{
	var float a;
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
		Npc_SetAivar(self,AIV_INVINCIBLE,TRUE);	
		if(CreationMethod == R_HERB_PSI && max_itemamount != 0)
		{
			TRIG_FIRST_SEND	=	TRUE;
			Npc_SetAivar(self,AIV_INVINCIBLE,TRUE);			
//			PR/INT("B");
			a	=	IntToFloat(R_CreateColdown*itemtocreate);			
			AI_Wait(hero,a);
			Wld_SendTrigger("TIMETRIGGER4");		
		};
	};
};