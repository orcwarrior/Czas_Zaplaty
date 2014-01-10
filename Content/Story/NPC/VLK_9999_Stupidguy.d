instance VLK_9999_Ziutek (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Ziutek - Party Test";
	npctype =						npctype_main;
	guild =							GIL_SLV;      
	level =							0;
	
	
	voice =							6;
	id =							9999;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		39;
	attribute[ATR_DEXTERITY] =		85;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	50;
	attribute[ATR_HITPOINTS] =		50;
	Party_AddNpc(self);
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Bald",41,0,VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelScale(self,1,1,1);
	
	
	fight_tactic	=	FAI_Human_Ranged; 

	//-------- Talents --------                                    
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

///	CreateInvItem		(self,ItMw_1h_HSword_Short_06);
//	EquipItem		(self,ItRw_Bow_Long_01);
	CreateInvItems		(self,ItAmArrow,30);
	CreateInvItems		(self,ItMiHammer,2);
	
	CreateInvItem (self,ItLsTorch);
	

	//-------------Daily Routine-------------
	B_InitNPCAddins(self);		/*B_InitNPCAddins(self);*/		daily_routine	= Rtn_start_9999;
	};

FUNC VOID Rtn_start_9999 ()
{
 	TA_RepairHut(10,01,11,00,"NC_EN_BARACK_REPAIR_11"); //haha,lol wtf? o.O  
	TA_RepairHut(11,01,12,00,"NC_EN_BARACK_REPAIR_01"); //haha,lol wtf? o.O
	TA_RepairHut(12,01,13,00,"NC_EN_BARACK_REPAIR_02"); //haha,lol wtf? o.O
	TA_RepairHut(13,01,14,00,"NC_EN_BARACK_REPAIR_03"); //haha,lol wtf? o.O
	TA_RepairHut(14,01,15,00,"NC_EN_BARACK_REPAIR_04"); //haha,lol wtf? o.O
	TA_RepairHut(15,01,16,00,"NC_EN_BARACK_REPAIR_05"); //haha,lol wtf? o.O
	TA_RepairHut(16,01,17,00,"NC_EN_BARACK_REPAIR_06"); //haha,lol wtf? o.O
	TA_RepairHut(17,01,18,00,"NC_EN_BARACK_REPAIR_07"); //haha,lol wtf? o.O
	TA_RepairHut(18,01,19,00,"NC_EN_BARACK_REPAIR_08"); //haha,lol wtf? o.O
	TA_RepairHut(19,01,20,00,"NC_EN_BARACK_REPAIR_09"); //haha,lol wtf? o.O
	TA_RepairHut(20,01,11,00,"NC_EN_BARACK_REPAIR_10"); //haha,lol wtf? o.O
	
	
};

FUNC VOID Rtn_Follow_9999 () 
{ 
//self.wp - insert "Start" wp	
TA_FollowPC (0,00,12,00,"OC1"); 
TA_FollowPC(12,00,0,00,"OC1"); 
}; 
FUNC VOID Rtn_WAIT_9999 () 
{ 
TA_Stand (0,00,12,00,self.wp); 
TA_Stand(12,00,0,00,self.wp); 
}; 








