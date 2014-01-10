instance Grd_4106_Orkan (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Orkan";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	30;
	voice 		=	11;
	id 			=	4106;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 340;
	attribute[ATR_HITPOINTS] 	= 340;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",24,1,EBR_ARMOR_H2);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    

	EquipItem	(self,GRD_MW_02U);
	CreateInvItems(self,ItFo_Potion_Health_03,4);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4106;
};

FUNC VOID Rtn_start_4106 ()	//FM
{
   /***********************************
   Ork przyda?oby si? zrobi? rutyn? z chlaniem,czyli kole? siedzi i pije,wstaje i ma ch?d pijanego,idzie spa?. Chocia? kilku npecom w so,no i or by si? przyda?o to zrobi?,doda?oby realizmu i w og?le.

   I w?asnie orkan by m?g? mie? tak? rutyn?
   //TODO: Zastanowic sie nadtym,tymczasowo TA_STAND
   *********************************/
   
	TA_Sleep(00,30,05,30,"OCR_HUT_1");
	TA_Sleep(05,30,07,00,"OCR_CAULDRON_1");
	TA_SitAround(07,00,10,00,"OCR_CAULDRON_1");
	TA_Smalltalk(10,00,12,01,"OCR_CAMPFIRE_A_MOVEMENT1"); //mit Grim
	TA_Stand(12,02,14,01,"OCR_CAULDRON_1");
	TA_Stand(14,02,16,00,"OCR_OUTSIDE_HUT_2");
	TA_Smalltalk(16,00,18,00,"OCR_CAMPFIRE_A_MOVEMENT3"); //mit Stt_322
	TA_SitCampfire(18,00,23,00,"OCR_CAMPFIRE_A_MOVEMENT1");	
	TA_SitCampfire(18,00,23,01,"OCR_CAMPFIRE_A_MOVEMENT1");	
	TA_Stand(23,02,00,30,"OCR_OUTSIDE_HUT_2");
};

FUNC VOID Rtn_Guide_4106 ()	//FM
{	
	TA_GuidePC(11,00,23,00,"FP_ROAM_OW_SNAPPER_OW_ORC");	
	TA_GuidePC(23,00,11,00,"FP_ROAM_OW_SNAPPER_OW_ORC");
};

FUNC VOID Rtn_NC1_4106 ()	//FM
{	
	TA_StandAround(11,00,23,00,"NC_TAVERN_BACKROOM01");	
	TA_StandAround(23,00,11,00,"NC_TAVERN_BACKROOM01");
};

FUNC VOID Rtn_WAIT_4106 ()
{
   TA_Guard(06,00,21,00,"OC2");
   TA_Guard(21,00,06,00,"OC2");			
};
