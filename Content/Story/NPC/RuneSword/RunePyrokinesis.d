instance RuneSword_pyrokinesis(Npc_Default)
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
	6-PSI
*/
	name	=	"Pyrokineza";
	slot	=	"RuneFX_Pyrokinesis_TARGET";	
	flags	=	16;//No sendcast const used!!!
	voice	=	SPL_PYRO_DAMAGE_PER_SEC*2;
	npctype	=	DAM_FIRE;
	exp	=	RuneID_Pyrokinesis;	
	lp	=	6;

};