module FullAdder (a,b,cin,sum,cout);
input a, b, cin;
output sum, cout;
assign sum = a ^ b ^ cin;
assign cout = a&b |b&cin | cin&a;
endmodule


module Mux_2to1 (i0, i1, sel, out);
input i0, i1, sel;
output out;
assign out = ~sel&i0 | sel&i1;
endmodule


module CaarrySelectAdder (a, b, cin, sum, cout);
input [3:0] a, b;
input cin;
output [3:0] sum;
output cout;
wire [3:0] tmp0, tmp1, carry0, carry1;

// ckt for carry 0
FullAdder FA00 (a[0], b[0], 1'b0, tmp0[0], carry0[0]);
FullAdder FA01 (a[1], b[1], carry0[0], tmp0[1], carry0[1]);
FullAdder FA02 (a[2], b[2], carry0[1], tmp0[2], carry0[2]);
FullAdder FA03 (a[3], b[3], carry0[2], tmp0[3], carry0[3]);

//ckt for carry 1
FullAdder FA10 (a[0], b[0], 1'b1, tmp1[0], carry1[0]);
FullAdder FA11 (a[1], b[1], carry1[0], tmp1[1], carry1[1]);
FullAdder FA12 (a[2], b[2], carry1[1], tmp1[2], carry1[2]);
FullAdder FA13 (a[3], b[3], carry1[2], tmp1[3], carry1[3]);

//Selecting Carry
Mux_2to1 MC(carry0[3], carry1[3], cin, cout);

//selecting Sum
Mux_2to1 MS0 (tmp0[0], tmp1[0], cin, sum[0]);
Mux_2to1 MS1 (tmp0[1], tmp1[1], cin, sum[1]);
Mux_2to1 MS2 (tmp0[2], tmp1[2], cin, sum[2]);
Mux_2to1 MS3 (tmp0[3], tmp1[3], cin, sum[3]);

endmodule





module CaarrySelectAdder_tb ();
reg [3:0] a, b;
reg cin;
wire [3:0] sum;
wire cout;
CaarrySelectAdder dedign (a, b, cin, sum, cout);
initial {cin,a,b} = 0;
always #1 {cin,a,b} = {cin,a,b} + 1;
initial #1024 $finish;
endmodule




