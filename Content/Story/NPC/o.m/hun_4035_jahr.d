instance HUN_4035_Jahr (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Jahr";
	Npctype =				Npctype_Main;	
	guild =					GIL_HUN;      
	level =					20;

	
	voice =					11;
	id =					4035;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		95;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12+90;
	attribute[ATR_HITPOINTS] =		self.level*12+90;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald",55,2,-1);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,1);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);		
	
	
	//-------- Talente ----------

//-------- inventory --------   

	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4035;

};

FUNC VOID Rtn_Start_4035 ()
{
	TA_Stay			(00,00,12,00,"OC_ROUND_13");
	TA_Stay			(12,00,00,00,"OC_ROUND_13");
};

FUNC VOID Rtn_INVISIBLE_4035 ()
{
	TA_Stay			(00,00,12,00,"INVISIBLE");
	TA_Stay			(12,00,00,00,"INVISIBLE");
};
