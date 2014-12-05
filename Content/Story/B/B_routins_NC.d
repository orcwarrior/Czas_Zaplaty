/****************************
Rutyny dla BNów z Nowego Obozu
*****************************/

/********************
Rutyny po powrocie Lee do NO
**********************/

func void B_NC_LeeBack()
{
   B_kill_in_EN();
   
   var C_NPC kam; kam = Hlp_GetNpc(GRD_2512_Kam);
   if (!Npc_isDead(kam))
   {
      B_KillNpc(GRD_2512_Kam);
   };
   
   B_ExchangeRoutine(kirgo, "OC");
//NC_RICELORD_SIT - SLD_700_Lee NC1

	var C_NPC n1; n1 = Hlp_GetNpc(SLD_700_Lee);
	Npc_ExchangeRoutine	(n1, "NC1");

//NC_RICEBUNKER_10 - SLD_701_Orik  nc1

	var C_NPC n2; n2 = Hlp_GetNpc(SLD_701_Orik);
	Npc_ExchangeRoutine	(n2, "NC1");

//NC_RICELORD - SLD_709_Cord  nc1

	var C_NPC n3; n3 = Hlp_GetNpc(SLD_709_Cord);
	Npc_ExchangeRoutine	(n3, "NC1");
	
//NC_PATH53 - SLV_907_Lares   nc1

	var C_NPC n4; n4 = Hlp_GetNpc(SLV_907_Lares);
	Npc_ExchangeRoutine	(n4, "NC1");

//NC_PATH86_MOVEMENT - SLD_703_Soeldner  nc1

	var C_NPC n5; n5 = Hlp_GetNpc(SLD_703_Soeldner);
	Npc_ExchangeRoutine	(n5, "NC1");

//PATH_OC_NC_27A - SLD_705_Soeldner nc1 

	var C_NPC n6; n6 = Hlp_GetNpc(SLD_705_Soeldner);
	Npc_ExchangeRoutine	(n6, "NC1");

//PATH_OC_NC_27B - SLD_706_Soeldner nc1

	var C_NPC n7; n7 = Hlp_GetNpc(SLD_706_Soeldner);
	Npc_ExchangeRoutine	(n7, "NC1");

//OW_PATH_07_21_GUARD_MIDDLE - SLD_704_Blade  nc1

	var C_NPC n8; n8 = Hlp_GetNpc(SLD_704_Blade);
	Npc_ExchangeRoutine	(n8, "NC1");

//OW_PATH_07_21_GUARD_RIGHT - SLD_708_Soeldner  nc1

	var C_NPC n9; n9 = Hlp_GetNpc(SLD_708_Soeldner);
	Npc_ExchangeRoutine	(n9, "NC1");

//OW_PATH_067_LADDER2_MOVEMENT - SLD_726_Soeldner nc1

	var C_NPC n10; n10 = Hlp_GetNpc(SLD_726_Soeldner);
	Npc_ExchangeRoutine	(n10, "NC1");

//H_GOOUT - SLD_710_Soeldner nc1 

	var C_NPC n11; n11 = Hlp_GetNpc(SLD_710_Soeldner);
	Npc_ExchangeRoutine	(n11, "NC1");

//OW_PATH_069 - 2x SLD_720_Soeldner  SLD_723_Soeldner nc1

	var C_NPC n12; n12 = Hlp_GetNpc(SLD_720_Soeldner);
	Npc_ExchangeRoutine	(n12, "NC1");

	var C_NPC n13; n13 = Hlp_GetNpc(SLD_723_Soeldner);
	Npc_ExchangeRoutine	(n13, "NC1");
	
//PATH_OC_NC_27 - SLD_725_Soeldner  nc1

	var C_NPC n14; n14 = Hlp_GetNpc(SLD_725_Soeldner);
	Npc_ExchangeRoutine	(n14, "NC1");

//NC_PATH54 - SLD_730_Soeldner   nc1 

	var C_NPC n15; n15 = Hlp_GetNpc(SLD_730_Soeldner);
	Npc_ExchangeRoutine	(n15, "NC1");

//NC_PATH52 - SLD_731_Soeldner   nc1

	var C_NPC n16; n16 = Hlp_GetNpc(SLD_731_Soeldner);
	Npc_ExchangeRoutine	(n16, "NC1");

//NC_PATH81 - SLD_732_Soeldner   nc1

	var C_NPC n17; n17 = Hlp_GetNpc(SLD_732_Soeldner);
	Npc_ExchangeRoutine	(n17, "NC1");

//NC_DAM_BOTTOM - SLD_733_Soeldner   nc1

	var C_NPC n18; n18 = Hlp_GetNpc(SLD_733_Soeldner);
	Npc_ExchangeRoutine	(n18, "NC1");

//NC_PATH78_A - SLD_735_Soeldner   nc1

	var C_NPC n19; n19 = Hlp_GetNpc(SLD_735_Soeldner);
	Npc_ExchangeRoutine	(n19, "NC1");

//NC_PATH69 - SLD_736_Soeldner   nc1

	var C_NPC n20; n20 = Hlp_GetNpc(SLD_736_Soeldner);
	Npc_ExchangeRoutine	(n20, "NC1");

//NC_RICEBUNKER_08 - SLD_738_Soeldner   nc1

	var C_NPC n21; n21 = Hlp_GetNpc(SLD_738_Soeldner);
	Npc_ExchangeRoutine	(n21, "NC1");

//NC_RICEBUNKER_03 - sld   


//NC_PATH87 - SLD_750_Soeldner  nc1

	var C_NPC n22; n22 = Hlp_GetNpc(SLD_750_Soeldner);
	Npc_ExchangeRoutine	(n22, "NC1");

//NC_PATH_JARVIS - PC_Fighter  nc1 

	var C_NPC n23; n23 = Hlp_GetNpc(PC_Fighter);
	Npc_ExchangeRoutine	(n23, "NC1");

//NC_MAINGATE_VWHEEL - SLD_751_Soeldner  nc1

	var C_NPC n24; n24 = Hlp_GetNpc(SLD_751_Soeldner);
	Npc_ExchangeRoutine	(n24, "NC1");

//NC_LO_05 - SLD_755_Soeldner  nc1

	var C_NPC n25; n25 = Hlp_GetNpc(SLD_755_Soeldner);
	Npc_ExchangeRoutine	(n25, "NC1");

//NC_LO_11 - SLD_756_Soeldner    nc1

	var C_NPC n26; n26 = Hlp_GetNpc(SLD_756_Soeldner);
	Npc_ExchangeRoutine	(n26, "NC1");

//NC_LO_09 - SLD_4094_Merc_Off1   nc1

	var C_NPC n27; n27 = Hlp_GetNpc(SLD_4094_Merc_Off1);
	Npc_ExchangeRoutine	(n27, "NC1");

/****************	
Tama:
NC_PATH48 - tama
NC_DAM2 - tama
****************/
	
/*********************	
kopacze:
ogniska - moga siedziec
************************/

//NC_PATH_PEASANT_OUTSIDE3 BAU_930_Bauer   nc1

	var C_NPC n28; n28 = Hlp_GetNpc(BAU_930_Bauer);
	Npc_ExchangeRoutine	(n28, "NC1");

//NC_PATH_PEASANT_OUTSIDE9 BAU_929_Bauer    nc1

	var C_NPC n29; n29 = Hlp_GetNpc(BAU_929_Bauer);
	Npc_ExchangeRoutine	(n29, "NC1");

//NC_PATH_PEASANT_OUTSIDE10 BAU_928_Bauer    nc1

	var C_NPC n30; n30 = Hlp_GetNpc(BAU_928_Bauer);
	Npc_ExchangeRoutine	(n30, "NC1");

//NC_PATH_PEASANT_OUTSIDE  BAU_927_Bauer   nc1

	var C_NPC n31; n31 = Hlp_GetNpc(BAU_927_Bauer);
	Npc_ExchangeRoutine	(n31, "NC1");

//NC_PATH_PEASANT_OUTSIDE11 BAU_923_Bauer    nc1

	var C_NPC n32; n32 = Hlp_GetNpc(BAU_923_Bauer);
	Npc_ExchangeRoutine	(n32, "NC1");

//NC_PATH_PEASANT_OUTSIDE2 BAU_922_Bauer   nc1

	var C_NPC n33; n33 = Hlp_GetNpc(BAU_922_Bauer);
	Npc_ExchangeRoutine	(n33, "NC1");

//NC_PATH_PEASANT_OUTSIDE6 BAU_921_Bauer  nc1 

	var C_NPC n34; n34 = Hlp_GetNpc(BAU_921_Bauer);
	Npc_ExchangeRoutine	(n34, "NC1");

//NC_PATH_PEASANT_OUTSIDE4 BAU_920_Bauer   nc1

	var C_NPC n35; n35 = Hlp_GetNpc(BAU_920_Bauer);
	Npc_ExchangeRoutine	(n35, "NC1");

//NC_PATH_PEASANT_OUTSIDE5 BAU_919_Bauer   nc1

	var C_NPC n36; n36 = Hlp_GetNpc(BAU_919_Bauer);
	Npc_ExchangeRoutine	(n36, "NC1");

//NC_PATH_PEASANT_OUTSIDE7 BAU_916_Bauer   nc1

	var C_NPC n37; n37 = Hlp_GetNpc(BAU_916_Bauer);
	Npc_ExchangeRoutine	(n37, "NC1");

//NC_PATH_PEASANT_OUTSIDE20 BAU_915_Bauer   nc1

	var C_NPC n38; n38 = Hlp_GetNpc(BAU_915_Bauer);
	Npc_ExchangeRoutine	(n38, "NC1");

//NC_PATH_PEASANT_OUTSIDE8 BAU_914_Bauer   nc1

	var C_NPC n39; n39 = Hlp_GetNpc(BAU_914_Bauer);
	Npc_ExchangeRoutine	(n39, "NC1");

//NC_PATH_PEASANT_OUTSIDE8_WASH - SLD_757_Soeldner   nc1

	var C_NPC n40; n40 = Hlp_GetNpc(SLD_757_Soeldner);
	Npc_ExchangeRoutine	(n40, "NC1");

//NC_PATH58 - sld
//NC_PATH_PEASANT5 - ORG_838_Organisator   nc1

	var C_NPC n41; n41 = Hlp_GetNpc(ORG_838_Organisator);
	Npc_ExchangeRoutine	(n41, "NC1");

//NC_SPAWN_DAM_LURKER_MOVEMENT2 - ORG_837_Organisator   nc1

	var C_NPC n42; n42 = Hlp_GetNpc(ORG_837_Organisator);
	Npc_ExchangeRoutine	(n42, "NC1");

/***********************	
Sypialnia kopaczy:
NC_PATH_PEASANT4
NC_PATH_PEASANT
NC_PATH_PEASANT_SLEEP	
NC_PATH_PEASANT2
NC_PATH_PEASANT3
*****************/

//Karczma:
//NC_TAVERN_OUT_GUARD - SLD_758_Soeldner   nc1

	var C_NPC n43; n43 = Hlp_GetNpc(SLD_758_Soeldner);
	Npc_ExchangeRoutine	(n43, "NC1");

//NC_TAVERN_OUT_GUARD2 - ORG_834_Organisator   nc1 

	var C_NPC n44; n44 = Hlp_GetNpc(ORG_834_Organisator);
	Npc_ExchangeRoutine	(n44, "NC1");

//NC_TAVERN_OUT_GUARD1 - ORG_800_Organisator   nc1

	var C_NPC n45; n45 = Hlp_GetNpc(ORG_800_Organisator);
	Npc_ExchangeRoutine	(n45, "NC1");

//NC_TAVERN_SIT2 - 
//NC_TAVERN_ROOM07
//NC_TAVERN_ROOM05 - barkeeper
//NC_TAVERN_ROOM02 ORG_832_Organisator   nc1

	var C_NPC n46; n46 = Hlp_GetNpc(ORG_832_Organisator);
	Npc_ExchangeRoutine	(n46, "NC1");

//NC_TAVERN_SIT ORG_831_Organisator  nc1 

	var C_NPC n47; n47 = Hlp_GetNpc(ORG_831_Organisator);
	Npc_ExchangeRoutine	(n47, "NC1");

//NC_TAVERN_BACKROOM01 - alchemy
//NC_TAVERN_BACKROOM05 - SLD_759_Soeldner   nc1 

	var C_NPC n48; n48 = Hlp_GetNpc(SLD_759_Soeldner);
	Npc_ExchangeRoutine	(n48, "NC1");

//NC_TAVERN_BACKROOM09 - ORG_830_Organisator   nc1

	var C_NPC n49; n49 = Hlp_GetNpc(ORG_830_Organisator);
	Npc_ExchangeRoutine	(n49, "NC1");

//Góra taras:
//NC_TAVERN_STAIRS_TOP - ORG_829_Organisator  nc1

	var C_NPC n50; n50 = Hlp_GetNpc(ORG_829_Organisator);
	Npc_ExchangeRoutine	(n50, "NC1");

//NC_TAVERN_TOP02 - SLD_760_Soeldner SLD_761_Soeldner   nc1

	var C_NPC n51; n51 = Hlp_GetNpc(SLD_760_Soeldner);
	Npc_ExchangeRoutine	(n51, "NC1");
	
	var C_NPC n52; n52 = Hlp_GetNpc(SLD_761_Soeldner);
	Npc_ExchangeRoutine	(n52, "NC1");

//NC_TAVERN_TOP05 - SLD_762_Soeldner SLD_763_Soeldner   nc1

	var C_NPC n53; n53 = Hlp_GetNpc(SLD_762_Soeldner);
	Npc_ExchangeRoutine	(n53, "NC1");

	var C_NPC n54; n54 = Hlp_GetNpc(SLD_763_Soeldner);
	Npc_ExchangeRoutine	(n54, "NC1");

//NC_TAVERN_TOP04 - SLD_764_Soeldner SLD_765_Soeldner   nc1

	var C_NPC n55; n55 = Hlp_GetNpc(SLD_764_Soeldner);
	Npc_ExchangeRoutine	(n55, "NC1");
	
	var C_NPC n56; n56 = Hlp_GetNpc(SLD_765_Soeldner);
	Npc_ExchangeRoutine	(n56, "NC1");


//NC_TAVERN_TOP03 - SLD_4095_Merc_Off2   nc1

	var C_NPC n57; n57 = Hlp_GetNpc(SLD_4095_Merc_Off2);
	Npc_ExchangeRoutine	(n57, "NC1");

		
//Wilk - siedziba magow

//NC_P01_TO_P02_05 - ORG_855_Wolf    nc1 

	var C_NPC n58; n58 = Hlp_GetNpc(ORG_855_Wolf);
	Npc_ExchangeRoutine	(n58, "NC1");

//NC_GUARD_MAGES_RIGHT - ORG_804_Organisator   nc1

	var C_NPC n59; n59 = Hlp_GetNpc(ORG_804_Organisator);
	Npc_ExchangeRoutine	(n59, "NC1");

//NC_GUARD_MAGES_LEFT - ORG_806_Organisator   nc1

	var C_NPC n60; n60 = Hlp_GetNpc(ORG_806_Organisator);
	Npc_ExchangeRoutine	(n60, "NC1");

//NC_KDW01_OUT  ORG_807_Organisator   nc1

	var C_NPC n61; n61 = Hlp_GetNpc(ORG_807_Organisator);
	Npc_ExchangeRoutine	(n61, "NC1");

//NC_P01_TO_P02_06  ORG_810_Organisator   nc1

	var C_NPC n62; n62 = Hlp_GetNpc(ORG_810_Organisator);
	Npc_ExchangeRoutine	(n62, "NC1");

//NC_KDW02_OUT  ORG_811_Organisator  nc1

	var C_NPC n63; n63 = Hlp_GetNpc(ORG_811_Organisator);
	Npc_ExchangeRoutine	(n63, "NC1");

//NC_PLACE02 - ORG_815_Organisator  practice swrd   nc1	

	var C_NPC n64; n64 = Hlp_GetNpc(ORG_815_Organisator);
	Npc_ExchangeRoutine	(n64, "NC1");

//NC_SLVCAMPFIRE2 - ORG_816_Organisator  ORG_817_Organisator  ORG_820_Organisator  ORG_821_Organisator  ORG_822_Organisator sld  nc1

	var C_NPC n65; n65 = Hlp_GetNpc(ORG_816_Organisator);
	Npc_ExchangeRoutine	(n65, "NC1");

	var C_NPC n66; n66 = Hlp_GetNpc(ORG_817_Organisator);
	Npc_ExchangeRoutine	(n66, "NC1");

	var C_NPC n67; n67 = Hlp_GetNpc(ORG_820_Organisator);
	Npc_ExchangeRoutine	(n67, "NC1");	
	
//NC_KDW05+06_OUT  ORG_836_Organisator   nc1 

	var C_NPC n68; n68 = Hlp_GetNpc(ORG_836_Organisator);
	Npc_ExchangeRoutine	(n68, "NC1");	

//NC_KDW_CAVE_ENTRANCE - wejscie do saturasa, pozniej wilk

//straznicy kolo wilka: all HostileGuard
//NC_HUT05_MOVEMENT Grd_2504_PatrolGRD   nc1 

	var C_NPC n69; n69 = Hlp_GetNpc(Grd_2504_PatrolGRD);
	Npc_ExchangeRoutine	(n69, "NC1");	

//NC_HUT05_IN Grd_2505_PatrolGRD   nc1

	var C_NPC n70; n70 = Hlp_GetNpc(Grd_2505_PatrolGRD);
	Npc_ExchangeRoutine	(n70, "NC1");	

//NC_PLACE01_TO_PLACE02_02 Grd_2506_PatrolGRD    nc1

	var C_NPC n71; n71 = Hlp_GetNpc(Grd_2506_PatrolGRD);
	Npc_ExchangeRoutine	(n71, "NC1");

//NC_PATH02 Grd_2507_PatrolGRD   nc1 

	var C_NPC n72; n72 = Hlp_GetNpc(Grd_2507_PatrolGRD);
	Npc_ExchangeRoutine	(n72, "NC1");

//NC_HUT04_OUT - Grd_2508_PatrolGRD Grd_2509_PatrolGRD Grd_2511_PatrolGRD   nc1

	var C_NPC n73; n73 = Hlp_GetNpc(Grd_2508_PatrolGRD);
	Npc_ExchangeRoutine	(n73, "NC1");
	
	var C_NPC n74; n74 = Hlp_GetNpc(Grd_2509_PatrolGRD);
	Npc_ExchangeRoutine	(n74, "NC1");
	
	var C_NPC n75; n75 = Hlp_GetNpc(Grd_2511_PatrolGRD);
	Npc_ExchangeRoutine	(n75, "NC1");
	
	
//NC_PLACE01 - STT_844_Shadow STT_845_Shadow   nc1

	var C_NPC n76; n76 = Hlp_GetNpc(STT_844_Shadow);
	Npc_ExchangeRoutine	(n76, "NC1");

	var C_NPC n77; n77 = Hlp_GetNpc(STT_845_Shadow);
	Npc_ExchangeRoutine	(n77, "NC1");	
	
	
//NC_HUT03_OUT_MOVEMENT  STT_846_Shadow   nc1

	var C_NPC n78; n78 = Hlp_GetNpc(STT_846_Shadow);
	Npc_ExchangeRoutine	(n78, "NC1");	

//Stt_335_Santino  
//Kocio³ grds:
//NC_P03_TO_P01_02  Grd_2530_PatrolGRD  nc1 

	var C_NPC n80; n80 = Hlp_GetNpc(Grd_2530_PatrolGRD);
	Npc_ExchangeRoutine	(n80, "NC1");	

//NC_ENTRANCE_WP Grd_2534_PatrolGRD   nc1

	var C_NPC n81; n81 = Hlp_GetNpc(Grd_2533_PatrolGRD);
	Npc_ExchangeRoutine	(n81, "NC1");	

//NC_PATH70  Grd_2531_PatrolGRD   nc1

	var C_NPC n82; n82 = Hlp_GetNpc(Grd_2531_PatrolGRD);
	Npc_ExchangeRoutine	(n82, "NC1");	

//NC_PATH75  Grd_2532_PatrolGRD   nc1

	var C_NPC n83; n83 = Hlp_GetNpc(Grd_2532_PatrolGRD);
	Npc_ExchangeRoutine	(n83, "NC1");	

//NC_ENTRANCE_WP01  Grd_2533_PatrolGRD   nc1

	var C_NPC n84; n84 = Hlp_GetNpc(Grd_2533_PatrolGRD);
	Npc_ExchangeRoutine	(n84, "NC1");	

	
/*******************	
NC_PLACE03_MOVEMENT  
NC_PLACE03 
NC_PLACE03_MOVEMENT2
NC_PATH22
NC_PATH78
NC_PATH_TO_PIT_02
NC_PLACE06 - 2x gadaja
NC_PATH10
NC_PATH09
NC_PATH08
NC_HUT18_OUT
NC_PATH07
NC_HUT17_OUT - 2x gadaja
NC_HUT15_OUT_MOVEMENT - jw
NC_PATH11 - 2x stoja
NC_HUT11_OUT
NC_HUT31_OUT - 2x gadaja
NC_PATH18 - 2x gadaj
NC_PLACE07 - 3x stoja przy ogniu
NC_HUT26_OUT
NC_HUT25_OUT
NC_HUT24_OUT
***********************/

//NC_HUT23_OUT_GUARD2 Grd_2537_PatrolGRD  nc1

	var C_NPC n85; n85 = Hlp_GetNpc(Grd_2537_PatrolGRD);
	Npc_ExchangeRoutine	(n85, "NC1");	

//NC_HUT22_OUT_MOVEMENT Grd_2536_PatrolGRD  nc1

	var C_NPC n86; n86 = Hlp_GetNpc(Grd_2536_PatrolGRD);
	Npc_ExchangeRoutine	(n86, "NC1");	

//NC_HUT22_IN_MOVEMENT2 - GRD_851_Butch   nc1

	var C_NPC n87; n87 = Hlp_GetNpc(GRD_851_Butch);
	Npc_ExchangeRoutine	(n87, "NC1");	

//NC_PATH64 Grd_2535_PatrolGRD   nc1

	var C_NPC n88; n88 = Hlp_GetNpc(Grd_2535_PatrolGRD);
	Npc_ExchangeRoutine	(n88, "NC1");	


//Droga do kopalni:

//Na skale gdzie cwiczyl Cord:
//NC_WATERFALL_TOP0  GRD_900_Scatty

	var C_NPC n89; n89 = Hlp_GetNpc(GRD_900_Scatty);
	Npc_ExchangeRoutine	(n89, "NC1");

//NC_PATH66 Grd_2539_PatrolGRD   nc1

	var C_NPC n90; n90 = Hlp_GetNpc(Grd_2539_PatrolGRD);
	Npc_ExchangeRoutine	(n90, "NC1");

//NC_WATERFALL_TOP02

//OW_NO_PLATAEU_03 - Grd_2540_PatrolGRD  dodac luk   nc1

	var C_NPC n92; n92 = Hlp_GetNpc(Grd_2540_PatrolGRD);
	Npc_ExchangeRoutine	(n92, "NC1");

//OW_PATH_075_GUARD4  Stt_335_Santino   ???

/***********************
kryjowka Fletchera:
OW_PATH_081 - gorn
OW_PATH_080 - sld
NC_EN_SLVCAMP_03 - 4x sld
NC_EN_SLVCAMP_02 - 4x sld
	
dodac wp dla Fletchera na skale
*************************/

//dodaæ tajne przejœcie + stra¿nica
//FMC_ENTRANCE - wejœcie do kotla z kopalnia  GRD_251_Kirgo - daæ mu jakiœ text?   nc1

//przed krata do kopalni:
//FMC_PATH27 Grd_2541_PatrolGRD  nc1

	var C_NPC n94; n94 = Hlp_GetNpc(Grd_2541_PatrolGRD);
	Npc_ExchangeRoutine	(n94, "NC1");

//FMC_FM_ENTRANCE Grd_2542_PatrolGRD dac mu heavy armor   n1 

	var C_NPC n95; n95 = Hlp_GetNpc(Grd_2542_PatrolGRD);
	Npc_ExchangeRoutine	(n95, "NC1");

//FMC_PATH28 Grd_2543_PatrolGRD  nc1

	var C_NPC n96; n96 = Hlp_GetNpc(Grd_2543_PatrolGRD);
	Npc_ExchangeRoutine	(n96, "NC1");

//FMC_PATH18 Grd_2544_PatrolGRD   nc1

	var C_NPC n97; n97 = Hlp_GetNpc(Grd_2544_PatrolGRD);
	Npc_ExchangeRoutine	(n97, "NC1");

//FMC_PATH17 Grd_2545_PatrolGRD   nc1

	var C_NPC n98; n98 = Hlp_GetNpc(Grd_2545_PatrolGRD);
	Npc_ExchangeRoutine	(n98, "NC1");

//FMC_PATH25 Grd_2546_PatrolGRD   nc1

	var C_NPC n99; n99 = Hlp_GetNpc(Grd_2546_PatrolGRD);
	Npc_ExchangeRoutine	(n99, "NC1");

//FMC_PATH26 Grd_2547_PatrolGRD   nc1

	var C_NPC n100; n100 = Hlp_GetNpc(Grd_2547_PatrolGRD);
	Npc_ExchangeRoutine	(n100, "NC1");

//FMC_PATH24 Grd_2548_PatrolGRD   nc1

	var C_NPC n101; n101 = Hlp_GetNpc(Grd_2548_PatrolGRD);
	Npc_ExchangeRoutine	(n101, "NC1");

//FMC_PATH16 Grd_2549_PatrolGRD   nc1

	var C_NPC n102; n102 = Hlp_GetNpc(Grd_2549_PatrolGRD);
	Npc_ExchangeRoutine	(n102, "NC1");

//FMC_PATH09 Grd_2550_PatrolGRD   nc1

	var C_NPC n103; n103 = Hlp_GetNpc(Grd_2550_PatrolGRD);
	Npc_ExchangeRoutine	(n103, "NC1");

//FMC_HUT11_OUT - Grd_676_PatrolGRD Grd_677_PatrolGRD   nc1

	var C_NPC n104; n104 = Hlp_GetNpc(Grd_676_PatrolGRD);
	Npc_ExchangeRoutine	(n104, "NC1");
	
	var C_NPC n105; n105 = Hlp_GetNpc(Grd_677_PatrolGRD);
	Npc_ExchangeRoutine	(n105, "NC1");
	
//FMC_PATH03 - Grd_678_PatrolGRD   nc1

	var C_NPC n106; n106 = Hlp_GetNpc(Grd_678_PatrolGRD);
	Npc_ExchangeRoutine	(n106, "NC1");

//FMC_PATH12  Grd_679_PatrolGRD   nc1

	var C_NPC n107; n107 = Hlp_GetNpc(Grd_679_PatrolGRD);
	Npc_ExchangeRoutine	(n107, "NC1");

//FMC_PATH07  Grd_680_PatrolGRD   nc1

	var C_NPC n108; n108 = Hlp_GetNpc(Grd_680_PatrolGRD);
	Npc_ExchangeRoutine	(n108, "NC1");

//FMC_PATH03  Grd_681_PatrolGRD   nc1

	var C_NPC n110; n110 = Hlp_GetNpc(Grd_681_PatrolGRD);
	Npc_ExchangeRoutine	(n110, "NC1");

//FMC_HUT15_OUT  Grd_682_PatrolGRD   nc1

	var C_NPC n111; n111 = Hlp_GetNpc(Grd_682_PatrolGRD);
	Npc_ExchangeRoutine	(n111, "NC1");
	
	//ALchemik

	var C_NPC n571; n571 = Hlp_GetNpc(BAU_912_Jeremiah);
	Npc_ExchangeRoutine	(n571, "NC1");
   
   var C_NPC buster; buster = Hlp_GetNpc(ORG_833_Buster);
	Npc_ExchangeRoutine(buster, "NC");
   
   Wld_InsertNpc(DemonLord, "NC_EN_1");
   Wld_InsertNpc(DemonLord, "NC_EN_1");
   Wld_InsertNpc(DemonLord, "NC_EN_1");
};

