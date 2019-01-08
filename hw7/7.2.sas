data yield1;
	do D = -1 to 1 by 2;
	do C = -1 to 1 by 2;
	do B = -1 to 1 by 2; 
	do A = -1 to 1 by 2;
	input y @@; output; end; end; end; end;
	datalines;
	90 74 81 83 77 81 88 73 98 72 87 85 99 79 87 80
	;
run;
data inter;
	set yield1;
	AB=A*B; AC=A*C; AD=A*D; BC=B*C; BD=B*D; CD=C*D;
	ABC=AB*C; ABD=AB*D; ACD=AC*D; BCD=BC*D; block=ABC*D;
run;
proc reg outest=effects data=inter noprint;
	model y=A B C D AB AC AD BC BD CD ABC ABD ACD BCD block;
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
	class A B C D AB AC AD BC BD ABC ABD block;
	model y=block A B C D AB AC AD BC BD ABC ABD; 
run;
proc reg data=inter;
	model y=A B C D AB AC AD BC BD ABC ABD block; 
run;

