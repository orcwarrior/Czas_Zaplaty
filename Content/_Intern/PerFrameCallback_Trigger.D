//##############################################
//
//	Per Frame Callback Trigger 
//	-separated from I_Functions.d
//##############################################
		
		var int f4pressed;
var int dmg1vob; var int dmg2vob;
func void F_PERFRAMETRIGGER() 
{
	//TMP trigger off
	//return;
	//Global Instances Init off -> preformace things, operate on Adresses no instances
	//MEM_InitGlobalInst();
	//Send Trigger
// 	var string msg;
// 	msg = Float32ToString(MEM_Camera.camMatrix[0]);
// 	msg = concatstrings(msg,"  ");
// 	msg = concatstrings(msg,MEM_Camera.camMatrix[1]);
// 	print(Msg);
// 	msg = Float32ToString(MEM_Camera.camMatrix[4]);
// 	msg = concatstrings(msg,"  ");
// 	msg = concatstrings(msg,MEM_Camera.camMatrix[5]);
// 	print(Msg);
// 	msg = Float32ToString(MEM_Camera.camMatrix[8]);
// 	msg = concatstrings(msg,"  ");
// 	msg = concatstrings(msg,MEM_Camera.camMatrix[9]);
// 	print(Msg);

	Wld_SendTrigger ("PERFRAMETRIGGER"); 
	var int heroptr;var int ptr; 
	var int val;	var oCNpc hiro;
	var int rune; 	var string rune_instance;
	var ocnpc hlp;
	//Triggerscript find pointer
	if(PerFrameCallTrigger_Init)
	{
		printdebug("PerFrameCallTrigger_Init");
		ptr = MEM_SearchVobByName ("PERFRAMETRIGGER");
		
		//bugfix: sometimes it won't be able to found the trigger
		if(0>ptr)
		{ 
         printdebug("ERROR: PERFRAMETRIGGER not founded... oh my GOSH!"); 
		   return; 
	   };
		
		MEM_AssignInst (trigger, ptr);
		PerFrameCallTrigger_Init=FALSE;
	};
	//factor per frame
	if(Timer_factormotion)
	{
		MEM_WriteInt(MEMINT_zTimer_Address,Timer_factormotion);
	};
	
	printdebug("FrameCallBack_HandleKeystorkes");
	//Keys Check Per-Frame
	FrameCallBack_HandleKeystorkes();
	
	printdebug("R_SWDDMG_PTR");
	
	//triggers Phases (optimization thing)
	if(Trigger7Phase)
	{
		if(Trigger7Phase==1)
		{
			EVT_TRIGGER7_PHASE1();
		}
		else if(Trigger7Phase==2)
		{
			EVT_TRIGGER7_PHASE2();
		}
		else if(Trigger7Phase==3)
		{
			EVT_TRIGGER7_PHASE3();
		};	
	};
	
	if(R_SWDDMG_PTR)//disable ANY hero damage
 	{
 		hiro = hlp_getnpc(hero);
 		ptr = MEM_InstGetOffset(hiro);	
 		ptr = MEM_ReadInt(ptr+2488);//anictrl
 		
 		val = MEM_ReadInt(ptr+432);
 		MEM_WriteInt(ptr+432,val &~ oCAiHuman_bitfield_comboCanHit);
 	};   

 	 	//ItArRuneFireball
		//RuneSwd_Equip_RuneChoice_Fireball
 	 
//  	 //anotha bugfix o,O
//  	 if(RS_ExchangeSwd_bugfix)&&(!Npc_HasEquippedMeleeWeapon(hero))
//  	 {
// 	 	printdebug("part2 of equiping");
// 	 	RS_ExchangeSwd_Part2(RuneSWD_lp);
//  	 };
 	 	
/*
 	if(!dmg1vob)
 	{
	 	dmg1vob = MEM_SearchVobByName ("DMG1");
 	};
 	if(!dmg2vob)
 	{
	 	dmg2vob = MEM_SearchVobByName ("DMG2");
 	};	
 	
	MEM_WriteInt(dmg1vob+72 ,HeroDamage_Hitpos1_X);
	MEM_WriteInt(dmg1vob+88 ,HeroDamage_Hitpos1_Y);
	MEM_WriteInt(dmg1vob+104,HeroDamage_Hitpos1_Z);	
	 	
	MEM_WriteInt(dmg2vob+72 ,HeroDamage_Hitpos2_X);
	MEM_WriteInt(dmg2vob+88 ,HeroDamage_Hitpos2_Y);
	MEM_WriteInt(dmg2vob+104,HeroDamage_Hitpos2_Z);	 
*/	

	//Triggers needed to be done evry frame:
	printdebug("I_TriggerCinemaScope");
	I_TriggerCinemaScope();
	I_TriggerFadeScreen();
	I_TriggerScreenBlend();
	I_TriggerFovMorph();
	SleepFX_PerFrameHandle();
	MsgManager_DoFrame();
//	OptimizationVobLights_PerFrameTidy();
	
	printdebug("FX_TransitionDoFrameStep");
	if(SkyController_Ptr)
	{
		FX_TransitionDoFrameStep();
	};
   
	FX_RebelMine();
	FX_NecroLocation();
	printdebug("END OF F_PERFRAMETRIGGER");
	
	printdebug("PerFramMission_Funcs");
	PerFramMission_Funcs();
	
	//set trigger fire to next frame
	trigger._zCVob_nextOnTimer = MEM_ReadInt(MEMINT_zTimer_Address+8);//MEM_Timer.totalTimeFloat; 
};
