const int MsgManager_State_None 	= 0;//nothing visible
const int MsgManager_State_FadeIN 	= 1;//new msg fading in
const int MsgManager_State_Show 	= 2;//displaying msg, waiting for end of duration
const int MsgManager_State_FadeOut 	= 3;//msg fading out

const int MAX_MessagesTime = 10*8;//max. time that message queue can be showed (15 seconds)
const int Msg_FadeInFrames = 5;
const int Msg_FadeOutFrames = Msg_FadeInFrames;
const int Msg_FinishBGAlpha = 150;

const int Msg_PosY = 35 * 82;//82 -one percent 2870
const int Msg_PosX = 5 * 82;
const int MsgBox_SizeY = 55;//in px
const int MsgBox_SizeX = 250;

class UIMsg 
{
    var string text; 
    var string font; 
    var string soundOnStart;//wavename 
    var int msgView; //zCView*
    var int Line1View; //zCViewText*
    var int Line2View; //zCViewText*
    var int durTicks; //tick = 0.125 (decrased by PoisonTrigger)
    var int color; //zCColor
    var int next;        //UIMsg* 
};

//LIFO list
class UIMsgManager 
{
    var int first;        //UIMsg* 
    var int last;        //UIMsg* 
    var int count;              //Count of messages on list 
    var int state;              //enum
    var int timeTillEnd;        //All durTicks sum
};

func int GetScreenSizeX(){return MEM_ReadInt(MEM_ReadInt(screen_offset)+88);};
func int GetScreenSizeY(){return MEM_ReadInt(MEM_ReadInt(screen_offset)+92);};
func int CalcPixelPosX(var int x)
{
	var int pos; pos = fracf(8196,GetScreenSizeX());
	//printdebug_s_i("># px =",truncf(pos));
	pos = mulf(pos,mkf(x));
	//printdebug_s_i("># vsizex =",truncf(pos));
	return truncf(pos);	
};
func int CalcPixelPosY(var int y)
{
	var int pos; pos = fracf(8196,GetScreenSizeY()); pos = mulf(pos,mkf(y));
	return truncf(pos);	
};  

