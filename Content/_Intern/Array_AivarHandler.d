
/* Disabled since We needed own function for handling self._aivars
   Ork: Kurwa, jestem głupi.
 

func void Npc_SetAivar (var C_NPC slf, var int offset, var int value)
{
		 if (offset == 	0	) { slf._aivar[	0	] = value; }	
	else if (offset == 	1	) { slf._aivar[	1	] = value; }	
	else if (offset == 	2	) { slf._aivar[	2	] = value; }	
	else if (offset == 	3	) { slf._aivar[	3	] = value; }	
	else if (offset == 	4	) { slf._aivar[	4	] = value; }	
	else if (offset == 	5	) { slf._aivar[	5	] = value; }	
	else if (offset == 	6	) { slf._aivar[	6	] = value; }	
	else if (offset == 	7	) { slf._aivar[	7	] = value; }	
	else if (offset == 	8	) { slf._aivar[	8	] = value; }	
	else if (offset == 	9	) { slf._aivar[	9	] = value; }	
	else if (offset == 	10	) { slf._aivar[	10	] = value; }	
	else if (offset == 	11	) { slf._aivar[	11	] = value; }	
	else if (offset == 	12	) { slf._aivar[	12	] = value; }	
	else if (offset == 	13	) { slf._aivar[	13	] = value; }	
	else if (offset == 	14	) { slf._aivar[	14	] = value; }	
	else if (offset == 	15	) { slf._aivar[	15	] = value; }
	else if (offset == 	16	) { slf._aivar[	16	] = value; }
	else if (offset == 	17	) { slf._aivar[	17	] = value; }
	else if (offset == 	18	) { slf._aivar[	18	] = value; }
	else if (offset == 	19	) { slf._aivar[	19	] = value; }
	else if (offset == 	20	) { slf._aivar[	20	] = value; }
	else if (offset == 	21	) { slf._aivar[	21	] = value; }
	else if (offset == 	22	) { slf._aivar[	22	] = value; }
	else if (offset == 	23	) { slf._aivar[	23	] = value; }
	else if (offset == 	24	) { slf._aivar[	24	] = value; }
	else if (offset == 	25	) { slf._aivar[	25	] = value; }
	else if (offset == 	26	) { slf._aivar[	26	] = value; }
	else if (offset == 	27	) { slf._aivar[	27	] = value; }
	else if (offset == 	28	) { slf._aivar[	28	] = value; }
	else if (offset == 	29	) { slf._aivar[	29	] = value; }
	else if (offset == 	30	) { slf._aivar[	30	] = value; }
	else if (offset == 	31	) { slf._aivar[	31	] = value; }
	else if (offset == 	32	) { slf._aivar[	32	] = value; }
	else if (offset == 	33	) { slf._aivar[	33	] = value; }
	else if (offset == 	34	) { slf._aivar[	34	] = value; }
	else if (offset == 	35	) { slf._aivar[	35	] = value; }
	else if (offset == 	36	) { slf._aivar[	36	] = value; }
	else if (offset == 	37	) { slf._aivar[	37	] = value; }
	else if (offset == 	38	) { slf._aivar[	38	] = value; }
	else if (offset == 	39	) { slf._aivar[	39	] = value; }
	else if (offset == 	40	) { slf._aivar[	40	] = value; }
	else if (offset == 	41	) { slf._aivar[	41	] = value; }
	else if (offset == 	42	) { slf._aivar[	42	] = value; }
	else if (offset == 	43	) { slf._aivar[	43	] = value; }
	else if (offset == 	44	) { slf._aivar[	44	] = value; }
	else if (offset == 	45	) { slf._aivar[	45	] = value; }
	else if (offset == 	46	) { slf._aivar[	46	] = value; }
	else if (offset == 	47	) { slf._aivar[	47	] = value; }
	else if (offset == 	48	) { slf._aivar[	48	] = value; }
	else if (offset == 	49	) { slf._aivar[	49	] = value; };
};

func int Npc_GetAivar (var C_NPC slf, var int offset)
{
		 if (offset == 	0	) { return slf._aivar[	0	]; }	
	else if (offset == 	1	) { return slf._aivar[	1	]; }	
	else if (offset == 	2	) { return slf._aivar[	2	]; }	
	else if (offset == 	3	) { return slf._aivar[	3	]; }	
	else if (offset == 	4	) { return slf._aivar[	4	]; }	
	else if (offset == 	5	) { return slf._aivar[	5	]; }	
	else if (offset == 	6	) { return slf._aivar[	6	]; }	
	else if (offset == 	7	) { return slf._aivar[	7	]; }	
	else if (offset == 	8	) { return slf._aivar[	8	]; }	
	else if (offset == 	9	) { return slf._aivar[	9	]; }	
	else if (offset == 	10	) { return slf._aivar[	10	]; }	
	else if (offset == 	11	) { return slf._aivar[	11	]; }	
	else if (offset == 	12	) { return slf._aivar[	12	]; }	
	else if (offset == 	13	) { return slf._aivar[	13	]; }	
	else if (offset == 	14	) { return slf._aivar[	14	]; }	
	else if (offset == 	15	) { return slf._aivar[	15	]; }
	else if (offset == 	16	) { return slf._aivar[	16	]; }
	else if (offset == 	17	) { return slf._aivar[	17	]; }
	else if (offset == 	18	) { return slf._aivar[	18	]; }
	else if (offset == 	19	) { return slf._aivar[	19	]; }
	else if (offset == 	20	) { return slf._aivar[	20	]; }
	else if (offset == 	21	) { return slf._aivar[	21	]; }
	else if (offset == 	22	) { return slf._aivar[	22	]; }
	else if (offset == 	23	) { return slf._aivar[	23	]; }
	else if (offset == 	24	) { return slf._aivar[	24	]; }
	else if (offset == 	25	) { return slf._aivar[	25	]; }
	else if (offset == 	26	) { return slf._aivar[	26	]; }
	else if (offset == 	27	) { return slf._aivar[	27	]; }
	else if (offset == 	28	) { return slf._aivar[	28	]; }
	else if (offset == 	29	) { return slf._aivar[	29	]; }
	else if (offset == 	30	) { return slf._aivar[	30	]; }
	else if (offset == 	31	) { return slf._aivar[	31	]; }
	else if (offset == 	32	) { return slf._aivar[	32	]; }
	else if (offset == 	33	) { return slf._aivar[	33	]; }
	else if (offset == 	34	) { return slf._aivar[	34	]; }
	else if (offset == 	35	) { return slf._aivar[	35	]; }
	else if (offset == 	36	) { return slf._aivar[	36	]; }
	else if (offset == 	37	) { return slf._aivar[	37	]; }
	else if (offset == 	38	) { return slf._aivar[	38	]; }
	else if (offset == 	39	) { return slf._aivar[	39	]; }
	else if (offset == 	40	) { return slf._aivar[	40	]; }
	else if (offset == 	41	) { return slf._aivar[	41	]; }
	else if (offset == 	42	) { return slf._aivar[	42	]; }
	else if (offset == 	43	) { return slf._aivar[	43	]; }
	else if (offset == 	44	) { return slf._aivar[	44	]; }
	else if (offset == 	45	) { return slf._aivar[	45	]; }
	else if (offset == 	46	) { return slf._aivar[	46	]; }
	else if (offset == 	47	) { return slf._aivar[	47	]; }
	else if (offset == 	48	) { return slf._aivar[	48	]; }
	else if (offset == 	49	) { return slf._aivar[	49	]; };
};

*************************************************************/
func void Npc_ClearAivars (var C_NPC slf)
{
	slf._aivar[	0	] = 0;
	slf._aivar[	1	] = 0;
	slf._aivar[	2	] = 0;
	slf._aivar[	3	] = 0;
	slf._aivar[	4	] = 0;
	slf._aivar[	5	] = 0;
	slf._aivar[	6	] = 0;
	slf._aivar[	7	] = 0;
	slf._aivar[	8	] = 0;
	slf._aivar[	9	] = 0;
	slf._aivar[	10	] = 0;
	slf._aivar[	11	] = 0;
	slf._aivar[	12	] = 0;
	slf._aivar[	13	] = 0;
	slf._aivar[	14	] = 0;
	slf._aivar[	15	] = 0;
	slf._aivar[	16	] = 0;
	slf._aivar[	17	] = 0;
	slf._aivar[	18	] = 0;
	slf._aivar[	19	] = 0;
	slf._aivar[	20	] = 0;
	slf._aivar[	21	] = 0;
	slf._aivar[	22	] = 0;
	slf._aivar[	23	] = 0;
	slf._aivar[	24	] = 0;
	slf._aivar[	25	] = 0;
	slf._aivar[	26	] = 0;
	slf._aivar[	27	] = 0;
	slf._aivar[	28	] = 0;
	slf._aivar[	29	] = 0;
	slf._aivar[	30	] = 0;
	slf._aivar[	31	] = 0;
	slf._aivar[	32	] = 0;
	slf._aivar[	33	] = 0;
	slf._aivar[	34	] = 0;
	slf._aivar[	35	] = 0;
	slf._aivar[	36	] = 0;
	slf._aivar[	37	] = 0;
	slf._aivar[	38	] = 0;
	slf._aivar[	39	] = 0;
	slf._aivar[	40	] = 0;
	slf._aivar[	41	] = 0;
	slf._aivar[	42	] = 0;
	slf._aivar[	43	] = 0;
	slf._aivar[	44	] = 0;
	slf._aivar[	45	] = 0;
	slf._aivar[	46	] = 0;
	slf._aivar[	47	] = 0;
	slf._aivar[	48	] = 0;
	slf._aivar[	49	] = 0;
};

