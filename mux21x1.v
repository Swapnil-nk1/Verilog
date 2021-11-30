module mux32x1(I,S,O);

input [31:0]I;
input [4:0]S;
//input s2;
output reg O;
wire Y0,Y1;

mux16x1 m0 (I[31:16],S[4:1],Y0);
mux16x1 m1 (I[15:0],S[4:1],Y1);

mux21 MF(Y0,Y1,S[0],O)
;
endmodule

