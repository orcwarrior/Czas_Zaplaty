instance RuneSword_FireRain(Npc_Default)
{
/*	var string name;
	var string slot;//vfxname	
	var string spawnPoint;//sfxname
	var int	id;
	var int flags;//chargecost
	var int voice;//damage
	var int npctype;//damagetype
	var int lp;//runetype
	0-NEUTRAL
	1-DARK
	2-FIRE
	3-LIGHT
	4-WATER	
	5-WIND
*/
	name	=	"Deszcz Ognia";
	slot	=	"runeFX_FireRain_RAIN";	
	flags	=	SPL_SENDCAST_FIRERAIN;
	voice	=	SPL_DAMAGE_FIRERAIN*2;
	npctype	=	DAM_FIRE;
	exp	=	RuneID_Firerain;	
	lp	=	2;

};