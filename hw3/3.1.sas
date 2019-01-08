data snickers;
	input sales  loc  size;
	datalines;
	20 1 1
	23 1 1
	24 1 1
	26 2 1
	29 2 1
	48 3 1
	39 3 1
	13 1 2
	14 2 2
	19 2 2
	30 3 2
	32 3 2
	25 3 2
;
run;
proc glm data=snickers;
	class loc size;
	model sales = loc size loc*size;
run;
proc glm data=snickers;
	class loc size;
	model sales = loc size /solution;
	means loc size/tukey;
	lsmeans loc size /pdiff adjust=tukey;
	means loc;
	lsmeans loc;
run;
