//#################################################################
//
//  Schürfen nach ClassDef
//
//#################################################################

func int MEM_GetClassDef (var int vtblPtr) {
	if (!vtblPtr) {
		MEM_Error ("MEMINT_GetClassDef: vtblPtr == 0.");
		
		return 0;
	};
		//In obj._vtbl[0] steht die Adresse der Funktion, die ClassDef zurückgibt.
	//Diese Funktion besteht aus einem einfachen "mov eax" (1 byte), der Adresse (4 byte) und einem "retn" (1 byte).
		//obj._vtbl[0] contains the address of a virtual function that returns
	//the classDef of the class of the object.
	//This function contains of a single "mov" command (1 byte) that is followed by the address that is of interest here.
	var int a;
 	a = MEM_ReadIntUnsave (vtblPtr);
	a = MEM_ReadIntUnsave(1 + a);
	return a;
};

func string MEM_GetClassName (var int vtblPtr) {
	var int classDef;
	classDef = MEM_GetClassDef (vtblPtr);
		if (classDef) {
		return MEM_ReadString (classDef); //gleich die erste Eigenschaft / first property of zCClassDef.
	};
	return "";
};
func int MEM_GetClassSize (var int vtblPtr) {
	var int classDef;
	classDef = MEM_GetClassDef (vtblPtr);
		if (classDef) {
		return MEM_ReadInt (classDef+76); //gleich die erste Eigenschaft / first property of zCClassDef.
	};
	return 0;
};
func void MEM_PrintClassDump(var int vtblPtr) {
	var int classDef;
	classDef = MEM_GetClassDef (vtblPtr);
		if (classDef) {
 	Checkadress(classDef,96,1,1);
	};
};
//=================================
// TimerSetMotion
//=================================
//use mkf!
/*sample when factor isn't integer
	0.4
	var int a; var int b;
	a = mkf(4);
	b = mkf(10);
	a = divf(a,b);		
	TimerSetMotion(a);	
*/
//SHOULD WORK BUT STRANGE THINGS CAN HAPPEN
var int Timer_factormotion; 
func void TimerSetMotion(var int factor)
{	Timer_factormotion = factor;
};
//=================================
// SkyController_Outdoor_Init
//=================================

func void SkyController_Outdoor_Init()
{	MEM_InitGlobalInst();
	var int skyptr;
	var int ptr;
	ptr = MEM_SearchVobByName("SKYDOME_LAYER1");//zCVob
	ptr = MEM_ReadInt(ptr+184);//zCVisualPFX
	ptr = MEM_ReadInt(ptr+84);//zCParticleFx
	ptr = MEM_ReadInt(ptr+620);//zCMesh
	var int SkyDomeMesh1;
	SkyDomeMesh1 = ptr;
	skyptr = MEM_InstGetOffset(MEM_SkyController);
	ptr = skyptr+1424;//SkyLayer0	
//	MEM_writeint(ptr,0);	
	ptr = ptr+4;
//	MEM_writeint(ptr,0);	
	ptr = ptr+4;
	MEM_writeint(ptr,0);	
	ptr = ptr+4;	
	MEM_writeint(ptr,0);	
	ptr = ptr+4;	
		MEM_writeint(ptr,SkyDomeMesh1);
	ptr = ptr+4;
	MEM_writeint(ptr,1);
	ptr = ptr-16;
	//MEM_writeint(ptr,SkyDomeMesh1);	
	ptr = ptr-4;
	MEM_writeint(ptr,SkyDomeMesh1);	
	// 	ptr = skyptr+200;//skylayer0 mode
// 	MEM_writeint(ptr,1);	
// 	ptr = skyptr+264;//skylayer1 mode
// 	MEM_writeint(ptr,1);	
		//SIZE SCALE
	ptr = skyptr+244;
	MEM_writeint(ptr,704643072);	
	ptr = ptr+4;
	MEM_writeint(ptr,1);

	//fog color override
	ptr = skyptr+1408;
//	MEM_writeint(ptr,-4278190081);	

	ptr = skyptr+1364;
	ptr = MEM_ReadInt(ptr);
	MEM_writeint(ptr,mkf(255));	//R
	ptr = ptr+4;
	MEM_writeint(ptr,mkf(255));	//G
	ptr = ptr+4;
	MEM_writeint(ptr,mkf(255));	//B

		
	ptr = skyptr+1504;
//	MEM_writeint(ptr,mkf(125));	//R
	ptr = ptr+4;
//	MEM_writeint(ptr,mkf(0));	//G
	ptr = ptr+4;
//	MEM_writeint(ptr,mkf(0));	//B	
	ptr = ptr+4;
//	MEM_writeint(ptr,mkf(200));	//A
		ptr = ptr+4;
// 	MEM_writeint(ptr,mkf(200));	//R
 	ptr = ptr+4;
//	MEM_writeint(ptr,mkf(180));	//G
 	ptr = ptr+4;
//	MEM_writeint(ptr,mkf(145));	//B	
	ptr = ptr+4;
//	MEM_writeint(ptr,mkf(200));	//A

	ptr = skyptr+1536;
	MEM_writeint(ptr,mkf(60));	//SUNSIZE		
		
// 	ptr = skyptr+1656;
// 	MEM_writeint(ptr,0);	//rain start
// 	MEM_writeint(ptr+4,1065353216);	//rain end
		
	MEM_SkyController.underwaterColor = RGBAToZColor(158,255,210,55);
		var int label;
	ptr = skyptr+328;	
	MEM_InitLabels (); 
	label = MEM_StackPos.position; 
	MEM_WriteInt(ptr,-8685199);
	ptr += 4; 
		if (ptr <= skyptr+1352) {      
	MEM_StackPos.position = label; 
 	};
 	var int relightctr;
 	relightctr = MEM_ReadInt(ptr);
	MEM_WriteInt(ptr,relightctr+1);
		
	//MEM_WriteInt(skyptr+36,skyptr+324);//polyclutptr
	ptr = skyptr+40;	//color changed
	MEM_WriteInt(ptr,1);
		ptr = skyptr+104;	//initdone
	MEM_WriteInt(ptr,0);

	
};

