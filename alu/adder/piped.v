`include "dff.v"

module piped(a , clk , b);
	input[31:0] a;
	input clk;
	output[31:0] b;
	wire[31:0] b;

	dff d0( a[0] , clk , b[0]);
	dff d1( a[1] , clk , b[1]);
	dff d2( a[2] , clk , b[2]);
	dff d3( a[3] , clk , b[3]);
	dff d4( a[4] , clk , b[4]);
	dff d5( a[5] , clk , b[5]);
	dff d6( a[6] , clk , b[6]);
	dff d7( a[7] , clk , b[7]);
	dff d8( a[8] , clk , b[8]);
	dff d9( a[9] , clk , b[9]);
	dff d10(a[10] , clk , b[10]);
	dff d11(a[11] , clk , b[11]);
	dff d12(a[12] , clk , b[12]);
	dff d13(a[13] , clk , b[13]);
	dff d14(a[14] , clk , b[14]);
	dff d15(a[15] , clk , b[15]);
	dff d16(a[16] , clk , b[16]);
	dff d17(a[17] , clk , b[17]);
	dff d18(a[18] , clk , b[18]);
	dff d19(a[19] , clk , b[19]);
	dff d20(a[20] , clk , b[20]);
	dff d21(a[21] , clk , b[21]);
	dff d22(a[22] , clk , b[22]);
	dff d23(a[23] , clk , b[23]);
	dff d24(a[24] , clk , b[24]);
	dff d25(a[25] , clk , b[25]);
	dff d26(a[26] , clk , b[26]);
	dff d27(a[27] , clk , b[27]);
	dff d28(a[28] , clk , b[28]);
	dff d29(a[29] , clk , b[29]);
	dff d30(a[30] , clk , b[30]);
	dff d31(a[31] , clk , b[31]);
endmodule