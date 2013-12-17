instance RuneSword_LifeDrain(Npc_Default)
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
	name	=	"Wyssanie ¯ycia";
	slot	=	"spellFX_LifeDrain_COLLIDE";	
	flags	=	SPL_LIFEDRAIN_DRAIN_PER_MP*2;
	voice	=	0;//damage by script
	npctype	=	DAM_EDGE;
	exp	=	RuneID_LifeDrain;	
	lp	=	1;

};