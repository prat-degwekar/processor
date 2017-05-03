/* module dff(d, clk, q); */
/* 	input d,clk; */
/* 	output q; */
/* 	reg q; */

/* 	always@(posedge clk) */
/* 	begin */
/* 		q<=d; */
/* 	end */
/* endmodule */


module dff64(d, clk, q);
	input [63:0]d;
	input clk;
	output [63:0]q;
	reg q;

	always@(posedge clk)
	begin
		q<=d;
	end
endmodule

module dff63(d, clk, q);
	input [62:0]d;
	input clk;
	output [62:0]q;
	reg q;

	always@(posedge clk)
	begin
		q<=d;
	end
endmodule

module dff32(d, clk, q);
	input [31:0]d;
	input clk;
	output [31:0]q;
	reg [31:0]q;

	always@(posedge clk)
	begin
		q<=d;
	end
endmodule
