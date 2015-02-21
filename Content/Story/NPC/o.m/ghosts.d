PROTOTYPE GHOST(C_Npc)
{
	//-------- primary data --------
	
	name 		=	"Duch";
	npctype		=	npctype_main;
	guild 		=	GIL_RBL;      
	level 		=	100;
//	voice 		=	4;
//	flags 		=	NPC_FLAG_IMMORTAL;
	id 			=	27;
	//Protections
	protection	[PROT_BLUNT]		=	9999;
	protection	[PROT_EDGE]			=	9999;
	protection	[PROT_POINT]		=	9999;
	protection	[PROT_FIRE]			=	9999;
	protection	[PROT_FLY]			=	9999;
	protection	[PROT_MAGIC]		=	1;
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 90;
	attribute[ATR_DEXTERITY]	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 5000;
	attribute[ATR_HITPOINTS] 	= 5000;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Ghost.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex2,teethtex,ruestung	
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	senses			=	SENSE_HEAR | SENSE_SEE ;                                                       
	senses_range	=	2000;		                         	
	//-------- Talente -------- 	                                  

	
	//-------- inventory --------                                    

	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);		
	
	
	Npc_SetAivar(self,AIV_HELLOSAYED,  999);	
	Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	Npc_SetAivar(self,AIV_LASTHP,  self.attribute[ATR_HITPOINTS]);		
	//-------------Daily Routine-------------
};
instance MD_INVISIBLEMAN(NPC_DEFAULT)

{
	//-------- primary data --------
	name 			= "Diego";
	guild			= GIL_HUN;
	level			= 40;			//
	voice			= 11;
	id				= 1;


	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Thief",15,4,STT_ARMOR_H);


	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	80;
	attribute[ATR_DEXTERITY] 	=	90;
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
	fight_tactic 				= FAI_HUMAN_RANGED;
   	Npc_SetAivar(self,AIV_IMPORTANT,	 TRUE);
	senses						= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

};
FUNC VOID Rtn_prestart_350 ()
{
	TA_StayNeutral			(01,01,01,00,"WP_RUNESWORD");

};
instance Roderic(GHOST)
{
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,3 ,"Hum_Head_Bald",11,0,PAL_ARMOR_A_H);
	
	name = "Roderik";	
	id = 350;
	daily_routine = Rtn_start_350;

};
FUNC VOID Rtn_start_350 ()
{
	TA_Stay	(04,05,20,05,"INVISIBLE2");
	TA_GhostStay	(20,05,04,05,"OW_FOGTOWER_TOP");
};

FUNC VOID Rtn_Guide_350 ()
{
	TA_RodericGuide	(05,05,20,05,"OW_PATH_175_GATE1");
	TA_RodericGuide	(20,05,05,05,"OW_PATH_175_GATE1");
};

FUNC VOID Rtn_OpenGate_350 ()
{
   TA_GuardWheelOpen(07,00,20,00,"OW_PATH_175_GATE2");
	TA_GuardWheelOpen(20,00,07,00,"OW_PATH_175_GATE2");
};

FUNC VOID Rtn_Guide2_350 ()
{
	TA_RodericGuide	(05,05,20,05,"OW_PATH_176_TEMPELFOCUS4_WP");
	TA_RodericGuide	(20,05,05,05,"OW_PATH_176_TEMPELFOCUS4_WP");
};

FUNC VOID Rtn_dead_350 ()
{
	TA_StayNeutral			(01,01,01,00,"INVISIBLE2");

};
instance RodericMD(GHOST)
{
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,3 ,"Hum_Head_Bald",11,0,PAL_ARMOR_A_H);
	
	name = "Roderik";	
	guild 		=	GIL_RBL;      
	id 			=	351;
	attribute[ATR_HITPOINTS_MAX]= 7090;
	attribute[ATR_HITPOINTS] 	= 7090;
	attribute[ATR_STRENGTH] 	= 305;
	protection	[PROT_MAGIC]		=	-3;
	EquipItem (self,GhostAxe1);
	
	daily_routine = Rtn_start_351;
};

FUNC VOID Rtn_start_351 ()
{
	TA_Stay	(00,01,00,00,"KOMNATA_MOST_03");
};

FUNC VOID Rtn_turnswitch_351 ()
{
	TA_Stay	(20,05,05,05,"KOMNATA_MOST_TURNSWITCH");
};

FUNC VOID Rtn_BACKTOGATE_351 ()
{
	TA_Stay	(00,01,00,00,"MD_PATHTOLASTHALL_RODERIC_01");
};

FUNC VOID Rtn_ENTERHALL_351()
{
	TA_Stay	(00,01,00,00,"MD_PATHTOLASTHALL_RODERIC_06");
};
FUNC VOID Rtn_fight_351()
{
   TA_Min		(self,0,01,00,00,ZS_GHOSTATTACK,"");
};
instance Truan(GHOST)
{
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,3 ,"Hum_Head_Bald",11,0,PAL_ARMOR_A_H);
	
	npctype		=	NPCTYPE_AMBIENT; // mark - main->ambient
	guild 		=	GIL_RBL;      
	name = "Truan";	
	attribute[ATR_HITPOINTS_MAX]= 6000;
	attribute[ATR_HITPOINTS] 	= 6000;
	protection	[PROT_MAGIC]		=	8;
	
	id = 352;
	Npc_SetAivar(self,AIV_HELLOSAYED,  999);	
	Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	Npc_SetAivar(self,AIV_LASTHP,  self.attribute[ATR_HITPOINTS]);		
	daily_routine = Rtn_start_352;
	CreateInvItem(self, ItArRuneTeleportFromDungeonToWorldzen);
	EquipItem (self,GhostSword1);
};

FUNC VOID Rtn_start_352()
{
	TA_Stay	(00,01,00,00,"MD_LASTHALL_TRUAN_01");
};           

FUNC VOID Rtn_start2_352()
{
	TA_Stay	(00,01,00,00,"MD_LASTHALL_TRUAN_02");
};           
FUNC VOID Rtn_fight_352()
{
   TA_Min		(self,0,01,00,00,ZS_GHOSTATTACK ,"");	
};
