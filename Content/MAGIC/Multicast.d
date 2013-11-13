// *****************************************************
// Function called by all spells
// ***
// * It handle multicast ability (temp potion)
// 
// * Right now additionaly it do small scroll-mana
//   Bugfix ;-)
//
// self - caster
// other - target of spell
// 
// ****************************************************
var int GlobalManaInvested; // shouldn't have problem to store last manaInvested	
							// Yes, I'm too lazy to add argument to Multicast ;P
func void Multicast()
{
	if(!Hlp_IsValidNpc(self)){ return; };
// 	//Scrolls mana bugfix:
// 	var int scrollManaPerInvest;
// 	if(Get_ActiveSpell_Circle(self)==0)&&(!Hlp_StrCmp(Get_ActiveSpell_Name(self),NAME_Rune))
// 	{
// 		printdebug("Checkpoint 1");
// 		scrollManaPerInvest = SPL_SENDCAST_Meteor / SPL_SENDCAST_SCROLL - (SPL_SENDCAST_Meteor / SPL_SENDCAST_SCROLL)%1;
// 		scrollManaPerInvest -= scrollManaPerInvest%1;//round
// 		if(GlobalManaInvested%10 <= scrollManaPerInvest)
// 		{
// 			self.attribute[ATR_MANA]+=1;	
// 		};
// 	};	
	
	
	//Multicast:
	if(!mul_time)&&(!Npc_GetAivar(self,AIV_TPMULT))||(!Hlp_IsValidNpc(other)){return;};	
	
	var int rnd; rnd = hlp_random(100)+1;	
	if(rnd >= 50)&&(self.attribute[ATR_MANA]>=SPL_SENDCAST_FIREBOLT)
	{	
		Wld_PlayEffect("spellFX_Firebolt", self, other, 0, SPL_DAMAGE_FIREBOLT, DAM_FIRE, 1);
		self.attribute[ATR_MANA]-=SPL_SENDCAST_FIREBOLT;
	};
	rnd = hlp_random(100)+1;
	if(rnd >= 90)&&(self.attribute[ATR_MANA]>=SPL_SENDCAST_ICECUBE)
	{	
		Wld_PlayEffect("spellFX_IceCube", self, other, 1, 1, DAM_MAGIC, 1);
		Npc_ClearAiQueue(other);
		AI_StartState		(other,	ZS_MagicFreeze,	1,	"");	
		self.attribute[ATR_MANA]-=SPL_SENDCAST_ICECUBE;

	};
	rnd = hlp_random(100)+1;
	if(rnd >= 85)&&(self.attribute[ATR_MANA]>=SPL_SENDCAST_WEAKNESS)
	{	
		Wld_PlayEffect("SpellFX_Weakness", self, other, 1, 2, DAM_MAGIC, 1);
		add_Curse(other, other);
		self.attribute[ATR_MANA]-=SPL_SENDCAST_WEAKNESS;

	};
	rnd = hlp_random(100)+1;
	if(rnd >= 95)&&(self.attribute[ATR_MANA]>=SPL_SENDCAST_THUNDER)
	{	
		Wld_PlayEffect("spellFX_Thunder", self, other, 2, SPL_DAMAGE_THUNDER, DAM_MAGIC, 1);
		self.attribute[ATR_MANA]-=SPL_SENDCAST_THUNDER;
	}; 
}; 
