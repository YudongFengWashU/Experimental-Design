data measurement;
	input part operator resp;
	datalines;
	1 1 50
	1 1 49
	1 1 50
	1 2 50
	1 2 48
	1 2 51
	2 1 52
	2 1 52
	2 1 51
	2 2 51
	2 2 51
	2 2 51
	3 1 53
	3 1 50
	3 1 50
	3 2 54
	3 2 52
	3 2 51
	4 1 49
	4 1 51
	4 1 50
	4 2 48
	4 2 50 
	4 2 51
	5 1 48
	5 1 49
	5 1 48
	5 2 48
	5 2 49
	5 2 48
	6 1 52 
	6 1 50
	6 1 50
	6 2 52
	6 2 50
	6 2 50
	7 1 51
	7 1 51 
	7 1 51 
	7 2 51
	7 2 50
	7 2 50
	8 1 52 
	8 1 50
	8 1 49
	8 2 53
	8 2 48 
	8 2 50
	9 1 50
	9 1 51 
	9 1 50
	9 2 51 
	9 2 48
	9 2 49
	10 1 47
	10 1 46
	10 1 49
	10 2 46
	10 2 47
	10 2 48
	;
run;
proc glm data=measurement;
	class part operator;
	model resp = part|operator;
	random part operator*part /test;
run;