/********************
Rutyny pod odbiciu Nowej Kopalnii przez Lee i Dicka
**********************/
func void B_NC_Free()
{
   B_kill_guard_in_NC();
//NC_RICELORD_SIT - SLD_700_Lee NC2

	var C_NPC n1; n1 = Hlp_GetNpc(SLD_700_Lee);
	Npc_ExchangeRoutine	(n1, "NC2");

//NC_RICEBUNKER_10 - SLD_701_Orik  NC2

	var C_NPC n2; n2 = Hlp_GetNpc(SLD_701_Orik);
	Npc_ExchangeRoutine	(n2, "NC2");

//NC_RICELORD - SLD_709_Cord  NC2

	var C_NPC n3; n3 = Hlp_GetNpc(SLD_709_Cord);
	Npc_ExchangeRoutine	(n3, "NC2");
	
//NC_PATH53 - SLV_907_Lares   NC2

	var C_NPC n4; n4 = Hlp_GetNpc(SLV_907_Lares);
	Npc_ExchangeRoutine	(n4, "NC2");

//NC_PATH86_MOVEMENT - SLD_703_Soeldner  NC2

	var C_NPC n5; n5 = Hlp_GetNpc(SLD_703_Soeldner);
	Npc_ExchangeRoutine	(n5, "NC2");

//PATH_OC_NC_27A - SLD_705_Soeldner NC2 

	var C_NPC n6; n6 = Hlp_GetNpc(SLD_705_Soeldner);
	Npc_ExchangeRoutine	(n6, "NC2");

//PATH_OC_NC_27B - SLD_706_Soeldner NC2

	var C_NPC n7; n7 = Hlp_GetNpc(SLD_706_Soeldner);
	Npc_ExchangeRoutine	(n7, "NC2");

//OW_PATH_07_21_GUARD_MIDDLE - SLD_704_Blade  NC2

	var C_NPC n8; n8 = Hlp_GetNpc(SLD_704_Blade);
	Npc_ExchangeRoutine	(n8, "NC2");

//OW_PATH_07_21_GUARD_RIGHT - SLD_708_Soeldner  NC2

	var C_NPC n9; n9 = Hlp_GetNpc(SLD_708_Soeldner);
	Npc_ExchangeRoutine	(n9, "NC2");

//OW_PATH_067_LADDER2_MOVEMENT - SLD_726_Soeldner NC2

	var C_NPC n10; n10 = Hlp_GetNpc(SLD_726_Soeldner);
	Npc_ExchangeRoutine	(n10, "NC2");

//H_GOOUT - SLD_710_Soeldner NC2 

	var C_NPC n11; n11 = Hlp_GetNpc(SLD_710_Soeldner);
	Npc_ExchangeRoutine	(n11, "NC2");

//OW_PATH_069 - 2x SLD_720_Soeldner  SLD_723_Soeldner NC2

	var C_NPC n12; n12 = Hlp_GetNpc(SLD_720_Soeldner);
	Npc_ExchangeRoutine	(n12, "NC2");

	var C_NPC n13; n13 = Hlp_GetNpc(SLD_723_Soeldner);
	Npc_ExchangeRoutine	(n13, "NC2");
	
//PATH_OC_NC_27 - SLD_725_Soeldner  NC2

	var C_NPC n14; n14 = Hlp_GetNpc(SLD_725_Soeldner);
	Npc_ExchangeRoutine	(n14, "NC2");

//NC_PATH54 - SLD_730_Soeldner   NC2 

	var C_NPC n15; n15 = Hlp_GetNpc(SLD_730_Soeldner);
	Npc_ExchangeRoutine	(n15, "NC2");

//NC_PATH52 - SLD_731_Soeldner   NC2

	var C_NPC n16; n16 = Hlp_GetNpc(SLD_731_Soeldner);
	Npc_ExchangeRoutine	(n16, "NC2");

//NC_PATH81 - SLD_732_Soeldner   NC2

	var C_NPC n17; n17 = Hlp_GetNpc(SLD_732_Soeldner);
	Npc_ExchangeRoutine	(n17, "NC2");

//NC_DAM_BOTTOM - SLD_733_Soeldner   NC2

	var C_NPC n18; n18 = Hlp_GetNpc(SLD_733_Soeldner);
	Npc_ExchangeRoutine	(n18, "NC2");

//NC_PATH78_A - SLD_735_Soeldner   NC2

	var C_NPC n19; n19 = Hlp_GetNpc(SLD_735_Soeldner);
	Npc_ExchangeRoutine	(n19, "NC2");

//NC_PATH69 - SLD_736_Soeldner   NC2

	var C_NPC n20; n20 = Hlp_GetNpc(SLD_736_Soeldner);
	Npc_ExchangeRoutine	(n20, "NC2");

//NC_RICEBUNKER_08 - SLD_738_Soeldner   NC2

	var C_NPC n21; n21 = Hlp_GetNpc(SLD_738_Soeldner);
	Npc_ExchangeRoutine	(n21, "NC2");

//NC_RICEBUNKER_03 - sld   


//NC_PATH87 - SLD_750_Soeldner  NC2

	var C_NPC n22; n22 = Hlp_GetNpc(SLD_750_Soeldner);
	Npc_ExchangeRoutine	(n22, "NC2");

//NC_MAINGATE_VWHEEL - SLD_751_Soeldner  NC2

	var C_NPC n24; n24 = Hlp_GetNpc(SLD_751_Soeldner);
	Npc_ExchangeRoutine	(n24, "NC2");

//NC_LO_05 - SLD_755_Soeldner  NC2

	var C_NPC n25; n25 = Hlp_GetNpc(SLD_755_Soeldner);
	Npc_ExchangeRoutine	(n25, "NC2");

//NC_LO_11 - SLD_756_Soeldner    NC2

	var C_NPC n26; n26 = Hlp_GetNpc(SLD_756_Soeldner);
	Npc_ExchangeRoutine	(n26, "NC2");

//NC_LO_09 - SLD_4094_Merc_Off1   NC2

	var C_NPC n27; n27 = Hlp_GetNpc(SLD_4094_Merc_Off1);
	Npc_ExchangeRoutine	(n27, "NC2");

/****************	
Tama:
NC_PATH48 - tama
NC_DAM2 - tama
****************/
	
/*********************	
kopacze:
ogniska - moga siedziec
************************/

//NC_PATH_PEASANT_OUTSIDE3 BAU_930_Bauer   NC2

	var C_NPC n28; n28 = Hlp_GetNpc(BAU_930_Bauer);
	Npc_ExchangeRoutine	(n28, "NC2");

//NC_PATH_PEASANT_OUTSIDE9 BAU_929_Bauer    NC2

	var C_NPC n29; n29 = Hlp_GetNpc(BAU_929_Bauer);
	Npc_ExchangeRoutine	(n29, "NC2");

//NC_PATH_PEASANT_OUTSIDE10 BAU_928_Bauer    NC2

	var C_NPC n30; n30 = Hlp_GetNpc(BAU_928_Bauer);
	Npc_ExchangeRoutine	(n30, "NC2");

//NC_PATH_PEASANT_OUTSIDE  BAU_927_Bauer   NC2

	var C_NPC n31; n31 = Hlp_GetNpc(BAU_927_Bauer);
	Npc_ExchangeRoutine	(n31, "NC2");

//NC_PATH_PEASANT_OUTSIDE11 BAU_926_Bauer    NC2

	var C_NPC n322; n322 = Hlp_GetNpc(BAU_926_Bauer);
	Npc_ExchangeRoutine	(n322, "NC2");
	
//NC_PATH_PEASANT_OUTSIDE11 BAU_925_Bauer    NC2

	var C_NPC n3221; n3221 = Hlp_GetNpc(BAU_925_Bauer);
	Npc_ExchangeRoutine	(n3221, "NC2");	
	
//NC_PATH_PEASANT_OUTSIDE11 BAU_923_Bauer    NC2

	var C_NPC n32; n32 = Hlp_GetNpc(BAU_923_Bauer);
	Npc_ExchangeRoutine	(n32, "NC2");

//NC_PATH_PEASANT_OUTSIDE2 BAU_922_Bauer   NC2

	var C_NPC n33; n33 = Hlp_GetNpc(BAU_922_Bauer);
	Npc_ExchangeRoutine	(n33, "NC2");

//NC_PATH_PEASANT_OUTSIDE6 BAU_921_Bauer  NC2 

	var C_NPC n34; n34 = Hlp_GetNpc(BAU_921_Bauer);
	Npc_ExchangeRoutine	(n34, "NC2");

//NC_PATH_PEASANT_OUTSIDE4 BAU_920_Bauer   NC2

	var C_NPC n35; n35 = Hlp_GetNpc(BAU_920_Bauer);
	Npc_ExchangeRoutine	(n35, "NC2");

//NC_PATH_PEASANT_OUTSIDE5 BAU_919_Bauer   NC2

	var C_NPC n36; n36 = Hlp_GetNpc(BAU_919_Bauer);
	Npc_ExchangeRoutine	(n36, "NC2");

//NC_PATH_PEASANT_OUTSIDE7 BAU_916_Bauer   NC2

	var C_NPC n37; n37 = Hlp_GetNpc(BAU_916_Bauer);
	Npc_ExchangeRoutine	(n37, "NC2");

//NC_PATH_PEASANT_OUTSIDE20 BAU_915_Bauer   NC2

	var C_NPC n38; n38 = Hlp_GetNpc(BAU_915_Bauer);
	Npc_ExchangeRoutine	(n38, "NC2");

//NC_PATH_PEASANT_OUTSIDE8 BAU_914_Bauer   NC2

	var C_NPC n39; n39 = Hlp_GetNpc(BAU_914_Bauer);
	Npc_ExchangeRoutine	(n39, "NC2");

//NC_PATH_PEASANT_OUTSIDE8 BAU_908_Bauer   NC2

	var C_NPC n391; n391 = Hlp_GetNpc(BAU_908_Bauer);
	Npc_ExchangeRoutine	(n391, "NC2");

//NC_PATH_PEASANT_OUTSIDE8 BAU_905_Bauer   NC2

	var C_NPC n3912; n3912 = Hlp_GetNpc(BAU_905_Bauer);
	Npc_ExchangeRoutine	(n3912, "NC2");
	

	var C_NPC n3913; n3913 = Hlp_GetNpc(BAU_903_Rufus);
	Npc_ExchangeRoutine	(n3913, "NC2");
	
	var C_NPC n3914; n3914 = Hlp_GetNpc(BAU_902_Pock);
	Npc_ExchangeRoutine	(n3914, "NC2");

	
//NC_PATH_PEASANT_OUTSIDE8_WASH - SLD_757_Soeldner   NC2

	var C_NPC n40; n40 = Hlp_GetNpc(SLD_757_Soeldner);
	Npc_ExchangeRoutine	(n40, "NC2");

//NC_PATH58 - sld
//NC_PATH_PEASANT5 - ORG_838_Organisator   NC2

	var C_NPC n41; n41 = Hlp_GetNpc(ORG_838_Organisator);
	Npc_ExchangeRoutine	(n41, "NC2");

//NC_SPAWN_DAM_LURKER_MOVEMENT2 - ORG_837_Organisator   NC2

	var C_NPC n42; n42 = Hlp_GetNpc(ORG_837_Organisator);
	Npc_ExchangeRoutine	(n42, "NC2");

/***********************	
Sypialnia kopaczy:
NC_PATH_PEASANT4
NC_PATH_PEASANT
NC_PATH_PEASANT_SLEEP	
NC_PATH_PEASANT2
NC_PATH_PEASANT3
*****************/

//Karczma:
//NC_TAVERN_OUT_GUARD - SLD_758_Soeldner   NC2

	var C_NPC n43; n43 = Hlp_GetNpc(SLD_758_Soeldner);
	Npc_ExchangeRoutine	(n43, "NC2");

//NC_TAVERN_OUT_GUARD2 - ORG_834_Organisator   NC2 

	var C_NPC n44; n44 = Hlp_GetNpc(ORG_834_Organisator);
	Npc_ExchangeRoutine	(n44, "NC2");

//NC_TAVERN_OUT_GUARD1 - ORG_800_Organisator   NC2

	var C_NPC n45; n45 = Hlp_GetNpc(ORG_800_Organisator);
	Npc_ExchangeRoutine	(n45, "NC2");

//NC_TAVERN_SIT2 - 
//NC_TAVERN_ROOM07
//NC_TAVERN_ROOM05 - barkeeper
//NC_TAVERN_ROOM02 ORG_832_Organisator   NC2

	var C_NPC n46; n46 = Hlp_GetNpc(ORG_832_Organisator);
	Npc_ExchangeRoutine	(n46, "NC2");

//NC_TAVERN_SIT ORG_831_Organisator  NC2 

	var C_NPC n47; n47 = Hlp_GetNpc(ORG_831_Organisator);
	Npc_ExchangeRoutine	(n47, "NC2");

//NC_TAVERN_BACKROOM01 - alchemy
//NC_TAVERN_BACKROOM05 - SLD_759_Soeldner   NC2 

	var C_NPC n48; n48 = Hlp_GetNpc(SLD_759_Soeldner);
	Npc_ExchangeRoutine	(n48, "NC2");

//NC_TAVERN_BACKROOM09 - ORG_830_Organisator   NC2

	var C_NPC n49; n49 = Hlp_GetNpc(ORG_830_Organisator);
	Npc_ExchangeRoutine	(n49, "NC2");

//Góra taras:
//NC_TAVERN_STAIRS_TOP - ORG_829_Organisator  NC2

	var C_NPC n50; n50 = Hlp_GetNpc(ORG_829_Organisator);
	Npc_ExchangeRoutine	(n50, "NC2");

//NC_TAVERN_TOP02 - SLD_760_Soeldner SLD_761_Soeldner   NC2

	var C_NPC n51; n51 = Hlp_GetNpc(SLD_760_Soeldner);
	Npc_ExchangeRoutine	(n51, "NC2");
	
	var C_NPC n52; n52 = Hlp_GetNpc(SLD_761_Soeldner);
	Npc_ExchangeRoutine	(n52, "NC2");

//NC_TAVERN_TOP05 - SLD_762_Soeldner SLD_763_Soeldner   NC2

	var C_NPC n53; n53 = Hlp_GetNpc(SLD_762_Soeldner);
	Npc_ExchangeRoutine	(n53, "NC2");

	var C_NPC n54; n54 = Hlp_GetNpc(SLD_763_Soeldner);
	Npc_ExchangeRoutine	(n54, "NC2");

//NC_TAVERN_TOP04 - SLD_764_Soeldner SLD_765_Soeldner   NC2

	var C_NPC n55; n55 = Hlp_GetNpc(SLD_764_Soeldner);
	Npc_ExchangeRoutine	(n55, "NC2");
	
	var C_NPC n56; n56 = Hlp_GetNpc(SLD_765_Soeldner);
	Npc_ExchangeRoutine	(n56, "NC2");

//NC_TAVERN_TOP03 - SLD_4095_Merc_Off2   NC2

	var C_NPC n57; n57 = Hlp_GetNpc(SLD_4095_Merc_Off2);
	Npc_ExchangeRoutine	(n57, "NC2");

//ALchemik

	var C_NPC n571; n571 = Hlp_GetNpc(BAU_912_Jeremiah);
	Npc_ExchangeRoutine	(n571, "NC2");
	
//Wilk - siedziba magow

//NC_P01_TO_P02_05 - ORG_855_Wolf    NC2 

	var C_NPC n58; n58 = Hlp_GetNpc(ORG_855_Wolf);
	Npc_ExchangeRoutine	(n58, "NC2");

//NC_GUARD_MAGES_RIGHT - ORG_804_Organisator   NC2

	var C_NPC n59; n59 = Hlp_GetNpc(ORG_804_Organisator);
	Npc_ExchangeRoutine	(n59, "NC2");

//NC_GUARD_MAGES_LEFT - ORG_806_Organisator   NC2

	var C_NPC n60; n60 = Hlp_GetNpc(ORG_806_Organisator);
	Npc_ExchangeRoutine	(n60, "NC2");

//NC_KDW01_OUT  ORG_807_Organisator   NC2

	var C_NPC n61; n61 = Hlp_GetNpc(ORG_807_Organisator);
	Npc_ExchangeRoutine	(n61, "NC2");

//NC_P01_TO_P02_06  ORG_810_Organisator   NC2

	var C_NPC n62; n62 = Hlp_GetNpc(ORG_810_Organisator);
	Npc_ExchangeRoutine	(n62, "NC2");

//NC_KDW02_OUT  ORG_811_Organisator  NC2

	var C_NPC n63; n63 = Hlp_GetNpc(ORG_811_Organisator);
	Npc_ExchangeRoutine	(n63, "NC2");

//NC_PLACE02 - ORG_815_Organisator  practice swrd   NC2	

	var C_NPC n64; n64 = Hlp_GetNpc(ORG_815_Organisator);
	Npc_ExchangeRoutine	(n64, "NC2");

//NC_SLVCAMPFIRE2 - ORG_816_Organisator  ORG_817_Organisator  ORG_820_Organisator  ORG_821_Organisator  ORG_822_Organisator sld  NC2

	var C_NPC n65; n65 = Hlp_GetNpc(ORG_816_Organisator);
	Npc_ExchangeRoutine	(n65, "NC2");

	var C_NPC n66; n66 = Hlp_GetNpc(ORG_817_Organisator);
	Npc_ExchangeRoutine	(n66, "NC2");

	var C_NPC n67; n67 = Hlp_GetNpc(ORG_820_Organisator);
	Npc_ExchangeRoutine	(n67, "NC2");	
	
//NC_KDW05+06_OUT  ORG_836_Organisator   NC2 

	var C_NPC n68; n68 = Hlp_GetNpc(ORG_836_Organisator);
	Npc_ExchangeRoutine	(n68, "NC2");
};

