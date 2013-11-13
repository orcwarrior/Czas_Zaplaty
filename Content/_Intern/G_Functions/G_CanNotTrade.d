func void G_CANNOTTRADE(var int value)
{
	PutMsg(_STR_MESSAGE_TRADE_FAILURE,"font_default.tga",RGBAToZColor(255,50,50,255),8*2,"");			
 	Npc_GetTarget(hero);
 	AI_OUTPUTSVM(other, NULL, "$YOUWANNAFOOLME");
	
};
