//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

var int Portal_X;
var int Portal_Y;
var int Portal_Z;
var int Portal_WORLD;

func int Spell_Logic_GotoPortal(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Teleport3");
	IF(Portal_WORLD!=WORLD_CURRENT)||((Portal_X==0)&&(Portal_Y==0)&&(Portal_Z==0))
	{
		PutMsg("Za daleko!","font_default.tga",RGBAToZColor(255,155,155,255),2*8,"");	
		return SPL_Sendstop;	
	};
	
	if (manaInvested>= SPL_SENDCAST_TELEPORT)
	{
		var int playerId;
		playerID = Hlp_GetInstanceID(hero);
		var ocnpc hiro; hiro = hlp_getnpc(playerID);
		hiro._zCVob_trafoObjToWorld[3]     = Portal_X; 
		hiro._zCVob_trafoObjToWorld[7]     = Portal_Y; 
		hiro._zCVob_trafoObjToWorld[11]    = Portal_Z;

// 		AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
				
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func int Spell_Logic_CreatePortal(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Teleport3");
	
	if (manaInvested>= SPL_SENDCAST_TELEPORT)
	{
		var int playerId;
		playerID = Hlp_GetInstanceID(hero);
		var ocnpc hiro; hiro = hlp_getnpc(playerID);
		Portal_X     = hiro._zCVob_trafoObjToWorld[3];
		Portal_Y     = hiro._zCVob_trafoObjToWorld[7];
		Portal_Z     = hiro._zCVob_trafoObjToWorld[11];
		Portal_WORLD = WORLD_CURRENT;
						
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

