module npcnn #(parameter a_size=6, f_size=3, stride=1, zeropadding=0) (output [19:0]out,output done, input [7:0]a,input [8:0]f, input go,clk,reset);

wire clr,rclr,cclr,sftrclr,sftcclr,l,fl,sftrc,sftcc,cc,rc,arc,acc,orc,occ,mull,addl,resultl,outl,rl,cl,sftrl,sftcl;

npcnndatapath #(a_size,f_size,stride,zeropadding) sevdp1(out,sftrc,sftcc,cc,rc,arc,acc,orc,occ,a,f,clk,reset,clr,rclr,cclr,sftrclr,sftcclr,mull,addl,resultl,outl,rl,cl,sftrl,sftcl,l,fl);

npcnncontroller sevctr1(done,clr,rclr,cclr,sftrclr,sftcclr,mull,addl,resultl,outl,rl,cl,sftrl,sftcl,l,fl,go,cc,rc,sftrc,sftcc,arc,acc,orc,occ,clk,reset);

endmodule