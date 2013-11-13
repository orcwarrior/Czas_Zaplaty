const int LightDisabled = -2;
const int LightDisable_Range = 500;
const string DynamicLights_Name = "VOBLIGHT_DYNAMIC";
var int AllVobLightsDyn_Array;
var int ActiveVobLightsDyn_Array;

//File is disabled!!!

var int LightOptimization_TouchStamp;

// Remove all vobs that range is over
// (called every frame)
func void HookTestingFunc()
{
	MEM_WriteInt(HookTesting,5468395);
// 	var int arrayPtr; var int arraySize;
// 	var int i; var int loopStart; var int this;
// 	var zCVobLight vobLight;
// 	arrayPtr = MEM_World.bspTree_renderLightList_array;
// 	arraySize = MEM_World.bspTree_renderLightList_numInArray;
// 	
// 	//walk through array
// 	MEM_InitLabels();
// 	//untrigger all lights from array
// 	i = 0;
// 	
// 	if(!arraySize)
// 	{//No rendered lights, skipping...
// 		return;
// 	};
// 	
// 	loopStart = MEM_StackPos.position;
// 	this = MEM_ReadInt(arrayPtr+i*4);
// 
// 	if(this){
// 		MEM_AssignContentInst(vobLight,this);  
// 		MEM_UntriggerVob(this);
// 		vobLight._zCVob_visualAlpha=LightDisabled;
// 		//unfortunealy, I can't simply remove that idx from array by ArrayRemoveIndex function
// 		MEM_World.bspTree_renderLightList_numInArray -= 1; 
// 		arraySize = MEM_World.bspTree_renderLightList_numInArray;
//     	MEM_WriteIntArray (MEM_World.bspTree_renderLightList_array, i, MEM_ReadIntArray (MEM_World.bspTree_renderLightList_array, arraySize));
// 		printdebug_s_i("># removed render light nr: ",i);
// 		i-=1;
// 	};
// 	i+=1;
// 	if(i<arraySize)
// 	{
// 		
// 		MEM_StackPos.position = loopStart;
// 	};	
// 		printdebug_s_i("># all lights removed: ",i);
};
func void Hook_PreVobLightRender()
{
	//Get processed zCVobLight
	var int ptr; var zCVobLight vobLight;
	ptr = MEM_ReadInt(ECX+ESI*4);
	MEM_AssignContentInst(vobLight,ptr);
	
	//Light was disabled before? Add it to array
	if(vobLight._zCVob_visualAlpha==LightDisabled)//onltriger that value |= 0x20;
	{
		MEM_ArrayInsert (ActiveVobLightsDyn_Array,ptr);
		MEM_TriggerVob(ptr);
	};	
	//UpdateTimeStamp of Light:
	vobLight._zCVob_visualAlpha = LightOptimization_TouchStamp;
	
	
	//skippin all lights? This make light not turned on again automatically
	//	MEM_WriteInt(HookEngine_Hook_PreRenderVobList_JmpAdress,5366043);
};

var int VobsUntriggered;
func void OptimizationVobLights_CollectLights()
{
	AllVobLightsDyn_Array = MEM_SearchAllVobsByName(DynamicLights_Name);
	//create an new array of active light too:
	ActiveVobLightsDyn_Array = MEM_ArrayCreate ();	
	LightOptimization_TouchStamp=0;
	
	
};
func void OptimizationVobLights_UnTriggerAllLights()
{
	var int i; var int loopStart; var int this; var int arrPtr; var int arrSize;
	var zCVobLight vobLight;	
	MEM_InitLabels();
	printdebug("># untrigger all Lights");
	//untrigger all lights from array
	i = 0;
	arrPtr = MEM_ReadInt(AllVobLightsDyn_Array);
	arrSize = MEM_ReadInt(AllVobLightsDyn_Array+8);
	if(arrSize)
	{
	printdebug("># ... lights untriggered before!!!");		

	};
	
	loopStart = MEM_StackPos.position;
	this = MEM_ReadInt(arrPtr+i*4);
	// debug infos:
	//printdebug_s_i_s_i("># Untriggering light[",i,"] ptr: ",this);
	if(this){
		MEM_AssignContentInst(vobLight,this);  
		MEM_UntriggerVob(this);
		vobLight._zCVob_visualAlpha=LightDisabled;
	};
	i+=1;
	if(i<arrSize-1)
	{
		
		MEM_StackPos.position = loopStart;
	};
	

	
};

// Untriggers all light from acriveLightsArray, that wasn't rendered last frame.
// Need to be called by perframe trigger.
func void OptimizationVobLights_PerFrameTidy()
{
	return;
	var int i; var int loopStart; var int this; var int arrPtr; var int arrSize;
	var zCVobLight vobLight; var int removedLights;
	removedLights=0;
	MEM_InitLabels();

	i = 0;
	loopStart = MEM_StackPos.position;
	arrPtr = MEM_ReadInt(ActiveVobLightsDyn_Array);
	arrSize = MEM_ReadInt(ActiveVobLightsDyn_Array+8);
	if(arrSize)//array isn't blank
	{
		//		printdebug_s_i_s_i("># read from:",arrPtr,"+",i*4);
		this = MEM_ReadInt(arrPtr+(i*4));
		
		if(this){
			MEM_AssignContentInst(vobLight,this);  
			if(vobLight._zCVob_visualAlpha != LightOptimization_TouchStamp)
			{//light wasn't rendered last frame, untrigger it:
// 				if(vobLight._zCVob_visualAlpha==LightDisabled)
// 				{
// 					printdebug_s_i("># damn it shouldnt be disabled ;(",0); 
// 				};
				MEM_UntriggerVob(this);
				vobLight.rangeInv=0;
				vobLight._zCVob_visualAlpha=LightDisabled;
				removedLights+=1;
				MEM_ArrayRemoveIndex (ActiveVobLightsDyn_Array,i);
				arrSize = MEM_ReadInt(ActiveVobLightsDyn_Array+8);
			};
		}
		else//blank item, how it could be possible?
		{
			removedLights+=1;
			MEM_ArrayRemoveIndex (ActiveVobLightsDyn_Array,i);
			arrSize = MEM_ReadInt(ActiveVobLightsDyn_Array+8);		
		};
		if(i<arrSize-1)
		{
			i+=1;    
			MEM_StackPos.position = loopStart;
		};
	};
	LightOptimization_TouchStamp+=1;
	if(LightOptimization_TouchStamp>1024){LightOptimization_TouchStamp=0;};
	//print_s_i_s_i("active/all ",arrSize,"/",MEM_ReadInt(AllVobLightsDyn_Array+8));
// debug infos:	
// 	if(removedLights==0){return;};
// 	printdebug_s_i("># LightActive:",arrSize);
// 	printdebug_s_i("># removedLights:",removedLights);
// 	printdebug(concatstrings("># ",MEM_ArrayToString(ActiveVobLightsDyn_Array)));
	
};