data fiber_b;
	input operator machine block resp;
	datalines;
	1 1 1 109
	1 1 2 110
	1 2 1 110
	1 2 2 115
	1 3 1 108
	1 3 2 109
	1 4 1 110
	1 4 2 108
	2 1 1 110
	2 1 2 112
	2 2 1 110
	2 2 2 111
	2 3 1 111
	2 3 2 109
	2 4 1 114
	2 4 2 112
	3 1 1 116
	3 1 2 114
	3 2 1 112
	3 2 2 115
	3 3 1 114
	3 3 2 119
	3 4 1 120
	3 4 2 117
	;
run;
proc glm data=fiber_b;
	class operator machine block;
	model resp = operator|machine block;
	output out=diag r=res p=pred;
run;
proc gplot data=diag;
	plot res*(pred operator machine);
run;
proc univariate data=diag noprint;
  qqplot res /normal (L=1 mu=est sigma=est);
run;