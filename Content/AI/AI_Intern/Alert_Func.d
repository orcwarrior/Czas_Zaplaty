func void Alert_Print(var string topic,var string msg)
{
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "ALERT_BACK.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "FONT_OLD_10_WHITE_HI.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 20, 20, 20, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, topic					);//Max 24
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "FONT_OLD_10_WHITE.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, msg	);//ok. 194
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "(ESC aby zamkn¹æ)");
					Doc_SetMargins	( nDocID, -1, 20, 20, 20, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus					
				
					Doc_Show		( nDocID );
					
					/*
			var int Alert;
			Alert = 	Doc_Create		();								// DocManager 
					Doc_SetPages	( Alert,  1 );                         //wieviel Pages

					Doc_SetPage 	( Alert,  0, "ALERT_BACK.tga" 	, 0 		); 
					
					//1.Seite
  					
					Doc_SetMargins	( Alert,  0,  20, 20, 20, 20, 2);  //  0 -> margins are in pixels				
					Doc_SetFont 	( Alert, 0, "FONT_OLD_10_WHITE_HI.tga");									
					Doc_PrintLine	( Alert,  0, "123456789111315171921232527293133353739414345474951535557596163656769717375");					
			//		Doc_PrintLine	( Alert,  0, "");
					Doc_SetFont 	( Alert, 0, "FONT_OLD_10_WHITE.tga");									
		//			Doc_PrintLines	( Alert,  0, "12345678911131517192123252729313335373941434547495153555759616365676971737577798183858789919395979910210510811114117120123126129132");
					Doc_PrintLines	( Alert,  1, "Na œcianie znaleŸliœmy dziwne przyciski. Marwez i Renor próbowali je wcisn¹æ, ale ...Zw³oki zakopaliœmy na zewn¹trz. Dziêki ich ofierze  dowiedzieliœmy siê jaki przycisk nale¿y wcisn¹æ. Odsunê³a siê jedna ze œcian, a my znaleŸliœmy stary ornament. Da³em go na przechowanie Patrikowi po czym ruszyliœmy dalej. Na koñcu ciemnego korytarza znalaz³em wy¿³obienie w œcianie, które idealnie pasowa³o do kszta³tu ornamentu. Zawo³a³em Patrika jednak¿e nie odpowiedzia³ mi ¿aden g³os. Ten drañ zwia³ z moim ornamentem! Za wszelk¹ cenê muszê go odnaleŸæ!");
					Doc_PrintLine	( Alert,  0, "");
					Doc_Show		( Alert );
					*/
	
		
};