func void ZS_GetWeapon ()
// 25.5.00 B_ eingeführt um Designkomform zu sein 3.5.00 Ist umgesetzt wie Design, nur das der ZS in zwei aufgeteilt wurde
{	
	PrintDebugNpc( PD_ZS_FRAME, "ZS_GetWeapon" );			
	C_ZSInit();	
B_GetWeapon (self,15);
};



