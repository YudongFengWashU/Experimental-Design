data defTemp;
	input form $ temp;
	datalines;
	1 206 
	1 193 
	1 192 
	1 188 
	1 207 
	1 210
	1 205 
	1 185 
	1 194 
	1 187 
	1 189 
	1 178
	2 177 
	2 176 
	2 198 
	2 197 
	2 185 
	2 188
	2 206 
	2 200 
	2 189 
	2 201 
	2 197 
	2 203
	;


proc ttest cochran ci=equal;
	class form;
	var temp;
	run;