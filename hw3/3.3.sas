data sto;
	infile '/home/yudongfeng0/hw3/stomata.dat';
	input needle nsto;
run;
proc glm data=sto;
	class needle;
	model nsto = needle;
run;