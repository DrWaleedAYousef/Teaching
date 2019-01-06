// Verilog model: Simple_Circuit
module Simple_Circuit (A, B, C, D, E);
  output	D, E;
  input		A, B, C;
  wire		w1;
  
  and 		G1 (w1, A, B); // Optional gate instance name
  not		G2 (E, C);
  or		G3 (D, w1, E);
endmodule
