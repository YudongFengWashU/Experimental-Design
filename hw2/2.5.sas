data one;
	input treatment $ resp;
	datalines;
	A 106
	A 101
	A 120
	A 86
	A 132
	A 97
	a 51
	a 98
	a 85
	a 50
	a 111
	a 72
	B 103
	B 84
	B 100
	B 83
	B 110
	B 91
	b 50
	b 66
	b 61
	b 72
	b 85
	b 60
;
run;


proc glm data=one;
	class treatment;
	model resp = treatment; 
	contrast 'C1' treatment  1 1 -1 -1;
	contrast 'C2' treatment  1 -1 1 -1; 
	contrast 'C3' treatment  1 -1 -1 1;
	
	means treatment / alpha=.05 bon clm;
run;