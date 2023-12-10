module sdmul(output [15:0]out,input [7:0]a,input [8:0]b,input ml,clk,rst,clr);

wire p[8:0][7:0];
wire [48:0] s;
wire [48:0] c;
wire x=0;
wire [9:0]t,tr;
wire [5:0]w2,w21;
wire [4:0]w3,w31,wire32,wire33;
reg [7:0]ai;
reg [8:0]bi;
reg [48:0] sr,cr;
reg [9:0]treg,reg1;
reg [5:0]reg2,reg21;
reg [4:0]reg3,reg31,reg32;

and mul06(p[0][6],a[6],b[0]);
and mul07(p[0][7],a[7],b[0]);
and mul15(p[1][5],a[5],b[1]);
and mul16(p[1][6],a[6],b[1]);
and mul17(p[1][7],a[7],b[1]);
and mul25(p[2][5],a[5],b[2]);
and mul26(p[2][6],a[6],b[2]);
and mul27(p[2][7],a[7],b[2]);
and mul34(p[3][4],a[4],b[3]);
and mul35(p[3][5],a[5],b[3]);
and mul36(p[3][6],a[6],b[3]);
and mul37(p[3][7],a[7],b[3]);
and mul43(p[4][3],a[3],b[4]);
and mul44(p[4][4],a[4],b[4]);
and mul45(p[4][5],a[5],b[4]);
and mul46(p[4][6],a[6],b[4]);
and mul53(p[5][3],a[3],b[5]);
and mul54(p[5][4],a[4],b[5]);
and mul55(p[5][5],a[5],b[5]);
and mul62(p[6][2],a[2],b[6]);
and mul63(p[6][3],a[3],b[6]);
and mul71(p[7][1],a[1],b[7]);
and mul72(p[7][2],a[2],b[7]);
nand nmul80(p[8][0],a[0],b[8]);
ha a1(c[0],s[0],p[0][6],p[1][5]);
fa a2(c[1],s[1],p[0][7],p[1][6],p[2][5]);
ha a3(c[2],s[2],p[3][4],p[4][3]);
fa a4(c[3],s[3],p[1][7],p[2][6],p[3][5]);
fa a5(c[4],s[4],p[4][4],p[5][3],p[6][2]);
ha a6(c[5],s[5],p[7][1],p[8][0]);
fa a7(c[6],s[6],p[2][7],p[3][6],p[4][5]);
fa a8(c[7],s[7],p[5][4],p[6][3],p[7][2]);
fa a9(c[8],s[8],p[3][7],p[4][6],p[5][5]);

always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || clr==1'b1)	begin ai<=8'b0; bi<=9'b0; end
	else if (ml) begin ai<=a; bi<=b; end
	end

always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || clr==1'b1)	begin sr<=49'h1e00f00a80020; cr<=49'h0100080020000; end
	else if (ml) begin sr<=s; cr<=c; end
	end

