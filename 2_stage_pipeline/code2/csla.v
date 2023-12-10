module csla(output [19:0]out, input [15:0]a,input [19:0]b);

wire [3:0]c,co0,co1;
wire [11:0]sum0;
wire [15:0]sum1;

cla cla1(out[3:0],c[0],a[3:0],b[3:0]);
cla cla2(sum0[3:0],co0[0],a[7:4],b[7:4]);
cla cla3(sum0[7:4],co0[1],a[11:8],b[11:8]);
cla cla4(sum0[11:8],co0[2],a[15:12],b[15:12]);
//cla cla5(sum0[15:12],co0[3],a[19:16],b[19:16],g);

bec bec1(sum1[3:0],co1[0],sum0[3:0],co0[0]);
bec bec2(sum1[7:4],co1[1],sum0[7:4],co0[1]);
bec bec3(sum1[11:8],co1[2],sum0[11:8],co0[2]);
becwoc bec4(sum1[15:12],b[19:16]);

mux mux1({c[1],out[7:4]},{co1[0],sum1[3:0]},{co0[0],sum0[3:0]},c[0]);
mux mux2({c[2],out[11:8]},{co1[1],sum1[7:4]},{co0[1],sum0[7:4]},c[1]);
mux mux3({c[3],out[15:12]},{co1[2],sum1[11:8]},{co0[2],sum0[11:8]},c[2]);
assign out[19:16]=c[3]?sum1[15:12]:b[19:16];
//mux mux4({cout,out[19:16]},{co1[3],sum1[15:12]},{co0[3],sum0[15:12]},c[3]);

endmodule