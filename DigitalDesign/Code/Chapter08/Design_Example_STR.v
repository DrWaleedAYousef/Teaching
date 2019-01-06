// Structural description of design example (Fig. 8-10, 8-12)
module Design_Example_STR  

  ( output 	[3:0] 	A,					// V 2001 port syntax
    output		E, F,
    input		Start, clock, reset_b
  );

  Controller_STR M0 (clr_A_F, set_E, clr_E, set_F, incr_A, Start, A[2], A[3], clock, reset_b );
  Datapath_STR M1 (A, E, F, clr_A_F, set_E, clr_E, set_F, incr_A, clock);
endmodule

module Controller_STR 
( output clr_A_F, set_E, clr_E, set_F, incr_A,
   input Start, A2, A3, clock, reset_b
);
  
  wire		G0, G1;
  parameter		S_idle = 2'b00, S_1 = 2'b01, S_2 = 2'b11;
  wire w1, w2, w3;

  not (G0_b, G0);
  not (G1_b, G1);
  buf (incr_A, w2);
  buf (set_F, G1);
  not (A2_b, A2);
  or (D_G0, w1, w2);
  and (w1, Start, G0_b);
  and (clr_A_F, G0_b, Start);
  and (w2, G0, G1_b);
  and (set_E, w2, A2);
  and (clr_E, w2, A2_b);
  and (D_G1, w3, w2);
  and (w3, A2, A3);
  D_flip_flop_AR M0 (G0, D_G0, clock, reset_b);
  D_flip_flop_AR M1 (G1, D_G1, clock, reset_b);
endmodule

// datapath unit

module Datapath_STR 
( output [3: 0]	A,
  output  		E, F,
  input		clr_A_F, set_E, clr_E, set_F, incr_A, clock
);

  JK_flip_flop_2 M0 (E, E_b, set_E, clr_E, clock);
  JK_flip_flop_2 M1 (F, F_b, set_F, clr_A_F, clock);
  Counter_4 M2 (A, incr_A, clr_A_F, clock);

endmodule

// counter with synchronous clear

module Counter_4 (output reg [3: 0] A, input incr, clear, clock);
  always @ (posedge clock)  
    if (clear) 	A <= 0; else if (incr) A <= A + 1;  
 
endmodule

module D_flip_flop_AR (Q, D, CLK, RST);
  output 	Q;
  input		D, CLK, RST;
  reg 		Q;

  always @ (posedge CLK, negedge RST)	
    if (RST == 0) Q <= 1'b0;
    else Q <= D;	 
endmodule

// Description of JK flip-flop

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

module t_Design_Example_STR;
reg Start, clock, reset_b;
  wire [3: 0] A;
  wire E, F;

  // Instantiate design example

  Design_Example_STR M0 (A, E, F, Start, clock, reset_b);

  // Describe stimulus waveforms

  initial #500 $finish;		// Stopwatch
  initial
    begin
      reset_b = 0;
      Start = 0;
      clock = 0;
      #5 reset_b = 1; Start = 1;
      repeat (32)
        begin
          #5 clock = ~ clock;	// Clock generator
        end
    end
  initial
  $monitor ("A = %b E = %b F = %b time = %0d", A, E, F, $time);
endmodule

