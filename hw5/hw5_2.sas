data fiber;
	input operator machine resp;
	datalines;
	1 1 109
	1 1 110
	1 2 110
	1 2 115
	1 3 108
	1 3 109
	1 4 110
	1 4 108
	2 1 110
	2 1 112
	2 2 110
	2 2 111
	2 3 111
	2 3 109
	2 4 114
	2 4 112
	3 1 116
	3 1 114
	3 2 112
	3 2 115
	3 3 114
	3 3 119
	3 4 120
	3 4 117
	;
run;
proc glm data=fiber;
	class operator machine;
	model resp = operator machine operator*machine;
	output out=diag r=res p=pred;
run;
proc gplot data=diag;
	plot res*(pred operator machine);
run;
proc univariate data=diag noprint;
  qqplot res /normal (L=1 mu=est sigma=est);
run;