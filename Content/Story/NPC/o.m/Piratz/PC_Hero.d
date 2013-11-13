
INSTANCE PC_Hero(NPC_DEFAULT)

{
	//-------- primary data --------		
	name 			= "Rick";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_PIR;
	level			= 0;
	voice			= 5;
	id				= 0;
	
	//------------------------------
	exp				= 0;
	exp_next		= 500;
	lp				= 0;
	//------------------------------
	Mdl_SetModelScale			(self,1.0,1.0,1.0); 
	
	//--------- abilities --------
 
	attribute[ATR_MANA_MAX] 	=	10;
	attribute[ATR_MANA] 		=	10;
	attribute[ATR_HITPOINTS_MAX]=	self.level*15+90;    
	attribute[ATR_HITPOINTS] 	=	self.level*15+90;    
	attribute[ATR_STRENGTH] 	=	15;   //15  
	attribute[ATR_DEXTERITY] 	=	15;   //15     	
// 	attribute[ATR_REGENERATEHP] 	=	1;  
// 	attribute[ATR_REGENERATEMANA] 	=	1;  	 //15     	
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
//	Mdl_SetVisualBody (self,"HUM_BODY_NAKED0",9,1,"Hum_Head_Bald",221,0,-1);
	Mdl_SetVisualBody (self,"HUM_BODY_NAKED0",0,1,"Hum_Head_Fighter",340,1,PIR_ARMOR_Rick);
	
	//-------- talents --------
//	Npc_SetTalentSkill		( self,HACK_NPC_TALENT_SNEAK,1);	
//	Npc_SetTalentSkill		(self,NPC_TALENT_1H,2);


 /*	
 	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
 	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  6);	
 	
	   	Npc_SetTalentValue(self,NPC_TALENT_2H,2); 
  		Npc_SetTalentValue(self,NPC_TALENT_1H,70); 
 	 	Npc_SetTalentValue(self,NPC_TALENT_2H,70); 
   		Npc_SetTalentValue(self,NPC_TALENT_BOW,80); 
   		Npc_SetTalentValue(self,NPC_TALENT_CROSSBOW,80); 	
	  	Npc_SetTalentValue(self,NPC_TALENT_SMITH,66); 
	  	Npc_SetTalentValue(self,NPC_TALENT_ALCHEMY,66); 	
 	

	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,2);
	
//	CreateInvItems (self,Bloody_Claws,1); 	
	
		
// 	CreateInvItems 	(self,ItFo_Plants_mushroom_01,20);		
 	CreateInvItems (self,ItMiNugget,464); 
 	CreateInvItems (self,ItAmFireArrow,450); 	
 	CreateInvItems (self,ItAmPoisonArrow,230); 
 	CreateInvItems (self,ItAmArrow,115); 
// 	CreateInvItems 	(self,RESPAWNBOOK,1);	
// 	CreateInvItems 	(self,ART_STORYBOOK,1);	
// 	
 	CreateInvItems (self,ItAmFireBolt,140); 	
 	CreateInvItems (self,ItAmIceBolt,140); 	
// 	CreateInvItems (self,Recept_ItMw_1H_Sword_Short_01,1); 	
// 		
 	CreateInvItem (self,GRD_ARMOR_M); 
 	CreateInvItem (self,PIR_ARMOR_M); 
 	CreateInvItem (self,HUN_ARMOR_L); 
 	CreateInvItem (self,HUN_ARMOR_M); 
 	CreateInvItem (self,HUN_ARMOR_H); 
 	CreateInvItem (self,MAG_ARMOR_L); 
// 	
// //	CreateInvItems (self,Bloody_Claws,1); 	
// 		
// 	CreateInvItems (self,itmwpickaxe,1); 		
 	CreateInvItems (self,ItAmIceBolt,101); 
 	CreateInvItems (self,ItAmBolt,401);  
// 	
   	CreateInvItems (self,ItMw_2h_runeswd_01,1); 
   	CreateInvItems (self,ItMw_1h_runeswd_01,1); 
  	CreateInvItem (self,ItRw_Crossbow_02); 
  	CreateInvItem (self,ItRw_bow_long_04); 							
  	CreateInvItem (self,ItRw_bow_long_02); 							
//  	CreateInvItems (self,ItFoMuttonRaw,3); 	
//  	CreateInvItems (self,Pupil_Comander,1); 		
//  	CreateInvItems (self,ItMiFlask,4); 			 			
  	EquipItem (self,ItMw_1H_Sword_Broad_03);		
  	CreateInvItem (self,ItMw_2H_Sword_Light_03);	
//   	
  	CreateInvItem (self,Itmw_Dual_04_Right);	
//  	CreateInvItem (self,Itmw_1h_Sword_01);	
  	CreateInvItem (self,Itmw_Dual_04_Left);	
  	CreateInvItem (self,Itmw_Dual_05_Left);	
// 
//  	
  	CreateInvItem(self,ItArRuneGotoPortal);
  	CreateInvItem(self,ItArRuneCreatePortal);
	CreateInvItem(self,ItArRuneCurse);
	CreateInvItem(self,ItArRuneIceWave);
	CreateInvItem(self,ItArRuneStormFist);	
	CreateInvItem(self,ItArRuneThunder);	
	CreateInvItem(self,ItArRuneFireWall);	
	CreateInvItem(self,ItArRuneMeteor);	
	
	CreateInvItem(self,ItArRuneStuningBall);
	CreateInvItem(self,ItArRuneFirebolt);
	CreateInvItem(self,ItArRuneHolyFire);
	CreateInvItem(self,ItArScrollFirebolt);
	CreateInvItem(self,ItArRuneFirebolt);		
	CreateInvItem(self,ItArRuneLight);
	CreateInvItem(self,ItArRuneFirebolt);
	CreateInvItem(self,ItArRuneFireball);
	CreateInvItem(self,ItArRuneFirestorm);
	CreateInvItem(self,ItArRuneFireRain);
	CreateInvItem(self,ItArRunePyrokinesis);
	CreateInvItem(self,ItArRuneTeleport1);
	CreateInvItem(self,ItArRuneTeleport2);
	CreateInvItem(self,ItArRuneTeleport3);
	CreateInvItem(self,ItArRuneHeal);
	CreateInvItem(self,ItArRuneCharm);
	CreateInvItem(self,ItArRuneSleep);
	CreateInvItem(self,ItArRuneChainLightning);
	CreateInvItem(self,ItArRuneThunderbolt);
	CreateInvItem(self,ItArRuneThunderball);
	CreateInvItem(self,ItArRuneWindFist);
	CreateInvItem(self,ItArRuneIceCube);	
	CreateInvItem(self,ItArRuneMagicShield);	
	CreateInvItem(self,ItArRuneIceArmor);	
	
	
	CreateInvItem(self,ItArscrollCurse);
	CreateInvItem(self,ItArscrollIceWave);
	CreateInvItem(self,ItArscrollStormFist);	
	CreateInvItem(self,ItArscrollThunder);	
	CreateInvItem(self,ItArscrollFireWall);	
	CreateInvItem(self,ItArscrollMeteor);	
	
	CreateInvItem(self,ItArscrollStuningBall);
	CreateInvItem(self,ItArscrollFirebolt);
	CreateInvItem(self,ItArscrollHolyFire);
	CreateInvItem(self,ItArScrollFirebolt);
	CreateInvItem(self,ItArscrollFirebolt);		
	CreateInvItem(self,ItArscrollLight);
	CreateInvItem(self,ItArscrollFirebolt);
	CreateInvItem(self,ItArscrollFireball);
	CreateInvItem(self,ItArscrollFirestorm);
	CreateInvItem(self,ItArscrollFireRain);
	CreateInvItem(self,ItArscrollPyrokinesis);
	CreateInvItem(self,ItArscrollTeleport1);
	CreateInvItem(self,ItArscrollTeleport2);
	CreateInvItem(self,ItArscrollTeleport3);
	CreateInvItem(self,ItArscrollHeal);
	CreateInvItem(self,ItArscrollCharm);
	CreateInvItem(self,ItArscrollSleep);
	CreateInvItem(self,ItArscrollChainLightning);
	CreateInvItem(self,ItArscrollThunderbolt);
	CreateInvItem(self,ItArscrollThunderball);
	CreateInvItem(self,ItArscrollWindFist);
	CreateInvItem(self,ItArscrollIceCube);	
	
	
	CreateInvItems(self,ItArScrollTeleport4,20);
	CreateInvItem(self,ItArRuneTeleport5);
	  	

	  	CreateInvItems(self,ItArScrollIceWave,3);
	  	CreateInvItems(self,ItArScrollFireWall,113);
	  	
//  	
//  	
	 	CreateInvItems(self,ItFo_Potion_Spec_Immunity    ,21);	
	 	CreateInvItems(self,ItFo_Potion_Spec_Bash        ,21);
	 	CreateInvItems(self,ItFo_Potion_Spec_DoubleDamage,21);
	 	CreateInvItems(self,ItFo_Potion_Spec_MultiCast   ,21);
//  	
//  	CreateInvItem(self,ItArRuneDestroyUndead);

// //Magic Scrolls	
// // 	CreateInvItems(self,ItArScrollTrfBloodfly,20);
// // 	CreateInvItems(self,ItArScrollTrfCrawler,20);
// // 	CreateInvItems(self,ItArScrollTrfLurker,20);
// // 	CreateInvItems(self,ItArScrollTrfMeatbug,20);
// // 	CreateInvItems(self,ItArScrollTrfMolerat,20);
// // 	CreateInvItems(self,ItArScrollTrfOrcdog,20);
// // 	CreateInvItems(self,ItArScrollTrfScavenger,20);
// // 	CreateInvItems(self,ItArScrollTrfShadowbeast,20);
// // 	CreateInvItems(self,ItArScrollTrfSnapper,20);
// // 	CreateInvItems(self,ItArScrollTrfWaran,20);
// // 	CreateInvItems(self,ItArScrollTrfWolf,20);

// // 	CreateInvItems(self,ItArScrollSummonDemon,20);
//  	CreateInvItems(self,ItArScrollSummonSkeletons,1);
// // 	CreateInvItems(self,ItArScrollSummonGolem,20);
// // 	CreateInvItems(self,ItArScrollArmyOfDarkness,20);

// // //Psi-Runes
//  	CreateInvItem(self,ItArRuneWindfist);
// // 	CreateInvItem(self,ItArRuneStormfist);
// // 	CreateInvItem(self,ItArRuneTelekinesis);
// // 	CreateInvItem(self,ItArRuneCharm);
// // 	CreateInvItem(self,ItArRuneSleep);
// // 	CreateInvItem(self,ItArRunePyrokinesis);
// // 	CreateInvItem(self,ItArRuneControl);
// // 	CreateInvItem(self,ItArRuneBreathOfDeath);

 	CreateInvItem(self,ItFo_Potion_HP_3_temp);
 	CreateInvItem(self,ItFo_Potion_MP_3_temp);
 	CreateInvItem(self,ItFo_Potion_DEX_3_temp);
 	CreateInvItem(self,ItFo_Potion_Str_3_temp);
 	CreateInvItem(self,ItFo_Potion_Edg_3_temp);
 	CreateInvItem(self,ItFo_Potion_pnt_3_temp);
 	CreateInvItem(self,ItFo_Potion_fir_3_temp);
 	CreateInvItem(self,ItFo_Potion_mag_3_temp);	
 	
// 	
// //Psi-Scrolls
// 	CreateInvItems(self,ItArScrollFear,20);
// 	CreateInvItems(self,ItArScrollBerzerk,20);
// 	CreateInvItems(self,ItArScrollShrink,20);


// 	CreateInvItems(self,ItKeLockpick,20);
// 	CreateInvItems(self,ItLsTorch,20);
// 	CreateInvItems(self,ItMiNugget,100);	
 	CreateInvItems (self,ItMiBlackOre,80);	
// 	
// 	CreateInvItems (self,ItAmArrow,4); 
                                                    
	*/
	Npc_SetAivar(self,AIV_LASTHP,  self.attribute[ATR_HITPOINTS]);		
	Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);	
};
INSTANCE PC_Hero_Hair(NPC_DEFAULT)
{
	//-------- primary data --------		
	name 			= "Rick";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_PIR;
	level			= 5;
	voice			= 5;
	id				= 0;
	
	//------------------------------
	//exp				= 490;
	//exp_next		= 500;
	lp				= 999;
	//------------------------------
	
	//--------- abilities --------
 
	attribute[ATR_MANA_MAX] 	=	100;
	attribute[ATR_MANA] 		=	100;
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+900;    
	attribute[ATR_HITPOINTS] 	=	self.level*12+900;    
	attribute[ATR_STRENGTH] 	=	112;   //15  
	attribute[ATR_DEXTERITY] 	=	55;   //15     	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"HUM_BODY_NAKED0",8,1,"Hum_Head_Fighter",424,0,RBL_ARMOR_L);
	//Mdl_ApplyOverlayMds (self,"Humans_2hst3.mds"); 
	//-------- talents --------
//	Npc_SetTalentSkill		( self,HACK_NPC_TALENT_SNEAK,1);	
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);
	//Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
