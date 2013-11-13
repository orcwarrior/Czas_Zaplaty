func void ZS_AidanEq ()
{
	//PrintDebugNpc	(PD_ZS_FRAME,"ZS_AidanEq");
	B_SetPerception (self);    
	AI_SetWalkmode	(self,NPC_WALK);	
	AI_GotoWP		(self, 	self.wp);
	AI_AlignToWP 	(self);	
	Mdl_SetVisualBody (self,"hum_Body_CookSmith", 1, 1,"Hum_Head_Fighter", 9,  1, ORG_ARMOR_M);
	EquipItem (self, ItMw_1H_Sledgehammer_01);	
};

func int ZS_AidanEq_Loop ()
{

};
func void ZS_AidanEq_End ()
{	
	//PrintDebugNpc			(PD_ZS_FRAME, "ZS_Firespit_End" );

};