func int zCTexture_GetPointer(var string name)
{	var int ptr;
	ptr = 0;
	if(Str_Len(name))
 	{
 		CALL_zStringPtrParam(name);
 		CALL__cdecl (zCTexture__SearchName_offset);
 		ptr = CALL_RetValAsPtr();
 		if(!ptr)//still not loaded? load it now!
 		{
	 		CALL_zStringPtrParam(name);
 			CALL__cdecl (zCTexture__LoadSingle_offset);
 			ptr = CALL_RetValAsPtr();			 	
 		};
	};
	return ptr;	
};

//=============================================
// Cinema Scope
//=============================================

var int FX_CinemaScopeEnabled_Adr;
var int FX_CinemaScopeColor_Adr;
var int CinemaScopeState;//0-off;1-on;2-off->on; 3-on->off
var int screen_y_size;

func void I_EnableCinemaScope()
{	
	printdebug_s_i("CinemaScope: I_EnableCinemaScope:",FX_CinemaScopeEnabled_Adr);
	var int ccsptr; var int View_ptr; var int tmp;
	MEM_InitGlobalInst();
	CinemaScopeState=2;
	//Camera.cinemascope
	MEM_GAME.array_view_visible[3]=1;
	MEM_GAME.array_view_enabled[3]=1;
	ccsptr = MEM_InstGetOffset(MEM_CAMERA);
	ccsptr = ccsptr+2248;
	MEM_WriteInt(ccsptr,1);//enable
	ccsptr = ccsptr+4;	
	FX_CinemaScopeColor_Adr = ccsptr;
	MEM_WriteInt(ccsptr,0);//set almost opanque 4 trigger to now what to do
	//Now trigger will know that he has to change color
		//disable zoom effect
	View_ptr=MEM_InstGetOffset(MEM_GAME)+60;
	View_ptr=MEM_ReadInt(View_ptr);
	View_ptr=View_ptr+4;
	MEM_WriteInt(View_ptr,0);

	//remove tex - conversation
	View_ptr=MEM_InstGetOffset(MEM_GAME)+52;
	View_ptr=MEM_ReadInt(View_ptr);
	View_ptr=View_ptr+60;
	MEM_WriteInt(View_ptr,0);
	//change ypos of conversation window
		View_ptr=View_ptr+8;
	MEM_WriteInt(View_ptr,1);
		//choicebox move
	View_ptr = MEM_ReadInt(MEMINT_oCInformationManager_Address+28);
	screen_y_size=MEM_ReadInt(View_ptr+76); //4c
	screen_y_size=MEM_ReadInt(screen_y_size+68); //44
	view_ptr = view_ptr+60;//
	if(screen_y_size<=768)
	{
	tmp=screen_y_size*21/24 - ((screen_y_size*21/24)%1);
	MEM_WriteInt(View_ptr,tmp);//3C /nothing /0 - y moved		
	view_ptr = view_ptr+8;
	MEM_WriteInt(View_ptr,screen_y_size-tmp);//44 //rest of screen for box			
	}
	else
	{
		tmp=screen_y_size*113/128; tmp = tmp - (tmp%1);
		if(screen_y_size-tmp>120)//if there is more than 120 px at the cinema bar - center box
		{
		tmp = tmp + (screen_y_size-tmp-120)/2;
		tmp = tmp - (tmp%1);
		MEM_WriteInt(View_ptr,tmp);//3C  - y moved		
		view_ptr = view_ptr+8;
		MEM_WriteInt(View_ptr,120);//44 //120 px for box				
		}
		else
		{
		MEM_WriteInt(View_ptr,tmp);//3C  - y moved			view_ptr = view_ptr+8;
		view_ptr = view_ptr+8;		
		MEM_WriteInt(View_ptr,screen_y_size-tmp);//44 //rest of screen for box			
		};
	};
	view_ptr = view_ptr+28;
	MEM_WriteInt(View_ptr,0); //60 tex
};
/*
*/
func void I_DisableCinemaScope()
{	
	printdebug_s_i("CinemaScope: I_DisableCinemaScope:",FX_CinemaScopeEnabled_Adr);
	var int ccsptr; var int view_ptr;
	MEM_InitGlobalInst();
	CinemaScopeState=3;
	///Camera.cinemascope
	ccsptr = MEM_InstGetOffset(MEM_CAMERA);
	ccsptr = ccsptr+2252;
	FX_CinemaScopeColor_Adr = ccsptr;
	MEM_WriteInt(ccsptr,-16777216);//set almost full visible
	//Now trigger will know that he has to change color

	//disable zoom effect
// 	View_ptr=MEM_InstGetOffset(MEM_GAME)+60;
// 	View_ptr=MEM_ReadInt(View_ptr);
// 	View_ptr=View_ptr+4;
// 	MEM_WriteInt(View_ptr,0);	
	/*	//change ypos of conversation window
	View_ptr=MEM_InstGetOffset(MEM_GAME)+52;
	View_ptr=MEM_ReadInt(View_ptr);
	View_ptr=View_ptr+68;
	MEM_WriteInt(View_ptr,1);
*/	
};
// Ork: This function is pain in the ass :/
// Powoduje crasha przy wczytywania save'a którego otrzyma³em w temacie na forum... [TODO]
func void I_TriggerCinemaScope()
{	if(CinemaScopeState==0)
	{ return; };//break if state=0	
	if(CinemaScopeState>1)//Fade IN/OUT Alpha
	{
		var int CS_Color;
		CS_Color = MEM_ReadInt(FX_CinemaScopeColor_Adr);
		if(CinemaScopeState==2)//SET ON
		{
			printdebug("CinemaScope: State 2, (Fade In)");
			if(CS_Color==0)//-4294967295
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-4160749568);
			}
			else if(CS_Color==-4160749568)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-3959422976);
			}
			else if(CS_Color==-3959422976)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-3724541952);
			}
			else if(CS_Color==-3724541952)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-3489660928);
			}
			else if(CS_Color==-3489660928)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-3254779904);
			}
			else if(CS_Color==-3254779904)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-3019898880);
			}
			else if(CS_Color==-3019898880)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-2785017856);
			}
			else if(CS_Color==-2785017856)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-2550136832);
			}
			else if(CS_Color==-2550136832)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-2315255808);
			}
			else if(CS_Color==-2315255808)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-2080374784);
			}
			else if(CS_Color==-2080374784)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-1845493760);
			}
			else if(CS_Color==-1845493760)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-1610612736);
			}
			else if(CS_Color==-1610612736)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-1375731712);
			}
			else if(CS_Color==-1375731712)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-1140850688);
			}
			else if(CS_Color==-1140850688)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-905969664);
			}
			else if(CS_Color==-905969664)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-671088640);
			}
			else if(CS_Color==-671088640)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-469762048);
			}
			else if(CS_Color==-469762048)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-234881024);
			}
			else if(CS_Color==-234881024)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-16777216);
				CinemaScopeState=1;//on
			};			
		}
		else
		{
			printdebug("CinemaScope: State 3, (Fade Out)");
			if(CS_Color==-16777216)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-234881024);
			}
			else if(CS_Color==-234881024)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-469762048);
			}
			else if(CS_Color==-469762048)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-671088640);
			}
			else if(CS_Color==-671088640)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-905969664);
			}
			else if(CS_Color==-905969664)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-1140850688);
			}
			else if(CS_Color==-1140850688)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-1375731712);
			}
			else if(CS_Color==-1375731712)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-1610612736);
			}
			else if(CS_Color==-1610612736)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-1845493760);
			}
			else if(CS_Color==-1845493760)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-2080374784);
			}
			else if(CS_Color==-2080374784)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-2315255808);
			}
			else if(CS_Color==-2315255808)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-2550136832);
			}
			else if(CS_Color==-2550136832)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-2785017856);
			}
			else if(CS_Color==-2785017856)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-3019898880);
			}
			else if(CS_Color==-3019898880)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-3254779904);
			}
			else if(CS_Color==-3254779904)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-3489660928);
			}
			else if(CS_Color==-3489660928)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-3724541952);
			}
			else if(CS_Color==-3724541952)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-3959422976);
			}
			else if(CS_Color==-3959422976)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,-4160749568);
			}
			else if(CS_Color==-4160749568)
			{
				MEM_WriteInt(FX_CinemaScopeColor_Adr,0);
				CinemaScopeState=0;//off
			};				
		};	
	};	
	printdebug_s_i("CinemaScope: State ~0, Adr:",FX_CinemaScopeEnabled_Adr);
	//set cinema scope on in camera
	MEM_WriteInt(FX_CinemaScopeEnabled_Adr,1);
};

