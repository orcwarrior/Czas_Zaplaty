instance RuneSword_breathofdead(Npc_Default)
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
	name	=	"Tchnienie œmierci";
	slot	=	"spellFX_BreathOfDeath";	
	flags	=	SPL_SENDCAST_BREATHOFDEATH;//All of theese values will be divided by n (right now n=4)
	voice	=	SPL_DAMAGE_BREATHOFDEATH;
	npctype	=	DAM_MAGIC;
	exp	=	RuneID_Breathofdeath;	
	lp	=	1;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};