CONST INT XP_LOW	=1;//W czasie prostrzych zada�
CONST INT XP_MED	=2;//Zako�czenie prostych zada�, w czasie srednich/trudnych
CONST INT XP_HIGH	=3;//w czasie trudnych(misji g��wnych), zako�czenie srednich
CONST INT XP_VHIGH	=4;//Zako�czenie trudnych, g�ownie misji g��wnym

CONST INT XP_MULTIPIER	=50;
//************************************
//B_GiveMisXP
//
//Formula: Chapter*XP_MULTIPIER*XP_XXX
//************************************
FUNC VOID B_GIVEMISXP(VAR INT XP_XXX)
{
	//Kapitel - globalna zmienna przechowujaca obecny rozdzia�

	B_GIVEXP(KAPITEL*XP_MULTIPIER*XP_XXX);
};
   