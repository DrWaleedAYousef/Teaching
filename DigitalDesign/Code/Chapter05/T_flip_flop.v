// Description of Toggle (T) flip-flop

module Toggle_flip_flop_1 (Q, T, CLK, RST);
  output 	Q;
  input		T, CLK, RST;
  reg 		Q;

  always @ (posedge CLK, negedge RST)	
    if (~RST) Q <= 1'b0;
    else if (T) Q <= ~Q;	 
endmodule

module Toggle_flip_flop_2 (Q, T, CLK, RST);
  output 	Q;
  input		T, CLK, RST;
  wire		DT;
  assign DT = T ^ Q;
  D_flip_flop_AR M0 (Q, DT, CLK, RST);

endmodule

 module Toggle_flip_flop_3 (Q, T, CLK, RST);
  output 	Q;
  input		T, CLK, RST;
  reg 		Q;

  always @ (posedge CLK, negedge RST)	
    if (~RST) Q <= 1'b0;
    else  Q <= Q ^ T;	 
endmodule

module t_Toggle_flip_flops;
  wire  t_Q_1, t_Q_2, t_Q_3;
  reg	t_T, t_CLK, t_RST;


  Toggle_flip_flop_1 M1  (t_Q_1, t_T, t_CLK, t_RST);
  Toggle_flip_flop_2 M2  (t_Q_2, t_T, t_CLK, t_RST);
  Toggle_flip_flop_3 M3  (t_Q_3, t_T, t_CLK, t_RST);
  initial #150 $finish;
  initial begin t_CLK = 0; forever #5 t_CLK =  ~t_CLK; end
  initial fork
    t_T = 1;
    t_RST = 0;
    #22 t_RST = 1;
     #42 t_RST = 0;
    #62 t_RST = 1;

    #90 t_T = 0;
    #120 t_T = 1;
     
  join
endmodule
