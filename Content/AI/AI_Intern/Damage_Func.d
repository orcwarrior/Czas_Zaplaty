	
	//#####################################################
	//
	// I_zCTreeSearchVFX
	//-------
	// 0 - ERROR VFX NOT FOUND!
	// *ptr - pointer 2 vfx
	//--
	//TODO: Make sure leftSWD is implemented properly
	//
	//#####################################################
	func int I_zCTreeSearchVFX(var int ptr,var int leftsword)
	{
		if(ptr==0){printdebug("ERROR!!!");};
		var string name;
		if(!leftsword)
		{ name = "R_SWORDDAMAGE VOB"; }
		else { name = "L_SWORDDAMAGE VOB";};
		var int label; var int val; var int first_ptr; var int previous;
		first_ptr = ptr;
		val = MEM_ReadInt(ptr+16);//data zCVobVFX?
		if(val)
		{
			if(MEM_ReadInt(val)==8200452)&&(Hlp_StrCmp(MEM_ReadString(val+16),name))
			{
				return val;            
			};
		};
		
		MEM_InitLabels();
		label = MEM_StackPos.position;  
		if(previous)
		{
			ptr = MEM_ReadInt(ptr+12);//next               
		}
		else
		{
			ptr = MEM_ReadInt(ptr+8);//next
		};
		if(ptr==0)
		{
			previous=true;
			ptr=first_ptr;
			MEM_StackPos.position = label;
		};
		val = MEM_ReadInt(ptr+16);//data zCVobVFX?
		if(val)
		{
			if(MEM_ReadInt(val)==8200452)&&(Hlp_StrCmp(MEM_ReadString(val+16),name))
			{
				return val;            
			}
			else if (first_ptr!=ptr)
			{
				MEM_StackPos.position = label;  
			};
		}
		else { return 0;};
		
		
	};
	
	//#####################################################
	//
	// I_Npc_CollideWithHeroWeapon
	//-------
	// 0 - no
	// 3X or X3 - yes, partialy half damage
	// 33 - yes, enough part to set full damage
	//
	//#####################################################
	// Last update: March 01, 2011
	// * npc max collide box height += 80.0 (before it was missing small enemies)
	func int I_Npc_CollideWithHeroWeapon(var int ptr_npc,var int hand)
	{
		
		//var int npc_bbox[6];//xmin,ymin,zmin,xmax,ymax,zmax;
		var int npc_bbox_0;
		var int npc_bbox_1;
		var int npc_bbox_2;
		var int npc_bbox_3;
		var int npc_bbox_4;
		var int npc_bbox_5;
		
		var int npc_bbox_size[3];//x,y,z
		var int ret_sum; var int npc_bbox_begin;
		//aiv's thing
		var int nPtr; var int hlp;
		
		//Assing pos to weapon points
		
		
		//Assing npc bbox to array
		npc_bbox_begin = ptr_npc + 124;
		npc_bbox_0=MEM_ReadInt(npc_bbox_begin);
		npc_bbox_1=MEM_ReadInt(npc_bbox_begin+4);
		npc_bbox_2=MEM_ReadInt(npc_bbox_begin+8);
		npc_bbox_3=MEM_ReadInt(npc_bbox_begin+12);
		npc_bbox_4=MEM_ReadInt(npc_bbox_begin+16);
		npc_bbox_5=MEM_ReadInt(npc_bbox_begin+20);
		
		ret_sum = 0;
		//      if(MEM_ReadInt(ptr_npc+1964)==98304)//bs_stand
		//      {
		//             
		//              //SCALING DISABLED!    
		//              //SCALING DISABLED!    
		//             
		//              //scale npc bbox to one and a half
		//              var int onehalf;
		//              onehalf = divf(mkf(3),mkf(2));
		//              //x:
		//              npc_bbox_size[0] = subf(npc_bbox_0,npc_bbox_3);
		//              if(lf(npc_bbox_size[0],FLOATNULL))//smaller than 0
		//              { npc_bbox_size[0] = negf(npc_bbox_size[0]); };//negative number
		//              //ok, we have size of box, but really we need 1/2 of it
		//              printdebug("npc_bbox_size[0]");
		//              printdebug(float32tostring(npc_bbox_size[0]));
		//              npc_bbox_size[0] = divf(npc_bbox_size[0],onehalf);
		//              //ok now scale box
		//              if(lf(npc_bbox_0,npc_bbox_3))//[0]<[3]
		//              {
		//                      npc_bbox_0 = subf(npc_bbox_0,npc_bbox_size[0]);        
		//                      npc_bbox_3 = addf(npc_bbox_3,npc_bbox_size[0]);        
		//              }
		//              else{
		//                      npc_bbox_0 = addf(npc_bbox_0,npc_bbox_size[0]);        
		//                      npc_bbox_3 = subf(npc_bbox_3,npc_bbox_size[0]);        
		//              };
		
		//             
		//              //y:
		//              npc_bbox_size[1] = subf(npc_bbox_1,npc_bbox_4);
		//              if(lf(npc_bbox_size[1],FLOATNULL))
		//              { npc_bbox_size[1] = negf(npc_bbox_size[1]); };
		//              printdebug("npc_bbox_size[1]");
		//              printdebug(float32tostring(npc_bbox_size[1]));
		//              npc_bbox_size[1] = divf(npc_bbox_size[1],onehalf);
		//              if(lf(npc_bbox_1,npc_bbox_4)){
		//                      npc_bbox_1 = subf(npc_bbox_1,npc_bbox_size[1]);        
		//                      npc_bbox_4 = addf(npc_bbox_4,npc_bbox_size[1]);        
		//              }                
		//              else{            
		//                      npc_bbox_1 = addf(npc_bbox_1,npc_bbox_size[1]);        
		//                      npc_bbox_4 = subf(npc_bbox_4,npc_bbox_size[1]);        
		//              };
		//             
		//              //z:
		//              npc_bbox_size[2] = subf(npc_bbox_2,npc_bbox_5);
		//              if(lf(npc_bbox_size[2],FLOATNULL))
		//              { npc_bbox_size[2] = negf(npc_bbox_size[2]); };
		//              printdebug("npc_bbox_size[2]");
		//              printdebug(float32tostring(npc_bbox_size[2]));
		//              npc_bbox_size[2] = divf(npc_bbox_size[2],onehalf);
		//              if(lf(npc_bbox_2,npc_bbox_5)){
		//                      npc_bbox_2 = subf(npc_bbox_2,npc_bbox_size[2]);        
		//                      npc_bbox_5 = addf(npc_bbox_5,npc_bbox_size[2]);        
		//              }                
		//              else{            
		//                      npc_bbox_2 = addf(npc_bbox_2,npc_bbox_size[2]);        
		//                      npc_bbox_5 = subf(npc_bbox_5,npc_bbox_size[2]);        
		//              };
		//      };
		//first point, chceck if it part of bbox x segment
		
		//Additional +80.0 to box height
		npc_bbox_4 = addf(npc_bbox_4,mkf(80));  
		
		if(GF(npc_bbox_0,npc_bbox_3))
		{
			hlp = npc_bbox_0;
			npc_bbox_0 = npc_bbox_3;
			npc_bbox_3 = hlp;
		};     
		if(GF(npc_bbox_1,npc_bbox_4))
		{
			hlp = npc_bbox_1;
			npc_bbox_1 = npc_bbox_4;
			npc_bbox_4 = hlp;
		};
		if(GF(npc_bbox_2,npc_bbox_5))
		{
			hlp = npc_bbox_2;
			npc_bbox_2 = npc_bbox_5;
			npc_bbox_5 = hlp;
		};
		
		//print all values:
		printdebug("[DamageBox]******************************");
		printdebug_s_f_s_f_s_f("[DamageBox]X: ",npc_bbox_0," <= ",HeroDamage_Hitpos1_X," <= ",npc_bbox_3);
		printdebug_s_f_s_f_s_f("[DamageBox]Y: ",npc_bbox_1," <= ",HeroDamage_Hitpos1_Y," <= ",npc_bbox_4);
		printdebug_s_f_s_f_s_f("[DamageBox]z: ",npc_bbox_2," <= ",HeroDamage_Hitpos1_z," <= ",npc_bbox_5);
		
		if(hand==RIGHTHAND_WEAPON)
		{      
			
			if(LEF(npc_bbox_0,HeroDamage_Hitpos1_X))&&(LEF(HeroDamage_Hitpos1_X,npc_bbox_3))
			{//n[0]<=w[0]<=n[3]
				ret_sum+=1;    
			};     
			if(LEF(npc_bbox_0,HeroDamage_Hitpos2_X))&&(LEF(HeroDamage_Hitpos2_X,npc_bbox_3))
			{//n[0]<=w2[0]<=n[3]
				ret_sum+=10;   
			};     
			
			//OPTIMISATION THING:
			//If x ptr out of bbox bounds
			//skip rest of operations
			//-Orcwarrior, August 25, 2010 08:26:44 PM
			if (!ret_sum)
			{ return 0;};
			
			
			//y:
			if(ret_sum%10==1)&&(LEF(npc_bbox_1,HeroDamage_Hitpos1_Y))&&(LEF(HeroDamage_Hitpos1_Y,npc_bbox_4))
			{      
				ret_sum+=1;    
			};       
			if(ret_sum/10>=1)&&(LEF(npc_bbox_1,HeroDamage_Hitpos2_Y))&&(LEF(HeroDamage_Hitpos2_Y,npc_bbox_4))
			{              
				ret_sum+=10;   
			};       
			
			//OPTIMISATION THING:
			if (ret_sum/10<2)&&(ret_sum%10!=2)
			{ return 0;};
			
			//z:
			if(ret_sum%10==2)&&(LEF(npc_bbox_2,HeroDamage_Hitpos1_Z))&&(LEF(HeroDamage_Hitpos1_Z,npc_bbox_5))
			{      
				ret_sum+=1;    
			};
			if(ret_sum/10>=2)&&(LEF(npc_bbox_2,HeroDamage_Hitpos2_Z))&&(LEF(HeroDamage_Hitpos2_Z,npc_bbox_5))
			{      
				ret_sum+=10;   
			};             
			
			if(ret_sum/10>=3)||(ret_sum%10==3)
			{
				//Set New Aiviar
				nPtr = ptr_npc+576;
				nPtr = nPtr + AIV_DAMAGEID*4;  
				hlp = MEM_ReadInt(nPtr);
				
				//if(ret_sum%10==3)&&(ret_sum/10-(ret_sum%1)==3)
				
				//      hlp = hlp%10;
				if(hlp==HeroDamage_DamageID+2)
				{
					hlp = HeroDamage_DamageID+3;
				}
				else
				{                              
					hlp = HeroDamage_DamageID+1;
				};
				//      var int j;
				//      j = hlp%10;
				//      if(j>3)
				//      {
				//      hlp = hlp - j + 3;     
				//      };
				MEM_WriteInt(nPtr,hlp);
			};
			
		}
		//--------------------------------
		//--------------------------------
		//--------------------------------
		else// LEFTHAND SWORD
		{
			
			if(LEF(npc_bbox_0,HeroDamage_Hitpos1L_X))&&(LEF(HeroDamage_Hitpos1L_X,npc_bbox_3))
			{//n[0]<=w[0]<=n[3]
				printscreen("X1 - in",75,10,"font_default.tga",1);
				ret_sum+=1;    
			};     
			if(LEF(npc_bbox_0,HeroDamage_Hitpos2L_X))&&(LEF(HeroDamage_Hitpos2L_X,npc_bbox_3))
			{//n[0]<=w2[0]<=n[3]
				printscreen("X2 - in",85,10,"font_default.tga",1);     
				ret_sum+=10;   
			};     
			//OPTIMISATION THING:
			//If x ptr out of bbox bounds
			//skip rest of operations
			//-Orcwarrior, August 25, 2010 08:26:44 PM
			if (!ret_sum)
			{ return 0;};
			
			
			//y:
			
			if(ret_sum%10==1)&&(LEF(npc_bbox_1,HeroDamage_Hitpos1L_Y))&&(LEF(HeroDamage_Hitpos1L_Y,npc_bbox_4))
			{      
				printscreen("Y1 - in",75,13,"font_default.tga",1);
				ret_sum+=1;     };     
			if(ret_sum/10>=1)&&(LEF(npc_bbox_1,HeroDamage_Hitpos2L_Y))&&(LEF(HeroDamage_Hitpos2L_Y,npc_bbox_4))
			{              
				printscreen("Y2 - in",85,13,"font_default.tga",1);
				ret_sum+=10;    };     
			
			//OPTIMISATION THING:
			if (ret_sum/10<2)&&(ret_sum%10!=2)
			{ return 0;};
			
			
			//z:
			if(ret_sum%10==2)&&(LEF(npc_bbox_2,HeroDamage_Hitpos1L_Z))&&(LEF(HeroDamage_Hitpos1L_Z,npc_bbox_5))
			{      
				printscreen("Z1 - in",75,16,"font_default.tga",1);
				ret_sum+=1;     }
			if(ret_sum/10>=2)&&(LEF(npc_bbox_2,HeroDamage_Hitpos2L_Z))&&(LEF(HeroDamage_Hitpos2L_Z,npc_bbox_5))
			{              
				printscreen("Z2 - in",85,16,"font_default.tga",1);
				ret_sum+=10;    };             
			
			if(ret_sum/10>=3)||(ret_sum%10==3)
			{
				//Set New Aiviar
				nPtr = ptr_npc+576;
				nPtr = nPtr + AIV_DAMAGEID*4;  
				hlp = MEM_ReadInt(nPtr);
				
				//if(ret_sum%10==3)&&(ret_sum/10-(ret_sum%1)==3)
				
				//      hlp = hlp%10;
				if(hlp==HeroDamage_DamageID+1)
				{
					hlp = HeroDamage_DamageID+3;
				}
				else
				{                              
					hlp = HeroDamage_DamageID+2;
				};
				//      var int j;
				//      j = hlp%10;
				//      if(j>3)
				//      {
				//      hlp = hlp - j + 3;     
				//      };
				MEM_WriteInt(nPtr,hlp);
			};
			
		};     
		
		return ret_sum;
		
	};
	
	//#####################################################
	//
	// HeroDamageInit
	//-------
	// Function init vars connected with hero
	// like:
	// -vec3 of hero swd's points; -hero attack frame;
	// -refresh DamageID -Set SWD Damage
	//--
	//TODO: Implement left sword, set SWD Damage only if weapon differs.
	//
	//#####################################################
	
	func void HeroDamageInit()
	{
		var int heroptr; var int combonum;
		var c_item item;
		if(!R_SWDDMG_PTR)
		||((DUALEQUIPED)&&(!L_SWDDMG_PTR))
		{return;};     
		HeroDamage_NextCombo=FALSE;//reset
		
		//combo chceck id
		//init if null-ptr or wrong
		heroptr = MEM_InstGetOffset(hero);     
		HeroAniCtrl_Offset = MEM_ReadInt(heroptr+2488);//anictrl               
		combonum = MEM_ReadInt(HeroAniCtrl_Offset+436);//combonr
		
		HeroDamage_lastcombo = combonum;       
		//BS - CHECK if !HIT =>quit
		if((HeroDamage_lastBS==32794)//last bs was hit
				&&(Npc_GetBodyState(hero)!=32794))//now bs isn't a hit
		||(HeroDamage_lastcombo>combonum)
		{
			HeroDamage_ComboCounter+=1;    
			HeroDamage_NextCombo=TRUE;
			//recalculate id
			//      HeroDamage_DamageID = 10*HeroDamage_lastcombo + 100*HeroDamage_ComboCounter;   
			//      HeroDamage_DamageID += 1;              
			
		};             
		HeroDamage_lastBS = Npc_GetBodyState(hero);
		if(Npc_GetBodyState(hero)!=32794)
		{ return; };
		
		/*             
					v1_x    v2_x    v3_x    x
					v1_y    v2_y    v3_y    y
					v1_z    v3_z    v3_z    z
					0               0               0               0
					*/
		var int m11,var int m14;
		var int m21,var int m24;
		var int m31,var int m34;
		var int dist;
		//------------------
		// Right Hand
		//------------------
		
		m11 =  MEM_ReadInt(R_SWDDMG_PTR+60);
		m14 =  MEM_ReadInt(R_SWDDMG_PTR+72);
		
		m21 =  MEM_ReadInt(R_SWDDMG_PTR+76);
		m24 =  MEM_ReadInt(R_SWDDMG_PTR+88);
		
		m31 =  MEM_ReadInt(R_SWDDMG_PTR+92);
		m34 =  MEM_ReadInt(R_SWDDMG_PTR+104);  
		
		item = Npc_GetReadiedWeapon(hero);
		dist = mkf(item.range);
		dist = negf(dist);//-N
		
		
		
		
		
		
		HeroDamage_Hitpos1_X = mulf(dist,m11);
		HeroDamage_Hitpos1_Y = mulf(dist,m21);
		HeroDamage_Hitpos1_Z = mulf(dist,m31);
		
		HeroDamage_Hitpos1_X = addf(HeroDamage_Hitpos1_X,m14);
		HeroDamage_Hitpos1_Y = addf(HeroDamage_Hitpos1_Y,m24);
		HeroDamage_Hitpos1_Z = addf(HeroDamage_Hitpos1_Z,m34);
		
		
		dist = divf(dist,mkf(2));//-N/2
		
		HeroDamage_Hitpos2_X = mulf(m11, dist);
		HeroDamage_Hitpos2_Y = mulf(m21, dist);
		HeroDamage_Hitpos2_Z = mulf(m31, dist);
		
		HeroDamage_Hitpos2_X = addf(HeroDamage_Hitpos2_X,m14);
		HeroDamage_Hitpos2_Y = addf(HeroDamage_Hitpos2_Y,m24);
		HeroDamage_Hitpos2_Z = addf(HeroDamage_Hitpos2_Z,m34);         
		
		//---------------------
		// LeftSword
		//---------------------
		if(DualEquiped)
		{
			var int lswd;
			lswd = MEM_InstGetOffset(LSWD_ID);
			
			m11 =  MEM_ReadInt(L_SWDDMG_PTR+60);
			m14 =  MEM_ReadInt(L_SWDDMG_PTR+72);
			
			m21 =  MEM_ReadInt(L_SWDDMG_PTR+76);
			m24 =  MEM_ReadInt(L_SWDDMG_PTR+88);
			
			m31 =  MEM_ReadInt(L_SWDDMG_PTR+92);
			m34 =  MEM_ReadInt(L_SWDDMG_PTR+104);  
			
			dist = MEM_ReadInt(lswd+568);
			
			dist = mkf(dist+20);
			dist = negf(dist);//-N
			
			HeroDamage_Hitpos1L_X = mulf(dist,m11);
			HeroDamage_Hitpos1L_Y = mulf(dist,m21);
			HeroDamage_Hitpos1L_Z = mulf(dist,m31);
			
			HeroDamage_Hitpos1L_X = addf(HeroDamage_Hitpos1L_X,m14);
			HeroDamage_Hitpos1L_Y = addf(HeroDamage_Hitpos1L_Y,m24);
			HeroDamage_Hitpos1L_Z = addf(HeroDamage_Hitpos1L_Z,m34);
			
			
			dist = divf(dist,mkf(2));//-N/2
			
			HeroDamage_Hitpos2L_X = mulf(m11, dist);
			HeroDamage_Hitpos2L_Y = mulf(m21, dist);
			HeroDamage_Hitpos2L_Z = mulf(m31, dist);
			
			HeroDamage_Hitpos2L_X = addf(HeroDamage_Hitpos2L_X,m14);
			HeroDamage_Hitpos2L_Y = addf(HeroDamage_Hitpos2L_Y,m24);
			HeroDamage_Hitpos2L_Z = addf(HeroDamage_Hitpos2L_Z,m34);               
		};
		
		
		//if hitaniid! lasthitaniid - combos count++
		var int herohitaniid;
		herohitaniid = MEM_ReadInt(HeroAniCtrl_Offset+448);
		if(HeroDamage_NextCombo==FALSE)
		{              
			if(HeroDamage_LastHeroHitAniID)
			{
				if(herohitaniid!=HeroDamage_LastHeroHitAniID)
				{
					HeroDamage_ComboCounter+=1;    
					//recalculate id ->moved
					
				};
			};
		};
		HeroDamage_LastHeroHitAniID = herohitaniid;
		
		//recalculate id
		HeroDamage_DamageID = 10*HeroDamage_lastcombo + 100*HeroDamage_ComboCounter;   
		//HeroDamage_DamageID += 1;                    
		
		// debug - off
		var int bla;
		bla = MEM_ReadInt(HeroAniCtrl_Offset+448);      
		
		//      /*dbg*/printscreen(concatstrings("CollPool_LastPos= ",inttostring(CollPool_LastPos)),3,77, "font_default.tga", 5);
		//      /*dbg*/printscreen(concatstrings("combonum= ",inttostring(HeroDamage_lastcombo)),3,80, "font_default.tga", 5);
		//      /*dbg*/printscreen(concatstrings("ComboCounter= ",inttostring(HeroDamage_ComboCounter)),3,83, "font_default.tga", 5);
		//      /*dbg*/printscreen(concatstrings("hitAniID= ",inttostring(bla)),3,86, "font_default.tga", 5);
		//      /*dbg*/printscreen(concatstrings("HeroDamage_DamageID= ",inttostring(HeroDamage_DamageID)),3,89, "font_default.tga", 5);
		//      //damage
		//      //damagetotal
		var int val;
		
		//---------------------
		// RightSword
		//---------------------        
		if(item.damageTotal)
		{
			HeroDamage_Damage_Edge = item.damageTotal;
		}
		else
		{
			if(item.damage[DAM_INDEX_BLUNT])
			{
				HeroDamage_Damage_Blunt = item.damage[DAM_INDEX_BLUNT];        
			}
			else if (item.damage[DAM_INDEX_EDGE])
			{
				HeroDamage_Damage_Edge = item.damage[DAM_INDEX_EDGE];                  
			}
			else if (item.damage[DAM_INDEX_FIRE])
			{
				HeroDamage_Damage_Fire = item.damage[DAM_INDEX_FIRE];                          
			}
			else if (item.damage[DAM_INDEX_FLY])
			{
				HeroDamage_Damage_Fly = item.damage[DAM_INDEX_FLY];                            
			}
			else if (item.damage[DAM_INDEX_MAGIC])
			{
				HeroDamage_Damage_Magic = item.damage[DAM_INDEX_MAGIC];                        
			};
		};
		
		//---------------------
		// Duals
		//---------------------
		if(DualEquiped)
		{      
			//---------------------
			// LeftSword
			//---------------------
			if(MEM_ReadInt(lswd+328))//DAmagetotal
			{
				HeroDamage_L_Damage_Edge = MEM_ReadInt(lswd+328);
			}
			else
			{
				if(MEM_ReadInt(lswd+332))
				{
					HeroDamage_L_Damage_Blunt = MEM_ReadInt(lswd+332);                             
				}
				else if (MEM_ReadInt(lswd+336))
				{
					HeroDamage_L_Damage_Edge = MEM_ReadInt(lswd+336);                              
				}
				else if (MEM_ReadInt(lswd+340))
				{
					HeroDamage_L_Damage_Fire = MEM_ReadInt(lswd+340);                      
				}
				else if (MEM_ReadInt(lswd+344))
				{
					
					HeroDamage_L_Damage_Fly = MEM_ReadInt(lswd+344);                               
				}
				else if (MEM_ReadInt(lswd+348))
				{
					HeroDamage_L_Damage_Magic = MEM_ReadInt(lswd+348);                     
				};
			};
		};     
		if(DualEquiped)
		{      
			HeroDamage_CriticalChance = 50;
		}
		else
		{      
			if((item.flags & ITEM_AXE)==ITEM_AXE)||((item.flags & ITEM_AXE)==ITEM_SWD)
			{
				HeroDamage_CriticalChance =     Npc_GetTalentValue(hero,NPC_TALENT_1H);
			}
			else
			{
				HeroDamage_CriticalChance =     Npc_GetTalentValue(hero,NPC_TALENT_2H);                        
			};
		};
		
	};
	//#####################################################
	//
	// NPC Collide Pool Varibles
	//-------
	// Contains varibles of Npc Collide Pool
	// unfortunaly it has to been mixed with HeroDamage_*
	// funcs ;(
	//--
	//
	//#####################################################
	//Based on poison pool script + some modifications
	
	
	const int CollPool_limit=31; //maksymalna liczba w puli potencjalnych obra¿eñ
	var int CollPool_LastPos;//last used pos more npcs value decreases
	var int CollPool_Guild_bitfield;// 1<<0 till 1<<28
	//if guild*1 bit is on (one npc of this guild is in pool
	//if guild*2 bit is on (there is more npc of this guild in pool)
	
	
	//#####################################################
	//
	// GetCollPoolLastPos
	//-------
	// Function return last free index of Npc Collide Pool
	// if nothing fount return 0
	//--
	//
	//#####################################################
	
	func int GetCollPoolLastPos()
	{
		// Whole aiv'ar/perc disable functionality
		// is disabled
		return 0;      
		
	};
	//#####################################################
	//
	// CountGil_CollPool
	//-------
	// Function return last free index of Npc Collide Pool
	// if nothing fount return 0
	//--
	//
	//#####################################################
	
	func int CountGil_CollPool(var int guild)
	{
		
		// Whole aiv'ar/perc disable functionality
		// is disabled
		return 0;      
		
	};
	//#####################################################
	//
	// purge_CollPool
	//-------
	// Function frees index of Collide Pool for later use
	//--
	//
	//#####################################################
	func void purge_CollPool(var c_npc victim, var int i)
	{
		// Whole aiv'ar/perc disable functionality
		// is disabled
		return;
		
	};
	
	//#####################################################
	//
	// HeroDamage_CanDoHit_CNPCPass
	//-------
	// Function check if NPC can pass through circumstances
	// of being attacked by hero.
	// It Checks:
	// -If npcs is Dead/Down
	// -If npc is friend and isn't target of hero attack
	// -If npc is neutral and isn't target of hero attack
	//  & hero isn't target of npc's attack.
	// returns:
	// 0 - npc can't be attacked
	// 1 - npc can be attacked by hero
	//--
	//
	//#####################################################
	
	func int HeroDamage_CanDoHit_CNPCPass(var c_npc npc,var int hand)
	{
		//Unusual events:
		// *OR Attack, hero can't even hit non GIL_DMB
		if(GrdNumSpawned)&&(npc.guild!=GIL_DMB)
		{
			return 0;
		};
		
		
		
		//Unconscious/dead -> skip
		var int trgt; var int npc_ptr; var ocnpc her;
		her = hlp_getnpc(hero);
		if(Npc_GetAivar(npc,AIV_DAMAGEID)==HeroDamage_DamageID+1)
		||((DualEquiped)&&(
		((hand==RIGHTHAND_WEAPON)&&(Npc_GetAivar(npc,AIV_DAMAGEID)==HeroDamage_DamageID+1)) ||
		((hand==LEFTHAND_WEAPON)&&(Npc_GetAivar(npc,AIV_DAMAGEID)==HeroDamage_DamageID+2))      ||
		(Npc_GetAivar(npc,AIV_DAMAGEID)==HeroDamage_DamageID+3)
		))
		{
			printdebug(">>>>>>>skip damage[cnpc]->hitten b4");
			return 0;
		};
		
		
		if(Npc_IsInState(npc,ZS_Dead))||(Npc_IsInState(npc,ZS_Unconscious))
		||      (Npc_IsInState(npc,ZS_MagicSleep))
		{       var string msg;
			msg = concatstrings(">>>>>>>skip damage[",npc.name);
			msg = concatstrings(msg,"]");
			printdebug(msg);
			return 0;
		}      
		//exceptions: Snaf Molerat,...
		else if(Npc_GetAivar(npc,AIV_MM_REAL_ID)==ID_SNAF_MOLERAT)
		{
			return 0;
		}
		else if((Npc_GetAttitude(npc,hero)==ATT_FRIENDLY)||(npc.flags == NPC_FLAG_FRIEND)||(Npc_GetAivar(npc,AIV_PARTYMEMBER)==true))&&(HeroDamage_HostileEnemies!=0)
		{
			trgt = her.focus_vob;
			npc_ptr = oCNpc_GetPointer(npc);
			if(trgt!=npc_ptr)//if npc is hero target - > add to pool
			{
				printdebug(">>F>>>>>>>>v!=hero.enemy");
				return 0;              
			};
		}
		else if(Npc_GetAttitude(npc,hero)==ATT_NEUTRAL)&&(HeroDamage_HostileEnemies!=0)&&(HeroDamage_TimeHeroAttackedNeutralFocus==0)
		{
			trgt = her.focus_vob;
			npc_ptr = oCNpc_GetPointer(npc);
			if(trgt!=npc_ptr)//if npc is hero target - > add to pool
			{
				printdebug(">>N>>>>>>>>v!=hero.enemy");
				return 0;              
			};     
			
			//              h_ptr =  oCNpc_GetPointer(hero);
			//              v_enemy_ptr =  oCNpc_GetPointer(npc)+892;//enemy
			//              v_enemy_ptr = MEM_ReadInt(v_enemy_ptr);
			//              if(h_ptr!=v_enemy_ptr)&&(Npc_IsInState(npc,ZS_Attack))//if his target is NOT hero an he is attacking   
			//              {
			//                      purge_CollPool(npc,idx);
			//                      print(">>N>>>>>>>>>>>hero!=v.enemy&& attack");
			//                      return 0;              
			//              };     
		}
		
		else
		{      
			return 1;      
		};
		
	};
	//#####################################################
	//
	// HeroDamage_CanDoHit_PointerPass
	//-------
	// Function check if oCNpc* can pass through circumstances
	// of being attacked by hero.
	// It Checks:
	// -If npcs wasn't attacked at theese combo hit
	// returns:
	// 0 - npc can't be attacked
	// 1 - npc can be attacked by hero
	//--
	// TODO: Include LeftSword to check
	// DISABLED
	//#####################################################
	func int HeroDamage_CanDoHit_PointerPass(var int pnpc)
	{
		//      var int hlp1, var int hlp2;
		//      var int nPtr;
		//      nPtr = pnpc;
		//      nPtr += 576;
		//      nPtr = nPtr + AIV_DAMAGEID*4;  
		//      hlp2 = MEM_ReadInt(nPtr);
		//      hlp1 = hlp2/100 - (hlp2%1);
		//      hlp1 = HeroDamage_DamageID/100 - (HeroDamage_DamageID%1);
		//      printdebug("hero_damageid/lastherodamage(aiv'ar)[hlp2]/hlp1");
		//      printdebug(inttostring(HeroDamage_DamageID));
		//      printdebug(inttostring(hlp2));
		//      printdebug(inttostring(hlp1));
		
		//      var int hp;
		//      hp = MEM_ReadInt(pnpc+388);
		//      if(HeroDamage_DamageID==hlp2)//the same id
		//      //      ||((hlp1==hlp2)&&(MEM_ReadInt(nPtr)%10==3))//dual sth?
		//      {      
		//              printdebug(">>>>>>>skip damage[pointer]");
		//              return 0;
		//      }
		//      else
		//      {
		
		return 1;      
		//      };
		
	};
	//#####################################################
	//
	// HeroDamage_SetDamageToNpc
	//-------
	// Function passing pure hero damage trough npc
	// protections + dividing damage by 2 if hero wasn't
	// "touched" npc bbox by edge of his sword & half of long of blade
	// (means weapon.range/2)
	// Function adding hero strenght to damage if it was critical hit.
	// (Based on random). If damage was deadly, func's put npc to unconscious.
	// Elsewhere enemy start stumble ani, play sounds.
	//--
	// TODO:
	// -ADD BloodFX
	// - RITE NOW ALL IS WORKING PROPERLY DONT TOUCH!
	//#####################################################
	func void HeroDamage_SetDamageToNpc(var int dmg_mul,var int dmg,var c_npc target,var int hand)
	{
		var int dmg_deadly;//bool
		var int dmg_sum;
		var int target_ptr; var int ocnpc_attacker;
		var int a1; var int b1;
		var int a2; var int b2;
		var c_item item;
		item = Npc_GetReadiedWeapon(hero);
		dmg_sum=0;     
		target_ptr = oCNpc_GetPointer(target);
		ocnpc_attacker = oCNpc_GetPointer(hero);
		if(Npc_IsPlayer(target)){printdebug("Set damage to hero! SKIP"); return; };
		
		if(hand == RIGHTHAND_WEAPON)
		{      
			dmg_sum=hero.attribute[ATR_STRENGTH];
			if(item.damageTotal)&&((dmg%10==3)||(dmg/30>=1))
			{
				
				dmg_sum += (HeroDamage_Damage_Edge - (HeroDamage_Damage_Edge%dmg_mul))/dmg_mul;
				if(Hlp_Random(101)<=HeroDamage_CriticalChance)
				{
					dmg_sum += dmg_sum;//2x multipiler                                     
				};
				dmg_sum -= target.protection[DAM_INDEX_EDGE];
				
			}
			else if((dmg%10==3)||(dmg/30>=1))
			{
				if(HeroDamage_Damage_Blunt)
				{
					dmg_sum += (HeroDamage_Damage_Blunt - (HeroDamage_Damage_Blunt%dmg_mul))/dmg_mul;
					if(Hlp_Random(101)<=HeroDamage_CriticalChance)
					{
						dmg_sum += dmg_sum;                                    
					};
					dmg_sum -= target.protection[DAM_INDEX_BLUNT];                         
				}
				else if (HeroDamage_Damage_Edge)
				{
					dmg_sum += (HeroDamage_Damage_Edge - (HeroDamage_Damage_Edge%dmg_mul))/dmg_mul;
					if(Hlp_Random(101)<=HeroDamage_CriticalChance)
					{
						dmg_sum += hero.attribute[ATR_STRENGTH];                                       
					};
					dmg_sum -= target.protection[DAM_INDEX_EDGE];  
					
				}
				else if (HeroDamage_Damage_Fire)
				{
					dmg_sum += (HeroDamage_Damage_Fire - (HeroDamage_Damage_Fire%dmg_mul))/dmg_mul;
					dmg_sum -= target.protection[DAM_INDEX_FIRE];                                  
					dmg_deadly=true;                               
				}
				else if (HeroDamage_Damage_Fly)
				{
					dmg_sum += (HeroDamage_Damage_Fly - (HeroDamage_Damage_Fly%dmg_mul))/dmg_mul;
					dmg_sum -= target.protection[DAM_INDEX_FLY];                                   
					dmg_deadly=true;                                       
				}
				else if (HeroDamage_Damage_Magic)
				{
					dmg_sum += (HeroDamage_Damage_Magic - (HeroDamage_Damage_Magic%dmg_mul))/dmg_mul;      
					dmg_sum -= target.protection[DAM_INDEX_MAGIC];                                 
					dmg_deadly=true;                                       
				};
			};     
			
		}
		else
		{
			dmg_sum=hero.attribute[ATR_STRENGTH];
			if(HeroDamage_L_Damage_Edge)&&((dmg%10==3)||(dmg/30>=1))
			{
				
				dmg_sum += (HeroDamage_L_Damage_Edge - (HeroDamage_L_Damage_Edge%dmg_mul))/dmg_mul;    
				if(Hlp_Random(101)<=HeroDamage_CriticalChance)
				{
					dmg_sum += dmg_sum;                                    
				};
				dmg_sum -= target.protection[DAM_INDEX_EDGE];
				
			}
			else if((dmg%10==3)||(dmg/30>=1))
			{
				if(HeroDamage_L_Damage_Blunt)
				{
					dmg_sum += (HeroDamage_L_Damage_Blunt - (HeroDamage_L_Damage_Blunt%dmg_mul))/dmg_mul;  
					if(Hlp_Random(101)<=HeroDamage_CriticalChance)
					{
						dmg_sum += dmg_sum;                                    
					};
					dmg_sum -= target.protection[DAM_INDEX_BLUNT];                         
				}
				else if (HeroDamage_L_Damage_Edge)
				{
					dmg_sum += (HeroDamage_L_Damage_Edge - (HeroDamage_L_Damage_Edge%dmg_mul))/dmg_mul;    
					if(Hlp_Random(101)<=HeroDamage_CriticalChance)
					{
						dmg_sum += hero.attribute[ATR_STRENGTH];                                       
					};
					dmg_sum -= target.protection[DAM_INDEX_EDGE];  
					
				}
				else if (HeroDamage_L_Damage_Fire)
				{
					dmg_sum += (HeroDamage_L_Damage_Fire - (HeroDamage_L_Damage_Fire%dmg_mul))/dmg_mul;    
					dmg_sum -= target.protection[DAM_INDEX_FIRE];                                  
					dmg_deadly=true;                               
				}
				else if (HeroDamage_L_Damage_Fly)
				{
					dmg_sum += (HeroDamage_L_Damage_Fly - (HeroDamage_L_Damage_Fly%dmg_mul))/dmg_mul;      
					dmg_sum -= target.protection[DAM_INDEX_FLY];                                   
					dmg_deadly=true;                                       
				}
				else if (HeroDamage_L_Damage_Magic)
				{
					dmg_sum += (HeroDamage_L_Damage_Magic - (HeroDamage_L_Damage_Magic%dmg_mul))/dmg_mul;          
					dmg_sum -= target.protection[DAM_INDEX_MAGIC];                                 
					dmg_deadly=true;                                       
				};
			};     
			
			
		};
		
		if(dmg_sum>=1)
		{
			PRINTdebug("DAMAGE-SUM:");
			PRINTdebug(inttostring(dmg_sum));      
			printdebug_s_i("DMG:attacker=",ocnpc_attacker);
			printdebug(concatstrings("DMG:target=",MEM_ReadString(target_ptr+16)));        
			
			
			//special reaction to combat damage:
			B_SpecialCombatDamageReaction(target,hero);
			
			//-------------------------------
			//Target is human
			//-Set to unconscious
			if      (target.guild<GIL_SEPERATOR_HUM)&&
			(!dmg_deadly)&&
			(target.attribute[ATR_HITPOINTS]-dmg_sum<=0)&&
			(!Npc_IsInState(target,ZS_Unconscious))&&
			(!(target.flags & NPC_FLAG_INSTANTDEATH))
			//&&((target.flags & NPC_FLAG_IMMORTAL) != NPC_FLAG_IMMORTAL)
			{
				CALL_IntParam (0);
				CALL_IntParam (ocnpc_attacker);
				CALL__thiscall (target_ptr, oCNpc__DropUnconscious_offset);
				
				Npc_SendPassivePerc             (hero,PERC_ASSESSDEFEAT,target,hero);
				//sets aiv'ar:
				Npc_SetAivar(target,AIV_WASDEFEATEDBYSC,  TRUE);                      
				B_DamageSysGiveXP(target,1);
				
			}
			//-------------------------------
			//Target is human/monster
			//-Do Die
			else if ((target.guild<GIL_SEPERATOR_HUM)&&(dmg_deadly))||(target.guild>=GIL_SEPERATOR_HUM)&&(target.attribute[ATR_HITPOINTS]-dmg_sum<=0)
			||((target.flags & NPC_FLAG_INSTANTDEATH) && (target.attribute[ATR_HITPOINTS]-dmg_sum<=0))
			//&&((target.flags & NPC_FLAG_IMMORTAL) != NPC_FLAG_IMMORTAL)
			{
				target.attribute[ATR_HITPOINTS]=0;
				CALL_IntParam (ocnpc_attacker);
				CALL__thiscall (target_ptr, oCNpc__DoDie_offset);
				Npc_ClearAiQueue(target);      
				AI_StandUpQuick(target);
				CALL_IntParam (0);
				CALL__thiscall (target_ptr, oCNpc__DoDie_offset);
				B_DamageSysGiveXP(target,1);
				//sets aiv'ar:
				Npc_SetAivar(target,AIV_WASDEFEATEDBYSC,  TRUE);                      
			}
			//normal damage
			else if(!Npc_IsDead(target))
			//&&((target.flags & NPC_FLAG_IMMORTAL) != NPC_FLAG_IMMORTAL)
			{
				target.attribute[ATR_HITPOINTS]-=dmg_sum;
				printdebug("L_HURTANI!");
				Npc_ClearAiQueue(target);      
				AI_PlayAni(target,"T_STUMBLE");
				Npc_SendSinglePerc      (hero,target,PERC_ASSESSDAMAGE);
				Npc_SendPassivePerc             (hero,PERC_ASSESSFIGHTSOUND,target,hero);
				
				
			};             
		};     
		//if(dmg_sum)
		//{
		//     
		//      //Snd_Play3D(target,ConcatStrings("SVM_3_AARGH_",IntToString(Hlp_Random(4)+1)));
		//     
		//};   
		Snd_Play3D(hero,ConcatStrings("CS_IAM_ME_FL_A",IntToString(Hlp_Random(4)+1)));
		
	};
	
	
	//#####################################################
	//
	// HeroDamage_CheckNpc
	//-------
	// Function unused, right now it's done by CollPool_NpcListCheck
	//--
	//#####################################################
	
	// func int HeroDamage_CheckNpc(var c_npc target)
	// {
	//      var int ptr;
	//      var int dmg;
	//      var int dmg_mul;
	//      //      printdebug("dmg-npc-id=");
	//      //      printdebug(inttostring(target.id));
	//      if(!Hlp_IsValidNpc(target))
	//      { return 0; };         
	//      if(HeroDamage_CanDoHit_CNPCPass(target))
	//      {
	//              ptr = oCNpc_GetPointer(target);
	
	//              if(HeroDamage_CanDoHit_PointerPass(ptr))
	//              {
	//                      dmg = I_Npc_CollideWithHeroWeapon(ptr);
	//                      dmg_mul=0;
	//                      if(dmg/30>=1)
	//                      {
	//                              dmg_mul+=1;
	//                      };
	//                      if(dmg%10==3)
	//                      {
	//                              dmg_mul+=1;
	//                      };
	
	//                      if(dmg_mul>0)//not touched by weapon - skip the rest
	//                      {
	//                              print("dmg-mul=");
	//                              print(inttostring(dmg_mul));
	//                              HeroDamage_SetDamageToNpc(dmg_mul,dmg,target);
	//                      };
	//              };     
	//      };     
	// };
	//#####################################################
	//
	// HeroDamage_HeroCanDoHit
	//-------
	// Function checking if hero can do hit right now
	// - Check if hero is in any hitanimation
	// - check if hero hit animation has proper frame
	// ("hit window" oppened)
	// 1 = yes he can
	// 0 = no
	//--
	// TODO:
	// -Left sword implementation
	//#####################################################
	
	func int HeroDamage_HeroCanDoHit()
	{
		//1st pass
		var int BS;
		//2nd pass
		var int combo_frame; var int hit_begin_frame; var int hit_end_frame;
		var int combonum; var int heroptr;
		
		BS = Npc_GetBodyState(hero);
		if(BS!=32794)//BS_HIT
		{      
			//recalculate hitID rite now
			//cuz HeroDamage_Init func don't even init
			if(HeroDamage_lastBS==32794)
			{
				HeroDamage_ComboCounter+=1;    
				HeroDamage_NextCombo=TRUE;
				//recalculate id
				HeroDamage_DamageID = 10*HeroDamage_lastcombo + 100*HeroDamage_ComboCounter;   
				
			};     
			HeroDamage_lastBS = BS;        
			return 0;
		};
		
		var oCNpc hiro;
		hiro = Hlp_GetNpc (hero);
		heroptr = MEM_InstToPtr(hiro);
		printdebug_s_i("LOL hiro(read): ", heroptr);
		
		heroptr = MEM_InstGetOffset(hero);  
		printdebug_s_i("LOL hero(read): ", MEM_ReadInt(heroptr));
		HeroAniCtrl_Offset = MEM_ReadInt(heroptr+2488);//anictrl               
		combonum = MEM_ReadInt(HeroAniCtrl_Offset+436);//combonr
		combo_frame = truncf(MEM_ReadInt(HeroAniCtrl_Offset+444));
		hit_begin_frame = MEM_ReadInt(HeroAniCtrl_Offset+460 + 4*6*combonum)-2 ;//-2y
		hit_end_frame = MEM_ReadInt(HeroAniCtrl_Offset+464 + 4*6*combonum)+1;//+1
		if (hit_begin_frame>combo_frame) || (hit_end_frame<combo_frame)
		{//combo frame is out of bound of hit frames
			return 0;      
		};
		
		//Sprint resetUpClick - toggle sprint on/off is unwelcome during fight combo
		Sprint_UpClicked = 0;
		
		return 1;
		
	};
	
	
	
	
	
	
	//#####################################################
	//
	// add_CollPool_rec
	//-------
	// Function add_CollPool recursion
	//
	//--
	//
	//#####################################################
	func void add_CollPool_rec(var c_npc victim, var int i)
	{
		// Whole aiv'ar/perc disable functionality
		// is disabled
		return;
	};
	//#####################################################
	//
	// add_CollPool_check_smaller_indexes
	//-------
	// Function checking if there is any free indexes before
	// CollPool_LastPos, so it can be filled with new npc.
	// returns:
	// x - index of smaller, free index
	// -1 - nothing found
	//--
	//
	//#####################################################
	
	func int  add_CollPool_check_smaller_indexes()
	{
		// Whole aiv'ar/perc disable functionality
		// is disabled
		return 0;      
		
	};
	//#####################################################
	//
	// add_CollPool
	//-------
	// Function adds victim to the Npc Collide Pool list
	// first, it checks if npc isn't at list already
	// then check if hero can be added (isn't a friend, etc.)
	// at end it chose optimal index for new NPC, and send
	// recursion to *_rec
	//--
	// -It east to make some npc totally immune under some circumstances.
	//#####################################################
	func void add_CollPool(var c_npc victim)
	{
		// Whole aiv'ar/perc disable functionality
		// is disabled
		return;
		
		
	};
	
	
	func void add_CollPool_nocheck(var c_npc victim)
	{
		// Whole aiv'ar/perc disable functionality
		// is disabled
		return;
		
	};
	
	
	//#####################################################
	//
	// CollPool_check_rec
	//-------
	// Function is per trigger check recursion.
	// it check if npc can be damaged right now.
	// Func remove npc from collpoll if he is can't be damaged.
	//--
	// TODO:
	// -Implement leftswd check.
	//#####################################################
	
	
	func void CollPool_CheckSingleNpc(var c_npc v,var int hand)
	{
		var int ptr;
		var int dmg;
		var int dmg_mul;
		//      if(DebugDamage)
		//      {
		//              pipe = concatstrings(pipe,". ");
		//              pipe = concatstrings(pipe,v.name);
		//              pipe = concatstrings(pipe,", aiv[dmgid] = ");
		//              pipe = concatstrings(pipe,inttostring(v.aiv'ar[AIV_DAMAGEID]));
		//              PrintScreen (pipe,73, 10+(j*3), _STR_FONT_ONSCREEN,1); 
		//      };
		if(Npc_GetAttitude(v,hero)==ATT_HOSTILE) { HeroDamage_HostileEnemies+=1;};
		
		if(Hlp_IsValidNpc(v))&&(!Npc_IsDead(v))//-1 or NOT! 0 when activated
		{              
			if(HeroDamage_CanDoHit_CNPCPass(v,hand))
			{
				ptr = oCNpc_GetPointer(v);
				if(HeroDamage_CanDoHit_PointerPass(ptr))
				{
					dmg = I_Npc_CollideWithHeroWeapon(ptr,hand); //thats trouble maker!
					dmg_mul=3;
					if(((dmg)-(dmg%30))/30>=1)
					{
						dmg_mul-=1;
					};
					if(dmg%10==3)
					{
						dmg_mul-=1;
					};
					
					if(dmg_mul!=3)//if touched by weapon - Set Damage
					{
						HeroDamage_SetDamageToNpc(dmg_mul,dmg,v,hand);
						
						if(Npc_GetAttitude(v,hero)==ATT_NEUTRAL)
						{      
							HeroDamage_TimeHeroAttackedNeutralFocus = 1;//rest handled in time_events    
						};
					};
				};     
			};     
		};
		
	};
	func void CollPool_NpcListCheck(var int hand)
	{
		var oCNpc her; //hero *oCNpc  
		var int label; //for loop
		var int i; //iterator, if i < max => continue loop
		var int max;//items in array
		var int ptr;//pointer to last collected item of array
		var int array;//*zCArray voblist       
		var c_npc npc;//founded oCnpc => C_NPC
		const int fight_range = 1140457472;//500.0 (float)
		
		//Reset hostile enemies
		HeroDamage_HostileEnemies=0;
		
		//Get hero
		her = hlp_GetNpc(hero);  
		her.percActive = 1;
		
		//reset iterator:
		i=0;
		
		//Create VobList:
		CALL_IntParam (fight_range);
		CALL__thiscall (MEM_InstToPtr(her), oCNpc__CreateVobList_offset);      
		
		//tmp debug
		printdebug_s_i(">###### voblist lenght: ",her.vobList_numInArray);
		
		max = her.vobList_numInArray;  
		if(!max){return;};
		array = her.vobList_array;
		
		// Ork: Jeœli fokus nie znajdzie sie na vobliscie, i tak go sprawdzimy, a co tam :)
		var int bFocusInVoblist; bFocusInVoblist = FALSE;
		MEM_InitLabels();
		label = MEM_StackPos.position;  
		ptr = MEM_ReadInt(array + i*4);
		//is Npc?
		if(oCNpc_vtbl<ptr)&&(ptr<600000000)&&(ptr%4==0)
		{
			if((ptr != 0) && (MEM_ReadInt(ptr) == oCNpc_vtbl))
			{              
				var int oldtrgt;
				oldtrgt = her.enemy;//ocnpc.enemy
				her.enemy = ptr;
				Npc_GetTarget(hero);
				// printscreen_s_i_s(ConcatStrings(inttostring(i),". "),ptr,other.name
				// ,5,5+i*3,2);
				CollPool_CheckSingleNpc(other,hand);
				if(ptr == oldtrgt) { bFocusInVoblist = TRUE; };
				her.enemy = oldtrgt;
			};
		};
		i=i+1;
		if(i<max)
		{
			MEM_StackPos.position = label;
		};      
		// Ork: Jeœli fokus nie zostal znaleziony na vobliscie, to sprawdzimy jeszcze jego:
		if(!bFocusInVoblist)
		{
			// printscreen_s_i_s("(Focus). ",her.enemy,other.name
			// ,5,5+i*3,2);
			CollPool_CheckSingleNpc(other,hand);
		};
	};
	
	
	func int CollPool_NpcInList(var c_npc slf)
	{
		// Whole aiv'ar/perc disable functionality
		// is disabled
		return true;
		
	};
	
	func void DamageFunc_Bugfix()
	{
		// Whole aiv'ar/perc disable functionality
		// is disabled
		return;
	};
	
	//--------------------------------------------
	//
	//   H E R O D A M A G E _ T R I G G E R
	//
	//--------------------------------------------
	
	func void DAMAGE_TRIGGER_FUNC()
	{
		//TMP trigger off
		//return;
		var int ptr;
		WLD_SendTrigger("DAMAGE_TRIGGER");
		MEM_SetShowDebug(1);
		if(!HeroDamage_HeroCanDoHit()){return;};//break if hero ani isn't in hitanibounds, etc.
		printdebug("DamageTrigger>>START");
		
		if(Npc_HasReadiedMeleeWeapon(hero))
		{
			//R damage init
			if(!R_SWDDMG_PTR)
			{
				Wld_PlayEffect("R_SWORDDAMAGE", hero, hero, 0, 0, DAM_INVALID, FALSE); 
				ptr = MEM_InstGetOffset(hero);
				ptr = MEM_ReadInt(ptr+36);//hero zCTree
				ptr = MEM_ReadInt(ptr);//parent zCTree
				ptr = MEM_ReadInt(ptr+4);//child zCTree        
				R_SWDDMG_PTR = I_zCTreeSearchVFX(ptr,0);               
			};
			if(DUALEQUIPED)&&(!L_SWDDMG_PTR)
			{
				Wld_PlayEffect("L_SWORDDAMAGE", hero, hero, 0, 0, DAM_INVALID, FALSE); 
				ptr = MEM_InstGetOffset(hero);
				ptr = MEM_ReadInt(ptr+36);//hero zCTree
				ptr = MEM_ReadInt(ptr);//parent zCTree
				ptr = MEM_ReadInt(ptr+4);//child zCTree        
				L_SWDDMG_PTR = I_zCTreeSearchVFX(ptr,1);               
			};             
		}
		else if(!Npc_HasReadiedMeleeWeapon(hero))
		{
			if(R_SWDDMG_PTR){ R_SWDDMG_PTR=0;};    
			if(L_SWDDMG_PTR){ L_SWDDMG_PTR=0;};    
			return;                        
		};
		
		HeroDamageInit();
		
		CollPool_NpcListCheck(RIGHTHAND_WEAPON);
		if(DUALEQUIPED){
			CollPool_NpcListCheck(LEFTHAND_WEAPON);
		};
		
		printdebug("DamageTrigger<<END");
	};
	
	func void B_CHECKCOLLIDEDAMAGE_MONSTER()
	{
		// Whole aiv'ar/perc disable functionality
		// is disabled
		return;
	};
