// Verilog model: Circuit instantiation of Circuit_UDP_02467
module Circuit_with_UDP_02467 (e, f, a, b, c, d);
  output 	e, f;
  input		a, b, c, d;

 UDP_02467 	M0 (e, a, b, c);
  and		      (f, e, d);		//Option gate instance name omitted
endmodule
