// Description of D latch (transparent latch)
// See Fig. 5-6 

module D_latch (Q, D, En);
  output 	Q;
  input		D, En;
  reg 		Q;

  always @ (En, D)	
    if (En) Q <= D;	// Alternative: if (En == 1) Q <= D;
endmodule


