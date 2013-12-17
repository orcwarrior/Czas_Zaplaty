instance Grd_4081_Edwin (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Edwin";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	20;
	voice 		=	11;
	id 			=	4081;


	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 110;
	attribute[ATR_DEXTERITY] 	= 60;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",24,1,HUN_ARMOR_M); //Ork: Te zbroje magnatów to IMO szczyt głupoty
        
    	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	

	Mdl_SetModelScale(self,1.1,1.1,1.1);

	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	Npc_SetAivar(self,AIV_ITEMSCHWEIN, TRUE); // Ork: Troche glupio gdy tak tępo gapi sie na łojenie ekwipunku w kopalni
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    

	EquipItem	(self,RBL_MW_02);
	CreateInvItems(self,ItFo_Potion_Health_03,4);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4081;
};


FUNC VOID Rtn_Start_4081 ()
{
	TA_Stand		    (07,00,20,00,"MINE_PATH6");
	TA_Stand		    (20,00,07,00,"MINE_PATH6");
};

