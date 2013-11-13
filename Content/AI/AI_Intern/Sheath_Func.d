
func int Get_HeroSheath(var int ptr)
{
	if(ptr==0){printdebug("HETGEROSHEATS-ERROR!");};
	
	var string objname;
	
	var int label; var int val; var int first_ptr; var int previous;
	first_ptr = ptr;
	val = MEM_ReadInt(ptr+16);//data zCVobVFX?
	if(val)
	{
		if(MEM_ReadInt(val)==8200452)
		{
			objname = MEM_ReadString(val+16);
			if(Hlp_StrCmp(STR_Prefix(objname,6),"V_ITMW"))
			{	
				return val;
			};		
		};
	};
	
	MEM_InitLabels(); 
	label = MEM_StackPos.position; 	
	if(previous)
	{
	ptr = MEM_ReadInt(ptr+12);//next		
	}
	else
	{
	ptr = MEM_ReadInt(ptr+8);//next
	};
	if(ptr==0)
	{
		previous=true; 
		ptr=first_ptr; 
		MEM_StackPos.position = label; 
	};
	val = MEM_ReadInt(ptr+16);//data zCVobVFX?
	if(val)
	{
		if(MEM_ReadInt(val)==8200452)
		{
			objname = MEM_ReadString(val+16);
			if(Hlp_StrCmp(STR_Prefix(objname,6),"V_ITMW"))
			{	
				return val;
			};		
		}
		else if (first_ptr!=ptr)
		{
			MEM_StackPos.position = label; 	
		};
	}
	else { return 0;};
	
	
};

func void Create_Sheath(var c_npc slf,var int itm_ptr)
{
	if(!itm_ptr)
	{ return;};
	if(MEM_ReadInt(itm_ptr+312)&ITEM_AXE)||(MEM_ReadInt(itm_ptr+312)&ITEM_2HD_AXE)//item.flags
	{return;};//no sheats 4 axes/maces
	if(MEM_ReadInt(itm_ptr+320)==8650)
	{printdebug("skip"); return;};
	var string sheath; var int itm_id_lenght;
	//Anti Crash
	itm_id_lenght = MEM_ReadInt(itm_ptr+504);
	if(itm_id_lenght>13)
	{
	if(Hlp_StrCmp(MEM_ReadString(itm_ptr+492),"ItMw_2H_Sword_Old_01.3DS"))
	||(Hlp_StrCmp(MEM_ReadString(itm_ptr+492),"ItMw_1H_Sword_Old_01.3DS"))
	||(!Hlp_StrCmp(Str_Prefix(MEM_ReadString(itm_ptr+492),13),"ItMw_1H_Sword"))
	||(!Hlp_StrCmp(Str_Prefix(MEM_ReadString(itm_ptr+492),13),"ItMw_2H_Sword"))
	{ 
		return;
	};
	} else { return;};
	
	
	sheath = STR_Prefix(MEM_ReadString(itm_ptr+492),itm_id_lenght-6);//without: 0X.3ds
	sheath = concatstrings("V_",sheath);
	sheath = concatstrings(sheath,"SHEATH_0");
	sheath = concatstrings(sheath,inttostring(MEM_ReadInt(itm_ptr+744)%2+1));//instance%2
	
	//bugfix npc's need another mesh ;/
	if(!Npc_IsPlayer(slf))
	{
	sheath = concatstrings(sheath,"_NPC");
	
	};
	Wld_PlayEffect(sheath, slf, slf, 0, 0, DAM_INVALID, FALSE);			

	if(Npc_IsPlayer(slf))
	{
		var ocnpc hiro; 
		hiro = hlp_getnpc(hero);
		itm_id_lenght = MEM_InstGetOffset(hiro);
		itm_id_lenght = MEM_ReadInt(itm_id_lenght+36);//hero zCTree
		itm_id_lenght = MEM_ReadInt(itm_id_lenght);//parent zCTree
		itm_id_lenght = MEM_ReadInt(itm_id_lenght+4);//child zCTree					
		V_HeroSheath_Pointer = Get_HeroSheath(itm_id_lenght);	
	};
	
};

