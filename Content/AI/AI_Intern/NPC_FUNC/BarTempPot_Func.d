var string TMP_STR;
var string TMP_DEX;
var string TMP_HP;
var string TMP_MP;
var string TMP_P_WEAP;
var string TMP_P_PNT;
var string TMP_P_FIRE;
var string TMP_P_MAGIC;
var string TMP_S_IMMU;
var string TMP_S_MULT;
var string TMP_S_BASH;
var string TMP_S_CRIT;

func void Upadte_BarTempPot_Strings()
{
	if(str_time)
	{
		if(str_time<=15)
		{	
			if((str_time%2==1)&&(str_time>10))||(str_time==8)||(str_time==5)||(str_time==2)
			{
			TMP_STR = ",";
			}
			else
			{
			TMP_STR = "(";	
			};
		}
		else if(str_time<=20)
		{	
		TMP_STR = ",";	
		}
		else
		{
		TMP_STR = "+";	
		};
	}
	else
	{
		TMP_STR = "$";			
	};

	if(dex_time)
	{
		if(dex_time<=15)
		{	
			if((dex_time%2==1)&&(dex_time>10))||(dex_time==8)||(dex_time==5)||(dex_time==2)
			{
			TMP_dex = ".";
			}
			else
			{
			TMP_dex = "(";	
			};
		}
		else if(dex_time<=20)
		{	
		TMP_dex = ".";	
		}
		else
		{
		TMP_dex = "-";	
		};
	}
	else
	{
		TMP_dex = "$";			
	};	
	
	if(hp_time)
	{
		
		if(hp_time<=15)
		{	
			if((hp_time%2==1)&&(hp_time>10))||(hp_time==8)||(hp_time==5)||(hp_time==2)
			{
			TMP_hp = "0";
			}
			else
			{
			TMP_hp = "(";	
			};
		}
		else if(hp_time<=20)
		{	
		TMP_hp = "0";	
		}
		else
		{
		TMP_hp = "/";	
		};
	}
	else
	{
		TMP_hp = "$";			
	};	

	if(mp_time)
	{
		
		if(mp_time<=15)
		{	
			if((mp_time%2==1)&&(mp_time>10))||(mp_time==8)||(mp_time==5)||(mp_time==2)
			{
			TMP_mp = "2";
			}
			else
			{
			TMP_mp = "(";	
			};
		}
		else if(mp_time<=20)
		{	
		TMP_mp = "2";	
		}
		else
		{
		TMP_mp = "1";	
		};
	}
	else
	{
		TMP_mp = "$";			
	};	
		
	if(imu_time)
	{
		
		if(imu_time<=10)
		{	
			if(imu_time==10)||(imu_time==8)||(imu_time==5)||(imu_time==2)
			{
			TMP_S_IMMU = "4";
			}
			else
			{
			TMP_S_IMMU = "(";	
			};
		}
		else if(imu_time<=15)
		{	
		TMP_S_IMMU = "4";	
		}
		else
		{
		TMP_S_IMMU = "3";	
		};
	}
	else
	{
		TMP_S_IMMU = "$";			
	};	
	if(mul_time)
	{
		
		if(mul_time<=10)
		{	
			if(mul_time==10)||(mul_time==8)||(mul_time==5)||(mul_time==2)
			{
			TMP_S_MULT = "6";
			}
			else
			{
			TMP_S_MULT = "(";	
			};
		}
		else if(mul_time<=15)
		{	
		TMP_S_MULT = "6";	
		}
		else
		{
		TMP_S_MULT = "5";	
		};
	}
	else
	{
		TMP_S_MULT = "$";			
	};	




//2 line
	if(edg_time)
	{
		
		if(edg_time<=15)
		{	
			if((edg_time%2==1)&&(edg_time>10))||(edg_time==8)||(edg_time==5)||(edg_time==2)
			{
			TMP_P_WEAP = "8";
			}
			else
			{
			TMP_P_WEAP = ")";	
			};
		}
		else if(edg_time<=20)
		{	
		TMP_P_WEAP = "8";	
		}
		else
		{
		TMP_P_WEAP = "7";	
		};
	}
	else
	{
		TMP_P_WEAP = "!";			
	};
	
	if(pnt_time)
	{
		
		if(pnt_time<=15)
		{	
			if((pnt_time%2==1)&&(pnt_time>10))||(pnt_time==8)||(pnt_time==5)||(pnt_time==2)
			{
			TMP_P_PNT = ":";
			}
			else
			{
			TMP_P_PNT = ")";	
			};
		}
		else if(pnt_time<=20)
		{	
		TMP_P_PNT = ":";	
		}
		else
		{
		TMP_P_PNT = "9";	
		};
	}
	else
	{
		TMP_P_PNT = "!";			
	};	
	
	if(fir_time)
	{
		
		if(fir_time<=15)
		{	
			if((fir_time%2==1)&&(fir_time>10))||(fir_time==8)||(fir_time==5)||(fir_time==2)
			{
			TMP_P_FIRE = "<";
			}
			else
			{
			TMP_P_FIRE = ")";	
			};
		}
		else if(fir_time<=20)
		{	
		TMP_P_FIRE = "<";	
		}
		else
		{
		TMP_P_FIRE = ";";	
		};
	}
	else
	{
		TMP_P_FIRE = "!";			
	};

	if(mag_time)
	{
		
		if(mag_time<=15)
		{	
			if((mag_time%2==1)&&(mag_time>10))||(mag_time==8)||(mag_time==5)||(mag_time==2)
			{
			TMP_P_MAGIC = ">";
			}
			else
			{
			TMP_P_MAGIC = ")";	
			};
		}
		else if(mag_time<=20)
		{	
		TMP_P_MAGIC = ">";	
		}
		else
		{
		TMP_P_MAGIC = "=";	
		};
	}
	else
	{
		TMP_P_MAGIC = "!";			
	};
	
	if(bsh_time)
	{
		
		if(bsh_time<=10)
		{	
			if(bsh_time==10)||(bsh_time==8)||(bsh_time==5)||(bsh_time==2)
			{
			TMP_S_BASH = "@";
			}
			else
			{
			TMP_S_BASH = ")";	
			};
		}
		else if(bsh_time<=15)
		{	
		TMP_S_BASH = "@";	
		}
		else
		{
		TMP_S_BASH = "?";	
		};
	}
	else
	{
		TMP_S_BASH = "!";			
	};

	if(cri_time)
	{
		
		if(cri_time<=10)
		{	
			if(cri_time==10)||(cri_time==8)||(cri_time==5)||(cri_time==2)
			{
			TMP_S_CRIT = "B";
			}
			else
			{
			TMP_S_CRIT = ")";	
			};
		}
		else if(cri_time<=15)
		{	
		TMP_S_CRIT = "B";	
		}
		else
		{
		TMP_S_CRIT = "A";	
		};
	}
	else
	{
		TMP_S_CRIT = "!";			
	};



};
func void Show_BarTempPot()
{
	if(!BTP_Activated)//Don't show bar if none of TP used
	{
		return;
	};
	const string l_align = "'''";
	Upadte_BarTempPot_Strings();
	//1 Line
 	PrintScreen           (ConcatStrings(TMP_STR,l_align), -1, 93,"FNT_TEST.tga",2);	
 	PrintScreen           (ConcatStrings(TMP_DEX,ConcatStrings("%",ConcatStrings(TMP_HP,l_align))), -1, 93,"FNT_TEST.tga",2);
 	PrintScreen           (ConcatStrings(ConcatStrings("'%%%",TMP_MP),l_align), -1, 93,"FNT_TEST.tga",2);
 	PrintScreen           (ConcatStrings(ConcatStrings("'&'%%%%&",TMP_S_IMMU),l_align), -1, 93,"FNT_TEST.tga",2);
 	PrintScreen           (ConcatStrings(ConcatStrings("''&'%%%%&%",TMP_S_MULT),l_align), -1, 93,"FNT_TEST.tga",2);
	//2 Line
	//Bugfix - gothic cannot display strings with same char count in same pos
	//TODO: After all export TGA with transparent 
	//bounding pixels and grid (after .fnt generation)
 	PrintScreen           (ConcatStrings(ConcatStrings("&&&&&&",ConcatStrings(TMP_P_WEAP,"&&&&&&")),l_align), -1, 93,"FNT_TEST.tga",2);	
 	PrintScreen           (ConcatStrings(ConcatStrings("&&&&&&",ConcatStrings(TMP_P_PNT,ConcatStrings("#",ConcatStrings(TMP_P_FIRE,"&&&&&&")))),l_align), -1, 93,"FNT_TEST.tga",2);
 	PrintScreen        	  (ConcatStrings(ConcatStrings("&&&&&&'###",ConcatStrings(TMP_P_MAGIC,"&&&&&&")),l_align), -1, 93,"FNT_TEST.tga",2);
 	PrintScreen        	  (ConcatStrings(ConcatStrings("&&&&&&'&'####&",ConcatStrings(TMP_S_BASH,"&&&&&&")),l_align), -1, 93,"FNT_TEST.tga",2);
 	PrintScreen        	  (ConcatStrings(ConcatStrings("&&&&&&''&'####&#",ConcatStrings(TMP_S_CRIT,"&&&&&&")),l_align), -1, 93,"FNT_TEST.tga",2);
	
};