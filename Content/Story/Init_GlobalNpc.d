var C_NPC rodney;
var C_NPC angus;
var C_NPC hank;
var C_NPC dustin;
var C_NPC skip;
var C_NPC jack;
var C_NPC cavalorn;
var C_NPC ratford;
var C_NPC bruce;
var C_NPC aidan;
var C_NPC leren;
var C_NPC milten;

//var C_NPC cortez;
var C_NPC mordrag;
var C_NPC cipher;
var C_NPC baalkagan;
var C_NPC zex;
var C_NPC garry;
var C_NPC fox;
var C_NPC fingers;
var C_NPC kharim;
var C_NPC drax;
var C_NPC quentin;
var C_NPC gorhanis;
var C_NPC baalparvez;
var C_NPC fisk;
var C_NPC baaltaran;
var C_NPC baalisidro;
var C_NPC terry;
var C_NPC tony;
var C_NPC vam;
var C_NPC dylan;
var C_NPC piwosz;
var C_NPC snaf;
var C_NPC gestath;
var C_NPC abel;
var C_NPC cup;

var C_NPC cord;
var C_NPC kirgo;
var C_NPC ashgan;

var C_NPC poison_memory;
var C_NPC mirror_memory;
var C_NPC curse_memory;
var C_NPC icearmor_memory;
var C_NPC magicshield_memory;
var C_NPC timedatt_memory;
var C_NPC collpool_memory;
var C_NPC party_memory;


var C_NPC camper_1;  
var C_NPC camper_2;  
var C_NPC camper_3;  
var C_NPC camper_4;  

var c_npc hrabia;
var C_NPC Skorpio; 
var C_NPC Pacho; 
var C_NPC carlson;

var c_npc lester;
var C_NPC beast;
var C_NPC tondral;
var C_NPC necro_in_world; 
var c_npc necro_demon;
var c_npc raven;

var C_NPC grd_230;
var C_NPC kasacz; 
var C_NPC grd_2514;
var C_NPC grd_2515;
var C_NPC grd_2516;
var C_NPC grd_2517;
var C_NPC grd_2518;
var C_NPC wegorz;
/****CH2*****/
var C_NPC CH2_Patrol_g1; 
var C_NPC CH2_Patrol_g2; 
var C_NPC CH2_Patrol_g3; 
var C_NPC CH2_Patrol_g4; 
var C_NPC CH2_Patrol_g5; 

func void PreInit_GlobalNpc()
{
   poison_memory = Hlp_GetNpc(RuneSword_Now);
   mirror_memory = Hlp_GetNpc(RuneSword_FireBall);
   curse_memory = Hlp_GetNpc(RuneSword_Sleep);
   icearmor_memory = Hlp_GetNpc(RuneSword_FireBolt);
   magicshield_memory= Hlp_GetNpc(RuneSword_FireRain);
   timedatt_memory = Hlp_GetNpc(Mob_Spawner);
   collpool_memory = Hlp_GetNpc(RuneSword_Charm);
};

func void Init_GlobalNpc()
{
   PreInit_GlobalNpc();
   party_memory = Hlp_GetNpc(RuneSword_FireStorm); 
};
	
