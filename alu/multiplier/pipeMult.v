`include "multiplier/csave.v"
`include "multiplier/partProduct.v"
`include "multiplier/prefix.v"
`include "multiplier/dff.v"

module multi(a,b,out,clk);

    input [31:0]a,b;
    input clk;
    output [63:0]out;

    wire [62:0]p[0:31];
    wire [31:0]x[31:0];


    pgen a1(a,b[0],x[0]);
    pgen a2(a,b[1],x[1]);
    pgen a3(a,b[2],x[2]);
    pgen a4(a,b[3],x[3]);
    pgen a5(a,b[4],x[4]);
    pgen a6(a,b[5],x[5]);
    pgen a7(a,b[6],x[6]);
    pgen a8(a,b[7],x[7]);
    pgen a9(a,b[8],x[8]);
    pgen a10(a,b[9],x[9]);
    pgen a11(a,b[10],x[10]);
    pgen a12(a,b[11],x[11]);
    pgen a13(a,b[12],x[12]);
    pgen a14(a,b[13],x[13]);
    pgen a15(a,b[14],x[14]);
    pgen a16(a,b[15],x[15]);
    pgen a17(a,b[16],x[16]);
    pgen a18(a,b[17],x[17]);
    pgen a19(a,b[18],x[18]);
    pgen a20(a,b[19],x[19]);
    pgen a21(a,b[20],x[20]);
    pgen a22(a,b[21],x[21]);
    pgen a23(a,b[22],x[22]);
    pgen a24(a,b[23],x[23]);
    pgen a25(a,b[24],x[24]);
    pgen a26(a,b[25],x[25]);
    pgen a27(a,b[26],x[26]);
    pgen a28(a,b[27],x[27]);
    pgen a29(a,b[28],x[28]);
    pgen a30(a,b[29],x[29]);
    pgen a31(a,b[30],x[30]);
    pgen a32(a,b[31],x[31]);

    assign p[0][31:0]=x[0];
    assign p[1][32:1]=x[1];
    assign p[2][33:2]=x[2];
    assign p[3][34:3]=x[3];
    assign p[4][35:4]=x[4];
    assign p[5][36:5]=x[5];
    assign p[6][37:6]=x[6];
    assign p[7][38:7]=x[7];
    assign p[8][39:8]=x[8];
    assign p[9][40:9]=x[9];
    assign p[10][41:10]=x[10];
    assign p[11][42:11]=x[11];
    assign p[12][43:12]=x[12];
    assign p[13][44:13]=x[13];
    assign p[14][45:14]=x[14]; 	
    assign p[15][46:15]=x[15];
    assign p[16][47:16]=x[16];
    assign p[17][48:17]=x[17];
    assign p[18][49:18]=x[18];
    assign p[19][50:19]=x[19];
    assign p[20][51:20]=x[20];
    assign p[21][52:21]=x[21];
    assign p[22][53:22]=x[22];
    assign p[23][54:23]=x[23];
    assign p[24][55:24]=x[24];
    assign p[25][56:25]=x[25];
    assign p[26][57:26]=x[26];
    assign p[27][58:27]=x[27];
    assign p[28][59:28]=x[28];
    assign p[29][60:29]=x[29];
    assign p[30][61:30]=x[30];
    assign p[31][62:31]=x[31];

    assign p[0][62:32]=0;
    assign p[1][62:33]=0;
    assign p[2][62:34]=0;
    assign p[3][62:35]=0;
    assign p[4][62:36]=0;
    assign p[5][62:37]=0;
    assign p[6][62:38]=0;
    assign p[7][62:39]=0;
    assign p[8][62:40]=0;
    assign p[9][62:41]=0;
    assign p[10][62:42]=0;
    assign p[11][62:43]=0;
    assign p[12][62:44]=0;
    assign p[13][62:45]=0;
    assign p[14][62:46]=0;
    assign p[15][62:47]=0;
    assign p[16][62:48]=0;
    assign p[17][62:49]=0;
    assign p[18][62:50]=0;
    assign p[19][62:51]=0;
    assign p[20][62:52]=0;
    assign p[21][62:53]=0;
    assign p[22][62:54]=0;
    assign p[23][62:55]=0;
    assign p[24][62:56]=0;
    assign p[25][62:57]=0;
    assign p[26][62:58]=0;
    assign p[27][62:59]=0;
    assign p[28][62:60]=0;
    assign p[29][62:61]=0;
    assign p[30][62:62]=0;

    assign p[1][0:0]=0;
    assign p[2][1:0]=0;
    assign p[3][2:0]=0;
    assign p[4][3:0]=0;
    assign p[5][4:0]=0;
    assign p[6][5:0]=0;
    assign p[7][6:0]=0;
    assign p[8][7:0]=0;
    assign p[9][8:0]=0;
    assign p[10][9:0]=0;
    assign p[11][10:0]=0;
    assign p[12][11:0]=0;
    assign p[13][12:0]=0;
    assign p[14][13:0]=0;
    assign p[15][14:0]=0;
    assign p[16][15:0]=0;
    assign p[17][16:0]=0;
    assign p[18][17:0]=0;
    assign p[19][18:0]=0;
    assign p[20][19:0]=0;
    assign p[21][20:0]=0;
    assign p[22][21:0]=0;
    assign p[23][22:0]=0;
    assign p[24][23:0]=0;
    assign p[25][24:0]=0;
    assign p[26][25:0]=0;
    assign p[27][26:0]=0;
    assign p[28][27:0]=0;
    assign p[29][28:0]=0;
    assign p[30][29:0]=0;
    assign p[31][30:0]=0;


    wire [63:0]p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22;
    wire [62:0]P1,P2;

    csave l11(p[0],p[1],p[2],p1,p2,clk);
    csave l12(p[3],p[4],p[5],p3,p4,clk);
    csave l13(p[6],p[7],p[8],p5,p6,clk);
    csave l14(p[9],p[10],p[11],p7,p8,clk);
    csave l15(p[12],p[13],p[14],p9,p10,clk);
    csave l16(p[15],p[16],p[17],p11,p12,clk);
    csave l17(p[18],p[19],p[20],p13,p14,clk);
    csave l18(p[21],p[22],p[23],p15,p16,clk);
    csave l19(p[24],p[25],p[26],p17,p18,clk);
    csave l110(p[27],p[28],p[29],p19,p20,clk);

    dff_63 c1(P1,clk,p[30]);
    dff_63 c2(P2,clk,p[31]);

    assign p21[63]=0;
    assign p22[63]=0;
    assign p21[62:0]=P1;
    assign p22[62:0]=P2;

    wire [63:0]q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15;

    csave  l21(p1[62:0],p2[62:0],p3[62:0],q1,q2,clk);
    csave  l22(p4[62:0],p5[62:0],p6[62:0],q3,q4,clk);
    csave  l23(p7[62:0],p8[62:0],p9[62:0],q5,q6,clk);
    csave  l24(p10[62:0],p11[62:0],p12[62:0],q7,q8,clk);
    csave  l25(p13[62:0],p14[62:0],p15[62:0],q9,q10,clk);
    csave  l26(p16[62:0],p17[62:0],p18[62:0],q11,q12,clk);
    csave  l27(p19[62:0],p20[62:0],p21[62:0],q13,q14,clk);

    dff_64 d(q15,clk,p22);

    wire [63:0]r1,r2,r3,r4,r5,r6,r7,r8,r9,r10;

    csave  l31(q1[62:0],q2[62:0],q3[62:0],r1,r2,clk);
    csave  l32(q4[62:0],q5[62:0],q6[62:0],r3,r4,clk);
    csave  l33(q7[62:0],q8[62:0],q9[62:0],r5,r6,clk);
    csave  l34(q10[62:0],q11[62:0],q12[62:0],r7,r8,clk);
    csave  l35(q13[62:0],q14[62:0],q15[62:0],r9,r10,clk);

    wire [63:0]s1,s2,s3,s4,s5,s6,s7;

    csave  l41(r1[62:0],r2[62:0],r3[62:0],s1,s2,clk);
    csave  l42(r4[62:0],r5[62:0],r6[62:0],s3,s4,clk);
    csave  l43(r7[62:0],r8[62:0],r9[62:0],s5,s6,clk);

    dff_64 n(s7,clk,r10);

    wire [63:0]t1,t2,t3,t4,t5;

    csave  l51(s1[62:0],s2[62:0],s3[62:0],t1,t2,clk);
    csave  l52(s4[62:0],s5[62:0],s6[62:0],t3,t4,clk);

    dff_64 o(t5,clk,s7);

    wire [63:0]u1,u2,u3,u4;

    csave  l61(t1[62:0],t2[62:0],t3[62:0],u1,u2,clk);

    dff_64 k(u3,clk,t4);
    dff_64 l(u4,clk,t5);

    wire [63:0]v1,v2,v3;

    csave  l71(u1[62:0],u2[62:0],u3[62:0],v1,v2,clk);

    dff_64 m(v3,clk,u4);

    wire [63:0]w1,w2;

    csave  l81(v1[62:0],v2[62:0],v3[62:0],w1,w2,clk);

    wire [63:0]mult,w11,w12,w13,w14,w15,w21,w22,w23,w24,w25;
    wire Cout,cout;
    wire [31:0]mul;

    prefix pre(w1[31:0],w2[31:0],1'd0,cout,mul[31:0],clk);
    wire [31:0] kk , k3k , kkk , kkkk , k4;
    dff_32 pp1(kk , clk , mul[31:0]);
    dff_32 pp2(kkk , clk , kk);
    dff_32 pp3(kkkk , clk , kkk);
    dff_32 pp4(k4 , clk , kkkk);
    dff_32 pp5(k3k , clk , k4);
    assign mult[31:0] = k3k;

    dff_64 z(w11,clk,w1);
    dff_64 z11(w12,clk,w11);
    dff_64 z12(w13,clk,w12);
    dff_64 z13(w14,clk,w13);
    dff_64 z14(w15,clk,w14);

    dff_64 z2(w21,clk,w2);
    dff_64 z21(w22,clk,w21);
    dff_64 z22(w23,clk,w22);
    dff_64 z23(w24,clk,w23);
    dff_64 z24(w25,clk,w24);

    prefix pre1(w15[63:32],w2[63:32],cout,Cout,mult[63:32],clk);
    assign out = (a === 32'bz) ? 32'bz : mult;
endmodule 
