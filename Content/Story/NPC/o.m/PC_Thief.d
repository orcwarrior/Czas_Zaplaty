INSTANCE PC_Thief(NPC_DEFAULT)
{
	//-------- primary data --------
	name 			= "Diego";
   npctype			= NPCTYPE_FRIEND;
	guild			= GIL_NONE;
	level			= 40;			//
	voice			= 11;
	id				= 1;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Thief",15,4,STT_ARMOR_H);

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	180;
	attribute[ATR_DEXTERITY] 	=	190;
	attribute[ATR_MANA_MAX] 	=	20;
	attribute[ATR_MANA] 		=	20;
	attribute[ATR_HITPOINTS_MAX]=	840;
	attribute[ATR_HITPOINTS] 	=	840;
	
	protection[PROT_EDGE]		=	80;
	protection[PROT_BLUNT]		=	80;
	protection[PROT_POINT]		=	70;

	Npc_SetTalentSkill	(self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,90); 
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_SNEAK,1);	
	Npc_SetTalentSkill	(self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,90); 
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));

	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);
	
	//-------- inventory --------
	EquipItem			(self,Diegos_Bogen);
	EquipItem			(self,HUN_MW_03);
	CreateInvItems		(self,ItAmArrow,100);

	//-------- ai --------
	daily_routine 				= Rtn_Start_1;
	fight_tactic 				= FAI_HUMAN_RANGED;
   Npc_SetAivar(self,AIV_IMPORTANT,	 TRUE);
	senses						= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_Start_1 ()
{
	TA_SitAround	    (23,00,05,00,"OW_LEFT_RIGHT_CAMP");
	TA_SitAround    (05,00,18,30,"OW_LEFT_RIGHT_CAMP");	
   TA_Stand	(18,30,23,00,"OW_LEFT_RIGHT_CAMP");        
};

FUNC VOID Rtn_OC_1 ()
{
	TA_Sleep	    (23,00,03,00,"OCR_HUT_Z5_SIT244");
	TA_SitAround    (03,00,11,30,"OCR_HUT_Z5_SIT");	
	TA_Stand  		(11,30,12,20,"OCR_HUT_Z5_SIT");	
	TA_SitAround    (12,20,15,30,"OCR_HUT_Z5_SIT");	
    TA_Smalltalk	(15,30,18,30,"OCR_HUT_Z5");//Balam
	TA_SitAround    (18,30,19,30,"OCR_HUT_Z5_SIT2");	    
    TA_Smalltalk	(19,30,21,30,"OCR_HUT_Z5");//Harford    
    TA_SitAround	(21,30,23,00,"OCR_HUT_Z5_SIT3");        
};

FUNC VOID Rtn_StartOR_1 ()
{
	TA_Sleep	    (23,00,04,00,"HC_HUTIN_X");
	TA_SitAround    (04,00,15,30,"HC_BENCHX");	
    TA_Smalltalk	(15,30,19,30,"HELPPOINT6");//Fingers
    TA_Smalltalk	(19,30,20,30,"HC_BENCHX");//Cavalorn    
    TA_SitAround	(20,30,23,00,"KHARIM_T");        
};

FUNC VOID Rtn_OCWait_1 ()
{	
	TA_Stay			(00,00,12,00,"OC_ROUND_13");
	TA_Stay			(12,00,00,00,"OC_ROUND_13");
};

FUNC VOID Rtn_OCW_1 ()
{	
   TA_Stand	(22,00,08,00,"DIEGO_HIDE");    
   TA_Stand	(08,00,22,00,"DIEGO_HIDE");    
};

FUNC VOID Rtn_JAIL_1 ()
{	
   TA_Stand	(22,00,08,00,"OCC_CELLAR_BACK_RIGHT_CELL");    
   TA_Stand	(08,00,22,00,"OCC_CELLAR_BACK_RIGHT_CELL");    
};