/********************
Rutyny dla 1 oddzia³u najemników
**********************/
func void B_NC_1MERC()
{
//NC_MAINGATE_VWHEEL - SLD_751_Soeldner  nc1

	var C_NPC n24; n24 = Hlp_GetNpc(SLD_751_Soeldner);
	Npc_ExchangeRoutine	(n24, "NC3");

//NC_LO_05 - SLD_755_Soeldner  nc1

	var C_NPC n25; n25 = Hlp_GetNpc(SLD_755_Soeldner);
	Npc_ExchangeRoutine	(n25, "NC3");

//NC_LO_11 - SLD_756_Soeldner    nc1

	var C_NPC n26; n26 = Hlp_GetNpc(SLD_756_Soeldner);
	Npc_ExchangeRoutine	(n26, "NC3");

//NC_LO_09 - SLD_4094_Merc_Off1   nc1

	var C_NPC n27; n27 = Hlp_GetNpc(SLD_4094_Merc_Off1);
	Npc_ExchangeRoutine	(n27, "NC3");
};

func void B_NC_1AMERC()
{
//NC_WATERFALL_TOP01
//NC_PATH66
//NC_WATERFALL_TOP02
//NC_WATERFALL_TOP01_MOVEMENT

//NC_MAINGATE_VWHEEL - SLD_751_Soeldner  nc1

	var C_NPC n24; n24 = Hlp_GetNpc(SLD_751_Soeldner);
	Npc_ExchangeRoutine	(n24, "NC4");

//NC_LO_05 - SLD_755_Soeldner  nc1

	var C_NPC n25; n25 = Hlp_GetNpc(SLD_755_Soeldner);
	Npc_ExchangeRoutine	(n25, "NC4");

//NC_LO_11 - SLD_756_Soeldner    nc1

	var C_NPC n26; n26 = Hlp_GetNpc(SLD_756_Soeldner);
	Npc_ExchangeRoutine	(n26, "NC4");

//NC_LO_09 - SLD_4094_Merc_Off1   nc1

	var C_NPC n27; n27 = Hlp_GetNpc(SLD_4094_Merc_Off1);
	Npc_ExchangeRoutine	(n27, "NC4");
};