//=============================================
//  FadeScreenToBlack - based on cinemascopes
//=============================================

var int FadeScreenOverlayColorR;
var int FadeScreenOverlayColorG;
var int FadeScreenOverlayColorB;
var int FadeScreenOverlayBlend;
var int FadeScreenColorPtr;
var int FadeScreen_vpf;
var int FadeScreenState;//0-off;1-on;2-off->on; 3-on->off
func void I_FadeScreenToBlack(var int value_per_frame)
{	
	var int sbptr;
	FadeScreen_vpf = value_per_frame;
	MEM_InitGlobalInst();
	FadeScreenState=2;
	//Camera.cinemascope
	MEM_GAME.array_view_visible[0]=1;
	MEM_GAME.array_view_enabled[0]=1;
	sbptr = MEM_InstGetOffset(MEM_CAMERA);
	sbptr = sbptr+2240;
	MEM_WriteInt(sbptr,1);//enable
	FadeScreenColorPtr = sbptr+4;
	MEM_WriteInt(FadeScreenColorPtr,RGBAToZColor (FadeScreenOverlayColorR,FadeScreenOverlayColorG,FadeScreenOverlayColorB,1));//set almost opanque 4 trigger to now what to do
		//I dunno wtf is that but i copied it from another function (was working good :D)
	//change blend type:
	sbptr = MEM_GAME.array_view[0];

	//TERE IS 2 LAYERS: CAMERA screen BG -> THIS SCREEN
	MEM_WriteInt(sbptr+28,FadeScreenOverlayBlend);//blendfunc
};
/*
*/
func void I_FadeScreenFromBlack(var int value_per_frame)
{	
	var int sbptr;
	FadeScreen_vpf = value_per_frame;
	MEM_InitGlobalInst();
	FadeScreenState=3;
// 	MEM_GAME.array_view_visible[0]=1;
// 	MEM_GAME.array_view_enabled[0]=1;
	sbptr = MEM_InstGetOffset(MEM_CAMERA);
	sbptr = sbptr+2240;
	MEM_WriteInt(sbptr,1);//enable
	FadeScreenColorPtr = sbptr+4;	
	MEM_WriteInt(FadeScreenColorPtr,RGBAToZColor (FadeScreenOverlayColorR,FadeScreenOverlayColorG,FadeScreenOverlayColorB,255));//set almost opanque 4 trigger to now what to do	
};

