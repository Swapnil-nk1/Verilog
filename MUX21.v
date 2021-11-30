module mux21(q,w,,e,r);

input q,w,e;
output r;

assign r=(q&~e)|(w&e);

endmodule
