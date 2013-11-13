
//*****************************************************************
//	Ikarus Help Functions
//
//	1.ptr_Getlength(ptr)
//	--check if ptr has known vtbl value
//	--and return its lenght in bytes
//	--need lot of corrections!

//  2.Get_NearestPointerWithValue(ptr_start,value)
//  --look for value from the ptr_start till...
//  --till it found value or crash ;P
//  --after around 950000 recurecies it need some
//  --rest, so enter this code to some triggerscript loop
// 
/*
if(count>=95020)
{
count=0;	
printdebug(">#....");
Get_NearestPointerWithValue(last_pointer,last_val);
};	
*/   
// The value is finnaly founded when:
/*
if(last_pointer)
{
	if(MEM_ReadInt(last_pointer)==last_val)&&(adr_chk!=1)
	{
	adr_chk=1;
	CheckAdress(last_pointer,1024,3,1);	
	last_pointer=0;
	};
};
*/
// Add this to Some triggerscript too
// I know, it can be done in some more-elegant way :P

//  3.CheckAdress(ptr,length,levels,analize)
//  --Analizing bytes from ptr to ptr+length
//  --
//  --levels: when readedbyte looks like it contain pointer or array it will enter
//	--higer level and start analysis of that pointer/array
//	--levels mean how high is higest level
//  --(right now higest level is only 3, but more levels mean less legible dump
//  
//  --iz analyze if off(0) dump will only print values of pointers
// 
// by orcwarrior
var int sptr;
func int SUB_Get_NearestNonBlankString(var int ptr)//startpointer, currentpointer
{
	var int val; val = MEM_ReadInt(ptr);
	if(ptr>sptr+1024)//Canceling to much of searching
	{
		return -1;	
	};
	if(val==zString_vtbl)&&(MEM_ReadInt(ptr+12)>0)
	{
		return ptr;
	}
	else
	{
		return SUB_Get_NearestNonBlankString(ptr+4);
	};		

	
		
};
func string Get_NearestNonBlankString(var int ptr)//startpointer, currentpointer
{
	var string str; var int nptr;
	sptr=ptr;
	nptr = SUB_Get_NearestNonBlankString(ptr);
	if(nptr==-1)
	{ 
	str = "ERROR"; 
	return str;
	};
	str = MEM_ReadString(nptr);
		return concatstrings(str,concatstrings("+",INTTOHEX(nptr-ptr)));
	

	
		
};
func int Val_IsPointer(var int val)
{
	if(val%4==0)&&(val>6000000)&&(val<268435456)
	{
		return true;//tmp disabled	
	};
	return false;	
};
func int Val_IsArray(var int adr,var int val)
{
	if(val%4==0)&&(val>1000000)&&(val<300000000)&&(MEM_ReadInt(adr+4)==16)&&(MEM_ReadInt(adr+8)>0)&&(MEM_ReadInt(adr+8)<MEM_ReadInt(adr+4))
	{
		return true;	
	};
	return false;	
};

func int Val_IsZFloat(var int val)
{
	if(val>268435456)||(val<-268435456)
	{
		return true;
	};
	return false;	
};