func void Create_SheathItemID(var c_npc slf,var int itmID)
{
	Npc_GetInvItem(slf,itmId);//item->itmid
	printdebug(concatstrings("SheatItem: ",item.visual));
	if(!itmID)
	{ return;};
	if(item.flags&ITEM_AXE)||(item.flags&ITEM_2HD_AXE)//item.flags
	{return;};//no sheats 4 axes/maces
	if(item.value==8650)
	{printdebug("skip"); return;};
	var string sheath; var int itm_id_lenght;
	//Anti Crash
	itm_id_lenght = STR_Len(item.visual);
	if(itm_id_lenght>13)
	{
	if(Hlp_StrCmp(item.visual,"ItMw_2H_Sword_Old_01.3DS"))
	||(Hlp_StrCmp(item.visual,"ItMw_1H_Sword_Old_01.3DS"))
	||((!Hlp_StrCmp(Str_Prefix(item.visual,13),"ITMW_1H_SWORD"))&&(!Hlp_StrCmp(Str_Prefix(item.visual,13),"ITMW_2H_SWORD")))
	{ 
		printdebug(concatstrings(Str_Prefix(item.visual,13),concatstrings(" don't match: ","ITMW_nH_SWORD")));
		return;
	};
	} else { return;};
	
	
	sheath = STR_Prefix(item.visual,itm_id_lenght-6);//without: 0X.3ds
	sheath = concatstrings("V_",sheath);
	sheath = concatstrings(sheath,"SHEATH_0");
	sheath = concatstrings(sheath,inttostring(item.id%2+1));//instance%2
	
	//bugfix npc's need another mesh ;/
	if(!Npc_IsPlayer(slf))
	{
	sheath = concatstrings(sheath,"_NPC");
	
	};
	Wld_PlayEffect(sheath, slf, slf, 0, 0, DAM_INVALID, FALSE);			

	if(Npc_IsPlayer(slf))
	{
		var ocnpc hiro; 
		hiro = hlp_getnpc(hero);
		itm_id_lenght = MEM_InstGetOffset(hiro);
		itm_id_lenght = MEM_ReadInt(itm_id_lenght+36);//hero zCTree
		itm_id_lenght = MEM_ReadInt(itm_id_lenght);//parent zCTree
		itm_id_lenght = MEM_ReadInt(itm_id_lenght+4);//child zCTree					
		V_HeroSheath_Pointer = Get_HeroSheath(itm_id_lenght);	
	};
	
};


//TODO:
//Fix bug, when hero haven't any sheat because he fe. euqiped pickaxe, at equiping another weapon game crash
//(sure because of destroying uncreated vfx of sheat)
func void Destroy_Sheath(var int hero,var int ptr)
{
		if(ptr==0){return;};
		if(MEM_ReadInt(ptr)!=zCVisualFX_vtbl)
		{return;};//It'z a trap!
		var int val; var int p;
		p = MEM_ReadInt(ptr+184);//ZCviusal of VFX
		val = MEM_ReadInt(p+4);
		MEM_WriteInt(p+4,val-1);//zCVisual refctr-1
		MEM_WriteInt(ptr+184,0);//remove ptr to visual
		if(hero)
		{	
		V_HeroSheath_Pointer=0;	
		};
		
};
func void Hero_SheathUpadteLightning()
{
	if(!V_HeroSheath_Pointer)
	{ return; };
 	var ocnpc hiro; 
 	hiro = hlp_getnpc(hero);	
	MEM_WriteInt(V_HeroSheath_Pointer+196,hiro._zCVob_lightColorStat);	
	MEM_WriteInt(V_HeroSheath_Pointer+200,hiro._zCVob_lightColorDyn);	
	
	MEM_WriteInt(V_HeroSheath_Pointer+204,hiro._zCVob_lightDirectionStat[0]);	
	MEM_WriteInt(V_HeroSheath_Pointer+208,hiro._zCVob_lightDirectionStat[1]);	
	MEM_WriteInt(V_HeroSheath_Pointer+212,hiro._zCVob_lightDirectionStat[2]);	
	
	var int hlp;
	hlp = MEM_ReadInt(V_HeroSheath_Pointer+228);
	hlp = hlp | zCVob_bitfield0_lightColorStatDirty;
	hlp = hlp | zCVob_bitfield0_lightColorDynDirty;	
	MEM_WriteInt(V_HeroSheath_Pointer+228,hlp);
	
	
};


FUNC VOID B_CheckSheath()
{
// TURN IT ON when check of npc strenght/needed weapon strength need to be checked
// 	If(Npc_GetInvItembyslot(self,1,0)> 0)//has melee weapon?
// 	{
// 		print_s_i_s_i(self.name,	self.attribute[ATR_STRENGTH],"/",item.cond_value[2]);
// 		if(item.cond_value[2]>self.attribute[ATR_STRENGTH])
// 		{
// 			printdebug_s_i_s_i(concatstrings("TODO: correct - ",self.name),	self.attribute[ATR_STRENGTH],"/",item.cond_value[2]);
// 			self.attribute[ATR_STRENGTH] = item.cond_value[2];
// 		};	
// 	};
	MEM_SetShowDebug(1);
	sheath_cycles+=1;
	if(sheath_cycles>11)
	{ return;};

	If(Npc_GetAivar(self,AIV_SHEATH)<Worlds_Inits)
	{
		Npc_SetAivar(Self,AIV_SHEATH,Worlds_Inits);
		var c_item itm; var int id; var int ptr;
		itm = Npc_GetEquippedMeleeWeapon(self);
		if(Hlp_IsValidItem(itm))
		{
			if((itm.flags & ITEM_SWD)==ITEM_SWD)||((itm.flags & ITEM_2HD_SWD)==ITEM_2HD_SWD)
			{
				id = Hlp_GetInstanceID(itm);
				ptr = MEM_InstGetOffset(id);	
				Create_Sheath(Self,ptr);
			};
		};
	};
	//Npc_Percdisable(self,Perc_Npccommand);
	
	//CheckDamage (it need to be here)
	
		if ( Npc_IsPlayer( other ) )
		{
			add_CollPool(self);	
		};

};