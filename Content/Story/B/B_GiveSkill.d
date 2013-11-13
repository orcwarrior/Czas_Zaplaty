

func void G_CanNotLern( var int nAttribute, var int nValue )
{
	//
	//	DETERMINE ATTIBUTE
	//
	var int		nAttributeValue	;	
	var string  strAttribute 	;
	
	if 		( nAttribute == ATR_HITPOINTS		 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS			; nAttributeValue = hero.attribute[ ATR_HITPOINTS		 ]-(hp_tp_bonus+hp_bonus); }
	else if ( nAttribute == ATR_HITPOINTS_MAX	 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS_MAX		; nAttributeValue = hero.attribute[ ATR_HITPOINTS_MAX	 ]-(hp_tp_bonus+hp_bonus); }
	else if ( nAttribute == ATR_MANA			 )	{	strAttribute = _STR_ATTRIBUTE_MANA				; nAttributeValue = hero.attribute[ ATR_MANA			 ]-(mp_tp_bonus+mp_bonus); }
	else if ( nAttribute == ATR_MANA_MAX		 )	{	strAttribute = _STR_ATTRIBUTE_MANA_MAX			; nAttributeValue = hero.attribute[ ATR_MANA_MAX		 ]-(mp_tp_bonus+mp_bonus); }
	else if ( nAttribute == ATR_STRENGTH		 )	{	strAttribute = _STR_ATTRIBUTE_STRENGTH			; nAttributeValue = hero.attribute[ ATR_STRENGTH		 ]-(str_tp_bonus+str_bonus); }
	else if ( nAttribute == ATR_DEXTERITY		 )	{	strAttribute = _STR_ATTRIBUTE_DEXTERITY			; nAttributeValue = hero.attribute[ ATR_DEXTERITY		 ]-(dex_tp_bonus+dex_bonus); }
	else											{	strAttribute = _STR_INVALID						; nAttributeValue = 0									  ; };

	//
	//	COMPOSE MESSAGE
	//
	var int		nDifference	 ;	
	var string  strDifference;  
	var string	strMessage	 ;

	nDifference 	= nValue - 	nAttributeValue;
	strDifference 	= IntToString( nDifference );
	
	strMessage = _STR_CANNOTUSE_PRE_PLAYER;
	
	strMessage = ConcatStrings( strMessage, strDifference 			);
	strMessage = ConcatStrings( strMessage, " " 					);
	strMessage = ConcatStrings( strMessage, strAttribute 			);
	strMessage = ConcatStrings( strMessage, " " 					);	
	strMessage = ConcatStrings( strMessage, _STR_CANNOTUSE_POINTS	);
	strMessage = ConcatStrings( strMessage, _STR_CANNOTLERNSKILL_POST 	);

	//
	//	PRINT MESSAGE
	//
	PutMsg(strMessage,"font_default.tga",RGBAToZColor(255,50,50,255),8*2,"");			
};

