module memory(address, in, out, read, write);

input [21:0] address;
input [31:0] in;
input read,write;
output [31:0] out;

reg [31:0]  out;
reg [31:0] mem [8192:0];

always @(*) begin
	if (read)
		out=mem[address];
	if (write)
		mem[address]=in;
end

initial begin
	//Data memory
	mem[0]=32'b00000000000000000000000000000000; // binary value of 0 in fp
	mem[1]=32'b00111111100000000000000000000000; // binary value of 1 in fp
	mem[2]=32'b01000000111000000000000000000000; // binary value of 7 in fp
	//Program memory
	mem[100]=32'b10000_00000_0000000000000000000000; // R0 <- mem[0]
	mem[101]=32'b10000_00001_0000000000000000000001; // R1 <- mem[1]
	mem[102]=32'b10000_00001_0000000000000000000001; // R1 <- mem[1]

	/* insert program code here */
end

endmodule
