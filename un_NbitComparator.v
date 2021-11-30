module NbitComp (i1, i2, g, e, l);
parameter N=3;
input [N-1:0] i1, i2;
output l, e, g;

assign g = (i1>i2)?1'b1:1'b0;
assign e = (i1==i2)?1'b1:1'b0;
assign l = (i1<i2)?1'b1:1'b0;

endmodule




module NbitComp_tb ();
parameter N=3;
reg [N-1:0] i1, i2;
wire l, e, g;

NbitComp design (i1, i2, g, e, l);

initial {i1,i2}=0;
always #1 {i1,i2} = {i1,i2} + 1;
initial #128 $finish;

endmodule 
