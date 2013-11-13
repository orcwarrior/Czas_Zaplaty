//************************************
//	Beispiele
//************************************

//Folgende Funktion soll das Volumen eines Zylinders in cm3 berechnen und gerundet zurückgeben:

// func int Zylindervolumen (var int radius, var int hoehe) {
// 	var int radiusf, var int hoehef;
// 	radiusf = mkf (radius);
// 	hoehef = mkf (hoehe);
// 	
// 	//Volumen = r2 * PI * h
// 	
// 	var int ergebnisf;
// 	ergebnisf = mulf (radiusf, radiusf);
// 	ergebnisf = mulf (ergebnisf, PI);
// 	ergebnisf = mulf (ergebnisf, h);
// 	
// 	return roundf (ergebnisf);
// };

// Folgende Funktion berechnet eine Zahl und gibt sie auf dem Bildschirm aus. Sie schachtelt dabei manche Funktionen

// func void antwort () {
// 	var int foo;
// 	
// 	foo = mulf (mkf (1337), PI);
// 	printf (divf (foo, mkf (100)));
// 	
// 	//(1337*PI)/100 ist verblüffend genau 42. ;-)
// };


//************************************
//	Beschränkungen und Fallen
//************************************

/***********  Nutzerfehler ************
Es sollten unter keinen Umständen die Operatoren +, -, * oder / auf floats angewendet werden. Sie haben dort keine sinnvolle Anwendung. Bestensfalls kommt einfach nur Blödsinn heraus. Wie oben beschrieben sind addf, subf, mulf und divf anzuwenden.
Wer versteht wie ein float intern aufgebaut ist, kann zum Beispiel innerhalb der positiven Zahlen die Ordnungsrealtionen (>, <, <= >=) benutzen. Wer sich nicht sicher ist, sollte auf die gegebenen Funktionen zurückgreifen.
Natürlich sind umgekehrt die Floatfunktionen für Integer unbrauchbar. Der Ausdruck sqrtf (4) ist nicht 2 sondern einfach nur falsch, da 81 ein Integer ist!

*********** Float-Fehler *************
Die Genauigkeit der floats ist sehr begrenzt, ab etwa 4 Dezimalstellen ist mit Rundungsfehlern zu rechnen. Dafür können sehr große und sehr kleine Zahlen dargestellt werden.
Es gelten die gewöhnlichen Einschränkungen und Empfehlungen für floats. Zum Beispiel ist es selten sinnvoll floats auf Gleichheit zu überprüfen, da es durch Rundungsfehler wahrscheinlich ist, dass auch zwei floats, die eigentlich gleich sein müssten kleine Abweichungen zueinander aufweisen. Es sollte in einem solchen Fall besser geprüft werden, ob die Differenz der beiden floats einen (im Verhältnis zur Problemstellung) kleinen Wert unterschreitet.

*********** Gothic Fehler ************
Gothic hat eine eigenwillige (fehlerhafte) Art verschachtelte Ausdrücke auszuwerten. Wenn hierbei eine Funktion mehrfach angewendet wird, überschreibt der zwei Aufruf das Ergebnis des ersten. Beispiel:

Der Ausdruck
divf (mkf (42), mkf (6))
liefert das Ergebnis 1 obwohl 42/6 = 7 ist. Das liegt daran, dass Gothic zwar mkf für 42 und für 6 aufruft, aber beim zweiten mal das Ergebnis des ersten Males vergisst. Das heißt schlussendlich wird 6 durch 6 geteilt, wobei 1 herauskommt. Wer also Funktionen gerne schachtelt sollte sich in acht nehmen! Wer sich unsicher ist, wann Gothic ein solches Verhalten zeigt, sollte solche Berechnungen schrittweise und mit Zwischenvariablen ausführen.

//************************************
//	Vielen Dank...
//************************************

...dass du dich für dieses Script interessierst und es gelesen, oder zumindest überflogen hast. Dann war meine Arbeit nicht ganz umsonst. ;-)
Mir ist allerdings bewusst, dass dies wohl eher ein Randgebiet des Gothicmoddings ist.

Edit: März 2010: Haha! Mit direktem Zugriff auf zEngine Objekte ist dies mitnicht ein Randgebiet! Es lassen sich einige hochinteressante Floatwerte in Gothic finden!

*/

