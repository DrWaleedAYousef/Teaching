// Dataflow description of 2-to-4-line decoder
// See Fig. 4-19. Note: The figure uses symbol E, but the
// Verilog model uses enable to clearly indicate functionality.

module decoder_2x4_df (D, A, B, enable);
  output	[0: 3]	D;
  input		A, B;
  input		enable;

 
  assign	D[0] = ~(~A & ~B & ~enable),
		D[1] = ~(~A & B & ~enable),
		D[2] = ~(A & ~B & ~enable),
		D[3] = ~(A & B & ~enable);
endmodule
