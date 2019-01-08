data yield2;
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
	set yield2;
	AB=A*B; AC=A*C; AD=A*D; BC=B*C; BD=B*D; CD=C*D;
	ABC=AB*C; ABD=AB*D; ACD=AC*D; BCD=BC*D; block1=ABC; block2=ABD; ABCD = ABC*D;
run;
proc reg outest=effects data=inter noprint;
	model y=A B C D AB AC AD BC BD CD block1 block2 ACD BCD ABCD;
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
	class A B C D AB AD ABCD block1 block2;
	model y=block1 block2 A B C D AB AD ABCD; 
run;

proc reg data=inter;
	model y=A B C D AB AD ABCD block1 block2; 
run;
