module t_Circuit_with_UDP_02467;
  wire 	E, F;
  reg	A, B, C, D;
  Circuit_with_UDP_02467 m0 (E, F, A, B, C, D);

  initial #100 $finish;
  initial fork
    A = 0; B = 0; C = 0; D = 0;
    #40 A = 1;
    #20 B = 1; 
    #40 B = 0;
    #60 B = 1;
    #10 C = 1; #20 C = 0; #30 C = 1; #40 C = 0; #50 C = 1; #60 C = 0; #70 C = 1;
    #20 D = 1;
  join
endmodule

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
// Verilog model: Circuit instantiation of Circuit_UDP_02467
module Circuit_with_UDP_02467 (e, f, a, b, c, d);
  output 	e, f;
  input		a, b, c, d;

 UDP_02467 	M0 (e, a, b, c);
  and		      (f, e, d);		//Option gate instance name omitted
endmodule

