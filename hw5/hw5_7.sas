data textile;
	input loom out;
	datalines;
	1 14
	1 14.1
	1 14.2
	1 14
	1 14.1
	2 13.9
	2 13.8
	2 13.9
	2 14
	2 14
	3 14.1
	3 14.2
	3 14.1
	3 14
	3 13.9
	4 13.6
	4 13.8
	4 14 
	4 13.9
	4 13.7
	5 13.8
	5 13.6
	5 13.9
	5 13.8
	5 14
	;
run;
proc glm data=textile;
	class loom;
	model out = loom;
	random loom;
	output out=diag r=res p=pred;
run;
proc univariate data=diag noprint;
  qqplot res /normal (L=1 mu=est sigma=est);
run;
proc gplot data=diag;
	plot res*(pred loom);
run;