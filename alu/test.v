`include "alu.v"
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

