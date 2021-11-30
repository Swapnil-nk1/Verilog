module Mod8Counter (clk, rst, out);
input clk, rst; // rst is an active high signal
output reg [2:0] out;

always @ (negedge clk)
begin
	if(rst)
		out <= 0;
	else
	begin
		if(out==7)
			out <= 0;
		else
			out <= out + 1;
	end
end

endmodule






module Mod8Counter_tb ();
reg clk, rst; // rst is an active high signal
wire [2:0]out;

Mod8Counter design (clk, rst, out);

initial {rst,clk} = 2'b11;
always #1 clk = ~clk;
initial
begin
	#6 rst = 0;
	#20 rst = 1;
	#10 rst = 0;
	#20 $finish;
end

endmodule
