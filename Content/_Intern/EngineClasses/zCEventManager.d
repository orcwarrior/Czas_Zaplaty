//******************************************************************************
//                                                                            
//                                   oCMagBook                                 
//      
//	Gothic 1.08k version (experimental, much of pointers are still unknown
//                                                                    
//******************************************************************************

class zCEventManager {
	var int    _vtbl;       // 0x0000
	var int    refCtr;      // 0x0004 int
	var int    hashIndex;   // 0x0008 zWORD
	var int    hashNext;    // 0x000C zCObject*
	var string objectName;  // 0x0010 zSTRING
 	var int    value0;    // 0x0024 0
 	var int    value1;    // 0x0028 1
 	var int    value2;    // 0x002C 1
    var int Events_array; //ocMsgManipulate*/	0x0030
    var int Events_numAlloc; //int  0x0034
    var int Events_numInArray; //int 0x0038
    var int EvtManager_owner; //zCObject* 0x003C
};


//oCMsgManipulate
//classdef dump
                                          
// ...ptr:   9288792..........             
//	[+00000000]='oCMsgManipulate'                           
//	[+00000014]='oCNpcMessage'                  
//	[+00000028]=BLANK STRING                             
//	[+0000003C]=9289464, P#*zString, TXT:oCNpcMessage, val:8193768
//	[+00000040]=7066784, P#, val:-144113814      
//	[+00000044]=7066784, P#, val:-144113814                  
//	[+00000048]=0                    
//	[+0000004C]=124                                  
//	[+00000050]=0                                 
//	[+00000054]=1                                 
//	[+00000058]=0                                 
//	[+0000005C]=0                                                                                  
                         
class oCMsgManipulate {					//test at ev_equipitem
	var int    _vtbl;       // 0x0000
	var int    refCtr;      // 0x0004 int 2
	var int    hashIndex;   // 0x0008 zWORD
	var int    hashNext;    // 0x000C zCObject*
	var string objectName;  // 0x0010 zSTRING
 	var int    value0;    // 0x0024 14
 	var int    value1;    // 0x0028 0
 	var string string0;    // 0x002C blank
    var int value2; //		  0x0040
 	var string string1;    // 0x0044 blank
    var string string2; // 0x0058 blank
    var int event_object; //zCObject* 0x006C (oCitem*Itmw_1h_sword_01)(was equiped)
 	var int    value3;    // 0x0070 0
 	var int    float0;    // 0x0074 ZReal 1056964608 = 3F000000 = 0.5
 	var int    value4;    //0x0078  -1
    
};                                                                                                                               