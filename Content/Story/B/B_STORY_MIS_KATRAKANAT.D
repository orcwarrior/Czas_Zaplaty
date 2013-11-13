INSTANCE katrakanat_servant (C_NPC)
{
	name							=	"S³uga Katrakanata";
	guild							=	GIL_DEMON;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_DEMON);
	
	level							=	4*MIS_Katrakanat_pieces_collected;
	//--------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	20+18*MIS_Katrakanat_pieces_collected;
	attribute	[ATR_DEXTERITY]		=	15*MIS_Katrakanat_pieces_collected;
	
	attribute	[ATR_HITPOINTS_MAX]	=	100+58*MIS_Katrakanat_pieces_collected;
	attribute	[ATR_HITPOINTS]		=	100+58*MIS_Katrakanat_pieces_collected;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	//--------------------------------------------------------
	protection	[PROT_BLUNT]		=	10+9*MIS_Katrakanat_pieces_collected;
	protection	[PROT_EDGE]			=	10+9*MIS_Katrakanat_pieces_collected;
	protection	[PROT_POINT]		=	7*MIS_Katrakanat_pieces_collected;
	protection	[PROT_FIRE]			=	50+5*MIS_Katrakanat_pieces_collected;
	protection	[PROT_FLY]			=	50+7*MIS_Katrakanat_pieces_collected;
	protection	[PROT_MAGIC]		=	50+5*MIS_Katrakanat_pieces_collected;
	//--------------------------------------------------------
	damagetype 						=	DAM_EDGE;

	//--------------------------------------------------------
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);

 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  100);
	//--------------------------------------------------------
	fight_tactic					=	FAI_DEMON;
	
	//--------------------------------------------------------
	senses							=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range					=	3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,				PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,				2800);
 Npc_SetAivar(self,AIV_MM_DrohRange,				2500);
 Npc_SetAivar(self,AIV_MM_AttackRange,			2000);
 Npc_SetAivar(self,AIV_MM_DrohTime,				3);
 Npc_SetAivar(self,AIV_MM_FollowTime,			10);
 Npc_SetAivar(self,AIV_MM_FollowInWater, 		TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
	//-------------------------------------------------------------
	start_aistate					=	ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
};		

func void B_Katrakanat_piece_collected(var int i)
{
	if(i>1)
	{
		Wld_SpawnNpcRange	(hero,	katrakanat_servant,	1,	500);
		Wld_PlayEffect("FX_Spawn_Katrakanat", hero, hero, 0, 0, DAM_INVALID, FALSE);		
		
	};
};