//Npc_SetTalentSkill(self,NPC_TALENT_1H,); 
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKPOCKET,2);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,1); 
	
	Npc_SetTalentValue(self,NPC_TALENT_2H,60); 
	Npc_SetTalentValue(self,NPC_TALENT_1H,60); 
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2); 
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2); 
	Npc_SetTalentSkill(self,NPC_TALENT_REGEN_HP,1); 
	Npc_SetTalentSkill(self,NPC_TALENT_REGEN_MP,1); 
	
	Npc_SetTalentValue(self,NPC_TALENT_BOW,10); 
	Npc_SetTalentValue(self,NPC_TALENT_CROSSBOW,10); 	
	Npc_SetTalentValue(self,NPC_TALENT_SMITH,0); 
	Npc_SetTalentValue(self,NPC_TALENT_ALCHEMY,0); 	
	
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  6);

Npc_PercEnable   	(self,PERC_ASSESSDAMAGE 	,B_HeroReactToDamage   	  	);	
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
//	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,1);
	

	//-------------------------	
	CreateInvItems 	(self,ItAt_Meatbug_01,10);	
	CreateInvItems 	(self,ItFo_Plants_mushroom_01,20);		
	CreateInvItems (self,ItMiNugget,104); 
	CreateInvItems (self,ItAmFireArrow,100); 	
	CreateInvItems (self,ItAmIceArrow,100); 
	CreateInvItems (self,ItAmArrow,100); 
	CreateInvItems (self,ItAmFireBolt,100); 	
	CreateInvItems (self,Recept_ItMw_1H_Sword_Short_01,1); 	
		
	CreateInvItem (self,RBL_ARMOR_M); 
	CreateInvItem (self,RBL_ARMOR_H); 
	CreateInvItem (self,PIR_ARMOR_L); 
	CreateInvItem (self,PIR_ARMOR_M); 
	CreateInvItem (self,HUN_ARMOR_L); 
	CreateInvItem (self,HUN_ARMOR_H); 
	CreateInvItem (self,MAG_ARMOR_L); 
	CreateInvItem (self,MAG_ARMOR_H); 				
