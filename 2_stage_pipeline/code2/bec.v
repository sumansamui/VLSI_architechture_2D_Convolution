module bec (output [3:0]sum,output cout, input [3:0]s,input c);

wire x,y,z;

assign x=s[0]&s[1];
assign y=s[2]&x;
assign z=s[3]&y;
assign sum[0]=~s[0];
assign sum[1]=s[1]^s[0];
assign sum[2]=s[2]^x;
assign sum[3]=s[3]^y;
assign cout=c^z;

endmodule