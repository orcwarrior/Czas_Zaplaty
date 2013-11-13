
func void ZS_TakeBarrel()
{
	//GuardPerception ();
	//Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_NoReact);
	AI_SetWalkmode 	(self,NPC_WALK);

	AI_GotoWP		(self, self.wp);

};
func int ZS_TakeBarrel_loop()
{
	

	if(Npc_IsOnFP(self,"FP_TAKEBARREL"))
	{
	
	}
	else if (Wld_IsFPAvailable(self,"FP_TAKEBARREL"))
	{							
		//pri/nt("FPAVAIBLE");										
		AI_GotoFP (self, "FP_TAKEBARREL");
		AI_AlignToFP( self );			
		//return loop_end;


	};
	return loop_continue;
};

func void ZS_TakeBarrel_end()
{
	
		AI_PlayAni(self,"T_PICKBARREL");	
		    var int bv; var int bc; var int hv; var int t;
		    var string headmsh;
			var ocnpc slf;
			Npc_MemoryEntry	( self, NEWS_SOURCE_WITNESS, self, NEWS_HASDEFEATED, self);
			slf = Npc_GetNewsWitness(self,Npc_HasNews(self,NEWS_HASDEFEATED,NULL,NULL));	
			bv = slf.npc_bitfield[1] << 4;// & ((1<<16)|(1<<17)|(1<<18)|(1<<19)|(1<<20)|(1<<21)|(1<<22)|(1<<23)); 
			//bv = bv/1000 - (bv%1000);  	
			bc = slf.npc_bitfield[1]& ((1<<0)|(1<<1)|(1<<2));// & oCNpc_bitfield1_body_TexColorNr;  	
			hv = slf.npc_bitfield[1] >> 16; 
			bv = slf.npc_bitfield[0] >> 12;	bv = (bv-2)/4;
			t =  slf.npc_bitfield[2] & ((1<<0)|(1<<1));//lastbit 
	
			headmsh = slf.head_visualName;
			Mdl_SetVisualBody (self,"HUM_BODY_BARREL",bv,bc,headmsh,hv,t,-1);			
			Mdl_ApplyOverlayMds 	(self,	"HUMANS_BARREL.mds");
	
	
};

func void ZS_BarrelTransport()
{
	//GuardPerception ();
	//Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_NoReact);
//	AI_SetWalkmode 	(self,NPC_WALK);
		    var int bv; var int bc; var int hv; var int t;
		    var string headmsh;
			var ocnpc slf;
			Npc_MemoryEntry	( self, NEWS_SOURCE_WITNESS, self, NEWS_HASDEFEATED, self);
			slf = Npc_GetNewsWitness(self,Npc_HasNews(self,NEWS_HASDEFEATED,NULL,NULL));
			bv = slf.npc_bitfield[1] << 4;// & ((1<<16)|(1<<17)|(1<<18)|(1<<19)|(1<<20)|(1<<21)|(1<<22)|(1<<23)); 
			//bv = bv/1000 - (bv%1000);  	
			bc = slf.npc_bitfield[1]& ((1<<0)|(1<<1)|(1<<2));// & oCNpc_bitfield1_body_TexColorNr;  	
			hv = slf.npc_bitfield[1] >> 16; 
			bv = slf.npc_bitfield[0] >> 12;	bv = (bv-2)/4;
			t =  slf.npc_bitfield[2] & ((1<<0)|(1<<1));//lastbit 	
			headmsh = slf.head_visualName;
			Mdl_SetVisualBody (self,"HUM_BODY_BARREL",bv,bc,headmsh,hv,t,-1);			
			Mdl_ApplyOverlayMds 	(self,	"HUMANS_BARREL.mds");
	AI_GotoWP		(self, self.wp);
	
};

