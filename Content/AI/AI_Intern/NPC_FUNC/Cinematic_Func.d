const int Cinematics_limit = 20;
const int Cinematic_OW_ExploreColony = 0;
const int Cinematic_OC_KevinDead = 1;
const int Cinematic_OW_Informator_Meet = 2;
const int Cinematic_MD_RodericVsTruan = 3;
var int Global_Cinematic_D[Cinematics_limit];
var int Global_Cinematic_slf[Cinematics_limit];
var int Global_Cinematic_oth[Cinematics_limit];
var int Global_Cinematic_i; // Jak dobrze rozumiem to iterator cinematica, odlicza ile sekund minelo od 1szej kwestii w danym Cinematicu
							// Restowany do 0-start_time w funkcji CinematicReset, wymagany z wartosci¹ min. -20 by wywola³o siê CinematicEvent->wieæ by wogole wywolac cinematica
							// Wiem chujowe to jak nic innego ;/
var int Global_Cinematic_last;
var int Global_Cinematic_id;
var int Global_Cinematic_FORCEANIS;
//0=Test cinematic
//1=..
var string Global_Cinematic_Txt_0;
var string Global_Cinematic_Txt_1;
var string Global_Cinematic_Txt_2;
var string Global_Cinematic_Txt_3;
var string Global_Cinematic_Txt_4;
var string Global_Cinematic_Txt_5;
var string Global_Cinematic_Txt_6;
var string Global_Cinematic_Txt_7;
var string Global_Cinematic_Txt_8;
var string Global_Cinematic_Txt_9;
var string Global_Cinematic_Txt_10;
var string Global_Cinematic_Txt_11;
var string Global_Cinematic_Txt_12;
var string Global_Cinematic_Txt_13;
var string Global_Cinematic_Txt_14;
var string Global_Cinematic_Txt_15;
var string Global_Cinematic_Txt_16;
var string Global_Cinematic_Txt_17;
var string Global_Cinematic_Txt_18;
var string Global_Cinematic_Txt_19;

var string Global_Cinematic_WaveName_0;
var string Global_Cinematic_WaveName_1;
var string Global_Cinematic_WaveName_2;
var string Global_Cinematic_WaveName_3;
var string Global_Cinematic_WaveName_4;
var string Global_Cinematic_WaveName_5;
var string Global_Cinematic_WaveName_6;
var string Global_Cinematic_WaveName_7;
var string Global_Cinematic_WaveName_8;
var string Global_Cinematic_WaveName_9;
var string Global_Cinematic_WaveName_10;
var string Global_Cinematic_WaveName_11;
var string Global_Cinematic_WaveName_12;
var string Global_Cinematic_WaveName_13;
var string Global_Cinematic_WaveName_14;
var string Global_Cinematic_WaveName_15;
var string Global_Cinematic_WaveName_16;
var string Global_Cinematic_WaveName_17;
var string Global_Cinematic_WaveName_18;
var string Global_Cinematic_WaveName_19;


//additional cinematic vars
var int TONY_HELP_CINEMATIC_TRIGGERED;

//set per second trigger timer to -start_time when varible equal to 0 it will start's 1st dialog
//example: CinematicReset(5)
//set trigger counter to -5, after 5 cycles it will reach 0 so the 1st cinematicdialog will be started
// NEW: druga zmienna mo¿e byæ ujemna (do -19) oznacza po ilu sekundach rozpocznie sie 1 kwestia cinematica (0-odrazu/ n<0 po n-sekundach)
 
func void CinematicReset(var int id, var int start_time)
{
	Global_Cinematic_id=id;
	Global_Cinematic_i=0;
	Global_Cinematic_i=Global_Cinematic_i-start_time;
	//Put kino-stripes on
	I_EnableCinemaScope();	
};


