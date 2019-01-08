data hw2_8;
	input design $ defect;
	datalines;
	1   7
	1   2
	1   4
	1   7
	1   2
	2   10
	2   6
	2   9
	2   7
	2   5
	3   16
	3   13
	3   11
	3   13
	3   13
	4   5
	4   5
	4   2
	4   2
	4   7
	;
run;
/*a*/
proc glm data=hw2_8 plots=diagnostics;
	class design;
	model defect = design;
	means design /;
	contrast 'l1' design 1 -1 0  0;
	contrast 'l2' design 1  0 -1 0;
	contrast 'l3' design 1  0 0 -1;
	contrast 'l4' design 0  1 -1 0;
	contrast 'l5' design 0  1 0 -1;
	contrast 'l6' design 0  0 1 -1;
run;
/*b*/
proc univariate data=hw2_8 normal;
run;

