/************************************************************************* 
 * 							 G_PRINTScreen
 *************************************************************************
 * PRCONDITIONS: 	NONE
 *************************************************************************/
func void G_PRINTScreen( var string strMessage  )//Unused
{
	//
	//	PRINT TO SCREEN
	//
	PRINTScreen		(strMessage, -1, 10, _STR_FONT_ONSCREEN, 3 );		
//	PRINTDialog		(strMessage, -1, 10, _STR_FONT_ONSCREEN, 3 );		
	
	//
	//	PRINT DEBUG MESSAGE
	//
//	PRINTDebugNpc	(PD_ZS_DETAIL, strMessage);				[ROMAN: FUEHRT DERZEIT MANCHMAL ZUM CRASH ZB. WG. NULL-STRING VERGLEICH] 
};
