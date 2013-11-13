func void ZS_AidanUEq ()
{
	//PrintDebugNpc	(PD_ZS_FRAME,"ZS_AidanEq");
	B_SetPerception (self);    
	AI_SetWalkmode	(self,NPC_WALK);	
	AI_GotoWP		(self, 	self.wp);
	AI_AlignToWP 	(self);	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Fighter", 9,  1, ORG_ARMOR_M);
	EquipItem (self, ItMw_1H_Mace_05);
	Npc_RemoveInvItem			(self,ItMw_1H_Sledgehammer_01);
};

func int ZS_AidanUEq_Loop ()
{

};
func void ZS_AidanUEq_End ()
{	
	//PrintDebugNpc			(PD_ZS_FRAME, "ZS_AidanUEq_End" );

};