// Behavioral description of a 4-bit universal shift register 
// Fig. 6.7 and Table 6.3
module Shift_Register_4_beh (			// V2001, 2005
  output reg 	[3: 0] 	A_par,			// Register output
  input 		[3: 0] 	I_par,			// Parallel input
  input 			s1, s0,			// Select inputs
  			MSB_in, LSB_in,	// Serial inputs
  			CLK, Clear		// Clock and Clear
);
  always @ (posedge CLK, negedge Clear)	// V2001, 2005
    if (~Clear) A_par <= 4'b0000;
    else
      case ({s1, s0})
        2'b00: A_par <= A_par;			// No change
        2'b01: A_par <= {MSB_in, A_par[3: 1]};	// Shift right
        2'b10: A_par <= {A_par[2: 0], LSB_in};	// Shift left
        2'b11: A_par <= I_par;			// Parallel load of input
      endcase
endmodule



module t_Shift_Register_4_beh ();
  reg 	s1, s0,			// Select inputs
  	MSB_in, LSB_in,	// Serial inputs
  	clk, reset_b;		// Clock and Clear
  reg 	[3: 0] 	I_par;		// Parallel input
  wire 	[3: 0] 	A_par;		// Register output

  Shift_Register_4_beh M0 (A_par, I_par,s1, s0, MSB_in, LSB_in, clk, reset_b);

  initial #200 $finish;
  initial begin clk = 0; forever #5 clk = ~clk; end

  initial fork
    // test reset action load
    #3 reset_b = 1;
    #4 reset_b = 0;
    #9 reset_b = 1;

    // test parallel load
    #10 I_par = 4'hA;
    #10 {s1, s0} = 2'b11;

    // test shift right
    #30 MSB_in = 1'b0;
    #30 {s1, s0} = 2'b01;

    // test shift left
    #80 LSB_in = 1'b1;
    #80 {s1, s0} = 2'b10;

    // test circulation of data
   #130 {s1, s0} = 2'b11;
    #140 {s1, s0} = 2'b00;

   // test reset on the fly

    #150 reset_b = 1'b0;
    #160 reset_b = 1'b1;
    #160 {s1, s0} = 2'b11;

  join
endmodule