//global msg Manager needs reinit every game init
instance MsgManager(UIMsgManager);
instance Msg_1st(UIMsg);
instance Msg_2nd(UIMsg);
func void MsgManager_ReInit()
{
	var int Mptr;
	Mptr = MEM_Alloc(20);//16-size os MsgManager
	MEM_AssignContentInst (MsgManager,Mptr);
	MsgManager.first		= 0;     
	MsgManager.last			= 0;       
	MsgManager.count		= 0;      
	MsgManager.state		= 0;    
	MsgManager.timeTillEnd 	= 0;  
	 
};
func void MsgManager_Push(var int MsgPtr)//struct* UIMsg
{
	var UIMsg LastMsg; var UIMsg Msg;
	MEM_AssignContentInst (Msg,MsgPtr);	
	
	//time the list will be showed is more than 10s?
	if(MsgManager.timeTillEnd+Msg.durTicks>=MAX_MessagesTime)
	{ return; };//(Ignore next messages)
	
	//if much msg are pushed try to decrease time of present messages:
	if(MsgMenager.count>2)
	{
		Msg_1st.durTicks-=MsgMenager.count*8;	
		Msg_2nd.durTicks-=MsgMenager.count*4;	
	};
	
	if(MsgManager.last)
	{
		MEM_AssignContentInst (LastMsg,MsgManager.last);	
		MsgManager.last = MsgPtr;	
		LastMsg.next = MsgPtr;
		
		//there was only one msg? update Msg_2nd!
		if(MEM_InstToPtr(LastMsg)==MsgManager.first)
		{
			MEM_AssignContentInst (Msg_2nd,MsgPtr);	
		};
	}
	else//list was empty
	{
		MsgManager.first = MsgPtr;	
		MsgManager.last = MsgPtr;	
		MEM_AssignContentInst (Msg_1st,MsgPtr);	
	};
	MsgManager.count+=1;
	MsgManager.timeTillEnd=+Msg.durTicks;
	
};
func void MsgManager_Pop()
{
	var int fMsg;	var UIMsg hlp;
	MEM_AssignContentInst (hlp,MsgManager.first);	
	
	if(MsgManager.first)//list wasn't empty
	{
		//save ptr to following MSG;
		fMsg = hlp.next;
		//free memory
		hlp.msgView = 0;
		hlp.Line1View = 0;
		hlp.Line2View = 0;
		MEM_Free(MEM_InstToPtr(hlp));
		//make next first			
		MEM_AssignContentInst (hlp,fMsg);	
		MsgManager.first = MEM_InstToPtr(hlp);
		if(MsgManager.first==0)
		{
			MsgManager.last = 0;	
			MEM_AssignContentInstNull (Msg_1st);	
     		MsgManager.state = MsgManager_State_None; //Added lately
		}
		else
		{
			MEM_AssignContentInst (Msg_1st,MsgManager.first);	
			MEM_AssignContentInst (Msg_2nd,hlp.next);		
     		MsgManager.state = MsgManager_State_FadeIN; //Added lately
		};

		MsgManager.count-=1;
	};
	
};
func void UIMsg_FormatAndPrintText(var UIMsg Msg)
{
	// [TODO]Ork: To powinno być zalezne od rozdzielczości, troche testów w roznych
	// rozdzialkach i uda sie ustalic jakąs funkcje liniową dla odp. il znaków w linii. 
	const int maxCharsInline = 32; //zmienione przez Adanosa 2012-04-30
	const int xStartOfWindow = 5;
	var int yStartOf1Line; yStartOf1Line = 1584 - CalcPixelPosY(8)/2;
	var int yStartOf2Line; yStartOf2Line = 3800 - CalcPixelPosY(8)/2;
	var int yStartOfOneLine; yStartOfOneLine = 2800 - CalcPixelPosY(8)/2;//4096 = 100%
	
	var int secondLine; var int splitPos;
	var string Line1;var string Line2;
	var int label;
	secondLine = false;
	Line1 = ""; Line2 = "";
	
	//[NEW] Ork: Nowy ficzer, teraz mozna jeszcze sformatować tekst pieknym "\n"
	var string test;
	test = ConcatStrings(Msg.text,"");
	var int newLineCharPos; newLineCharPos = STR_Search(Msg.text,"\n");
	
	printdebug_ss("Amu: text: ",Msg.text);
	printdebug_s_i("Amu: newlinePos: ",newLineCharPos);
	if(newLineCharPos!=-1)
	{
		secondLine = true;
		splitPos = newLineCharPos;
		Line1 = STR_SubStr (Msg.text,0,splitPos);
		Line2 = STR_SubStr (Msg.text,splitPos+2,Str_Len(Msg.text));	// z pominieciem "\n"	
		printdebug_ss("Amu: Line1: ",Line1);
		printdebug_ss("Amu: Line2: ",Line2);
	}	
	else if(Str_Len(Msg.text)>=maxCharsInline)
	{
	//split string	
	secondLine = true;
	//find first space at left
	splitPos = maxCharsInline;	
	//loop
	MEM_InitLabels (); 
	label = MEM_StackPos.position; 
	if(Hlp_StrCmp(STR_SubStr(Msg.text,splitPos,1)," "))
	{	
	}
	else if(splitPos>0)
	{
		splitPos-=1;
		MEM_StackPos.position = label; 
	};
	//end loop
	if(splitPos==0)//if no space fouded, divide at last char
	{
		splitPos=maxCharsInline;
	};	   
	Line1 = STR_SubStr (Msg.text,0,splitPos);
	Line2 = STR_SubStr (Msg.text,splitPos+1,Str_Len(Msg.text));
	};
	
	//One Line:
	if(!secondLine)
	{
		CALL_zStringPtrParam(Msg.text);//zcview
		if(MEM_InstToPtr(Msg)==MsgManager.first)//first msg
		{
		CALL_IntParam(yStartOfOneLine);//zcview
    	}
    	else//second
    	{
		CALL_IntParam(yStartOfOneLine);//zcview
    	};
    	CALL_IntParam(Msg_PosX+xStartOfWindow);//x pixel
    	CALL__thiscall (Msg.msgView,zCView_CreateText_offset);
    	Msg.Line1View = CALL_RetValAsInt();
	}
	else//Zamiast create text, add line?
	{
		//Line 1
		CALL_zStringPtrParam(Line1);//zcview
		if(MEM_InstToPtr(Msg)==MsgManager.first)//first msg
		{
		CALL_IntParam(yStartOf1Line);//zcview
    	}
    	else//second
    	{
		CALL_IntParam(yStartOf1Line);//zcview
    	};
    	CALL_IntParam(Msg_PosX+xStartOfWindow);//x pixel
    	CALL__thiscall (Msg.msgView,zCView_CreateText_offset);
     	Msg.Line1View = CALL_RetValAsInt();
   	
    	//Line 2
    	CALL_zStringPtrParam(Line2);//zcview
		if(MEM_InstToPtr(Msg)==MsgManager.first)//first msg
		{
		CALL_IntParam(yStartOf2Line);//zcview
    	}
    	else//second
    	{
		CALL_IntParam(yStartOf2Line);//zcview
    	};
    	CALL_IntParam(Msg_PosX+xStartOfWindow);//x pixel
    	CALL__thiscall (Msg.msgView,zCView_CreateText_offset);
    	Msg.Line2View = CALL_RetValAsInt();
	};	
};

