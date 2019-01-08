data fertMix;
	input mix $ yield;
	datalines;
	A 3
	B 5
	B 4
	A 3
	B 7
	A 6
	;

proc ttest ci=equal;
	class mix;
	var yield;
	run;