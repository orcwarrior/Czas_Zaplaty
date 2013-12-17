instance RuneSword_WindFist(Npc_Default)
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
	name	=	"Uderzenie Wiatru";
	slot	=	"runeFX_Windfist_Target";	
	flags	=	SPL_SENDCAST_WINDFIST;
	voice	=	SPL_DAMAGE_WINDFIST*3;
	npctype	=	DAM_FLY;
	exp	=	RuneID_Windfist;	
	lp	=	5;

};