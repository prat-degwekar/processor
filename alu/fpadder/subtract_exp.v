module subtractexp(exp,pos,expout);
input [8:0] exp,pos;
output [8:0] expout;
wire [8:0] diff,diff1;
wire cout;
assign diff=23-pos;
assign diff1=~diff+1;
cla9 adder9(cout,expout,exp,diff1,0);
endmodule
