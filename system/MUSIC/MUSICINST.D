







	
//////////////////////////////////////
//	
// 	Music Sytem 
//	Instance-Definitions 
//	
//////////////////////////////////////

// music config instance

INSTANCE musicSysConfig		(C_MUSICSYS_CFG)
{
	volume 				= 1;   		// 0..1
	bitResolution		= 16;		// 8 / 16
	globalReverbEnabled = 1;
	sampleRate			= 44100;	// 11050 - 44100 prefered
	numChannels			= 16;		// 1 - 16
	reverbBufferSize	= 16096;
};



// ------------------------------------------------------------------------------------------------
// jingle instances
// ------------------------------------------------------------------------------------------------


INSTANCE jingleFoundItem(C_MUSICJINGLE_DEF) {	name	    = "E-Positive 2";	transSubType= TRANSITION_SUB_TYPE_BEAT;		};
INSTANCE jingleLevelGain(C_MUSICJINGLE_DEF) {	name	    = "E-Positive 1";	transSubType= TRANSITION_SUB_TYPE_MEASURE;	};
INSTANCE jingleKilledFoe(C_MUSICJINGLE_DEF) {	name	    = "E-Positive 2";	transSubType= TRANSITION_SUB_TYPE_BEAT;		};
INSTANCE jingleLearnTalent(C_MUSICJINGLE_DEF) {	name	    = "E-Positive 1";	transSubType= TRANSITION_SUB_TYPE_BEAT;		};


// ------------------------------------------------------------------------------------------------
// theme instances
// ------------------------------------------------------------------------------------------------

//////////////////////
// System
//////////////////////

INSTANCE SYS_Menu			(C_MUSICTHEME_DEF)
{
	file				= "CZ_Menu.sgt";
 	transType		= TRANSITION_TYPE_NONE;
	transSubType	= TRANSITION_SUB_TYPE_IMMEDIATE;	
	loop			= 1;
// 	ReverbMix			= 1;
// 	ReverbTime			= 1;
};

INSTANCE SYS_Loading		(C_MUSICTHEME_DEF)
{
	file				= "Silience.sgt";
 	transType		= TRANSITION_TYPE_NONE;
 	transSubType	= TRANSITION_SUB_TYPE_IMMEDIATE;	
	
// 	ReverbMix			= 1;
// 	ReverbTime			= 1;
};


// ################################################################################################
// ################################################################################################
// ################################################################################################
// ###############                                                          #######################
// ###############           L O C A T I O N S                              #######################
// ###############                                                          #######################
// ################################################################################################
// ################################################################################################
// ################################################################################################

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  D E F A U L T  [DEF_]    XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE DEF_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";			transType		= 0;		};
												
 INSTANCE DEF_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";		};		
// 											transType		= TRANSITION_TYPE_FILL;
// 												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};
// 													};

// INSTANCE DEF_Day_Thr	(C_MUSICJINGLE_DEF)	{	name			= "";		transType		= TRANSITION_TYPE_FILL;		};
// INSTANCE DEF_Day_Fgt	(C_MUSICJINGLE_DEF)	{	name			= "";			};
												
// ----------------------------------------------------

INSTANCE DEF_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

INSTANCE DEF_Ngt_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

INSTANCE DEF_Ngt_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";					};


// ################################################################################################
// ###############                                                          #######################
// ###############           C A M P S                                      #######################
// ###############                                                          #######################
// ################################################################################################

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O L D C A M P  [OC_]     XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE OC_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

INSTANCE OC_Day_Thr		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";			};			
// 												transType		= TRANSITION_TYPE_BREAK;
// 												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

INSTANCE OC_Day_Fgt		(C_FAITHEME_DEF)	{	file			= "Silience.sgt";						};

// ----------------------------------------------------

INSTANCE OC_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

INSTANCE OC_Ngt_Thr		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

INSTANCE OC_Ngt_Fgt		(C_FAITHEME_DEF)	{	file			= "Silience.sgt";					};



// --- ARENA ----

INSTANCE ARE_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";						};

INSTANCE ARE_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";						};

INSTANCE ARE_Day_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";					};

// --- INEXTREMO ----


INSTANCE IE_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";   						};
INSTANCE IE_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";   						};

INSTANCE IE_Day_Thr		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";   						};

INSTANCE IE_Day_Fgt		(C_FAITHEME_DEF)	{	file			= "Silience.sgt";   						};
												

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  N E W C A M P  [NCO_/NCI_]   XXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

// Plateau davor

INSTANCE NCO_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";			};
												
INSTANCE NCO_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";		};

INSTANCE NCO_Day_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";		};

                                                                
INSTANCE NCO_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE NCO_Ngt_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE NCO_Ngt_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";					};

// Höhle

INSTANCE NCI_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";			};

INSTANCE NCI_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";			};

INSTANCE NCI_Day_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";			};
                                                                
INSTANCE NCI_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE NCI_Ngt_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
 INSTANCE NCI_Ngt_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";					
// 												transType		= TRANSITION_TYPE_FILL;
// 												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			
};


// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  P S I C A M P  [PSI_]    XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE PSI_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";		};
												
