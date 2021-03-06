module bus(out, w1 , w2 , w3 , w4 , w5 , w6 , w7 , w8 , w9 , w10 , w11 , w12 , w13 , w14 , w15 , w16);
	input[31:0] w1 , w2 , w3 , w4 , w5 , w6 , w7 , w8 , w9 , w10 , w11 , w12 , w13 , w14 , w15 , w16;

	output[31:0] out;
	reg [31:0] out;

	always @(*) begin
		if ((w1[0] | w2[0] | w3[0] | w4[0] | w5[0] | w6[0] | w7[0] | w8[0]
			| w9[0] | w10[0] | w11[0] | w12[0] | w13[0] | w14[0] | w15[0] | w16[0]) === 1'b1)
			out[0]=1;
		else out[0]=0;
		if ((w1[1] | w2[1] | w3[1] | w4[1] | w5[1] | w6[1] | w7[1] | w8[1]
			| w9[1] | w10[1] | w11[1] | w12[1] | w13[1] | w14[1] | w15[1] | w16[1]) === 1'b1)
			out[1]=1;
		else out[1]=0;
		if ((w1[2] | w2[2] | w3[2] | w4[2] | w5[2] | w6[2] | w7[2] | w8[2]
			| w9[2] | w10[2] | w11[2] | w12[2] | w13[2] | w14[2] | w15[2] | w16[2]) === 1'b1)
			out[2]=1;
		else out[2]=0;
		if ((w1[3] | w2[3] | w3[3] | w4[3] | w5[3] | w6[3] | w7[3] | w8[3]
			| w9[3] | w10[3] | w11[3] | w12[3] | w13[3] | w14[3] | w15[3] | w16[3]) === 1'b1)
			out[3]=1;
		else out[3]=0;
		if ((w1[4] | w2[4] | w3[4] | w4[4] | w5[4] | w6[4] | w7[4] | w8[4]
			| w9[4] | w10[4] | w11[4] | w12[4] | w13[4] | w14[4] | w15[4] | w16[4]) === 1'b1)
			out[4]=1;
		else out[4]=0;
		if ((w1[5] | w2[5] | w3[5] | w4[5] | w5[5] | w6[5] | w7[5] | w8[5]
			| w9[5] | w10[5] | w11[5] | w12[5] | w13[5] | w14[5] | w15[5] | w16[5]) === 1'b1)
			out[5]=1;
		else out[5]=0;
		if ((w1[6] | w2[6] | w3[6] | w4[6] | w5[6] | w6[6] | w7[6] | w8[6]
			| w9[6] | w10[6] | w11[6] | w12[6] | w13[6] | w14[6] | w15[6] | w16[6]) === 1'b1)
			out[6]=1;
		else out[6]=0;
		if ((w1[7] | w2[7] | w3[7] | w4[7] | w5[7] | w6[7] | w7[7] | w8[7]
			| w9[7] | w10[7] | w11[7] | w12[7] | w13[7] | w14[7] | w15[7] | w16[7]) === 1'b1)
			out[7]=1;
		else out[7]=0;
		if ((w1[8] | w2[8] | w3[8] | w4[8] | w5[8] | w6[8] | w7[8] | w8[8]
			| w9[8] | w10[8] | w11[8] | w12[8] | w13[8] | w14[8] | w15[8] | w16[8]) === 1'b1)
			out[8]=1;
		else out[8]=0;
		if ((w1[9] | w2[9] | w3[9] | w4[9] | w5[9] | w6[9] | w7[9] | w8[9]
			| w9[9] | w10[9] | w11[9] | w12[9] | w13[9] | w14[9] | w15[9] | w16[9]) === 1'b1)
			out[9]=1;
		else out[9]=0;
		if ((w1[10] | w2[10] | w3[10] | w4[10] | w5[10] | w6[10] | w7[10] | w8[10]
			| w9[10] | w10[10] | w11[10] | w12[10] | w13[10] | w14[10] | w15[10] | w16[10]) === 1'b1)
			out[10]=1;
		else out[10]=0;
		if ((w1[11] | w2[11] | w3[11] | w4[11] | w5[11] | w6[11] | w7[11] | w8[11]
			| w9[11] | w10[11] | w11[11] | w12[11] | w13[11] | w14[11] | w15[11] | w16[11]) === 1'b1)
			out[11]=1;
		else out[11]=0;
		if ((w1[12] | w2[12] | w3[12] | w4[12] | w5[12] | w6[12] | w7[12] | w8[12]
			| w9[12] | w10[12] | w11[12] | w12[12] | w13[12] | w14[12] | w15[12] | w16[12]) === 1'b1)
			out[12]=1;
		else out[12]=0;
		if ((w1[13] | w2[13] | w3[13] | w4[13] | w5[13] | w6[13] | w7[13] | w8[13]
			| w9[13] | w10[13] | w11[13] | w12[13] | w13[13] | w14[13] | w15[13] | w16[13]) === 1'b1)
			out[13]=1;
		else out[13]=0;
		if ((w1[14] | w2[14] | w3[14] | w4[14] | w5[14] | w6[14] | w7[14] | w8[14]
			| w9[14] | w10[14] | w11[14] | w12[14] | w13[14] | w14[14] | w15[14] | w16[14]) === 1'b1)
			out[14]=1;
		else out[14]=0;
		if ((w1[15] | w2[15] | w3[15] | w4[15] | w5[15] | w6[15] | w7[15] | w8[15]
			| w9[15] | w10[15] | w11[15] | w12[15] | w13[15] | w14[15] | w15[15] | w16[15]) === 1'b1)
			out[15]=1;
		else out[15]=0;
		if ((w1[16] | w2[16] | w3[16] | w4[16] | w5[16] | w6[16] | w7[16] | w8[16]
			| w9[16] | w10[16] | w11[16] | w12[16] | w13[16] | w14[16] | w15[16] | w16[16]) === 1'b1)
			out[16]=1;
		else out[16]=0;
		if ((w1[17] | w2[17] | w3[17] | w4[17] | w5[17] | w6[17] | w7[17] | w8[17]
			| w9[17] | w10[17] | w11[17] | w12[17] | w13[17] | w14[17] | w15[17] | w16[17]) === 1'b1)
			out[17]=1;
		else out[17]=0;
		if ((w1[18] | w2[18] | w3[18] | w4[18] | w5[18] | w6[18] | w7[18] | w8[18]
			| w9[18] | w10[18] | w11[18] | w12[18] | w13[18] | w14[18] | w15[18] | w16[18]) === 1'b1)
			out[18]=1;
		else out[18]=0;
		if ((w1[19] | w2[19] | w3[19] | w4[19] | w5[19] | w6[19] | w7[19] | w8[19]
			| w9[19] | w10[19] | w11[19] | w12[19] | w13[19] | w14[19] | w15[19] | w16[19]) === 1'b1)
			out[19]=1;
		else out[19]=0;
		if ((w1[20] | w2[20] | w3[20] | w4[20] | w5[20] | w6[20] | w7[20] | w8[20]
			| w9[20] | w10[20] | w11[20] | w12[20] | w13[20] | w14[20] | w15[20] | w16[20]) === 1'b1)
			out[20]=1;
		else out[20]=0;
		if ((w1[21] | w2[21] | w3[21] | w4[21] | w5[21] | w6[21] | w7[21] | w8[21]
			| w9[21] | w10[21] | w11[21] | w12[21] | w13[21] | w14[21] | w15[21] | w16[21]) === 1'b1)
			out[21]=1;
		else out[21]=0;
		if ((w1[22] | w2[22] | w3[22] | w4[22] | w5[22] | w6[22] | w7[22] | w8[22]
			| w9[22] | w10[22] | w11[22] | w12[22] | w13[22] | w14[22] | w15[22] | w16[22]) === 1'b1)
			out[22]=1;
		else out[22]=0;
		if ((w1[23] | w2[23] | w3[23] | w4[23] | w5[23] | w6[23] | w7[23] | w8[23]
			| w9[23] | w10[23] | w11[23] | w12[23] | w13[23] | w14[23] | w15[23] | w16[23]) === 1'b1)
			out[23]=1;
		else out[23]=0;
		if ((w1[24] | w2[24] | w3[24] | w4[24] | w5[24] | w6[24] | w7[24] | w8[24]
			| w9[24] | w10[24] | w11[24] | w12[24] | w13[24] | w14[24] | w15[24] | w16[24]) === 1'b1)
			out[24]=1;
		else out[24]=0;
		if ((w1[25] | w2[25] | w3[25] | w4[25] | w5[25] | w6[25] | w7[25] | w8[25]
			| w9[25] | w10[25] | w11[25] | w12[25] | w13[25] | w14[25] | w15[25] | w16[25]) === 1'b1)
			out[25]=1;
		else out[25]=0;
		if ((w1[26] | w2[26] | w3[26] | w4[26] | w5[26] | w6[26] | w7[26] | w8[26]
			| w9[26] | w10[26] | w11[26] | w12[26] | w13[26] | w14[26] | w15[26] | w16[26]) === 1'b1)
			out[26]=1;
		else out[26]=0;
		if ((w1[27] | w2[27] | w3[27] | w4[27] | w5[27] | w6[27] | w7[27] | w8[27]
			| w9[27] | w10[27] | w11[27] | w12[27] | w13[27] | w14[27] | w15[27] | w16[27]) === 1'b1)
			out[27]=1;
		else out[27]=0;
		if ((w1[28] | w2[28] | w3[28] | w4[28] | w5[28] | w6[28] | w7[28] | w8[28]
			| w9[28] | w10[28] | w11[28] | w12[28] | w13[28] | w14[28] | w15[28] | w16[28]) === 1'b1)
			out[28]=1;
		else out[28]=0;
		if ((w1[29] | w2[29] | w3[29] | w4[29] | w5[29] | w6[29] | w7[29] | w8[29]
			| w9[29] | w10[29] | w11[29] | w12[29] | w13[29] | w14[29] | w15[29] | w16[29]) === 1'b1)
			out[29]=1;
		else out[29]=0;
		if ((w1[30] | w2[30] | w3[30] | w4[30] | w5[30] | w6[30] | w7[30] | w8[30]
			| w9[30] | w10[30] | w11[30] | w12[30] | w13[30] | w14[30] | w15[30] | w16[30]) === 1'b1)
			out[30]=1;
		else out[30]=0;
		if ((w1[31] | w2[31] | w3[31] | w4[31] | w5[31] | w6[31] | w7[31] | w8[31]
			| w9[31] | w10[31] | w11[31] | w12[31] | w13[31] | w14[31] | w15[31] | w16[31]) === 1'b1)
			out[31]=1;
		else out[31]=0;
	end
endmodule
