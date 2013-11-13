var int Hero_ManaInvested;
func void Correct_ScrollMana(var int spell_mana,var int manaInvested)
{
	//No hero? Fuck that!
	if(!Npc_IsPlayer(self))
	{ return; };
	
	if(spell_mana==0)
	{
      Hero_ManaInvested=0;	
	};
	
	var int scrollManaPerInvest;
	//print_S_I("Mana Invested: ",manaInvested);
	//printdebug_s_i_S_I(">#Mana Invested: ",manaInvested,"/",spell_mana);
	if(Get_ActiveSpell_Circle(self)==0)&&(!Hlp_StrCmp(Get_ActiveSpell_Name(self),NAME_Rune))
	{
		scrollManaPerInvest = spell_mana  - (spell_mana % SPL_SENDCAST_SCROLL);
		scrollManaPerInvest = spell_mana/SPL_SENDCAST_SCROLL;
		//printdebug_s_i(">#scrollManaPerInvest: ",scrollManaPerInvest);
		//scrollManaPerInvest -= scrollManaPerInvest%1;//round
		if(scrollManaPerInvest==0){return;};
		if(manaInvested%scrollManaPerInvest != 0)
		{
			//print_S_I("deinvest: ",scrollManaPerInvest);
			//printdebug_S_I("deinvest: ",scrollManaPerInvest);
			self.attribute[ATR_MANA]+=1;	
		}
		else
		{
			Hero_ManaInvested+=1;	
			//Invested mana can't reach over 10!
			if(Hero_ManaInvested==12)&&(manaInvested!=spell_mana)
			{
				Hero_ManaInvested-=1;
				self.attribute[ATR_MANA]+=1;					
			};
		};
	};	
};	