func int Val_IsString(var int adr,var int val)
{
	if(val==zString_vtbl)
	{
		if(MEM_ReadInt(adr+12)>0)
		{
			return 1;//string
		}
		else
		{
			return 2;//blank string
		};	
	}
	else if(MEM_ReadInt(adr+16)==31)&&(MEM_ReadInt(adr+12)>0)&&(MEM_ReadInt(adr+12)<31)&&(MEM_ReadInt(adr+8)>10000)
	{
		return 1;	
	};
	return false;	
};
func int Ptr_EndOfObj(var int adr)
{
	if((MEM_ReadInt(adr+4)>8000000)&&(MEM_ReadInt(adr+4)<8500000))&&(MEM_ReadInt(adr+4)!=zString_vtbl)//string
	{
		//TODO Turned off
		return 0;//probably end
	};
	return false;	
};
func string _vtbl_AnalizeShort(var int ptr_begin)
{
	var string msg; var int val; var int tmp;
	val = MEM_ReadInt(ptr_begin);
	msg = "";
	if(val==oCNpc_vtbl)
	{      	                      		/*-----object instance-----*/
		msg = concatstrings("*oCNpc <",MEM_ReadString(ptr_begin+16));		
		msg = concatstrings(msg,"> WP:");
		/*-----object waypoint-----*/
		msg = concatstrings(msg,MEM_ReadString(ptr_begin+776));	
	}
	else if(val==oCItem_vtbl)
	{                              /*-----object instance-----*/
		msg = concatstrings("*oCItem <",MEM_ReadString(ptr_begin+16));
		msg = concatstrings(msg,">");
		if(MEM_ReadInt(ptr_begin+40)==-1)//lasttime drawn
		{
			msg = concatstrings(msg," NOT IN WORLD");		
		};	
	}
	else if(val==oCMobDoor_vtbl)
	{                              /*-----object instance-----*/
		msg = concatstrings("*oCMobDoor <",MEM_ReadString(ptr_begin+16));
		if(Hlp_StrCmp(MEM_ReadString(ptr_begin+256),""))
		{
			msg = concatstrings(msg,">");			
		}
		else
		{
			msg = concatstrings(msg,"> name:");
			msg = concatstrings(msg,MEM_ReadString(ptr_begin+256));
		};	
	}
	else if(val==oCMobContainer_vtbl)
	{                              /*-----object instance-----*/
		msg = concatstrings("*oCMobContainer <",MEM_ReadString(ptr_begin+16));
		if(Hlp_StrCmp(MEM_ReadString(ptr_begin+256),""))
		{
			msg = concatstrings(msg,">");			
		}
		else
		{
			msg = concatstrings(msg,"> name:");
			msg = concatstrings(msg,MEM_ReadString(ptr_begin+256));
		};
	}
	else if(val==oCMobInter_vtbl)
	{                              /*-----object instance-----*/
		msg = concatstrings("*oCMobInter <",MEM_ReadString(ptr_begin+16));
		if(Hlp_StrCmp(MEM_ReadString(ptr_begin+256),""))
		{
			msg = concatstrings(msg,">");			
		}
		else
		{
			msg = concatstrings(msg,"> name:");
			msg = concatstrings(msg,MEM_ReadString(ptr_begin+256));
		};	
	}
	else if(val==oCMobFire_vtbl)
	{                              /*-----object instance-----*/
		msg = concatstrings("*oCMobFire <",MEM_ReadString(ptr_begin+16));
		if(Hlp_StrCmp(MEM_ReadString(ptr_begin+256),""))
		{
			msg = concatstrings(msg,">");			
		}
		else
		{
			msg = concatstrings(msg,"> name:");
			msg = concatstrings(msg,MEM_ReadString(ptr_begin+256));
		};
	}
	else if(val==oCMobLadder_vtbl)
	{                              /*-----object instance-----*/
		msg = concatstrings("*oCMobLadder <",MEM_ReadString(ptr_begin+16));
		if(Hlp_StrCmp(MEM_ReadString(ptr_begin+256),""))
		{
			msg = concatstrings(msg,">");			
		}
		else
		{
			msg = concatstrings(msg,"> name:");
			msg = concatstrings(msg,MEM_ReadString(ptr_begin+256));
		};
	}
	else if(val==zCEventMenager_vtbl)
	{                             
		msg = concatstrings("*zCEventMenager","");
	}
	else if(val==poCollisionObject_vtbl)
	{     
		tmp = MEM_ReadInt(ptr_begin+132);//oCNPC pointer	                        
		msg = concatstrings("*poCollisionObject OF:",MEM_ReadString(tmp));	
	}
	else if(val==poCollisionObjectClass_vtbl)
	{     	                        
		msg = concatstrings("*poCollisionObjectClass","");	
	}
	else if(val==oCView_vtbl)
	{     	                        
		msg = concatstrings("*oCView","");	
	}
	else if(val==oCViewStatusBar_vtbl)
	{                             
		msg = concatstrings("*oCViewStatusBar <",MEM_ReadString(ptr_begin+324));
		msg = concatstrings(msg,">");	
	}
	else if(val==zCSkyController_Outdoor_vtbl)
	{     	                        
		msg = concatstrings("*zCSkyController_Outdoor","");	
	}
	else if(val==oWorld_vtbl)
	{     	                        
		msg = concatstrings("*oWorld","");	
	}
	else if(val==oCGame_vtbl)
	{     	                        
		msg = concatstrings("*oCGame","");
	}
	else if(val==zCAIBase_vtbl)
	{     	                        
		msg = concatstrings("*zCAIBase","");	
	}
	else if(val==zCVisual_vtbl)
	{     	                   
		tmp = MEM_ReadInt(ptr_begin+84);
		if(tmp%4==0)
		{     
		msg = concatstrings("*zCVisual <",MEM_ReadString(tmp+16));
		msg = concatstrings(msg,">");	
		};		
	}
	else if(val==oCNpcTalent_vtbl)
	{     
		tmp = MEM_ReadInt(ptr_begin+36);	
		if(tmp==1)
		{
		msg = "1H:";	
		} 
		else if(tmp==2)
		{
		msg = "2H:";	
		}
		else if(tmp==3)
		{
		msg = "BOW:";	
		}   
		else if(tmp==4)
		{
		msg = "CBOW:";	
		}   
		else if(tmp==5)
		{
		msg = "PLOCK:";	
		}   
		else if(tmp==6)
		{
		msg = "PPOCKET:";	
		}   
		else if(tmp==7)
		{
		msg = "MAGE:";	
		}   
		else if(tmp==8)
		{
		msg = "SNEAK:";	
		}   
		else if(tmp==9)
		{
		msg = "REGEN:";	
		}   
		else if(tmp==10)
		{
		msg = "FIREMAST:";	
		}   
		else if(tmp==11)
		{
		msg = "ACROBAT:";	
		}   
		else
		{
		msg = "UNKN:";	
		};
		msg = concatstrings(msg,inttostring(MEM_ReadInt(ptr_begin+40)));//talskill                            
		msg = concatstrings("*oCNpcTalent<",msg);	
		msg = concatstrings(msg,">");	
		
	}
	else if(val==zCRoute_vtbl)
	{     	                        
		msg = concatstrings("*zCRoute","");	
	}
	else if(val==oCInfoMenager_vtbl)
	{     	                        
		msg = concatstrings("*oCInfoManager","");	
	}
	else if(val==zCMesh_vtbl)
	{     	                        
		msg = concatstrings("*zCMesh","");	
	}
	else if(val==zCMaterial_vtbl)
	{     	                        
		msg = concatstrings("*zCMaterial <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,"> TEX:");	
		tmp = MEM_ReadInt(ptr_begin+52);
		if(tmp)
		{
		msg = concatstrings(msg,MEM_ReadString(tmp+16));	
		};
	}
	else if(val==zCTexture_vtbl)
	{     	                        
		msg = concatstrings("*zCTexture <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,"> TEX:");	
	}
	else if(val==zCMenuItem_vtbl)
	{     	                        
		msg = concatstrings("*zCMenuItem TXT:",MEM_ReadString(ptr_begin+12));	
	}
	else if(val==oCGameInfo_vtbl)
	{     	                        
		msg = concatstrings("*oCGameInfo","");	
	}
	else if(val==zCVob_vtbl)
	{     	                        
		msg = concatstrings("*zCVob <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");	
		if(MEM_ReadInt(ptr_begin+40)==-1)//lasttime drawn
		{
			msg = concatstrings(msg," NOT IN WORLD");		
		};	
	}
	else if(val==zCAICamera_vtbl)
	{     	                        
		msg = concatstrings("*zCAICamera","");	
	}
	else if(val==zCCSManager_vtbl)
	{     	                        
		msg = concatstrings("*zCCSManager","");	
	}	
	else if(val==zCZoneMusic_vtbl)
	{     	                        
		msg = concatstrings("*zCZoneMusic <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");	
	}	
	else if(val==zCZoneMusicDefault_vtbl)
	{     	                        
		msg = concatstrings("*zCZoneMusicDefault <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");	
	}	
	else if(val==zCZoneSound_vtbl)
	{     	                        
		msg = concatstrings("*zCZoneSound <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");	
	}	
	else if(val==oCFreepoint_vtbl)
	{     	                        
		msg = concatstrings("*oCFreepoint <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");
	}	
	else if(val==oCLensFlare_vtbl)
	{     	                        
		msg = concatstrings("*oCLensFlare <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");
	}
// 	else if(val==oCWaypoint_vtbl)
// 	{     	                        
// 		msg = concatstrings("*oCWaypoint <",MEM_ReadString(ptr_begin+16));	
// 		msg = concatstrings(msg,">");
// 	}	
	else if(val==zCVobLight_vtbl)
	{     	                        
		msg = concatstrings("*zCVobLight <",MEM_ReadString(ptr_begin+148));	
		msg = concatstrings(msg,">");
	}		
	else if(val==oCTriggerScript_vtbl)
	{     	                        
		msg = concatstrings("*oCTriggerScript <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");
	}		
	else if(val==oCMobWheel_vtbl)
	{     	                        
		msg = concatstrings("*oCMobWheel <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");
	}		
	else if(val==zCZoneSoundDaytime_vtbl)
	{     	                        
		msg = concatstrings("*zCZoneSoundDaytime <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");
	}		
	else if(val==oCTriggerChangeLevel_vtbl)
	{     	                        
		msg = concatstrings("*oCTriggerChangeLevel <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");
	}		
	else if(val==zCMover_vtbl)
	{     	                        
		msg = concatstrings("*zCMover <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");
	}		
	else if(val==zCDecal_vtbl)
	{     	                        
		msg = concatstrings("*zCDecal <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");
	}		
	else if(val==oCMeshSoftSkin_vtbl)
	{     	                        
		msg = concatstrings("*oCWear <",MEM_ReadString(ptr_begin+16));	
		msg = concatstrings(msg,">");
	}		
	else if(val==oCModelAni_vtbl)
	{     	                        
		msg = concatstrings("*oCAni <",MEM_ReadString(ptr_begin+36));	
		msg = concatstrings(msg,">");
	}
	else if(MEM_ReadInt(ptr_begin+4)==16)&&(MEM_ReadInt(ptr_begin+16)==16)
	{     	
		tmp = MEM_ReadInt(ptr_begin+12);
		if(tmp){
			tmp = MEM_ReadInt(tmp);  
			if(MEM_ReadInt(tmp)==oCItem_vtbl){
				msg = concatstrings("*oCMagBook, spells:",inttostring(MEM_ReadInt(ptr_begin+8)));			
			};
		};                    
	}
	else if(MEM_ReadInt(ptr_begin)==zString_vtbl)
	{     	
		if(Hlp_StrCmp("ZS_",STR_PREFIX(MEM_ReadString(ptr_begin),3)))
		{
			msg = concatstrings("*oCSlot, dummy:",MEM_ReadString(ptr_begin));			
		}
		else
		{
			msg = concatstrings("*zString, TXT:",MEM_ReadString(ptr_begin));						
		};                    
	};

	return msg;
	
};
func int ptr_Analizegetlength(var int ptr_begin)
{
	var int val; var int tmp;
	val = MEM_ReadInt(ptr_begin);
	if(val==oCNpc_vtbl)
	{      	                      		
		return 0;//id and WP is enough
	}
	else if(val==oCItem_vtbl)
	{                            
		return 0;//id and isInWorld is enough
	}
	else if(val==oCMobDoor_vtbl)
	{                     
		return 0;//id and name is enough

	}
	else if(val==oCMobContainer_vtbl)
	{        
		return 0;//id and name is enough
	}
	else if(val==oCMobInter_vtbl)
	{                             
		return 0;//id and name is enough
	}
	else if(val==oCMobFire_vtbl)
	{                              
		return 0;//id and name is enough

	}
	else if(val==oCMobLadder_vtbl)
	{                              /*-----object instance-----*/
		return 0;//id and name is enough

	}		
	else if(val==zCMover_vtbl)
	{     	                        
		return 0;//id and name is enough

	}
	else if(val==zCEventMenager_vtbl)
	{                             
		return 60;
	}
	else if(val==oCView_vtbl)
	{     	                        
		return 252;
	}
	else if(val==oCViewStatusBar_vtbl)
	{                             
		return 360;
	}
	else if(val==poCollisionObject_vtbl)
	{     
		return -1;//unknown length stay with default
	}
	else if(val==poCollisionObjectClass_vtbl)
	{     
		return -1;//unknown length stay with default
	}
	else if(val==zCSkyController_Outdoor_vtbl)
	{     	                        
		return 0;//nobody cares
	}
	else if(val==oWorld_vtbl)
	{     	                        
		return 0;//nobody cares
	}
	else if(val==oCGame_vtbl)
	{     	                        
		return 0;//nobody cares
	}
	else if(val==zCAIBase_vtbl)
	{     	                        
		return -1;//size can be different
	}
	else if(val==zCVisual_vtbl)
	{     	                        
		return -1;
	}
	else if(val==oCNpcTalent_vtbl)
	{     	                        
		return 0;
	}
	else if(val==zCRoute_vtbl)
	{     	                        
		return -1;
	}
	else if(val==oCInfoMenager_vtbl)
	{     	                        
		return 16;	
	}
	else if(val==zCMesh_vtbl)
	{     	                        
		return 0;//nobody cares
	}
	else if(val==zCMaterial_vtbl)
	{     	                        
		return 0;//nobody cares
	}
	else if(val==zCTexture_vtbl)
	{     	                        
		return 0;//nobody cares
	}
	else if(val==zCMenuItem_vtbl)
	{     	                        
		return 0;//nobody cares
	}
	else if(val==oCGameInfo_vtbl)
	{     	                        
		return -1;
	}
	else if(val==zCVob_vtbl)
	{     	                        
		return 0;//nobody cares
	}
	else if(val==zCAICamera_vtbl)
	{     	                        
		return -1;
	}
	else if(val==zCCSManager_vtbl)
	{     	                        
		return -1;
	}	
	else if(val==zCZoneMusic_vtbl)
	{     	                        
		return 0;
	}	
	else if(val==zCZoneMusicDefault_vtbl)
	{     	                        
		return 0;
	}	
	else if(val==zCZoneSound_vtbl)
	{     	                        
		return 0;
	}	
	else if(val==oCFreepoint_vtbl)
	{     	                        
		return 0;
	}	
	else if(val==oCLensFlare_vtbl)
	{     	                        
		return 0;
	}
// 	else if(val==oCWaypoint_vtbl)
// 	{     	                        
// 		return 0;
// 	}	
	else if(val==zCVobLight_vtbl)
	{     	                        
		return 0;
	}		
	else if(val==oCTriggerScript_vtbl)
	{     	                        
		return 0;
	}		
	else if(val==oCMobWheel_vtbl)
	{     	                        
		return 0;
	}		
	else if(val==zCZoneSoundDaytime_vtbl)
	{     	                        
		return 0;
	}		
	else if(val==oCTriggerChangeLevel_vtbl)
	{     	                        
		return 0;
	}		
	else if(val==zCDecal_vtbl)
	{     	                        
		return 0;
	}		
	else if(val==oCMeshSoftSkin_vtbl)
	{     	                        
		return 0;
	}		
	else if(val==oCModelAni_vtbl)
	{     	                        
		return 0;
	}
	else if(MEM_ReadInt(ptr_begin+4)==16)&&(MEM_ReadInt(ptr_begin+16)==16)
	{     	
		tmp = MEM_ReadInt(ptr_begin+12);
		if(tmp){
			tmp = MEM_ReadInt(tmp);  
			if(MEM_ReadInt(tmp)==oCItem_vtbl){	
				return 128;//probably smaller
			};
		};                    
	}
	else if(MEM_ReadInt(ptr_begin)==zString_vtbl)
	{     	
		return 0;                  
	}
	else
	{
		return -1;//Unknown class/ptr	
	};

	
};


func int ptr_getlength(var int ptr_begin)
{
	var int val; var int tmp;
	val = MEM_ReadInt(ptr_begin);
	if(val==oCNpc_vtbl)
	{      	                      		
		return 2616;
	}
	else if(val==oCItem_vtbl)
	{                            
		return 744;
	}
	else if(val==oCMobDoor_vtbl)
	{                     
		return 600;

	}
	else if(val==oCMobContainer_vtbl)
	{        
		return 636;
	}
	else if(val==oCMobInter_vtbl)
	{                             
		return 536;
	}
	else if(val==oCMobFire_vtbl)
	{                              
		return 580;

	}
	else if(val==oCMobLadder_vtbl)
	{                          
		return 536;//+X

	}		
	else if(val==zCMover_vtbl)
	{     	                        
		return 548;//+x

	}
	else if(val==zCEventMenager_vtbl)
	{                             
		return 60;
	}
	else if(val==oCView_vtbl)
	{     	                        
		return 252;
	}
	else if(val==oCViewStatusBar_vtbl)
	{                             
		return 360;
	}
	else if(val==poCollisionObject_vtbl)
	{     
		return 2048;//+x
	}
	else if(val==poCollisionObjectClass_vtbl)
	{     
		return 2048;//+x
	}
	else if(val==zCSkyController_Outdoor_vtbl)
	{     	                        
		return 1756;//+/-x?
	}
	else if(val==oWorld_vtbl)
	{     	                        
		return 6744;//and moore?
	}
	else if(val==oCGame_vtbl)
	{     	                        
		return 364;
	}
	else if(val==zCAIBase_vtbl)
	{     	                        
		return  512;//??
	}
	else if(val==zCVisual_vtbl)
	{     	                        
		return 256;
	}
	else if(val==oCNpcTalent_vtbl)
	{     	                        
		return 40;
	}
	else if(val==zCRoute_vtbl)
	{     	                        
		return 32;//??
	}
	else if(val==oCInfoMenager_vtbl)
	{     	                        
		return 16;	
	}
	else if(val==zCMesh_vtbl)
	{     	                        
		return 216;//??
	}
	else if(val==zCMaterial_vtbl)
	{     	                        
		return 216;//???
	}
	else if(val==zCTexture_vtbl)
	{     	                        
		return 128;//??
	}
	else if(val==zCMenuItem_vtbl)
	{     	                        
		return 768;//??
	}
	else if(val==oCGameInfo_vtbl)
	{     	                        
		return 32;//??
	}
	else if(val==zCVob_vtbl)
	{     	                        
		return 256;
	}
	else if(val==zCAICamera_vtbl)
	{     	                        
		return 32;//??
	}
	else if(val==zCCSManager_vtbl)
	{     	                        
		return 32;//???
	}	
	else if(val==zCZoneMusic_vtbl)
	{     	                        
		return 512;//or more
	}	
	else if(val==zCZoneMusicDefault_vtbl)
	{     	                        
		return 512;//or more
	}	
	else if(val==zCZoneSound_vtbl)
	{     	                        
		return 512;//or more
	}	
	else if(val==oCFreepoint_vtbl)
	{     	                        
		return 280;//or more
	}	
	else if(val==oCLensFlare_vtbl)
	{     	                        
		return 280;//or more
	}
// 	else if(val==oCWaypoint_vtbl)
// 	{     	                        
// 		return 280;//or more
// 	}	
	else if(val==zCVobLight_vtbl)
	{     	                        
		return 340;//or more
	}		
	else if(val==oCTriggerScript_vtbl)
	{     	                        
		return 328;//+X
	}		
	else if(val==oCMobWheel_vtbl)
	{     	                        
		return 536;//???
	}		
	else if(val==zCZoneSoundDaytime_vtbl)
	{     	                        
		return 280;//or more
	}		
	else if(val==oCTriggerChangeLevel_vtbl)
	{     	                        
		return 340;//+X
	}
	else if(MEM_ReadInt(ptr_begin+4)==16)&&(MEM_ReadInt(ptr_begin+16)==16)
	{     	
		tmp = MEM_ReadInt(ptr_begin+12);
		if(tmp){
			tmp = MEM_ReadInt(tmp);  
			if(MEM_ReadInt(tmp)==oCItem_vtbl){	
				return 32;
			};
		};                    
	}
	else if(MEM_ReadInt(ptr_begin)==zString_vtbl)
	{     	
		return 20;                  
	}
	else
	{
		return 4;//Unknown class/ptr	
	};

	
};
var int last_pointer; var int count; var int last_val;
func int Get_NearestPointerWithValue(var int ptr,var int val)//usesful when looking 4 vtbl
{
	count=count+1;
	printdebug(inttostring(MEM_ReadInt(ptr)));
	last_val=val;
	last_pointer=ptr;
	if(count>=95000)
	{
		printdebug("###########################################");
		printdebug("##   I   N E E D   S O M E   R E S T    ###");
		printdebug("###########################################");
		return 0;	
	};
	if(MEM_ReadInt(ptr)==val)
	{
		return 1;
	}
	else if(MEM_ReadInt(ptr)>7900000)&&(MEM_ReadInt(ptr)<8700000)
	{
	printdebug("skiping bytes...................................");		
	return Get_NearestPointerWithValue(ptr+ptr_getlength(ptr),val);
	}
	else
	{
	return Get_NearestPointerWithValue(ptr+4,val);
	};
};
var string last_str;
func int Get_NearestPointerWithText(var int ptr,var string str)//usesful when looking 4...?
{
	count=count+1;
	printdebug(inttostring(ptr));
	var int i; i = MEM_ReadInt(ptr);
	last_val=i;
	last_str=str;
	last_pointer=ptr;
	if(count>=95020)
	{
		printdebug("###########################################");
		printdebug("##   I   N E E D   S O M E   R E S T    ###");
		printdebug("###########################################");
		return 0;	
	};
	if(MEM_ReadInt(ptr)==zString_vtbl)
	{
		printdebug(concatstrings("STRING!:",MEM_ReadString(ptr)));
		if(Hlp_StrCmp(str,MEM_ReadString(ptr)))
		{
			return 1;	
		};
		return Get_NearestPointerWithText(ptr+20,str);
		
	}
	else if(MEM_ReadInt(ptr)>7900000)&&(MEM_ReadInt(ptr)<8700000)
	{
	printdebug("skiping bytes...................................");		
	return Get_NearestPointerWithText(ptr+ptr_getlength(ptr),str);
	}
	else
	{
	return Get_NearestPointerWithText(ptr+4,str);
	};
};

var int BeginPtr_Level1;
var int BeginPtr_Level2;
var int BeginPtr_Level3;
var int LastPtr_Level1;
var int LastPtr_Level2;
var int LastPtr_Level3;
var int Type_Level2;//0-ptr;1-array;
var int Type_Level3;//0-ptr;1-array;

var int lvl2_lenght;
var int lvl3_lenght;


var int GL_Analize;
var int GL_Levels;
func void CheckAdressLevel3(var int ptr,var int length)
{
	var int v; var string msg; var int new_length;
	new_length = length;
	if(ptr-BeginPtr_Level3>=length)||((Ptr_EndOfObj(ptr)==2)&&(Type_Level3==0)&&(GL_Levels!=1))
	{      
		if(Type_Level3==1)
		{		
			printdebug(">>>>###3========================ARRAY END==========================");	   
		}
		else if(GL_Levels!=1)
		{
			if(Ptr_EndOfObj(ptr)==2)
			{
				printdebug(">>>>###3==============NEXT OBJECT FOUNDED POINTER END==============");	
			} 
			else
			{
				
				msg = Get_NearestNonBlankString(ptr);
				
				if(!Hlp_StrCMP("ERROR",msg))
				{
					msg = concatstrings(">>>>###3====NearestNonBlankString:",msg);
					msg = concatstrings(msg,"============================");	
					printdebug(msg);				
				};
				printdebug(">>>>###3=======================POINTER END=========================");				
			};  	
		};
		return;
	};
	if(ptr-BeginPtr_Level3==0)
	{      
		if(Type_Level3==1)
		{		
			printdebug(">>>>###3=======================ARRAY BEGIN=========================");	   
		}
		else if(GL_Levels!=1)
		{
			msg = ">>>>###3=======";
			msg = concatstrings(msg,_vtbl_AnalizeShort(ptr));
			msg = concatstrings(msg,"===POINTER BEGIN===length:");   
			new_length=ptr_Analizegetlength(ptr);
			msg = concatstrings(msg,inttostring(new_length));
			msg = concatstrings(msg,"=============");  
			if(new_length==0)
			{ return; }//break
			else if(new_length==-1)
			{ new_length=length; };//back2old length
			printdebug(msg);
		};	
	};
	LastPtr_Level3=ptr;
	msg = ">>>>###3[+";
	msg = concatstrings(msg,INTTOHEX(ptr-BeginPtr_Level3));
	
	v = MEM_ReadInt(ptr);
	if(GL_Analize==false)
	{
		msg = concatstrings(msg,"]=");
		msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr)));			
		msg = concatstrings(msg," /p:");
		msg = concatstrings(msg,IntToString(ptr));				
		printdebug(msg);	
		CheckAdressLevel3(ptr+4,length);		
	}
	else
	{
		if(Val_IsString(ptr,v)==2)
		{

			msg = concatstrings(msg,"]=BLANK STRING");
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));					
			msg = concatstrings(msg," /ref:##2[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level2-BeginPtr_Level2));	
			msg = concatstrings(msg,"]");		
			printdebug(">>>>##############   S T R I N G   ##############");	
			printdebug(msg);	
			CheckAdressLevel3(ptr+20,new_length);		
		}
		else if(Val_IsString(ptr,v)==1)
		{
			msg = concatstrings(msg,"]='");
			msg = concatstrings(msg,MEM_ReadString(ptr));		
			msg = concatstrings(msg,"' /p:");
			msg = concatstrings(msg,IntToString(ptr));					
			msg = concatstrings(msg," /ref:##2[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level2-BeginPtr_Level2));	
			msg = concatstrings(msg,"]");		
			printdebug(">>>>##############   S T R I N G   ##############");	
			printdebug(msg);		
			CheckAdressLevel3(ptr+20,new_length);			
		}
		else if(Val_IsArray(ptr,v)==1)
		{
			msg = concatstrings(msg,"]=>#ARRAY alloc:");
			msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr+4)));	
			msg = concatstrings(msg,", used:");
			msg = concatstrings(msg,", val[0]:");	
			
			msg = concatstrings(msg,IntToString(MEM_ReadInt(v)));
			msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr+8)));			
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));					
			msg = concatstrings(msg," /ref:##2[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level2-BeginPtr_Level2));	
			msg = concatstrings(msg,"]");		
			printdebug(msg);	
			//	BeginPtr_Level3=v;
			//	Type_Level3=1;//array
			//	CheckAdressLevel2(v,MEM_ReadInt(ptr+4)*4);			
			CheckAdressLevel3(ptr+12,new_length);			
		}
		else if(Val_IsPointer(v)==1)
		{
			msg = concatstrings(msg,"]=");
			msg = concatstrings(msg,inttostring(v));	
			msg = concatstrings(msg,", P#");	
			msg = concatstrings(msg,_vtbl_AnalizeShort(v));	
			msg = concatstrings(msg,", val:");	
			
			msg = concatstrings(msg,IntToString(MEM_ReadInt(v)));			
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));				
			msg = concatstrings(msg," /ref:##2[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level2-BeginPtr_Level2));	
			msg = concatstrings(msg,"]");	
			if(Ptr_EndOfObj(ptr)==1){ msg = concatstrings(msg," PROBABLY END OF OBJECT");};	
			printdebug(msg);	
			// 	BeginPtr_Level2=v;
			// 	Type_Level2=0;//pointer
			// 	CheckAdressLevel2(v,length/2);	
			CheckAdressLevel3(ptr+4,new_length);		
		}
		else if (Val_IsZFloat(v)==1)
		{
			msg = concatstrings(msg,"]=");
			msg = concatstrings(msg,inttostring(v));	
			msg = concatstrings(msg," / real=");
			msg = concatstrings(msg,float32tostring(v));				
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));					
			msg = concatstrings(msg," /ref:##2[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level2-BeginPtr_Level2));	
			msg = concatstrings(msg,"]");		
			printdebug(msg);		
			CheckAdressLevel3(ptr+4,length);			
		}
		else//normal value
		{
			msg = concatstrings(msg,"]=");
			msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr)));			
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));				
			msg = concatstrings(msg," /ref:##2[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level2-BeginPtr_Level2));	
			msg = concatstrings(msg,"]");
			if(Ptr_EndOfObj(ptr)==1){ msg = concatstrings(msg," PROBABLY END OF OBJECT");};		
			printdebug(msg);	
			CheckAdressLevel3(ptr+4,new_length);			
		};
	};
};
func void CheckAdressLevel2(var int ptr,var int length)
{
	var int v; var string msg; var int new_length;
	new_length = length;
	
	if(ptr-BeginPtr_Level2>=length)||((Ptr_EndOfObj(ptr)==2)&&(Type_Level2==0))
	{      
		if(Type_Level2==1)
		{		
			printdebug(">>##2========================ARRAY END==========================");	   
		}
		else if(GL_Levels!=2)
		{
			if(Ptr_EndOfObj(ptr)==2)
			{
				printdebug(">>##2==============NEXT OBJECT FOUNDED POINTER END==============");	
			} 
			else
			{	
				msg = Get_NearestNonBlankString(ptr);
				
				if(!Hlp_StrCMP("ERROR",msg))
				{
					msg = concatstrings(">>##2====NearestNonBlankString:",msg);
					msg = concatstrings(msg,"============================");	
					printdebug(msg);				
				};
				printdebug(">>##2=======================POINTER END=========================");				
			};  	
		};
		return;
	};
	if(ptr-BeginPtr_Level2==0)
	{      
		
		if(Type_Level2==1)
		{		
			printdebug(">>##2=======================ARRAY BEGIN=========================");	   
		}
		else if(GL_Levels!=2)
		{
		
			msg = ">>##2=======";
			msg = concatstrings(msg,_vtbl_AnalizeShort(ptr));
			msg = concatstrings(msg,"===POINTER BEGIN===length:");   

			new_length=ptr_Analizegetlength(ptr);
			msg = concatstrings(msg,inttostring(new_length));
			msg = concatstrings(msg,"=============");  
			
			if(new_length==0)
			{ return; }//break
			else if(new_length==-1)
			{ new_length=length; };//back2old length
			printdebug(msg);	
			
		};	
	};
	LastPtr_Level2=ptr;
	msg = ">>##2[+";
	msg = concatstrings(msg,INTTOHEX(ptr-BeginPtr_Level2));
	
	v = MEM_ReadInt(ptr);
	if(GL_Analize==false)
	{
		msg = concatstrings(msg,"]=");
		msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr)));			
		msg = concatstrings(msg," /p:");
		msg = concatstrings(msg,IntToString(ptr));				
		printdebug(msg);	
		CheckAdressLevel2(ptr+4,length);		
	}
	else
	{
		if(Val_IsString(ptr,v)==2)
		{

			msg = concatstrings(msg,"]=BLANK STRING");
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));					
			msg = concatstrings(msg," /ref:#1[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level1-BeginPtr_Level1));	
			msg = concatstrings(msg,"]");		
			printdebug(">>##############   S T R I N G   ##############");	
			printdebug(msg);	
			CheckAdressLevel2(ptr+20,new_length);		
		}
		else if(Val_IsString(ptr,v)==1)
		{
			msg = concatstrings(msg,"]='");
			msg = concatstrings(msg,MEM_ReadString(ptr));		
			msg = concatstrings(msg,"' /p:");
			msg = concatstrings(msg,IntToString(ptr));					
			msg = concatstrings(msg," /ref:#1[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level1-BeginPtr_Level1));	
			msg = concatstrings(msg,"]");		
			printdebug(">>##############   S T R I N G   ##############");	
			printdebug(msg);		
			CheckAdressLevel2(ptr+20,new_length);			
		}
		else if(Val_IsArray(ptr,v)==1)
		{
			msg = concatstrings(msg,"]=>#ARRAY alloc:");
			msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr+4)));	
			msg = concatstrings(msg,", used:");
			msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr+8)));			
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));					
			msg = concatstrings(msg," /ref:#1[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level1-BeginPtr_Level1));	
			msg = concatstrings(msg,"]");		
			printdebug(msg);	
			BeginPtr_Level3=v;
			Type_Level3=1;//array
			CheckAdressLevel3(v,MEM_ReadInt(ptr+8)*4+4);	
			CheckAdressLevel2(ptr+4,new_length);				
		}
		else if(Val_IsPointer(v)==1)
		{
			msg = concatstrings(msg,"]=");
			msg = concatstrings(msg,inttostring(v));	
			msg = concatstrings(msg,", P#");	
			msg = concatstrings(msg,_vtbl_AnalizeShort(v));	
			msg = concatstrings(msg,", val:");	
			
			msg = concatstrings(msg,IntToString(MEM_ReadInt(v)));			
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));				
			msg = concatstrings(msg," /ref:#1[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level1-BeginPtr_Level1));	
			msg = concatstrings(msg,"]");	
			if(Ptr_EndOfObj(ptr)==1){ msg = concatstrings(msg," PROBABLY END OF OBJECT");};	
			printdebug(msg);	
			BeginPtr_Level3=v;
			Type_Level3=0;//pointer
			CheckAdressLevel3(v,lvl3_lenght);	
			CheckAdressLevel2(ptr+4,new_length);		
		}
		else if (Val_IsZFloat(v)==1)
		{
			msg = concatstrings(msg,"]=");
			msg = concatstrings(msg,inttostring(v));	
			msg = concatstrings(msg," / real=");
			msg = concatstrings(msg,float32tostring(v));				
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));					
			msg = concatstrings(msg," /ref:##2[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level2-BeginPtr_Level2));	
			msg = concatstrings(msg,"]");		
			printdebug(msg);		
			CheckAdressLevel2(ptr+4,length);			
		}
		else//normal value
		{
			msg = concatstrings(msg,"]=");
			msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr)));			
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));				
			msg = concatstrings(msg," /ref:#1[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level1-BeginPtr_Level1));	
			msg = concatstrings(msg,"]");
			if(Ptr_EndOfObj(ptr)==1){ msg = concatstrings(msg," PROBABLY END OF OBJECT");};		
			printdebug(msg);	
			CheckAdressLevel2(ptr+4,new_length);				
		};
	};
};
func void CheckAdressLevel1(var int ptr,var int length)
{
	var int v; var string msg;
	if(ptr-BeginPtr_Level1>=length)
	{
		printdebug(">#1=============END===============");	
		return;//break
	};
	msg = ">#1[+";
	msg = concatstrings(msg,INTTOHEX(ptr-BeginPtr_Level1));
	LastPtr_Level1=ptr;		
	v = MEM_ReadInt(ptr);
	if(GL_Analize==false)
	{
		msg = concatstrings(msg,"]=");
		msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr)));			
		msg = concatstrings(msg," /p:");
		msg = concatstrings(msg,IntToString(ptr));				
		printdebug(msg);	
		CheckAdressLevel1(ptr+4,length);		
	}
	else
	{	
		if(Val_IsString(ptr,v)==2)
		{
			// 	msg = concatstrings(msg," - +");	
			// 	msg = concatstrings(msg,INTTOHEX(ptr+16-BeginPtr_Level1));	
			msg = concatstrings(msg,"]=BLANK STRING");
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));		
			printdebug(">##############   S T R I N G   ##############");	
			printdebug(msg);	
			CheckAdressLevel1(ptr+20,length);		
		}
		else if(Val_IsString(ptr,v)==1)
		{
			// 	msg = concatstrings(msg," - +");	
			// 	msg = concatstrings(msg,INTTOHEX(ptr+16-BeginPtr_Level1));	
			msg = concatstrings(msg,"]='");
			msg = concatstrings(msg,MEM_ReadString(ptr));		
			msg = concatstrings(msg,"' /p:");
			msg = concatstrings(msg,IntToString(ptr));	
			printdebug(">##############   S T R I N G   ##############");	
			printdebug(msg);	
			CheckAdressLevel1(ptr+20,length);			
		}
		else if(Val_IsArray(ptr,v)==1)
		{
			msg = concatstrings(msg,"]=>#ARRAY, alloc:");
			msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr+4)));	
			msg = concatstrings(msg,", used:");
			msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr+8)));				
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));		
			printdebug(msg);	
			BeginPtr_Level2=v;
			Type_Level2=1;//array
			CheckAdressLevel2(v,MEM_ReadInt(ptr+8)*4);			
			CheckAdressLevel1(ptr+12,length);//array skip		
		}
		else if(Val_IsPointer(v)==1)
		{
			msg = concatstrings(msg,"]=");
			msg = concatstrings(msg,inttostring(v));	
			msg = concatstrings(msg,", P# ");
			msg = concatstrings(msg,_vtbl_AnalizeShort(v));	
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));			
			printdebug(msg);	
			BeginPtr_Level2=v;
			Type_Level2=0;//pointer
			CheckAdressLevel2(v,lvl2_lenght);	
			CheckAdressLevel1(ptr+4,length);			
		}
		else if (Val_IsZFloat(v)==1)
		{
			msg = concatstrings(msg,"]=");
			msg = concatstrings(msg,inttostring(v));	
			msg = concatstrings(msg," / real=");
			msg = concatstrings(msg,float32tostring(v));				
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));					
			msg = concatstrings(msg," /ref:##2[");
			msg = concatstrings(msg,INTTOHEX(LastPtr_Level2-BeginPtr_Level2));	
			msg = concatstrings(msg,"]");		
			printdebug(msg);		
			CheckAdressLevel1(ptr+4,length);			
		}
		else//normal value
		{
			msg = concatstrings(msg,"]=");
			msg = concatstrings(msg,IntToString(MEM_ReadInt(ptr)));			
			msg = concatstrings(msg," /p:");
			msg = concatstrings(msg,IntToString(ptr));		
			printdebug(msg);
			CheckAdressLevel1(ptr+4,length);					
		};
	};
};
func void CheckAdress(var int ptr,var int length,var int levels,var int analize)
{
	
	lvl2_lenght = length/4;
	lvl3_lenght = lvl2_lenght/2;
	
	var string msg;
	MEM_SetShowDebug(1);		
	BeginPtr_Level1 = ptr;
	printdebug(">####################################################");	
	printdebug(">##...S T A R T...C H E C K I N G...A D R E S S...###");	
	msg = concatstrings(">##...ptr:   ",inttostring(ptr));
	msg = concatstrings(msg,"............................###");
	printdebug(msg);	
	msg = concatstrings(">##...length:",inttostring(length));
	msg = concatstrings(msg,".................................###");
	printdebug(msg);	
	if(!analize)
	{
		printdebug(">##...levels:1.FORCE BECAUSE OF ANALIZE-OFF......###");			
	}
	else
	{
		msg = concatstrings(">##...levels:",inttostring(levels));
		msg = concatstrings(msg,"..................................###");
		printdebug(msg);		
	};
	if(analize)
	{
		printdebug(">##................ANALIZE.-ON-..................###");	
	}
	else
	{
		printdebug(">##................ANALIZE.-OFF-.................###");		 
	};
	GL_Analize=analize;
	GL_Levels=levels;		
	printdebug(">##...............................................###");	
	printdebug(">##..It's can take a long time, best log it to....###");	
	printdebug(">##..file in ZSpy, enter '>#' in texfilter........###");	
	printdebug(">##..to make your zspy log smaller................###");	
	printdebug(">####################################################");	
	if(ptr<=0)
	{ 	printdebug("WRONG POINTER ADRESS => ABORTING OPERATION!!!");
		return;
	};	
	var int tmp;
	if(levels<=1)||(!analize)
	{
		
		tmp = lvl3_lenght;
		BeginPtr_Level3=ptr;
		LastPtr_Level3=ptr;	
		lvl3_lenght=length;
		CheckAdressLevel3(ptr,length);	
		lvl3_lenght = tmp;
			
	}
	else if(levels==2)
	{
		
		tmp = lvl2_lenght;
		BeginPtr_Level2=ptr;
		LastPtr_Level2=ptr;	
		CheckAdressLevel2(ptr,length);	
		lvl2_lenght = tmp;			
	}
	else
	{
		CheckAdressLevel1(ptr,length);
	};
};





