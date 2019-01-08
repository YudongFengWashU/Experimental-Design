data eff;
	input term ef;
	datalines;
	A 1.25 
	B 5.25
	C 3.5
	D 0.75
	AB 0.75
	AC -0.5
	AD 0.75
	BC 1.5
	BD 0.25
	CD 0.5
	ABC -1
	ABD 0.75
	ACD -0.5
	BCD 0
	ABCD -0.5
	;
run;

proc rank data=eff out=effect5 normal=blom;
var ef; ranks neff;

proc print data=effect5;


proc gplot data=effect5;
	plot ef*neff; 
run; quit;