module t_ripple_carry_4_bit_adder ( );
  wire [3: 0] Sum;
  wire C4;
  reg [3: 0]  A, B;
  reg C0;

// Select one:
 // ripple_carry_4_bit_adder M0 ( Sum, C4, A, B, C0);
  Adder_4_bit_df M0 ( Sum, C4, A, B, C0);

  initial 
    #100 $finish;
  
// Minimial set of patterns for quick test
  initial fork
    #10 C0 = 0;
    #10 A = 4'ha; 
    #10 B = 4'h5;
    #20 A = 0; 
    #20 B = 0;
    #30 A = 4'h5; 
    #30 B = 4'ha;
    #40 C0 = 1;
    #50 A = 4'ha; 
    #50 B = 4'h5;
    #60 A = 0; 
    #60 B = 0;
    #70 A = 4'h5; 
    #70 B = 4'ha;
  join
endmodule