func void G_CanNotLernMulti( var int nAttribute, var int nValue, var int nAttribute2, var int nValue2 )
{
	//
	//	DETERMINE ATTIBUTE
	//
	var int		nAttributeValue	;	
	var string  strAttribute 	;
	
	var int		nAttributeValue2	;	
	var string  strAttribute2 	;	
	if 		( nAttribute == ATR_HITPOINTS		 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS			; nAttributeValue = hero.attribute[ ATR_HITPOINTS		]-(hp_tp_bonus+hp_bonus); }  
	else if ( nAttribute == ATR_HITPOINTS_MAX	 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS_MAX		; nAttributeValue = hero.attribute[ ATR_HITPOINTS_MAX	]-(hp_tp_bonus+hp_bonus); }  
	else if ( nAttribute == ATR_MANA			 )	{	strAttribute = _STR_ATTRIBUTE_MANA				; nAttributeValue = hero.attribute[ ATR_MANA			]-(mp_tp_bonus+mp_bonus); }  
	else if ( nAttribute == ATR_MANA_MAX		 )	{	strAttribute = _STR_ATTRIBUTE_MANA_MAX			; nAttributeValue = hero.attribute[ ATR_MANA_MAX		]-(mp_tp_bonus+mp_bonus); }  
	else if ( nAttribute == ATR_STRENGTH		 )	{	strAttribute = _STR_ATTRIBUTE_STRENGTH			; nAttributeValue = hero.attribute[ ATR_STRENGTH		]-(str_tp_bonus+str_bonus); }
	else if ( nAttribute == ATR_DEXTERITY		 )	{	strAttribute = _STR_ATTRIBUTE_DEXTERITY			; nAttributeValue = hero.attribute[ ATR_DEXTERITY		]-(dex_tp_bonus+dex_bonus); }
	else											{	strAttribute = _STR_INVALID						; nAttributeValue = 0									  ; };

	//#2	
	if 		( nAttribute2 == ATR_HITPOINTS		 )	{	strAttribute2 = _STR_ATTRIBUTE_HITPOINTS			; nAttributeValue2 = hero.attribute[ ATR_HITPOINTS		 ]-(hp_tp_bonus+hp_bonus); }  
	else if ( nAttribute2 == ATR_HITPOINTS_MAX	 )	{	strAttribute2 = _STR_ATTRIBUTE_HITPOINTS_MAX		; nAttributeValue2 = hero.attribute[ ATR_HITPOINTS_MAX	 ]-(hp_tp_bonus+hp_bonus); }  
	else if ( nAttribute2 == ATR_MANA			 )	{	strAttribute2 = _STR_ATTRIBUTE_MANA				; nAttributeValue2 = hero.attribute[ ATR_MANA			 	 ]-(mp_tp_bonus+mp_bonus); }  
	else if ( nAttribute2 == ATR_MANA_MAX		 )	{	strAttribute2 = _STR_ATTRIBUTE_MANA_MAX			; nAttributeValue2 = hero.attribute[ ATR_MANA_MAX			 ]-(mp_tp_bonus+mp_bonus); }  
	else if ( nAttribute2 == ATR_STRENGTH		 )	{	strAttribute2 = _STR_ATTRIBUTE_STRENGTH			; nAttributeValue2 = hero.attribute[ ATR_STRENGTH			 ]-(str_tp_bonus+str_bonus); }
	else if ( nAttribute2 == ATR_DEXTERITY		 )	{	strAttribute2 = _STR_ATTRIBUTE_DEXTERITY			; nAttributeValue2 = hero.attribute[ ATR_DEXTERITY		 ]-(dex_tp_bonus+dex_bonus); }
	else											{	strAttribute2 = _STR_INVALID						; nAttributeValue2 = 0									  ; };
	
	//
	//	COMPOSE MESSAGE
	//
	var int		nDifference	 ;	
	var string  strDifference;  
	var string	strMessage	 ;
	//#2
	var int		nDifference2;    	
	var string  strDifference2; 
	
	nDifference 	= nValue - 	nAttributeValue;
	strDifference 	= IntToString( nDifference );

	nDifference2 	= nValue2 - 	nAttributeValue2;
	strDifference2 	= IntToString( nDifference2 );
	
	strMessage = _STR_CANNOTUSE_PRE_PLAYER;
	
	strMessage = ConcatStrings( strMessage, strDifference 			);
	strMessage = ConcatStrings( strMessage, " " 					);
	strMessage = ConcatStrings( strMessage, strAttribute 			);
	strMessage = ConcatStrings( strMessage, " " 					);	
	strMessage = ConcatStrings( strMessage, _STR_CANNOTUSE_POINTS	);
	strMessage = ConcatStrings( strMessage, _STR_CANNOTLERNSKILL_AND);
	strMessage = ConcatStrings( strMessage, strDifference 			);	
	strMessage = ConcatStrings( strMessage, " " 					);	
	strMessage = ConcatStrings( strMessage, strAttribute2 			);
	strMessage = ConcatStrings( strMessage, " " 					);	
	strMessage = ConcatStrings( strMessage, _STR_CANNOTUSE_POINTS	);	
	strMessage = ConcatStrings( strMessage, _STR_CANNOTLERNSKILL_POST );

	//
	//	PRINT MESSAGE
	//
	PutMsg(strMessage,"font_default.tga",RGBAToZColor(255,50,50,255),8*2,"");	
};

func void B_give_ore(var C_NPC typ, var int LP_Cost)
{
   // Everything went fine, take ore and lp's from hero:
   // 11:41 PM 10/15/2012 orc 
   // (bugfix: when hero don't match some conditions there is a risk
   //  of giving ore and lp to teacher and dont getting them back even
   //  if hero don't lerned skill)
   if(!C_NpcTypeIsFriend(self,typ))
   {
      msg = ConcatStrings("Odda³eœ bry³ek: ",IntToString(ORECOST_LP*LP_cost));
      PutMsg(MSG,"font_default.tga",RGBAToZColor(255,160,100,255),_TIME_MESSAGE_GIVEN,"");
      PrintScreen (msg, -1,_YPOS_MESSAGE_GIVEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_GIVEN);
      Npc_RemoveInvItems(typ,itminugget,10*LP_cost);
   };	
   typ.lp = typ.lp - LP_cost;
};

