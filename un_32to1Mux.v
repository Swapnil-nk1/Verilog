module Mux32to1 (i, sel, out);
input [31:0] i;
input [4:0] sel;
output out;

assign out = i[sel];
endmodule



module Mux32to1_tb ();
reg [31:0] in;
reg [4:0] sel;
wire out;
integer i;

Mux32to1 M1 (in, sel, out);

initial
begin
	in=32'd1024;
	for(i=0;i<32;i=i+1)
		#1 sel=i;
	#5 $finish;
end

endmodule
 

