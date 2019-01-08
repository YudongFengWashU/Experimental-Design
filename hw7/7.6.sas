data etch;
	do D = -1 to 1 by 2;
	do C = -1 to 1 by 2;
	do B = -1 to 1 by 2; 
	do A = -1 to 1 by 2;
	input y @@; output; end; end; end; end;
	datalines;
	550 669 604 650 633 642 601 635 1037 749 1052 868 1075 860 1063 729
	;
run;
data inter;
	set etch;
	AB=A*B; AC=A*C; AD=A*D; BC=B*C; BD=B*D; CD=C*D;
	ABC=AB*C; ABD=AB*D; ACD=AC*D; BCD=BC*D; ABCD=ABC*D;
run;
proc glm data=inter; 
	class A B C D AB AC AD BC BD CD ABC ABD ACD BCD ABCD;
	model y=A B C D AB AC AD BC BD CD ABC ABD ACD BCD ABCD;
	estimate 'A' A -1 1;
	estimate 'B' B -1 1;
	estimate 'C' C -1 1;
	estimate 'D' D -1 1;
	estimate 'AB' AB -1 1;
	estimate 'AC' AC -1 1;
	estimate 'AD' AD -1 1;
	estimate 'BC' BC -1 1;
	estimate 'BD' BD -1 1;
	estimate 'CD' CD -1 1;
	estimate 'ABC' ABC -1 1;
	estimate 'ABD' ABD -1 1;
	estimate 'ACD' ACD -1 1;
	estimate 'BCD' BCD -1 1;
	estimate 'ABCD' ABCD -1 1;
proc reg outest=effects data=inter noprint;
	model y=A B C D AB AC AD BC BD CD ABC ABD ACD BCD ABCD;
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
	class A D AD;
	model y = A D AD;
	estimate 'A' A -1 1;
	estimate 'D' D -1 1;
	estimate 'AD' AD -1 1;
run;
proc reg data=inter;
	model y=A D AD;
run;