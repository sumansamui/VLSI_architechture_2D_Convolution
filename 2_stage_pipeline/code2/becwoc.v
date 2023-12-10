module becwoc (output [3:0]sum, input [3:0]s);

wire x,y,z;

assign x=s[0]&s[1];
assign y=s[2]&x;
assign sum[0]=~s[0];
assign sum[1]=s[1]^s[0];
assign sum[2]=s[2]^x;
assign sum[3]=s[3]^y;

endmodule