//	CreateInvItems (self,Bloody_Claws,1); 	
		
	CreateInvItems (self,itmwpickaxe,1); 		
	CreateInvItems (self,ItAmIceBolt,10); 
	CreateInvItems (self,ItAmBolt,10);  
	CreateInvItems (self,ItRw_Bow_Small_01,5); 		
	CreateInvItems (self,ItRw_Crossbow_Old_01,1); 			
	CreateInvItems (self,ItMiScoop,3); 	
	CreateInvItems (self,ItFoMuttonRaw,3); 	
	CreateInvItems (self,ItMi_Alchemy_Sulphur_01,4); 		
	CreateInvItems (self,ItMiFlask,4); 			 			
	CreateInvItem (self,ItMw_1H_Sledgehammer_01);
	CreateInvItem (self,ItMw_2H_RuneSWD_01);		
	CreateInvItem (self,ItMw_1H_RuneSWD_01);	
	EquipItem (self,ItMw_Dual_01_Right);
	CreateInvItem (self,ItMw_Dual_01_Left);	
	CreateInvItem (self,ItMw_Dual_02_Right);
	CreateInvItem (self,ItMw_Dual_02_Left);		
	CreateInvItem (self,ItMw_Dual_03_Right);		
	CreateInvItem (self,ItMw_Dual_03_Left);	
	CreateInvItem (self,ItMw_Dual_04_Right);		
	CreateInvItem (self,ItMw_Dual_04_Left);	
	CreateInvItem (self,ItMw_Dual_05_Right);		
	CreateInvItem (self,ItMw_Dual_05_Left);	
	

	
	CreateInvItem (self,Schutzring_Feuer1);	
	CreateInvItem(self,ItArRuneLight);
	CreateInvItem(self,ItArRuneFirebolt);
	CreateInvItem(self,ItArRuneFireball);
	CreateInvItem(self,ItArRuneFirestorm);
	CreateInvItem(self,ItArRuneFireRain);
	CreateInvItem(self,ItArRuneTeleport1);
	CreateInvItem(self,ItArRuneTeleport2);
	CreateInvItem(self,ItArRuneTeleport3);
	CreateInvItems(self,ItArScrollTeleport4,20);
	CreateInvItem(self,ItArRuneTeleport5);

	CreateInvItem(self,ItArRuneHeal);
	CreateInvItem(self,ItArRuneChainLightning);
	CreateInvItem(self,ItArRuneThunderbolt);
	CreateInvItem(self,ItArRuneThunderball);
	CreateInvItem(self,ItArRuneIceCube);
	CreateInvItem(self,ItArRuneIceWave);


	CreateInvItem(self,ItArRuneDestroyUndead);

