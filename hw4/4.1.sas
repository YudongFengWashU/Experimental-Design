data clay;
	input temp oven y;
	datalines;
	5 1 3
	10 1 3
	15 1 9
	20 1 7
	5 2 10
	10 2 8
	15 2 13
	20 2 12
	5 3 7
	10 3 12
	15 3 15
	20 3 9
	5 4 4
	10 4 2
	15 4 3
	20 4 8
	5 5 3
	10 5 4
	15 5 10
	20 5 13
;
proc glm data=clay;
	class oven temp;
	model y = oven temp;
	means temp /tukey;
	contrast 'C1' temp 1 -1 0 0;
	contrast 'C2' temp 0 0 1 -1;
	contrast 'C3' temp 1 1 -1 -1;
run;	