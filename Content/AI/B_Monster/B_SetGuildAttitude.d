//////////////////////////////////////////////////////////////////////////
//	B_SetGuildAttitude
//	==================
//	Setzt die Gilden-Attitüde von 'fromGuild' gegenüber 'toGuild' auf den
//	Wert 'attitude'. Menschen und Orks können mit der Sammelbezeichnung
//	GIL_SEPERATOR_HUM bzw. GIL_SEPERATOR_ORC angegeben werden
//////////////////////////////////////////////////////////////////////////
func void B_SetGuildAttitude (var int fromGuild, var int attitude, var int toGuild)
{
	if		(toGuild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_NONE	);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_HUN		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_MTR		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_RBL		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_MAG		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_VLK		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_KDW		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_GRD		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_PIR		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_SLV		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_SFB		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_GUR		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_PUP		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_TPL		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_DMB		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_BAB		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_PUPIL		);		
		
	}
	else if	(fromGuild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude	(GIL_NONE		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_HUN		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_MTR		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_RBL		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_MAG		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_VLK		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_KDW		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_GRD		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_PIR		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_SLV		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_SFB		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_GUR		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_PUP		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_TPL		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_DMB		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_BAB		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_PUPIL		,	attitude,	toGuild		);		
		
	}
	else
	{
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	toGuild		);
	};
};
 
