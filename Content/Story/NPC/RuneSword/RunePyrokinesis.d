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

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};