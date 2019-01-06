module decoder (IN, Y);
  input  	[1:0] IN;		// Two binary inputs
  output 	[3:0] Y;		// Four binary outputs
  reg [3:0] Y;
  integer k;		// Control (index) variable for loop
  always @ (IN)
    for (k = 0; k <= 3; k = k + 1)
    if (IN == k) Y[k] = 1;
    else Y[k] = 0;
endmodule