func void Init_GlobalNpc_World()
{
   PreInit_GlobalNpc();

   angus = Hlp_GetNpc(pir_2600_angus);

   hank = Hlp_GetNpc(pir_2601_hank);

   rodney = Hlp_GetNpc(pir_2602_rodney);

   dustin = Hlp_GetNpc(pir_2606_dustin);

   skip = Hlp_GetNpc(pir_2611_skip);

   jack = Hlp_GetNpc(pir_2612_jackalligator);

   cavalorn = Hlp_GetNpc(hun_336_cavalorn);

   ratford = Hlp_GetNpc(hun_818_ratford);

   bruce = Hlp_GetNpc(hun_828_bruce);

   aidan = Hlp_GetNpc(hun_859_aidan);

   leren = Hlp_GetNpc(mag_1604_Leren);

   milten = Hlp_GetNpc(PC_Mage);

   //cortez = Hlp_GetNpc(mag_4021_cortez);
   //cipher = Hlp_GetNpc(RBL_8730_Dylan);

   baalkagan = Hlp_GetNpc(rbl_1332_baalkagan);

   zex = Hlp_GetNpc(rbl_2331_zex);

   garry = Hlp_GetNpc(rbl_2605_garry);

   fox = Hlp_GetNpc(rbl_2614_fox);

   fingers = Hlp_GetNpc(RBL_331_Fingers);

   kharim = Hlp_GetNpc(hun_729_kharim);

   drax = Hlp_GetNpc(hun_819_drax);

   quentin = Hlp_GetNpc(hun_858_quentin);

   gorhanis = Hlp_GetNpc(hun_1422_gorhanis);

   baalparvez = Hlp_GetNpc(mag_1330_baalparvez);

   fisk = Hlp_GetNpc(rbl_311_fisk);

   //butch = Hlp_GetNpc(Org_851_Butch);

   baaltaran = Hlp_GetNpc(rbl_1331_baaltaran);

   baalisidro = Hlp_GetNpc(rbl_1333_baalisidro);

   terry = Hlp_GetNpc(rbl_2402_terry);

   tony = Hlp_GetNpc(rbl_2604_tony);

   vam = Hlp_GetNpc(rbl_2613_vam);

   dylan = Hlp_GetNpc(rbl_8730_dylan);

   snaf = Hlp_GetNpc(RBL_581_Snaf);

   cup = Hlp_GetNpc(RBL_2619_Cup);

   MyWolf = Hlp_GetNpc(My_Wolf);

   camper_1 = Hlp_GetNpc(org_4050_camper1);

   camper_2 = Hlp_GetNpc(org_4051_camper2);

   camper_3 = Hlp_GetNpc(org_4052_camper3);

   camper_4 = Hlp_GetNpc(org_4053_camper4);

   hrabia = Hlp_GetNpc(GRD_4010_Hrabia);
   Skorpio = Hlp_GetNpc(GRD_205_SCORPIO);
   Pacho = Hlp_GetNpc(GRD_224_Pacho);

   piwosz = Hlp_GetNpc(RBL_2608_BeerDrinker);

   CH2_Patrol_g1 = Hlp_GetNpc(GRD_4056_Guard);
   CH2_Patrol_g2 = Hlp_GetNpc(GRD_4057_Guard);
   CH2_Patrol_g3 = Hlp_GetNpc(GRD_4058_Guard);
   CH2_Patrol_g4 = Hlp_GetNpc(GRD_4059_Guard);
   CH2_Patrol_g5 = Hlp_GetNpc(GRD_4060_Guard);
   gestath	 = Hlp_GetNpc(HUN_2609_Gestath);
   carlson	 = Hlp_GetNpc(RBL_2617_Carlson);

   abel	 = Hlp_GetNpc(HUN_2615_Abel);

   mordrag = Hlp_GetNpc(SLV_904_Mordrag);
   cord = Hlp_GetNpc(SLD_709_Cord);
   kirgo = Hlp_GetNpc(Grd_251_Kirgo); 
   ashgan = Hlp_GetNpc(Grd_263_Asghan);
   
   beast = Hlp_GetNpc(MonsterOfSwamp);
   lester = Hlp_GetNpc(PC_Psionic);
   
   grd_230 = Hlp_GetNpc(GRD_230_Gardist);
   kasacz = Hlp_GetNpc(Grd_2513_Kasacz);
   tondral = Hlp_GetNpc(Gur_1203_BaalTondral);
   
   necro_in_world = Hlp_GetNpc(DMB_1703_NecroInWorld);
   
   grd_2514 = Hlp_GetNpc(GRD_2514_Guard);
   grd_2515 = Hlp_GetNpc(GRD_2515_Guard);
   grd_2516 = Hlp_GetNpc(GRD_2516_Guard);
   grd_2517 = Hlp_GetNpc(GRD_2517_Guard);
   grd_2518 = Hlp_GetNpc(GRD_2518_Guard);
   wegorz = Hlp_GetNpc(Grd_2519_Wegorz);
   
   necro_demon = Hlp_GetNpc(NecromancerDemon);
   raven = Hlp_GetNpc(Ebr_105_Raven);
};