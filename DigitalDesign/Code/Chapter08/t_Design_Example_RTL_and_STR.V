// test bench

module t_Example_Fig_8_9_STR; 

  wire	[3:0] 	A_RTL, A_STR;
  wire		E_RTL, E_STR, F_RTL, F_STR;
  
  reg		Start, clock, reset_b;
  
  Example_Fig_8_9_STR M0 (A_RTL, E_RTL, F_RTL, Start, clock, reset_b);
  Example_Fig_8_9_STR M1 (A_STR, E_STR, F_STR, Start, clock, reset_b);

  initial #1000 $finish;
  initial begin clock = 0; #5 repeat (32) #5 clock = ~clock; end
  //initial $monitor ($time,,"A = %b E = %b F = %b", A, E, F);

  initial fork
    reset_b = 1; Start = 0;
    #1 reset_b = 0;
    #2 reset_b = 1;
    #5 Start = 1;
    #15 Start = 0;
    #205 Start = 1;
    #215 Start = 0;
  join
endmodule