func void I_TriggerFadeScreen()
{	if(FadeScreenState==2)//fade to black
	{

		MEM_WriteInt(FadeScreenColorPtr-4,1);//enable		
		MEM_WriteInt(FadeScreenColorPtr,RGBAToZColor (FadeScreenOverlayColorR,FadeScreenOverlayColorG,FadeScreenOverlayColorB,zColor_a(MEM_ReadInt(FadeScreenColorPtr))+FadeScreen_vpf));	
		if(zColor_a(MEM_ReadInt(FadeScreenColorPtr))>=254)
		{
		FadeScreenState=1;	
		};	
	}
	else if(FadeScreenState==3)//fade from black
	{
		MEM_WriteInt(FadeScreenColorPtr-4,1);//enable		
		MEM_WriteInt(FadeScreenColorPtr,RGBAToZColor (FadeScreenOverlayColorR,FadeScreenOverlayColorG,FadeScreenOverlayColorB,zColor_a(MEM_ReadInt(FadeScreenColorPtr))-FadeScreen_vpf));	
		if(zColor_a(MEM_ReadInt(FadeScreenColorPtr))==0)
		{
			FadeScreenState=0;	
			
			//reset colors
			FadeScreenOverlayColorR = 0;
			FadeScreenOverlayColorG = 0;
			FadeScreenOverlayColorB = 0;
		};		
	}
	else if(FadeScreenState==1)
	{
		MEM_WriteInt(FadeScreenColorPtr-4,1);//enable		
		MEM_WriteInt(FadeScreenColorPtr, RGBAToZColor (FadeScreenOverlayColorR,FadeScreenOverlayColorG,FadeScreenOverlayColorB,255));//0,0,0,255		
	};
	};

//==============================================
//	SearchForWeaponPtrInInventory
//==============================================
//	ptr = slf*+oCNPC_inventory0_next_offset = x + 1364;//0x0554
//	returns ptr to Item
const int oCItem_instanz_offset = 744;

