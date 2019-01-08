data hardness1;
	input tip coupon y;
	datalines;
	1 1 9.3
	2 1 9.4
	3 1 9.2
	4 1 9.7
	1 2 9.4
	2 2 9.3
	3 2 9.4
	4 2 9.6
	1 3 9.6
	2 3 9.6222
	3 3 9.5
	4 3 10.0
	1 4 10.0
	2 4 9.9
	3 4 9.7
	4 4 10.2
;
run;
proc glm data=hardness1;
	class tip coupon;
	model y = tip coupon;
run;