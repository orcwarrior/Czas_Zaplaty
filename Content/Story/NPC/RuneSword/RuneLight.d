instance RuneSword_light(Npc_Default)
{
	name	=	"Œwiat³o";
	//slot	=	"spellFX_FireBall_KEY_CAST";	
	flags	=	0;
	exp	=	RuneID_Light;	
	lp	=	3;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};