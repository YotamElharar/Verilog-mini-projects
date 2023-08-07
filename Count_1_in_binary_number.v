module ha(s,c,a,b);
input a,b;
output s,c;
assign s=a^b;
assign c=a&b;
endmodule 

module fa(s,c,a,b,ci);
input a,b,ci;
output s,c;
wire n1,n2,n3;
ha ha1(n1,n2,a,b);
ha ha2(s,n3,n1,ci);
or or1(c,n3,n2);
endmodule

module counter1_8bit(y,x);
input [7:0]x;
output [3:0]y;
wire n1,n2,n3,n4,n5,n6,n7,n8,n9,n10;
fa fa1(n1,n2,x[0],x[1],x[2]);
fa fa2(n3,n4,x[3],x[4],x[5]);
ha ha1(n5,n6,x[6],x[7]);
fa fa3(y[0],n7,n1,n3,n5);
fa fa4(n8,n9,n2,n4,n6);
ha ha2(y[1],n10,n7,n8);
ha ha3(y[2],y[3],n10,n9);
endmodule

module tb_counter1_8bit;
reg [7:0]x;
wire [3:0]y;
counter1_8bit counter1_8bit_tb(y,x);
integer i;
initial 
begin
for(i=0;i<8;i=i+1)
begin
x[i]=0;
end
for(i=0;i<8;i=i+1)
begin
#10 x[i]=1;
end
$monitor ("time=%d /t x=%b /t y=%b", $time,x,y);
#10 $stop;
end
endmodule