`include "alu.v"
/*module alu_tb();

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

	/*end

	initial begin

		$monitor($time,"  opcode = %b , a = %b , b = %b , enable = %b, out = %b",opcode , a , b , enable, out);
	
	end

endmodule // alu_tb*/

module alu_tb();

	reg [31:0]a , b;
	reg[4:0] opcode;
	reg enable , clk;

	wire [31:0] out;

	alu al1(opcode , a , b , enable , out , clk );

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
		b = 32'b0;
		opcode = 5'b00000;

		#20

		enable = 1'b1;
		a = 32'b00001111000011110000111100001111;
		b = 32'b11111111111111111111111111111111;
		opcode = 5'b01001;

		#20

		enable = 1'b1;
		a = 32'b00001111000011110000111100001111;
		b = 32'b11111111111111111111111111111111;
		opcode = 5'b01010;

		#2

		enable = 1'b1;
		a = 32'b00001111000011110000111100001111;
		b = 32'b11111111111111111111111111111111;
		opcode = 5'b01011;

		#2

		enable = 1'b1;
		a = 32'b00001111000011110000111100001111;
		b = 32'b11111111111111111111111111111111;
		opcode = 5'b01100;

		#2

		enable = 1'b1;
		a = 32'b00001111000011110000111100001111;
		b = 32'b11111111111111111111111111111111;
		opcode = 5'b01101;

	end

	initial begin

		$monitor($time,"  opcode = %b , a = %b , b = %b , enable = %b\n\nout = %b\n\n",opcode , a , b , enable , out);
	
	end

endmodule // alu_tb

