/*****************************************************
*      ZS_DoorHelper						         *
* Invisible NPC that open door then dispear away
*****************************************************/

//### Gesten fehlen noch

func void ZS_DoorHelper()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_DoorHelper");
	var int ptr;
	ptr = oCNpc_GetPointer(self);
	MEM_WriteInt(ptr+160,0);//npc.type offset   
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_RUN);		// Walkmode für den Zustand
	AI_AlignToFP( self );				//Richte Dich aus
	AI_GotoWP		(self,	self.wp);

};

func int ZS_DoorHelper_Loop()
{
    //PrintDebugNpc(PD_MST_LOOP,"ZS_MM_MDOpenDoor_loop");
    AI_UseMob				(self,"DOOR",1);
 //   AI_UseMob				(self,"DOOR",-1);
    return loop_end;

};

func void ZS_DoorHelper_End ()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_DoorHelper_End");
  	var ocnpc slf;
  	var int self_id; self_id = hlp_getinstanceid(self);
	slf = hlp_getnpc(self_id);
	Npc_ChangeAttribute	(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);		
	//slf pos move outside hero visiblity
	slf._zCVob_trafoObjToWorld[3] = mkf(-5000);
	slf._zCVob_trafoObjToWorld[7] = mkf(-5000);
	slf._zCVob_trafoObjToWorld[11] =mkf(-5000);  
};
	