//"***************************************************************************************
//		E	N	D		O	F		A	N	A	L	Y	Z	E		F	U	N	C	'	S
//
//		E	N	D		O	F		A	N	A	L	Y	Z	E		F	U	N	C	'	S
//
//		E	N	D		O	F		A	N	A	L	Y	Z	E		F	U	N	C	'	S
//
//		E	N	D		O	F		A	N	A	L	Y	Z	E		F	U	N	C	'	S
//
//		E	N	D		O	F		A	N	A	L	Y	Z	E		F	U	N	C	'	S
//
//		E	N	D		O	F		A	N	A	L	Y	Z	E		F	U	N	C	'	S
//"***************************************************************************************








//--------------------------------------
// zCOLOR
//--------------------------------------

const int zCOLOR_CHANNEL     = (1 << 8) - 1;
const int zCOLOR_SHIFT_RED   = 16;
const int zCOLOR_SHIFT_GREEN = 8;
const int zCOLOR_SHIFT_BLUE  = 0;
const int zCOLOR_SHIFT_ALPHA = 24;

const int zCOLOR_RED   = zCOLOR_CHANNEL << zCOLOR_SHIFT_RED;
const int zCOLOR_GREEN = zCOLOR_CHANNEL << zCOLOR_SHIFT_GREEN;
const int zCOLOR_BLUE  = zCOLOR_CHANNEL << zCOLOR_SHIFT_BLUE;
const int zCOLOR_ALPHA = zCOLOR_CHANNEL << zCOLOR_SHIFT_ALPHA;

