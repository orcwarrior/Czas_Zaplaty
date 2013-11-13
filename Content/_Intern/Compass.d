////////////////////////////////////////////////////////////////////////////////
//
//Compass support script (for Gothic I and Gothic II - Night of the Raven).
//Copyright (c) 2009 Nico Bendlin <nicode@gmx.net>, Legal: WTFPL Version 2.
//
////////////////////////////////////////////////////////////////////////////////

//
//Returned by Compass_GetText if x and/or z are too large (>= 2.0).
//
CONST STRING COMPASS_INVALID="";
//
//Returned by Compass_GetText if x and z are too small (< 0.00003).
//
CONST STRING COMPASS_UNKNOWN=" ";

//
//Returns the compass character for the IEEE binary32 'x' and 'z'.
//
//You have to use/create a special font that includes all possible
//images for a rotation unit of 1.66667° (a total of 216 imgages).
//The first image for 0° (heading east) starts at '!' (33) because
//' ' (32) is used for the image that indicates "unknown heading".
//The '\"' (34) is excluded because it cannot be used in Daedalus.
//Furthermore, the following characters are excluded to handle the
//problems with characters that are not displayable in the current
//'Windows-1252' code page (http://support.microsoft.com/kb/197368
//http://msdn.microsoft.com/en-us/goglobal/cc305145.aspx):
//'\x7F' (127), '\x81' (129), '\x8D' (141),
//'\x8F' (143), '\x90' (144), '\x9D' (157).
//
FUNC STRING COMPASS_GETTEXT(VAR INT X,VAR INT Z)
{
 VAR INT A;
 VAR INT E;
 VAR INT S;

 //Save sign (east/west).
 E=(X < 0);
 //Convert IEEE binary32 float to int (scaled by 32768).
 A=(X >> 23)& 255;
 IF(A > 127){
	RETURN COMPASS_INVALID;
 };
 IF(A < 112){
	X=0;
 } ELSE {
	X=((X & 8388607)| 8388608)>>(135 - A);
 };

 //Save sign (south/north).
 S=(Z < 0);
 //Convert IEEE binary32 float to int (scaled by 32768).
 A=(Z >> 23)& 255;
 IF(A > 127){
	RETURN COMPASS_INVALID;
 };
 IF(A < 112){
	Z=0;
 } ELSE {
	Z=((Z & 8388607)| 8388608)>>(135 - A);
 };

 //Scaled x = z / x (32768 = maxium scale without int overflow).
 IF(!X){
	IF(!Z){
 RETURN COMPASS_UNKNOWN;
	};
	IF(S){
 RETURN "Ê";//270.000° 162 '\xCA' [Alt+0202]
	};
	RETURN "X";//90.000°  54 '\x58' [Alt+0088]
 };
 X=(Z * 32768)/ X;

 //54-unit segment (90°) binary search for the scaled Tan(z/x).
 //Calculated with: Round(Tan((i * 2 + 1) * PI / (n * 4)) * s).
 //(where n = 54 (segment), i = [0,n-1], and s = 32768 (scale))
 //The comments contain <angle> <units> <character> <keyboard>.
 IF(X <=33735){			//45.833°
	IF(X <=13573){ //22.500°
 IF(X <=6271){ //10.833°
		IF(X <=3348){ //5.833°
 IF(X <=1431){ //2.500°
			IF(X <=477){	//0.833°
 IF(E){
				RETURN "“";//180.000° 108 '\x93' [Alt+0147]
 };
 RETURN "!";//0.000°   0 '\x21' [Alt+0033]
			};
			IF(E){
 IF(S){
				RETURN "”";//181.667° 109 '\x94' [Alt+0148]
 };
 RETURN "’";//178.333° 107 '\x92' [Alt+0146]
			};
			IF(S){
 RETURN "ÿ";//358.333° 215 '\xFF' [Alt+0255]
			};
			RETURN "#";//1.667°   1 '\x23' [Alt+0035]
 };
 IF(X <=2387){ //4.167°
			IF(E){
 IF(S){
				RETURN "•";//183.333° 110 '\x95' [Alt+0149]
 };
 RETURN "‘";//176.667° 106 '\x91' [Alt+0145]
			};
			IF(S){
 RETURN "þ";//356.667° 214 '\xFE' [Alt+0254]
			};
			RETURN "$";//3.333°   2 '\x24' [Alt+0036]
 };
 IF(E){
			IF(S){
 RETURN "–";//185.000° 111 '\x96' [Alt+0150]
			};
			RETURN "Ž";//175.000° 105 '\x8E' [Alt+0142]
 };
 IF(S){
			RETURN "ý";//355.000° 213 '\xFD' [Alt+0253]
 };
 RETURN "%";//5.000°   3 '\x25' [Alt+0037]
		};
		IF(X <=5288){ //9.167°
 IF(X <=4314){ //7.500°
			IF(E){
 IF(S){
				RETURN "—";//186.667° 112 '\x97' [Alt+0151]
 };
 RETURN "Œ";//173.333° 104 '\x8C' [Alt+0140]
			};
			IF(S){
 RETURN "ü";//353.333° 212 '\xFC' [Alt+0252]
			};
			RETURN "&";//6.667°   4 '\x26' [Alt+0038]
 };
 IF(E){
			IF(S){
 RETURN "˜";//188.333° 113 '\x98' [Alt+0152]
			};
			RETURN "‹";//171.667° 103 '\x8B' [Alt+0139]
 };
 IF(S){
			RETURN "û";//351.667° 211 '\xFB' [Alt+0251]
 };
 RETURN "'";//8.333°   5 '\x27' [Alt+0039]
		};
		IF(E){
 IF(S){
			RETURN "™";//190.000° 114 '\x99' [Alt+0153]
 };
 RETURN "Š";//170.000° 102 '\x8A' [Alt+0138]
		};
		IF(S){
 RETURN "ú";//350.000° 210 '\xFA' [Alt+0250]
		};
		RETURN "(";//10.000°   6 '\x28' [Alt+0040]
 };
 IF(X <=10332){		//17.500°
		IF(X <=8271){ //14.167°
 IF(X <=7264){ //12.500°
			IF(E){
 IF(S){
				RETURN "š";//191.667° 115 '\x9A' [Alt+0154]
 };
 RETURN "‰";//168.333° 101 '\x89' [Alt+0137]
			};
			IF(S){
 RETURN "ù";//348.333° 209 '\xF9' [Alt+0249]
			};
			RETURN ")";//11.667°   7 '\x29' [Alt+0041]
 };
 IF(E){
			IF(S){
 RETURN "›";//193.333° 116 '\x9B' [Alt+0155]
			};
			RETURN "ˆ";//166.667° 100 '\x88' [Alt+0136]
 };
 IF(S){
			RETURN "ø";//346.667° 208 '\xF8' [Alt+0248]
 };
 RETURN "*";//13.333°   8 '\x2A' [Alt+0042]
		};
		IF(X <=9293){ //15.833°
 IF(E){
			IF(S){
 RETURN "œ";//195.000° 117 '\x9C' [Alt+0156]
			};
			RETURN "‡";//165.000°  99 '\x87' [Alt+0135]
 };
 IF(S){
			RETURN "÷";//345.000° 207 '\xF7' [Alt+0247]
 };
 RETURN "+";//15.000°   9 '\x2B' [Alt+0043]
		};
		IF(E){
 IF(S){
			RETURN "ž";//196.667° 118 '\x9E' [Alt+0158]
 };
 RETURN "†";//163.333°  98 '\x86' [Alt+0134]
		};
		IF(S){
 RETURN "ö";//343.333° 206 '\xF6' [Alt+0246]
		};
		RETURN ",";//16.667°  10 '\x2C' [Alt+0044]
 };
 IF(X <=12469){		//20.833°
		IF(X <=11390){ //19.167°
 IF(E){
			IF(S){
 RETURN "Ÿ";//198.333° 119 '\x9F' [Alt+0159]
			};
			RETURN "…";//161.667°  97 '\x85' [Alt+0133]
 };
 IF(S){
			RETURN "õ";//341.667° 205 '\xF5' [Alt+0245]
 };
 RETURN "-";//18.333°  11 '\x2D' [Alt+0045]
		};
		IF(E){
 IF(S){
			RETURN " ";//200.000° 120 '\xA0' [Alt+0160]
 };
 RETURN "„";//160.000°  96 '\x84' [Alt+0132]
		};
		IF(S){
 RETURN "ô";//340.000° 204 '\xF4' [Alt+0244]
		};
		RETURN ".";//20.000°  12 '\x2E' [Alt+0046]
 };
 IF(E){
		IF(S){
 RETURN "¡";//201.667° 121 '\xA1' [Alt+0161]
		};
		RETURN "ƒ";//158.333°  95 '\x83' [Alt+0131]
 };
 IF(S){
		RETURN "ó";//338.333° 203 '\xF3' [Alt+0243]
 };
 RETURN "/";//21.667°  13 '\x2F' [Alt+0047]
	};
	IF(X <=22241){ //34.167°
 IF(X <=18288){		//29.167°
		IF(X <=15864){ //25.833°
 IF(X <=14704){	//24.167°
			IF(E){
 IF(S){
				RETURN "¢";//203.333° 122 '\xA2' [Alt+0162]
 };
 RETURN "‚";//156.667°  94 '\x82' [Alt+0130]
			};
			IF(S){
 RETURN "ò";//336.667° 202 '\xF2' [Alt+0242]
			};
			RETURN "0";//23.333°  14 '\x30' [Alt+0048]
 };
 IF(E){
			IF(S){
 RETURN "£";//205.000° 123 '\xA3' [Alt+0163]
			};
			RETURN "€";//155.000°  93 '\x80' [Alt+0128]
 };
 IF(S){
			RETURN "ñ";//335.000° 201 '\xF1' [Alt+0241]
 };
 RETURN "1";//25.000°  15 '\x31' [Alt+0049]
		};
		IF(X <=17058){ //27.500°
 IF(E){
			IF(S){
 RETURN "¤";//206.667° 124 '\xA4' [Alt+0164]
			};
			RETURN "~";//153.333°  92 '\x7E' [Alt+0126]
 };
 IF(S){
			RETURN "ð";//333.333° 200 '\xF0' [Alt+0240]
 };
 RETURN "2";//26.667°  16 '\x32' [Alt+0050]
		};
		IF(E){
 IF(S){
			RETURN "¥";//208.333° 125 '\xA5' [Alt+0165]
 };
 RETURN "}";//151.667°  91 '\x7D' [Alt+0125]
		};
		IF(S){
 RETURN "ï";//331.667° 199 '\xEF' [Alt+0239]
		};
		RETURN "3";//28.333°  17 '\x33' [Alt+0051]
 };
 IF(X <=20876){		//32.500°
		IF(X <=19559){ //30.833°
 IF(E){
			IF(S){
 RETURN "¦";//210.000° 126 '\xA6' [Alt+0166]
			};
			RETURN "|";//150.000°  90 '\x7C' [Alt+0124]
 };
 IF(S){
			RETURN "î";//330.000° 198 '\xEE' [Alt+0238]
 };
 RETURN "4";//30.000°  18 '\x34' [Alt+0052]
		};
		IF(E){
 IF(S){
			RETURN "§";//211.667° 127 '\xA7' [Alt+0167]
 };
 RETURN "{";//148.333°  89 '\x7B' [Alt+0123]
		};
		IF(S){
 RETURN "í";//328.333° 197 '\xED' [Alt+0237]
		};
		RETURN "5";//31.667°  19 '\x35' [Alt+0053]
 };
 IF(E){
		IF(S){
 RETURN "¨";//213.333° 128 '\xA8' [Alt+0168]
		};
		RETURN "z";//146.667°  88 '\x7A' [Alt+0122]
 };
 IF(S){
		RETURN "ì";//326.667° 196 '\xEC' [Alt+0236]
 };
 RETURN "6";//33.333°  20 '\x36' [Alt+0054]
	};
	IF(X <=28318){ //40.833°
 IF(X <=25144){		//37.500°
		IF(X <=23662){ //35.833°
 IF(E){
			IF(S){
 RETURN "©";//215.000° 129 '\xA9' [Alt+0169]
			};
			RETURN "y";//145.000°  87 '\x79' [Alt+0121]
 };
 IF(S){
			RETURN "ë";//325.000° 195 '\xEB' [Alt+0235]
 };
 RETURN "7";//35.000°  21 '\x37' [Alt+0055]
		};
		IF(E){
 IF(S){
			RETURN "ª";//216.667° 130 '\xAA' [Alt+0170]
 };
 RETURN "x";//143.333°  86 '\x78' [Alt+0120]
		};
		IF(S){
 RETURN "ê";//323.333° 194 '\xEA' [Alt+0234]
		};
		RETURN "8";//36.667°  22 '\x38' [Alt+0056]
 };
 IF(X <=26693){		//39.167°
		IF(E){
 IF(S){
			RETURN "«";//218.333° 131 '\xAB' [Alt+0171]
 };
 RETURN "w";//141.667°  85 '\x77' [Alt+0119]
		};
		IF(S){
 RETURN "é";//321.667° 193 '\xE9' [Alt+0233]
		};
		RETURN "9";//38.333°  23 '\x39' [Alt+0057]
 };
 IF(E){
		IF(S){
 RETURN "¬";//220.000° 132 '\xAC' [Alt+0172]
		};
		RETURN "v";//140.000°  84 '\x76' [Alt+0118]
 };
 IF(S){
		RETURN "è";//320.000° 192 '\xE8' [Alt+0232]
 };
 RETURN ":";//40.000°  24 '\x3A' [Alt+0058]
	};
	IF(X <=31828){ //44.167°
 IF(X <=30026){		//42.500°
		IF(E){
 IF(S){
			RETURN "­";//221.667° 133 '\xAD' [Alt+0173]
 };
 RETURN "u";//138.333°  83 '\x75' [Alt+0117]
		};
		IF(S){
 RETURN "ç";//318.333° 191 '\xE7' [Alt+0231]
		};
		RETURN ";";//41.667°  25 '\x3B' [Alt+0059]
 };
 IF(E){
		IF(S){
 RETURN "®";//223.333° 134 '\xAE' [Alt+0174]
		};
		RETURN "t";//136.667°  82 '\x74' [Alt+0116]
 };
 IF(S){
		RETURN "æ";//316.667° 190 '\xE6' [Alt+0230]
 };
 RETURN "<";//43.333°  26 '\x3C' [Alt+0060]
	};
	IF(E){
 IF(S){
		RETURN "¯";//225.000° 135 '\xAF' [Alt+0175]
 };
 RETURN "s";//135.000°  81 '\x73' [Alt+0115]
	};
	IF(S){
 RETURN "å";//315.000° 189 '\xE5' [Alt+0229]
	};
	RETURN "=";//45.000°  27 '\x3D' [Alt+0061]
 };
 IF(X <=86111){			//69.167°
	IF(X <=51435){ //57.500°
 IF(X <=42704){		//52.500°
		IF(X <=37917){ //49.167°
 IF(X <=35760){	//47.500°
			IF(E){
 IF(S){
				RETURN "°";//226.667° 136 '\xB0' [Alt+0176]
 };
 RETURN "r";//133.333°  80 '\x72' [Alt+0114]
			};
			IF(S){
 RETURN "ä";//313.333° 188 '\xE4' [Alt+0228]
			};
			RETURN ">";//46.667°  28 '\x3E' [Alt+0062]
 };
 IF(E){
			IF(S){
 RETURN "±";//228.333° 137 '\xB1' [Alt+0177]
			};
			RETURN "q";//131.667°  79 '\x71' [Alt+0113]
 };
 IF(S){
			RETURN "ã";//311.667° 187 '\xE3' [Alt+0227]
 };
 RETURN "?";//48.333°  29 '\x3F' [Alt+0063]
		};
		IF(X <=40225){ //50.833°
 IF(E){
			IF(S){
 RETURN "²";//230.000° 138 '\xB2' [Alt+0178]
			};
			RETURN "p";//130.000°  78 '\x70' [Alt+0112]
 };
 IF(S){
			RETURN "â";//310.000° 186 '\xE2' [Alt+0226]
 };
 RETURN "@";//50.000°  30 '\x40' [Alt+0064]
		};
		IF(E){
 IF(S){
			RETURN "³";//231.667° 139 '\xB3' [Alt+0179]
 };
 RETURN "o";//128.333°  77 '\x6F' [Alt+0111]
		};
		IF(S){
 RETURN "á";//308.333° 185 '\xE1' [Alt+0225]
		};
		RETURN "A";//51.667°  31 '\x41' [Alt+0065]
 };
 IF(X <=48277){		//55.833°
		IF(X <=45378){ //54.167°
 IF(E){
			IF(S){
 RETURN "´";//233.333° 140 '\xB4' [Alt+0180]
			};
			RETURN "n";//126.667°  76 '\x6E' [Alt+0110]
 };
 IF(S){
			RETURN "à";//306.667° 184 '\xE0' [Alt+0224]
 };
 RETURN "B";//53.333°  32 '\x42' [Alt+0066]
		};
		IF(E){
 IF(S){
			RETURN "µ";//235.000° 141 '\xB5' [Alt+0181]
 };
 RETURN "m";//125.000°  75 '\x6D' [Alt+0109]
		};
		IF(S){
 RETURN "ß";//305.000° 183 '\xDF' [Alt+0223]
		};
		RETURN "C";//55.000°  33 '\x43' [Alt+0067]
 };
 IF(E){
		IF(S){
 RETURN "¶";//236.667° 142 '\xB6' [Alt+0182]
		};
		RETURN "l";//123.333°  74 '\x6C' [Alt+0108]
 };
 IF(S){
		RETURN "Þ";//303.333° 182 '\xDE' [Alt+0222]
 };
 RETURN "D";//56.667°  34 '\x44' [Alt+0068]
	};
	IF(X <=67683){ //64.167°
 IF(X <=58712){		//60.833°
		IF(X <=54896){ //59.167°
 IF(E){
			IF(S){
 RETURN "·";//238.333° 143 '\xB7' [Alt+0183]
			};
			RETURN "k";//121.667°  73 '\x6B' [Alt+0107]
 };
 IF(S){
			RETURN "Ý";//301.667° 181 '\xDD' [Alt+0221]
 };
 RETURN "E";//58.333°  35 '\x45' [Alt+0069]
		};
		IF(E){
 IF(S){
			RETURN "¸";//240.000° 144 '\xB8' [Alt+0184]
 };
 RETURN "j";//120.000°  72 '\x6A' [Alt+0106]
		};
		IF(S){
 RETURN "Ü";//300.000° 180 '\xDC' [Alt+0220]
		};
		RETURN "F";//60.000°  36 '\x46' [Alt+0070]
 };
 IF(X <=62947){		//62.500°
		IF(E){
 IF(S){
			RETURN "¹";//241.667° 145 '\xB9' [Alt+0185]
 };
 RETURN "i";//118.333°  71 '\x69' [Alt+0105]
		};
		IF(S){
 RETURN "Û";//298.333° 179 '\xDB' [Alt+0219]
		};
		RETURN "G";//61.667°  37 '\x47' [Alt+0071]
 };
 IF(E){
		IF(S){
 RETURN "º";//243.333° 146 '\xBA' [Alt+0186]
		};
		RETURN "h";//116.667°  70 '\x68' [Alt+0104]
 };
 IF(S){
		RETURN "Ú";//296.667° 178 '\xDA' [Alt+0218]
 };
 RETURN "H";//63.333°  38 '\x48' [Alt+0072]
	};
	IF(X <=79109){ //67.500°
 IF(X <=73026){		//65.833°
		IF(E){
 IF(S){
			RETURN "»";//245.000° 147 '\xBB' [Alt+0187]
 };
 RETURN "g";//115.000°  69 '\x67' [Alt+0103]
		};
		IF(S){
 RETURN "Ù";//295.000° 177 '\xD9' [Alt+0217]
		};
		RETURN "I";//65.000°  39 '\x49' [Alt+0073]
 };
 IF(E){
		IF(S){
 RETURN "¼";//246.667° 148 '\xBC' [Alt+0188]
		};
		RETURN "f";//113.333°  68 '\x66' [Alt+0102]
 };
 IF(S){
		RETURN "Ø";//293.333° 176 '\xD8' [Alt+0216]
 };
 RETURN "J";//66.667°  40 '\x4A' [Alt+0074]
	};
	IF(E){
 IF(S){
		RETURN "½";//248.333° 149 '\xBD' [Alt+0189]
 };
 RETURN "e";//111.667°  67 '\x65' [Alt+0101]
	};
	IF(S){
 RETURN "×";//291.667° 175 '\xD7' [Alt+0215]
	};
	RETURN "K";//68.333°  41 '\x4B' [Alt+0075]
 };
 IF(X <=203064){ //80.833°
	IF(X <=129815){ //75.833°
 IF(X <=103927){ //72.500°
		IF(X <=94273){ //70.833°
 IF(E){
			IF(S){
 RETURN "¾";//250.000° 150 '\xBE' [Alt+0190]
			};
			RETURN "d";//110.000°  66 '\x64' [Alt+0100]
 };
 IF(S){
			RETURN "Ö";//290.000° 174 '\xD6' [Alt+0214]
 };
 RETURN "L";//70.000°  42 '\x4C' [Alt+0076]
		};
		IF(E){
 IF(S){
			RETURN "¿";//251.667° 151 '\xBF' [Alt+0191]
 };
 RETURN "c";//108.333°  65 '\x63' [Alt+0099]
		};
		IF(S){
 RETURN "Õ";//288.333° 173 '\xD5' [Alt+0213]
		};
		RETURN "M";//71.667°  43 '\x4D' [Alt+0077]
 };
 IF(X <=115543){ //74.167°
		IF(E){
 IF(S){
			RETURN "À";//253.333° 152 '\xC0' [Alt+0192]
 };
 RETURN "b";//106.667°  64 '\x62' [Alt+0098]
		};
		IF(S){
 RETURN "Ô";//286.667° 172 '\xD4' [Alt+0212]
		};
		RETURN "N";//73.333°  44 '\x4E' [Alt+0078]
 };
 IF(E){
		IF(S){
 RETURN "Á";//255.000° 153 '\xC1' [Alt+0193]
		};
		RETURN "a";//105.000°  63 '\x61' [Alt+0097]
 };
 IF(S){
		RETURN "Ó";//285.000° 171 '\xD3' [Alt+0211]
 };
 RETURN "O";//75.000°  45 '\x4F' [Alt+0079]
	};
	IF(X <=171235){ //79.167°
 IF(X <=147807){ //77.500°
		IF(E){
 IF(S){
			RETURN "Â";//256.667° 154 '\xC2' [Alt+0194]
 };
 RETURN "`";//103.333°  62 '\x60' [Alt+0096]
		};
		IF(S){
 RETURN "Ò";//283.333° 170 '\xD2' [Alt+0210]
		};
		RETURN "P";//76.667°  46 '\x50' [Alt+0080]
 };
 IF(E){
		IF(S){
 RETURN "Ã";//258.333° 155 '\xC3' [Alt+0195]
		};
		RETURN "_";//101.667°  61 '\x5F' [Alt+0095]
 };
 IF(S){
		RETURN "Ñ";//281.667° 169 '\xD1' [Alt+0209]
 };
 RETURN "Q";//78.333°  47 '\x51' [Alt+0081]
	};
	IF(E){
 IF(S){
		RETURN "Ä";//260.000° 156 '\xC4' [Alt+0196]
 };
 RETURN "^";//100.000°  60 '\x5E' [Alt+0094]
	};
	IF(S){
 RETURN "Ð";//280.000° 168 '\xD0' [Alt+0208]
	};
	RETURN "R";//80.000°  48 '\x52' [Alt+0082]
 };
 IF(X <=449798){ //85.833°
	IF(X <=320739){ //84.167°
 IF(X <=248898){ //82.500°
		IF(E){
 IF(S){
			RETURN "Å";//261.667° 157 '\xC5' [Alt+0197]
 };
 RETURN "]";//98.333°  59 '\x5D' [Alt+0093]
		};
		IF(S){
 RETURN "Ï";//278.333° 167 '\xCF' [Alt+0207]
		};
		RETURN "S";//81.667°  49 '\x53' [Alt+0083]
 };
 IF(E){
		IF(S){
 RETURN "Æ";//263.333° 158 '\xC6' [Alt+0198]
		};
		RETURN "\";//96.667°  58 '\x5C' [Alt+0092] "
 };
 IF(S){
		RETURN "Î";//276.667° 166 '\xCE' [Alt+0206]
 };
 RETURN "T";//83.333°  50 '\x54' [Alt+0084]
	};
	IF(E){
 IF(S){
		RETURN "Ç";//265.000° 159 '\xC7' [Alt+0199]
 };
 RETURN "[";//95.000°  57 '\x5B' [Alt+0091]
	};
	IF(S){
 RETURN "Í";//275.000° 165 '\xCD' [Alt+0205]
	};
	RETURN "U";//85.000°  51 '\x55' [Alt+0085]
 };
 IF(X <=2252803){ //89.167°
	IF(X <=750511){ //87.500°
 IF(E){
		IF(S){
 RETURN "È";//266.667° 160 '\xC8' [Alt+0200]
		};
		RETURN "Z";//93.333°  56 '\x5A' [Alt+0090]
 };
 IF(S){
		RETURN "Ì";//273.333° 164 '\xCC' [Alt+0204]
 };
 RETURN "V";//86.667°  52 '\x56' [Alt+0086]
	};
	IF(E){
 IF(S){
		RETURN "É";//268.333° 161 '\xC9' [Alt+0201]
 };
 RETURN "Y";//91.667°  55 '\x59' [Alt+0089]
	};
	IF(S){
 RETURN "Ë";//271.667° 163 '\xCB' [Alt+0203]
	};
	RETURN "W";//88.333°  53 '\x57' [Alt+0087]
 };
 IF(S){
	RETURN "Ê";//270.000° 162 '\xCA' [Alt+0202]
 };
 RETURN "X";//90.000°  54 '\x58' [Alt+0088]
};

