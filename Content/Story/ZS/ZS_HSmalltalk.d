//////////////////////////////////////////////////////////////////////////
//	ZS_Smalltalk
//	============
//
//	Der NSC bleibt auf seinem Freepoint stehen und sagt gelegentlich
//	einen zufällig ausgewählten, völlig belanglosen Satz zu seinem
//	Gesprächspartner.
//
//  Wenn kein Gesprächpartner gefunden wird, geht der NSC in ZS_Stand !!!
//////////////////////////////////////////////////////////////////////////
func void ZS_HSmalltalk () 
{
    ////PrintDebugNpc			(PD_TA_FRAME,	"ZS_HSmalltalk");
    
	B_SetPerception 		(self);	
	AI_SetWalkmode			(self,	NPC_WALK);
	
    //-------- Grobpositionierung --------
	if (!Npc_IsOnFP(self,"SMALLTALK"))
	{
		////PrintDebugNpc		(PD_TA_CHECK,	"...nicht auf FP!");
		AI_GotoWP			(self,	self.wp);						// Gehe zum Tagesablaufstart
	};
    //----------------------------
    AI_AlignToFP( self );				//Richte Dich aus
};

func void ZS_HSmalltalk_Loop()
{
    ////PrintDebugNpc			(PD_TA_LOOP,	"ZS_HSmalltalk_Loop");
	
	Npc_PerceiveAll			(self);
	Wld_DetectNpc(self,	-1, ZS_HSmalltalk, -1);
	//PRINTGlobals(PD_TA_CHECK);
	
	if (Wld_DetectNpc(self,	-1, ZS_HSmalltalk, -1) && (Npc_GetDistToNpc	(self, other)<HAI_DIST_SMALLTALK))
	{
	    AI_TurnToNpc(self,other);

// Neue Texte für Smalltalk (kurze, gemurmelte, Wortfetzen, die als SVMs vorliegen)

// ...wenn Du meinst...
// ...kann schon sein...
// ...war nicht besonders schlau....
// ...ich halt mich da lieber raus...
// ...das ist ein Problem, aber nicht mein Problem...
// ...war doch klar, daß das Ärger gibt...
// ...aber behalt's für Dich, muß nicht gleich jeder wissen...
// ...das passiert mir nicht...
// ...an der Gechichte muß wohl doch was dran sein...
// ...man muß eben aufpassen was man rumerzählt...
// ...solange ich damit nichts zu tun habe... 
// ...man darf auch nicht alles glauben, was man hört...
// ...in seiner Haut will ich trotzdem nicht stecken...
// ...immer wieder die selbe Leier...
// ...manche lernen eben garnichts dazu... 
// ...früher wäre das ganz anders gelaufen...
// ...gequatscht wird viel...
// ...ich hör nicht mehr auf das Gefasel...
// ...verlaß Dich auf jemanden und Du bist verlassen, das ist eben so...
// ...ich glaube kaum, daß sich daran was ändern wird...
// ...wahrscheinlich hast Du recht...
// ...erstmal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird...
// ...ich dachte, das wäre schon lange geklärt, aber das ist wohl nicht so...
// ...laß uns über lieber über was anderes reden...

// Alte Version mit AI-Outputs
/*	    var int talktime;
    	talktime = Hlp_Random (200);
    	if 		(talktime <   5)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text01");//I jak upolowa³eœ coœ ostatnio ??? hehe
    	} 
    	else if (talktime <  10)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text02");//Ach tylko pare œcierwojadów wilków ale....
    	}
    	else if (talktime <  15)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text03");//Nie moge narzekaæ.  
  	}
    	else if (talktime < 20)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text04");//By³a niez³a akcja z cieñiostworem.
    	}
    	else if (talktime < 25)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text05");//Naprawde opowiadaj.
    	}
    	else if (talktime < 30)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text06");//No wiesz mog³o byæ lepiej oberwa³ troche....
    	}
    	else if (talktime < 35)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text07");//Ja ci musze przyznaæ ¿e z naszego obozu robi siê prawdziwy DU¯Y obóz.
    	}
    	else if (talktime < 40)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text08");//S³ysza³eœ mamy nowego w szeregach tylko jak on ma³ na imie...
    	}
    	else if (talktime < 45)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text09");//Mówie ci szkoda gadaæ.
    	}
    	else if (talktime < 50)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text10");//S³ysza³eœ? Nasi zabili pi¹tkê sta¿ników, jednak niektórzy maj¹ talent! A co u ciebie?
    	}
    	else if (talktime < 55)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text11");//Nic ciekawego,chocia¿ ostatno zabi³em watahe wilków samemu!
    	}
    	else if (talktime < 60)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text12");//No No kto by pomyœla³.
    	}
    	else if (talktime < 65)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text13");//Ostatno jakiœ koleœ strasznie ubolewa³ nad wyposa¿eniem ale musze ci przyznaæ ze mój miecz...
    	}
    	else if (talktime < 70)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text14");//Tak trzeba poimformowaæ Cavalorna albo Grega.
    	}
    	else if (talktime < 75)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text15");//Jak leci ,ja chce iœæ wkopaæ paru stra¿nikom co ty na to?
    	}
    	else if (talktime < 80)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text16");//Zale¿y ile wiest granica miêdzy odwag¹ a..............g³upot¹.
    	}
    	else if (talktime < 85)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text17");//S³ysza³eœ pojmali konwój stra¿ników oœmiu zabili piêciu siê przy³¹czy³o.
    	}
    	else if (talktime < 90)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text18");//Podobno do obozu przy³¹cz¹ sie magowie jeœli tak to do³¹cze na nauki.
    	}
    	else if (talktime < 95)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text19");//Obi³o mi siê o uszy ¿e bedzie walczy³ to bêdzie Ratford ale nie pamiêtam imienia tego drugiego.
    	}
    	else if (talktime < 100)
    	{
    		AI_Output (self,NULL,"ZS_HSmalTalk_Text20");//...I ty Siê nie ba³eœ...
    	};
*/

    	AI_Wait					(self,	3);
    	Npc_SetStateTime(self, 0);
    }	
	else if (Npc_GetStateTime(self) >= 199)
	{
	    ////PrintDebugNpc		(PD_TA_CHECK,	"... kein Gesprächspartner gefunden!");
	        		AI_Output (self,NULL,"ZS_HSmalTalk_Text21");//Cholera czemu ciê nie ma.
	    AI_StartState	(self, ZS_SitAround, 1, "");
	};
	
	AI_Wait					(self,	1);
};

func void ZS_HSmalltalk_End ()
{
	    		AI_Output (self,NULL,"ZS_SmalTalk_Text22");//Do Zobaczenia.
    ////PrintDebugNpc			(PD_TA_FRAME,	"ZS_HSmalltalk_End");
};