func int clamp (var int v, var int min, var int max) {
    if (v < min) { return min; };
    if (v > max) { return max; };
    return v;
};

func int RGBAToZColor (var int r, var int g, var int b, var int a) {
    //clamping for safety
    r = clamp (r, 0, 255) << zCOLOR_SHIFT_RED;
    g = clamp (g, 0, 255) << zCOLOR_SHIFT_GREEN;
    b = clamp (b, 0, 255) << zCOLOR_SHIFT_BLUE;
    a = clamp (a, 0, 255) << zCOLOR_SHIFT_ALPHA;
    
    return r | g | b | a;
};


func int zColor_a (var int col) {
	var int ret; ret = (col & zCOLOR_ALPHA) >> zCOLOR_SHIFT_ALPHA ;
	printdebug(inttostring(ret)); 
	if(ret<0){ret = 256 + ret; };
	return ret;
	
};


func int zColor_r (var int col) {
	var int ret; ret = (col & zCOLOR_RED) >> zCOLOR_SHIFT_RED ;
	printdebug(inttostring(ret)); 
	if(ret<0){ret = 256 + ret; };
	return ret;
	
};

func int zColor_g (var int col) {
	var int ret; ret = (col & zCOLOR_GREEn) >> zCOLOR_SHIFT_GREEN ;
	printdebug(inttostring(ret)); 
	if(ret<0){ret = 256 + ret; };
	return ret;
	
};