/********************
Rutyny dla 1 oddzia³u najemników
**********************/
func void B_NC_2MERC()
{
//NC_TAVERN_TOP02 - SLD_760_Soeldner SLD_761_Soeldner   nc1

	var C_NPC n51; n51 = Hlp_GetNpc(SLD_760_Soeldner);
	Npc_ExchangeRoutine	(n51, "NC3");
	
	var C_NPC n52; n52 = Hlp_GetNpc(SLD_761_Soeldner);
	Npc_ExchangeRoutine	(n52, "NC3");

//NC_TAVERN_TOP05 - SLD_762_Soeldner SLD_763_Soeldner   nc1

	var C_NPC n53; n53 = Hlp_GetNpc(SLD_762_Soeldner);
	Npc_ExchangeRoutine	(n53, "NC3");

	var C_NPC n54; n54 = Hlp_GetNpc(SLD_763_Soeldner);
	Npc_ExchangeRoutine	(n54, "NC3");

//NC_TAVERN_TOP04 - SLD_764_Soeldner SLD_765_Soeldner   nc1

	var C_NPC n55; n55 = Hlp_GetNpc(SLD_764_Soeldner);
	Npc_ExchangeRoutine	(n55, "NC3");
	
	var C_NPC n56; n56 = Hlp_GetNpc(SLD_765_Soeldner);
	Npc_ExchangeRoutine	(n56, "NC3");

//NC_TAVERN_TOP03 - SLD_4094_Merc_Off2   nc1

	var C_NPC n57; n57 = Hlp_GetNpc(SLD_4095_Merc_Off2);
	Npc_ExchangeRoutine	(n57, "NC3");
};

