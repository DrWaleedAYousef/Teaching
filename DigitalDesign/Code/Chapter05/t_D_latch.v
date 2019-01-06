// Test bench for D_latch (transparent latch)

module t_D_latch;
  wire	Q;
  reg	D, En;
   
 D_latch M0 (Q, D, En);

  initial #100 $finish;
  initial repeat (10) begin #10 D = 1; #10 D = 0; end
  initial fork
           En = 0;
    #5   En = 1;
    #15 En = 0;	// latch the output
    #35 En = 1;
    #45 En = 0;  // latch the outuput
    #75 En = 1;
    
  join 
endmodule


