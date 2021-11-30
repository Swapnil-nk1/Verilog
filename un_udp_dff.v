primitive udp_dff(q,clk,rst,d);
input clk, rst, d;
output reg q;
//active low reset
table
//clk rst d : q q_new
? 0 ? : ? : 0;
? (01) ? : ? : -;
(01) 1 0 : ? : 0;
(01) 1 1 : ? : 1;
(10) 1 ? : ? : -;

(01) 1 1 : ? : 1;
(10) 1 ? : ? : -;
? 1 (10) : ? : 0;
? 1 (01) : ? : 1;


endtable
endprimitive

