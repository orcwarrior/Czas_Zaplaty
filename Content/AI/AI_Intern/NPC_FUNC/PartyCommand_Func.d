var string follow_TP_WP;

func int PartyCommand_CommandCanAffectNpc(var c_npc slf)
{
	if	(Npc_IsInState(slf,ZS_GuidePC))             ||(Npc_WasInState(slf,ZS_GuidePC))             
	||(Npc_IsInState(slf,ZS_GuideToMine))       ||(Npc_WasInState(slf,ZS_GuideToMine))       
	||(Npc_IsInState(slf,ZS_Tony_GuideToSentry))||(Npc_WasInState(slf,ZS_Tony_GuideToSentry))
	||(Npc_IsInState(slf,ZS_RodericGuide))      ||(Npc_WasInState(slf,ZS_RodericGuide))      
	||(Npc_IsInState(slf,ZS_FollowKira))        ||(Npc_WasInState(slf,ZS_FollowKira))        
	||(Npc_IsInState(slf,ZS_FollowAngus))       ||(Npc_WasInState(slf,ZS_FollowAngus))       
	||(Npc_IsInState(slf,ZS_FollowCavalorn))    ||(Npc_WasInState(slf,ZS_FollowCavalorn))    
	{
		return true;	
	};	
	return false;
};

func void PartyCommand_Follow(var c_npc slf)
{
	//Don't affect guiders & npc followers
	if	PartyCommand_CommandCanAffectNpc(slf)
	{
		return;	
	};
	var string wp;
	
	if(Npc_GetDistToPlayer(slf)>3500)
	{
		if(Hlp_StrCmp("",follow_TP_WP))
		{
			var int m13,var int m14;
			var int m23,var int m24;
			var int m33,var int m34;
			var int dist; var int heroptr; 
			
			var int x; var int y; var int z;
			heroptr = oCNpc_GetPointer(hero);
			
			m13 =  MEM_ReadInt(heroptr+68);
			m14 =  MEM_ReadInt(heroptr+72);
			
			m23 =  MEM_ReadInt(heroptr+84);
			m24 =  MEM_ReadInt(heroptr+88);
			
			m33 =  MEM_ReadInt(heroptr+100);
			m34 =  MEM_ReadInt(heroptr+104);	
			
			dist = mkf(-2500);
			
			x = mulf(dist,m13);
			y = mulf(dist,m23);
			z = mulf(dist,m33);
			
			x = addf(x,m14);
			y = addf(y,m24);
			z = addf(z,m34);	
			wp = Hlp_GetNearestWpToPos(x,y,z);
			follow_TP_WP = wp;	
		}
		else//done b4
		{
			wp = follow_TP_WP;	
		};
		AI_Teleport(slf,wp);
	}
	else  //npc is near hero so it can easly get nearest wp
	{
		wp = Npc_GetNearestWP(slf);
	};
	TA_RemoveOverlay			(slf);
	TA_BeginOverlay				(slf);
	TA_Min		(slf,	0,01,12,00,ZS_FollowPC ,wp);                                      
	TA_Min		(slf,	12,01,0,00,ZS_FollowPC ,wp);		
	TA_EndOverlay				(slf); 
	
	
	Npc_ClearAiQueue(slf);
	
};



func void PartyCommand_Wait(var c_npc slf)
{
	//Don't affect guiders & npc followers
	if	PartyCommand_CommandCanAffectNpc(slf)
	{
		return;	
	};
	var string wp;
	wp = Npc_GetNearestWP(slf);
	TA_RemoveOverlay			(slf);
	TA_BeginOverlay				(slf);
	TA_Min		(slf,	0,01,12,00,ZS_Stay ,wp);                                      
	TA_Min		(slf,	12,01,0,00,ZS_Stay ,wp);		
	TA_EndOverlay				(slf); 
	Npc_ClearAiQueue(slf);
};



