func void CopyNpcAni(var int source, var int dest)
{
	var int copyfrom; var int copyto; var int sourceaniID; var int destAniCtrlPtr;
	var int nextaniID; var int ani;  var int aniID;
	var oCNpc mirror;
 	if(source==0)||(dest==0)
 	{ return; };
 	if(MEM_ReadInt(source)!=oCNpc_vtbl)||(MEM_ReadInt(dest)!=oCNpc_vtbl)
 	{//one of npc is invalid, so anyway it don't gonna be working
 		return;	
 	};
	
	 MEM_AssignInst(mirror,dest);
	
	//First layer...
	copyfrom = MEM_ReadInt(source+2488);//oCAniCtrl
	copyfrom = MEM_ReadInt(copyfrom+104);//zCModel
	copyfrom = MEM_ReadInt(copyfrom+56);//*ActiveAniLayer1
	
	destAniCtrlPtr = MEM_ReadInt(dest+2488);//oCAniCtrl
	copyto = MEM_ReadInt(destAniCtrlPtr+104);//zCModel
	copyto = MEM_ReadInt(copyto+56);//*ActiveAniLayer1
	
	if(MEM_ReadInt(copyfrom)!=MEM_ReadInt(copyto))
	{
		
		ani = MEM_ReadInt(copyfrom);
		if(ani)
		{
		aniID = MEM_ReadInt(ani+76);
		};
		printdebug(inttostring(aniID));
		ani = MEM_ReadInt(ani+148);
		//safe method if next ani not exist:
		if(ani)
		{
		nextaniID = MEM_ReadInt(ani+76);
		};
		printdebug(inttostring(nextaniID));
		
		Npc_ClearAiQueue(mirror);
		CALL_IntParam(nextaniID);
		CALL_IntParam(aniID);		
		CALL__thiscall(destAniCtrlPtr,zCAniCtrl_StartAni_offset);

	//StartAniMEM_CopyBytes (copyfrom,copyto,8);
	}
	else//already same ani...
	{
		MEM_WriteInt(copyto+12,MEM_ReadInt(copyfrom+12));
	};
	

	//it's nothing needed, break right here:
	return;
	
	
	//Second layer....
	copyfrom = MEM_ReadInt(source+2488);//oCAniCtrl
	copyfrom = MEM_ReadInt(copyfrom+104);//zCModel
	copyfrom = MEM_ReadInt(copyfrom+60);//*ActiveAniLayer2

	destAniCtrlPtr = MEM_ReadInt(dest+2488);//oCAniCtrl
	copyto = MEM_ReadInt(destAniCtrlPtr+104);//zCModel
	copyto = MEM_ReadInt(copyto+60);//*ActiveAniLayer1
	if(copyfrom==0)||(copyto==0)
	{ return; };
	if(MEM_ReadInt(copyfrom)!=MEM_ReadInt(copyto))
	{
		ani = MEM_ReadInt(copyfrom);
		nextaniID = 0;
		if(ani)
		{
		aniID = MEM_ReadInt(ani+76);
		};
		printdebug(inttostring(aniID));
		//nextani:
		//safe method if next ani not exist:
		if(ani)
		{
		ani = MEM_ReadInt(ani+148);
		nextaniID = MEM_ReadInt(ani+76);
		};
		printdebug(inttostring(nextaniID));
		if(aniID)
		{
		CALL_IntParam(nextaniID);
		CALL_IntParam(aniID);		
		CALL__thiscall(destAniCtrlPtr,zCAniCtrl_StartAni_offset);
		};
	}
	else//already same ani...
	{
		MEM_WriteInt(copyto+12,MEM_ReadInt(copyfrom+12));
	};	
	
};

func void MirrorNpc(var int npc_id, var int mirror_id)
{
	var oCNpc npc; var oCNpc mirror;
	var int npcptr; var int mirrorptr;

	npc = Hlp_GetNpc(npc_id);
	mirror = Hlp_GetNpc(mirror_id);

	if(!Hlp_IsValidNpc(mirror))||(!Hlp_IsValidNpc(npc))
	{  //not initialised yet?
		Wld_InsertNpc(mirror_id,"XXX");	
		return;
	};

	
	//make mirror not able to focus!
	mirror._zCVob_type = 2;
	
	//disable cdstat/cddyn
	mirror._zCVob_vob_bitfield = mirror._zCVob_vob_bitfield & ~zCVob_bitfield0_collDetectionDynamic;
	mirror._zCVob_vob_bitfield = mirror._zCVob_vob_bitfield & ~zCVob_bitfield0_collDetectionStatic;

	//Copy position of hero
	npcptr = MEM_InstToPtr(npc);
	mirrorptr = MEM_InstToPtr(mirror);
	MEM_CopyBytes (npcptr+60,mirrorptr+60,64);//copy trafo of hero
	mirror._zCVob_trafoObjToWorld[3] = npc._zCVob_trafoObjToWorld[3];
	mirror._zCVob_trafoObjToWorld[11] = npc._zCVob_trafoObjToWorld[11];
	//calculate pos y offset
 	var int y; var int yfloor; var int hlp;
 	y = npc._zCVob_trafoObjToWorld[7];
 	yfloor = npc.anictrl;
 	yfloor = MEM_ReadInt(yfloor+132);
 	hlp = mulf(yfloor,mkf(2)); //difference = over_floor x 2
 	hlp = addf(hlp,mkf(203)); // + 200 (from feet to midle of npc height x 2)
 	y = subf(y,hlp);
 	mirror._zCVob_trafoObjToWorld[7] = y;
	
//  	CALL_IntParam(mkf(180));		
// 	CALL__thiscall(MEM_InstToPtr(mirror),zCVob_RotateWorldY_offset);
	//disable sounds of mirror:
	mirror.soundVob = 0;
	mirror.soundPosition[0] = mkf(-131072);
	mirror.soundPosition[1] = mkf(-131072);
	
	//gravity?
	mirror.mass = 0;
	//restart falldown dist:
//	hlp = npc.anictrl;
//	MEM_WriteInt(hlp+160,0);

	
	//Copy ani:
	CopyNpcAni(npcptr,mirrorptr);	
};
