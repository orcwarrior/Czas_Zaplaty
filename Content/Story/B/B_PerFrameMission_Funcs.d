// ************************************
// Per frame Mission funcs
// ***
// called every frame by
// PerFrameCallbackTrigger
// Feel free to put there anythin
// but optimise it at most it possible
// first ;-)
//
// *Rick on sentry - scaling time
//
// ************************************
var int Story_RickSentry_MisState;// 3-obsolete 2-after 0-before 1-during -
func void PerFramMission_Funcs()
{
	//scale up time during rick sentry
	if(Story_RickSentry_MisState==1)
	{
		ScaleWorldTime(fracf(108,100));		
	};
};