data etching;
	input sol $ rate;
	datalines;
	1 9.9
	1 10.6
	1 9.4
	1 10.3
	1 10.0
	1 9.3
	1 10.3
	1 9.8
	2 10.2
	2 10.6
	2 10.0
	2 10.2
	2 10.7
	2 10.4
	2 10.5
	2 10.3
	;

proc ttest ci=equal;
	class sol;
	var rate;
	run;
                                    