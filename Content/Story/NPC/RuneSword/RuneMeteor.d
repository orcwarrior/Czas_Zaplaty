instance RuneSword_Meteor(Npc_Default)
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
	name	=	"Meteor";
	slot	=	"spellFX_Meteor";	
	flags	=	SPL_SENDCAST_Meteor;
	voice	=	SPL_DAMAGE_METEOR;
	npctype	=	DAM_FIRE;
	exp	=	RuneID_Meteor;	
	lp	=	2;

};