func void Npc_ClearAivarsFrom (var C_NPC slf, var int first)
{
	if (first <= 	0	) {	slf._aivar[	0	] = 0;	};
	if (first <= 	1	) {	slf._aivar[	1	] = 0;	};
	if (first <= 	2	) {	slf._aivar[	2	] = 0;	};
	if (first <= 	3	) {	slf._aivar[	3	] = 0;	};
	if (first <= 	4	) {	slf._aivar[	4	] = 0;	};
	if (first <= 	5	) {	slf._aivar[	5	] = 0;	};
	if (first <= 	6	) {	slf._aivar[	6	] = 0;	};
	if (first <= 	7	) {	slf._aivar[	7	] = 0;	};
	if (first <= 	8	) {	slf._aivar[	8	] = 0;	};
	if (first <= 	9	) {	slf._aivar[	9	] = 0;	};
	if (first <= 	10	) {	slf._aivar[	10	] = 0;	};
	if (first <= 	11	) {	slf._aivar[	11	] = 0;	};
	if (first <= 	12	) {	slf._aivar[	12	] = 0;	};
	if (first <= 	13	) {	slf._aivar[	13	] = 0;	};
	if (first <= 	14	) {	slf._aivar[	14	] = 0;	};
	if (first <= 	15	) {	slf._aivar[	15	] = 0;	};
	if (first <= 	16	) {	slf._aivar[	16	] = 0;	};
	if (first <= 	17	) {	slf._aivar[	17	] = 0;	};
	if (first <= 	18	) {	slf._aivar[	18	] = 0;	};
	if (first <= 	19	) {	slf._aivar[	19	] = 0;	};
	if (first <= 	20	) {	slf._aivar[	20	] = 0;	};
	if (first <= 	21	) {	slf._aivar[	21	] = 0;	};
	if (first <= 	22	) {	slf._aivar[	22	] = 0;	};
	if (first <= 	23	) {	slf._aivar[	23	] = 0;	};
	if (first <= 	24	) {	slf._aivar[	24	] = 0;	};
	if (first <= 	25	) {	slf._aivar[	25	] = 0;	};
	if (first <= 	26	) {	slf._aivar[	26	] = 0;	};
	if (first <= 	27	) {	slf._aivar[	27	] = 0;	};
	if (first <= 	28	) {	slf._aivar[	28	] = 0;	};
	if (first <= 	29	) {	slf._aivar[	29	] = 0;	};
	if (first <= 	30	) {	slf._aivar[	30	] = 0;	};
	if (first <= 	31	) {	slf._aivar[	31	] = 0;	};
	if (first <= 	32	) {	slf._aivar[	32	] = 0;	};
	if (first <= 	33	) {	slf._aivar[	33	] = 0;	};
	if (first <= 	34	) {	slf._aivar[	34	] = 0;	};
	if (first <= 	35	) {	slf._aivar[	35	] = 0;	};
	if (first <= 	36	) {	slf._aivar[	36	] = 0;	};
	if (first <= 	37	) {	slf._aivar[	37	] = 0;	};
	if (first <= 	38	) {	slf._aivar[	38	] = 0;	};
	if (first <= 	39	) {	slf._aivar[	39	] = 0;	};
	if (first <= 	40	) {	slf._aivar[	40	] = 0;	};
	if (first <= 	41	) {	slf._aivar[	41	] = 0;	};
	if (first <= 	42	) {	slf._aivar[	42	] = 0;	};
	if (first <= 	43	) {	slf._aivar[	43	] = 0;	};
	if (first <= 	44	) {	slf._aivar[	44	] = 0;	};
	if (first <= 	45	) {	slf._aivar[	45	] = 0;	};
	if (first <= 	46	) {	slf._aivar[	46	] = 0;	};
	if (first <= 	47	) {	slf._aivar[	47	] = 0;	};
	if (first <= 	48	) {	slf._aivar[	48	] = 0;	};
	if (first <= 	49	) {	slf._aivar[	49	] = 0;	};
};