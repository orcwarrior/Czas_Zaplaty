////////////////////////////////////////////////////////////////////////////////
//
//  Example for the usage of the compass support script (\_intern\Compass.d).
//  Copyright (c) 2009 Nico Bendlin <nicode@gmx.net>, Legal: WTFPL Version 2.
//
////////////////////////////////////////////////////////////////////////////////

//
// You have to add an oCTriggerScript (named "COMPASS_TRIGGER") into every ZEN
// and have to call Wld_SendTrigger( "COMPASS_TRIGGER" ) from INIT_<Zen_Name>.
//
func void COMPASS_TRIGGER()
{
	if(Settings_CompassOn==false)
	{
		return;	
	};
	//TMP trigger off
	//return;
  var string f;
  var string t;
	printdebug("CompassTrigger<<START");

  f = "Compass_Line128.tga";  // line of sight
  //f = "Compass_Rose128.tga";  // compass rose (not included in the package)
 	if(COMPASS_INIT)
 	{
 		t = Compass_ForHero();
 		PrintScreen( t, 2, 2, f, 999 );
 		COMPASS_INIT = FALSE;
 		COMPASS_PTR = 0;
 	};
 	if(COMPASS_PTR==0)
	{
	var int ptr; var int arr;
	ptr = MEM_ReadInt (MEM_ReadInt (MEMINT_oGame_Pointer_Address)+48); //MEM_GAME->Desktop
	arr = MEM_ReadInt (ptr+132); //->Childs array zCViewText*
	printdebug(concatstrings("Compass: got array, items: ",inttostring(MEM_ReadInt(ptr+140))));
	
	//No items, reprint-compass:
	if(!MEM_ReadInt(ptr+140))
	{
	COMPASS_INIT = true;
	return;	
	};
	if(ptr)
	{
		var int i;
		i=0;
		var int label;
		MEM_InitLabels (); 
		label = MEM_StackPos.position; //loop start
		ptr = MEM_ReadInt(arr+i); //->arr ptr...	
		printdebug(inttostring(ptr));
		printdebug(inttostring(MEM_ReadInt(ptr)));
		if(ptr)&&(MEM_ReadInt(ptr)==zCMenuItem_vtbl)
		{
			if(ptr)
			{
				if(Hlp_StrCmp(MEM_ReadString(MEM_ReadInt(ptr+32)),f))//read font of this TextItem
				{//its compas text
					COMPASS_PTR = ptr;
					MEM_WriteString(COMPASS_PTR+12,Compass_ForHero());	//write new char
					return;//exit loop
				};  
			};
			
		}
		else if(ptr)
		{
				ptr = MEM_ReadInt (ptr);
				if(ptr)&&(MEM_ReadInt(ptr)==zCMenuItem_vtbl)
				{
					if(ptr)
					{
						if(Hlp_StrCmp(MEM_ReadString(MEM_ReadInt(ptr+32)),f))//read font of this TextItem
						{//its compas text
							COMPASS_PTR = ptr;
							MEM_WriteString(COMPASS_PTR+12,Compass_ForHero());	//write new char
							return;//exit loop
						};  
					};
					
				};
		};
		i += 4; 
		if(i>16){return;};
		MEM_StackPos.position = label; //loop end
		
	};
	}
	else if(MEM_ReadInt(COMPASS_PTR) == zCMenuItem_vtbl)
	{
		MEM_WriteString(COMPASS_PTR+12,Compass_ForHero());	//write new char	
	};
  //Wld_SendTrigger( "COMPASS_TRIGGER" );
	printdebug("CompassTrigger<<END");
  
};

