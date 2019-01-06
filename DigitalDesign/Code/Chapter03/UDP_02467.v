// Verilog model: User-defined Primitive
primitive UDP_02467 (D, A, B, C);
  output D;
  input	A, B, C;
// Truth table for D = f (A, B, C) = ??(0, 2, 4, 6, 7);
  table
// 	A	B	C	:	D 	// Column header comment
	0	0	0	:	1;
	0	0	1	:	0;
	0	1	0	:	1;
	0	1	1	:	0;
	1	0	0	:	1;
	1	0	1	:	0;
	1	1	0	:	1;
	1	1	1	:	1;
  endtable
endprimitive