//
//Helper class to directly access the AtVector of a zCVob object.
//
CLASS COMPASS_VOBINFO
{
//zCObject {
 VAR INT _VTBL;//0x0000
 VAR INT REFCTR;//0x0004 int
 VAR INT HASHINDEX;//0x0008 zWORD
 VAR INT HASHNEXT;//0x000C zCObject*
 VAR STRING OBJECTNAME;//0x0010 zSTRING
//}
 VAR INT GLOBALVOBTREENODE;//0x0024 zCTree<zCVob>*
 VAR INT LASTTIMEDRAWN;//0x0028 zTFrameCtr
 VAR INT LASTTIMECOLLECTED;//0x002C zDWORD
//zCArray<zCBspLeaf*> {
 VAR INT VOBLEAFLIST_ARRAY;//0x0030 zCBspLeaf**
 VAR INT VOBLEAFLIST_NUMALLOC;//0x0034 int
 VAR INT VOBLEAFLIST_NUMINARRAY;//0x0038 int
//}
 VAR INT TRAFOOBJTOWORLD[16];	//0x003C zMATRIX4
//zTBBox3D {
 VAR INT BBOX3D_MINS[3];//0x007C zPOINT3
 VAR INT BBOX3D_MAXS[3];//0x0088 zPOINT3
//}
 //...
 //The following fields differ in Gothic I and Gothic II.
 //...
};

//
//Returns the compass character for the current player character.
//
FUNC STRING COMPASS_FORHERO()
{
 VAR COMPASS_VOBINFO H;

 H=HLP_GETNPC(HLP_GETINSTANCEID(HERO));
 IF(!HLP_ISVALIDNPC(H)){
	RETURN COMPASS_INVALID;
 };
 RETURN COMPASS_GETTEXT(H.TRAFOOBJTOWORLD[2],H.TRAFOOBJTOWORLD[10]);
};

   