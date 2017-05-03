module decoder(opcode[4:0] , out[31:0] , enable);				//decoder module with 5 bit input and 32 bit output - non pipelined
	input [4:0]opcode;
	output [31:0]out;
	input enable;

	wire [31:0]out;

	assign out = (enable)?(1'b1 << opcode):32'b0;					//assigns output to out array by shifting a '1' based on number in opcode

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
