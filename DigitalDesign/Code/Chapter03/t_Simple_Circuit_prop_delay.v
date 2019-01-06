// Testbench for Simple_Circuit_prop_delay
`timescale 1 ns / 100 ps
module t_Simple_Circuit_prop_delay;
  wire	D, E;
  reg	A, B, C;

  Simple_Circuit_prop_delay M1 (A, B, C, D, E);  // Instance name required

  initial
    begin
      A = 1'bx; B = 1'bx; C = 1'bx;
      A = 1'b0; B = 1'b0; C = 1'b0;
      #100 A = 1'b1; B = 1'b1; C = 1'b1;
      #100 $finish;
   end

  initial $monitor($time,,"A = 5b  B= %b  C = %b  w1 = %b D = %b  E = %b", A, B, C, D, M1.w1, E);
     
endmodule