func void B_NC_2AMERC()
{
/******************
NC_TO_EN_PATH_01 - offic
NC_EN1_CROSSING
NC_EN1_PATH_TO_SLVCAMP_01
NC_EN1_PATH_TO_SLVCAMP_02
NC_EN_SLVCAMP_01
NC_EN_SLVCAMP_02
NC_EN_SLVCAMP_03
*******************/

//NC_TAVERN_TOP02 - SLD_760_Soeldner SLD_761_Soeldner   nc1

	var C_NPC n51; n51 = Hlp_GetNpc(SLD_760_Soeldner);
	Npc_ExchangeRoutine	(n51, "NC4");
	
	var C_NPC n52; n52 = Hlp_GetNpc(SLD_761_Soeldner);
	Npc_ExchangeRoutine	(n52, "NC4");

//NC_TAVERN_TOP05 - SLD_762_Soeldner SLD_763_Soeldner   nc1

	var C_NPC n53; n53 = Hlp_GetNpc(SLD_762_Soeldner);
	Npc_ExchangeRoutine	(n53, "NC4");

	var C_NPC n54; n54 = Hlp_GetNpc(SLD_763_Soeldner);
	Npc_ExchangeRoutine	(n54, "NC4");

//NC_TAVERN_TOP04 - SLD_764_Soeldner SLD_765_Soeldner   nc1

	var C_NPC n55; n55 = Hlp_GetNpc(SLD_764_Soeldner);
	Npc_ExchangeRoutine	(n55, "NC4");
	
	var C_NPC n56; n56 = Hlp_GetNpc(SLD_765_Soeldner);
	Npc_ExchangeRoutine	(n56, "NC4");

//NC_TAVERN_TOP03 - SLD_4095_Merc_Off2   nc1

	var C_NPC n57; n57 = Hlp_GetNpc(SLD_4095_Merc_Off2);
	Npc_ExchangeRoutine	(n57, "NC4");
};

