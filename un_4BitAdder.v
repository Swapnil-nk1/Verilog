module Adder4Bit (a, b, sum, cy);
input [3:0] a;
input [3:0] b;
output [3:0] sum;
output cy;
integer tmp;
always @(a or b) tmp = a+b;
assign sum=tmp; 

endmodule





module Adder4Bit_tb ();
reg [3:0] a, b;
wire [3:0] sum;
wire cy;

initial {a,b}=0;
always #1 {a,b} = {a,b} + 1;
initial #256 $finish;

endmodule
