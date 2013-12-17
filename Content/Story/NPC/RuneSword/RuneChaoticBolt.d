instance RuneSword_FireWall(Npc_Default)//name should be changed,but fuck it
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
	name	=	"Chaotyczny Pocisk";
	slot	=	"spellFX_FireWall";	
	flags	=	SPL_SENDCAST_FIREWALL;
	voice	=	3*SPL_DAMAGE_FIREWALL;
	npctype	=	DAM_MAGIC;
	exp	=	RuneID_FireWall;	
	lp	=	1;

};