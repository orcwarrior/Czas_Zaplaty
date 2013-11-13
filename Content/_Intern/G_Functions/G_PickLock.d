/************************************************************************* 
 * 							 B_CHESTHACK
 *************************************************************************
 * Disable chest opening if hero havn't any picklock skills
 *************************************************************************/
func int B_CHESTHACK()
{

	if(Npc_GetTalentSkill		(hero,NPC_TALENT_PICKLOCK))
	{
	return TRUE;	
	}
	else
	{
	AI_PlayAni(hero,"T_DONTKNOW");	
	PutMsg(_STR_MESSAGE_PICKLOCK_NOSKILL,"font_default.tga",RGBAToZColor(255,255,255,255),8,"");
	return FALSE;	
	};
	
};
/************************************************************************* 
 * 							 G_PickLock
 *************************************************************************
 * PRCONDITIONS: 	self	: Player
 *************************************************************************/
var int ChestMsgBugfix;
func void G_PickLock( var int bSuccess, var int bBrokenOpen  )
{
	var string	strSoundFX;
	var string	strMessage;
	var int		strYPos;
	var int		msgColor;//New - orc
	var int 	time;
	strSoundFX = _STR_INVALID;
	strMessage = _STR_INVALID;
	time = _TIME_MESSAGE_PICKLOCK;
	if ( bSuccess)
	{
		if ( bBrokenOpen )
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_UNLOCK;
			strMessage	= _STR_MESSAGE_PICKLOCK_UNLOCK;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_UNLOCK;
			msgColor	= RGBAToZColor(120,255,120,255);
			time		+= time;
		}
		else
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_SUCCESS;
			strMessage	= _STR_MESSAGE_PICKLOCK_SUCCESS;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_SUCCESS;
			msgColor	= RGBAToZColor(255,255,255,255);
		};
	}
	else
	{
		if ( bBrokenOpen )
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_BROKEN;
			strMessage	= _STR_MESSAGE_PICKLOCK_BROKEN;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_BROKEN;
			msgColor	= RGBAToZColor(255,205,105,255);
		}
		else
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_FAILURE;
			strMessage	= _STR_MESSAGE_PICKLOCK_FAILURE;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_FAILURE;
			msgColor	= RGBAToZColor(255,105,105,255);
		};
	};
	
	//
	//	PLAY APPROPRIATE SOUND
	//
	Snd_Play3d( self, strSoundFX );
	
	//
	//	PRINT THE MESSAGE
	//
	//PRINTScreen	(strMessage, -1, strYPos, _STR_FONT_ONSCREEN, _TIME_MESSAGE_PICKLOCK );	

	if(ChestMsgBugfix!=true)&&(!Hlp_StrCmp(_STR_INVALID,strMessage))
	{
	ChestMsgBugfix = true;//var is set to false when Arrow Left/Right is pushed
	PutMsg(strMessage,"font_default.tga",msgColor,time,"");
	};	
		
};
