module dff (input d,  
               input clk,  
               input rstn,  
               output reg q,  
               output qn);  
   always @ (posedge clk or negedge rstn)  
      if (!rstn)  
         q <= 0;  
      else  
         q <= d;  
  
   assign qn = ~q;  
endmodule  
  
module ripple ( input clk,  
                input rstn,  
                output [3:0] out);  
   wire  q0;  
   wire  qn0;  
   wire  q1;  
   wire  qn1;  
   wire  q2;  
   wire  qn2;  
   wire  q3;  
   wire  qn3;  
   wire reset;
   always @ *
	if(out==4'b1110)
		assign out=4'b0000;
   dff   dff0 ( .d (qn0),  
                .clk (clk),  
                .rstn (rstn),  
                .q (q0),  
                .qn (qn0));  
  
   dff   dff1 ( .d (qn1),  
                .clk (q0),  
                .rstn (rstn),  
                .q (q1),  
                .qn (qn1));  
   dff   dff2 ( .d (qn2),  
                .clk (q1),  
                .rstn (rstn),  
                .q (q2),  
                .qn (qn2));  
   dff   dff3 ( .d (qn3),  
                .clk (q2),  
                .rstn (rstn),  
                .q (q3),  
                .qn (qn3));  
   assign out = {qn3, qn2, qn1, qn0};  
endmodule  




module ripple_tb;  
   reg clk;  
   reg rstn;  
   wire [3:0] out;  
  
   ripple r0   (  .clk (clk),  
                  .rstn (rstn),  
                  .out (out));  
  
   always #5 clk = ~clk;  
  
   initial begin  
      rstn <= 0;  
      clk <= 0;  
  
      repeat (4) @ (posedge clk);  
      rstn <= 1;  
  
      repeat (25) @ (posedge clk);  
      $finish;  
   end  
endmodule