func int SearchForWeaponPtrInInventory(var int ptr, var int id)
{	var int label; var int val;  var int ctr;
	ctr=0;
	MEM_InitLabels (); 
	ptr=ptr+4;
	label = MEM_StackPos.position; 
	val = MEM_ReadInt(ptr);
	if(val>1200000)&&(val%4==0)//it's pointer probably
	{
		if(MEM_ReadInt(val+oCItem_instanz_offset)==id)
		{
			//Found item -> return pointer
			return val;
		};
	};
	ptr = MEM_ReadInt(Ptr+4);//next ItemListSort 
	if(ptr)
	{
		ptr += 4;//next ItemListSort.data 	
		ctr += 1;
    	
		if(ctr<=1024)
		{
			MEM_StackPos.position = label; 
		}
		else
		{
			return 0;	
		};
	};  	
};
/*
//#############################################
//	
//	SwitchToFirstInCat
// 	function switch weapon 2 first in category
//	
//#############################################

var int EquipWeapon_bugfix1;
var int EquipWeapon_adr1_bugfix; var int EquipWeapon_val1_bugfix;
var int EquipWeapon_adr2_bugfix; var int EquipWeapon_val2_bugfix;
func void SwitchToFirstInCat(var int ptr, var int id)
{	var int label; var int val;  
	var int ctr; var int firstptr;
	var int copyadr;
	ctr=0;
	MEM_InitLabels (); 
	ptr=ptr+4;
	firstptr=MEM_ReadInt(ptr+4)+4;
	label = MEM_StackPos.position; 
	val = MEM_ReadInt(ptr);		
	if(val>1200000)&&(val%4==0)//it's pointer probably
	{
		printdebug(MEM_ReadString(val+16));
		if(MEM_ReadInt(val+oCItem_instanz_offset)==id)
		{
			if(firstptr!=ptr)//skip if item is first in category
			{
				//Found item to SWAP -> SWAPING
				copyadr = val;
				val = MEM_ReadInt(firstptr);
				MEM_WriteInt(ptr,val);
				MEM_WriteInt(firstptr,copyadr);
				EquipWeapon_bugfix1=true;
				EquipWeapon_adr1_bugfix = ptr;
				EquipWeapon_val1_bugfix = copyadr;
				EquipWeapon_adr2_bugfix = firstptr;
				EquipWeapon_val2_bugfix = val;
			}
			else
			{
			EquipWeapon_val1_bugfix	 = val;
			EquipWeapon_bugfix1=true;
			};
			ctr=1025;	
		};
	};
	ptr = MEM_ReadInt(Ptr+4);//next ItemListSort 
	if(ptr)
	{
		ptr += 4;//next ItemListSort 	
		ctr += 1;
    	
		if(ctr<=1024)
		{
			MEM_StackPos.position = label; 
		};
	}; 	
};

//==============================================
//	EquipWeapon
//==============================================
const int oCNPC_attribute_offset = 388;//0x0184
const string CANNOT_USEFONT = "font_default.tga";
var c_npc EquipWeapon_weapon_npc;
var c_npc Memory_Holder;
func void EquipWeapon(var c_npc slf, var c_item itm)
{	//IMPORTANT!!! Replace MOD_ItemMaster 
	//with any of your npc's that:
	//-is inserted in every world
	//-shouldn't be able to seen by hero
	//(function uses news system so, strange
	//things could happen if some "NEWS" would
	//be added to npc u can see/talk in game)
	Memory_Holder = HLP_GETNPC(MOD_ItemMaster);
	var int slf_ptr; 
	var c_item oldweapon;
	var int		nDifference;	
	var string  strDifference;  
	var string	strMessage;	
	var string strAttribute; 
	printdebug("EQUIPING");
	//Check if slf have this weapon
	if(!Npc_HasItems(slf,Hlp_GetInstanceID(itm)))
	{ 	return; };
		//EquipWeapon unequip old weapon by remove it and insert then
	slf_ptr = oCNpc_GetPointer(slf);
	//>>item is melee?
	if(itm.mainflag == ITEM_KAT_NF)&&(Npc_HasEquippedMeleeWeapon(slf))
	{
		oldweapon = Npc_GetEquippedMeleeWeapon(slf);
	}
	//>>item is far weapon
	else if(itm.mainflag == ITEM_KAT_FF)&&(Npc_HasEquippedRangedWeapon(slf))
	{
		oldweapon = Npc_GetEquippedRangedWeapon(slf);
	};
		//any weapon is equiped? - true -> delete & insert it
	if(Hlp_IsValidItem(oldweapon))
	{
		if(Hlp_IsItem(oldweapon,Hlp_GetInstanceID(itm)))
		{
			return;//func try to equip same weapon that is equiped!
		};
		Npc_RemoveInvItem(slf,Hlp_GetInstanceID(oldweapon));
		CreateInvItem(slf,Hlp_GetInstanceID(oldweapon));
	};	
		//Check if npc can use it
	if(itm.cond_value[0])
	{
		//problems wit g_cannotuse workin properly...
		if(Npc_IsPlayer(slf))&&(MEM_ReadInt(slf_ptr+oCNPC_attribute_offset+4*itm.cond_atr[0])<itm.cond_value[0])
		{
			if 		( itm.cond_atr[0] == ATR_HITPOINTS		 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS		;}
			else if ( itm.cond_atr[0] == ATR_HITPOINTS_MAX	 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS_MAX	;}
			else if ( itm.cond_atr[0] == ATR_MANA			 )	{	strAttribute = _STR_ATTRIBUTE_MANA			;}
			else if ( itm.cond_atr[0] == ATR_MANA_MAX		 )	{	strAttribute = _STR_ATTRIBUTE_MANA_MAX		;}
			else if ( itm.cond_atr[0] == ATR_STRENGTH		 )	{	strAttribute = _STR_ATTRIBUTE_STRENGTH		;}
			else if ( itm.cond_atr[0] == ATR_DEXTERITY		 )	{	strAttribute = _STR_ATTRIBUTE_DEXTERITY		;}
			else												{	strAttribute = _STR_INVALID					;};	
			
			nDifference = itm.cond_value[0] - MEM_ReadInt(slf_ptr+oCNPC_attribute_offset+4*itm.cond_atr[0]);
			strDifference 	= IntToString( nDifference );				
			strMessage = _STR_CANNOTUSE_PRE_PLAYER;
			strMessage = ConcatStrings( strMessage, strDifference 			);
			strMessage = ConcatStrings( strMessage, " " 					);
			strMessage = ConcatStrings( strMessage, strAttribute 			);
			strMessage = ConcatStrings( strMessage, _STR_CANNOTUSE_POINTS	);
			strMessage = ConcatStrings( strMessage, _STR_CANNOTUSE_POST 	);		
			PrintScreen		(strMessage, -1, 10, CANNOT_USEFONT, 3 );			
			return;		
			};		
	}
	else if(itm.cond_value[1])
	{
		//problems wit g_cannotuse workin properly...
		if(Npc_IsPlayer(slf))&&(MEM_ReadInt(slf_ptr+oCNPC_attribute_offset+4*itm.cond_atr[1])<itm.cond_value[1])
		{
			if 		( itm.cond_atr[1] == ATR_HITPOINTS		 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS		;}
			else if ( itm.cond_atr[1] == ATR_HITPOINTS_MAX	 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS_MAX	;}
			else if ( itm.cond_atr[1] == ATR_MANA			 )	{	strAttribute = _STR_ATTRIBUTE_MANA			;}
			else if ( itm.cond_atr[1] == ATR_MANA_MAX		 )	{	strAttribute = _STR_ATTRIBUTE_MANA_MAX		;}
			else if ( itm.cond_atr[1] == ATR_STRENGTH		 )	{	strAttribute = _STR_ATTRIBUTE_STRENGTH		;}
			else if ( itm.cond_atr[1] == ATR_DEXTERITY		 )	{	strAttribute = _STR_ATTRIBUTE_DEXTERITY		;}
			else												{	strAttribute = _STR_INVALID					;};	
			
			nDifference = itm.cond_value[1] - MEM_ReadInt(slf_ptr+oCNPC_attribute_offset+4*itm.cond_atr[1]);
			strDifference 	= IntToString( nDifference );				
			strMessage = _STR_CANNOTUSE_PRE_PLAYER;
			strMessage = ConcatStrings( strMessage, strDifference 			);
			strMessage = ConcatStrings( strMessage, " " 					);
			strMessage = ConcatStrings( strMessage, strAttribute 			);
			strMessage = ConcatStrings( strMessage, _STR_CANNOTUSE_POINTS	);
			strMessage = ConcatStrings( strMessage, _STR_CANNOTUSE_POST 	);		
			PrintScreen		(strMessage, -1, 10, CANNOT_USEFONT, 3 );			
			return;
		};		

	}
	else if(itm.cond_value[2])
	{
		//problems wit g_cannotuse workin properly...
		if(Npc_IsPlayer(slf))&&(MEM_ReadInt(slf_ptr+oCNPC_attribute_offset+4*itm.cond_atr[2])<itm.cond_value[2])
		{
			if 		( itm.cond_atr[2] == ATR_HITPOINTS		 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS		;}
			else if ( itm.cond_atr[2] == ATR_HITPOINTS_MAX	 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS_MAX	;}
			else if ( itm.cond_atr[2] == ATR_MANA			 )	{	strAttribute = _STR_ATTRIBUTE_MANA			;}
			else if ( itm.cond_atr[2] == ATR_MANA_MAX		 )	{	strAttribute = _STR_ATTRIBUTE_MANA_MAX		;}
			else if ( itm.cond_atr[2] == ATR_STRENGTH		 )	{	strAttribute = _STR_ATTRIBUTE_STRENGTH		;}
			else if ( itm.cond_atr[2] == ATR_DEXTERITY		 )	{	strAttribute = _STR_ATTRIBUTE_DEXTERITY		;}
			else												{	strAttribute = _STR_INVALID					;};	
			
			nDifference = itm.cond_value[2] - MEM_ReadInt(slf_ptr+oCNPC_attribute_offset+4*itm.cond_atr[2]);
			strDifference 	= IntToString( nDifference );				
			strMessage = _STR_CANNOTUSE_PRE_PLAYER;
			strMessage = ConcatStrings( strMessage, strDifference 			);
			strMessage = ConcatStrings( strMessage, " " 					);
			strMessage = ConcatStrings( strMessage, strAttribute 			);
			strMessage = ConcatStrings( strMessage, _STR_CANNOTUSE_POINTS	);
			strMessage = ConcatStrings( strMessage, _STR_CANNOTUSE_POST 	);		
			PrintScreen		(strMessage, -1, 10, CANNOT_USEFONT, 3 );			
			return;		
		};		
	};
	//store c_npc in NEWS
	Npc_MemoryEntry(Memory_Holder,1,hero,2,slf);	
	EquipWeapon_weapon_npc=Npc_GetNewsVictim(Memory_Holder,Npc_HasNews(Memory_Holder,2,NULL,NULL));
		//Switch equiped item to be first in inv category, so it 
	//will be able to be equiped by AI_EquipBest
	SwitchToFirstInCat(slf_ptr+1532,Hlp_GetInstanceID(itm));

};
*/
//==============================================
//	Get_ActiveSpell_Circle
//==============================================
//1-6 - circles
//0 - scroll
// sample use: (It makes u scrolls eats only 5pt of mana (like G2) (Not fully compatible, but this is only sample use ;)
/*func INT Spell_ProcessMana(VAR INT manaInvested)
{	if(Get_ActiveSpell_Circle()==0)&&(ManaInvested>=SCROLL_MANACOST)
	{
	return SPL_SENDCAST;	
	};
*/
const int oCNPC_MagBook_offset = 2388;//0x0954
func int Get_ActiveSpell_Circle(var C_NPC slf)
{	var int slf_ptr; var int magbook_ptr; 
	var int mb_itemarray_ptr; var int usedspell;
	var int citem_ptr; 
	var int mag_circle;

	slf_ptr = oCNpc_GetPointer(slf);
	magbook_ptr = MEM_ReadInt(slf_ptr+oCNPC_MagBook_offset);
	mb_itemarray_ptr = MEM_ReadInt(magbook_ptr+12);
	usedspell = MEM_ReadInt(magbook_ptr+36);
	citem_ptr = MEM_ReadInt(mb_itemarray_ptr+(4*usedspell));
	mag_circle = MEM_ReadInt(citem_ptr+572);
	return mag_circle;
	};
