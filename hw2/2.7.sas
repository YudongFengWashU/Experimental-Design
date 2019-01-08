data hw2_7;
	input treatment $ resp;
	datalines;
	1  2.23
    1  3.04
    1  1.16
    1  2.52
    1  2.82
    1  3.12
    1  1.23
    1  3.62
    1  1.00
    1  1.80
    2  6.33
    2  3.65
    2  2.22
    2  4.50
    2  3.63
    2  5.90
    2  6.69
    2  2.83
    2  4.14
    2  1.45
    3  8.53
    3  4.60
    3  6.98
    3  3.54
    3  7.85
    3  9.66
    3 10.00
    3  5.28
    3 11.60
    3  8.12
    ;
run;
/*a, b*/
proc glm data=hw2_7 plots=diagnostics;
	class treatment;
	model resp = treatment;
	means treatment / hovtest=levene hovtest=bartlett;
	contrast "l1" treatment 1 -1 0;
	contrast "l2" treatment 1 0 -1;
	contrast "l3" treatment 0 1 -1;
	
run;
/*c*/
proc means data=hw2_7;
	class treatment;
	var resp;
	output out=a1 mean=muhat std=sighat;
run;
data a2; set a1;
	if _Type_ = 1;
	var_mean = (sighat*sighat)/muhat;
	sd_mean = sighat/muhat;
	sd_meansq = sighat/(muhat*muhat);
proc print data=a2;
	var treatment var_mean sd_mean sd_meansq;
run;
data a1;set a1;
	logmu = log(muhat);
	logsig = log(sighat);
proc print; run;
proc reg data=a1;
	model logsig = logmu;
	title 'mean vs Std Dev';symbol1 v=circle i=rl;
proc gplot; 
	plot logsig*logmu /regeqn;
run;
/*d*/
proc transreg data=hw2_7;
    model boxcox(resp)=class(treatment);
run;
/*e*/
data hw2_7;set hw2_7;
	lresp = sqrt(sqrt(resp));
proc glm data = hw2_7 plots=diagnostics;
	class treatment;
	model lresp = treatment;
	means treatment / hovtest=levene hovtest=bartlett;
/*f*/
proc means data=hw2_7;
    class treatment;
    var resp;
    output out=a1 var=variance;
data a1;set a1;if _Type_ = 1;
data hw2_7; merge hw2_7 a1; by treatment;
    weight=1/variance;
proc glm data=hw2_7 plots=diagnostics;
    class treatment;
    model resp=treatment;
    weight weight;
    means treatment /tukey lines;
    output out=diag3 p=pred r=resid;
run;  
	