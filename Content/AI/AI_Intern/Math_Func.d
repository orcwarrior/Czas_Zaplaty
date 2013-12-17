/*************************************************************************
**																		**
**		Math_Average													**
**		=============													**
**																		**
**		Average of 2 integer
**																		**
**																		**
*************************************************************************/
FUNC INT MATH_AVERAGE(VAR INT A,VAR INT B)
{
	VAR INT C;
	C=(A+B)/2;

	RETURN C;
};
//A=Ca³oœæ B=% ca³osci
FUNC INT MATH_ROUND(VAR INT A)
{
// 	VAR INT C;
// 	C=A%1;
// 	C=A-C;
	RETURN A;
};
FUNC INT MATH_POWER_(VAR INT B,VAR INT N,VAR INT LEVEL)
{
	N=N*B;
	LEVEL=LEVEL-1;
	IF(LEVEL>1)
	{
 MATH_POWER_(B,N,LEVEL);
	}
	ELSE
	{
		RETURN N;
	};
};
FUNC INT MATH_POWER(VAR INT N,VAR INT LEVEL)
{
	VAR INT B;B=N;
	N=N*B;
	LEVEL=LEVEL-1;
	IF(LEVEL==(-1))
	{
		RETURN 1;
	}
	ELSE IF(!LEVEL)
	{
	RETURN B;
	}
	ELSE IF(LEVEL>1)
	{
 MATH_POWER_(B,N,LEVEL);
	}
	ELSE
	{
		RETURN N;
	};
};
FUNC INT MATH_PERCENT(VAR INT A,VAR INT B)
{
	IF(A==0)||(B==0)
	{
		RETURN 0;
	}
	ELSE
	{
		VAR INT C;
		C=B*100;
		C=C/A;
		C=MATH_ROUND(C);
		RETURN C;
	};
};
// Dzielenie z pod³og¹:
func int Math_Div(var int a,var int b)
{
	return (a/b - a%b);
};