func string Get_ActiveSpell_Name(var C_NPC slf)
{	var int slf_ptr; var int magbook_ptr; 
	var int mb_itemarray_ptr; var int usedspell;
	var int citem_ptr; 
	var string name;

	slf_ptr = oCNpc_GetPointer(slf);
	magbook_ptr = MEM_ReadInt(slf_ptr+oCNPC_MagBook_offset);
	mb_itemarray_ptr = MEM_ReadInt(magbook_ptr+12);
	usedspell = MEM_ReadInt(magbook_ptr+36);
	citem_ptr = MEM_ReadInt(mb_itemarray_ptr+(4*usedspell));
	name = MEM_ReadString(citem_ptr+260);
	return name;
	};
//=========================================
// Handle G2 Steering
//=========================================

// Out of Fightmode
// keyUp=1d001100c800 ; up/w/lctrl
// keyAction=1d003800 lctrl/lalt

// In fightmode/
// keyUp=1d001100 ; up/w
// keyAction=1d00 ;lctrl

// In Inventory
// keyDown=D0001F003800	; down/s/lalt
// keyAction=1d003800 lctrl/lalt

// Out off inventory
// keyDown=D0001F00	; down/s
// keyAction=1d00 lctrl

//keys to add
// lame hp potion
// lame mp potion
// evade left-right???
// party comands...
// prev amunition
// next amunition
//IDEA:
// Take all npc items!
// sprint by shift hold
// turn off normal ShowMap and create new ShowMap2 that will show more precised map against worldmap

