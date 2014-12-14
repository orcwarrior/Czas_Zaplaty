/*************************************************************************
		N E W   S E T
	  R E F R E S H E D
*************************************************************************/

/*************************************************************************
**																		**
**		D_Setdual													**
**		=============													**
**		Seting 2Swords																**
**		Comparing Dmg Of 2 Duals And Set Dmg To Middle.					**
**																		**
*************************************************************************/
Func Void D_Setdual()
{

	Printdebug("D_Setdual");
	Dualequiped=True;
	//Mds
	Mdl_Applyoverlaymds(Hero,"Humans_2Hst3.Mds");
	Npc_Settalentskill(Hero,Npc_Talent_2H,3);
};
/*************************************************************************
**																		**
**		D_Disabledual													**
**		=============													**
**		Unset Duals														**
**		Reset Rightswddmg												**
**																		**
**		Todo: Store 2H %Cents, Force Old Value, Set New Tmp Value:		**
**		50%																**
**																		**
*************************************************************************/
Func Void D_Disabledual()
{
	//TODO: Aplly MDS and skill that HERO REALLY HEAVE!!!
	// disable duals are not only called when hero have duals!!!
	// Done, orc April 28, 2011 
	//Simplified
	Dualequiped=False;
	//Mds
	Mdl_Removeoverlaymds(Hero,"Humans_2Hst3.Mds");
	
	if(Npc_GetTalentValue(hero, NPC_TALENT_2h)>=60)
	{
		Mdl_Applyoverlaymds(Hero,"Humans_2Hst2.Mds");
		Npc_Settalentskill(Hero,Npc_Talent_2H,2);
	}
	else if(Npc_GetTalentSkill(hero, NPC_TALENT_2h)>=30)
	{
		Mdl_Applyoverlaymds(Hero,"Humans_2Hst1.Mds");
		Npc_Settalentskill(Hero,Npc_Talent_2H,1);
	}
	else
	{	
		Npc_Settalentskill(Hero,Npc_Talent_2H,0);
	};

};
//*************************************************************************

Func Int D_Dualenoughstr()
{
	Var C_Item Itm_Firstswd;
	Itm_Firstswd=Npc_Getequippedmeleeweapon(Hero);
	if(TALENT_DUALUSING==False)
	{
	PutMsg("Nie potrafiê pos³ugiwaæ siê takim typem broni!","font_default.tga",RGBAToZColor(255,50,50,255),1*8,"");

	return 0;
	};
	If(Hero.Attribute[Atr_Strength]<Itm_Firstswd.Cond_Value[2]+Lswd_Str)
	{
		Var String Msg;Var Int I;
		Msg="Wymagane ";
		Msg=Concatstrings(Msg,Inttostring(Itm_Firstswd.Cond_Value[2]+Lswd_Str));
		Msg=Concatstrings(Msg," punktów si³y!");
		PutMsg(Msg,"font_default.tga",RGBAToZColor(255,50,50,255),2*8,"");

		Npc_Getinvitem(Hero,Lswd_Id);
		I=Npc_Hasitems(Hero,Lswd_Id);
		Npc_Removeinvitems(Hero,Item,I);
		Createinvitems(Hero,Item,I);

		Lswd_Id=0;
		Lswd_Dmg=0;
		Lswd_Str=0;
		Return 0;
	};
	Return 1;
};
//*************************************************************************
//------------------------------------------------------------------------*
//Dualswords Equip/Unequip                                             -*
//*************************************************************************
//------------------------------------------------------------------------*
//** All Right Duals Need This To Work Corectly!                         -*
//------------------------------------------------------------------------*
//*************************************************************************
Func Void D_Rightdualunequip()
{
	Rswd_Id=0;
 If(Lswd_Id!=0)
 {
 D_Disabledual();
 };
};
//Left Dual Unequip
Func Void D_0()
{
		Lswd_Id=0;
		Lswd_Dmg=0;
		Lswd_Str=0;
 If(Rswd_Id!=0)
 {
 D_Disabledual();
 };
};

