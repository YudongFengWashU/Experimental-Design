data repairTime;
	input repairtime @@;
	cards;
	159
	280
	101
	212
	224
	379
	179
	264
	222
	362
	168
	250
	149
	260
	485
	170
	;

proc ttest h0=225 alpha=0.05 sides=u;
var repairtime;
run;


