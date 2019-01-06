// Description of D flip-flop
// See Fig. 5-11 

module D_flip_flop (Q, D, CLK);
  output 	Q;
  input		D, CLK;
  reg 		Q;

  always @ (posedge CLK)	
    Q <= D;	 
endmodule

module D_flip_flop_b (Q, Q_b, D, CLK);
  output 	Q, Q_b;
  input		D, CLK;
  reg 		Q;
  assign Q_b = ~Q;

  always @ (posedge CLK)	
    Q <= D;	 
endmodule

// Description of D flip-flop
// with active-low asynchronous reset 

module D_flip_flop_AR (Q, D, CLK, RST);
  output 	Q;
  input		D, CLK, RST;
  reg 		Q;

  always @ (posedge CLK, negedge RST)	
    if (RST == 0) Q <= 1'b0;
    else Q <= D;	 
endmodule

module D_flip_flop_AR_b (Q, Q_b, D, CLK, RST);
  output 	Q, Q_b;
  input		D, CLK, RST;
  reg 		Q;
  assign		Q_b = ~Q;
  always @ (posedge CLK, negedge RST)	
    if (RST == 0) Q <= 1'b0;
    else Q <= D;	 
endmodule

/*
module t_D_flip_flops;
  wire 	Q, Q_AR;
  reg	D, CLK, RST;


  D_flip_flop M0 (Q, D, CLK);
  D_flip_flop_AR M1 (Q_AR, D, CLK, RST);

  initial #100 $finish;
  initial begin CLK = 0; forever #5 CLK = ~CLK; end
  initial fork
    D = 1;
    RST = 1;
    #20 D = 0;
    #40 D = 1;
    #50 D = 0;
    #60 D = 1;
    #70 D = 0;
    #90 D = 1;
    #42 RST = 0;
    #72 RST = 1;
  join
endmodule
*/
