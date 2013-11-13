instance SLD_737_Torlof (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Torlof";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_SLV;       
	level =					19;
	
	voice =					4;
	id =					737;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		170;
	attribute[ATR_DEXTERITY] =		75;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	268;
	attribute[ATR_HITPOINTS] =		268;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",53,1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);

	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

	CreateInvItem (self,Torlofs_Axt);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,15);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,7);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Mug_01);
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_737;
	
	//-------------Misions-------------------

};

FUNC VOID Rtn_start_737 ()
{
	TA_Boss			(08,00,23,00,"FM_18");
	TA_Boss			(23,00,08,00,"FM_18");

};











