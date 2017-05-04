`include "mem.v"
`include "reg.v"

module loadstore(opcode, rdst, address, enable,
			regsrc1, regout1, regsrc2, regout2, regdst, regin, regread, regwrite,
			memaddress, memin, memout, memread, memwrite
			);
input enable;
input [4:0] opcode, rdst;
input [21:0] address;

output reg regread, regwrite, memread, memwrite;
output reg [4:0] regsrc1, regsrc2, regdst;
output reg [21:0] memaddress;
output reg [31:0] regout1, regout2, regin, memin, memout;

/* reg regread, regwrite, memread, memwrite; */
/* reg [4:0] regsrc1, regsrc2, regdst; */
/* reg [21:0] memaddress; */
/* reg [31:0] regout1, regout2, regin, memin, memout; */

always @(*) begin
	regwrite=1'b0;
	regread=1'b0;
	memread=1'b0;
	memwrite=1'b0;
	if (enable) begin
		if (opcode[4]) begin
			if (opcode[3]) begin
				regsrc1=rdst;
				regread=1'b1;
				memaddress=address;
				memin=regout1;
				memwrite=1'b1;
			end
			else begin
				memaddress=address;
				memread=1'b1;
				regdst=rdst;
				regin=memout;
				regwrite=1'b1;
			end
		end
	end
end
endmodule
