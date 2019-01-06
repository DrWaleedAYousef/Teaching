// Gate-level description of circuit in Fig. 4-2
module Circuit_of_Fig_4_2 (
  output	F1, F2,
  input		A, B, C);
  wire	T1, T2, T3, F2_not, E1, E2, E3;	 
  or	G1	(T1, A, B, C);
  and	G2	(T2, A, B, C);
  and	G3	(E1, A, B);
  and	G4	(E2, A, C);
  and	G5	(E3, B, C);
  or	G6	(F2, E1, E2, E3);
  not	G7	(F2_not, F2);
  and	G8	(T3, T1, F2_not);
  or	G9	(F1, T2, T3);
endmodule

module t_Circuit_of_Fig_4_2;
  reg 	[2: 0] D;
  wire	F1, F2;
  parameter stop_time = 100;
  
  Circuit_of_Fig_4_2 M1 (F1, F2, D[2], D[1], D[0]);

  initial # stop_time $finish;
  initial begin					// Stimulus generator
    	D = 3'b000;
    repeat (7)
      #10 D = D + 1'b1;
  end

  initial begin
    $display ("A      B     C     F1   F2");
    $monitor ("%b      %b     %b     %b    %b", D[2], D[1], D[0], F1, F2);
  end
endmodule

/*
A      B     C     F1   F2
0      0      0      0     0 
0      0      1      1     0
0      1      0      1     0
0      1      1      0     1
1      0      0      1     0
1      0      1      0     1
1      1      0      0     1
1      1      1      1     1

*/



  

