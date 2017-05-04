module dff(q,clk,d);
	input d,clk,rst;
	output q;
	reg q;

	always@(posedge clk)
	begin
		q<=d;
	end
endmodule


module dff64(q,clk,d);
	input [63:0]d;
	input clk;
	output [63:0]q;
	reg q;

	always@(posedge clk)
	begin
		q<=d;
	end
endmodule

module dff63(q,clk,d);
	input [62:0]d;
	input clk;
	output [62:0]q;
	reg q;

	always@(posedge clk)
	begin
		q<=d;
	end
endmodule

module dff32(q,clk,d);
	input [31:0]d;
	input clk;
	output [31:0]q;
	reg [31:0]q;

	always@(posedge clk)
	begin
		q<=d;
	end
endmodule
