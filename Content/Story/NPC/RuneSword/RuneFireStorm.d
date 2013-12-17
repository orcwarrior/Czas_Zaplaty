instance RuneSword_FireStorm(Npc_Default)
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
	name	=	"Ognista Burza";
	slot	=	"spellFX_Firestorm_SPREAD";	
	flags	=	SPL_SENDCAST_FIRESTORM;
	voice	=	SPL_DAMAGE_FIRESTORM*3;
	npctype	=	DAM_FIRE;
	exp	=	RuneID_Firestorm;	
	lp	=	2;

};