func int ZS_BarrelTransport_loop()
{
//	AI_SetWalkmode 	(self,NPC_WALK);
	
//	if(Npc_GetAivar(self,AIV_TPBASH)==0)//for sure, AIV_TPBASH won't be used when slv transport barrels
//	{
	//	AI_GotoWP		(self, self.wp);	
//	};
/*	if (Wld_IsFPAvailable(self,"FP_TAKEBARREL"))&&(Npc_GetAivar(self,AIV_TPBASH)==0)
	{																	
		AI_GotoFP (self, "FP_TAKEBARREL");
		AI_AlignToFP( self );			
		AI_PlayAni(self,"T_PICKBARREL");
		Npc_GetAivar(self,AIV_TPBASH)=1;
		//B_ExchangeRoutine(self,"clear");
// 		var int hh; var int mm;
// 		hh=wld_getHour();
// 		mm=wld_getMin();	
// 		if(hh<23)
// 		{		
// 		TA_Stand             	(00,00,hh,mm-2,"B4");    
//    		TA_Stand             	(hh,mm-1,00,00,"F"); 
// 		} 
// 		else
// 		{		
// 		TA_Stand             	(12,01,hh,mm-2,"B4");    
//    		TA_Stand             	(hh,mm-1,12,00,"F"); 
// 		};	  
		AI_StartState				(self,ZS_STAND,0,"F");
// 		B_FullStop(self);
// 		AI_ContinueRoutine(self);
		pr/int("UPgradeRTN");
		AI_SetWalkmode 	(self,NPC_WALK);			

	};		
	if(Npc_IsOnFP(self,"FP_TAKEBARREL"))&&(Npc_GetAivar(self,AIV_TPBASH)==1)
	{
		Mdl_ApplyOverlayMds 	(self,	"humans_skeleton_fly.mds");
		Npc_GetAivar(self,AIV_TPBASH)=2;		
	};
	if(Hlp_StrCmp(self.wp,"B4"))&&(Npc_GetAivar(self,AIV_TPBASH)==2)
	{
		if(Npc_GetDistToWp(self,"F")<400)
		{
			AI_SetWalkmode 	(self,NPC_WALK);			
			AI_GotoWP		(self, self.wp);
			p/rint("TargetArchived");
			Npc_GetAivar(self,AIV_TPBASH)=3;
			return loop_end;
	
		}
		else
		{		
		AI_GotoWp(self,"F");
		};
	};
	*/
	if (Wld_IsFPAvailable(self,"FP_LEAVEBARREL"))
	{							
		//p/rint("FPAVAIBLE");										
		AI_GotoFP (self, "FP_LEAVEBARREL");
		AI_AlignToFP( self );			


	};		
	return loop_continue;
};

func void ZS_BarrelTransport_end()
{
	AI_PlayAni(self,"T_BARRELPUT");	
		    var int bv; var int bc; var int hv; var int t;
		    var string headmsh;
			var ocnpc slf;
			Npc_MemoryEntry	( self, NEWS_SOURCE_WITNESS, self, NEWS_HASDEFEATED, self);
			slf = Npc_GetNewsWitness(self,Npc_HasNews(self,NEWS_HASDEFEATED,NULL,NULL));
			bv = slf.npc_bitfield[1] << 4;// & ((1<<16)|(1<<17)|(1<<18)|(1<<19)|(1<<20)|(1<<21)|(1<<22)|(1<<23)); 
			//bv = bv/1000 - (bv%1000);  	
			bc = slf.npc_bitfield[1]& ((1<<0)|(1<<1)|(1<<2));// & oCNpc_bitfield1_body_TexColorNr;  	
			hv = slf.npc_bitfield[1] >> 16; 
			bv = slf.npc_bitfield[0] >> 12;	bv = (bv-2)/4;
			t =  slf.npc_bitfield[2] & ((1<<0)|(1<<1));//lastbit 	
			headmsh = slf.head_visualName;
			Mdl_SetVisualBody (self,"HUM_BODY_NAKED0",bv,bc,headmsh,hv,t,-1);			
			Mdl_RemoveOverlayMds 	(self,	"HUMANS_BARREL.mds");

	
};