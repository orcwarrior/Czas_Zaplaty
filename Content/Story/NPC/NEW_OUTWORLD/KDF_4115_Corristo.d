instance KDF_4115_Corristo (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Corristo";
	npctype		=	npctype_main;
	guild 		=	GIL_MAG;      
	level 		=	50;
	voice 		=	14;
	id 			=	4115;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 120;
	attribute[ATR_MANA_MAX] 	= 700;
	attribute[ATR_MANA] 		= 700;
	attribute[ATR_HITPOINTS_MAX]= 3000;
	attribute[ATR_HITPOINTS] 	= 3000;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",84,1,KDF_ARMOR_H);

	B_Scale (self);		
	Mdl_SetModelFatness (self,0);
    	
   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MAGE;
		
	//-------- Talente --------                                    
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));

	//-------- Spells--------                   

/****************
Daj mu ork jakiœ fajny czar

**********************/
                 
	CreateInvItem(self,ItArRuneFireball);
   CreateInvItems		(self,ItArScrollSummonDemon,20);
		
	//-------- inventory --------                                    
	CreateInvItems(self,ItFo_Potion_Health_02,2);
	CreateInvItems(self,ItFo_Potion_Mana_02,2);
	CreateInvItems(self,ItFoWine,2);
	CreateInvItem (self,Schutzring_Magie2_Fire2);
 	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
   
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4115;
};

FUNC VOID Rtn_start_4115 ()
{
	TA_BOSS(19,05,06,55,"DUNG48");
	TA_BOSS(06,55,19,05,"DUNG48");
};