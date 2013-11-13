/*******************************************
*          NSC benutzt Herbstomper         *
*******************************************/

func void ZS_Mis_RodneyatLeren()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_Mis_RodneyatLeren");
 	B_SetPerception			(self);

	AI_SetWalkmode (self,NPC_RUN);			
	
	AI_GotoWP	(self, self.wp);
	AI_GotoFP (self, "FP_TALK");
	AI_AlignToFP( self );			

};
var int RodneyMage_Day;

func int ZS_Mis_RodneyatLeren_Loop ()
{
    //PrintDebugNpc (PD_TA_LOOP,"ZS_Mis_RodneyatLeren_Loop");
    if(Npc_GetDistToWP(Self,self.wp)<900)
    {
	   AI_TurnToNpc(self,leren);
	  if(Npc_GetDistToPlayer(self)<1000)||(RodneyMage_Day<Wld_GetDay())
	  {
		CreateInvItem(self,MAG_ARMOR_L); 
		Npc_RemoveInvItem (self,ItMw_Pir_01);
		AI_UnequipArmor(self);
		Npc_RemoveInvItem (self,PIR_ARMOR_L);
		CreateInvItem (self,MAG_MW_01);
		AI_EquipBestMeleeWeapon		(self);
		
		self.fight_tactic	=	FAI_HUMAN_MAGE;	
		AI_EquipArmor(self,MAG_ARMOR_L);  
		RodneyMage_Day = 1024;
 		Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
 		Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  6);
		self.attribute[ATR_MANA_MAX] = 100; 
		self.attribute[ATR_MANA] = 100; 
		CreateInvItem (self,ItArRuneThunderbolt);
		CreateInvItems (self,ItArRuneFirebolt,1);	

		B_ExchangeRoutine(self,"Mage");
		B_ExchangeRoutine(leren,"start2");
		
		return LOOP_END;
		
	  };
	   
    };
	AI_Wait(self,2);
	return LOOP_CONTINUE;
};

func void ZS_Mis_RodneyatLeren_End ()
{
	
	//PrintDebugNpc (PD_TA_FRAME,"ZS_Mis_RodneyatLeren_End");
};