func void Msg_FadeIN(var UIMsg Msg)
{
	var int posYFrameStep;var int y;
	var int frame; var int alphaNow;
	var int alphaStep;
	//calculate fade in frame
	alphaNow = MEM_ReadInt(Msg.msgView+36);
	alphaStep = (Msg_FinishBGAlpha-(Msg_FinishBGAlpha%Msg_FadeInFrames))/Msg_FadeInFrames;
    y = MEM_ReadInt(Msg.msgView+68);
    posYFrameStep = (MEM_ReadInt(Msg.msgView+76)-(MEM_ReadInt(Msg.msgView+76)%Msg_FadeInFrames))/Msg_FadeInFrames;

    frame = (Msg_PosY-y-((Msg_PosY-y)%posYFrameStep))/posYFrameStep;
	frame = Msg_FadeInFrames-frame;
	if(frame>Msg_FadeInFrames){return;};
	
    if(frame==Msg_FadeInFrames)//last frame
    {
		CALL_IntParam(Msg_PosY);//zcview
   		CALL_IntParam(Msg_PosX);//zcview
   		CALL__thiscall (Msg.msgView,zCView_SetPos_offset); 
   		
        CALL_IntParam(Msg_FinishBGAlpha);
        CALL__thiscall (Msg.msgView,zCView_SetTransparency_offset);   	
        
        MsgManager.state = MsgManager_State_Show;	
        
        MEM_WriteInt(Msg.Line1View+44,Msg.color);   
        if(Msg.Line2View)
        {
       	 MEM_WriteInt(Msg.Line2View+44,Msg.color);   
        };
    }
    else
    {
		CALL_IntParam(y+posYFrameStep);//zcview
   		CALL_IntParam(Msg_PosX);//zcview
   		CALL__thiscall (Msg.msgView,zCView_SetPos_offset); 
   		MEM_WriteInt(Msg.msgView+72,y+posYFrameStep);
   		
        CALL_IntParam(alphaNow+alphaStep);
        CALL__thiscall (Msg.msgView,zCView_SetTransparency_offset);     	
        
        var int txtAlpha; var int hlp;
        txtAlpha = fracf(frame,Msg_FadeInFrames);
        hlp = mulf(txtAlpha,mkf(zColor_a(Msg.color)));//*alpha
        txtAlpha = truncf(hlp);

        MEM_WriteInt(Msg.Line1View+44,RGBAToZColor(zColor_r(Msg.color),zColor_g(Msg.color),zColor_b(Msg.color),txtAlpha));  
        //printdebug_s_i("># txtAlpha:",txtAlpha); 
        if(Msg.Line2View)
        {
       	 MEM_WriteInt(Msg.Line2View+44,RGBAToZColor(zColor_r(Msg.color),zColor_g(Msg.color),zColor_b(Msg.color),txtAlpha));   
        };  
	};
};