func void PartyCommand_Heal(var c_npc slf)
{
	var int hp; var int hpmax;
		hp = slf.attribute[ATR_HITPOINTS];
		hpmax = slf.attribute[ATR_HITPOINTS_MAX];
		if(hp>=hpmax)//||(Npc_GetBodystate(self)==BS_RUN)
		{ return; };//FULLHP or in Run
		
		//Chose ur potion!
		//50
		if(hpmax-hp_Essenz>=hp-19)&&(Npc_HasItems(slf,ItFo_Potion_Health_01))
		{
			AI_PlayAni(slf,"T_LAMEHP");
			Npc_RemoveInvItem(slf,ItFo_Potion_Health_01);	
			Npc_ChangeAttribute			(slf,ATR_HITPOINTS,hp_Essenz); 
		}
		else if(hpmax-hp_Extrakt>=hp-19)&&(Npc_HasItems(slf,ItFo_Potion_Health_02))
		{
			AI_PlayAni(slf,"T_LAMEHP");
			Npc_RemoveInvItem(slf,ItFo_Potion_Health_02);	
			Npc_ChangeAttribute			(slf,ATR_HITPOINTS,hp_Extrakt); 
		}
		else if( (hpmax-hp_Elixier>=hp-49) || (hp-100>0) )&&(Npc_HasItems(slf,ItFo_Potion_Health_03))
		{
			AI_PlayAni(slf,"T_LAMEHP");
			Npc_RemoveInvItem(slf,ItFo_Potion_Health_03);	
			Npc_ChangeAttribute			(slf,ATR_HITPOINTS,hp_Elixier); 
		}
		else if(hp-100<=0)&&(Npc_HasItems(slf,ItFo_Potion_Health_04))//Very Low HP, drink full it's rational
		{
			AI_PlayAni(slf,"T_LAMEHP");
			Npc_RemoveInvItem(slf,ItFo_Potion_Health_04);	
			Npc_ChangeAttribute			(slf,ATR_HITPOINTS,hpmax-hp); 
		}
		else//Drink anything!
		{
			if(Npc_HasItems(slf,ItFo_Potion_Health_01))
			{
				AI_PlayAni(slf,"T_LAMEHP");
				Npc_RemoveInvItem(slf,ItFo_Potion_Health_01);	
				Npc_ChangeAttribute			(slf,ATR_HITPOINTS,hp_Essenz); 
			}
			else if(Npc_HasItems(slf,ItFo_Potion_Health_02))
			{
				AI_PlayAni(slf,"T_LAMEHP");
				Npc_RemoveInvItem(slf,ItFo_Potion_Health_02);	
				Npc_ChangeAttribute			(slf,ATR_HITPOINTS,hp_Extrakt); 
			}
			else if(Npc_HasItems(slf,ItFo_Potion_Health_03))
			{
				AI_PlayAni(slf,"T_LAMEHP");
				Npc_RemoveInvItem(slf,ItFo_Potion_Health_03);	
				Npc_ChangeAttribute			(slf,ATR_HITPOINTS,hp_Elixier); 
			}
			else if(Npc_HasItems(slf,ItFo_Potion_Health_04))
			{
				AI_PlayAni(slf,"T_LAMEHP");
				Npc_RemoveInvItem(slf,ItFo_Potion_Health_04);	
				Npc_ChangeAttribute			(slf,ATR_HITPOINTS,hpmax-hp); 
				
			};
		};
};


func void PartyCommand_FightNear(var c_npc slf)
{
	slf.fight_tactic = FAI_HUMAN_MASTER;
	
	//nasty bugfix, but working
	if(Npc_GetAivar(slf,AIV_PARTYMEMBER)==1)||(Npc_GetAivar(slf,AIV_PARTYMEMBER)==3)
	{
		Npc_SetAivar(slf,AIV_PARTYMEMBER,2);//it means that fai was changed (to master)
	};
		
};

func void PartyCommand_FightFar(var c_npc slf)
{
	if(Npc_HasEquippedRangedWeapon(slf))
	{
	slf.fight_tactic = FAI_HUMAN_RANGED;
	//nasty bugfix, but working
	if(Npc_GetAivar(slf,AIV_PARTYMEMBER)==1)||(Npc_GetAivar(slf,AIV_PARTYMEMBER)==2)
	{
		Npc_SetAivar(slf,AIV_PARTYMEMBER,3);//it means that fai was changed (to ranged)
	};	
	};
		
};

func void PartyCommand_FightFav(var c_npc slf)
{
	if(Npc_GetAivar(slf,AIV_PARTYMEMBER)==3)//orginally - master/strong w/e
	{
	slf.fight_tactic = FAI_HUMAN_MASTER;
	}
	else if(Npc_GetAivar(slf,AIV_PARTYMEMBER)==2)//orginally - ranged
	{
	slf.fight_tactic = FAI_HUMAN_RANGED;
	};
		
};