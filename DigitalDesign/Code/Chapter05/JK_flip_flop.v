// Description of JK flip-flop

module JK_flip_flop_1 (Q, Q_not, J, K, CLK, RST_B);
  output 	Q, Q_not;
  input		J, K, CLK, RST_B;
  wire		JK;
  assign	JK = (J & ~Q) | (~K & Q);
  assign	Q_not = ~Q; 
  D_flip_flop_AR M0 (Q, JK, CLK, RST_B);
 endmodule

module JK_flip_flop_2 (Q, Q_not, J, K, CLK);
  output 	Q, Q_not;
  input		J, K, CLK;
  reg 		Q;
  assign	Q_not = ~Q;
  always @ (posedge CLK)	
    case ({J, K})
      2'b00:	Q <= Q;
      2'b01:	Q <= 1'b0;
      2'b10:	Q <= 1'b1;
      2'b11:	Q <= ~Q;
    endcase
 endmodule
/*
module t_JK_flip_flop;
  wire 	Q, Q_not;
  reg	J, K, CLK, RST_B;

  JK_flip_flop_1  M1 (Q_1, Q_1_not, J, K, CLK, RST_B);
  JK_flip_flop_2  M2 (Q_2, Q_2_not, J, K, CLK);

 
  initial #100 $finish;
  initial begin CLK = 0; forever #5 CLK = ~CLK; end
  initial fork
    RST_B = 0;
    RST_B = 1;
    J = 0;
    K = 0;
    #20 K = 1;
    #40 J = 1;
    #80 K = 0;
    #90 J = 0;
   join
endmodule
*/
