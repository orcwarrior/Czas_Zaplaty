var int PARTY_COMMAND;

const int COMMAND_NONE = 0;
const int COMMAND_FOLLOW 	= 1;
const int COMMAND_WAIT	 	= 2;
const int COMMAND_HEALSELF 	= 3;
const int COMMAND_FIGHTNEAR	= 4;
const int COMMAND_FIGHTFAR	= 5;
const int COMMAND_FIGHTFAV	= 6;
//	const int COMMAND_RETREAD	= 7;

const int party_limit=31; //maksymalna liczba zatrutych
var int Party_LastPos;//last used pos more npcs value decreases
//--------------------------------------------
func int  GetPartyLastPos()
{
	var int idx; var int label;	var c_npc v;
	idx = Party_LastPos;
	MEM_InitLabels(); 
	label = MEM_StackPos.position; 
	idx = idx - 1;
	v=Npc_GetNewsVictim(party_memory,Npc_HasNews(party_memory,idx,NULL,NULL));
	
   if(Npc_GetAivar(v,AIV_PARTYMEMBER)==FALSE)&&(idx>1)
	{
		MEM_StackPos.position = label; 	
	}
	else if(Npc_GetAivar(v,AIV_PARTYMEMBER)==TRUE)
	{
		return idx;	
	}
	else
	{
		return 0;	
	};
};

func void purge_party(var c_npc slf, var int i)
{
	//idx of npc
	if(i==Party_LastPos)
	{
		Party_LastPos=GetPartyLastPos();		
	};
};

func void Party_AddNpc_rec(var c_npc slf, var int i)
{
	if(i>PARTY_LastPos)
	{
		PARTY_LastPos=i;		
	};
	Npc_MemoryEntry(party_memory,1,hero,i,slf);
};
//check if any lower index is free so it can fill it
func int  Party_AddNpc_check_smaller_indexes()
{
	var int idx; var int label;	var c_npc v;
	idx = PARTY_LastPos;
	MEM_InitLabels(); 
	
	label = MEM_StackPos.position; 
	idx = idx - 1;
	v=Npc_GetNewsVictim(party_memory,Npc_HasNews(party_memory,idx,NULL,NULL));
	if(Npc_GetAivar(v,AIV_PARTYMEMBER)==TRUE)&&(idx>1)
	{
		MEM_StackPos.position = label; 	
	}
	else if(Npc_GetAivar(v,AIV_PARTYMEMBER)==FALSE)
	{
		return idx;	
	}
	else
	{
		return -1;	
	};
};

func void Party_AddNpc(var c_npc slf)
{
	var int idx;
	if(Npc_GetAivar(slf,AIV_PARTYMEMBER)==TRUE)
	{
		//already in party
		return;
	};
	
	Npc_SetAivar(slf,AIV_PARTYMEMBER,  TRUE);
	
	if(Party_LastPos>1)
	{
		idx = Party_AddNpc_check_smaller_indexes();
      
		if(idx== -1)
		{
			Party_LastPos+=1;
			Party_AddNpc_rec(slf,Party_LastPos);			
		}
		else
		{
			Party_AddNpc_rec(slf,idx);				
		};	
	}
	else//lastpos==1 or 0
	{
		Party_LastPos+=1;
		Party_AddNpc_rec(slf,Party_LastPos);	
	};
};

func void party_check_rec(var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(party_memory,Npc_HasNews(party_memory,i,NULL,NULL));
	
	if(Hlp_IsValidNpc(v))
	{	
		if(Npc_GetAivar(v,AIV_PARTYMEMBER))
		{
			//umm, sth like "Last_HeroComand" etc.
			//PrintScreen (concatstrings(concatstrings(inttostring(i), ". "),v.name), 23, 10+(i*3), _STR_FONT_ONSCREEN,1);	
			
			if(PARTY_COMMAND)
			{
				if(PARTY_COMMAND==COMMAND_FOLLOW)
				{
					PartyCommand_Follow(v);
				}
				else if(PARTY_COMMAND==COMMAND_WAIT)
				{
					PartyCommand_Wait(v);
				}
				else if(PARTY_COMMAND==COMMAND_HEALSELF)
				{
					PartyCommand_Heal(v);
				}
				else if(PARTY_COMMAND==COMMAND_FIGHTNEAR)
				{
					PartyCommand_FightNear(v);
				}
				else if(PARTY_COMMAND==COMMAND_FIGHTFAR)
				{
					PartyCommand_FightFar(v);
				}
				else if(PARTY_COMMAND==COMMAND_FIGHTFAV)
				{
					PartyCommand_FightFav(v);
				};
			};
		}
		else  
		{
			purge_party(v,i);	
		};
	};
   
	if(i>1)
	{
		party_check_rec(i-1);
	}
	else
	{
		PARTY_COMMAND=COMMAND_NONE;	
	};
};

func void party_check()
{
	party_check_rec(PARTY_LastPos);
};

func void Party_RemoveNpc(var c_npc slf)
{
	Npc_SetAivar(slf,AIV_PARTYMEMBER,  FALSE);
	//remove from memory done in triggerloop
};