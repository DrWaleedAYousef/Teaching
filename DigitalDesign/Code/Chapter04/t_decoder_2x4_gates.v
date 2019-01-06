
module t_decoder_2x4_gates;
  wire	[0: 3]	D;
  reg		A, B;
  reg		enable;

 decoder_2x4_gates M1 (D, A, B, enable);

initial #100 $finish;
initial fork
  enable = 0;
  A = 0; B = 0;
 #40 enable = 1;
  begin
  #10 B = 1;
  #10 B = 0;
  #10 B = 1;
  #10 B = 0;
  #10 B = 1;
  #10 B = 0;
  #10 B = 1;
  #10 B = 0;
  end

  begin
  #20 A = 1;
  #20 A = 0;
  #20 A = 1;
  #20 A = 0;
  end
join
endmodule