//Rytua³ Magów Wody i pojawienie siê ludzi Hrabiego
func void B_RitualBreak()
{
   var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
   var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
   var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
   var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
   var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
   var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);

   Npc_SetTempAttitude(weg, ATT_HOSTILE); Npc_SetAttitude(weg, ATT_HOSTILE);
   Npc_SetTempAttitude(grd1, ATT_HOSTILE); Npc_SetAttitude(grd1, ATT_HOSTILE);
   Npc_SetTempAttitude(grd2, ATT_HOSTILE); Npc_SetAttitude(grd2, ATT_HOSTILE);
   Npc_SetTempAttitude(grd3, ATT_HOSTILE); Npc_SetAttitude(grd3, ATT_HOSTILE);
   Npc_SetTempAttitude(grd4, ATT_HOSTILE); Npc_SetAttitude(grd4, ATT_HOSTILE);
   Npc_SetTempAttitude(grd5, ATT_HOSTILE); Npc_SetAttitude(grd5, ATT_HOSTILE);

   B_CHANGEGUILD(Grd_2519_Wegorz, GIL_DMB);
   B_CHANGEGUILD(GRD_2514_Guard, GIL_DMB);
   B_CHANGEGUILD(GRD_2515_Guard, GIL_DMB);
   B_CHANGEGUILD(GRD_2516_Guard, GIL_DMB);
   B_CHANGEGUILD(GRD_2517_Guard, GIL_DMB);
   B_CHANGEGUILD(GRD_2518_Guard, GIL_DMB);
   
	Npc_ExchangeRoutine	(weg, "RIT");
	Npc_ExchangeRoutine	(grd1, "RIT");
	Npc_ExchangeRoutine	(grd2, "RIT");
	Npc_ExchangeRoutine	(grd3, "RIT");
	Npc_ExchangeRoutine	(grd4, "RIT");
	Npc_ExchangeRoutine	(grd5, "RIT");	
	
	rytual_break = TRUE;
};


