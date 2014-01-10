instance VLK_4098_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Martwy kopacz";
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							2;
	voice =							3;
	id =							4098;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",67,2,-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    

	
	//-------- inventory --------                                    

	EquipItem (self,DEF_MW_1H);
	CreateInvItem (self,ItFoApple);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4098;
};

FUNC VOID Rtn_start_4098 ()
{

	/*******************
le?y sobie martwy 
	********************/

	TA_Stand		(08,00,20,00,"OW_PATH_168");
	TA_Stand		(20,00,08,00,"OW_PATH_168");
};


instance VLK_4099_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Martwy kopacz";
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							2;

	
	voice =							3;
	id =							4099;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",17,2,-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    

	
	//-------- inventory --------                                    

	EquipItem (self,ALL_MW_01);
	CreateInvItem (self,ItFoApple);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4099;
};

FUNC VOID Rtn_start_4099 ()
{

	/*******************
le?y sobie martwy 
	********************/

	TA_Stand		(08,00,20,00,"OW_PATH_169");
	TA_Stand		(20,00,08,00,"OW_PATH_169");
};


instance VLK_4100_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Martwy kopacz";
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							2;

	voice =							3;
	id =							4100;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",37,2,-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- inventory --------                                    

	EquipItem (self,DEF_MW_1H);
	CreateInvItem (self,ItFoApple);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4100;
};

FUNC VOID Rtn_start_4100 ()
{

	/*******************
le?y sobie martwy 
	********************/

	TA_Stand		(08,00,20,00,"OW_PATH_169");
	TA_Stand		(20,00,08,00,"OW_PATH_169");
};

instance VLK_4101_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Ranny kopacz";
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							2;
	voice =							3;
	id =							4101;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		25;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",21,2,-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    

	
	//-------- inventory --------                                    

	EquipItem (self,DEF_MW_1H);
	CreateInvItem (self,ItFoApple);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4101;
};

FUNC VOID Rtn_start_4101 ()
{
	TA_SitCampfire		(08,00,20,00,"OW_PATH_170");
	TA_SitCampfire		(20,00,08,00,"OW_PATH_170");
};

FUNC VOID Rtn_Follow_4101 ()
{
	TA_FollowPC(08,00,20,00,"NC_PATH86_MOVEMENT");
	TA_FollowPC(20,00,08,00,"NC_PATH86_MOVEMENT");
};

FUNC VOID Rtn_StayCamp_4101 ()
{
	TA_SitCampfire(08,00,20,00, "NC_PATH86_MOVEMENT");
	TA_SitCampfire(20,00,08,00, "NC_PATH86_MOVEMENT");
};