func int zColor_b (var int col) {
	var int ret; ret = (col & zCOLOR_BLUE) >> zCOLOR_SHIFT_BLUE ;
	printdebug(inttostring(ret)); 
	if(ret<0){ret = 256 + ret; };
	return ret;
	
};
//######################################################
//
//  My ReadString
//	-should work in every conditions
//######################################################
func string MY_MEM_ReadString (var int address) {
	
    MEM_ReinitParser();

    if(MEM_ReadInt(address)!=zString_vtbl)
    { return "ERR-WRONG-STR-Vtbl!";};   
    if(MEM_ReadInt(address+12)<MEM_ReadInt(address+16))
    { return "ERR-STR-LONGER-THAN-ALLOCAT!";}; 

    
    var oCNPC hlp; var int ptr; var string res;
    hlp = Hlp_GetNpc (MEM_HELPER_INST);
    /*set ptr to begin of npcname*/
    ptr =  (hlp) + MEM_NpcName_Offset;
    /*copy string bytes*/
    MEM_WriteInt(ptr,MEM_ReadInt(address));
    MEM_WriteInt(ptr+4,	MEM_ReadInt(address+4));
    MEM_WriteInt(ptr+8,	MEM_ReadInt(address+8));
    MEM_WriteInt(ptr+12,MEM_ReadInt(address+12));
    MEM_WriteInt(ptr+16,MEM_ReadInt(address+16));
    
	res = hlp.name;

    /* res = *(other + oCNpc_idx_offset) */
    return res;    
};
//######################################################
//
//  oCNPC_GetCNPC
//	-get excactly this ONE C_NPC
//	example of use:
//	self id is Scavenger, when u get oCNPC through Hlp_GetNpc(Scavenger)
//	getnpc will probably return another Scavenger, not self
//######################################################

