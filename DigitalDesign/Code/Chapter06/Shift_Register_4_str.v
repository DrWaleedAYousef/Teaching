// Structural description of a 4-bit universal shift register (see Fig. 6.7)
module Shift_Register_4_str (			// V2001, 2005		
  output [3: 0] 	A_par,				// Parallel output
  input 	[3: 0] 	I_par,				// Parallel input
  input 		s1, s0,				// Mode select
  input 		MSB_in, LSB_in, CLK, Clear	// Serial inputs, clock, clear
);

// bus for mode control
  wire 	[1:0] 	select = {s1, s0};

// Instantiate the four stages
  stage ST0 (A_par[0], A_par[1], LSB_in, I_par[0], A_par[0], select, CLK, Clear);
  stage ST1 (A_par[1], A_par[2], A_par[0], I_par[1],A_par[1], select, CLK, Clear);
  stage ST2 (A_par[2], A_par[3], A_par[1], I_par[2], A_par[2], select, CLK, Clear);
  stage ST3 (A_par[3], MSB_in, A_par[2], I_par[3], A_par[3], select, CLK, Clear);
endmodule

// One stage of shift register
module stage (i0, i1, i2, i3, Q, select, CLK, Clr);
  input 		i0, 		// circulation bit selection
 		i1, 		// data from left neighbor or serial input for shift-right
        i2, 		// data from right neighbor or serial input for shift-left
        i3; 		// data from parallel input
  output 	Q; 
  input [1: 0] 	select;		// stage mode control bus
  input		CLK, Clr;	// Clock, Clear for flip-flops 
  wire		mux_out;

// instantiate mux and flip-flop
  Mux_4_x_1	M0 	(mux_out, i0, i1, i2, i3, select);
  D_flip_flop	M1 	(Q, mux_out, CLK, Clr);
endmodule

 // 4x1 multiplexer 		// behavioral model 
module Mux_4_x_1 (mux_out, i0, i1, i2, i3, select);
  output 	mux_out;
  input		i0, i1, i2, i3;
  input [1: 0]	select;
  reg		mux_out;
  always @ (select, i0, i1, i2, i3)
    case (select)
      2'b00: 	mux_out = i0;
      2'b01: 	mux_out = i1;
      2'b10: 	mux_out = i2;
      2'b11: 	mux_out = i3;
    endcase
endmodule

  
// Behavioral model of D flip-flop
module D_flip_flop (Q, D, CLK, Clr);
  output	Q;
  input		D, CLK, Clr;
  reg		Q;

  always @ (posedge CLK or negedge Clr)		
    if (~Clr) Q <= 1'b0; else Q <= D;
endmodule


module t_Shift_Register_4_str ();
  reg 			s1, s0,			// Select inputs
  			MSB_in, LSB_in,	// Serial inputs
  			clk, reset_b;		// Clock and Clear
  reg 	[3: 0] 	I_par;			// Parallel input
  wire 	[3: 0] 	A_par;			// Register output

  Shift_Register_4_str M0 (A_par, I_par, s1, s0, MSB_in, LSB_in, clk, reset_b);

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



