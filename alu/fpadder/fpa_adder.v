`include "subtractor.v"
`include "shifter.v"
`include "add_mantisa.v"
`include "comb.v"
`include "detectzero.v"
`include "subtract_exp.v"
module fpa_adder(a,b,clk,inp_op,out);
input [31:0]a,b;
input clk,inp_op;
output [31:0]out;
wire [8:0]exptemp;	
wire [7:0]out_exp,out_exp_final;
wire out_sign;							  // to store exponent difference
wire [22:0] a_mant1, b_mant1;
wire [24:0]out_mant;
wire [22:0]out_mant_final;
reg [31:0]shift;                                  //the number of bits to shift after exp subtraction
reg [22:0]shifted;
wire cout;
wire [7:0]pos;
wire [1:0]select;
wire out_op;
reg [31:0]a1,b1;
reg [8:0]exptemp1;	
reg [1:0]select1;
reg [7:0]out_exp1;
reg inp_op1;

reg [31:0]a2,b2;
reg  [22:0] a_mant2, b_mant2;
reg inp_op2;
reg [1:0]select2;
reg [7:0]out_exp2;

reg inp_op3;
reg [31:0]a3,b3;
reg out_op3,out_sign3;
reg  [22:0] a_mant3, b_mant3;
reg [1:0]select3;
reg [7:0]out_exp3;

reg out_sign4;
reg inp_op4;
reg [31:0]a4,b4;
reg [7:0]out_exp4;
reg [24:0]out_mant4;

reg out_sign5;
reg inp_op5;
reg [31:0]a5,b5;
reg [22:0]out_mant_final5;
reg [7:0]out_exp5;
reg [7:0]pos5;

reg out_sign6;
reg inp_op6;
reg [31:0]a6,b6;
reg [22:0]out_mant_final6;
reg [7:0]out_exp_final6;

subtractor s1(a[30:23],b[30:23],exptemp,select,out_exp);
shifter s2(select1,a1[22:0],b1[22:0],exptemp1, a_mant1,b_mant1);	//shift mantissa by exponent difference
comb_logic  c1(a2[31],b2[31],a_mant2,b_mant2,inp_op2,out_op,out_sign);
adder addmant(select3,out_op3,out_sign3,a_mant3,b_mant3,out_mant);
detectzero dzero(out_mant4,out_mant_final,pos);
subtractexp subexp(out_exp5, pos5,out_exp_final);
assign out[31]=out_sign6;
assign out[30:23]=out_exp_final6;
assign out[22:0]=out_mant_final6;

always@(posedge clk)
begin
	a1<=a;
	b1<=b;
	select1<=select;
	exptemp1<=exptemp;
	out_exp1<=out_exp;
	inp_op1<=inp_op;
	a_mant2<=a_mant1;
	b_mant2<=b_mant1;
	out_exp2<=out_exp1;
	a2<=a1;
	b2<=b1;
	inp_op2<=inp_op1;
	select2<=select1;
	out_exp3<=out_exp2;
	out_op3<=out_op;
	inp_op3<=inp_op2;
	out_sign3<=out_sign;
	a_mant3<=a_mant2;
	b_mant3<=b_mant2;
	select3<=select2;
	a3<=a2;
	b3<=b2;
	inp_op4<=inp_op3;
	out_exp4<=out_exp3;
	out_sign4<=out_sign3;
	out_mant4<=out_mant;
	a4<=a3;
	b4<=b3;
	inp_op5<=inp_op4;
	out_exp5<=out_exp4;
	out_sign5<=out_sign4;
	pos5<=pos;
	a5<=a4;
	out_mant_final5<=out_mant_final;
	b5<=b4;
	inp_op6<=inp_op5;
	out_exp_final6<=out_exp_final;
	out_mant_final6<=out_mant_final5;
	out_sign6<=out_sign5;
	a6<=a5;
	b6<=b5;
end

initial begin
    $monitor ("\ntime:",$time ,"a:%b \nb: %b op:%b \nout: %b",a6,b6,inp_op6, out);
  end
endmodule