//*************************************************************************
//------------------------------------------------------------------------*
//** All Left Duals Need This To Work Corectly!                          -*
//------------------------------------------------------------------------*
//*************************************************************************
Func Void D1_1()
{
	
	Npc_Getinvitem(Hero,Itmw_Dual_01_Left);
	Lswd_Id=Hlp_Getinstanceid(Item);
	Lswd_Dmg=Item.Range;
	Lswd_Str=Item.Cond_Value[2];
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
Func Void D2_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_02_Left);
	Lswd_Id=Hlp_Getinstanceid(Item);
	Lswd_Dmg=Item.Range;
	Lswd_Str=Item.Cond_Value[2];
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
Func Void D3_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_03_Left);
	Lswd_Id=Hlp_Getinstanceid(Item);
	Lswd_Dmg=Item.Range;
	Lswd_Str=Item.Cond_Value[2];
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
Func Void D4_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_04_Left);
	Lswd_Id=Hlp_Getinstanceid(Item);
	Lswd_Dmg=Item.Range;
	Lswd_Str=Item.Cond_Value[2];
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
Func Void D5_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_05_Left);
	Lswd_Id=Hlp_Getinstanceid(Item);
	Lswd_Dmg=Item.Range;
	Lswd_Str=Item.Cond_Value[2];
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
Func Void D6_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_06_Left);
	Lswd_Id=Hlp_Getinstanceid(Item);
	Lswd_Dmg=Item.Range;
	Lswd_Str=Item.Cond_Value[2];
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
Func Void D7_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_07_Left);
	Lswd_Id=Hlp_Getinstanceid(Item);
	Lswd_Dmg=Item.Range;
	Lswd_Str=Item.Cond_Value[2];
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
//*************************************************************************
//------------------------------------------------------------------------*
//** ...Shit, Right Too :/						                         -*
//------------------------------------------------------------------------*
//*************************************************************************
Func Void Dr1_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_01_Right);
	Rswd_Id=Hlp_Getinstanceid(Item);
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
Func Void Dr2_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_02_Right);
	Rswd_Id=Hlp_Getinstanceid(Item);
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
Func Void Dr3_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_03_Right);
	Rswd_Id=Hlp_Getinstanceid(Item);
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
Func Void Dr4_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_04_Right);
	Rswd_Id=Hlp_Getinstanceid(Item);
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
Func Void Dr5_1()
{
	Var Int A;

	Npc_Getinvitem(Hero,Itmw_Dual_05_Right);//Change
	A	=Hlp_Getinstanceid(Item);
	//Remember Itemid
	Rswd_Id=Hlp_Getinstanceid(Item);
	//If Left Sword Is Dual - Set Dual!
//B_Unequipleftsword();
	Wld_Sendtrigger("Dualtrigger1");
};

Func Void Dr6_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_06_Right);
	Rswd_Id=Hlp_Getinstanceid(Item);
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
Func Void Dr7_1()
{
	Npc_Getinvitem(Hero,Itmw_Dual_07_Right);
	Rswd_Id=Hlp_Getinstanceid(Item);
	If(Rswd_Id!=0)&&(Lswd_Id!=0)
	{
		If(D_Dualenoughstr())
		{
			D_Setdual();
		};
	};
};
//Disabled!

Func Void Blank()
{
	Return;
};
//Duals Proto'S
Prototype Dualright(C_Item)
{
On_Unequip	=D_Rightdualunequip;
Text[4]="Miecz praworêczny";
};

Prototype Dualleft(C_Item)
{
On_Unequip	=D_0;
On_Equip	=Blank;
Mainflag=Item_Kat_Armor;
Flags=0;	//
Wear=Wear_Head;
 //Scemename				=	"Duall";

Text[4]="Miecz leworêczny";
Visual_Change="Hum_Testarmor.Asc";
Material=Mat_Metal;
Protection[Prot_Edge]	=0;
Protection[Prot_Blunt]=0;
Protection[Prot_Point]=0;
Protection[Prot_Fire]=0;
Protection[Prot_Magic]=0;
};
//Obsolete!
Func Void Testdmg()
{
	Npc_Gettarget(Hero);
	Wld_Playeffect("Spellfx_Invisibledmg_Fireball",Hero,Other,1,50+Hero.Attribute[Atr_Strength],Dam_Edge,True);
};

