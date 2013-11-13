func int On_OCC_GATE_Trigger ()
{
	//PrintDebugNpc (PD_TA_CHECK,"On_OCC_GATE_Trigger");
    		
	var C_Npc npc;
	npc = Hlp_GetNpc (Grd_213_Torwache);
    Npc_SetAivar(npc,AIV_TRIGGER3,  1);
 		
    npc = Hlp_GetNpc (Grd_212_Torwache);
    Npc_SetAivar(npc,AIV_TRIGGER3,  1);
};

func int On_OCR_NORTHGATE_Trigger ()
{
	//PrintDebugNpc (PD_TA_CHECK,"On_OCR_NORTHGATE_Trigger");
	var C_Npc npc;
	npc = Hlp_GetNpc (Grd_216_Torwache);
	Npc_SetAivar(npc,AIV_Trigger3,  1);
	
	npc = Hlp_GetNpc (Grd_217_Torwache);
	Npc_SetAivar(npc,AIV_Trigger3,  1);
};

func int On_OCR_MAINGATE_Trigger ()
{
    //PrintDebugNpc (PD_TA_CHECK,"On_OCR_MAINGATE_Trigger");
    	
    var C_Npc npc;
    npc = Hlp_GetNpc (Grd_215_Torwache);
    Npc_SetAivar(npc,AIV_Trigger3,  1);
	
	npc = Hlp_GetNpc (Grd_214_Torwache);
    Npc_SetAivar(npc,AIV_Trigger3,  1);
};

func int On_OCC_BARONSDOOR_Trigger ()
{
    //PrintDebugNpc (PD_TA_CHECK,"On_OCC_BARONSDOOR_Trigger");
    	
    var C_Npc npc;
    npc = Hlp_GetNpc (Grd_218_Gardist);
    Npc_SetAivar(npc,AIV_Trigger3,  1);
	
	npc = Hlp_GetNpc (Grd_245_Gardist);
    Npc_SetAivar(npc,AIV_Trigger3,  1);
};

func int ON_PSI_LABDOOR_TRIGGER ()
{
};

func int ON_PSI_TEMPLE_GATE_TRIGGER ()
{
};

func int ON_NC_MAGERAMP_TRIGGER ()
{
};

func int ON_NC_MAGECAVE_TRIGGER ()
{
 };

func int ON_NC_GATE_TRIGGER ()
{
//### Tor wird bisher noch nicht bewacht
    //PrintDebugNpc (PD_TA_CHECK,"ON_NC_GATE_TRIGGER");
};