//=========================================
//	PerFrameTrigger Moved to separated fil
//=========================================
instance trigger (oCTriggerScript);

var int num0opt;
var int itmptr;
var int PerFrameCallTrigger_Init;//bool set to true in init of all worlds

//Keys latency 2 frames
const int LATENCY_FRAMES = 4;
var int KEY_Q_LASTCLICKED;
var int KEY_E_LASTCLICKED;

//damage
var int dmg2ptr;
var int dmg1ptr;
//amunition:
var int KeyAmunitionChange;

//----------------------------------------------
// WP_GetNearestWpToPos
// Simply put to arguments zfloats of pos, and it will return
// 
//----------------------------------------------
func string Hlp_GetNearestWpToPos(var int X,var int Y, var int Z)
{   var ocnpc WPMARKER; var C_NPC WP__MARKER; var string result;
   Wld_SpawnNpcRange( hero,WP_Marker,1,500);
   WPMARKER = hlp_getnpc(WP_Marker);
   WP__MARKER = hlp_getnpc(WP_Marker);
   WPMARKER._zCVob_trafoObjToWorld[3]  =  X;//ZFLOAT!
   WPMARKER._zCVob_trafoObjToWorld[7]  = Y;//ZFLOAT!
   WPMARKER._zCVob_trafoObjToWorld[11] = Z;//ZFLOAT!
   //p/rint(Npc_GetNearestWP(WP__MARKER));	
   result = Npc_GetNearestWP(WP__MARKER);
   //ERASE
   WP__MARKER.attribute[ATR_HITPOINTS]=0;
   WPMARKER._zCVob_trafoObjToWorld[3]  =  0;//ZFLOAT!
   WPMARKER._zCVob_trafoObjToWorld[7]  = 0;//ZFLOAT!
   WPMARKER._zCVob_trafoObjToWorld[11] = 0;//ZFLOAT!
   
   return result;	
};

