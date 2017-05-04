module a2s(a , out , clk);
	input [31:0]a;
	output [31:0]out;
	input clk;

	assign out = (a === 32'bz) ? 32'bz : (~a+1);
endmodule // 2s

module a2s_tb();
	reg [31:0]a;
	wire [31:0]out;
	reg clk;

	a2s AA(a , out , clk);

	initial begin
		clk = 1'b0;
	end

	initial begin

		#2

		a = 32'b11110000111100001111000011110000;

		#2

		a = 32'bz;

	end

	initial begin

		$monitor($time,"a = %b , out = %b\n",a,out);

	end

endmodule