var int wisp_trial;

	

instance jahr_demon(Npc_Default)
{
	name							=	"Demon";
	guild							=	GIL_DEMON;
	Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_DEMON);
	level							=	50;
//--------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	75;
	
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------
	protection	[PROT_BLUNT]		=	30;
	protection	[PROT_EDGE]			=	30;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	500;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	5;
//--------------------------------------------------------
	damagetype 						=	DAM_FIRE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	150;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
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
	Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,TRUE);	
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,75);
	CreateInvItem(self,tri_innos_statue);
	CreateInvItem(self,tri_beliar_statue);
};	
func void B_Story_Mis_AdanWaves_SpawnNextWave()
{
	if(Npc_GetAivar(self,AIV_MM_REAL_ID) != ID_MIS_ADANWAVE)&&(wisp_trial !=1){ return;}; 
	var string wp; 
	if(!Hlp_Random(2)){wp="OW_PATH_144";} else {wp="OW_PATH_2_07";};
//	PRINTScreen		(concatstrings("wisp_trial=",inttostring(wisp_trial)), -1, 10, _STR_FONT_ONSCREEN, 3 );		

	if(wisp_trial<=1){Wld_InsertNpc(MIS_AdanWave1,wp);}
	else if(wisp_trial==2){Wld_InsertNpc(MIS_AdanWave2,wp);}
	else if(wisp_trial==3){Wld_InsertNpc(MIS_AdanWave3,wp);}
	else if(wisp_trial==4){Wld_InsertNpc(MIS_AdanWave4,wp);}
	else if(wisp_trial==5){Wld_InsertNpc(MIS_AdanWave5,wp);}
	else if(wisp_trial==6){Wld_InsertNpc(MIS_AdanWave6,wp);}
	else if(wisp_trial==7){Wld_InsertNpc(MIS_AdanWave7,wp);}
	else if(wisp_trial==8){Wld_InsertNpc(MIS_AdanWave8,wp);}
	else if(wisp_trial==9){Wld_InsertNpc(MIS_AdanWave9,wp);}
	else if(wisp_trial==10){Wld_InsertNpc(MIS_AdanWave10,wp);}
	else if(wisp_trial==11){Wld_InsertNpc(MIS_AdanWave11,wp);}
	else {return;};

		
	wisp_trial=wisp_trial+1;
};