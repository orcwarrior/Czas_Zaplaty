instance RuneSword_Now (Npc_Default)
{
/*	var string name;        //item			//information used rune: #name
	var string slot;		//vfxname		//vfx on criticalhit MUST BE COLLIDE! - played on target
	var string spawnPoint;	//sfxname 		//additional,sfx on critical hit
	var int	id; 		 	//insance of rune//to delete on use,and create on uneqip swd
	var int flags;			//chargecost   	//swd_power-flags(on critical) if flags>swd_power NO CRITICAL 1pt swd_power regenerate at 9 secs(8min),max swd_power=40
	var int voice;			//damage   		//Wld_playeffect(...,damage
	var int npctype;		//damagetype	//					^,damagetype...);
	var int lp;				//runetype  	//to play special vfx on sword
	0-NEUTRAL          <   L P   T A B L E
	1-DARK             <   L P   T A B L E
	2-FIRE             <   L P   T A B L E
	3-LIGHT            <   L P   T A B L E
	4-WATER	           <   L P   T A B L E
	5-WIND             <   L P   T A B L E
	6-SLEEP/CHARM      <   L P   T A B L E
	7-HEAL	           <   L P   T A B L E
*/
	name		=	"BRAK";
	slot		=	"UNDEF";	
	spawnPoint	=	"UNDEF";
	wp			=	"UNDEF";
	exp		=	0;
	flags		=	0;	
    voice		=	0;
    npctype		=	0;
  	lp	=	0;	  
};