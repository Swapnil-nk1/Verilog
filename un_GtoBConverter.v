module GtoB (g,b);
input [3:0] g;
output [3:0] b;

assign b[3] = g[3];
assign b[2] = g[2] ^ b[3];
assign b[1] = g[1] ^ b[2];
assign b[0] = g[0] ^ b[1];

endmodule





module GotB_tb();
reg [3:0] g;
wire [3:0] b;

GtoB design (g,b);

initial g=0;
always #1 g=g+1;
initial #16 $finish;

endmodule

