func void B_InitGrdFunc(var C_NPC slf,var int MaxRnd,var int MinLevel)///MinLevel+MAxRND = GRDDificult
{
   var int GrdTalentsInit;
   var int GrdType;
   
	GrdDificult = MinLevel+Hlp_Random (MaxRnd);

	GrdTalentsInit = Hlp_Random (100);	
	if (slf.id == 2732)
 	{
	 	GrdTalentsInit = 23;
 	};
   
	if (GrdTalentsInit > 50)
	{
		GrdType = 1;
	}
	else if (GrdTalentsInit > 20)
	{
		GrdType = 3;
	}
	else
	{
		GrdType = 2;			
	};
   
   B_SetDificult(slf, GrdType, GrdDificult);
	B_CreateMiscInvItems(slf, GrdType);	
	B_CreateWeapon(slf, GrdType, GrdDificult);
	
   B_SetArmor(slf,GrdDificult);
	B_SetFace(slf);
};
