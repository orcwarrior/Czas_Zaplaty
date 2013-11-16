//called both by Startup & engine hook of MenuLeave functon 
var int Last_GAME_frameLimit;
var int Settings_CompassOn;
func void Apply_Menu_Options_CZ()
{
	//FrameLimit
	if(Hlp_StrCmp(MEM_GetGothOpt ("GAME","frameLimit"),"0"))
	{	//turn off frame limit:
   	 	MemoryProtectionOverride (6088082,7);
		MEM_WriteInt(6088082,2425393296);//4x nop
		MEM_WriteInt(6088085,2425393296);//4x nop, one nop overwritting previous one			
	}
	else
	{	//turn on frame limit:
   	 	MemoryProtectionOverride (6088082,8);
		MEM_WriteInt(6088082,-266993839);//Straight copy of original bytes
		MEM_WriteInt(6088086,-352289536);//		
	};
	
	//Compass
	if(Hlp_StrCmp(MEM_GetGothOpt ("GAME","compassEnabled"),"0"))
	{	//turn off compass
   	 	Settings_CompassOn = false;	
	}
	else
	{	//turn on compass
   	 	Settings_CompassOn = true;	
	
	};
	
	Controls_Update();//Update controls keys
	Extract_NeededKeys();//all in one	
	printdebug("Pre musicSYS Call");
	MusicSys_VolumeUpdate();
};