func int B_GiveSkill(var C_NPC typ, var int TAL, var int NEW_Wert, var int LP_Cost, var int TEACHERMAX_WERT) //return 1
{
	var int typ_tal;
	typ_tal = Npc_GetTalentValue(typ, TAL);
	var int tal_val;
	tal_val = typ_tal+LP_Cost;
	var int MAX_WERT;
	// ---------- Umwandeln von var in const
	var int TAL_Wert; 
	var string msg;	
	if 		(TAL == NPC_TALENT_1H)			{	MAX_WERT=100;	TAL_Wert = Npc_GetTalentValue(typ, NPC_TALENT_1H		);	}
	else if (TAL == NPC_TALENT_2H)			{	MAX_WERT=100;	TAL_Wert = Npc_GetTalentValue(typ, NPC_TALENT_2H		);	}	
	else if (TAL == NPC_TALENT_BOW)			{	MAX_WERT=100;	TAL_Wert = Npc_GetTalentValue(typ, NPC_TALENT_BOW		);	}
	else if (TAL == NPC_TALENT_CROSSBOW)	{	MAX_WERT=100;	TAL_Wert = Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW	);	}
	else if (TAL == NPC_TALENT_PICKLOCK)	{	MAX_WERT=999;	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_PICKLOCK	);	}
	else if (TAL == NPC_TALENT_PICKPOCKET)	{	MAX_WERT=999;	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_PICKPOCKET);	}
	else if (TAL == NPC_TALENT_EVASION)		{	MAX_WERT=999;	TAL_Wert =HERO_EVASION_LEVEL;								}	
	else if (TAL == HACK_NPC_TALENT_MAGE)	{	MAX_WERT=999;	TAL_Wert = Npc_GetAivar(typ,TALENT_MAGIC_CIRCLE);					}
	else if (TAL == NPC_TALENT_SMITH)		{	MAX_WERT=100;	TAL_Wert = Npc_GetTalentValue(typ, NPC_TALENT_SMITH);		}
	else if (TAL == NPC_TALENT_REGEN_HP)	{	MAX_WERT=999;	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_REGEN_HP);	}
	else if (TAL == NPC_TALENT_REGEN_MP)	{	MAX_WERT=999;	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_REGEN_MP);	}
	else if (TAL == NPC_TALENT_ALCHEMY)		{	MAX_WERT=100;	TAL_Wert = Npc_GetTalentValue(typ, NPC_TALENT_ALCHEMY	);	};
	
	if(TAL_Wert+LP_Cost>MAX_WERT)
	{
		B_Say (self, typ, "$NOLEARNOVERMAX");
		
		return FALSE;
	}		
	else if(TAL_Wert+LP_Cost>TEACHERMAX_WERT)
	{
		PutMsg(ConcatStrings (PRINT_NoLearnOverPersonalMAX, IntToString(TEACHERMAX_WERT)),"font_default.tga",RGBAToZColor(255,50,50,255),8*2,"");	
		B_Say (self, typ, "$NOLEARNYOUREBETTER");
		
		return FALSE;
	}
	else
	{
		// ----------- Bedingungen/LP checken, dann ggf. vergeben
		// if ((TAL_Wert) >= NEW_Wert)
		// {	
		/*if (typ_tal+lp_cost > typ_tal)&&((TAL == NPC_TALENT_1H)||(TAL == NPC_TALENT_2H)||(TAL == NPC_TALENT_BOW)||(TAL == NPC_TALENT_CROSSBOW))		
		{
				PrintScreen	(ConcatStrings("Ten nauczyciel nie nauczy cie wiecej ni¿: ",IntToString(typ_tal)) , -1,35,"FONT_OLD_10_WHITE.TGA",3);
		}
		else */if (typ.lp >= LP_cost)
		{
			if(C_NpcTypeIsFriend(self,typ))||((!C_NpcTypeIsFriend(self,typ))&&(Npc_HasItems(typ,itminugget)>=10*LP_Cost))
			{
				if (tal == NPC_TALENT_1H)			
				{	
					if(Math_Round((tal_val)/2) <= typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus))&&(tal_val <= typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus))&&(Npc_GetTalentValue(typ, NPC_TALENT_1H)+LP_cost<=100)
					{
						if (LP_cost == 1)
						{
							if (Npc_GetTalentValue(typ, NPC_TALENT_1H) == 29)
							{
								//TODO This text won't refresh after reset of gothic (bugfixes add)
								TXT_TALENTS_SKILLS [1]	=	     	" adept| adept| adept";
								Npc_SetTalentSkill(typ, NPC_TALENT_1H, 1);	
								PutMsg("Zosta³eœ adeptem w pos³ugiwaniu siê broni¹ jednorêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else if (Npc_GetTalentValue(typ, NPC_TALENT_1H) == 59)
							{
								TXT_TALENTS_SKILLS [1]	=	     	" mistrz| mistrz| mistrz";
								Npc_SetTalentSkill(typ, NPC_TALENT_1H, 2);	
								PutMsg("Zosta³eœ mistrzem w pos³ugiwaniu siê broni¹ jednorêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else
							{
								PutMsg("Nauka walki broni¹ jednorêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							};
						}
						else if (LP_cost == 5)
						{
							if (Npc_GetTalentValue(typ, NPC_TALENT_1H) >= 25 )&&(Npc_GetTalentValue(typ, NPC_TALENT_1H) <= 29 )
							{
								TXT_TALENTS_SKILLS [1]	=	     	" adept| adept| adept";
								Npc_SetTalentSkill(typ, NPC_TALENT_1H, 1);	
								PutMsg("Zosta³eœ adeptem w pos³ugiwaniu siê broni¹ jednorêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else if (Npc_GetTalentValue(typ, NPC_TALENT_1H) >= 55)&&(Npc_GetTalentValue(typ, NPC_TALENT_1H) <= 59 )
							{
								TXT_TALENTS_SKILLS [1]	=	     	" mistrz| mistrz| mistrz";
								Npc_SetTalentSkill(typ, NPC_TALENT_1H, 2);	
								PutMsg("Zosta³eœ mistrzem w pos³ugiwaniu siê broni¹ jednorêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else
							{
								PutMsg("Nauka walki broni¹ jednorêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							};
						};
                  
                  B_give_ore(typ, LP_Cost);
						Npc_SetTalentValue(typ, NPC_TALENT_1H, tal_val);
					}
					else
					{
						if(tal_val > typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus))
						{
							G_CanNotLern(ATR_STRENGTH,tal_val);		
							return 0;
						}
						else if(Math_Round((tal_val)/2) > typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus))
						{
							G_CanNotLern(ATR_DEXTERITY,Math_Round((tal_val)/2));	
							return 0;	
						}
						else
						{
							G_CanNotLernMulti(ATR_STRENGTH,tal_val,ATR_DEXTERITY,Math_Round((tal_val)/2));		
							return 0;	
						};
					};
				};	
				if (tal == NPC_TALENT_2H)			
				{
					if(Math_Round((tal_val)/2) <= typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus))&&(tal_val <= typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus))&&(Npc_GetTalentValue(typ, NPC_TALENT_2h)+LP_cost<=100)
					{
						if (LP_cost == 1)
						{
							if (Npc_GetTalentValue(typ, NPC_TALENT_2h) == 29)
							{
								TXT_TALENTS_SKILLS [2]	=	     	" adept| adept| adept";
								Npc_SetTalentSkill(typ, NPC_TALENT_2h, 1);	
								PutMsg("Zosta³eœ adeptem w pos³ugiwaniu siê broni¹ dwurêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else if (Npc_GetTalentValue(typ, NPC_TALENT_2h) == 59)
							{
								TXT_TALENTS_SKILLS [2]	=	     	" mistrz| mistrz| mistrz";
								Npc_SetTalentSkill(typ, NPC_TALENT_2h, 2);	
								PutMsg("Zosta³eœ mistrzem w pos³ugiwaniu siê broni¹ dwurêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else
							{
								PutMsg("Nauka walki broni¹ dwurêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							};
						}
						else if (LP_cost == 5)
						{
							if (Npc_GetTalentValue(typ, NPC_TALENT_2h) >= 25 )&&(Npc_GetTalentValue(typ, NPC_TALENT_2h) <= 29 )
							{
								TXT_TALENTS_SKILLS [2]	=	     	" adept| adept| adept";
								Npc_SetTalentSkill(typ, NPC_TALENT_2h, 1);	
								PutMsg("Zosta³eœ adeptem w pos³ugiwaniu siê broni¹ dwurêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else if (Npc_GetTalentValue(typ, NPC_TALENT_2h) >= 55)&&(Npc_GetTalentValue(typ, NPC_TALENT_2h) <= 59 )
							{
								TXT_TALENTS_SKILLS [2]	=	     	" mistrz| mistrz| mistrz";						
								Npc_SetTalentSkill(typ, NPC_TALENT_2h, 2);	
								PutMsg("Zosta³eœ mistrzem w pos³ugiwaniu siê broni¹ dwurêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else
							{
								PutMsg("Nauka walki broni¹ dwurêczn¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							};
						};
                  
                  B_give_ore(typ, LP_Cost);
						Npc_SetTalentValue(typ, NPC_TALENT_2h, tal_val);
					}
					else
					{
						if(Npc_GetTalentValue(typ, NPC_TALENT_2h)+LP_cost>100)
						{
							B_Say (self, typ, "$NoLearnOverMax");
							return 0;
						}
						else if(tal_val > typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus))
						{
							G_CanNotLern(ATR_STRENGTH,tal_val);	
							return 0;	
						}
						else if(Math_Round((tal_val)/2) > typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus))
						{
							G_CanNotLern(ATR_DEXTERITY,Math_Round((tal_val)/2));	
							return 0;
						}
						else
						{
							G_CanNotLernMulti(ATR_STRENGTH,tal_val,ATR_DEXTERITY,Math_Round((tal_val)/2));
							return 0;		
						};
					};
				};	
				if (tal == NPC_TALENT_BOW)			
				{	
					if(Math_Round((tal_val)/2) <= typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus))&&(tal_val <= typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus))&&(Npc_GetTalentValue(typ, NPC_TALENT_BOW)+LP_cost<=100)
					{
						if (LP_cost == 1)
						{
							if (Npc_GetTalentValue(typ, NPC_TALENT_BOW) == 29)
							{
								TXT_TALENTS_SKILLS [3]	=	     	" adept| adept| adept";			
								Npc_SetTalentSkill(typ, NPC_TALENT_BOW, 1);	
								PutMsg("Zosta³eœ adeptem w pos³ugiwaniu siê ³ukiem!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else if (Npc_GetTalentValue(typ, NPC_TALENT_BOW) == 59)
							{
								TXT_TALENTS_SKILLS [3]	=	     	" mistrz| mistrz| mistrz";		
								Npc_SetTalentSkill(typ, NPC_TALENT_BOW, 2);	
								PutMsg("Zosta³eœ mistrzem w pos³ugiwaniu siê ³ukiem!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else
							{
								PutMsg("Nauka strzelania ³ukiem!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							};
						}
						else if (LP_cost == 5)
						{
							if (Npc_GetTalentValue(typ, NPC_TALENT_BOW) >= 25 )&&(Npc_GetTalentValue(typ, NPC_TALENT_BOW) <= 29 )
							{
								TXT_TALENTS_SKILLS [3]	=	     	" adept| adept| adept";	
								Npc_SetTalentSkill(typ, NPC_TALENT_BOW, 1);	
								PutMsg("Zosta³eœ adeptem w pos³ugiwaniu siê ³ukiem!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else if (Npc_GetTalentValue(typ, NPC_TALENT_BOW) >= 55)&&(Npc_GetTalentValue(typ, NPC_TALENT_BOW) <= 59 )
							{
								TXT_TALENTS_SKILLS [3]	=	     	" mistrz| mistrz| mistrz";		
								Npc_SetTalentSkill(typ, NPC_TALENT_BOW, 2);	
								PutMsg("Zosta³eœ mistrzem w pos³ugiwaniu siê ³ukiem!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else
							{
								PutMsg("Nauka strzelania ³ukiem!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							};
						};
                  
                  B_give_ore(typ, LP_Cost);
						Npc_SetTalentValue(typ, NPC_TALENT_BOW, tal_val);
					}
					else
					{
						if(Npc_GetTalentValue(typ, NPC_TALENT_BOW)+LP_cost>100)
						{
							B_Say (self, typ, "$NoLearnOverMax");
							return 0;
						}
						else if(tal_val > typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus))
						{
							G_CanNotLern(ATR_DEXTERITY,tal_val);
							return 0;
						}
						else if(Math_Round((tal_val)/2) > typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus))
						{
							G_CanNotLern(ATR_STRENGTH,Math_Round((tal_val)/2));	
							return 0;
						}
						else
						{
							G_CanNotLernMulti(ATR_DEXTERITY,tal_val,ATR_STRENGTH,Math_Round((tal_val)/2));	
							return 0;	
						};
					};
				};
				//////////////////////////////////////////////////////////////////////
				if (tal == NPC_TALENT_CROSSBOW)			
				{	
					if(Math_Round((tal_val)/2) <= typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus))&&(tal_val <= typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus))&&(Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW)+LP_cost<=100)
					{
						if (LP_cost == 1)
						{
							if (Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW) == 29)
							{
								TXT_TALENTS_SKILLS [4]	=	     	" adept| adept| adept";	
								Npc_SetTalentSkill(typ, NPC_TALENT_CROSSBOW, 1);	
								PutMsg("Zosta³eœ adeptem w pos³ugiwaniu siê kusz¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else if (Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW) == 59)
							{
								TXT_TALENTS_SKILLS [4]	=	     	" mistrz| mistrz| mistrz";	
								Npc_SetTalentSkill(typ, NPC_TALENT_CROSSBOW, 2);	
								PutMsg("Zosta³eœ mistrzem w pos³ugiwaniu siê kusz¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else
							{
								PutMsg("Nauka strzelania kusz¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							};
						}
						else if (LP_cost == 5)
						{
							if (Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW) >= 25 )&&(Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW) <= 29 )
							{
								TXT_TALENTS_SKILLS [4]	=	     	" adept| adept| adept";	
								Npc_SetTalentSkill(typ, NPC_TALENT_CROSSBOW, 1);	
								PutMsg("Zosta³eœ adeptem w pos³ugiwaniu siê kusz¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else if (Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW) >= 55)&&(Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW) <= 59 )
							{
								TXT_TALENTS_SKILLS [4]	=	     	" mistrz| mistrz| mistrz";	
								Npc_SetTalentSkill(typ, NPC_TALENT_CROSSBOW, 2);	
								PutMsg("Zosta³eœ mistrzem w pos³ugiwaniu siê kusz¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							}
							else
							{
								PutMsg("Nauka strzelania kusz¹!","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
							};
						};
                  
                  B_give_ore(typ, LP_Cost);
						Npc_SetTalentValue(typ, NPC_TALENT_CROSSBOW, tal_val);
					}
					else
					{
						if(Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW)+LP_cost>100)
						{
							B_Say (self, typ, "$NoLearnOverMax");
							return 0;
						}
						else if(tal_val > typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus))
						{
							G_CanNotLern(ATR_DEXTERITY,tal_val);	
							return 0;
						}
						else if(Math_Round((tal_val)/2) > typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus))
						{
							G_CanNotLern(ATR_STRENGTH,Math_Round((tal_val)/2));	
							return 0;
						}
						else
						{
							G_CanNotLernMulti(ATR_DEXTERITY,tal_val,ATR_STRENGTH,Math_Round((tal_val)/2));	
							return 0;
						};
					};		
				};

				if (tal == NPC_TALENT_PICKLOCK)
				{
					Npc_SetTalentSkill(typ, NPC_TALENT_PICKLOCK, NEW_Wert);
					Npc_SetTalentValue(typ, NPC_TALENT_PICKLOCK, Npc_GetTalentValue(typ, NPC_TALENT_PICKLOCK)-40);
					PutMsg("Nauka: otwieranie zamków","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
               B_give_ore(typ, LP_Cost);
					B_SetSkillValuesBasedOnAttribute(typ,ATR_DEXTERITY);
				}
				else if (tal == NPC_TALENT_PICKPOCKET)
				{
					Npc_SetTalentSkill(typ, NPC_TALENT_PICKPOCKET, NEW_Wert);
					Npc_SetTalentValue(typ, NPC_TALENT_PICKPOCKET, Npc_GetTalentValue(typ, NPC_TALENT_PICKPOCKET)-40);
					PutMsg("Nauka: kradzie¿ kieszonkowa","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
               B_give_ore(typ, LP_Cost);
					B_SetSkillValuesBasedOnAttribute(typ,ATR_DEXTERITY);			
				}
				else if (tal == NPC_TALENT_EVASION)
				{
					//Npc_SetTalentSkill(typ, NPC_TALENT_EVASION, 1);
					HERO_EVASION_LEVEL=NEW_Wert;
					if(NEW_Wert==1)
					{
						TXT_TALENTS_SKILLS [NPC_TALENT_EVASION] = " adept| adept| adept| adept| adept| adept| adept";
					}
					else
					{
						TXT_TALENTS_SKILLS [NPC_TALENT_EVASION] = " mistrz| mistrz| mistrz| mistrz| mistrz| mistrz| mistrz";					
					};
					B_SetSkillValuesBasedOnAttribute(typ,ATR_DEXTERITY);	
               B_give_ore(typ, LP_Cost);
					PutMsg("Nauka: uniki","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
				}
				else if (tal == NPC_TALENT_ALCHEMY)
				{
					if(Math_Round(tal_val) <= typ.attribute[ATR_MANA_MAX]-(mp_tp_bonus+mp_bonus))
					{		
						// 						if(Npc_GetTalentValue(typ, NPC_TALENT_ALCHEMY)==0)
						// 						{
						TXT_TALENTS_SKILLS [NPC_TALENT_ALCHEMY] = " Tak| Tak";
						// 						};		
						Npc_SetTalentValue(typ, NPC_TALENT_ALCHEMY, tal_val);
						B_give_ore(typ, LP_Cost);
						PutMsg("Nauka: alchemia","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
					}
					else
					{
						G_CanNotLern(ATR_MANA_MAX,tal_val);		
						return 0;
					};				
				}
				else if (tal == NPC_TALENT_SMITH)
				{
					if(Math_Round((tal_val)/2) <= typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus))&&(tal_val <= typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus))
					{

						TXT_TALENTS_SKILLS [NPC_TALENT_SMITH] = " Tak| Tak";
						Npc_SetTalentValue(typ, NPC_TALENT_SMITH, tal_val);
                  B_give_ore(typ, LP_Cost);
						PutMsg("Nauka: kowalstwo","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
					}
					else
					{
						if(tal_val > typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus))
						{
							G_CanNotLern(ATR_STRENGTH,tal_val);		
							return 0;
						}
						else if(Math_Round((tal_val)/2) > typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus))
						{
							G_CanNotLern(ATR_DEXTERITY,Math_Round((tal_val)/2));
							return 0;			
						}
						else
						{
							G_CanNotLernMulti(ATR_STRENGTH,tal_val,ATR_DEXTERITY,Math_Round((tal_val)/2));
							return 0;
						};
					};
				}
				else if (tal == NPC_TALENT_REGEN_MP)
				{
					Npc_SetTalentSkill(typ, NPC_TALENT_REGEN_MP, NEW_Wert);
					PutMsg("Nauka: regeneracja many","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
               B_give_ore(typ, LP_Cost);
					B_SetSkillValuesBasedOnAttribute(typ,ATR_MANA_MAX);		
				}
				else if (tal == NPC_TALENT_REGEN_HP)
				{
					Npc_SetTalentSkill(typ, NPC_TALENT_REGEN_HP, NEW_Wert);
					PutMsg("Nauka: regeneracja ¿ycia","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
               B_give_ore(typ, LP_Cost);
					B_SetSkillValuesBasedOnAttribute(typ,ATR_STRENGTH);			
				}			
				else
				{
					return 0;
				};
			}
			else
			{
				PutMsg("Nie masz wystarczaj¹cej iloœci rudy!","font_default.tga",RGBAToZColor(255,100,100,255),_TIME_MESSAGE_GIVEN,"");				
				return FALSE;	
			};	
		}	
		else 
		{
			PutMsg("Za ma³o punktów nauki!","font_default.tga",RGBAToZColor(255,50,50,255),8*2,"");				
			B_Say (self, typ, "$NOLEARNNOPOINTS");
			return 0;
		};
	};
};	

//-----------------------------
// HACK -- -- -- -- -- -- -- --
//tal set to NEW_Wert!!!!!!! --
//-----------------------------

func int Hack_B_GiveSkill(var C_NPC typ, var int TAL, var int NEW_Wert, var int LP_Cost, var int TEACHERMAX_WERT) //return 1 
{
	var int typ_tal;
	typ_tal = Npc_GetTalentValue(typ, TAL);
	// ---------- Umwandeln von var in const
	var int TAL_Wert; 
	var int MAX_WERT;
	if (TAL == HACK_NPC_TALENT_MAGE)				{MAX_WERT = 6;			TAL_Wert = Npc_GetAivar(typ,TALENT_MAGIC_CIRCLE);					}
	else if (TAL == HACK_NPC_TALENT_SNEAK)			{MAX_WERT = 1+LP_COST;	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_SMITH);		}
	else if (TAL == HACK_NPC_TALENT_ACROBAT)		{MAX_WERT = 1+LP_COST;	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_REGEN_MP);	}
	else if (TAL == HACK_NPC_TALENT_QUICK_LERNING)	{MAX_WERT = 2+LP_COST;	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_REGEN_MP);	}
	else if (TAL == HACK_NPC_TALENT_DUALUSING)		{MAX_WERT = 1+LP_COST;	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_REGEN_MP);	}	
	else if (TAL == HACK_NPC_TALENT_RUNESWORDUSING)	{MAX_WERT = 1+LP_COST;	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_REGEN_MP);	}		
	else if (TAL == HACK_NPC_TALENT_ITEM_CHARMER)	{MAX_WERT = 1+LP_COST;	TAL_Wert = Npc_GetTalentValue(typ, NPC_TALENT_ALCHEMY	);	};
	
	if(TAL_Wert+1>MAX_WERT)
	{
		B_Say (self, typ, "$NOLEARNOVERMAX");
		
		return FALSE;
	}		
	else if(TAL_Wert+LP_Cost>TEACHERMAX_WERT)
	{
		PrintScreen	(ConcatStrings (PRINT_NoLearnOverPersonalMAX, IntToString(TEACHERMAX_WERT)), -1, -1, _STR_FONT_ONSCREEN, 2);
		B_Say (self, typ, "$NOLEARNYOUREBETTER");
		
		return FALSE;
	}
	else
	{
		// ----------- Bedingungen/LP checken, dann ggf. vergeben
		// if ((TAL_Wert) >= NEW_Wert)
		// {	
		if (typ.lp >= LP_cost)
		{			
			if(C_NpcTypeIsFriend(self,typ))||((!C_NpcTypeIsFriend(self,typ))&&(Npc_HasItems(typ,itminugget)>=10*LP_Cost))
			{
				if (tal == HACK_NPC_TALENT_MAGE)
				{
					if(typ.attribute[ATR_MANA_MAX]-(mp_tp_bonus+mp_bonus)>=NEW_Wert*20)
					{
						Npc_SetTalentSkill(typ, NPC_TALENT_EVASION, NEW_Wert);
						Npc_SetAivar(typ,TALENT_MAGIC_CIRCLE,  NEW_Wert);
						//B_LogEntry(MANA_SKILLS,"");			
                  B_give_ore(typ, LP_Cost);
						PutMsg("Nauczy³eœ siê kolejnego krêgu magii","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
						//return 1; //Return(break) when hero gives his magic ore to Teacher (return at end of function)
					}
					else
					{
						G_CanNotLern(ATR_MANA_MAX,NEW_Wert*20);	
						return 0;
					};
					
				}
				else if (tal == HACK_NPC_TALENT_SNEAK)
				{
					if(typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus)>=40)
					{
						TALENT_SNEAK	= TRUE;//Dialog Bugfix
						
						Npc_SetTalentSkill(typ, NPC_TALENT_SMITH, 1);
						//B_LogEntry(DEX_SKILLS,"");	
                  B_give_ore(typ, LP_Cost);
						PutMsg("Nauka: skradanie","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
						//return 1; //Return(break) when hero gives his magic ore to Teacher (return at end of function)
					}
					else
					{
						G_CanNotLern(ATR_DEXTERITY,40);	
						return 0;
					};
				}
				else if (tal == HACK_NPC_TALENT_ACROBAT)
				{
					TALENT_ACROBAT	= TRUE;
					Npc_SetTalentSkill(typ, NPC_TALENT_ALCHEMY, 1);
					//B_LogEntry(MISC_SKILLS,"");					
               B_give_ore(typ, LP_Cost);
					PutMsg("Nauka: akrobatyka","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
					//return 1; //Return(break) when hero gives his magic ore to Teacher (return at end of function)
				}
				else if (tal == HACK_NPC_TALENT_QUICK_LERNING)
				{
					TALENT_QUICK_LERNING = New_Wert;
					//B_LogEntry(MISC_SKILLS,"");			
               B_give_ore(typ, LP_Cost);               
					PutMsg("Nauka: szybka nauka","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
					//return 1; //Return(break) when hero gives his magic ore to Teacher (return at end of function)
				}	
				else if (tal == HACK_NPC_TALENT_ITEM_CHARMER)
				{
					TALENT_ITEM_CHARMER = New_Wert;
					//B_LogEntry(MISC_SKILLS,"");		
               B_give_ore(typ, LP_Cost);
					PutMsg("Nauka: zaklinanie","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
					//return 1; //Return(break) when hero gives his magic ore to Teacher (return at end of function)
				}				
				else if (tal == HACK_NPC_TALENT_DUALUSING)
				{
					if(Npc_GetTalentValue(typ, NPC_TALENT_1H)>=60)&&(Npc_GetTalentValue(typ,NPC_TALENT_1H)>=60)
					{
						TALENT_DUALUSING = TRUE;
						//B_LogEntry(STR_SKILLS,"");	
                  B_give_ore(typ, LP_Cost);
						PutMsg("Nauka: miecze oburêczne","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
						//return 1; //Return(break) when hero gives his magic ore to Teacher (return at end of function)
					}
					else
					{	
						
						if(Npc_GetTalentValue(typ, NPC_TALENT_2H)<=60)
						{	
							msg = "Brakuje ci ";		
							msg = concatstrings(msg,IntToString(60-Npc_GetTalentValue(typ, NPC_TALENT_2H)));	
							msg = concatstrings(msg,"% walki broni¹ dwurêczna, by nauczyæ siê tej umiejêtnoœci.");	
							PutMsg(msg,"font_default.tga",RGBAToZColor(255,100,100,255),_TIME_MESSAGE_GIVEN,"");
							return 0;				
						};
						if(Npc_GetTalentValue(typ, NPC_TALENT_1H)<=60)
						{
							msg = "Brakuje ci ";		
							msg = concatstrings(msg,IntToString(60-Npc_GetTalentValue(typ, NPC_TALENT_1H)));	
							msg = concatstrings(msg,"% walki broni¹ jednorêczn¹, by nauczyæ siê tej umiejêtnoœci.");							
							PutMsg(msg,"font_default.tga",RGBAToZColor(255,100,100,255),_TIME_MESSAGE_GIVEN,"");
							return 0;								
						};
						
					};
				}		
				else if (tal == HACK_NPC_TALENT_RUNESWORDUSING)
				{
					TALENT_RUNESWORDUSING = TRUE;
					//B_LogEntry(MISC_SKILLS,"");			
               B_give_ore(typ, LP_Cost);               
					PutMsg("Nauka: miecz runiczny","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
					//return 1; //Return(break) when hero gives his magic ore to Teacher (return at end of function)
				}							
				else
				{
					return 0;
				};
			}
			else
			{
				PutMsg("Nie masz wystarczaj¹cej iloœci rudy!","font_default.tga",RGBAToZColor(255,100,100,255),_TIME_MESSAGE_GIVEN,"");				
				return 0;	
			};	
		}	
		else 
		{
			PutMsg("Za ma³o punktów nauki!","font_default.tga",RGBAToZColor(255,50,50,255),8*2,"");			
			B_Say (self, typ, "$NOLEARNNOPOINTS");
			return 0;
		};
	};
   
   return true;
};


