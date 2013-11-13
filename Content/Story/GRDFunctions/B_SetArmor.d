func void B_SetArmor (var C_NPC creator,var int GrdDifc)//GrdTalents 1,2,3
{
   if (GrdDifc > 45)
   {
      Mdl_SetVisualBody (creator,"hum_body_Naked0", 0, 2,"Hum_Head_Bald", 9,  1, GRD_ARMOR_H);
   }
   else if (GrdDifc > 35)
   {
      Mdl_SetVisualBody (creator,"hum_body_Naked0", 0, 2,"Hum_Head_Bald", 9,  1, GRD_ARMOR_M);
   }
   else if (GrdDifc > 22)
   {
      Mdl_SetVisualBody (creator,"hum_body_Naked0", 0, 2,"Hum_Head_Bald", 9,  1, GRD_ARMOR_L);
   }
   else if (GrdDifc > 15)
   {
      Mdl_SetVisualBody (creator,"hum_body_Naked0", 0, 2,"Hum_Head_Bald", 9,  1, STT_ARMOR_H);
   }
   else
   {
      Mdl_SetVisualBody (creator,"hum_body_Naked0", 0, 2,"Hum_Head_Bald", 9,  1, STT_ARMOR_M);
   };
};

