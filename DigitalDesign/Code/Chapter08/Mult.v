module Mult (Product, Multiplicand, Multiplier);
input [7:0] Multiplicand, Multiplier;
output reg [15:0] Product;
 always @ (Multiplicand, Multiplier)
Product = Multiplicand * Multiplier;
endmodule

