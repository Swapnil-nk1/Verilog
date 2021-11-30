module udp_dff_tb();
reg clk, rst, d;
wire q;

udp_dff design (q, clk,rst,d);

initial {clk, rst, d}=0;
always #1 clk = ~clk;
initial 
begin 
	#10 rst = 1;
	#8 d=1;
	#10 d=0;
	#10 $finish;
end
endmodule