func void Msg_FadeOut(var UIMsg Msg)
{
	var int posYFrameStep;var int y;
	var int frame; var int alphaNow;
	var int alphaStep;
	//calculate fade in frame
	alphaNow = MEM_ReadInt(Msg.msgView+36);
	alphaStep = (Msg_FinishBGAlpha-(Msg_FinishBGAlpha%Msg_FadeOutFrames))/Msg_FadeOutFrames;
    y = MEM_ReadInt(Msg.msgView+68);
    posYFrameStep = (MEM_ReadInt(Msg.msgView+76)-(MEM_ReadInt(Msg.msgView+76)%Msg_FadeOutFrames))/Msg_FadeOutFrames;

    frame = (y-Msg_PosY)/posYFrameStep;
	frame = frame;

    if(frame==Msg_FadeOutFrames)//last frame
    {
		CALL_IntParam(Msg_PosY);//zcview
   		CALL_IntParam(Msg_PosX);//zcview
   		CALL__thiscall (Msg.msgView,zCView_SetPos_offset); 
   		
        CALL_IntParam(0);
        CALL__thiscall (Msg.msgView,zCView_SetTransparency_offset);   	
        MEM_WriteInt(Msg.Line1View+44,0);   
        if(Msg.Line2View)
        {
       	 MEM_WriteInt(Msg.Line2View+44,0);   
        };
        CALL__thiscall (Msg.msgView,zCView_Close_offset);	
        MsgManager_Pop();
        printdebug("># POPPED!");

    }
    else
    {
		CALL_IntParam(y+posYFrameStep);//zcview
   		CALL_IntParam(Msg_PosX);//zcview
   		CALL__thiscall (Msg.msgView,zCView_SetPos_offset); 
   		MEM_WriteInt(Msg.msgView+72,y+posYFrameStep);
   		
        CALL_IntParam(alphaNow-alphaStep);
        CALL__thiscall (Msg.msgView,zCView_SetTransparency_offset);     	
        
        var int txtAlpha; var int hlp;
        txtAlpha = fracf(frame,Msg_FadeOutFrames);
        hlp = mulf(txtAlpha,mkf(zColor_a(Msg.color)));//*alpha
        txtAlpha = 255-truncf(hlp);

        MEM_WriteInt(Msg.Line1View+44,RGBAToZColor(zColor_r(Msg.color),zColor_g(Msg.color),zColor_b(Msg.color),txtAlpha));  
       // printdebug_s_i("># txtAlpha:",txtAlpha); 
        if(Msg.Line2View)
        {
       	 MEM_WriteInt(Msg.Line2View+44,RGBAToZColor(zColor_r(Msg.color),zColor_g(Msg.color),zColor_b(Msg.color),txtAlpha));   
        };  
	};
};


func void Msg_InitView(var UIMsg Msg)
{
		//Remove old view if it was present:
		if(Msg_2nd.msgView>0)
		{
			MEM_Free(Msg.msgView);	
		};
		var int vptr;
		vptr =  MEM_Alloc(256);
		Msg.msgView = vptr;
		printdebug("># constructor");
		CALL__thiscall (vptr,zCView_zCView_offset); 
	
        //Remove on close: TRUE!!!
        MEM_WriteInt(vptr+188,true);
        //zCView::FX(OPEN/CLOSE)
        MEM_WriteInt(vptr+144,0);
        MEM_WriteInt(vptr+148,0);	
        			  
		//SetPos
 		var int x;var int y;
		x = CalcPixelPosX(MsgBox_SizeX); y = CalcPixelPosY(MsgBox_SizeY);
		CALL_IntParam(Msg_PosY-y);
        CALL_IntParam(Msg_PosX);//zcview
        CALL__thiscall (vptr,zCView_SetPos_offset); 
        //Manualy update pos:
        MEM_WriteInt(Msg.msgView+72,Msg_PosY-CalcPixelPosY(MsgBox_SizeY));              

        CALL_IntParam(CalcPixelPosY(MsgBox_SizeY));//S Y
        CALL_IntParam(CalcPixelPosX(MsgBox_SizeX));//S X
        CALL__thiscall (vptr,zCView_SetSize_offset);
  
        //Set Alpha
        CALL_IntParam(0);
        CALL__thiscall (vptr,zCView_SetTransparency_offset);
        
        //set BG tex
        CALL_zStringPtrParam("UI_MSG_BG.TGA");//zcview
        CALL__thiscall (vptr,zCView_InsertBack_offset);
 
        //set font
        CALL_zStringPtrParam(Msg.font);//zcview
        CALL__thiscall (vptr,zCView_SetFont_offset);        
               
        //Open
        CALL__thiscall (vptr,zCView_Open_offset); 
       
        //Add Text:
		UIMsg_FormatAndPrintText(Msg);

		//make Text opanque:
        MEM_WriteInt(Msg.Line1View+44,RGBAToZColor(255,255,255,0));   
        if(Msg.Line2View)
        {
       	 MEM_WriteInt(Msg.Line2View+36,RGBAToZColor(255,255,255,0));   
        }; 
        //Insert Item to screen
		CALL_IntParam(2);//zcview
        CALL_IntParam(vptr);//zcview
        CALL__thiscall (screen_offset,zCView_InsertItem_offset);
};

