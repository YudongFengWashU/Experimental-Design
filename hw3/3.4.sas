data new; a = 6; alpha=.01; ratiovar=0.5; 
do n=5 to 30;
	df = a*(n-1);
	lambdasq = 1+ratiovar*n;
	fcut  = finv(1-alpha,a-1,df);
	beta=probf(fcut/lambdasq,a-1,df);
	power = 1-beta;   output;
end;

proc print;
    var n beta power; run;