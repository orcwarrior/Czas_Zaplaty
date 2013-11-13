

func void B_Give_ROOT (var int chapter)
{
	var c_npc container;
	if(chapter==2)
	{
		container=Hlp_GetNPC(Rodney_Container);
		B_Give_RodneyChapter2Weapons(container);
		container=Hlp_GetNPC(Drax_Container);
		B_Give_DraxChapter2Weapons(container);	
		container=Hlp_GetNPC(Fisk_Container);
		B_Give_FiskChapter2Weapons(container);	
		container=Hlp_GetNPC(Taran_Container);
		B_Give_TaranChapter2Weapons(container);				
		container=Hlp_GetNPC(Leren_Container);
		B_Give_LerenChapter2Weapons(container);		
		container=Hlp_GetNPC(Fox_Container);
		B_Give_FoxChapter2Weapons(container);							
	};
	
};