func int Msg_Create(var string msg,var string font,var int zCCol,var int dur,var string wav)
{
	var int Mptr; var UIMsg hlp;
	Mptr = MEM_Alloc(76);
	MEM_AssignContentInst (hlp,Mptr);
	hlp.text 	= msg; 
    hlp.msgView	= 0;
    hlp.next	= 0;  
    hlp.color	= zCCol;
    hlp.font	= font;
    hlp.durTicks= dur;
    hlp.soundOnStart= wav;
    return Mptr;  
	
};

func void PutMsg(var string msg,var string font,var int zCCol,var int dur,var string wav)
{
	MsgManager_Push(Msg_Create(msg,font,zCCol,dur,wav));	
};

//called by POISON_TRIGGER
func void MsgManager_DoTick()
{
	if(MEM_InstToPtr(Msg_1st))&&(MsgManager.state==MsgManager_State_Show)
	{
		Msg_1st.durTicks-=1;
		MsgManager.timeTillEnd-=1;
	};
	
};

func void MsgManager_RenderMsg()
{
	if(MEM_InstToPtr(Msg_1st))//Normal rendering of zCView(s)
	{
		//printdebug_s_i("># rendering msg:",MEM_InstToPtr(Msg_1st)); 
		CALL__thiscall (Msg_1st.msgView,zCView_Render_offset);
		if(MEM_InstToPtr(Msg_2nd))&&(Msg_2nd.msgView)
		{
			printdebug_s_i("># rendering msg#2:",MEM_InstToPtr(Msg_2nd)); 
			CALL__thiscall (Msg_2nd.msgView,zCView_Render_offset);	
		};
	};	
};

//called by PerFrameTrigger
func void MsgManager_DoFrame()
{
  	if(MsgManager.count)
  	{
      printdebug_s_i("># MsgManager.count:",MsgManager.count);	
		if(MsgManager.state == MsgManager_State_None)&&(MsgManager.count)
		{
			//Init of Msg_1	  
			var int vptr;
			MsgManager.state		= MsgManager_State_FadeIN; 
			printdebug("># Msg state = FADE IN");
			Msg_InitView(Msg_1st);//opacity = 0%
  
		}
		else if(MsgManager.state == MsgManager_State_FadeIN)
		{
			printdebug("># frame: Msg_FadeIN(Msg_1st);");
			Msg_FadeIN(Msg_1st);//opacity = 0%
		}
		else if(Msg_1st.durTicks<=0)&&(MsgManager.state == MsgManager_State_Show)//First msg time expired
		{
			MsgManager.state = MsgManager_State_FadeOUT;
			printdebug("># Msg state = FADE OUT");
        	if(MEM_InstToPtr(Msg_2nd))
        	{
				Msg_InitView(Msg_2nd);	
        	}; 	
        	//return;
      	}
      	else if(MsgManager.state == MsgManager_State_Show)&&(!Hlp_StrCmp(Msg_1st.soundOnStart,""))
  		{
			introducechapter ("","","",Msg_1st.soundOnStart, 0);	
	  		Msg_1st.soundOnStart = "";//clear after play
  		}
      	else if(MsgManager.state == MsgManager_State_FadeOUT)
      	{
	      	//Bugfix: Second message have to be first because FadingOut of first Msg can change object in Msg_2nd to next one
	      	if(MEM_InstToPtr(Msg_2nd))
        	{
				printdebug("># Fading in 2nd");
				if(!Msg_2nd.msgView)//during fading out another msg was pushed...
				{
					Msg_InitView(Msg_2nd);
				};
				Msg_FadeIN(Msg_2nd);
        	};	      	
				printdebug("># Fading out 1st");
	      	Msg_FadeOut(Msg_1st);
      	};	
      	MsgManager_RenderMsg();
  	};	
};