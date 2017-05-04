module memory(address, in, out, read, write);

input [21:0] address;
input [31:0] in;
input read,write;
output [31:0] out;

reg [31:0]  out;
reg [8192:0] mem [31:0];

always @(*) begin
	if (read)
		out=mem[address];
	if (write)
		mem[address]=in;
end

initial begin
	/* insert program code here */
end

endmodule
