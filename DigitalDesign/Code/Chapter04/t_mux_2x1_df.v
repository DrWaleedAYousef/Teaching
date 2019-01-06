// Test bench with stimulus for mux_2x1_df
module t_mux_2x1_df;
  wire	t_m_out;	 
  reg 	t_A, t_B;
  reg	t_select;
  parameter stop_time = 50;

  mux_2x1_df M1 (t_m_out, t_A, t_B, t_select);	// Instantiation of circuit to be tested

  initial # stop_time $finish;
  initial begin					// Stimulus generator
    	t_select = 1; t_A = 0; t_B = 1;
    #10	t_A = 1; t_B = 0;
    #10	t_select = 0;
    #10	t_A = 0; t_B = 1;
  end
  initial begin
    $display ("                  time   Select  A     B    m_out");
    $monitor ($time,, "    %b       %b     %b     %b", t_select, t_A, t_B, t_m_out);
  end
    //$monitor ("time=", $time,, "select = %b A = %b B = %b m_out = %b", t_select, t_A, t_B, t_m_out);
endmodule

// Dataflow description of 2-to-1 line multiplexer
// from Example 4-6
module mux_2x1_df ( 
  output	m_out,
  input 		A, B,
  input		select
 );  
  assign m_out = (select)? A : B;
 endmodule





  