//Example: CinematicDialog(PC_Hero,PIR_2601_hank,"Witaj przyjacielu!","CINEMATIC_RBLCAMP_15_01.wav",6);
//Hero will say "Witaj przyjacielu!" to npc with id PIR_2601_hank Text String will been seen for 6 seconds
//"CINEMATIC_RBLCAMP_15_01.wav" (wavename) is the name of sound that will be played if the file exist (dialog line)
//Known bugs - duplicate instance npc's can't be used as slf or oth 
//DURATION = WHEN DIALOG LINE WILL END APPEARING
// For Ex: CinematicDialog(duration==3) it will start when previous dialog end and durate like in argument duration(3)
func void CinematicDialog(var int slf,var int oth, var string txt, var string wavename, var int duration)
{
	if(Global_Cinematic_D[1]==0)//0 (1st) is free - fill it!
	{
		Global_Cinematic_D		 [0]=0;	
		Global_Cinematic_D		 [1]=duration;	
		Global_Cinematic_slf	 [0]=slf;	
		Global_Cinematic_oth	 [0]=oth;
		Global_Cinematic_Txt_0=txt;
		Global_Cinematic_WaveName_0=wavename;
		Global_Cinematic_last=0;
	}
	else if(Global_Cinematic_D[2]==0)//1 (2nd) is free - fill it!
	{
		Global_Cinematic_D		 [2]=Global_Cinematic_D[1]+duration;	
		Global_Cinematic_slf	 [1]=slf;	
		Global_Cinematic_oth	 [1]=oth;
		Global_Cinematic_Txt_1=txt;
		Global_Cinematic_WaveName_1=wavename;
		Global_Cinematic_last=1;
	}		
	else if(Global_Cinematic_D[3]==0)//2 (3rd) is free - fill it!
	{
		Global_Cinematic_D		 [3]=Global_Cinematic_D[2]+duration;	
		Global_Cinematic_slf	 [2]=slf;	
		Global_Cinematic_oth	 [2]=oth;
		Global_Cinematic_Txt_2=txt;
		Global_Cinematic_WaveName_2=wavename;
		Global_Cinematic_last=2;
	}	
	else if(Global_Cinematic_D[4]==0)//
	{
		Global_Cinematic_D		 [4]=Global_Cinematic_D[3]+duration;	
		Global_Cinematic_slf	 [3]=slf;	
		Global_Cinematic_oth	 [3]=oth;
		Global_Cinematic_Txt_3=txt;
		Global_Cinematic_WaveName_3=wavename;
		Global_Cinematic_last=3;
	}		
	else if(Global_Cinematic_D[5]==0)
	{
		Global_Cinematic_D		 [5]=Global_Cinematic_D[4]+duration;	
		Global_Cinematic_slf	 [4]=slf;	
		Global_Cinematic_oth	 [4]=oth;
		Global_Cinematic_Txt_4=txt;
		Global_Cinematic_WaveName_4=wavename;
		Global_Cinematic_last=4;
	}		
	else if(Global_Cinematic_D[6]==0)
	{
		Global_Cinematic_D		 [6]=Global_Cinematic_D[5]+duration;	
		Global_Cinematic_slf	 [5]=slf;	
		Global_Cinematic_oth	 [5]=oth;
		Global_Cinematic_Txt_5=txt;
		Global_Cinematic_WaveName_5=wavename;
		Global_Cinematic_last=5;
	}		
	else if(Global_Cinematic_D[7]==0)
	{
		Global_Cinematic_D		 [7]=Global_Cinematic_D[6]+duration;	
		Global_Cinematic_slf	 [6]=slf;	
		Global_Cinematic_oth	 [6]=oth;
		Global_Cinematic_Txt_6=txt;
		Global_Cinematic_WaveName_6=wavename;
		Global_Cinematic_last=6;
	}		
	else if(Global_Cinematic_D[8]==0)
	{
		Global_Cinematic_D		 [8]=Global_Cinematic_D[7]+duration;	
		Global_Cinematic_slf	 [7]=slf;	
		Global_Cinematic_oth	 [7]=oth;
		Global_Cinematic_Txt_7=txt;
		Global_Cinematic_WaveName_7=wavename;
		Global_Cinematic_last=7;
	}		
	else if(Global_Cinematic_D[9]==0)
	{
		Global_Cinematic_D		 [9]=Global_Cinematic_D[8]+duration;	
		Global_Cinematic_slf	 [8]=slf;	
		Global_Cinematic_oth	 [8]=oth;
		Global_Cinematic_Txt_8=txt;
		Global_Cinematic_WaveName_8=wavename;
		Global_Cinematic_last=8;
	}		
	else if(Global_Cinematic_D[10]==0)
	{
		Global_Cinematic_D		 [10]=Global_Cinematic_D[9]+duration;	
		Global_Cinematic_slf	 [9]=slf;	
		Global_Cinematic_oth	 [9]=oth;
		Global_Cinematic_Txt_9=txt;
		Global_Cinematic_WaveName_9=wavename;
		Global_Cinematic_last=9;
	}		
	else if(Global_Cinematic_D[11]==0)
	{
		Global_Cinematic_D		 [11]=Global_Cinematic_D[10]+duration;	
		Global_Cinematic_slf	 [10]=slf;	
		Global_Cinematic_oth	 [10]=oth;
		Global_Cinematic_Txt_10=txt;
		Global_Cinematic_WaveName_10=wavename;
		Global_Cinematic_last=10;
	}		
	else if(Global_Cinematic_D[12]==0)
	{
		Global_Cinematic_D		 [12]=Global_Cinematic_D[11]+duration;	
		Global_Cinematic_slf	 [11]=slf;	
		Global_Cinematic_oth	 [11]=oth;
		Global_Cinematic_Txt_11=txt;
		Global_Cinematic_WaveName_11=wavename;
		Global_Cinematic_last=11;
	}		
	else if(Global_Cinematic_D[13]==0)
	{
		Global_Cinematic_D		 [13]=Global_Cinematic_D[12]+duration;	
		Global_Cinematic_slf	 [12]=slf;	
		Global_Cinematic_oth	 [12]=oth;
		Global_Cinematic_Txt_12=txt;
		Global_Cinematic_WaveName_12=wavename;
		Global_Cinematic_last=12;
	}		
	else if(Global_Cinematic_D[14]==0)
	{
		Global_Cinematic_D		 [14]=Global_Cinematic_D[13]+duration;	
		Global_Cinematic_slf	 [13]=slf;	
		Global_Cinematic_oth	 [13]=oth;
		Global_Cinematic_Txt_13=txt;
		Global_Cinematic_WaveName_13=wavename;
		Global_Cinematic_last=13;
	}		
	else if(Global_Cinematic_D[15]==0)
	{
		Global_Cinematic_D		 [15]=Global_Cinematic_D[16]+duration;	
		Global_Cinematic_slf	 [14]=slf;	
		Global_Cinematic_oth	 [14]=oth;
		Global_Cinematic_Txt_14		 =txt;
		Global_Cinematic_WaveName_14=wavename;
		Global_Cinematic_last=14;
	}		
	else if(Global_Cinematic_D[16]==0)
	{
		Global_Cinematic_D		 [16]=Global_Cinematic_D[15]+duration;	
		Global_Cinematic_slf	 [15]=slf;	
		Global_Cinematic_oth	 [15]=oth;
		Global_Cinematic_Txt_15		 =txt;
		Global_Cinematic_WaveName_15=wavename;
		Global_Cinematic_last=15;
	}		
	else if(Global_Cinematic_D[17]==0)
	{
		Global_Cinematic_D		 [17]=Global_Cinematic_D[16]+duration;	
		Global_Cinematic_slf	 [16]=slf;	
		Global_Cinematic_oth	 [16]=oth;
		Global_Cinematic_Txt_16		 =txt;
		Global_Cinematic_WaveName_16=wavename;
		Global_Cinematic_last=16;
	}		
	else if(Global_Cinematic_D[18]==0)
	{
		Global_Cinematic_D		 [18]=Global_Cinematic_D[17]+duration;	
		Global_Cinematic_slf	 [17]=slf;	
		Global_Cinematic_oth	 [17]=oth;
		Global_Cinematic_Txt_17		 =txt;
		Global_Cinematic_WaveName_17=wavename;
		Global_Cinematic_last=17;
	}		
	else if(Global_Cinematic_D[18]==0)
	{
		Global_Cinematic_D		 [19]=Global_Cinematic_D[18]+duration;	
		Global_Cinematic_slf	 [18]=slf;	
		Global_Cinematic_oth	 [18]=oth;
		Global_Cinematic_Txt_18		 =txt;
		Global_Cinematic_WaveName_18=wavename;
		Global_Cinematic_last=18;
	}	
	else if(Global_Cinematic_D[19]!=0)
	{
		Global_Cinematic_D		 [19]=Global_Cinematic_D[18]+duration;	
		Global_Cinematic_slf	 [19]=slf;	
		Global_Cinematic_oth	 [19]=oth;
		Global_Cinematic_Txt_19		 =txt;
		Global_Cinematic_WaveName_19=wavename;
		Global_Cinematic_last=19;
	};	
};

