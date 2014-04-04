instance RuneSword_stormfist(Npc_Default)
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
	name	=	"Uderzenie burzy";
	slot	=	"spellFX_Stormfist";	
	flags	=	SPL_SENDCAST_STORMFIST;
	voice	=	SPL_DAMAGE_STORMFIST*3;
	npctype	=	DAM_FLY;
	exp	=	RuneID_Stormfist;	
	lp	=	5;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};