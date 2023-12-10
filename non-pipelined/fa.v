module fa(output c,s,input a,b,ci);

wire w1;

xor(w1,a,b);
xor(s,ci,w1);
or(c,a&b,b&ci,ci&a);

endmodule 