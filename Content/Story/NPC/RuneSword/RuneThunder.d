instance RuneSword_Thunder(Npc_Default)
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
	name	=	"Grom";
	slot	=	"spellFX_Thunder_TARGET";	
	flags	=	SPL_SENDCAST_THUNDER;
	voice	=	SPL_DAMAGE_THUNDER*2;
	npctype	=	DAM_MAGIC;
	exp	=	RuneID_Thunder;	
	lp	=	4;

};