//#################################################################
//
//  DIE FUNKTIONEN
//
//#################################################################

const int BIT_VZ = 1; //Vorzeichen hat 1 Bit (was auch sonst?!)
const int BIT_EXP = 8; //nach IEEE 754 ist 8 die Norm
const int BIT_MT = 23; //bleiben 23 bit für die Mantisse
const int EXP_OFFSET = 127; //exp = characteristic - EXP_OFFSET

const int EXP_PATTERN = ((1 << BIT_EXP) - 1) << BIT_MT;
const int MT_PATTERN = ((1 << BIT_MT) - 1);

const int MINUS = 1 << 31;
const int MININT = 1 << 31;
const int MAXINT = MININT - 1;

const int FLOATNULL = 0; //vz 0, exp -128, mt 1.0 //nicht echt 0! Aber so ziemlich. Damit die Vergleiche gut funktionieren. Letztendlich ist der Wert aber egal. FLOATNULL ist ein Symbol mit dem nicht gerechnet wird.
const int FLOATEINS = 1065353216; //vz 0, exp 0 (also 127), mt 1.0
const int FLOATHALB = 1056964608; //vz 0, exp -1 (also 127), mt 1.0

const int PI = 1078530011;	
const int E =  1076754516;

//************************************
//	Interne Hilfsfunktionen
//************************************

func int HighestBitPos (var int x) {
	if (x == 0) {
		return 0;
	}
	else {
		return 1 + HighestBitPos (x >> 1);
	};
};

func int extractExp (var int x) {
	var int exp;
	exp = x & EXP_PATTERN;
	exp = exp >> BIT_MT;
	exp = exp - EXP_OFFSET; //wegen Vergleichen ist der exponent verschoben
	
	return exp;
};

func int extractMt (var int x) {
	var int mt;
	mt = x & MT_PATTERN;
	//das erste bit, was gespart wurde wieder hin:
	mt = mt | (1 << BIT_MT);
	
	return mt;
};

func int packExp (var int exp) {
	//exponent -> Charakteristik -> und schieben
	return (exp + EXP_OFFSET) << BIT_MT;
};

//************************************
//		float bauen:
//************************************

func int mkf (var int x) {
	var int result; result = 0;
	//das Vorzeichen bit
	if (x < 0) {
		result = MINUS;
		x = -x;
	};
	
	var int exp;
	exp = HighestBitPos (x) - 1;
	
	if (exp < 0) { //kann nur heißen, dass die Zahl null ist
		return FLOATNULL;
	};
	
	//Dass die erste Zahl eine 1 ist, ist ja wohl klar, also wird sie abgeschnitten:
	x = x & (~(1 << exp));
	
	//Und jetzt packe ich das ganze in einen float:
	result = result | packExp(exp); //den Exponenten neben die Mantisse schieben.
	
	if (BIT_MT > exp) {
		return result | (x << (BIT_MT - exp)); //Die Mantisse wird nach vorne geschoben, aber eben nur soweit Platz ist
	}
	else {
		return result | (x >> (exp - BIT_MT));
	};
};

//************************************
//	Rückumwandlung zu integer
//************************************