and mul04(p[0][4],ai[4],bi[0]);
and mul05(p[0][5],ai[5],bi[0]);
and mul13(p[1][3],ai[3],bi[1]);
and mul14(p[1][4],ai[4],bi[1]);
and mul23(p[2][3],ai[3],bi[2]);
and mul24(p[2][4],ai[4],bi[2]);
and mul32(p[3][2],ai[2],bi[3]);
and mul33(p[3][3],ai[3],bi[3]);
and mul41(p[4][1],ai[1],bi[4]);
and mul42(p[4][2],ai[2],bi[4]);
and mul47(p[4][7],ai[7],bi[4]);
and mul51(p[5][1],ai[1],bi[5]);
and mul52(p[5][2],ai[2],bi[5]);
and mul56(p[5][6],ai[6],bi[5]);
and mul57(p[5][7],ai[7],bi[5]);
and mul60(p[6][0],ai[0],bi[6]);
and mul61(p[6][1],ai[1],bi[6]);
and mul64(p[6][4],ai[4],bi[6]);
and mul65(p[6][5],ai[5],bi[6]);
and mul66(p[6][6],ai[6],bi[6]);
and mul70(p[7][0],ai[0],bi[7]);
and mul73(p[7][3],ai[3],bi[7]);
and mul74(p[7][4],ai[4],bi[7]);
and mul75(p[7][5],ai[5],bi[7]);
nand nmul81(p[8][1],ai[1],bi[8]);
nand nmul82(p[8][2],ai[2],bi[8]);
nand nmul83(p[8][3],ai[3],bi[8]);
ha a10(c[9],s[9],p[0][4],p[1][3]);
fa a11(c[10],s[10],p[0][5],p[1][4],p[2][3]);
ha a12(c[11],s[11],p[3][2],p[4][1]);
fa a13(c[12],s[12],sr[0],p[2][4],p[3][3]);
fa a14(c[13],s[13],p[4][2],p[5][1],p[6][0]);
fa a15(c[14],s[14],cr[0],sr[1],sr[2]);
fa a16(c[15],s[15],p[5][2],p[6][1],p[7][0]);
fa a17(c[16],s[16],cr[1],cr[2],sr[3]);
fa a18(c[17],s[17],sr[4],sr[5],1'b1);
fa a19(c[18],s[18],cr[3],cr[4],cr[5]);
fa a20(c[19],s[19],sr[6],sr[7],p[8][1]);
fa a21(c[20],s[20],cr[6],cr[7],sr[8]);
fa a22(c[21],s[21],p[6][4],p[7][3],p[8][2]);
fa a23(c[22],s[22],cr[8],p[4][7],p[5][6]);
fa a24(c[23],s[23],p[6][5],p[7][4],p[8][3]);
fa a25(c[24],s[24],p[5][7],p[6][6],p[7][5]);

and mul03(p[0][3],ai[3],bi[0]);
and mul12(p[1][2],ai[2],bi[1]);
and mul22(p[2][2],ai[2],bi[2]);
and mul31(p[3][1],ai[1],bi[3]);
and mul40(p[4][0],ai[0],bi[4]);
and mul50(p[5][0],ai[0],bi[5]);
and mul67(p[6][7],ai[7],bi[6]);
and mul76(p[7][6],ai[6],bi[7]);
nand nmul84(p[8][4],ai[4],bi[8]);
nand nmul85(p[8][5],ai[5],bi[8]);

always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || clr==1'b1)	begin reg1<=10'h003; end
	else if (ml) begin reg1<={p[0][3],p[1][2],p[2][2],p[3][1],p[4][0],p[5][0],p[6][7],p[7][6],p[8][4],p[8][5]}; end
	end

and mul02(p[0][2],ai[2],bi[0]);
and mul11(p[1][1],ai[1],bi[1]);
and mul21(p[2][1],ai[1],bi[2]);
and mul30(p[3][0],ai[0],bi[3]);
and mul77(p[7][7],ai[7],bi[7]);
nand nmul86(p[8][6],ai[6],bi[8]);

always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || clr==1'b1)	begin reg2<=6'b1; end
	else if (ml) begin reg2<={p[0][2],p[1][1],p[2][1],p[3][0],p[7][7],p[8][6]}; end
	end

and mul00(p[0][0],ai[0],bi[0]);
and mul01(p[0][1],ai[1],bi[0]);
and mul10(p[1][0],ai[0],bi[1]);
and mul20(p[2][0],ai[0],bi[2]);
nand nmul87(p[8][7],ai[7],bi[8]);

always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || clr==1'b1)	begin reg3<=5'b1; end
	else if (ml) begin reg3<={p[0][0],p[0][1],p[1][0],p[2][0],p[8][7]}; end
	end

ha a26(c[25],s[25],reg1[9],reg1[8]);
fa a27(c[26],s[26],reg1[7],reg1[6],reg1[5]);
fa a28(c[27],s[27],sr[10],sr[11],reg1[4]);
fa a29(c[28],s[28],cr[11],sr[12],sr[13]);
fa a30(c[29],s[29],cr[13],sr[14],sr[15]);
fa a31(c[30],s[30],cr[15],sr[16],sr[17]);
fa a32(c[31],s[31],cr[17],sr[18],sr[19]);
fa a33(c[32],s[32],cr[19],sr[20],sr[21]);
fa a34(c[33],s[33],cr[21],sr[22],sr[23]);
fa a35(c[34],s[34],cr[23],sr[24],reg1[1]);
fa a36(c[35],s[35],reg1[3],reg1[2],reg1[0]);

assign w2=~reg2;
assign w21=~w2;
always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || clr==1'b1)	begin reg21<=6'b1; end
	else if (ml) begin reg21<=w21; end
	end

assign w3=~reg3;
assign w31=~w3;
always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || clr==1'b1)	begin reg31<=5'b1; end
	else if (ml) begin reg31<=w31; end
	end
assign t=~{cr[24],cr[22],cr[20],cr[18],cr[16],cr[14],cr[12],cr[10],cr[9],sr[9]};
assign tr=~t;
always @(posedge clk or posedge rst)
        begin
        if (rst==1'b1 || clr==1'b1)    begin treg<=10'b0; end
        else if (ml) begin treg<=tr; end
        end

ha a37(c[36],s[36],reg21[5],reg21[4]);
fa a38(c[37],s[37],sr[25],reg21[3],reg21[2]);
fa a39(c[38],s[38],treg[0],cr[25],sr[26]);
fa a40(c[39],s[39],treg[1],cr[26],sr[27]);
fa a41(c[40],s[40],treg[2],cr[27],sr[28]);
fa a42(c[41],s[41],treg[3],cr[28],sr[29]);
fa a43(c[42],s[42],treg[4],cr[29],sr[30]);
fa a44(c[43],s[43],treg[5],cr[30],sr[31]);
fa a45(c[44],s[44],treg[6],cr[31],sr[32]);
fa a46(c[45],s[45],treg[7],cr[32],sr[33]);
fa a47(c[46],s[46],treg[8],cr[33],sr[34]);
fa a48(c[47],s[47],treg[9],cr[34],sr[35]);
fa a49(c[48],s[48],cr[35],reg21[1],reg21[0]);

assign wire32=~reg31;
assign wire33=~wire32;
always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || clr==1'b1)	begin reg32<=5'b1; end
	else if (ml) begin reg32<=wire33; end
	end

cslawoc clsa1(out,{reg32[0],sr[48:36],reg32[3],reg32[4]},{cr[48:36],reg32[1],reg32[2],x});

endmodule