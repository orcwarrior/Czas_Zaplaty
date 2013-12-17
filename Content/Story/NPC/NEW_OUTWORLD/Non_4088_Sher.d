instance Non_4088_Sher (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Sher";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	20;
	voice 		=	11;
	id 			=	4088;


	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 320;
	attribute[ATR_HITPOINTS] 	= 320;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",13,1,VLK_ARMOR_M);
        
    	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	

	Mdl_SetModelScale(self,1.0,1.0,1.0);

	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------  
	
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
			
	//-------- inventory --------                                    


	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItLsTorch);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4088;
};


FUNC VOID Rtn_Start_4088 ()
{

/*****************

1 rutyna niech bêdzie stand,2 mo¿e byæ kopanie i coœ tam jeszcze
******************/

	TA_Stand(07,00,20,00,"FM_03");
	TA_Stand(20,00,07,00,"FM_03");
};


FUNC VOID Rtn_GO_4088 ()
{
	TA_Stand(07,00,20,00,"FM_06");
	TA_Stand(20,00,07,00,"FM_06");
};

FUNC VOID Rtn_Death_4088 ()
{
	TA_Stand(07,00,20,00,"FM_09");
	TA_Stand(20,00,07,00,"FM_09");
};