func int truncf (var int x) {
	//Sonderbehandlung für das Symbol NULL
	if (x == FLOATNULL) {
		return 0;
	};
	
	var int exp; exp = extractExp (x); //Exponenten holen
	var int mt;	mt = extractMt (x); //Mantisse holen
	
	var int result;
	
	//Überläufe:
	if (exp >= 31) { //2^31 * 1.0 läuft ins Vorzeichenbit rein!
		if (x > 0) {
			return MAXINT;
		} else {
			return MININT;
		};
	};
	
	//schneidet
	if (exp > BIT_MT) {
		result = mt << (exp - BIT_MT); //Mantisse zurechtschieben
	}
	else {
		result = mt >> (BIT_MT - exp);
	};
	
	if (x < 0) {
		return - result;
	}
	else {
		return result;
	};
};

//************************************
//	Addition
//************************************

func int addf (var int x, var int y) {
	var int expX; expX = extractExp (x);
	var int expY; expY = extractExp (y);
	var int mtX; mtX = extractMt (x);
	var int mtY; mtY = extractMt (y);
	var int isnegX; isnegX = x & MINUS;
	var int isnegY; isnegY = y & MINUS;
	
	//Sonderbehandlung für das Symbol NULL
	if (x == FLOATNULL) {
		return y;
	}
	else if (y == FLOATNULL) {
		return X;
	};
	
	//Die Betragsmäßig kleinere Zahl an die größere anpassen
	if (expX > expY)
	{
		mtY = mtY >> (expX - expY);
		expY = expX;
	}
	else
	{
		mtX = mtX >> (expY - expX);
		expX = expY;
	};
	
	//Das Ergebnis berechnen:
	var int mtRes;
	if (isnegX)	{
		mtRes = -mtX;
	}
	else {
		mtRes = mtX;
	};
	
	if (isnegY) {
		mtRes -= mtY;
	}
	else {
		mtRes += mtY;
	};
	
	var int isnegRes;
	if (mtRes < 0) {
		isnegRes = MINUS;
		mtRes = -mtRes;
	}
	else {
		isnegRes = 0;
	};
	
	var int shift;
	shift = HighestBitPos (mtRes) - (BIT_MT + 1);
	
	if  (shift > 0)	{
		mtRes = mtRes >> shift;
	}
	else {
		mtRes = mtRes << (-shift);
	};
	
	//Noch die erste Zahl abschneiden (also zuschneiden):
	mtRes = mtRes & ((1 << BIT_MT) - 1);
	
	var int expRes;
	expRes = expX + shift;
	
	return isnegRes | packExp(expRes) | mtRes;
};

//************************************
//	Es lassen sich vier kleine
//  nützliche Hilfsfunktionen
//  definieren:
//************************************

func int negf (var int x) {
	if (x <= 0) { return x & (~MINUS); }
	else { return x | MINUS; };
};

func int absf (var int x) {
	if (x < 0) { return negf (x); }
	else	   { return x; };
};

func int subf (var int x, var int y) {
	return addf (x, negf (y));
};

func int roundf (var int x) {
	return truncf (addf (x, FLOATHALB));
};

//************************************
//	Multiplikation
//************************************

func int mulf (var int x, var int y) {
	var int expX; expX = extractExp (x);
	var int expY; expY = extractExp (y);
	var int mtX; mtX = extractMt (x);
	var int mtY; mtY = extractMt (y);
	var int isnegX; isnegX = x & MINUS;
	var int isnegY; isnegY = y & MINUS;
	
	//Sonderbehandlung für das Symbol NULL
	if (x == FLOATNULL)
	|| (y == FLOATNULL) {
		return FLOATNULL;
	};
	
	//Die Exponenten werden addiert
	var int expRes;
	expRes = expX + expY;
	
	//Die Mantissen multipliziert (wobei auf die 32 bit Grenze geachtet werden muss)
	var int mtRes;
	mtRes = (mtX >> (BIT_MT - 14)) * (mtY >> (BIT_MT - 14));
	mtRes = mtRes >> (28 - BIT_MT);
	
	if (mtRes >= (1 << (BIT_MT + 1)))
	{
		mtRes = mtRes >> 1;
		expRes += 1;
	};
	
	//Noch die erste Zahl abschneiden (also die Mantisse zuschneiden):
	mtRes = mtRes & ((1 << BIT_MT) - 1);
	
	var int isNegRes;
	if (isnegX == isnegY) {
		isNegRes = FALSE;
	}
	else {
		isNegRes = MINUS;
	};
	
	//noch Erkenntnisse zusammenfügen
	return isnegRes | packExp(expRes) | mtRes;
};