//CinematicEnd - It just clear all varibles, so they willn't dump RAM Memory
// Ork: HUEHUEHUE 
func void CinematicEnd()
{
	var c_npc npc; 
	Global_Cinematic_i=-256;//it will remove executing cinematic part of trigger script	
	Global_Cinematic_last=0;	

	npc = Hlp_GetNpc(Global_Cinematic_slf[0]); 
	Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	npc = Hlp_GetNpc(Global_Cinematic_oth[0]); 
	Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	Global_Cinematic_D		 [0]=0;	
	Global_Cinematic_slf	 [0]=0;	
	Global_Cinematic_oth	 [0]=0;
	Global_Cinematic_Txt_0="";
	Global_Cinematic_WaveName_0="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[1]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	npc = Hlp_GetNpc(Global_Cinematic_oth[1]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	Global_Cinematic_D		 [1]=0;	
	Global_Cinematic_slf	 [1]=0;
	Global_Cinematic_oth	 [1]=0;
	Global_Cinematic_Txt_1="";
	Global_Cinematic_WaveName_1="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[2]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	npc = Hlp_GetNpc(Global_Cinematic_oth[2]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	Global_Cinematic_D		 [2]=0;
	Global_Cinematic_slf	 [2]=0;
	Global_Cinematic_oth	 [2]=0;
	Global_Cinematic_Txt_2="";
	Global_Cinematic_WaveName_2="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[3]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	npc = Hlp_GetNpc(Global_Cinematic_oth[3]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	Global_Cinematic_D		 [3]=0;
	Global_Cinematic_slf	 [3]=0;
	Global_Cinematic_oth	 [3]=0;
	Global_Cinematic_Txt_3="";
	Global_Cinematic_WaveName_3="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[4]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	npc = Hlp_GetNpc(Global_Cinematic_oth[4]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	Global_Cinematic_D		 [4]=0;
	Global_Cinematic_slf	 [4]=0;
	Global_Cinematic_oth	 [4]=0;
	Global_Cinematic_Txt_4="";
	Global_Cinematic_WaveName_4="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[5]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	npc = Hlp_GetNpc(Global_Cinematic_oth[5]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	Global_Cinematic_D		 [5]=0;
	Global_Cinematic_slf	 [5]=0;
	Global_Cinematic_oth	 [5]=0;
	Global_Cinematic_Txt_5="";
	Global_Cinematic_WaveName_5="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[6]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	npc = Hlp_GetNpc(Global_Cinematic_oth[6]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	Global_Cinematic_D		 [6]=0;
	Global_Cinematic_slf	 [6]=0;
	Global_Cinematic_oth	 [6]=0;
	Global_Cinematic_Txt_6="";
	Global_Cinematic_WaveName_6="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[7]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	npc = Hlp_GetNpc(Global_Cinematic_oth[7]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	Global_Cinematic_D		 [7]=0;
	Global_Cinematic_slf	 [7]=0;
	Global_Cinematic_oth	 [7]=0;
	Global_Cinematic_Txt_7="";
	Global_Cinematic_WaveName_7="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[8]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	npc = Hlp_GetNpc(Global_Cinematic_oth[8]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);	
	Global_Cinematic_D		 [8]=0;
	Global_Cinematic_slf	 [8]=0;
	Global_Cinematic_oth	 [8]=0;
	Global_Cinematic_Txt_8="";
	Global_Cinematic_WaveName_8="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[9]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	npc = Hlp_GetNpc(Global_Cinematic_oth[9]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	Global_Cinematic_D		 [9]=0;  
	Global_Cinematic_slf	 [9]=0;
	Global_Cinematic_oth	 [9]=0;

	
	Global_Cinematic_Txt_9="";
	Global_Cinematic_WaveName_9="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[10]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	npc = Hlp_GetNpc(Global_Cinematic_oth[10]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	Global_Cinematic_D		 [10]=0;
	Global_Cinematic_slf	 [10]=0;
	Global_Cinematic_oth	 [10]=0;
	Global_Cinematic_Txt_10		 ="";
	Global_Cinematic_WaveName_10="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[11]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	npc = Hlp_GetNpc(Global_Cinematic_oth[11]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	Global_Cinematic_D		 [11]=0;
	Global_Cinematic_slf	 [11]=0;
	Global_Cinematic_oth	 [11]=0;
	Global_Cinematic_Txt_11		 ="";
	Global_Cinematic_WaveName_11="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[12]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	npc = Hlp_GetNpc(Global_Cinematic_oth[12]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	Global_Cinematic_D		 [12]=0;
	Global_Cinematic_slf	 [12]=0;
	Global_Cinematic_oth	 [12]=0;
	Global_Cinematic_Txt_12		 ="";
	Global_Cinematic_WaveName_12="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[13]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	npc = Hlp_GetNpc(Global_Cinematic_oth[13]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	Global_Cinematic_D		 [13]=0;
	Global_Cinematic_slf	 [13]=0;
	Global_Cinematic_oth	 [13]=0;
	Global_Cinematic_Txt_13		 ="";
	Global_Cinematic_WaveName_13="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[14]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	npc = Hlp_GetNpc(Global_Cinematic_oth[14]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	Global_Cinematic_D		 [14]=0;
	Global_Cinematic_slf	 [14]=0;
	Global_Cinematic_oth	 [14]=0;
	Global_Cinematic_Txt_14		 ="";
	Global_Cinematic_WaveName_14="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[15]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	npc = Hlp_GetNpc(Global_Cinematic_oth[15]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	Global_Cinematic_D		 [15]=0;
	Global_Cinematic_slf	 [15]=0;
	Global_Cinematic_oth	 [15]=0;
	Global_Cinematic_Txt_15		 ="";
	Global_Cinematic_WaveName_15="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[16]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	npc = Hlp_GetNpc(Global_Cinematic_oth[16]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	Global_Cinematic_D		 [16]=0;
	Global_Cinematic_slf	 [16]=0;
	Global_Cinematic_oth	 [16]=0;
	Global_Cinematic_Txt_16		 ="";
	Global_Cinematic_WaveName_16="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[17]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	npc = Hlp_GetNpc(Global_Cinematic_oth[17]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	Global_Cinematic_D		 [17]=0;
	Global_Cinematic_slf	 [17]=0;
	Global_Cinematic_oth	 [17]=0;
	Global_Cinematic_Txt_17		 ="";
	Global_Cinematic_WaveName_17="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[18]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	npc = Hlp_GetNpc(Global_Cinematic_oth[18]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	Global_Cinematic_D		 [18]=0;
	Global_Cinematic_slf	 [18]=0;
	Global_Cinematic_oth	 [18]=0;
	Global_Cinematic_Txt_18		 ="";
	Global_Cinematic_WaveName_18="";

	npc = Hlp_GetNpc(Global_Cinematic_slf[19]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	npc = Hlp_GetNpc(Global_Cinematic_oth[19]); Npc_SetAivar(npc,AIV_INVINCIBLE,FALSE);
	Global_Cinematic_D		 [19]=0;
	Global_Cinematic_slf	 [19]=0;
	Global_Cinematic_oth	 [19]=0;
	Global_Cinematic_Txt_19		 ="";
	Global_Cinematic_WaveName_19="";
	
	// Disable CinemaScopes & Remove invicible from hero:
	// 8:42 PM 10/15/2012 orc
	I_DisableCinemaScope();
	
	Npc_SetAivar(hero,AIV_INVINCIBLE,  false);
};
// So here is the function for play of some single voice of the cinematic
// with specified as parrameter number (0- first voice of cinematic, 1 - second..etc.)
// it use global stored voices which are modified by CinematicDialog functions.
func void CinematicPlay(var int cinematic_i)
{
	var c_npc slf; var c_npc oth; var string msg; var string snd; var int dur;
	if(cinematic_i==0)//0 (1st) to play - do it
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[0]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[0]);
		dur = Global_Cinematic_D[1]-Global_Cinematic_D[0];
		msg = Global_Cinematic_Txt_0;
		snd = Global_Cinematic_WaveName_0;
	}
	else if(cinematic_i==1)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[1]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[1]);
		dur = Global_Cinematic_D[2]-Global_Cinematic_D[1];
		msg = Global_Cinematic_Txt_1;
		snd = Global_Cinematic_WaveName_1;
	}
	else if(cinematic_i==2)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[2]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[2]);
		dur = Global_Cinematic_D[3]-Global_Cinematic_D[2];
		msg = Global_Cinematic_Txt_2;
		snd = Global_Cinematic_WaveName_2;
	}
	else if(cinematic_i==3)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[3]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[3]);
		dur = Global_Cinematic_D[4]-Global_Cinematic_D[3];
		msg = Global_Cinematic_Txt_3;
		snd = Global_Cinematic_WaveName_3;
	}
	else if(cinematic_i==4)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[4]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[4]);
		dur = Global_Cinematic_D[5]-Global_Cinematic_D[4];
		msg = Global_Cinematic_Txt_4;
		snd = Global_Cinematic_WaveName_4;
	}
	else if(cinematic_i==5)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[5]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[5]);
		dur = Global_Cinematic_D[6]-Global_Cinematic_D[5];
		msg = Global_Cinematic_Txt_5;
		snd = Global_Cinematic_WaveName_5;
	}
	else if(cinematic_i==6)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[6]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[6]);
		dur = Global_Cinematic_D[7]-Global_Cinematic_D[6];
		msg = Global_Cinematic_Txt_6;
		snd = Global_Cinematic_WaveName_6;
	}
	else if(cinematic_i==7)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[7]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[7]);
		dur = Global_Cinematic_D[8]-Global_Cinematic_D[7];
		msg = Global_Cinematic_Txt_7;
		snd = Global_Cinematic_WaveName_7;
	}
	else if(cinematic_i==8)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[8]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[8]);
		dur = Global_Cinematic_D[9]-Global_Cinematic_D[8];
		msg = Global_Cinematic_Txt_8;
		snd = Global_Cinematic_WaveName_8;
	}
	else if(cinematic_i==9)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[9]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[9]);
		dur = Global_Cinematic_D[10]-Global_Cinematic_D[9];
		msg = Global_Cinematic_Txt_9;
		snd = Global_Cinematic_WaveName_9;
	}
	else if(cinematic_i==10)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[10]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[10]);
		dur = Global_Cinematic_D[11]-Global_Cinematic_D[10];
		msg = Global_Cinematic_Txt_10;
		snd = Global_Cinematic_WaveName_10;
	}
	else if(cinematic_i==11)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[11]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[11]);
		dur = Global_Cinematic_D[12]-Global_Cinematic_D[11];
		msg = Global_Cinematic_Txt_11;
		snd = Global_Cinematic_WaveName_11;
	}
	else if(cinematic_i==12)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[12]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[12]);
		dur = Global_Cinematic_D[13]-Global_Cinematic_D[12];
		msg = Global_Cinematic_Txt_12;
		snd = Global_Cinematic_WaveName_12;
	}
	else if(cinematic_i==13)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[13]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[13]);
		dur = Global_Cinematic_D[14]-Global_Cinematic_D[13];
		msg = Global_Cinematic_Txt_13;
		snd = Global_Cinematic_WaveName_13;
	}
	else if(cinematic_i==14)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[14]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[14]);
		dur = Global_Cinematic_D[15]-Global_Cinematic_D[14];
		msg = Global_Cinematic_Txt_14;
		snd = Global_Cinematic_WaveName_14;
	}
	else if(cinematic_i==15)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[15]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[15]);
		dur = Global_Cinematic_D[16]-Global_Cinematic_D[15];
		msg = Global_Cinematic_Txt_15;
		snd = Global_Cinematic_WaveName_15;
	}
	else if(cinematic_i==16)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[16]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[16]);
		dur = Global_Cinematic_D[17]-Global_Cinematic_D[16];
		msg = Global_Cinematic_Txt_16;
		snd = Global_Cinematic_WaveName_16;
	}
	else if(cinematic_i==17)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[17]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[17]);
		dur = Global_Cinematic_D[18]-Global_Cinematic_D[17];
		msg = Global_Cinematic_Txt_17;
		snd = Global_Cinematic_WaveName_17;
	}
	else if(cinematic_i==18)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[18]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[18]);
		dur = Global_Cinematic_D[19]-Global_Cinematic_D[18];
		msg = Global_Cinematic_Txt_18;
		snd = Global_Cinematic_WaveName_18;
	}
	else if(cinematic_i==19)
	{
		slf = Hlp_GetNpc(Global_Cinematic_slf[19]);
		oth = Hlp_GetNpc(Global_Cinematic_oth[19]);
		dur = 5;//(Global_Cinematic_D[18]-Global_Cinematic_D[19])*(-1);
		msg = Global_Cinematic_Txt_19;
		snd = Global_Cinematic_WaveName_19;
	};

	//Show DialogFrame
	if(Npc_IsPlayer(slf))
	{
		PrintScreen(msg, -1, 95, _STR_FONT_ONSCREEN, dur);	

	}
	else if(Hlp_IsValidNpc(slf))
	{
		PrintScreen(msg, -1, 91, _STR_FONT_ONSCREEN, dur);		
	};
	//Play ani - if it possible
	if((Npc_GetBodyState(slf)==98304)||(Npc_GetAivar(slf,AIV_INVINCIBLE)==TRUE))&&(Global_Cinematic_FORCEANIS==FALSE)//self STAND FREE  - he can turn to listener
	{

		B_FullStop		(slf);	
		B_SmartTurnToNpc(slf,oth);	
		//Ani
		var int arnd; var string i_ani; arnd=Hlp_Random(16);	
		//rnd ani
		if(arnd==1){i_ani="01";}
		else if(arnd==2){i_ani="02";}
		else if(arnd==3){i_ani="03";}
		else if(arnd==4){i_ani="04";}
		else if(arnd==5){i_ani="05";}
		else if(arnd==6){i_ani="06";}
		else if(arnd==7){i_ani="07";}
		else if(arnd==8){i_ani="08";}
		else if(arnd==9){i_ani="09";}
		else if(arnd==10){i_ani="10";}
		else if(arnd==11){i_ani="11";}
		else if(arnd==12){i_ani="12";}
		else if(arnd==13){i_ani="13";}
		else if(arnd==14){i_ani="14";}
		else {i_ani="15";};
		AI_PlayAni(slf,concatstrings("T_DIALOGGESTURE_",i_ani/*,inttostring(rnd2))*/));
	};
	if((Npc_GetBodyState(oth)==98304)||(Npc_GetAivar(slf,AIV_INVINCIBLE)==TRUE))&&(Global_Cinematic_FORCEANIS==FALSE)//other STAND FREE  - he can turn to speaker
	{
		B_FullStop(oth);		
		B_SmartTurnToNpc(oth,slf);	
	};

	//Play Wave Sound
	//TODO: Enable, when it be needed
	introducechapter ("","","",snd, 0);	
};

