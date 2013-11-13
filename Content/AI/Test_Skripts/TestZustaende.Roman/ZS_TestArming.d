func void ZS_TestArming ()
{
};	

func void ZS_TestArming_Loop ()
{
	/////PRINT( "Arming" );
	AI_EquipBestRangedWeapon( self );
	AI_ReadyRangedWeapon	( self );
};

func void ZS_TestArming_End ()
{
};