//Magic Scrolls	
	CreateInvItems(self,ItArScrollTrfBloodfly,20);
	CreateInvItems(self,ItArScrollTrfCrawler,20);
	CreateInvItems(self,ItArScrollTrfLurker,20);
	CreateInvItems(self,ItArScrollTrfMeatbug,20);
	CreateInvItems(self,ItArScrollTrfMolerat,20);
	CreateInvItems(self,ItArScrollTrfOrcdog,20);
	CreateInvItems(self,ItArScrollTrfScavenger,20);
	CreateInvItems(self,ItArScrollTrfShadowbeast,20);
	CreateInvItems(self,ItArScrollTrfSnapper,20);
	CreateInvItems(self,ItArScrollTrfWaran,20);
	CreateInvItems(self,ItArScrollTrfWolf,20);

	CreateInvItems(self,ItArScrollSummonDemon,20);
	CreateInvItems(self,ItArScrollSummonSkeletons,20);
	CreateInvItems(self,ItArScrollSummonGolem,20);
	CreateInvItems(self,ItArScrollArmyOfDarkness,20);

//Psi-Runes
	CreateInvItem(self,ItArRuneWindfist);
	CreateInvItem(self,ItArRuneStormfist);
	CreateInvItem(self,ItArRuneTelekinesis);
	CreateInvItem(self,ItArRuneCharm);
	CreateInvItem(self,ItArRuneSleep);
	CreateInvItem(self,ItArRunePyrokinesis);
	CreateInvItem(self,ItArRuneControl);
	CreateInvItem(self,ItArRuneBreathOfDeath);