func int oCNpc_GetPointer(var C_NPC slf)
{
	if (!Hlp_IsValidNpc(slf))  {
    MEM_Error (ConcatStrings ("oCNpc_GetPointer: Invalid c_npc: ", IntToString (slf.id)));
    return 0;
    };	
    MEM_ReinitParser();
    var c_npc hlp; var int ptr;
	hlp = Hlp_GetNpc(MEM_HELPER_INST);
	MEM_Helper = Hlp_GetNpc (hlp);
	Npc_SetTarget(hlp,slf);//self,other
	ptr = MEM_Helper.enemy;

	return ptr;
			
};

func void printdebug_ss(var string a,var string b)
{
	var string pipe;
	pipe = concatstrings(a,b);	
	printdebug(pipe);
};


func void printdebug_s_i(var string a,var int b)
{
	var string pipe;
	pipe = concatstrings(a,inttostring(b));	
	printdebug(pipe);
};


func void printdebug_s_f(var string a,var int b)
{
	var string pipe;
	pipe = concatstrings(a,float32tostring(b));	
	printdebug(pipe);
};

func void printdebug_s_i_s(var string a,var int b,var string c)
{
	var string pipe;
	pipe = concatstrings(a,inttostring(b));
	pipe = concatstrings(pipe,c);
	printdebug(pipe);
};

