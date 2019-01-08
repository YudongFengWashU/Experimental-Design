data hardness;
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
	2 3 9.8
	3 3 9.5
	4 3 10.0
	1 4 10.0
	2 4 9.9
	3 4 9.7
	4 4 10.2
;
run;
proc glm data=hardness;
	class tip coupon;
	model y = tip coupon;
	means tip /lsd cldiff;
	output out=one p=pred r=res;
run;
symbol1 v=circle; 
axis1 offset=(4);
proc gplot;
     plot res*tip /haxis=axis1;
     plot res*coupon /haxis=axis1;
     plot res*pred;
proc univariate noprint;
    qqplot res /normal (L=1 mu=0 sigma=est);