/*********************************

	D U A L _ F U N C

*********************************/
//right now it all dual things are in
// duals.d in item folder

// Grr.. fuck that ;[ silly gothic is silly...
var int DropLS_npc;
var int DropLS_counter;
func void D_DropLeftSword_Bugfix()
{
	var int invslotptr;
	if(!DropLS_npc)
	{ return; };
	if(DropLS_counter<4)
	{DropLS_counter=+1; return;};
	DropLS_counter = 0;
	invslotptr = MEM_ReadInt(DropLS_npc+2536);//npc.invslot_array
	invslotptr = MEM_ReadInt(invslotptr+24);//ZS_HELMET(tNpcSlot)	
	//CALL_IntParam(1);		
   	CALL_IntParam(invslotptr);		
  	CALL__thiscall (DropLS_npc,oCNpc__DropFromSlot_offset);		
  	//oCNpc__DropFromSlot_offset = 6972016;//0x6A6270 (*TNpcSlot)	
  	DropLS_npc = 0;//clear npc		
};
func void D_DropLeftSword(var c_npc slf)
{
		var int dropvob;
		var int slfptr;
		var int invslotptr;
		
		slfptr = oCNpc_GetPointer(slf);
		if(!slfptr)
		{
			slfptr = MEM_InstToPtr(slf);
		};
		if(!slfptr){return;};
		printdebug_S_I("slfptr:",slfptr);
		invslotptr = MEM_ReadInt(slfptr+2536);//npc.invslot_array
		invslotptr = MEM_ReadInt(invslotptr+24);//ZS_HELMET(tNpcSlot)
		printdebug_S_I("invslotptr:",invslotptr);
		
		//Visualy drop vob
// 		dropvob = MEM_ReadInt(invslotptr+48);//*oCItem
// 		printdebug_S_I("dropvob:",dropvob);
// 		if(!dropvob){return;};
// 		//Do the rest only if npc was using duals:	
//    		CALL_IntParam(dropvob);		
//   		CALL__thiscall (slfptr,oCNpc__DoDropVob_offset);		 		
		
  		//Play ani to swap ZS_LEFTHAND -> ZS_HELMET	
		AI_PlayAni(hero,"S_DUALBUGFIX_FALL");
		DropLS_npc = slfptr;
		//This function not work, i know it sucks ;/
};

func void HOOK_WEAPONTRAIL()
{
	//-----------------------
	// function no longer used
	
	var int i; var int dualLoopDone; var int oldJmpAdress; var int strlen;
	var int sPtr;
	i+=1;
	//print_s_i("weapon trail calculating...",i);	
	
	if(dualLoopDone)//loop done, now don't jump back and
	{
		dualLoopDone = false;
		
		//zs_lefthand->zs_rigthand
		//sPtr = STRINT_ToChar ("ZS_RIGTHAND");
		//MEM_CopyBytes (sPtr, 8594504, 12);
		
		//MEM_WriteInt(HookEngine_Hook_LeftWeaponTrail_JmpAdress,oldJmpAdress);
	}
	else//Jmp back to make trail of ZS_LEFTHAND node
	{
		oldJmpAdress  = MEM_ReadInt(HookEngine_Hook_LeftWeaponTrail_JmpAdress);
		
		//zs_rigthand->zs_lefthand
		sPtr = STRINT_ToChar ("ZS_LEFTHAND");
		strlen = Str_Len("ZS_LEFTHAND");
		MEM_CopyBytes (sPtr, 8594504, strlen);
		MEM_WriteInt(8594515,0);
		MEM_WriteInt(8594516,144);
		
		printdebug("#> zs_rigthand->zs_lefthand");
		//MEM_WriteInt(HookEngine_Hook_LeftWeaponTrail_JmpAdress,6452043);
		dualLoopDone = true;
	};
};