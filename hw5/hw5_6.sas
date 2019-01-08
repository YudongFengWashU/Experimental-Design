data light;
	input glass temp resp;
	datalines;
	1 100 58
	1 100 56.8
	1 100 57
	2 100 55
	2 100 53
	2 100 57.9
	3 100 54.6
	3 100 57.5
	3 100 59.9
	1 125 107
	1 125 106.7
	1 125 106.5
	2 125 107
	2 125 103.5
	2 125 105
	3 125 106.5
	3 125 107.3
	3 125 108.6
	1 150 129.2
	1 150 128
	1 150 128.6
	2 150 117.8
	2 150 116.2
	2 150 109.9
	3 150 101.7
	3 150 105.4
	3 150 103.9
	;
run;
proc glm data=light;
	class glass temp;
	model resp = glass|temp;
	means glass /bon;
	lsmeans glass*temp /adjust= tukey;
	output out=diag r=res p=pred;
run;
proc univariate data=diag noprint;
  qqplot res /normal (L=1 mu=est sigma=est);
run;
proc gplot data=diag;
	plot res*(pred glass temp);
run;
proc means data=light;
	class glass temp;
	var resp;
	output out=means mean=avg;
run;
axis1 label=(angle=90);
axis2 offset=(3,3);
symbol1 v=F i=join c=red;
symbol2 v=M i=join c=blue;
proc gplot data=means;
  plot avg*glass=temp /vaxis=axis1 haxis=axis2;
  plot avg*temp=glass /vaxis=axis1 haxis=axis2;
run;
proc glm data=light;
	class glass temp;
	model resp = glass*temp;
run;
data light1;
	input glass resp;
	datalines;
	1 58
	1 56.8
	1 57
	2 55
	2 53
	2 57.9
	3 54.6
	3 57.5
	3 59.9
	;
run;
data light2;
	input glass resp;
	datalines;
	1 107
	1 106.7
	1 106.5
	2 107
	2 103.5
	2 105
	3 106.5
	3 107.3
	3 108.6
	;
run;
data light3;
	input glass resp;
	datalines;
	1 129.2
	1 128
	1 128.6
	2 117.8
	2 116.2
	2 109.9
	3 101.7
	3 105.4
	3 103.9
	;
run;
proc glm data=light1;
	class glass;
	model resp = glass;
run;
proc glm data=light2;
	class glass;
	model resp = glass;
run;
proc glm data=light3;
	class glass;
	model resp = glass;
run;
	