//Psi-Scrolls
	CreateInvItems(self,ItArScrollFear,20);
	CreateInvItems(self,ItArScrollBerzerk,20);
	CreateInvItems(self,ItArScrollShrink,20);


	CreateInvItems(self,ItKeLockpick,20);
	CreateInvItems(self,ItLsTorch,20);
	CreateInvItems(self,ItMiNugget,1000);	
	CreateInvItems (self,ItMiBlackOre,80);		

	
};
INSTANCE PC_Hero_IO(NPC_DEFAULT)

{
	//-------- primary data --------		
	name 			= "Rick";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_NONE;
	level			= 10;
	voice			= 5;
	id				= 0;
	
	//------------------------------
	//exp				= 490;
	//exp_next		= 500;
	lp				= 10;
	//------------------------------
	
	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	45; 
	attribute[ATR_DEXTERITY] 	=	55;
	attribute[ATR_MANA_MAX] 	=	20;
	attribute[ATR_MANA] 		=	20;
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    
	attribute[ATR_HITPOINTS] 	=	self.level*12+90;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Pony",87,1,PIR_ARMOR_L);
		//-------- talents --------
	Npc_SetTalentSkill		( self,HACK_NPC_TALENT_SNEAK,1);	
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	Npc_SetTalentValue(self,NPC_TALENT_2H,45); 
	Npc_SetTalentValue(self,NPC_TALENT_1H,45); 
	Npc_SetTalentValue(self,NPC_TALENT_BOW,45); 
	Npc_SetTalentValue(self,NPC_TALENT_CROSSBOW,45); 	
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,1);
	

	//-------------------------
	//CreateInvItem 	(self,ItWr_Fire_Letter_01);
	//CreateInvItem 	(self,ItMw_1H_Warhammer_01);		
	CreateInvItems (self,ItMw_1H_Sword_Long_02,1);	
	CreateInvItems (self,ItMw_2H_Sword_Light_02,1);
	CreateInvItems (self,ItRw_Bow_Long_04,1);	
	CreateInvItems (self,ItRw_CrossBow_02,1);	
	CreateInvItems (self,ItAmArrow,100);
	CreateInvItems (self,ItAmBolt,100);			
	CreateInvItems (self,ItMiNugget,1004); 
	Npc_PercEnable   	(other,PERC_ASSESSDAMAGE 	,B_HeroReactToDamage   	  	);	
	};

INSTANCE PC_Hero_EO(NPC_DEFAULT)