func void printdebug_s_i_s_i(var string a,var int b,var string c,var int d)
{
	var string pipe;
	pipe = concatstrings(a,inttostring(b));
	pipe = concatstrings(pipe,c);
	pipe = concatstrings(pipe,inttostring(d));
	printdebug(pipe);
};

func void printdebug_s_f_s_f(var string a,var int b,var string c,var int d)
{
	var string pipe;
	pipe = concatstrings(a,float32tostring(b));
	pipe = concatstrings(pipe,c);
	pipe = concatstrings(pipe,float32tostring(d));
	printdebug(pipe);
};
func void printdebug_s_f_s_f_s_f(var string a,var int b,var string c,var int d,var string e,var int f)
{
	var string pipe;
	pipe = concatstrings(a,float32tostring(b));
	pipe = concatstrings(pipe,c);
	pipe = concatstrings(pipe,float32tostring(d));
	pipe = concatstrings(pipe,e);
	pipe = concatstrings(pipe,float32tostring(f));
	printdebug(pipe);
};

//Same for print function


func void print_ss(var string a,var string b)
{
	var string pipe;
	pipe = concatstrings(a,b);	
	print(pipe);
};

func void print_ssss(var string a,var string b,var string c,var string d)
{
	var string pipe;
	pipe = concatstrings(a,b);	
	pipe = concatstrings(pipe,c);	
	pipe = concatstrings(pipe,d);	
	print(pipe);
};