//==================================================
// Trade_ChangeSellMultiplier
// ----
// - mul have to be zfloat value
// - function should be refreshed atleast every trade 
//   for simplify you can add it in ZS_TALK
//==================================================
func void Trade_ChangeSellMultiplier(var int mul)
{	var int ptr;
	ptr = MEMINT_oCInformationManager_Address;
	ptr = MEM_ReadInt(ptr+24);//oCInformationManager.dlgTrade
	ptr = MEM_ReadInt(ptr+260);	//dlgTrade.oCViewDialogItemContainer
	MEM_WriteInt(ptr+268,mul);//oCViewDialogItemContainer.Multiplier = mul
	printdebug(inttostring(mul));
};

//==================================================
// Trade_ChangeBuyMultiplier
// ----
// - mul have to be zfloat value
// - function should be refreshed atleast every trade 
//   for simplify you can add it in ZS_TALK
//==================================================
func void Trade_ChangeBuyMultiplier(var int mul)
{	var int ptr;
	ptr = MEMINT_oCInformationManager_Address;
	ptr = MEM_ReadInt(ptr+24);//oCInformationManager.dlgTrade
	ptr = MEM_ReadInt(ptr+252);	//dlgTrade.oCViewDialogStealContainer
	MEM_WriteInt(ptr+268,mul);//oCViewDialogStealContainer.Multiplier = mul	
};

func string Trade_GetHeroCatString()
{	var int ptr;
	ptr = MEMINT_oCInformationManager_Address;
	ptr = MEM_ReadInt(ptr+24);//oCInformationManager.ocViewDialogTrade
	if(ptr)
	{
 		ptr = MEM_ReadInt(ptr+264);	//oCViewDialogItemInventory
 		if(ptr)
 		{
 			ptr = MEM_ReadInt(ptr+256);	//oCItemContainer 
 			if(ptr)
 			{
 				ptr = MEM_ReadInt(ptr+48);	//zCView - Titel 
 		 		if(ptr)
 		 		{
 		 			return MEM_ReadString(ptr+200);//text	
		 		};				
			};
		};
	};

	return "";//blank

};

func int Game_MenusOpened()
{	return MEM_ReadInt(MEMINT_MenuArrayOffset+8);
};

func void I_TurnOffWarnMessages()
{		//TODO: Turn it on back when release version comes
		//Ork: otó¿ to :P
		return;
		
		//Adding this function only to release verios is a good idea
		//Even if you don't see warning game still be runing on low
		//framerates when there is to many alpha polys etc.
		//Platform: Gothic 1 1.08k mod
		//Function should be runned at least every time game was inited
		//f.e: Add it to your Init_AllWorlds function

		//alphablendpoly: Too many alphapolys		
		MEM_WriteInt(9608588,1);
		//zCPoligon:ClipToPlane Too many cliped verts!
		MEM_WriteInt(9127248,1);	
		//???: Too many alpha world polys!
		MEM_WriteInt(9234732,1);	
};