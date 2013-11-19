
// Ork: ZS uruchamiany kiedy bohater sobie wybiera wyglad
// a NPC (powinien) czekać aż z tym skończy.. 
func void ZS_StylistWait()
{	
	AI_TurnToNpc(self,hero);
    AI_PlayAni (self,"T_STAND_2_HGUARD");
};

func int ZS_StylistWait_loop()
{
	if(MOBSIDIALOG == STYLIST_1_DIALOG)
	{
		AI_WaitMS(self,500);
		return LOOP_CONTINUE;
	}
	else
	{
		AI_TurnToNpc(self,hero);
		return LOOP_END;
	};
};

func void ZS_StylistWait_end()
{
    AI_PlayAni (self,"T_HGUARD_2_STAND");
	
};	


