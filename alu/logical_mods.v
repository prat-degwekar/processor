module And_32(a , b , out , clk);							//working non-pipelined

	input [31:0] a , b;
	input clk;

	output [31:0] out;

	wire [31:0] out;

	assign out = (a === 32'bz) ? 32'bz : a&b;

endmodule // And_32

module Or_32(a , b , out , clk);							//working non-pipelined

	input [31:0] a , b;
	input clk;

	output [31:0] out;

	wire [31:0] out;

	assign out = (a === 32'bz) ? 32'bz : a|b;

endmodule // Or_32

module Xor_32(a , b , out , clk);							//working non-pipelined

	input [31:0] a , b;
	input clk;

	output [31:0] out;

	wire [31:0] out;

	assign out = (a === 32'bz) ? 32'bz : a^b;

endmodule // Xor_32

module Nand_32(a , b , out , clk);							//working non-pipelined

	input [31:0] a , b;
	input clk;

	output [31:0] out;

	wire [31:0] out;
	wire [31:0] temp;

	assign temp = a&b;
	assign out = (a === 32'bz) ? 32'bz : a~&b;										//try assign out = a ~& b;

endmodule // Nand_32

module Nor_32(a , b , out , clk);							//working non-pipelined

	input [31:0] a , b;
	input clk;

	output [31:0] out;

	wire [31:0] out;
	wire [31:0] temp;

	assign temp = a|b;
	assign out = (a === 32'bz) ? 32'bz : a~|b;										//try assign out = a ~| b;

endmodule // Nor_32

module Xnor_32(a , b , out , clk);							//working non-pipelined

	input [31:0] a , b;
	input clk;

	output [31:0] out;

	wire [31:0] out;
	wire [31:0] temp;

	assign temp = a^b;
	assign out = (a === 32'bz) ? 32'bz : a~^b;										//try assign out = a ~^ b;

endmodule // Xnor_32

module Not_32(a , out , clk);								//working - non pipelined

	input [31:0] a;
	input clk;

	output [31:0] out;

	wire [31:0] out;

	assign out = (a === 32'bz) ? 32'bz : ~a;										//try !a if ~a does not work

endmodule // Not_32

module a2s(a , out , clk);
	input [31:0]a;
	output [31:0]out;
	input clk;

	assign out = (a === 32'bz) ? 32'bz : (~a+1);
endmodule // 2s

/*module tb();

	reg [31:0]a , b;
	reg clk;

	wire [31:0] out1 , out2 , out3 , out4 , out5 , out6 , out7 , out8;

	And_32 And(a , b , out1 , clk);

	Or_32 Or(a , b , out2 , clk);

	Xor_32 Xor(a , b , out3 , clk);

	Nand_32 Nand(a , b , out4 , clk);

	Nor_32 Nor(a , b , out5 , clk);

	Xnor_32 Xnor(a , b , out6 , clk);

	Not_32 Na(a , out7 , clk);

	Not_32 Nb(b , out8 , clk);

	initial begin

		clk = 1'b0;

	end

	initial begin

		#2

		a = 32'b00110011001100110011001100110011;
		b = 32'b11001100110011001100110011001100;

		#2

		a = 32'b11111111111111111111111111111111;
		b = 32'b11110000111100001111000011110000;

		#2

		a = 32'b01010101010101010101010101010101;
		b = 32'b10101010101010101010101010101010;

		#2

		a = 32'b00000000000000000000000000000000;
		b = 32'b11111111000000001111111100000000;

	end

	initial begin

		$monitor($time,"  a = %b , b = %b \n and = %b\nor = %b\nxor = %b\nnand = %b\nnor = %b\nxnor = %b\nnot a = %b\nnot b = %b\n\n" , a , b , out1 , out2 , out3 , out4 , out5 , out6 , out7 , out8);
		/*$monitor($time,"  a = %b , b = %b , out2 = %b\n" , a , b , out2);
		$monitor($time,"  a = %b , b = %b , out3 = %b\n" , a , b , out3);
		$monitor($time,"  a = %b , b = %b , out4 = %b\n" , a , b , out4);
		$monitor($time,"  a = %b , b = %b , out5 = %b\n" , a , b , out5);
		$monitor($time,"  a = %b , b = %b , out6 = %b\n" , a , b , out6);
		$monitor($time,"  a = %b , b = %b , out7 = %b\n" , a , b , out7);
		$monitor($time,"  a = %b , b = %b , out8 = %b\n" , a , b , out8);*/

	/*end

endmodule*/
