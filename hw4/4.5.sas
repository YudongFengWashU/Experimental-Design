data test;
	input chem bolt y;
	datalines;
	1 1 73
	2 1 73
	3 1 75
	4 1 73
	1 2 68
	2 2 67
	3 2 68
	4 2 71
	1 3 74
	2 3 75.45
	3 3 78
	4 3 75
	1 4 71
	2 4 72
	3 4 73
	4 4 72.63
	1 5 67
	2 5 70
	3 5 68
	4 5 69
;
run;
proc glm data=test;
	class chem bolt;
	model y = chem bolt;
run;
