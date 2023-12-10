module pcnncontroller (output reg done,clr,rclr,cclr,sftrclr,sftcclr,mull,addl,resultl,outl,rl,cl,sftrl,sftcl,l,fl,
						input go,cc,rc,sftrc,sftcc,arc,acc,orc,occ,clk,rst);

reg [4:0]ps,ns;

parameter s0=5'b00000,s1=5'b00001,s2=5'b00010,s3=5'b00011,s4=5'b00100,s5=5'b00101,s6=5'b00110,s7=5'b00111,s8=5'b01000,s9=5'b01001,
			s10=5'b01010,s11=5'b01011,s12=5'b01100,s13=5'b01101,s14=5'b01110,s15=5'b01111,s16=5'b10000,s17=5'b10001,s18=5'b10010,
			s19=5'b10011,s20=5'b10100,s21=5'b10101,s22=5'b10110,s23=5'b10111,s24=5'b11000;

always @(posedge clk or posedge rst)
	begin
	if (rst==1'b1) ps<=s0;
	else
	ps<=ns;
	end
	
	always @(occ or orc or sftrc or sftcc or acc or arc or cc or rc or go or ps)
	begin
	case (ps)
		s0 :if (go) ns=s1; else ns=s0;
		s1 :if (arc&&acc) ns=s3; else if (acc) ns=s2; else ns=s1;
		s2 :ns=s1;
		s3 :ns=s4;
		s4 :if (rc&&cc) ns=s6; else if (cc) ns=s5; else ns=s4;
		s5 :ns=s4;
		s6 :ns=s7;
		s7 :if (cc) ns=s8; else ns=s7;
		s8 :if (rc) ns=s9; else ns=s7;
		s9 :if ((sftrc==1'b1)&&(sftcc==1'b1)) ns=s12; else if (sftcc) ns=s11; else ns=s10;
		s10:ns=s7;
		s11:ns=s7;
		s12:ns=s13;
		s13:if (occ) ns=s14; else ns=s13;
        s14:if (orc) ns=s15; else ns=s13;
        s15:ns=s16;
        s16:ns=s16;
		default : ns=s0;
	endcase
	end
always @(ps)
	begin
	case (ps)
		s0: begin done=1'b0;clr=1'b0;rclr=1'b0;cclr=1'b0;sftrclr=1'b0;sftcclr=1'b0;mull=1'b0;addl=1'b0;resultl=1'b0;
					rl=1'b0;cl=1'b0;sftrl=1'b0;sftcl=1'b0;l=1'b0;fl=1'b0; end
		s1: begin l=1'b1;cl=1'b1;rl=1'b0;cclr=1'b0; end
		s2: begin rl=1'b1;cclr=1'b1;cl=1'b0; end
		s3: begin rclr=1'b1;l=1'b1;cclr=1'b1;cl=1'b0; end
		s4: begin fl=1'b1;cl=1'b1;rl=1'b0;cclr=1'b0;rclr=1'b0;l=1'b0; end
		s5: begin rl=1'b1;cclr=1'b1;cl=1'b0;fl=1'b1; end
		s6:begin rclr=1'b1;rl=1'b0;fl=1'b1;cl=1'b0;cclr=1'b1; end
		s7:begin fl=1'b0;rclr=1'b0;cclr=1'b0;clr=1'b0;sftcl=1'b0;sftrl=1'b0;sftcclr=1'b0;mull=1'b1;addl=1'b1;cl=1'b1;rl=1'b0;resultl=1'b0; end
		s8:begin rl=1'b1;cclr=1'b1;cl=1'b0; end
		s9:begin rl=1'b0;rclr=1'b1;addl=1'b1;mull=1'b0; end
		s10:begin cclr=1'b0;rclr=1'b0;resultl=1'b1;addl=1'b0;clr=1'b1;sftcl=1'b1; end
		s11:begin cclr=1'b0;rclr=1'b0;resultl=1'b1;addl=1'b0;clr=1'b1;sftrl=1'b1;sftcclr=1'b1; end
		s12:begin sftrclr=1'b1;sftcclr=1'b1;resultl=1'b1;clr=1'b1;cclr=1'b0;rclr=1'b0;addl=1'b0; end
        s13:begin sftrclr=1'b0;sftcclr=1'b0;resultl=1'b0;outl=1'b1;cl=1'b1;rl=1'b0;cclr=1'b0;clr=1'b0; end
        s14:begin rl=1'b1;cclr=1'b1;cl=1'b0;outl=1'b1; end
        s15:begin rclr=1'b1;rl=1'b0;done=1'b1;outl=1'b0;clr=1'b1; end
        s16:begin rclr=1'b0;cclr=1'b0;done=1'b0;clr=1'b0; end
        default: begin done=1'b0;clr=1'b0;rclr=1'b0;cclr=1'b0;sftrclr=1'b0;sftcclr=1'b0;mull=1'b0;addl=1'b0;resultl=1'b0;
					rl=1'b0;cl=1'b0;sftrl=1'b0;sftcl=1'b0;l=1'b0;fl=1'b0; end
	endcase
	end

endmodule