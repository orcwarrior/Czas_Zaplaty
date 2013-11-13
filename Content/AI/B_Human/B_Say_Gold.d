// **********
// B_Say_Gold
// **********

func void B_Say_Gold_Recursion (var c_npc slf, var c_npc oth, var int goldAmount)
{
	if (goldAmount == 1000) {
	AI_Output (slf, oth,"Say_ORE_1000"); //1000 bry쿮k rudy.
	};
	if (goldAmount == 950)	{
	AI_Output (slf, oth,"Say_ORE_950"); //950 bry쿮k rudy.
	};                                       
	if (goldAmount == 900)	{                
	AI_Output (slf, oth,"Say_ORE_900"); //900 bry쿮k rudy.
	};                                       
	if (goldAmount == 850)	{                
	AI_Output (slf, oth,"Say_ORE_850"); //850 bry쿮k rudy.
	};                                       
	if (goldAmount == 800)	{                
	AI_Output (slf, oth,"Say_ORE_800"); //800 bry쿮k rudy.
	};                                       
	if (goldAmount == 750)	{                
	AI_Output (slf, oth,"Say_ORE_750"); //750 bry쿮k rudy.
	};                                       
	if (goldAmount == 700)	{                
	AI_Output (slf, oth,"Say_ORE_700"); //700 bry쿮k rudy.
	};                                       
	if (goldAmount == 650)	{                
	AI_Output (slf, oth,"Say_ORE_650"); //650 bry쿮k rudy.
	};                                       
	if (goldAmount == 600)	{                
	AI_Output (slf, oth,"Say_ORE_600"); //600 bry쿮k rudy.
	};                                       
	if (goldAmount == 550)	{                
	AI_Output (slf, oth,"Say_ORE_550"); //550 bry쿮k rudy.
	};                                       
	if (goldAmount == 500)	{                
	AI_Output (slf, oth,"Say_ORE_500"); //500 bry쿮k rudy.
	};                                       
	if (goldAmount == 450)	{                
	AI_Output (slf, oth,"Say_ORE_450"); //450 bry쿮k rudy.
	};                                       
	if (goldAmount == 400)	{                
	AI_Output (slf, oth,"Say_ORE_400"); //400 bry쿮k rudy.
	};                                       
	if (goldAmount == 350)	{                
	AI_Output (slf, oth,"Say_ORE_350"); //350 bry쿮k rudy.
	};                                       
	if (goldAmount == 300)	{                
	AI_Output (slf, oth,"Say_ORE_300"); //300 bry쿮k rudy.
	};                                       
	if (goldAmount == 250)	{                
	AI_Output (slf, oth,"Say_ORE_250"); //250 bry쿮k rudy.
	};                                       
	if (goldAmount == 200)	{                
	AI_Output (slf, oth,"Say_ORE_200"); //200 bry쿮k rudy.
	};                                       
	if (goldAmount == 150)	{                
	AI_Output (slf, oth,"Say_ORE_150"); //150 bry쿮k rudy.
	};
	// -----------------------------------------------------------
	if (goldAmount == 100)	{
	AI_Output (slf, oth,"Say_ORE_100"); //100 bry쿮k rudy.
	};
	if (goldAmount == 90)	{
	AI_Output (slf, oth,"Say_ORE_90"); //90 bry쿮k rudy.
	};                                     
	if (goldAmount == 80)	{              
	AI_Output (slf, oth,"Say_ORE_80"); //80 bry쿮k rudy.
	};                                     
	if (goldAmount == 70)	{              
	AI_Output (slf, oth,"Say_ORE_70"); //70 bry쿮k rudy.
	};                                     
	if (goldAmount == 60)	{              
	AI_Output (slf, oth,"Say_ORE_60"); //60 bry쿮k rudy.
	};                                     
	if (goldAmount == 50)	{              
	AI_Output (slf, oth,"Say_ORE_50"); //50 bry쿮k rudy.
	};                                     
	if (goldAmount == 40)	{              
	AI_Output (slf, oth,"Say_ORE_40"); //40 bry쿮k rudy.
	};                                     
	if (goldAmount == 30)	{              
	AI_Output (slf, oth,"Say_ORE_30"); //30 bry쿮k rudy.
	};                                     
	if (goldAmount == 20)	{              
	AI_Output (slf, oth,"Say_ORE_20"); //20 bry쿮k rudy.
	};                                     
	if (goldAmount == 10)	{              
	AI_Output (slf, oth,"Say_ORE_10"); //10 bry쿮k rudy.
	};
};
func void B_Say_Gold (var C_NPC slf, var C_NPC oth, var int goldAmount)
{
	var int gold;
	if 		(goldAmount >= 1000) {	gold = 1000;	}
	else if (goldAmount >= 950)	{	gold = 950;	}
	else if (goldAmount >= 900)	{	gold = 900;	}
	else if (goldAmount >= 850)	{	gold = 850;	}
	else if (goldAmount >= 800)	{	gold = 800;	}
	else if (goldAmount >= 750)	{	gold = 750;	}
	else if (goldAmount >= 700)	{	gold = 700;	}
	else if (goldAmount >= 650)	{	gold = 650;	}
	else if (goldAmount >= 600)	{	gold = 600;	}
	else if (goldAmount >= 550)	{	gold = 550;	}
	else if (goldAmount >= 500)	{	gold = 500;	}
	else if (goldAmount >= 450)	{	gold = 450;	}
	else if (goldAmount >= 400)	{	gold = 400;	}
	else if (goldAmount >= 350)	{	gold = 350;	}
	else if (goldAmount >= 300)	{	gold = 300;	}
	else if (goldAmount >= 250)	{	gold = 250;	}
	else if (goldAmount >= 200)	{	gold = 200;	}
	else if (goldAmount >= 150)	{	gold = 150;	}
	// ---------------------------------------------
	else if (goldAmount >= 100)	{	gold = 100;	}
	else if (goldAmount >= 50)	{	gold = 50;	}
	else  					{	gold = 10;	};
	Global_Crime_goldToPay=gold;
	B_Say_Gold_Recursion(slf,oth,gold);
	
};