// **************************************
// ID = 0
// Informator Meeting/ GRD's attack
// ***
// Rick in party with Pirates, spots
// Tony fightning with guards.
// **************************************

/* ==============================================
	CINEMATIC ACTIONS
	-Animations: Tested
==============================================*/
func void CinematicActions_0()
{
	if(Global_Cinematic_id==0)//Tony Help
	{
		var c_npc a; a = hlp_GetNpc(PIR_2600_Angus);
		Party_RemoveNpc(a); a = hlp_GetNpc(PIR_2602_Rodney);
		Party_RemoveNpc(a); a = hlp_GetNpc(PIR_2601_Hank);
		Party_RemoveNpc(a);	
		a = hlp_GetNpc(RBL_2604_Tony);
		Npc_SetTrueGuild(a,GIL_RBL);
		a.guild = GIL_RBL;
		Npc_SetAttitude				(a,ATT_FRIENDLY);
		Npc_SetTempAttitude			(a,ATT_FRIENDLY);	

		Global_Cinematic_FORCEANIS=TRUE;	
		Npc_ClearAiQueue(hank);		
		AI_GotoWP(hank,"OW_PATH_166");
	};
	if(Global_Cinematic_id==1)//OC - Kevin Dead
	{
		Global_Cinematic_FORCEANIS=TRUE;	
		Wld_SendTrigger("KEVIN_CAM");
		//	Wld_SendTrigger("EVT_OC_INNERMAINGATE");
		Wld_SendTrigger("EVT_OC_MAINGATE01_01");
		Wld_InsertNpc(GRD_274_Reondar,"OCC_GATE_VWHEEL");
		
	};	

	if(Global_Cinematic_id==Cinematic_MD_RodericVsTruan)//MD Roderic vs. Truan
	{
		Wld_SendTrigger("TRUAN_CAM");
		var c_npc tru; tru = Hlp_GetNpc(truan);	
		BOSSFIGHT_CURRENT = BOSSFIGHT_FGT1;
	};	
};