Instance Dmgtester(C_Item)
{
	Name="Tester";

	Mainflag=Item_Kat_None;
	Flags=Item_Multi;

	Value=Value_Erzbrocken;

	Visual="Itmi_Nugget_01.3Ds";
	Material=Mat_Metal;
	Scemename	="Mapsealed";
	On_State[0]	=Testdmg;

	Description	=Name;
	Text[4]	=Name_Value;	Count[4]	=Value;
};
/*********************************************************************************
**  Dual Swords				**
*********************************************************************************/
//Rusty Varrant Swd
Instance Itmw_Dual_01_Right(Dualright)
{
	Name="Dualny stary miecz";

	Mainflag=Item_Kat_Nf;
	Flags=Item_2Hd_Swd;
	Material=Mat_Metal;

	Value=45;

	Damagetotal	=25;
	Damagetype=Dam_Edge;
	Range	=110;
	On_Equip	=Dr1_1;

	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=30;

	Visual="Itmw_1H_Sword_Old_01.3Ds";

	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_01_Left(Dualleft)
{
	Name="Dualny stary miecz";

	Value=45;

	Damagetotal	=25;
	Damagetype=Dam_Edge;
	Range	=110;

	On_Equip	=D1_1;
	Visual="Itmi_Dual_01.Mms";
	Material=Mat_Metal;
	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

//Varrant Swd
Instance Itmw_Dual_02_Right(Dualright)
{
	Name="Runiczne ostrze burzy";

	Mainflag=Item_Kat_Nf;
	Flags=Item_2Hd_Swd;
	Material=Mat_Metal;

	Value=3600;
	On_Equip	=Dr2_1;

	Damagetotal	=60;
	Damagetype=Dam_Edge;
	Range	=130;

	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=45;

	Visual="Itmw_1H_Sword_Bastard_03.3Ds";

	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_02_Left(Dualleft)
{
	Name="Runiczne ostrze burzy";

	Value=3600;
	Wear=Wear_Head;
	Damagetotal	=60;
	Damagetype=Dam_Edge;
	Range	=130;

	On_Equip	=D2_1;
	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=45;
	Visual="Itmi_Dual_02.Mms";
	Material=Mat_Metal;
	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_03_Right(Dualright)
{
	Name="Runiczny miecz szeroki";

	Mainflag=Item_Kat_Nf;
	Flags=Item_2Hd_Swd;
	Material=Mat_Metal;

	Value=3600;
	On_Equip	=Dr3_1;

	Damagetotal	=70;
	Damagetype=Dam_Edge;
	Range	=130;

	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=55;

	Visual="Itmw_1H_Sword_Bastard_02.3Ds";

	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_03_Left(Dualleft)
{
	Name="Runiczny miecz szeroki";

	Value=3600;
	Wear=Wear_Head;
	Damagetotal	=70;
	Damagetype=Dam_Edge;
	Range	=130;

	On_Equip	=D3_1;
	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=55;
	Visual="Itmi_Dual_03.Mms";
	Material=Mat_Metal;
	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_04_Right(Dualright)
{
	Name="Runiczna szeroka katana";

	Mainflag=Item_Kat_Nf;
	Flags=Item_2Hd_Swd;
	Material=Mat_Metal;

	Value=3600;
	On_Equip	=Dr4_1;

	Damagetotal	=60;
	Damagetype=Dam_Edge;
	Range	=130;

	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=45;
	Weight	=123;
	Visual="Itmw_Katana01.3Ds";

	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_04_Left(Dualleft)
{
	Name="Runiczna szeroka katana";

	Value=3600;
	Wear=Wear_Head;
	Damagetotal	=60;
	Damagetype=Dam_Edge;
	Range	=130;

	On_Equip	=D4_1;
	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=50;
	Visual="Itmi_Dual_04B.Mms";
	Material=Mat_Metal;
	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_05_Right(Dualright)
{
	Name="Runiczna katana";

	Mainflag=Item_Kat_Nf;
	Flags=Item_2Hd_Swd;
	Material=Mat_Metal;

	Value=3600;
	On_Equip	=Dr5_1;

	Damagetotal	=50;
	Damagetype=Dam_Edge;
	Range	=130;
	Weight	=123;

	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=45;

	Visual="Itmw_Katana02.3Ds";

	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_05_Left(Dualleft)
{
	Name="Runiczna katana";

	Value=3600;
	Wear=Wear_Head;
	Damagetotal	=50;
	Damagetype=Dam_Edge;
	Range	=130;
	On_Equip	=D5_1;

	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=45;
	Visual="Itmi_Dual_05A.Mms";
	Material=Mat_Metal;
	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_06_Right(Dualright)
{
	Name="Runiczna szabla";

	Mainflag=Item_Kat_Nf;
	Flags=Item_2Hd_Swd;
	Material=Mat_Metal;

	Value=3600;
	On_Equip	=Dr6_1;

	Damagetotal	=70;
	Damagetype=Dam_Edge;
	Range	=130;
	Weight	=123;

	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=45;

	Visual="Itmw_Katana03.3Ds";

	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_06_Left(Dualleft)
{
	Name="Runiczna szabla";

	Value=3600;
	Wear=Wear_Head;
	Damagetotal	=70;
	Damagetype=Dam_Edge;
	Range	=130;
	On_Equip	=D6_1;

	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=45;
	Visual="Itmi_Dual_06A.Mms";
	Material=Mat_Metal;
	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_07_Right(Dualright)
{
	Name="Runiczna maczeta";

	Mainflag=Item_Kat_Nf;
	Flags=Item_2Hd_Swd;
	Material=Mat_Metal;

	Value=3600;
	On_Equip	=Dr7_1;

	Damagetotal	=80;
	Damagetype=Dam_Edge;
	Range	=130;
	Weight	=123;

	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=45;

	Visual="Itmw_Machette_01.3Ds";

	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};

Instance Itmw_Dual_07_Left(Dualleft)
{
	Name="Runiczna maczeta";

	Value=3600;
	Wear=Wear_Head;
	Damagetotal	=80;
	Damagetype=Dam_Edge;
	Range	=130;
	On_Equip	=D7_1;

	Cond_Atr[2]=Atr_Strength;
	Cond_Value[2]=45;
	Visual="Itmi_Dual_07.Mms";
	Material=Mat_Metal;
	Description	=Name;
	Text[2]	=Name_Damage;	Count[2]	=Damagetotal;
	Text[3]=Name_Str_Needed;	Count[3]	=Cond_Value[2];
	Text[5]	=Name_Value;	Count[5]	=Value;
};