data new2; alpha=.05; sigma=4; delta=5;
do n=2 to 19 by 1;
nc=delta/(sigma*sqrt(2/n)); df = 2*(n-1);
rlow = tinv(alpha/2,df); rhigh = tinv(1-alpha/2,df);
p=1-probt(rhigh,df,nc)+probt(rlow,df,nc); output;
end;
symbol1 v=circle i=sm5; title1 Power Curve II for t-test;
axis1 label=("prob"); axis2 label=("Sample Size");
proc gplot; plot p*n / haxis=axis2 vaxis=axis1 vref=0.9; run;