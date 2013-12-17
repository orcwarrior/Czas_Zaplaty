instance RuneSword_thunderball(Npc_Default)
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
	name	=	"Piorun Kulisty";
	slot	=	"spellFX_Thunderball";	
	flags	=	SPL_SENDCAST_THUNDERBALL;//5
	voice	=	SPL_DAMAGE_THUNDERBALL*3;
	npctype	=	DAM_MAGIC;
	exp	=	RuneID_Thunderball;	
	lp	=	4;

};