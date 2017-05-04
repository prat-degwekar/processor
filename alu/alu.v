//`include "multiplier/dff.v"
`include "logical_mods.v"
`include "bus.v"
`include "decoder.v"
`include "tsg.v"
`include "adder/adder.v"
`include "multiplier/pipeMult.v"
`include "fpmultiplier/fpmultiplier.v"
`include "stuff/floatadder.v"

module alu(opcode , a , b , enable , out , clk );				//alu that takes opcode and 2 inputs and performs functions - non pipelined

	input [31:0] a , b;
	input clk , enable;
	input [4:0] opcode;

	output [31:0] out;

	wire [31:0] out , code;

	wire [63:0] mulout;

	wire cout;

	wire [31:0]temp1 , temp2;

	decoder dec(opcode , code , enable);

	wire [31:0] w1 , w2 , w3 , w4 , w5 , w6 , w7 , w8 , w9 , w10 , w11 , w12 , w13 , w14 , w15 , w16;
	wire [31:0] s1 , s2 , s3 , s4 , s5 , s6 , s7 , s8 , s9 , s10 , s11 , s12 , s13 , s14 , s15 , s16;

	tsg_32 t1_1(a , code[0] , w1 , clk);							//tsg for adder a
	tsg_32 t1_2(b , code[0] , s1 , clk);							//tsg for adder b

	tsg_32 t2_1(a , code[1] , w2 , clk);							//tsg for adder w/c a
	tsg_32 t2_2(b , code[1] , s2 , clk);							//tsg for adder w/c b

	tsg_32 t3_1(a , code[2] , w3 , clk);							//tsg for subtract a
	tsg_32 t3_2(b , code[2] , s3 , clk);							//tsg for subtract b

	tsg_32 t4_1(a , code[3] , w4 , clk);							//tsg for subtract w/b a
	tsg_32 t4_2(b , code[3] , s4 , clk);							//tsg for subtract w/b b

	tsg_32 t5_1(a , code[4] , w5 , clk);							//tsg for multiply a
	tsg_32 t5_2(b , code[4] , s5 , clk);							//tsg for multiply b

	tsg_32 t6_1(a , code[5] , w6 , clk);							//tsg for floating point adder a
	tsg_32 t6_2(b , code[5] , s6 , clk);							//tsg for floating point adder b

	tsg_32 t7_1(a , code[6] , w7 , clk);							//tsg for floating subtract a
	tsg_32 t7_2(b , code[6] , s7 , clk);							//tsg for floating subtract b

	tsg_32 t8_1(a , code[7] , w8 , clk);							//tsg for floating multiply a
	tsg_32 t8_2(b , code[7] , s8 , clk);							//tsg for floating multiply b

	tsg_32 t9_1(a , code[8] , w9 , clk);							//tsg for AND a
	tsg_32 t9_2(b , code[8] , s9 , clk);							//tsg for AND b

	tsg_32 t10_1(a , code[9] , w10 , clk);							//tsg for OR a
	tsg_32 t10_2(b , code[9] , s10 , clk);							//tsg for OR b

	tsg_32 t11_1(a , code[10] , w11 , clk);							//tsg for XOR a
	tsg_32 t11_2(b , code[10] , s11 , clk);							//tsg for XOR b

	tsg_32 t12_1(a , code[11] , w12 , clk);							//tsg for NAND a
	tsg_32 t12_2(b , code[11] , s12 , clk);							//tsg for NAND b

	tsg_32 t13_1(a , code[12] , w13 , clk);							//tsg for NOR a
	tsg_32 t13_2(b , code[12] , s13 , clk);							//tsg for NOR b

	tsg_32 t14_1(a , code[13] , w14 , clk);							//tsg for XNOR a
	tsg_32 t14_2(b , code[13] , s14 , clk);							//tsg for XNOR b

	//write overloaded alu with only 1 input

	tsg_32 t15_1(a , code[14] , w15 , clk);							//tsg for NOT a
	tsg_32 t15_2(b , code[14] , s15 , clk);							//tsg for NOT b

	tsg_32 t16_1(a , code[15] , w16 , clk);							//tsg for NEGATION a
	tsg_32 t16_2(b , code[15] , s16 , clk);							//tsg for NEGATION b

	//other alu
	//give each module diff. wire and set out = OR of all values or AND of all value based on what x | 1 is equal to...

	//adder module(w1 , s1 , cin//=0 , out , cout , clk);			//addition
	//adder module(w2 , s2 , cin//=1 , out , cout , clk);			//addition with carry
	adder a1(w1 , s1 , 0 , out , cout , clk);
	adder a2(w2 , s2 , 1 , out , cout , clk);

	//adder module(w3 , not(s3) , cin//=1 , out , cout , clk);		//subtraction		done
	//adder module(w4 , not(s4) , cin//=0 , out , cout , clk);		//subtraction with borrow a.k.a barrow		done
	a2s sub1(s3 , temp1 , clk);
	adder sub(w3 , temp1 , 1 , out , cout , clk);
	a2s sub2(s4 , temp2 , clk);
	adder subb(w4 , temp2 , 0 , out , cout , clk);

	//multiplication module(w5 , s5 , out , cout , clk);			//multiplication			done
	multi p(w5 , s5 , mulout , clk);
	assign out = (w5 === 32'bz) ? 32'bz : mulout[31:0];


	//float adder(w6 , s6 , cin , out , cout , clk);				//floating point adder
	floatadder fla(w6 , s6 , 0 , out , clk);
	//float adder(w7 , not(s7) , cin// = 1 , out , cout , clk);		//floating point subtraction
	//float multiply(w8 , s8 , out , cout , clk);					//floating point multiply		done
	FPM_32 fpmult(w8 , s8 , out , clk);

	//$monitor($time , " w9 = %b\n s9 = %b\n", w9 , s9 );

	And_32 And(w9 , s9 , out , clk);									//AND
	Or_32 Or(w10 , s10 , out , clk);									//OR
	Xor_32 Xor(w11 , s11 , out , clk);									//XOR
	Nand_32 Nand(w12 , s12 , out , clk);									//Nand
	Nor_32 Nor(w13 , s13 , out , clk);									//Nor
	Xnor_32 Xnor(w14 , s14 , out , clk);									//Xnor

	//Not_32(w15 , out , clk);										//NOT
	Not_32 Not(w15 , out , clk);

	//Neg_32(w16 , out , clk);										//2's Complement - yet to write
	a2s comple(w16 , out , clk);

	initial begin

		$monitor($time , " w9 = %b\n s9 = %b\n", w9 , s9 );

	end

endmodule // alu
