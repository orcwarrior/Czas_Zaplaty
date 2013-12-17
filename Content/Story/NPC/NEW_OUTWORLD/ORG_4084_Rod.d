
instance ORG_4084_Rod (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Rod";
	Npctype =				Npctype_Main;
	guild =					GIL_SLV;      
	level =					15;
	
	voice =					6;
	id =					4084;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",5,1,ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);

	//------- Inventory ---------

	CreateInvItems (self,ItKeLockpick,3);		
	CreateInvItems(self,ItMiNugget,18);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Teeth_01);
	CreateInvItem (self,Silas_Axt);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems (self,ItAmArrow,100);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4084;
};

FUNC VOID Rtn_start_4084 ()
{
    	TA_Boss			(10,00,03,00,"NC_TAVERN_ROOM04");
	TA_SitCampfire		(03,00,10,00,"NC_TAVERN_BACKROOM09");
};













