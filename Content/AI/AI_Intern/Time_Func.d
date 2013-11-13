/*************************************************************************
**																		**
**		Wld_Gettimehour													**
**		=============													**
**																		**
**		Func returns Now Hour In Gothic							**
**		By Orcwarrior													**
**																		**
*************************************************************************/
Func Int GetHour(Var Int Min,Var Int Max)
{
	If(Min==Max)
	{
		Return Min;
	}
	Else If(Wld_Istime(Min,00,(Min+Max)/2,59))
	{
		Return Gethour(Min,(Min+Max)/2);
	}
	Else
	{
		Return Gethour((Min+Max)/2+1,Max);
	};
};

Func Int Wld_GetHour()
{
	Return Gethour(0,23);
};
/*************************************************************************
**																		**
**		Wld_Gettimemin													**
**		=============													**
**																		**
**		Func returns Now Minute In Gothic							**
**		By Orcwarrior													**
**																		**
*************************************************************************/
Func Int GetMin(Var Int Hour,Var Int Min,Var Int Max)
{
	If(Min==Max)
	{
		Return Min;
	}
	Else If(Wld_Istime(Hour,Min,Hour,(Min+Max)/2))
	{
		Return Getmin(Hour,Min,(Min+Max)/2);
	}
	Else
	{
		Return Getmin(Hour,(Min+Max)/2+1,Max);
	};
};
Func Int Wld_GetMin()
{
	Return Getmin(Wld_Gethour(),0,59);
};