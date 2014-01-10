instance SLD_1725_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	guild =					GIL_SLV;       
	level =					16;
	
	voice =					8;
	id =					1725;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	152;
	attribute[ATR_HITPOINTS] =		32;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Pony",47,2,SLD_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
			
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	

	//-------- inventory --------                                    

	EquipItem (self,MTR_MW_01);
	CreateInvItems(self,ItAmArrow,4);
	CreateInvItems (self,ItFoRice,9);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,5);
	CreateInvItems(self,ItMiNugget,20);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,7);
	CreateInvItems (self,ItFo_Potion_Health_02,7);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1725;

};

FUNC VOID Rtn_start_1725 ()
{
	TA_Guard	(06,00,21,00,"OW_PATH_1_1"); 
	TA_Guard	(21,00,06,00,"OW_PATH_1_1"); 
};









