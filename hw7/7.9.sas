data pitch;
	do D = -1 to 1 by 2;
	do C = -1 to 1 by 2;
	do B = -1 to 1 by 2; 
	do A = -1 to 1 by 2;
	E=A*B*C;
	F=B*C*D;
	input y @@; output; end; end; end; end;
	datalines;
	74 190 133 127 115 101 54 144 121 188 135 170 126 175 126 193
	;
run;
data inter; 
	set pitch;
	AB=A*B; AC=A*C; AD=A*D; AE=A*E; AF=A*F; BD=B*D; BF=B*F; CD=C*D; DE=D*E; ABD=AB*D; ABF=AB*F;
run;
proc glm data=inter;
	class A B C D E F AB AC AD AE AF BD BF ABD ABF;
	model y=A B C D E F AB AC AD AE AF BD BF ABD ABF;
	estimate 'A' A -1 1;
	estimate 'B' B -1 1;
	estimate 'C' C -1 1;
	estimate 'D' D -1 1;
	estimate 'E' E -1 1;
	estimate 'F' F -1 1;
	estimate 'AB' AB -1 1;
	estimate 'AC' AC -1 1;
	estimate 'AD' AD -1 1;
	estimate 'AE' AE -1 1;
	estimate 'AF' AF -1 1;
	estimate 'BD' BD -1 1;
	estimate 'BF' BF -1 1;
	estimate 'ABD' ABD -1 1;
	estimate 'ABF' ABF -1 1;
run;
proc reg outest=effects data=inter noprint;
	model y=A B C D E F AB AC AD AE AF BD BF ABD ABF;
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
	class A C D E DE CD;
	model y = A C D E DE CD;
run;
proc reg data=inter;
	model y = A C D E DE CD;
run;