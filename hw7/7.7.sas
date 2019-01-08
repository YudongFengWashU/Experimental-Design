data yield3;
	do C = -1 to 1 by 2;
	do B = -1 to 1 by 2; 
	do A = -1 to 1 by 2;
	D=A*B*C;
	input y @@; output; end; end; end;
	datalines;
	90 72 87 83 99 81 88 80
	;
run;
data inter; 
	set yield3;
	AB=A*B; AC=A*C; AD=A*D;
run;
proc reg outest=effects data=inter noprint;
	model y=A B C D AB AC AD;
run;
data effect2; set effects;
drop y intercept _RMSE_;
proc transpose data=effect2 out=effect3;
data effect4; set effect3; effect=col1*2;
proc sort data=effect4; by effect;
proc print data=effect4;
proc rank data=effect4 out=effect5 normal=blom;
var effect; ranks neff;
proc print data=effect5;
symbol1 v=circle;
proc gplot data=effect5;
plot effect*neff=_NAME_; run; quit;

proc glm data=inter;
	class A B D AB AD;
	model y = A B D AB AD;
run;
proc reg data=inter;
	model y=A B D AB AD;
run;

proc glm data=inter;
	class A;
	model y = A;
	estimate 'A' A -1 1;

run;
proc reg data=inter;
	model y=A;
run;
