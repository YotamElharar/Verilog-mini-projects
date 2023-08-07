module tb_D_FF;
reg clk,rst;
wire y;
freq_div3 tb_freq_div3(y,clk,rst);
always #5 clk=~clk;
initial 
begin
clk=0;
rst=1;
#10 rst=0;
#100 $stop;
end
endmodule

module D_FF(q,qn,clk,rst,d); //Positive edge
input clk,rst,d;
output reg q;
output qn;
always @(posedge clk)
begin
if (rst)
    q<=0;
else 
    q<=d;
end
assign qn=~q;
endmodule

module D_FF_FALL(q,clk,rst,d); //Negative edge, qn not necassary
input clk,rst,d;
output reg q;
always @(negedge clk)
begin
if (rst)
    q<=0;
else 
    q<=d;
end
endmodule



module freq_div3(y,clk,rst); 
input clk,rst;
output y;
wire n1,n2,n3,n4,n5,n6;
and and1(n5,n2,n4);
D_FF D_FF1(n1,n2,clk,rst,n5);
D_FF D_FF2(n3,n4,clk,rst,n1);
D_FF_FALL D_FF3(n6,clk,rst,n3);
or or1(y,n3,n6);
endmodule