/********************
Atak na SO
**********************/

func void B_OC_Mercenarys_Attack()
{
//First group under Lee and Cord command

	var C_NPC n1; n1 = Hlp_GetNpc(SLD_700_Lee);
	Npc_ExchangeRoutine	(n1, "NC3"); 

	var C_NPC n2; n2 = Hlp_GetNpc(SLD_701_Orik);
	Npc_ExchangeRoutine	(n2, "NC3");  

	var C_NPC n3; n3 = Hlp_GetNpc(SLD_709_Cord);
	Npc_ExchangeRoutine	(n3, "NC3");  
	
	var C_NPC n51; n51 = Hlp_GetNpc(SLD_760_Soeldner);
	Npc_ExchangeRoutine	(n51, "NC5"); 
	
	var C_NPC n52; n52 = Hlp_GetNpc(SLD_761_Soeldner);
	Npc_ExchangeRoutine	(n52, "NC5"); 

	var C_NPC n53; n53 = Hlp_GetNpc(SLD_762_Soeldner);
	Npc_ExchangeRoutine	(n53, "NC5"); 

	var C_NPC n54; n54 = Hlp_GetNpc(SLD_763_Soeldner);
	Npc_ExchangeRoutine	(n54, "NC3");  

	var C_NPC n55; n55 = Hlp_GetNpc(SLD_764_Soeldner);
	Npc_ExchangeRoutine	(n55, "NC3");  
	
	var C_NPC n56; n56 = Hlp_GetNpc(SLD_765_Soeldner);
	Npc_ExchangeRoutine	(n56, "NC3"); 

	var C_NPC n57; n57 = Hlp_GetNpc(SLD_4095_Merc_Off2);
	Npc_ExchangeRoutine	(n57, "NC3");   

	var C_NPC n4; n4 = Hlp_GetNpc(SLV_907_Lares);
	Npc_ExchangeRoutine	(n4, "NC3");  

	var C_NPC n5; n5 = Hlp_GetNpc(SLD_703_Soeldner);
	Npc_ExchangeRoutine	(n5, "NC3"); 

	var C_NPC n6; n6 = Hlp_GetNpc(SLD_705_Soeldner);
	Npc_ExchangeRoutine	(n6, "NC3"); 

	var C_NPC n7; n7 = Hlp_GetNpc(SLD_706_Soeldner);
	Npc_ExchangeRoutine	(n7, "NC3"); 

	var C_NPC n8; n8 = Hlp_GetNpc(SLD_704_Blade);
	Npc_ExchangeRoutine	(n8, "NC3");  

	var C_NPC n9; n9 = Hlp_GetNpc(SLD_708_Soeldner);
	Npc_ExchangeRoutine	(n9, "NC3");  

	var C_NPC n10; n10 = Hlp_GetNpc(SLD_726_Soeldner);
	Npc_ExchangeRoutine	(n10, "NC3");  

	var C_NPC n11; n11 = Hlp_GetNpc(SLD_710_Soeldner);
	Npc_ExchangeRoutine	(n11, "NC3");  

	var C_NPC n12; n12 = Hlp_GetNpc(SLD_720_Soeldner);
	Npc_ExchangeRoutine	(n12, "NC3");  

	var C_NPC n13; n13 = Hlp_GetNpc(SLD_723_Soeldner);
	Npc_ExchangeRoutine	(n13, "NC3");
	
	var C_NPC n14; n14 = Hlp_GetNpc(SLD_725_Soeldner);
	Npc_ExchangeRoutine	(n14, "NC3");  

	var C_NPC n15; n15 = Hlp_GetNpc(SLD_730_Soeldner);
	Npc_ExchangeRoutine	(n15, "NC3");  

	var C_NPC n16; n16 = Hlp_GetNpc(SLD_731_Soeldner);
	Npc_ExchangeRoutine	(n16, "NC3");  

	var C_NPC n17; n17 = Hlp_GetNpc(SLD_732_Soeldner);
	Npc_ExchangeRoutine	(n17, "NC3");  

	var C_NPC n18; n18 = Hlp_GetNpc(SLD_733_Soeldner);
	Npc_ExchangeRoutine	(n18, "NC3");    

	var C_NPC n19; n19 = Hlp_GetNpc(SLD_735_Soeldner);
	Npc_ExchangeRoutine	(n19, "NC3");  

	var C_NPC n20; n20 = Hlp_GetNpc(SLD_736_Soeldner);
	Npc_ExchangeRoutine	(n20, "NC3");  

	var C_NPC n22; n22 = Hlp_GetNpc(SLD_750_Soeldner);
	Npc_ExchangeRoutine	(n22, "NC3");  

//Second group under Gorn command

	var C_NPC n23; n23 = Hlp_GetNpc(PC_Fighter);
	Npc_ExchangeRoutine	(n23, "NC3");  

	var C_NPC n24; n24 = Hlp_GetNpc(SLD_751_Soeldner);
	Npc_ExchangeRoutine	(n24, "NC5");  

	var C_NPC n25; n25 = Hlp_GetNpc(SLD_755_Soeldner);
	Npc_ExchangeRoutine	(n25, "NC5"); 

	var C_NPC n26; n26 = Hlp_GetNpc(SLD_756_Soeldner);
	Npc_ExchangeRoutine	(n26, "NC5");  

	var C_NPC n27; n27 = Hlp_GetNpc(SLD_4094_Merc_Off1);
	Npc_ExchangeRoutine	(n27, "NC3");  


	var C_NPC n40; n40 = Hlp_GetNpc(SLD_757_Soeldner);
	Npc_ExchangeRoutine	(n40, "NC3");  

	var C_NPC n43; n43 = Hlp_GetNpc(SLD_758_Soeldner);
	Npc_ExchangeRoutine	(n43, "NC3");  

	var C_NPC n48; n48 = Hlp_GetNpc(SLD_759_Soeldner);
	Npc_ExchangeRoutine	(n48, "NC3");   
	
};


