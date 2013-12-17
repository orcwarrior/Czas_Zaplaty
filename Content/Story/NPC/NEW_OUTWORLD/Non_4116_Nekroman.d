instance Non_4116_Nekroman (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Czarny mag";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;      
	level 		=	100;
	voice 		=	11;
	id 			=	4116;
	flags       =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 55;
	attribute[ATR_DEXTERITY] 	= 65;
	attribute[ATR_MANA_MAX] 	= 300;
	attribute[ATR_MANA] 		= 300;
	attribute[ATR_HITPOINTS_MAX]= 600;
	attribute[ATR_HITPOINTS] 	= 600;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",28,1,DMB_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness (self,0);
    	
   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- talents --------                                    
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (			6));

   daily_routine = Rtn_start_4116;
};

FUNC VOID Rtn_start_4116 ()
{
	TA_STAND(06,00,08,00,"DUNG46");	
	TA_STAND(08,00,06,00,"DUNG46");	
};

instance Non_4116_NekromanD (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Czarny mag";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;      
	level 		=	100;
	voice 		=	11;
	id 			=	5560;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 155;
	attribute[ATR_DEXTERITY] 	= 165;
	attribute[ATR_MANA_MAX] 	= 700;
	attribute[ATR_MANA] 		= 700;
	attribute[ATR_HITPOINTS_MAX]= 5600;
	attribute[ATR_HITPOINTS] 	= 5600;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",28,1,DMB_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness (self,0);
    	
   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- talents --------                                    
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE, 6);

	//-------- spells--------                                     
	CreateInvItems		(self,ItArScrollSummonDemon,20);
   CreateInvItem		(self,ItArRuneBreathOfDeath);
	//CreateInvItem		(self,ItArRuneFireball);
   CreateInvItems(self,ItFo_Potion_Mana_03,3);

	daily_routine = Rtn_start_5560;
};

FUNC VOID Rtn_start_5560 ()
{
	TA_STAND(06,00,08,00,"TPL_016");	
	TA_STAND(08,00,06,00,"TPL_016");	
};