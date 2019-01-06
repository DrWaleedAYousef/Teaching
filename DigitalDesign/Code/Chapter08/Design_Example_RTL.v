// RTL description of design example (Fig. 8-11)
module Design_Example_RTL  
// carefully consider unused state code implications for output and next state

  ( output reg	[3:0] 	A,
    output reg		E, F,
    input			Start, clock, reset_b
  );
  reg		[1: 0]	state, next_state;
  reg			clr_E, set_E, clr_F, set_F, clr_A_F, incr_A;
  parameter		S_idle = 2'b00, S_1 = 2'b01, S_2 = 2'b11;
  wire			A2 = A[2], A3 = A[3];

// control unit
  always @ (posedge clock, negedge reset_b)
    if (reset_b ==0) state <= S_idle;
    else state <= next_state;

  always @ (state, Start, A2, A3) begin
    next_state = state;
    clr_E = 0;
    set_E = 0;
    clr_A_F = 0;
    set_F = 0;
    incr_A = 0;
    case (state)
      S_idle:	if (Start) begin next_state = S_1; clr_A_F = 1; end
      S_1:	begin incr_A = 1; if (A2 == 0) clr_E = 1; else 
  		  begin set_E = 1; if (A3) next_state = S_2; end	
 		end
      S_2:	begin set_F = 1; next_state = S_idle; end
     //default:	next_state = S_idle;
    endcase
   end 

// datapath unit
  always @ (posedge clock) begin
    if (clr_E) 	E <= 0;
    if (set_E)	 E <= 1;
    if (clr_A_F) 	begin A <= 0; F <= 0; end
    if (set_F) 	F <= 1;
    if (incr_A) 	A <= A + 1;  
end
endmodule

// test bench

module t_Design_Example_RTL;
reg Start, clock, reset_b;
  wire [3: 0] A;
  wire E, F;

  // Instantiate design example

  Design_Example_RTL M0 (A, E, F, Start, clock, reset_b);

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

