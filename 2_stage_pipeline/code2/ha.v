module ha(output c,s,input a,b);

assign s=a^b;
assign c=a&b;

endmodule 