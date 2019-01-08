data randr;
  do part = 1 to 20;
  do operator = 1 to 3;
  do rep = 1 to 2;
  input measurement @@;
  output;
  end;
  end;
  end;
  datalines;
  21 20 20 20 19 21 24 23 24 24 23 24 20 21 19 21 20 22 27 27 28 26 27 28
  19 18 19 18 18 21 23 21 24 21 23 22 22 21 22 24 22 20 19 17 18 20 19 18
  24 23 25 23 24 24 25 23 26 25 24 25 21 20 20 20 21 20 18 19 17 19 18 19
  23 25 25 25 25 25 24 24 23 25 24 25 29 30 30 28 31 30 26 26 25 26 25 27
  20 20 19 20 20 20 19 21 19 19 21 23 25 26 25 24 25 25 19 19 18 17 19 17
;
run;
proc glm data=randr;
	class part operator;
	model measurement = part operator part*operator;
	random part operator part*operator/test;
run;
proc varcomp data=randr;
	class part operator;
	model measurement = part operator part*operator;
run;
proc mixed data=randr cl;
	class part operator;
	model measurement = ;
	random part operator part*operator;
run;