{
	//-------- primary data --------		
	name 			= "Rick";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_NONE;
	level			= 30;
	voice			= 5;
	id				= 0;
	
	//------------------------------
	//exp				= 490;
	//exp_next		= 500;
	lp				= 10;
	//------------------------------
	
	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	114; 
	attribute[ATR_DEXTERITY] 	=	90;
	attribute[ATR_MANA_MAX] 	=	20;
	attribute[ATR_MANA] 		=	20;
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    
	attribute[ATR_HITPOINTS] 	=	self.level*12+90;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
//	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",87,0,PIR_ARMOR_L);
		//-------- talents --------
	Npc_SetTalentSkill		( self,HACK_NPC_TALENT_SNEAK,1);	
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);
Npc_SetTalentValue(self,NPC_TALENT_2H,100); 
Npc_SetTalentValue(self,NPC_TALENT_1H,100); 
Npc_SetTalentValue(self,NPC_TALENT_BOW,100); 
Npc_SetTalentValue(self,NPC_TALENT_CROSSBOW,100); 	
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,2);
	

	//-------------------------
	//CreateInvItem 	(self,ItWr_Fire_Letter_01);
	//CreateInvItem 	(self,ItMw_1H_Warhammer_01);		
	CreateInvItems (self,ItMw_2H_IceSword_3,1);
	CreateInvItems (self,ItMw_1H_IceSword_3,1);		
	CreateInvItems (self,ItMw_2H_Sword_Heavy_05,1);
	CreateInvItems (self,ItRw_Bow_War_02,1);	
	CreateInvItems (self,ItRw_CrossBow_04,1);	
	CreateInvItems (self,ItAmArrow,100);
	CreateInvItems (self,ItAmBolt,100);		
	CreateInvItems (self,ItMiNugget,10004); 
	CreateInvItems (self,ItLsTorchburning_2,1); 	
	Npc_PercEnable   	(other,PERC_ASSESSDAMAGE 	,B_HeroReactToDamage   	  	);	
	fight_tactic = FAI_HUMAN_MASTER;
	};		



// ***************************************************************************
// PlayerInstanz ANFANG LEVEL2!!! Mit Buddlerrüstung +10,Waffe +13,Waffe +20
// ***************************************************************************

INSTANCE PC_Hero_L2(NPC_DEFAULT)

{
	//-------- primary data --------
	name 			= "Ja";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_NONE;
	level			= 2;
	voice			= 15;
	id				= 0;
	
	//------------------------------
	exp				= 1500;
	exp_next		= 3000;
	lp				= 0;
	//------------------------------
	
	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	13;     
	attribute[ATR_DEXTERITY] 	=	10;     
	attribute[ATR_MANA_MAX] 	=	5;
	attribute[ATR_MANA] 		=	5;
	attribute[ATR_HITPOINTS_MAX]=	64;    
	attribute[ATR_HITPOINTS] 	=	64;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,VLK_ARMOR_L);

	//-------- talents --------
	//Npc_SetTalentSkill		( self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	//Npc_SetTalentSkill		( self,HACK_NPC_TALENT_SNEAK,1);	
	//Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	//Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_BOW,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,1);
	
	//-------- inventory --------
    CreateInvItem	(self,HeroSword20);
	CreateInvItems  (self,ItAmArrow,50);
	CreateInvItem 		(self,HeroSword13);
	CreateInvItem		(self,HeroBow13);
};



// ***************************************************************************
// PlayerInstanz ANFANG LEVEL 5 (Ende Kap 1) 
// ***************************************************************************

INSTANCE PC_Hero_L5(NPC_DEFAULT)

{
	//-------- primary data --------
	name 			= "Ich";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_NONE; //
	level			= 5;
	voice			= 15;
	id				= 0;

	//------------------------------
	exp				= 7500;
	exp_next		= 10500;
	lp				= 0;
		//------------------------------

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	25;     
	attribute[ATR_DEXTERITY] 	=	10;     
	attribute[ATR_MANA_MAX] 	=	5;
	attribute[ATR_MANA] 		=	5;
	attribute[ATR_HITPOINTS_MAX]=	100;    
	attribute[ATR_HITPOINTS] 	=	100;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);

	//-------- talents --------
	//Npc_SetTalentSkill		( self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	//Npc_SetTalentSkill	(self,HACK_NPC_TALENT_SNEAK,1);	
	//Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	//Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_BOW,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,1);
	
	//-------- inventory --------
	CreateInvItem	(self,HeroSword25);
	CreateInvItem	(self,HeroBow13);
	CreateInvItems  (self,ItAmArrow,50);
};

