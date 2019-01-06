module Moore_Model_Fig_5_20 (
  output  y_out, 
  input	x_in, clock, reset
);
  reg [1: 0]	state;
  parameter	S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

  always @ (posedge clock, negedge reset)
    if (reset == 0) state <= S0;	// Initialize to state S0
    else case (state)
      S0:	if (x_in) 	state <= S1; else state <= S0;
      S1: if (x_in) 	  	state <= S2; else state <= S1;
      S2:	if (x_in) 	state <= S3; else state <= S2;
      S3: if (x_in)   	state <= S0; else state <= S3;
    endcase 

  assign y_out = (state == S3);	// Output of flip-flops
endmodule 

module Moore_Model_STR_Fig_5_20 (
  output	y_out, A, B, 
  input		x_in, clock, reset
);
  wire		TA, TB;

// Flip-flop input equations
  assign TA = x_in & B;
  assign TB = x_in;
//output equation
  assign y_out = A & B;
// Instantiate Toggle flip-flops
  Toggle_flip_flop_3 M_A (A, TA, clock, reset);
  Toggle_flip_flop_3 M_B (B, TB, clock, reset);

endmodule 

module t_Moore_Fig_5_20;
  wire 	t_y_out_2, t_y_out_1; 
  reg	t_x_in, t_clock, t_reset;

  Moore_Model_Fig_5_20 M1(t_y_out_1, t_x_in, t_clock, t_reset);
  Moore_Model_STR_Fig_5_20 M2 (t_y_out_2, A, B, t_x_in, t_clock, t_reset);


  initial #200 $finish;
  initial begin
         t_reset = 0;
         t_clock = 0;
    #5 t_reset = 1;
    repeat (16)
      #5 t_clock = ~t_clock;
  end
  initial begin
           t_x_in = 0;
    #15 t_x_in = 1;
    repeat (8)
      #10 t_x_in = ~t_x_in;
  end
endmodule