func void B_Kira_Attack()
{
//Trolls Hunters

	var C_NPC h1; h1 = Hlp_GetNpc(Non_4027_Kira);
	Npc_ExchangeRoutine	(h1, "NC3"); 

	var C_NPC h2; h2 = Hlp_GetNpc(Non_4020_Tablor);
	Npc_ExchangeRoutine	(h2, "NC3");  

	var C_NPC h3; h3 = Hlp_GetNpc(Non_4021_Bukhart);
	Npc_ExchangeRoutine	(h3, "NC3");  

	var C_NPC h4; h4 = Hlp_GetNpc(Non_4022_Postronek);
	Npc_ExchangeRoutine	(h4, "NC3");  

	var C_NPC h5; h5 = Hlp_GetNpc(Non_4023_Korth);
	Npc_ExchangeRoutine	(h5, "NC3");  

	var C_NPC h6; h6 = Hlp_GetNpc(Non_4024_Snow);
	Npc_ExchangeRoutine	(h6, "NC3");  

	var C_NPC h7; h7 = Hlp_GetNpc(Non_4025_Kron);
	Npc_ExchangeRoutine	(h7, "NC3");  

	var C_NPC h8; h8 = Hlp_GetNpc(Non_4026_Nikolas);
	Npc_ExchangeRoutine	(h8, "NC3");  	

};

func void B_Dungeon_Trap()
{
//Tunel trap

	var C_NPC a1; a1 = Hlp_GetNpc(HUN_336_CAVALORN);
	Npc_ExchangeRoutine	(a1, "TRAP"); 
	AI_Teleport(a1,"OCC_CELLAR_WELL_ENTRANCE");
	
	var C_NPC a2; a2 = Hlp_GetNpc(PIR_2600_Angus);
	Npc_ExchangeRoutine	(a2, "TRAP"); 
	AI_Teleport(a2,"HIDDEOUT10");
	
	var C_NPC a3; a3 = Hlp_GetNpc(PIR_2601_Hank);
	Npc_ExchangeRoutine	(a3, "TRAP"); 
	AI_Teleport(a3,"HIDDEOUT11");	
	
	var C_NPC a4; a4 = Hlp_GetNpc(PIR_2602_Rodney);
	Npc_ExchangeRoutine	(a4, "TRAP"); 
	AI_Teleport(a4,"HIDDEOUT12");	
	
	var C_NPC a5; a5 = Hlp_GetNpc(PIR_2612_JACKALLIGATOR);
	Npc_ExchangeRoutine	(a5, "TRAP"); 
	AI_Teleport(a5,"HIDDEOUT13");
	
	var C_NPC g1; g1 = Hlp_GetNpc(Grd_212_Torwache);
	Npc_ExchangeRoutine	(g1, "TRAP"); 

	var C_NPC g2; g2 = Hlp_GetNpc(Grd_213_Torwache);
	Npc_ExchangeRoutine	(g2, "TRAP"); 
	
	var C_NPC g3; g3 = Hlp_GetNpc(Grd_220_Gardist);
	Npc_ExchangeRoutine	(g3, "TRAP"); 
	
	var C_NPC g4; g4 = Hlp_GetNpc(Grd_221_Gardist);
	Npc_ExchangeRoutine	(g4, "TRAP"); 
	
	var C_NPC g5; g5 = Hlp_GetNpc(Grd_222_Gardist);
	Npc_ExchangeRoutine	(g5, "TRAP"); 
	
	var C_NPC g6; g6 = Hlp_GetNpc(Grd_223_Gardist);
	Npc_ExchangeRoutine	(g6, "TRAP"); 
	
	var C_NPC g7; g7 = Hlp_GetNpc(Grd_225_Gardist);
	Npc_ExchangeRoutine	(g7, "TRAP"); 
};

func void B_Trap_Hostile_grd()
{
   var C_NPC g1; g1 = Hlp_GetNpc(Grd_212_Torwache); //zmieniæ tu instancje na inne
	var C_NPC g2; g2 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC g3; g3 = Hlp_GetNpc(Grd_220_Gardist);
	var C_NPC g4; g4 = Hlp_GetNpc(Grd_221_Gardist);
	var C_NPC g5; g5 = Hlp_GetNpc(Grd_222_Gardist);
	var C_NPC g6; g6 = Hlp_GetNpc(Grd_223_Gardist);
	var C_NPC g7; g7 = Hlp_GetNpc(Grd_225_Gardist);
   
   Npc_SetTempAttitude(g1, ATT_HOSTILE); Npc_SetAttitude(g1, ATT_HOSTILE);
   Npc_SetTempAttitude(g2, ATT_HOSTILE); Npc_SetAttitude(g2, ATT_HOSTILE);
   Npc_SetTempAttitude(g3, ATT_HOSTILE); Npc_SetAttitude(g3, ATT_HOSTILE);
   Npc_SetTempAttitude(g4, ATT_HOSTILE); Npc_SetAttitude(g4, ATT_HOSTILE);
   Npc_SetTempAttitude(g5, ATT_HOSTILE); Npc_SetAttitude(g5, ATT_HOSTILE);
   Npc_SetTempAttitude(g6, ATT_HOSTILE); Npc_SetAttitude(g6, ATT_HOSTILE);
   Npc_SetTempAttitude(g7, ATT_HOSTILE); Npc_SetAttitude(g7, ATT_HOSTILE);

   B_CHANGEGUILD(Grd_212_Torwache, GIL_DMB);
   B_CHANGEGUILD(Grd_213_Torwache, GIL_DMB);
   B_CHANGEGUILD(Grd_220_Gardist, GIL_DMB);
   B_CHANGEGUILD(Grd_221_Gardist, GIL_DMB);
   B_CHANGEGUILD(Grd_222_Gardist, GIL_DMB);
   B_CHANGEGUILD(Grd_223_Gardist, GIL_DMB);
   B_CHANGEGUILD(Grd_225_Gardist, GIL_DMB);
};

func void B_Pirats_Wait()
{
//defend

	var C_NPC aa2; aa2 = Hlp_GetNpc(PIR_2600_Angus);
	Npc_ExchangeRoutine	(aa2, "DEFEND");  
	
	var C_NPC aa3; aa3 = Hlp_GetNpc(PIR_2601_Hank);
	Npc_ExchangeRoutine	(aa3, "DEFEND"); 
	
	var C_NPC aa4; aa4 = Hlp_GetNpc(PIR_2602_Rodney);
	Npc_ExchangeRoutine	(aa4, "DEFEND"); 
	
	var C_NPC aa5; aa5 = Hlp_GetNpc(PIR_2612_JACKALLIGATOR);
	Npc_ExchangeRoutine	(aa5, "DEFEND"); 
};
