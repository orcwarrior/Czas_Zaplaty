//*****************************************************************************
//***			Diese Funktion tötet alle Bewohner des FMC					***
//*****************************************************************************
// To chyba jedna z pierwszych funkcji jak¹ wogole napisa³em XDD ten styl wciec w tekscie, mhmm...
func void B_fight()
{
	if (Npc_KnowsInfo (hero,DIA_Stt_318_Schatten))

			{
			AI_GotoNpc		(Stt_318_Schatten,Grd_201_Jackal);
			AI_TurnToNpc		(Stt_318_Schatten,Grd_201_Jackal);
			AI_TurnToNpc		(Grd_201_Jackal,Stt_318_Schatten);
			AI_Output (Stt_318_Schatten,Grd_201_Jackal,"SVM_14_WhatsThat");
				AI_Output (Stt_318_Schatten,Grd_201_Jackal,"SVM_14_ThatsMyWeapon");
				AI_Output (Stt_318_Schatten,Grd_201_Jackal,"SVM_14_GiveItToMe");
			AI_Wait 	( Stt_318_Schatten, 2);
			AI_Output (Grd_201_Jackal, Stt_318_Schatten,"SVM_7_LookingForTroubleAgain");
	AI_Wait 	( Grd_201_Jackal, 2);
		AI_Output (Stt_318_Schatten, Grd_201_Jackal,"SVM_14_DirtyThief");
	AI_Wait 	( Stt_318_Schatten, 2);
		AI_Output (Grd_201_Jackal, Stt_318_Schatten,"SVM_7_HandsOff");		
		AI_Output (Grd_201_Jackal, Stt_318_Schatten,"SVM_14_YouAskedForIt");
	AI_Wait 	( Stt_318_Schatten, 1.1);
	AI_Wait 	( Grd_201_Jackal, 1);
	AI_DrawWeapon		(Stt_318_Schatten);
		AI_Output (Grd_201_Jackal, Stt_318_Schatten,"SVM_14_DieMortalEnemy");

	AI_DrawWeapon		(Grd_201_Jackal);
	Npc_SetTarget (Grd_201_Jackal, Stt_318_Schatten);
	AI_StartState (Grd_201_Jackal, ZS_ATTACK, 1, "");
	Npc_SetTarget (Stt_318_Schatten, Grd_201_Jackal);
	AI_StartState (Stt_318_Schatten, ZS_ATTACK, 1, "");
			AI_GotoItem	( Stt_318_Schatten, Fox_Axe);
			AI_TakeItem	( Stt_318_Schatten, Fox_Axe);
			AI_EquipBestMeleeWeapon 	(Stt_318_Schatten);		
			};
};

