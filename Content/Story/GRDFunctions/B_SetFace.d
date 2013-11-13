var int face_row;
var int face_col;

Func void B_SetFace(var C_NPC nofacenpc)
{
   var int facerizer;
   facerizer = Hlp_Random(39);//39Faces*5Mesh=195 Faces
   var int toothrizer;
   toothrizer = Hlp_Random(4);
   var int facemeshorizer;
   facemeshorizer = Hlp_Random(5);
   var int skinnr;
   var int facenr;
   var string facemesh;
   var  C_Item  NowArmor;

   NowArmor = Npc_GetEquippedArmor(nofacenpc);

   if (facemeshorizer < 2)
   {
      facemesh = "Hum_Head_Bald";
   }
   else if (facemeshorizer < 3)
   {
      facemesh = "Hum_Head_FatBald";
   }
   else if (facemeshorizer < 4)
   {
      facemesh = "Hum_Head_Psionic";
   }
   else if (facemeshorizer < 5)
   {
      facemesh = "Hum_Head_Thief";
   }
   else if (facemeshorizer < 6)
   {
      facemesh = "Hum_Head_Fighter";
   };
   
   Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 0,facemesh, 0,  toothrizer, NowArmor);

   if (facerizer < 2)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 0,facemesh, 0,  toothrizer, NowArmor);
   }
   else if (facerizer < 3)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 0,facemesh, 1,  toothrizer, NowArmor);
   }
   else if (facerizer < 4) //?
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0,2,facemesh, 1,  toothrizer, NowArmor);
   }
   else if (facerizer < 5)
   {
   Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 101,  toothrizer, NowArmor);
   }
   else if (facerizer < 6)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 102,  toothrizer, NowArmor);
   }
   else if (facerizer < 7)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 103,  toothrizer, NowArmor);
   }
   else if (facerizer < 8)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 104,  toothrizer, NowArmor);
   }
   else if (facerizer < 9)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 106,  toothrizer, NowArmor);
   }
   else if (facerizer < 10)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 107,  toothrizer, NowArmor);
   }
   else if (facerizer < 11)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 10,  toothrizer, NowArmor);
   }
   else if (facerizer < 12)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 2,facemesh, 10,  toothrizer, NowArmor);
   }
   else if (facerizer < 13)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 113,  toothrizer, NowArmor);
   }
   else if (facerizer < 14)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 114,  toothrizer, NowArmor);
   }
   else if (facerizer < 15)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 115,  toothrizer, NowArmor);
   }
   else if (facerizer < 16)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 116,  toothrizer, NowArmor);
   }
   else if (facerizer < 17)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 11,  toothrizer, NowArmor);
   }
   else if (facerizer < 18)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 2,facemesh, 11,  toothrizer, NowArmor);
   }
   else if (facerizer < 19)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 0,facemesh, 12,  toothrizer, NowArmor);
   }
   else if (facerizer < 20)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 2,facemesh, 12,  toothrizer, NowArmor);
   }
   else if (facerizer < 21)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 2,facemesh, 14,  toothrizer, NowArmor);
   }
   else if (facerizer < 22)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 15,  toothrizer, NowArmor);
   }
   else if (facerizer < 23)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 16,  toothrizer, NowArmor);
   }
   else if (facerizer < 24)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 0,facemesh, 1,  toothrizer, NowArmor);
   }
   else if (facerizer < 25)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 2,facemesh, 3,  toothrizer, NowArmor);
   }
   else if (facerizer < 26)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 46,  toothrizer, NowArmor);
   }
   else if (facerizer < 27)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 0,facemesh, 4,  toothrizer, NowArmor);
   }
   else if (facerizer < 28)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 2,facemesh, 4,  toothrizer, NowArmor);
   }
   else if (facerizer < 29)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 51,  toothrizer, NowArmor);
   }
   else if (facerizer < 30)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 0,facemesh, 5,  toothrizer, NowArmor);
   }
   else if (facerizer < 31)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 3,facemesh, 6,  toothrizer, NowArmor);
   }
   else if (facerizer < 32)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 77,  toothrizer, NowArmor);
   }
   else if (facerizer < 33)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 79,  toothrizer, NowArmor);
   }
   else if (facerizer < 34)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 88,  toothrizer, NowArmor);
   }
   else if (facerizer < 35)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 89,  toothrizer, NowArmor);
   }
   else if (facerizer < 36)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 0,facemesh, 8,  toothrizer, NowArmor);
   }
   else if (facerizer < 37)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 2,facemesh, 8,  toothrizer, NowArmor);
   }
   else if (facerizer < 38)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 1,facemesh, 94,  toothrizer, NowArmor);
   }
   else if (facerizer < 39)
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 2,facemesh, 9,  toothrizer, NowArmor);
   }
   else
   {
      Mdl_SetVisualBody (nofacenpc,"hum_body_Naked0", 0, 2,facemesh, 9,  toothrizer, NowArmor);
   };
};