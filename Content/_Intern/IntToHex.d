////////////////////////////////////////////////////////////////////////////////
//
//Convert an int into hexadecimal strings with 1|2|4|8 siginificant digits.
//Copyright (c) 2009 Nico Bendlin <nicode@gmx.net>, Legal: WTFPL Version 2.
//
////////////////////////////////////////////////////////////////////////////////

FUNC STRING NIBBLETOHEX(VAR INT A)
{
 A=A & 15;
 IF(A <=9){
	RETURN INTTOSTRING(A);
 };
 IF(A >=13){
	IF(A >=14){
 IF(A >=15){
		RETURN "F";
 };
 RETURN "E";
	};
	RETURN "D";
 };
 IF(A >=11){
	IF(A >=12){
 RETURN "C";
	};
	RETURN "B";
 };
 RETURN "A";
};

FUNC STRING BYTETOHEX(VAR INT A)
{
 VAR STRING S;

 S=NIBBLETOHEX(A);
 RETURN CONCATSTRINGS(NIBBLETOHEX(A >> 4),S);
};

FUNC STRING WORDTOHEX(VAR INT A)
{
 VAR STRING S;

 S=BYTETOHEX(A);
 RETURN CONCATSTRINGS(BYTETOHEX(A >> 8),S);
};

FUNC STRING INTTOHEX(VAR INT A)
{
 VAR STRING S;

 S=WORDTOHEX(A);
 RETURN CONCATSTRINGS(WORDTOHEX(A >> 16),S);
};

   