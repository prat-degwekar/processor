`include "alu.v"
module alu_tb();

	reg [31:0]a , b;
	reg[4:0] opcode;
	reg enable , clk;

	wire [31:0] out , w1 , w2 , w3 , w4 , w5 , w6 , w7 , w8 , w9 , w10 , w11 , w12 , w13 , w14 , w15 , w16;

	alu al1(opcode , a , b , enable , out , clk);

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
		
		#100 $finish;
	
	end

	initial begin

		//state = 1'b1;
		//in = 1'b0;

		#2

		enable = 1'b1;
		a = 32'b00001111000011110000111100001111;
		b = 32'b01110000111100001111000011110000;
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

		$monitor($time,"  opcode = %b , a = %b , b = %b , enable = %b, out = %b",opcode , a , b , enable, out);
	
	end

endmodule // alu_tb