//************************************
//	Die Division lässt sich
//  nicht auf die Multiplikation
//  zurückführen. Das multiplikative
//  Inverse ist schließlich schwerer
//  zu finden, als das additive
//  Inverse. Also, gesonderte Funktion:
//************************************

func int divf (var int x, var int y) {
	var int expX; expX = extractExp (x);
	var int expY; expY = extractExp (y);
	var int mtX; mtX = extractMt (x);
	var int mtY; mtY = extractMt (y);
	var int isnegX; isnegX = x & MINUS;
	var int isnegY; isnegY = y & MINUS;
	
	//Sonderbehandlung für das Symbol NULL
	if (y == FLOATNULL) {
		Print ("### ERROR: DIVISION BY ZERO ###");
		return FLOATNULL;
	}
	else if (x == FLOATNULL) {
		return FLOATNULL;
	};
	
	//Exponent subtrahieren
	var int expRes;
	expRes = expX - expY;
	
	//Die Mantissen dividieren, davor Divident und Divisor passend hinschieben
	var int mtRes;
	mtRes = (mtX << (7)) / (mtY >> 9); //X soweit es geht nach links, Y auf die Mitte
	mtRes = mtRes << (BIT_MT - 7 - 9);
	
	//Und das Ergebnis wieder zurückschieben
	if (mtRes < (1 << (BIT_MT))) {
		mtRes = mtRes << 1;
		expRes -= 1;
	};
	
	//Noch die erste Zahl abschneiden (also die Mantisse zuschneiden):
	mtRes = mtRes & ((1 << BIT_MT) - 1);
	
	var int isNegRes;
	if (isnegX == isnegY) {
		isNegRes = 0;
	}
	else {
		isNegRes = MINUS;
	};
	
	//noch Erkenntnisse zusammenfügen
	return isnegRes | packExp(expRes) | mtRes;
};

//************************************
//	Kleine Hilfsfunktion
//************************************

func int invf (var int x) {
	return divf (FLOATEINS, x);
};

//************************************
//	Wurzelziehen
//************************************

func int sqrtf_hlp (var int target, var int guess, var int steps) {
	//babylonisches Wurzelziehen
	guess = addf (guess, divf (target, guess));
	guess = mulf (FLOATHALB, guess);
	
	if (steps == 0)	{
		return guess;
	}
	else {
		return sqrtf_hlp (target, guess, steps - 1);
	};
};

func int sqrtf (var int x) {
	if (x < FLOATNULL) {
		Printdebug ("ERROR: MathError");
		
		return FLOATNULL;
	};
	
	//25 Schritte müssten reichen, wenn nicht bitte erhöhen!
	//Ich habe mir nicht hergeleitet wie schnell die Reihe für verschiedene x konvergiert.
	//für MANCHE x war aber auch schon 15 sehr genau.
	
	return sqrtf_hlp (x, x, 25);
};

//************************************
//	Ordnungsrelationen	
//************************************

func int gf (var int x, var int y) {
	var int isnegX; isnegX = x & MINUS;
	var int isnegY; isnegY = y & MINUS;
	
	if (isNegX && isNegY) { //beide negativ
		if (x < y) {
			return TRUE;
		};
	}
	else {
		if (x > y) {
			return TRUE;
		};
	};
	
	return FALSE;
};

func int gef (var int x, var int y) {
	if (gf (x,y)) || (x == y) {
		return TRUE;
	};
	return FALSE;
};

func int lef (var int x, var int y) {
	if (!gf (x,y)) {
		return TRUE;
	};
	return FALSE;
};

