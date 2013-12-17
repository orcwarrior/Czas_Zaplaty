instance RuneSword_FireBall(Npc_Default)
{
/*	var string name;
	var string slot;//vfxname	
	var string spawnPoint;//sfxname
	var string wp;//meshname
	var int	id;
	var int flags;//circle
	var int voice;//damage
	var int lp;//runestate//0-UNEQUIPED|1-EQUIPED		
*/
	name	=	"Kula Ognia";
	slot	=	"spellFX_Fireball";	
	flags	=	SPL_SENDCAST_FIREBALL;
	voice	=	SPL_DAMAGE_FIREBALL*3;
	npctype	=	DAM_FIRE;
	exp	=	RuneID_Fireball;	
	lp	=	2;
};