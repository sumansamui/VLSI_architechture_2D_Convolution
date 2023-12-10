module pcnndatapath #(parameter as=6, fs=3, str=1, zp=0) (output reg [19:0]out,output reg sftrc,sftcc,cc,rc,arc,acc,orc,occ,
			input [7:0]a,input [8:0]f,input clk,rst,clr,rclr,cclr,sftrclr,sftcclr,mull,addl,resultl,outl,rl,cl,sftrl,sftcl,l,fl);

//parameter str=1, as=6, fs=3, zp=0;
parameter os=((as+2*zp-fs)/str)+1;
reg [7:0]areg[0:2*zp+as-1][0:2*zp+as-1];
reg [19:0]add;
reg [15:0]mul;
wire [19:0]m,s;
wire [15:0]mout;
wire x=0;
wire z,y;
reg [19:0]result[0:os-1][0:os-1];
reg [8:0]freg[0:fs-1][0:fs-1];
reg [2:0] c,r;
reg [2:0]sftr,sftc;
integer i,j;


smul smul1(m,areg[r+sftr][c+sftc],freg[r][c]);

csla clsa2(s,mul,add);

always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || clr==1'b1)	mul<=20'b0;
	else if (mull) mul<=m;
	end

always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || clr==1'b1)	add<=20'b0;
	else if (addl) add<=s;
	end


always @(posedge clk or posedge rst)
	begin
	if (rst) for (i=0;i<5;i=i+1) for (j=0;j<5;j=j+1) areg[i][j]<=8'b0;
	else if (l) areg[zp+r][zp+c]<=a;
	end
always @(posedge clk or posedge rst)
	begin
	if (rst) for (i=0;i<5;i=i+1) for (j=0;j<5;j=j+1) freg[i][j]<=8'b0;
	else if (fl) freg[r][c]<=f;
	end
always @(posedge clk or posedge rst)
	begin
    if (rst==1'b1)	for (i=0;i<5;i=i+1) for (j=0;j<5;j=j+1) result[i][j]<=20'b0;
	else if (resultl) result[sftr][sftc]<=add;
	end
always @(posedge clk or posedge rst)
    begin
    if (rst==1'b1) out<=20'b0;
    else if (outl) out<=result[r][c];
    end
always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || rclr==1'b1) r<=3'b000;
	else if (rl) r<=r+1;
	end
always @(r)
	begin
	if (r==fs-1) rc=1'b1;
    else if (r==os-1) orc=1'b1;
	else if (r==as-1) arc=1'b1;
	else begin rc=1'b0;arc=1'b0;orc=1'b0; end
	end
always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || cclr==1'b1) c<=3'b000;
	else if (cl) c<=c+1;
	end
always @(c)
	begin
	if (c==fs-2) cc=1'b1;
    else if (c==os-2) occ=1'b1;
	else if (c==as-2) acc=1'b1;
	else begin cc=1'b0;acc=1'b0;occ=1'b0; end
	end
always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || sftrclr==1'b1) sftr<=0;
	else if (sftrl) sftr<=sftr+str;
	end
always @(sftr)
	begin
	if (sftr==os-1) sftrc<=1'b1;
	else sftrc<=1'b0;
	end
always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1 || sftcclr==1'b1) sftc<=0;
	else if (sftcl) sftc<=sftc+str;
	end
always @(sftc)
	begin
	if (sftc==os-1) sftcc<=1'b1;
	else sftcc<=1'b0;
	end
endmodule