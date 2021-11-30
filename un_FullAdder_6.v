module Full_Adder_6 (a, b, sum, cy);

input [5:0] a;
input [5:0] b;
wire [6:0] carry;

genvar i;

output [5:0] sum;
output cy;

assign carry[0] = 0;

for(i=0;i<6;i=i+1)
begin
	assign sum[i]=a[i]^b[i]^carry[i];
	assign carry[i+1] = a[i]&b[i] | b[i]&carry[i] | carry[i]&a[i];
end

assign cy = carry[5];

endmodule






module Full_Adder_6_tb ();

reg [5:0] a, b;

wire [5:0] sum;
wire cy;

Full_Adder_6 design (a, b, sum, cy);

initial
begin
	a = 6'b0;
	b = 6'b0;
end

always #5 {a,b} = {a,b} + 12'd1;

initial #(5*(2**12)) $finish;

endmodule