func void print_s_i(var string a,var int b)
{
	var string pipe;
	pipe = concatstrings(a,inttostring(b));	
	print(pipe);
};


func void print_s_f(var string a,var int b)
{
	var string pipe;
	pipe = concatstrings(a,float32tostring(b));	
	print(pipe);
};

func void print_s_i_s(var string a,var int b,var string c)
{
	var string pipe;
	pipe = concatstrings(a,inttostring(b));
	pipe = concatstrings(pipe,c);
	print(pipe);
};

func void print_s_i_s_i(var string a,var int b,var string c,var int d)
{
	var string pipe;
	pipe = concatstrings(a,inttostring(b));
	pipe = concatstrings(pipe,c);
	pipe = concatstrings(pipe,inttostring(d));
	print(pipe);
};

func void print_s_f_s_f(var string a,var int b,var string c,var int d)
{
	var string pipe;
	pipe = concatstrings(a,float32tostring(b));
	pipe = concatstrings(pipe,c);
	pipe = concatstrings(pipe,float32tostring(d));
	print(pipe);
};

// ORK: Wiem ze wypierdalam z działem troche ciężkim, ale przyda mi się
// do debagu muzyki i systemu obrażeń
//Same for PrintScreen function
//PrintScreen           (var INT dialogNr, VAR STRING msg, VAR INT posx, VAR INT posy, VAR STRING font, VAR INT timeSec) { };
func void printscreen_ss(var string a,var string b,var int x, var int y, var int timeS)
{
	var string pipe;
	pipe = concatstrings(a,b);	
	printscreen(pipe,x,y,"font_default.tga",timeS);
};

func void printscreen_ssss(var string a,var string b,var string c,var string d,var int x, var int y, var int timeS)
{
	var string pipe;
	pipe = concatstrings(a,b);	
	pipe = concatstrings(pipe,c);	
	pipe = concatstrings(pipe,d);	
	printscreen(pipe,x,y,"font_default.tga",timeS);
};


func void printscreen_s_i(var string a,var int b,var int x, var int y, var int timeS)
{
	var string pipe;
	pipe = concatstrings(a,inttostring(b));	
	printscreen(pipe,x,y,"font_default.tga",timeS);
};


func void printscreen_s_f(var string a,var int b,var int x, var int y, var int timeS)
{
	var string pipe;
	pipe = concatstrings(a,float32tostring(b));	
	printscreen(pipe,x,y,"font_default.tga",timeS);
};

func void printscreen_s_i_s(var string a,var int b,var string c,var int x, var int y, var int timeS)
{
	var string pipe;
	pipe = concatstrings(a,inttostring(b));
	pipe = concatstrings(pipe,c);
	printscreen(pipe,x,y,"font_default.tga",timeS);
};

func void printscreen_s_i_s_i(var string a,var int b,var string c,var int d,var int x, var int y, var int timeS)
{
	var string pipe;
	pipe = concatstrings(a,inttostring(b));
	pipe = concatstrings(pipe,c);
	pipe = concatstrings(pipe,inttostring(d));
	printscreen(pipe,x,y,"font_default.tga",timeS);
};

func void printscreen_s_f_s_f(var string a,var int b,var string c,var int d,var int x, var int y, var int timeS)
{
	var string pipe;
	pipe = concatstrings(a,float32tostring(b));
	pipe = concatstrings(pipe,c);
	pipe = concatstrings(pipe,float32tostring(d));
	printscreen(pipe,x,y,"font_default.tga",timeS);
};