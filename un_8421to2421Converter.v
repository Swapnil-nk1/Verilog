module conv_8421to2421 (i,o);
input [3:0] i;
output [3:0] o;

assign o[3] = i[3];
assign o[2] = i[3] | i[2];
assign o[1] = i[3] | i[1];
assign o[0] = i[0];

endmodule





module conv_8421to2421_tb();
reg [3:0] i;
wire [3:0] o;
integer tmp;

conv_8421to2421 design (i,o);

initial i=0;
always for(tmp=0;tmp<10;tmp=tmp+1) #1 i=tmp;
initial #16 $finish;

endmodule