var int Ritual_Katrakanat_counter;//1-25 (24)
var int Ritual_Katrakanat_demon_counter;//1-25 (24)
func void RITUAL_KATRAKANAT_FUNC()
{
 	if((Npc_KnowsInfo (hero, DIA_RATFORD_SearchAgain2))&&(Ritual_Katrakanat_counter<26)&&(Katrakanat_collected!=4))
 	{
 		if ((NPC_HasItems(hero,Katrakanat_piece)>=1)&&(NPC_HasItems(hero,Katrakanat_piece2)>=1)&&(NPC_HasItems(hero,Katrakanat_piece3)>=1)&&(NPC_HasItems(hero,Katrakanat_piece4)>=1)&&(NPC_HasItems(hero,Katrakanat_piece5)>=1)&&(NPC_HasItems(hero,Katrakanat_piece6)>=1)&&(NPC_HasItems(hero,innos_statue)>=1)&&(NPC_HasItems(hero,ItFo_Innos_Booz)>=1))
 		{
			Ritual_Katrakanat_counter=Ritual_Katrakanat_counter+1;
			if(Ritual_Katrakanat_counter==1)
			{
				Wld_SendTrigger("RITUAL_KATRAKANAT_CAM");
				AI_GotoFP(hero,"FP_RITUAL");//FP_RITUAL_OW_GROBOWIEC
				Ai_PlayAni(hero,"T_STAND_2_PRAYINNOS");					
				//place items
				Wld_InsertItem			(katrakanat_piece2,"FP_RITUAL_KATRAKANAT_1");
				Wld_InsertItem			(katrakanat_piece3,"FP_RITUAL_KATRAKANAT_2");
				Wld_InsertItem			(katrakanat_piece4,"FP_RITUAL_KATRAKANAT_3");
				Wld_InsertItem			(katrakanat_piece5,"FP_RITUAL_KATRAKANAT_4");
				Wld_InsertItem			(katrakanat_piece6,"FP_RITUAL_KATRAKANAT_5");
				Wld_InsertItem			(katrakanat_piece, "FP_RITUAL_KATRAKANAT_6");
				Wld_InsertItem			(innos_statue, "FP_KATRAKANAT_STATUE");		
			}
			else if(Ritual_Katrakanat_counter==3)
			{
				PrintDialog(1,"Innosie", -1, 10, _STR_FONT_ONSCREEN, 3);

				//pfx on statue
				Wld_PlayEffect("spellFX_Katrakanat_Statue", innos_statue, innos_statue, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)

				
				//pfx on prayer
				Wld_PlayEffect("spellFX_Katrakanat_Hero", hero, hero, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
				
			}
			//start PFX on katrakanat pieces

			else if(Ritual_Katrakanat_counter==8)
			{
			Wld_PlayEffect("spellFX_KatrakanatPiece", katrakanat_piece2, katrakanat_piece2, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
			
				
				//pfx on katrakanat_piece1

			}
			else if(Ritual_Katrakanat_counter==10)
			{
				//pfx on katrakanat_piece2
			Wld_PlayEffect("spellFX_KatrakanatPiece", katrakanat_piece, katrakanat_piece, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
							
			}
			else if(Ritual_Katrakanat_counter==13)
			{
				//pfx on katrakanat_piece3
			Wld_PlayEffect("spellFX_KatrakanatPiece", katrakanat_piece6, katrakanat_piece6, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
				
			}
			else if(Ritual_Katrakanat_counter==16)
			{
				//pfx on katrakanat_piece4
			Wld_PlayEffect("spellFX_KatrakanatPiece", katrakanat_piece5, katrakanat_piece5, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)

			}
			else if(Ritual_Katrakanat_counter==18)
			{
				//pfx on katrakanat_piece5
			Wld_PlayEffect("spellFX_KatrakanatPiece", katrakanat_piece4, katrakanat_piece4, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
				
			}
			else if(Ritual_Katrakanat_counter==20)
			{
				//pfx on full circle - on
            Wld_PlayEffect("spellFX_KatrakanatPiece", katrakanat_piece3, katrakanat_piece3, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
			}
			else if(Ritual_Katrakanat_counter==21)//Burn Circle
			{		
            Wld_SendTrigger("RITUAL_KATRAKANAT_PFXCIRCLE");
			}
			else if(Ritual_Katrakanat_counter==23)//insert,remove item. boom + glow
			{
				Wld_RemoveItem			(katrakanat_piece2);
				Wld_RemoveItem			(katrakanat_piece3);
				Wld_RemoveItem			(katrakanat_piece4);
				Wld_RemoveItem			(katrakanat_piece5);
				Wld_RemoveItem			(katrakanat_piece6);
				Wld_RemoveItem			(katrakanat_piece);				

				Npc_RemoveInvItem			(hero,katrakanat_piece2);
				Npc_RemoveInvItem			(hero,katrakanat_piece3);
				Npc_RemoveInvItem			(hero,katrakanat_piece4);
				Npc_RemoveInvItem			(hero,katrakanat_piece5);
				Npc_RemoveInvItem			(hero,katrakanat_piece6);
				Npc_RemoveInvItem			(hero,katrakanat_piece);
				Npc_RemoveInvItem			(hero,innos_statue);
				
				Wld_InsertItem			(Katrakanat, "FP_RITUAL_KATRAKANAT_FINAL");
				Wld_PlayEffect("spellFX_Firestorm_SPREAD", Katrakanat, Katrakanat, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
			}
			else if(Ritual_Katrakanat_counter==24)
			{
				Npc_ClearAiQueue(hero);
				Ai_PlayAni(hero,"T_PRAYINNOS_2_STAND");	
				
				Ritual_Katrakanat_counter=27;
				//pfx on full circle - off
				
			};
			Wld_SendTrigger("RITUAL_KATRAKANAT_SCRIPT");
 		};
 	}
 	else if(Katrakanat_collected==4)&&(Ritual_Katrakanat_demon_counter<11)
 	{
			if(Ritual_Katrakanat_demon_counter==1)
			{
				Wld_SendTrigger("CAM_MIS_KAT_DEMON");			 
				Npc_ClearAIQueue(leren);								
				Ai_PlayAni(leren,"T_MAGRUN_2_SUMKATAR");
 				AI_WAIT(leren,6);						
				Ai_PlayAni(leren,"T_SUMKATAR_2_MAGRUN");	
				Ai_PlayAni(leren,"T_MAG_2_RUN");
				Wld_SendTrigger("EVT_MIS_KAT_DEM1");			 						
			}
			else if(Ritual_Katrakanat_demon_counter==2)
			{
				Wld_PlayEffect("spellFX_KATRAKANAT_MAGE_HAND", leren, leren, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
			}
			else if(Ritual_Katrakanat_demon_counter==3)
			{
            Wld_SendTrigger("EVT_MIS_KAT_DEM1");//boom			 
            Wld_SendTrigger("EVT_MIS_KAT_DEM3");//glow			 
            Wld_SendTrigger("EVT_MIS_KAT_DEM2");//stripes			 
			}		
			else if(Ritual_Katrakanat_demon_counter==4)
			{
					Wld_PlayEffect("spellFX_KATRAKANAT_MAGE_INCOVATION", leren, leren, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
					Wld_SendUnTrigger("EVT_MIS_KAT_DEM1");//boom			 
					Wld_SendUnTrigger("EVT_MIS_KAT_DEM3");//glow			 
					Wld_SendUnTrigger("EVT_MIS_KAT_DEM2");//stripes	
					Snd_Play("MFX_DESTROYUNDEAD_CAST");			
			}
			else if(Ritual_Katrakanat_demon_counter==5)
			{
					Wld_SendTrigger("EVT_MIS_KAT_DEM1");			 
					Wld_SendTrigger("EVT_MIS_KAT_DEM3");			 
					Wld_SendTrigger("EVT_MIS_KAT_DEM2");//stripes			 
			}			
			else if(Ritual_Katrakanat_demon_counter==6)
			{
					Wld_PlayEffect("spellFX_KATRAKANAT_MAGE_INCOVATION", leren, leren, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
					Snd_Play("MFX_DESTROYUNDEAD_CAST");			
			}							
			else if(Ritual_Katrakanat_demon_counter==8)
			{
				B_ChangeAttribute	(leren, ATR_HITPOINTS, -(leren.attribute[ATR_HITPOINTS_MAX]-2));	
				Npc_ClearAIQueue(leren);	
				Ai_PlayAni(leren,"T_DEADB");

				Npc_PercEnable  	(leren, 	PERC_ASSESSENEMY		,	B_NoReact				);
				Npc_PercEnable  	(leren, 	PERC_ASSESSPLAYER		,	B_NoReact					);
				Npc_PercEnable  	(leren, 	PERC_ASSESSFIGHTER		,	B_NoReact				);
				
				// SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
				//Npc_PercEnable  	(leren,	PERC_ASSESSITEM			,	B_AssessItem 				);
				
				// * Wahrnehmungen passiv *
				Npc_PercEnable  	(leren,	PERC_ASSESSDAMAGE		,	B_NoReact			);
				Npc_PercEnable  	(leren, 	PERC_ASSESSMAGIC		,	B_NoReact				);
				Npc_PercEnable  	(leren, 	PERC_ASSESSCASTER		,	B_NoReact	 			);
				Npc_PercEnable  	(leren, 	PERC_ASSESSTHREAT		,	B_NoReact				);
				Npc_PercEnable  	(leren,	PERC_DRAWWEAPON			, 	B_NoReact				);		
				Npc_PercEnable  	(leren, 	PERC_ASSESSWARN			, 	B_NoReact 		 	 	);
				Npc_PercEnable  	(leren, 	PERC_ASSESSMURDER		,	B_NoReact				);
				Npc_PercEnable  	(leren, 	PERC_ASSESSDEFEAT		,	B_NoReact				);
				Npc_PercEnable  	(leren, 	PERC_ASSESSFIGHTSOUND	,	B_NoReact			);
				Npc_PercEnable  	(leren, 	PERC_ASSESSQUIETSOUND	,	B_NoReact			);
				Npc_PercEnable  	(leren, 	PERC_CATCHTHIEF			,	B_NoReact 				);
				Npc_PercEnable  	(leren, 	PERC_ASSESSTHEFT		,	B_NoReact 				);
				Npc_PercEnable  	(leren, 	PERC_ASSESSSURPRISE		,	B_NoReact			);
				Npc_PercEnable  	(leren, 	PERC_OBSERVESUSPECT		,	B_NoReact			);
				Npc_PercEnable  	(leren, 	PERC_OBSERVEINTRUDER	,	B_NoReact 			);
				Npc_PercEnable  	(leren, 	PERC_ASSESSTALK			,	B_NoReact 				);
				Npc_PercEnable  	(leren, 	PERC_ASSESSCALL			,	B_NoReact				);
				Npc_PercEnable  	(leren,	PERC_ASSESSUSEMOB		,	B_NoReact 				);
				Npc_PercEnable  	(leren,	PERC_ASSESSENTERROOM	,	B_NoReact			);
				Npc_PercEnable  	(leren, 	PERC_MOVEMOB			,	B_NoReact				    );	
	
 				AI_WAIT(leren,50);													
				Ai_PlayAni(leren,"T_FALLENB_2_STAND");						
            Snd_Play("DEM_WARN");			
            Snd_Play("SVM_4_AARGH_2");			
				Wld_PlayEffect("spellFX_Thunder_TARGET_GLOW", leren, leren, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
				Wld_PlayEffect("KATRAKANAT_WHITE_BLEND", leren, leren, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
				Wld_InsertNpc(Demon_Katrakanat,"WP_KAT_DEMON");	
				var c_npc katar_dem; katar_dem=Hlp_getNpc(Demon_Katrakanat);
				Wld_PlayEffect("spellFX_KATRAKANAT_DEMON_SPAWN", katar_dem, katar_dem, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
 				AI_WAIT(hero,2);														
            AI_PlayAni			(hero, "T_PSI_VICTIM" );
 				AI_WAIT(hero,2);
 					
 				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSENEMY		,	B_NoReact				);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSPLAYER		,	B_NoReact					);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSFIGHTER		,	B_NoReact				);
				
				// SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
				//Npc_PercEnable  	(leren,	PERC_ASSESSITEM			,	B_AssessItem 				);
				
				// * Wahrnehmungen passiv *
				Npc_PercEnable  	(cavalorn,	PERC_ASSESSDAMAGE		,	B_NoReact			);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSMAGIC		,	B_NoReact				);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSCASTER		,	B_NoReact	 			);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSTHREAT		,	B_NoReact				);
				Npc_PercEnable  	(cavalorn,	PERC_DRAWWEAPON			, 	B_NoReact				);		
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSWARN			, 	B_NoReact 		 	 	);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSMURDER		,	B_NoReact				);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSDEFEAT		,	B_NoReact				);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSFIGHTSOUND	,	B_NoReact			);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSQUIETSOUND	,	B_NoReact			);
				Npc_PercEnable  	(cavalorn, 	PERC_CATCHTHIEF			,	B_NoReact 				);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSTHEFT		,	B_NoReact 				);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSSURPRISE		,	B_NoReact			);
				Npc_PercEnable  	(cavalorn, 	PERC_OBSERVESUSPECT		,	B_NoReact			);
				Npc_PercEnable  	(cavalorn, 	PERC_OBSERVEINTRUDER	,	B_NoReact 			);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSTALK			,	B_NoReact 				);
				Npc_PercEnable  	(cavalorn, 	PERC_ASSESSCALL			,	B_NoReact				);
				Npc_PercEnable  	(cavalorn,	PERC_ASSESSUSEMOB		,	B_NoReact 				);
				Npc_PercEnable  	(cavalorn,	PERC_ASSESSENTERROOM	,	B_NoReact			);
				Npc_PercEnable  	(cavalorn, 	PERC_MOVEMOB			,	B_NoReact				    );
				
 				Npc_PercEnable  	(ratford, 	PERC_ASSESSENEMY		,	B_NoReact				);																								
				Npc_ClearAIQueue(ratford);
            AI_PlayAni			(ratford, "T_PSI_VICTIM" );
            NPC_ExchangeRoutine(ratford,"rytualgotopc");
						
				Wld_PlayEffect("spellFX_BreathOfDeath_Target", hero, hero, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
				Wld_PlayEffect("spellFX_BreathOfDeath_Target", ratford, ratford, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
			}
			else if(Ritual_Katrakanat_demon_counter==9)
			{
 		   	B_ExchangeRoutine(cavalorn,"KatrakanatChase");
			};	 	
			if(!Npc_GetAivar(hero,AIV_INVINCIBLE))
			{
            Ritual_Katrakanat_demon_counter=Ritual_Katrakanat_demon_counter+1;
        	};
         
 		   Wld_SendTrigger("RITUAL_KATRAKANAT_SCRIPT");
 	};
};