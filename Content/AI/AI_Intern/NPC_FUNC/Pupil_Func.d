//4,5,6,7,8,9,10,11,12,13-Teleported and alpha set to full opanque(on 3) in next steps setting to full visibility 
func void PupilBugfix2Handle()
{

	if(PupilBugfix2>=4)
	{
	var oCNPC rbtr;
	rbtr = hlp_Getnpc(my_wolf);	
	PupilBugfix2=PupilBugfix2+1;
		if(PupilBugfix2==5)
		{
			rbtr._zCVob_visualAlpha = fracf(2,10); 
		}		
		else if(PupilBugfix2==6)
		{
			rbtr._zCVob_visualAlpha = fracf(3,10); 
		}		
		else if(PupilBugfix2==7)
		{
			rbtr._zCVob_visualAlpha = fracf(4,10); 
		}		
		else if(PupilBugfix2==8)
		{
			rbtr._zCVob_visualAlpha = fracf(5,10); 
		}		
		else if(PupilBugfix2==9)
		{
			rbtr._zCVob_visualAlpha = fracf(6,10); 
		}		
		else if(PupilBugfix2==10)
		{
			rbtr._zCVob_visualAlpha = fracf(7,10); 
		}		
		else if(PupilBugfix2==11)
		{
			rbtr._zCVob_visualAlpha = fracf(8,10); 
		}		
		else if(PupilBugfix2==12)
		{
			rbtr._zCVob_visualAlpha = fracf(9,10); 
		}	
		else if(PupilBugfix2==13)
		{	
			PupilBugfix2=0;
			rbtr._zCVob_visualAlpha = 1; 		
			rbtr._zCVob_vob_bitfield[0] =  rbtr._zCVob_vob_bitfield[0] & ~ zCVob_bitfield0_visualAlphaEnabled;
		};	
	};	
};