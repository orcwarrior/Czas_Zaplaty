// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kirgo_Exit (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 999;
	condition		= Info_Kirgo_Exit_Condition;
	information		= Info_Kirgo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kirgo_Exit_Condition()
{
	return 1;
};

func VOID Info_Kirgo_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
//			
// **************************************************

instance Info_Kirgo_Hi(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Hi_Condition;
	information		= Info_Kirgo_Hi_Info;
	permanent		= 0;
	description 	= "Co porabiasz?";
};                       

FUNC INT Info_Kirgo_Hi_Condition()
{	
	return 1;
};

func VOID Info_Kirgo_Hi_Info()
{
	AI_Output (other, self,"Info_Kirgo_Hi_15_01"); //Co porabiasz?
	AI_Output (self, other,"Info_Kirgo_Hi_05_02"); //Jestem Kirgo. Kiedyœ walczy³em na arenie. To by³y czasy...
};

// **************************************************

instance Info_Kirgo_Escort(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 2;
	condition		= Info_Kirgo_Escort_Condition;
	information		= Info_Kirgo_Escort_Info;
	permanent		= 0;
	important		= 0;
	description 	= "Nie chcia³byœ znowu powalczyæ?";
};                       

FUNC INT Info_Kirgo_Escort_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kirgo_Hi))&&(Npc_KnowsInfo (hero, DIA_Orkan_Again))
	{
		return 1;
	};
};

func VOID Info_Kirgo_Escort_Info()
{
	AI_Output (other, self,"Info_Kirgo_Escort_15_01"); //Nie chcia³byœ znowu powalczyæ?
	AI_Output (self, other,"Info_Kirgo_Escort_05_02"); //Czasami trochê mi tego brakuje. Co masz na myœli?
	AI_Output (other, self,"Info_Kirgo_Escort_15_03"); //Szykuje siê wyprawa poza palisadê. Bêdziemy pilnowaæ transportu z broni¹ do Nowego Obozu.
	AI_Output (self, other,"Info_Kirgo_Escort_05_04"); //S³ysza³em o tym. Te konwoje nigdy nie wracaj¹. Nie szukam œmierci, tylko walki.
	AI_Output (other, self,"Info_Kirgo_Escort_15_05"); //Ja te¿ chcê jeszcze trochê po¿yæ. Pójdziemy now¹ tras¹, wyœlemy zwiadowcê. 
	AI_Output (other, self,"Info_Kirgo_Escort_15_06"); //Poza tym w tej chwili Stary Obóz to najwiêksza si³a w Kolonii. Sama obecnoœæ stra¿ników powinna wystarczyæ ¿eby odstraszyæ napastników.
	AI_Output (self, other,"Info_Kirgo_Escort_05_07"); //Nie wygl¹dasz na miêczaka. Z tego co s³ysza³em, Orkan te¿ nie jest u³omkiem.
	AI_Output (self, other,"Info_Kirgo_Escort_05_08"); //Mam ju¿ doœæ bezczynnego czekania na atak rebeliantów.
	AI_Output (self, other,"Info_Kirgo_Escort_05_09"); //Dobra, wyruszê z wami.
	AI_Output (other, self,"Info_Kirgo_Escort_15_10"); //To œwietnie. Nie bêdziesz ¿a³owa³.
	AI_Output (other, self,"Info_Kirgo_Escort_15_11"); //Spotkamy siê przy bramie. Zabierz te¿ paczki z broni¹, znajdziesz je w barakach.
	B_LogEntry(CH5_NC_Convoys, "Przekona³em Kirgo.");

	Npc_ExchangeRoutine(self,"WAIT");
};

// **************************************************

instance Info_Kirgo_End(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 3;
	condition		= Info_Kirgo_End_Condition;
	information		= Info_Kirgo_End_Info;
	permanent		= 0;
	description 	= "Wybacz, ¿e Was wykorzysta³em.";
};                       

FUNC INT Info_Kirgo_End_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Cord_ConvoyConvoyTrapEnd))
	{
		return 1;
	};
};
func VOID Info_Kirgo_End_Info()
{
	AI_Output (other, self,"Info_Kirgo_End_15_01"); //Wybacz, ¿e Was wykorzysta³em.
	AI_Output (self, other,"Info_Kirgo_End_05_02"); //Nie ma sprawy. Nie mia³eœ wyboru. Pewnie post¹pi³bym podobnie na Twoim miejscu.
	AI_Output (self, other,"Info_Kirgo_End_05_03"); //Mo¿e w Nowym Obozie znajdê kogoœ, z kim mo¿na solidnie potrenowaæ?
	AI_Output (self, other,"Info_Kirgo_End_05_04"); //Powodzenia, Rick.
	AI_Output (other, self,"Info_Kirgo_End_15_05"); //Trzymaj siê, Kirgo.
	
	Npc_ExchangeRoutine(self,"NC1");
};