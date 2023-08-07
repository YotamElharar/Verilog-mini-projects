module binary_comparator_1bit(b_bigger,a_bigger,eq,a,b);
input a,b;
output b_bigger,a_bigger,eq;
and and1(b_bigger,~a,b);
and and2(a_bigger,a,~b);
nor nor1(eq,b_bigger,a_bigger);
endmodule

module or5(y,a,b,c,d,e);
input a,b,c,d,e;
output y;
assign y=a|b|c|d|e;
endmodule

module and4(y,a,b,c,d);
input a,b,c,d;
output y;
assign y=a&b&c&d;
endmodule

module binary_comparator_4bit(b_bigger,a_bigger,eq,a,b,b_bigger1,a_bigger1,eq1);
input b_bigger1,a_bigger1,eq1;
input [3:0]a,b;
output b_bigger,a_bigger,eq;
wire n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,n16,n17,n18,n19,n20,n21;
binary_comparator_1bit u1(n1,n3,n2,a[3],b[3]);
binary_comparator_1bit u2(n4,n6,n5,a[2],b[2]);
binary_comparator_1bit u3(n7,n9,n8,a[1],b[1]);
binary_comparator_1bit u4(n10,n12,n11,a[0],b[0]);
and and1(n13,n2,n4);
and and2(n14,n2,n6);
and4 and3(n15,n5,n2,n7,1'b1);
and4 and4(n16,n9,n2,n5,1'b1);
and4 and5(n17,n8,n5,n2,n10);
and4 and6(n18,n12,n2,n5,n8);
and4 and7(n19,n2,n5,n8,n11);
and and8(n20,b_bigger1,n19);
and and9(eq,eq1,n19);
and and10(n21,a_bigger1,n19);
or5 or1(b_bigger,n17,n13,n15,n1,n20);
or5 or2(a_bigger,n21,n3,n14,n16,n18);
endmodule

module binary_comparator_8bit(b_bigger,a_bigger,eq,a,b,b_bigger1,a_bigger1,eq1);
input b_bigger1,a_bigger1,eq1;
input [7:0]a,b;
output b_bigger,a_bigger,eq;
wire n1,n2,n3;
binary_comparator_4bit u1(n1,n3,n2,a[3:0],b[3:0],b_bigger1,a_bigger1,eq1);
binary_comparator_4bit u2(b_bigger,a_bigger,eq,a[7:4],b[7:4],n1,n3,n2);
endmodule

module tb_binary_comparator_8bit;
reg b_bigger1,a_bigger1,eq1;
reg [7:0]a,b;
wire b_bigger,a_bigger,eq;
binary_comparator_8bit binary_comparator_8bit_tb(b_bigger,a_bigger,eq,a,b,b_bigger1,a_bigger1,eq1);
initial begin
$monitor("time=%d \t a=%b \t b=%b \t b_bigger1=%b \t a_bigger1=%b \t eq1=%b
b_bigger=%b \t a_bigger=%b \t eq=%b",$time,a,b,b_bigger1,a_bigger1,eq1,b_bigger,a_bigger,eq);
b_bigger1=1'b0;
a_bigger1=1'b0;
eq1=1'b1;
a=8'b01010101;
b=8'b00111111;
#10 a=8'b00111111;
#10 b=8'b01010101;
#10 $stop;
end
endmodule

