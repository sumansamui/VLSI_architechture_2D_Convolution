module cslawoc(output [15:0]out, input [15:0]a,b);

wire [2:0]c;
wire [1:0]co0,co1;
wire [11:0]sum0,sum1;

cla cla1(out[3:0],c[0],a[3:0],b[3:0]);
cla cla2(sum0[3:0],co0[0],a[7:4],b[7:4]);
cla cla3(sum0[7:4],co0[1],a[11:8],b[11:8]);
clawoc cla4(sum0[11:8],a[15:12],b[15:12]);
//cla cla5(sum0[15:12],co0[3],a[19:16],b[19:16],g);

bec bec1(sum1[3:0],co1[0],sum0[3:0],co0[0]);
bec bec2(sum1[7:4],co1[1],sum0[7:4],co0[1]);
becwoc bec3(sum1[11:8],sum0[11:8]);
//bec bec4(sum1[15:12],co1[3],sum0[15:12],co0[3]);

mux mux1({c[1],out[7:4]},{co1[0],sum1[3:0]},{co0[0],sum0[3:0]},c[0]);
mux mux2({c[2],out[11:8]},{co1[1],sum1[7:4]},{co0[1],sum0[7:4]},c[1]);
assign out[15:12]=c[2]?sum1[11:8]:sum0[11:8];
//mux mux4({cout,out[19:16]},{co1[3],sum1[15:12]},{co0[3],sum0[15:12]},c[3]);

endmodule