data tpow;
	do meandiff = 0,2,4,6,8,10,12,14,16;
	do stddev = 8;
	do alpha = 0.01;
	do ntotal = 20;
	ncp = ntotal*0.5*0.5* meandiff**2 / stddev**2;
	critval = finv(1-alpha, 1, ntotal-2, 0);
	power = sdf('f', critval, 1, ntotal-2, ncp);
	output;
	end;
	end;
	end;
	end;
	run;
	



proc sgplot data=WORK.TPOW;
   vline meandiff / response=power lineattrs=(thickness=4) stat=Mean name='Line';
	run;