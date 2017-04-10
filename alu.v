`include "dff.v"
`include "logical_mods.v"


module decoder(opcode[4:0] , out[31:0] , enable);				//decoder module with 5 bit input and 32 bit output - non pipelined
	input [4:0]opcode;
	output [31:0]out;
	input enable;

	wire [31:0]out;

	assign out = (enable)?(1 << opcode):32'b0;					//assigns output to out array by shifting a '1' based on number in opcode

endmodule

/*module dec_tb();

	reg [4:0]opcode;
	reg enable;

	wire [31:0]out;

	decoder de(opcode , out , enable);

	initial begin
		#2

		opcode = 5'b00000;
		enable = 1'b1;

		#2

		opcode = 5'b10000;
		enable = 1'b1;

		#2

		opcode = 5'b10101;
		enable = 1'b0;

		#2

		opcode = 5'b00110;
		enable = 1'b1;

	end

	initial begin

		$monitor($time,"  opcode = %d , enable = %b , output = %b\n",opcode , enable , out);

	end

endmodule*/

module tsg(in , state , out , clk);								//one bit tri state gate with input in , state and clock - non pipelined
	input in , state , clk;										//leaving it non-pipelined
	output out;

	wire inc , stc;												//for output of dff of input and state respectively

	reg out;

	//dff d1(in , inc , clk);
	//dff d2(state , stc , clk);

	always @(in or state or clk)								//assigns output of tri state gate
	begin

		if(state == 0)												//add dff , replace state with stc
			out <= 1'bz;
		else out <= in;										//add dff , replace in with inc

	end

endmodule // tsg

module tsg_32(in , state , out , clk);							//32 bit tri state gate array accepting 32 bit input <in> , one bit state <state> , 32 bit output <out> and clock - non pipelined

	input [31:0]in;
	input state , clk;
	
	output [31:0] out;

	reg [31:0] out;												//add dff_32 after this line for pipeline purposes

	always @(in or state or clk)								//assigns 32 bit output 
	begin

		if(state == 0)												//add dff , replace state with stc
			out <= 32'bz;
		else out <= in;										//add dff , replace in with inc

	end

endmodule


/*module tsg_tb();												//testbench for one bit tri state gate modifiable easily for with and w/o clock / pipeline

	reg in , state , clk;

	wire out;

	tsg t1(in , state , out , clk);

	initial
	begin
	
		clk=0;
	
	end

	always
	begin 
		
		#1
		
		clk=~clk;
	
	end

	always
	begin
		
		#10 $finish;
	
	end

	initial begin

		//state = 1'b1;
		//in = 1'b0;

		#1

		state = 1'b1;
		in = 1'b1;

		#1

		state = 1'b1;
		in = 1'b0;

		#1

		state = 1'b0;
		in = 1'b1;

		#1

		state = 1'b0;
		in = 1'b0;

	end

	initial begin

		$monitor($time,"  state = %b , in = %b , out = %b",state , in , out);
	
	end

endmodule // tsg_tb*/

/*module tsg32_tb();												//testbench for 32 bit tri state gate modifiable easily for with and w/o clock / pipeline

	reg state , clk;
	reg [31:0] in;

	wire [31:0] out;

	tsg_32 t1(in , state , out , clk);

	initial
	begin
	
		clk=0;
	
	end

	always
	begin 
		
		#1
		
		clk=~clk;
	
	end

	always
	begin
		
		#10 $finish;
	
	end

	initial begin

		//state = 1'b1;
		//in = 1'b0;

		#1

		state = 1'b1;
		in = 32'b00110011001100110011001100110011;

		#1

		state = 1'b1;
		in = 32'b00000000000000011111111111111111;

		#1

		state = 1'b0;
		in = 32'b01010101010101110000011010101010;

		#1

		state = 1'b0;
		in = 32'b01010101010111110000000011001000;

	end

	initial begin

		$monitor($time,"  state = %b , in = %b , out = %b",state , in , out);
	
	end // initial

endmodule // tsg_tb*/

module alu(opcode , a , b , enable , out , clk , w1 , w2 , w3 , w4 , w5 , w6 , w7 , w8 , w9 , w10 , w11 , w12 , w13 , w14 , w15 , w16);				//alu that takes opcode and 2 inputs and performs functions - non pipelined

	input [31:0] a , b;
	input clk , enable;
	input [4:0] opcode;

	output [31:0] out , w1 , w2 , w3 , w4 , w5 , w6 , w7 , w8 , w9 , w10 , w11 , w12 , w13 , w14 , w15 , w16;

	wire [31:0] out , code;

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

	//adder module(w1 , s1 , cin//=0 , out , cout , clk);			//addition
	//adder module(w2 , s2 , cin//=1 , out , cout , clk);			//addition with carry

	//adder module(w3 , not(s3) , cin//=1 , out , cout , clk);		//subtraction
	//adder module(w4 , not(s4) , cin//=0 , out , cout , clk);		//subtraction with borrow a.k.a barrow

	//multiplication module(w5 , s5 , out , cout , clk);			//multiplication

	//float adder(w6 , s6 , cin , out , cout , clk);				//floating point adder
	//float adder(w7 , not(s7) , cin// = 1 , out , cout , clk);		//floating point subtraction
	//float multiply(w8 , s8 , out , cout , clk);					//floating point multiply

	//And_32(w9 , s9 , out , clk);									//AND
	//Or_32(w10 , s10 , out , clk);									//OR
	//Xor_32(w11 , s11 , out , clk);								//XOR
	//Nand_32(w12 , s12 , out , clk);								//Nand
	//Nor_32(w13 , s13 , out , clk);								//Nor
	//Xnor_32(w14 , s14 , out , clk);								//Xnor

	//Not_32(w15 , out , clk);										//NOT

	//Neg_32(w16 , out , clk);										//2's Complement - yet to write

endmodule // alu

module alu_tb();

	reg [31:0]a , b;
	reg[4:0] opcode;
	reg enable , clk;

	wire [31:0] out , w1 , w2 , w3 , w4 , w5 , w6 , w7 , w8 , w9 , w10 , w11 , w12 , w13 , w14 , w15 , w16;

	alu al1(opcode , a , b , enable , out , clk , w1 , w2 , w3 , w4 , w5 , w6 , w7 , w8 , w9 , w10 , w11 , w12 , w13 , w14 , w15 , w16);

	initial
	begin
	
		clk=0;
	
	end

	always
	begin 
		
		#1
		
		clk=~clk;
	
	end

	always
	begin
		
		#10 $finish;
	
	end

	initial begin

		//state = 1'b1;
		//in = 1'b0;

		#2

		enable = 1'b1;
		a = 32'b00001111000011110000111100001111;
		b = 32'b00001111000011110000111100001111;
		opcode = 5'b00000;

		/*#2

		state = 1'b1;
		in = 1'b0;

		#2

		state = 1'b0;
		in = 1'b1;

		#2

		state = 1'b0;
		in = 1'b0;*/

	end

	initial begin

		$monitor($time,"  opcode = %b , a = %b , b = %b , enable = %b\nw1 = %b\nw2 = %b\nw3 = %b\nw4 = %b\nw5 = %b\nw6 = %b\nw7 = %b\nw8 = %b\nw9 = %b\nw10 = %b\nw11 = %b\nw12 = %b\nw13 = %b\nw14 = %b\nw15 = %b\nw16 = %b\n\nout = %b\n\n",opcode , a , b , enable , w1 , w2 , w3 , w4 , w5 , w6 , w7 , w8 , w9 , w10 , w11 , w12 , w13 , w14 , w15 , w16 , out);
	
	end

endmodule // alu_tb

