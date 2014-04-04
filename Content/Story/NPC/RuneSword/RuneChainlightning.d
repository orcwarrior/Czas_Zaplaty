instance RuneSword_chainlightning(Npc_Default)
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
	slot	=	"runeFX_ChainLightning_COLLIDE";	
	flags	=	8*4;//8
	voice	=	SPL_ZAPPED_DAMAGE_PER_SEC*4;	//damage
	npctype	=	DAM_MAGIC;
	exp	=	RuneID_Chainlightning;	
	lp	=	4;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};