func void CinematicActions_1()
{
	if(Global_Cinematic_id==0)//Tony help
	{
		Npc_ClearAiQueue(angus);		
		Npc_ClearAiQueue(hank);		
		Npc_ClearAiQueue(rodney);		
		Npc_ClearAiQueue(hero);		
		AI_ReadyMeleeWeapon(angus);		
		AI_ReadyRangedWeapon(hank);		
		AI_ReadyMeleeWeapon(rodney);		
		AI_ReadyMeleeWeapon(hero);	
		Npc_ExchangeRoutine	(angus,"WaitTony");
		Npc_ExchangeRoutine(hank,"WaitTony");
		Npc_ExchangeRoutine(rodney,"WaitTony");
		var c_npc a; a = hlp_GetNpc(RBL_2604_Tony);
		B_FullStop(a);		
		AI_ReadyMeleeWeapon(a);			
	};

	if(Global_Cinematic_id==Cinematic_MD_RodericVsTruan)//MD Roderic vs. Truan
	{
		Wld_SendUnTrigger("TRUAN_CAM");
		Wld_SendTrigger("RODERIC_CAM");
	};	
};
func void CinematicActions_2()
{
	var c_npc a;
	if(Global_Cinematic_id==0)//Tony help
	{
		Npc_ClearAiQueue(angus);		
		Npc_ClearAiQueue(hank);		
		Npc_ClearAiQueue(rodney);		
		B_FullStop(hero);	
		AI_GotoWP(hero,"OW_PATH_167");	
		AI_GotoWP(hero,"OW_PATH_166");	
		AI_GotoWP(rodney,"OW_PATH_166");
		AI_GotoWP(hank,"OW_PATH_166");
		AI_GotoWP(angus,"OW_PATH_166");						
		a = hlp_GetNpc(GRD_2599_Guard);
		Npc_SetTarget(hank,a); 
		AI_StartState(hank,ZS_ATTACK,1,"");			
		a.protection[PROT_BLUNT] = -99;
		a.protection[PROT_EDGE] = -99; 	
		Npc_SetAivar(a,AIV_PLUNDERED,  3);//donot plunder	 		
		Npc_SetTarget(rodney,a); 
		AI_StartState(rodney,ZS_ATTACK,1,"");	
		a = hlp_GetNpc(GRD_4063_Guard);
		Npc_SetTarget(angus,a); 
		AI_StartState(angus,ZS_ATTACK,1,"");				
		a.protection[PROT_BLUNT] = -69;  	
		a.protection[PROT_EDGE] = -69; 
		Npc_SetAivar(a,AIV_PLUNDERED,  3);	 				
		Global_Cinematic_FORCEANIS=FALSE;
		I_DisableCinemaScope();	//end of dialog, time to disable kinostripes
		
	};

	if(Global_Cinematic_id==Cinematic_MD_RodericVsTruan)//MD Roderic vs. Truan
	{
		Wld_SendUnTrigger("RODERIC_CAM");
		Wld_SendTrigger("TRUAN_CAM");
		
	};		
};
func void CinematicActions_3()
{
	if(Global_Cinematic_id==0)//Kevin dead
	{
		Wld_SendUnTrigger("KEVIN_CAM");

	}	
	if(Global_Cinematic_id==2)//Informator Meeting/ GRD's attack
	{
		//OW_PATH_1_16_9
		
		Global_Cinematic_FORCEANIS=FALSE;	
		var c_npc infor;
		infor = Hlp_GetNpc(RBL_4064_Info);
		Npc_SetAivar(infor,AIV_INVINCIBLE,TRUE);
	};

	if(Global_Cinematic_id==Cinematic_MD_RodericVsTruan)//MD Roderic vs. Truan
	{
		Wld_SendUnTrigger("TRUAN_CAM");
		Wld_SendTrigger("RODERIC_CAM");
	};		
};
func void CinematicActions_4()
{
	var c_npc a; 
	
	if(Global_Cinematic_id==0)//Test Cinematic
	{	

	}
	if(Global_Cinematic_id==2)//Informator Meeting/ GRD's attack
	{
		//todo: check if id 2730 grd are used ever in else state
		Wld_InsertNpc (GRD_2730_Gardist,"OW_PATH_1_16_5_1");
		Wld_InsertNpc (GRD_2731_Gardist,"OW_PATH_1_16_5_1");
		Wld_InsertNpc (GRD_2732_Gardist,"OW_PATH_1_16_5_1");
		Wld_InsertNpc (GRD_2733_Gardist,"OW_PATH_1_16_5_1");
		//OW_PATH_1_16_9
		//P//RINT("----------------GRDS----------------");
		
		
		Global_Cinematic_FORCEANIS=FALSE;	
	};
	if(Global_Cinematic_id==3)//MD Roderic vs. Truan
	{
		var c_npc rod; rod = Hlp_GetNpc(rodericmd);
		var c_npc tru; tru = Hlp_GetNpc(truan);		
		Wld_SendUnTrigger("RODERIC_CAM");

		B_Exchangeroutine(rod,"FIGHT");
		B_Exchangeroutine(tru,"FIGHT"); 	
		
		MD_FinalBattle		=	TRUE;
		MD_FinalBattle_Wave	=	1;
		tru.guild = GIL_SKELETON;
		Npc_SetTrueGuild(tru,GIL_SKELETON);
		Wld_InsertNpc(MD_WaveSpawn_R,"MD_PATH_SPAWNA_01");
		Wld_InsertNpc(MD_WaveSpawn_L,"MD_PATH_SPAWNB_01");
	};		
};
func void CinematicActions_5()
{
	if(Global_Cinematic_id==0)
	{
		
	}
	else if(Global_Cinematic_id==2)
	{
		Global_Cinematic_FORCEANIS=TRUE;	
	};

	
};
func void CinematicActions_6()
{
	if(Global_Cinematic_id==0)//Test Cinematic
	{
		
	}
	else if(Global_Cinematic_id==2)//Informator Meeting/ GRD's attack
	{
		//PRI/NT("6----------------TURN----------------");
		var c_npc grd; grd = Hlp_GetNpc(GRD_2730_Gardist);
		B_SmartTurnToNpc(hero,grd);
		//B_SmartTurnToNpc(self,grd);
		Global_Cinematic_FORCEANIS=TRUE;	
		Wld_InsertNpc (Nameless_SecondMeet,"OW_PATH_1_16_10");	
		
	};
	
};
func void CinematicActions_7()
{
	if(Global_Cinematic_id==2)//
	{
		//P/RINT("7----------------INSERT----------------");
		var c_npc npc;
		npc = Hlp_GetNpc(Nameless_SecondMeet);
		var c_npc grd; grd = Hlp_GetNpc(GRD_2731_Gardist);
		Npc_ClearAIQueue(npc);			
		AI_SetWalkmode(npc,NPC_RUN);

		AI_GotoWP(npc,"OW_PATH_1_16_9");	
		Npc_SetTarget(npc,grd); 
		AI_ReadySpell		(npc,	SPL_THUNDERBALL,	SPL_SENDCAST_THUNDERBALL);	
		AI_GotoWP(npc,"OW_PATH_1_16_8");				

		npc = Hlp_GetNpc(RBL_4064_Info);
		B_Exchangeroutine(npc,"fight");		
		grd = Hlp_GetNpc(GRD_2732_Gardist);
		Npc_SetTarget(grd,npc); 
		grd = Hlp_GetNpc(GRD_2731_Gardist);
		Wld_PlayEffect("spellFX_Thunder_TARGET", grd, grd, 1,0 , DAM_MAGIC, FALSE); //Projetil = TRUE (trifft alle)
		Npc_ChangeAttribute(grd,ATR_HITPOINTS,-9999);
		AI_DrawWeapon(hero);
		AI_DrawWeapon(npc);
	};
	
};

