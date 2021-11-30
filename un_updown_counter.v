module updown_counter(updown, clk, rst, out);

input updown, clk, rst; //Up counter for updown=1 and Down counter for updown=0, rst is active low
output reg [2:0] out;

always @(posedge clk) 
begin
	out <= (!rst) ? 0 : ((updown==0) ? out - 1 : out + 1);
end

endmodule









module updown_counter_tb ();

reg updown, clk, rst; //Up counter for updown=1 and Down counter for updown=0, rst is active low
wire [2:0] out;

updown_counter C1 (updown, clk, rst, out);

initial
begin
	rst = 0;
	clk = 0;
	updown = 1;
end

always #1 clk = ~clk;
always #2 if(out==0) 
begin
updown=~updown;
#4;
end

initial
begin
	#4 rst = 1;
	#100 $finish;
end

endmodule
