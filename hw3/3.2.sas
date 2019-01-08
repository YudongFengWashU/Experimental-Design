data pi;
	input resp level prior;
	datalines;
	7.6 1 8.2
    8.2 1 7.9
    6.8 1 7.0
    5.8 1 5.7
    6.9 1 7.2
    6.6 1 7.0
    6.3 1 6.5
    7.7 1 7.9
    6.0 1 6.3
    6.7 2 8.8
    8.1 2 10.0
    9.4 2 10.7
    8.6 2 10.0
    7.8 2 9.7
    7.7 2 9.4
    8.9 2 10.6
    7.9 2 9.8
    8.3 2 10.0
    8.7 2 10.3
    7.1 2 8.9
    8.4 2 10.0
    8.5 3 11.5
    9.7 3 12.2
   10.1 3 12.8
    7.8 3 11.0
    9.6 3 12.3
    9.5 3 12.1
;
run;
symbol v=dot h=1 c=red i=none;
axis1 offset=(3,3);
axis2 label=(angle=90);
proc gplot data=pi;
	plot resp*level /haxis=axis1 vaxis=axis2;
run;

symbol1 v=1 h=2 c=blue;
symbol2 v=2 h=2 c=red;
symbol3 v=3 h=2 c=green;
proc gplot data=pi;
	plot resp*prior = level /haxis=axis1 vaxis=axis2;
run;
proc glm data=pi;
	class level;
	model resp = level|prior*level  /solution;
	lsmeans level /pdiff adjust=tukey;
run;
proc glm data=pi;
	class level;
	model resp = prior level /solution;
run;
proc glm data=pi;
	class level;
	model resp = level;
	lsmeans level /pdiff adjust=tukey;
run;

