prototype RuneSwordDefault (C_NPC)
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
	name="Brak";

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};