/* -------------------------------------------
	CINEMATIC TRIGGER
	Ork: Strasznie do bani jest to napisane
	du¿o lepiej gdyby wywo³ywaæ funkcje dla
	konkretnych ID cinematiców, ale zbyt wiele
	roboty by coœ z tym robic.
==============================================*/
func void CinematicEvent()//SEND ON TRIGGER (TRIGGER7)
{
	if(Global_Cinematic_i==Global_Cinematic_D[0])
	{
		CinematicPlay(0);
		CinematicActions_0();
		if(Global_Cinematic_last==0){CinematicEnd();};
	}	
	else if(Global_Cinematic_i==Global_Cinematic_D[1])
	{
		CinematicPlay(1);
		CinematicActions_1();
		if(Global_Cinematic_last==1){CinematicEnd();};
	}		
	else if(Global_Cinematic_i==Global_Cinematic_D[2])
	{
		CinematicPlay(2);
		CinematicActions_2();
		if(Global_Cinematic_last==2){CinematicEnd();};
	}		
	else if(Global_Cinematic_i==Global_Cinematic_D[3])
	{

		CinematicPlay(3);
		CinematicActions_3();		
		if(Global_Cinematic_last==3){CinematicEnd();};
	}		
	else if(Global_Cinematic_i==Global_Cinematic_D[4])
	{
		CinematicPlay(4);		
		CinematicActions_4();
		if(Global_Cinematic_last==4){CinematicEnd();};
	}		
	else if(Global_Cinematic_i==Global_Cinematic_D[5])
	{
		CinematicPlay(5);
		CinematicActions_5();
		if(Global_Cinematic_last==5){CinematicEnd();};
	}		
	else if(Global_Cinematic_i==Global_Cinematic_D[6])
	{
		CinematicPlay(6);
		CinematicActions_6();
		if(Global_Cinematic_last==6){CinematicEnd();};
	}		
	else if(Global_Cinematic_i==Global_Cinematic_D[7])
	{
		CinematicPlay(7);
		CinematicActions_7();
		if(Global_Cinematic_last==7){CinematicEnd();};
	}		
	else if(Global_Cinematic_i==Global_Cinematic_D[8])
	{
		CinematicPlay(8);
		if(Global_Cinematic_last==8){CinematicEnd();};
	}	
	else if(Global_Cinematic_i==Global_Cinematic_D[9])
	{
		CinematicPlay(9);
		if(Global_Cinematic_last==9){CinematicEnd();};
	}		
	else if(Global_Cinematic_i==Global_Cinematic_D[10])
	{
		CinematicPlay(10);
		if(Global_Cinematic_last==10){CinematicEnd();};
	}			
	else if(Global_Cinematic_i==Global_Cinematic_D[11])
	{
		CinematicPlay(11);
		if(Global_Cinematic_last==11){CinematicEnd();};
	}				
	else if(Global_Cinematic_i==Global_Cinematic_D[12])
	{
		CinematicPlay(12);
		if(Global_Cinematic_last==12){CinematicEnd();};
	}				
	else if(Global_Cinematic_i==Global_Cinematic_D[13])
	{
		CinematicPlay(13);
		if(Global_Cinematic_last==13){CinematicEnd();};
	}				
	else if(Global_Cinematic_i==Global_Cinematic_D[14])
	{
		CinematicPlay(14);
		if(Global_Cinematic_last==14){CinematicEnd();};
	}				
	else if(Global_Cinematic_i==Global_Cinematic_D[15])
	{
		CinematicPlay(15);
		if(Global_Cinematic_last==15){CinematicEnd();};
	}				
	else if(Global_Cinematic_i==Global_Cinematic_D[16])
	{
		CinematicPlay(16);
		if(Global_Cinematic_last==16){CinematicEnd();};
	}				
	else if(Global_Cinematic_i==Global_Cinematic_D[17])
	{
		CinematicPlay(17);
		if(Global_Cinematic_last==17){CinematicEnd();};
	}				
	else if(Global_Cinematic_i==Global_Cinematic_D[18])
	{
		CinematicPlay(18);
		if(Global_Cinematic_last==18){CinematicEnd();};
	}				
	else if(Global_Cinematic_i==Global_Cinematic_D[19])
	{
		CinematicPlay(19);
		if(Global_Cinematic_last==19){CinematicEnd();};
	};
	Global_Cinematic_i=Global_Cinematic_i+1;			
	
};
