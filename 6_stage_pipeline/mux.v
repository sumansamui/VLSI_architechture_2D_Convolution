module mux (output [4:0]sum, input [4:0]a,b,input s);

assign sum=s?a:b;

endmodule