INSTANCE PSI_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";			};
												
INSTANCE PSI_Day_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";				};
												
INSTANCE PSI_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE PSI_Ngt_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE PSI_Ngt_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";					};
												

// ################################################################################################
// ###############                                                          #######################
// ###############           O U T S I D E W O R L D   + S P E C I A L      #######################
// ###############                                                          #######################
// ################################################################################################

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O U T S I D E W O R L D  [OW_]   XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


// Obsolete! DEF_ will be used instead.

// INSTANCE OW_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
// INSTANCE OW_Day_Thr		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
// INSTANCE OW_Day_Fgt		(C_FAITHEME_DEF)	{	file			= "ow_day_std.sgt";						};
//                                                                 
// INSTANCE OW_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
// INSTANCE OW_Ngt_Thr		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
// INSTANCE OW_Ngt_Fgt		(C_FAITHEME_DEF)	{	file			= "ow_day_std.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  S T A R T P O I N T  [STA_]      XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE STA_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
                                                            
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
// XXXXXXXX  B E A C H   [BEA_]               XXXX             
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
                                                            
INSTANCE BEA_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";	};
INSTANCE BEA_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";	};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  B A N D I T S     [BAN_]         XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE BAN_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE BAN_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  C A M P (klein)   [CAM_]         XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE CAM_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt"; 		};

INSTANCE CAM_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt"; };
INSTANCE TAV_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt"; 			};

INSTANCE TAV_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt"; };

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  C A S T E L L   [CAS_]           XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE CAS_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";						};
INSTANCE CAS_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  D E M O N - T O W E R   [DT_]    XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE DT_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";						};
INSTANCE DT_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  F R E E M I N E C A M P   [FC_]  XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE FC_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE FC_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  F O C U S - P L A C E   [FOC_]   XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE FOC_day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE FOC_day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE FOC_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE FOC_Ngt_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O R C G R A V E Y A R D [OGR_]   XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// Eingang in der Oberwelt

INSTANCE OGR_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE OGR_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O R C L O C A T I O N 1 [OL1_]   XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// Burgruine an Felswand, mit Fokus

INSTANCE OL1_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE OL1_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O L D M I N E - E N T R [OME_]   XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// Burgruine an Felswand, mit Fokus

INSTANCE OME_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE OME_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O R C C I T Y  [ORC_]    XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE ORC_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";				};
											
INSTANCE ORC_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";				};

INSTANCE ORC_Day_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";					};

INSTANCE ORC_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE ORC_Ngt_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE ORC_Ngt_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O R E B A R O N S  [OR_]   XXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE OR_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE OR_Day_Thr		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE OR_Day_Fgt		(C_FAITHEME_DEF)	{	file			= "Silience.sgt";						};

INSTANCE OR_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE OR_Ngt_Thr		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE OR_Ngt_Fgt		(C_FAITHEME_DEF)	{	file			= "Silience.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  P I R A T E - D U N G E   [FC_]  XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE PDN_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";						};
INSTANCE PDN_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  P I R A T E   B A Y   [PIR_]   XXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE PIR_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";	};
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  P I R A T E   B A Y NEW   [PRB_]   XXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
INSTANCE PRB_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";		};
//INSTANCE PRB_Ngr_Std	(C_MUSICTHEME_DEF)	{	file			= "PIR_Day_Std.sgt";					};
//INSTANCE PIR_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  S T O N E H E N G E   [STO_]   XXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE STO_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE STO_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  T R O L L A R E A N A   [TA_]  XXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE TA_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";						};
INSTANCE TA_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  T O W E R D U N G E O N [TD_]  XXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE TD_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";						};
INSTANCE TD_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  T E M P E L R U I N E  [TRU_]  XXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE TRU_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";						};
INSTANCE TRU_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

// ################################################################################################
// ###############                                                          #######################
// ###############           D U N G E O N S                                #######################
// ###############                                                          #######################
// ################################################################################################

// TEMPEL

INSTANCE TPL_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE TPL_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE TPL_Day_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE TPL_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

INSTANCE KAT_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE KAT_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE KAT_Day_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE KAT_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};

INSTANCE SPL_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE SPL_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE SPL_Day_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";					};
INSTANCE SPL_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";					};
		
// FREE MINE

INSTANCE FRM_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";		};

INSTANCE FRM_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";		};
												
INSTANCE FRM_Day_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";				};

INSTANCE FRM_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";		};
												
// OLD MINE?

INSTANCE OLM_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";			};

INSTANCE OLM_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";		};
																								
INSTANCE OLM_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "Silience.sgt";		};
												
INSTANCE OLM_Day_Fgt	(C_FAITHEME_DEF)	{	file			= "Silience.sgt";			};

// ORCGRAVEYARD		
 INSTANCE OGY_Day_Fgt	(C_MUSICJINGLE_DEF)	{	name			= "Silience.sgt";					};

INSTANCE OGY_Ngt_Std	(C_MUSICJINGLE_DEF)	{	name			= "Silience.sgt";			};		
INSTANCE OGY_Day_Std	(C_MUSICJINGLE_DEF)	{	name			= "Silience.sgt";					};