// ***************************************************************************
// PlayerInstanz LEVEL 7 (Anfang Kapitel 2) 
// ***************************************************************************
INSTANCE PC_Hero_L7(NPC_DEFAULT)
{
	//-------- primary data --------
	name 			= "Ich";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_PIR; //
	level			= 7;
	voice			= 15;
	id				= 0;

	//------------------------------
	exp				= 14000;
	exp_next		= 18000;
	lp				= 0;
		//------------------------------

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	45;     
	attribute[ATR_DEXTERITY] 	=	35;     
	attribute[ATR_MANA_MAX] 	=	20;
	attribute[ATR_MANA] 		=	20;
	attribute[ATR_HITPOINTS_MAX]=	160;    
	attribute[ATR_HITPOINTS] 	=	160;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,ORG_ARMOR_H);

	//-------- talents --------
	//Npc_SetTalentSkill		( self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	//Npc_SetTalentSkill	(self,HACK_NPC_TALENT_SNEAK,1);	
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_BOW,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,1);
	
	//-------- inventory --------
	CreateInvItem		(self,ItMw_1H_Sword_05);
	CreateInvItem		(self,ItRw_Bow_Small_04);
	CreateInvItems  (self,ItAmArrow,100);
	CreateInvItems  (self,ItMiNugget,50);
	CreateInvItem	(self,ItWrWorldmap);
	CreateInvItems  (self,ItKeLockpick,30);
	CreateInvItems  (self,ItLsTorch,20);
	CreateInvItems	(self,ItFo_Potion_Health_03,20);
	CreateInvItems	(self,ItFo_Potion_Mana_03,20);
};

// ***************************************************************************
// PlayerInstanz LEVEL 11 (Anfang Kapitel 3) 
// ***************************************************************************
INSTANCE PC_Hero_L11(NPC_DEFAULT)
{
	//-------- primary data --------
	name 			= "Ich";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_PIR; //
	level			= 11;
	voice			= 15;
	id				= 0;

	//------------------------------
	exp				= 33000;
	exp_next		= 39000;
	lp				= 0;
		//------------------------------

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	60;     
	attribute[ATR_DEXTERITY] 	=	45;     
	attribute[ATR_MANA_MAX] 	=	50;
	attribute[ATR_MANA] 		=	50;
	attribute[ATR_HITPOINTS_MAX]=	220;    
	attribute[ATR_HITPOINTS] 	=	220;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,SLD_ARMOR_H);

	//-------- talents --------
	//Npc_SetTalentSkill		( self,NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	//Npc_SetTalentSkill	(self,HACK_NPC_TALENT_SNEAK,1);	
	Npc_SetTalentSkill		( self,NPC_TALENT_PICKLOCK,1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);
	//Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,1);
	//Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,1);
	
	//-------- inventory --------
	CreateInvItem		(self,ItMw_1H_Sword_Long_05);
	CreateInvItem		(self,ItRw_Bow_Long_02);
	CreateInvItems  (self,ItAmArrow,100);
	CreateInvItems  (self,ItMiNugget,400);
	CreateInvItems  (self,ItKeLockpick,30);
	CreateInvItems  (self,ItLsTorch,20);
};

// ***************************************************************************
// MOD_ITEMMASTER
// ***************************************************************************
INSTANCE MOD_ITEMMASTER(NPC_DEFAULT)
{
	//-------- primary data --------
//	name 			= "ITEMMASTER - nie dotykaæ!";
	Npctype			= Npctype_Main;
	guild			= GIL_PIR; //
	level			= 13;
	voice			= 15;
	id				= 66660;
	flags       =   NPC_FLAG_IMMORTAL;
	exp				= 14000;
	exp_next		= 18000;
	//------------------------------

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	45;     
	attribute[ATR_DEXTERITY] 	=	35;     
	attribute[ATR_MANA_MAX] 	=	20;
	attribute[ATR_MANA] 		=	20;
	attribute[ATR_HITPOINTS_MAX]=	160;    
	attribute[ATR_HITPOINTS] 	=	160;    
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,ORG_ARMOR_H);

};

// ***************************************************************************
// Testwaffen
// ***************************************************************************

instance HeroSword13 (C_Item)
{	
	name 				=	"worn out sword";//Rostiges Schwert

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	27;

	damage 				= 	13;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;		
	
	visual 				=	"ItMw1hSwordold01.3DS";
};

