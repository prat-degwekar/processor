`include "adder.v"

module test;
	reg[31:0]a, b;
	reg cin, clk;
	wire[31:0] s;
	wire cout;

	adder p( a , b , cin , s , cout , clk );

	initial begin
		clk = 0;
	end

	always begin
		#1
		clk = ~clk;
	end

	initial begin
		a = 32'd2147483647;
		b = 32'd1;
		cin = 0;
	end

	always begin
		#100
		$finish;
	end

	initial begin
		$monitor($time, "\ta = %b\tb = %b\tcin = %b\ts = %b\tcout = %b\t" , a , b , cin , s , cout, $time);
	end
endmodule
