`include "pipeMult.v"

module test;
	reg[31:0]a, b;
	reg clk;
	wire[63:0] pro;

	multi p(a, b, pro, clk);

	initial begin
		clk = 0;
	end

	always begin
		#1
		clk = ~clk;
	end

	initial begin
		a = 32'd1001;
		b = 32'd212;
	end

	always begin
		#100
		$finish;
	end

	initial begin
		$monitor($time, "\ta = %d\tb = %d\tpro = %d\t" ,a ,b, pro, $time);
	end
endmodule