INSTANCE HeroSword20 (C_Item)
{	
	name 				=	"sword";//Schwert

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	31;

	damage 				= 	20;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		
	
	visual 				=	"ItMw1hSword01.3DS";
};

INSTANCE HeroSword25 (C_Item)
{	
	name 				=	"sword";//Schwert

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	31;

	damage 				= 	25;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		
	
	visual 				=	"ItMw1hSword01.3DS";
};

INSTANCE HeroBow13 (C_Item)
{	
	name 					=	"Longbow";//Langbogen

	mainflag 				=	ITEM_KAT_FF;
	flags 					=	ITEM_BOW;	
	material 				=	MAT_WOOD;

	value 					=	35;

	damage 					=	13;
	damagetype				=	DAM_POINT;
	munition				=	ItAmArrow;
	
	visual 					=	"ItRwLongbow.mms";
};






// *********** NICHT LÖSCHEN - SONST STERBEN **************


INSTANCE XP_Map(C_Item)
{	
	name 					=	"XP Map";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	1000;

	visual 					=	"ItWr_Map_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_XP_Map;
};

FUNC VOID Use_XP_Map()
{
	CreateInvItems(self,ItMiNugget,1000);
	hero.lp = hero.lp + 20;
	
	PRINTScreen	("+1000 Erz",-1,40,"font_10_book.tga",10);
};



INSTANCE Hero_mirror(NPC_DEFAULT)

{
	//-------- primary data --------		
	name 			= "";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_PIR;
	level			= 1;
	voice			= 5;
	id				= 0;
	
	//------------------------------
	//exp				= 500;
	exp_next		= 1500;
	lp				=0;
	//------------------------------
	Mdl_SetModelScale	(self,-1.0,-1.0,1.0); 
	
	//--------- abilities --------
 
	attribute[ATR_MANA_MAX] 	=	999;
	attribute[ATR_MANA] 		=	999;
	attribute[ATR_HITPOINTS_MAX]=	90;    
	attribute[ATR_HITPOINTS] 	=	90;    
	attribute[ATR_STRENGTH] 	=	615;   //15  
	attribute[ATR_DEXTERITY] 	=	665;   //15     	

	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_SetVisualBody (self,"HUM_BODY_NAKED0",0,1,"Hum_Head_Fighter",340,1,PIR_ARMOR_Rick);
};

instance PC_Hero_Dream01 (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	guild 		=		GIL_NONE;
	level 		=		9;

	voice 		=		5;
	id 			=		1327;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	50;
	attribute[ATR_DEXTERITY] 		=	50;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	136;
	attribute[ATR_HITPOINTS] 		=	136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Bald",29,1,NOV_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	

	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self,ItMw_1H_Axe_Old_01);
	//CreateInvItem (self,ItFoSoup);
	//CreateInvItem (self,ItMiJoint);
	
	//-------------Daily Routine-------------
	Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,TRUE);
	wp = "PSI_31_HUT_IN";
};

INSTANCE PC_Hero_AlterEgo(NPC_DEFAULT)
{
	//-------- primary data --------		
	name 			= "Rick";
	Npctype			= NPCTYPE_ambient;
	guild			= GIL_PIR;
	level			= 0;
	voice			= 5;
	id				= 1702;
	
	//------------------------------
	exp				= 0;
	exp_next		= 500;
	lp				= 0;
	//------------------------------
	Mdl_SetModelScale			(self,1.0,1.0,1.0); 
	
	//--------- abilities --------
 
	attribute[ATR_MANA_MAX] 	=	10;
	attribute[ATR_MANA] 		=	10;
	attribute[ATR_HITPOINTS_MAX]=	self.level*15+90;    
	attribute[ATR_HITPOINTS] 	=	self.level*15+90;    
	attribute[ATR_STRENGTH] 	=	15;   //15  
	attribute[ATR_DEXTERITY] 	=	15;   //15     	   	
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex

	Mdl_SetVisualBody (self,"HUM_BODY_NAKED0",0,1,"Hum_Head_Fighter",340,1,PIR_ARMOR_Rick);
	
	Npc_SetAivar(self,AIV_LASTHP,self.attribute[ATR_HITPOINTS]);	
	Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,TRUE);
   
   daily_routine = Rtn_start_1702;
};

FUNC VOID Rtn_start_1702 ()
{
	TA_Stand(06,00,08,00,"ESCAPE_MIDDLE2");	
	TA_Stand(08,00,06,00,"ESCAPE_MIDDLE2");	
};
