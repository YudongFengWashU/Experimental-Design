data new1; 
	input company $ rate;
	datalines;
	s 2
	s 4
	s 1
	s 7
	s 4
	s 3
	s 1
	s 5
	b 4
	b 3
	b 6
	b 8
	b 7
	b 5
;
run;

data new1; n1=8; n2=6; sigma=1.987; delta=2; alpha=0.05;
df = n1+n2-2; nc=delta/(sigma*(sqrt(1/n1+1/n2)));
rlow = tinv(alpha/2,df); rhigh=tinv(1-alpha/2,df);
p=1-probt(rhigh,df,nc)+probt(rlow,df,nc);
proc print data=new1; run;