func void ZS_TestAmmo ()
{
	/////PRINT( "Arming" );
	AI_EquipBestRangedWeapon( self );
	AI_ReadyRangedWeapon	( self );
};	

func void ZS_TestAmmo_Loop ()
{
	/////PRINT( "Targeting" );
	var C_NPC enemy;
	enemy = Hlp_GetNpc( SLD3_Testmodell );
	Npc_SetTarget( self, enemy );
	
	/////PRINT( "Attacking" );
	AI_Attack( self );
};

func void ZS_TestAmmo_End ()
{
};
