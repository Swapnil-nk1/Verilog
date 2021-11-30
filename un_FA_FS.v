module FA (a, b, cin, sum, cy);

input a, b, cin;
output sum, cy;

assign sum=a^b^cin;
assign cy=(a*b)|(b*cin)|(cin*a);
endmodule
///-------End of Full Adder design-------///


module FS (a, b, cin, diff, bow);

input a, b, cin;
output diff, bow;

assign diff=a^b^cin;
assign bow=(~(a^b)*cin)|(~a*b);
endmodule
///-------End of Full subtractor design-------///

module FA_FS_tb ();
reg a, b, cin;
wire sum, cy, diff, bow;

FA FA1 (a, b, cin, sum, cy);
FS FS1 (a, b, cin, diff, bow);

initial {cin,a,b}=0;
always #1 {cin,a,b}={cin,a,b}+1;
initial #16 $finish;

endmodule
///-------End of Test bench design-------///
