module testmux;

reg [31:0]I;
reg  [4:0]S;
//input s2;
wire O;


mux32x1(.I(I),.S(S),.O(O));

initial begin
I=32'b1111000011110000;
S=5'b11111;
$display("%b",O);
#100;
I=32'b1111000011110000;
S=5'b00000;

$display("%b",O);
end
endmodule

