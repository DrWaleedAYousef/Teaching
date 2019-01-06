module Binary_Counter_4_Par_Load (

  output reg [3:0]	A_count,	// Data output
  output 	C_out,	// Output carry
  input [3:0] 	Data_in,	// Data input 
  input 	Count, 	// Active high to count
	Load, 	// Active high to load
	CLK, 	// Positive edge sensitive
	Clear	// Active low
);

assign C_out = Count & (~Load) & (A_count == 4'b1111);
always @ (posedge CLK, negedge Clear)
  if (~Clear) 	A_count <= 4'b0000;
  else if (Load) A_count <= 4'b0000;
  else if (Count) 	A_count <= A_count + 1'b1;
  else 	A_count <= A_count;	// redundant statement
endmodule