func int lf (var int x, var int y) {
	if (!gef (x,y)) {
		return TRUE;
	};
	return FALSE;
};

//************************************
//	Ausgabefunktionen
//************************************

func string BuildNumberHlp (var string res, var int x, var int kommapos) {
	if (kommapos == 0) {
		res = ConcatStrings (",", res);
		res = ConcatStrings (IntToString (x), res);
		
		return res;
	};
	
	res = ConcatStrings (IntToString (x % 10), res);
	
	return BuildNumberHlp (res, x / 10, kommapos - 1);
};

func string BuildNumber (var string res, var int x, var int kommapos) {
	if (x < 0) {
		return ConcatStrings ("-", BuildNumberHlp (res, -x, kommapos));
	}
	else {
		return BuildNumberHlp (res, x, kommapos);
	};
};

func void printf (var int x) { //Ok, ok sorry c-ler. Aber ich will konsistente Namen haben.
	//Ich bekomme nur eine primitive Darstellung als Kommazahl hin.
	//für die Darstellung als X * 10^EXP fehlen mir Ideen oder Logarithmusfunktionen
	
	x = mulf (x, mkf (10000));
	x = truncf (x);
	
	Print (BuildNumber ("", x, 4));
};

func string strF(var int x)
{
return BuildNumber ("", x, 4);	
};


// Example: fractionF(9,10) = 0.9 (float)
func int fracF(var int d,var int c)
{
	d = mkf(d);
	c = mkf(c);
	return divf(d,c);	
};
// **************************************************
// RandF: Function returns random value from
// [range_start,range)
// * range should be greater than range_start
//   but even if not, func should still work properly.
// * range_start and range have to be a zfloat
// **************************************************
func int RandF(var int range_start,var int range)
{
	
	// number of random possibilites, max. float should be there?                                                                                                                            
	// -I made only small research, but it looks like bigger numbers generate                                                                                                                
	//  errors when dividing (floats don't have endless accuracy :-P)                                                                                                                        
	// When I tried possibilities = 65536, it don't looked like returns 
	// were proper, numbers bigger than half of range was never returned...                                                                                                                                                           
	// Unfortunaly this is an random function so I don't have idea 
	// how to check it, it only possibly to check it theoretically ;-(. 
	// But as you can see on instance it looks to be working OK.
	// Unfortunaly low possibilities value, means returned floats                                                                                                                            
	// could have big step/"jumps", if rDiff>posibilities it means                                                                                                                           
	// step will be more than 1.0.  
	
	const int possibilities = 10000;                                                                                                                                                         
									
	var int f; // fe[0,1)
	var int rDiff; //range difference
	rDiff = subf(range,range_start);

	f = fracF(Hlp_Random(possibilities),possibilities);//0.0-0.999..
	f = mulf(f,rDiff);
	
	return addf(range_start,f);	
};


//Folgende Funktion macht ein paar Vergleiche. Es wird in keinem Fall "FEHLER" ausgegeben.

func void floattest2()
{
	var int halb; var int eins; var int zwei;
	var int null;
	var int minuseins; var int minuszwei;
	
	halb = invf (mkf (2));
	eins = mkf (1);
	zwei = mkf (2);
	null = mkf (0);
	minuseins = mkf (-1);
	minuszwei = mkf (-2);
	
	if (gf (zwei,eins))           {} else { print ("FEHLER!"); };
	if (gf (eins,null))           {} else { print ("FEHLER!"); };
	if (lf (minuseins,null))      {} else { print ("FEHLER!"); };
	if (lf (minuszwei,minuseins)) {} else { print ("FEHLER!"); };
	if (gf (halb,minuseins))      {} else { print ("FEHLER!"); };
	if (lf (halb,zwei))           {} else { print ("FEHLER!"); };
	if (lef (null,null))          {} else { print ("FEHLER!"); };
	if (gef (null,null))          {} else { print ("FEHLER!"); };
};