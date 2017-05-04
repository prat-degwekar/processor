module regs(rsrc1, out1, rsrc2, out2, rdst, in, read, write);

input [4:0] rsrc1,rsrc2,rdst;
input [31:0] in;
output [31:0] out1,out2;
reg [31:0] out1,out2;
input read,write;

reg [31:0] regs [31:0];

always @(*) begin
	if(read) begin
		out1=regs[rsrc1];
		out2=regs[rsrc2];
	end
	else if(write)
		regs[rdst]=in;
end
endmodule
