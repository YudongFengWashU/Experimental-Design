data lifetime;
	do C = -1 to 1 by 2;
	do B = -1 to 1 by 2; 
	do A = -1 to 1 by 2;
	input y @@; output; end; end; end;
	do C = -1 to 1 by 2;
	do B = -1 to 1 by 2; 
	do A = -1 to 1 by 2;
	input y @@; output; end; end; end;
	do C = -1 to 1 by 2;
	do B = -1 to 1 by 2; 
	do A = -1 to 1 by 2;
	input y @@; output; end; end; end;
	datalines;
	22 32 35 55 44 40 60 39 31 43 34 47 45 37 50 41 25 29 50 46 38 36 54 47
	;
run;
data inter;
	set lifetime;
	AB=A*B; AC=A*C; BC=B*C; ABC=AB*C;
run;
proc glm data=inter;
	class A B C AB AC BC ABC;
	model y = A B C AB AC BC ABC;
	estimate 'A' A -1 1;
	estimate 'B' B -1 1;
	estimate 'C' C -1 1;
	estimate 'AB' AB -1 1;
	estimate 'AC' AC -1 1;
	estimate 'BC' BC -1 1;
	estimate 'ABC' ABC -1 1;
	
run;
proc reg data=inter;
	model y = A B C AB AC BC ABC;
run;


