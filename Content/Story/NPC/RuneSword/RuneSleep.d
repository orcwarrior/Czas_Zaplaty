instance RuneSword_Sleep(Npc_Default)
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
// Rune is no longer...
	name	=	"Sen";
	slot	=	"RuneFX_Sleep_target";	
	flags	=	SPL_SENDCAST_SLEEP;
	//voice	=	10;
	//npctype	=	DAM_MAGIC;
	exp	=	RuneID_Sleep;	
	lp	=	6;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,ORG_ARMOR_H);
};