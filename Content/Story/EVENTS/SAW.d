//****************************
// 		LUMBER 
//****************************
func void Mob_saw_use(var int lumber_day_amount, var int item, var string text)
{
   if(!Npc_IsPlayer(self))
	{
		return;//stop processing
	};
   
	var float wait;
	wait = IntToFloat(lumber_day_amount*5);	
   
	if(lumber_day_amount>0)
	{
		Ai_Wait(hero, wait);
		CreateInvItems(hero, item, lumber_day_amount);
		AI_UseMob(hero,"BAUMSAEGEB",-1);
		AI_UseMob(hero,"BAUMSAEGE",-1);		
		PutMsg(ConcatStrings(ConcatStrings("Pozyskano ",IntToString(lumber_day_amount)), text),"font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
	}
	else 
	{ 
		PutMsg(_STR_MESSAGE_COMEBACKLATER,"font_default.tga",RGBAToZColor(255,155,155,255),2*8,"");	
	};
};

func void MOB_SAW_A_S1()
{
   Mob_saw_use(LUMBER_DAYAMOUNT0, ItMa_lumber, " kawa³ków drewna leszczynowego!");
   
	LUMBER_DAYAMOUNT0=0;
};

func void MOB_SAW_B_S1()
{
   Mob_saw_use(LUMBER_DAYAMOUNT1, ItMa_goodlumber, " kawa³ków drewna cisowego!");
   
	LUMBER_DAYAMOUNT1=0;
};