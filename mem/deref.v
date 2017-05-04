`include "../alu/alu.v" 
`include "mem.v"
`include "reg.v"

/* deref is a module that performs load and store instructions and also passes the relevant raw values to the alu */
module deref(opcode, rsrc1, a, rsrc2, b, enable, rdst, out, clk, regread, regwrite);
input [4:0] opcode, rsrc1, rsrc2, rdst;
input enable, clk;

output [31:0] a, b, out;
reg [31:0] a, b, out;

alu alu1(opcode, a, b, rdst, enable, out, clk);

always @(*) begin
	if (enable) begin
		regread=1'b1;
		enable=1'b1;
		if (out !== x) begin
			regwrite=1'b1;
			enable=1'b0;
			regread=1'b0;
		end
	end
end

endmodule
