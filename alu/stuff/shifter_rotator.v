//`include "stuff/mux32.v"
//`include "multiplier/dff.v"
module shifter_rotator(a,op,bits,out,clk);

input [31:0]a;
input [1:0]op;
input clk;
input [4:0]bits;
output [31:0]out;

wire [31:0]l1out,l2out,l3out,l4out,l5out,lbout;
wire l1s,c1;
wire [1:0]l2s,c2;
wire [2:0]l3s;
wire [3:0]l4s,c3;
wire [4:0]l5s;
wire [5:0]rb;
wire [7:0]c4;
wire [15:0]c5;


//bit reversal level 1

mux2 m00(a[31],a[0],op[0],lbout[31],clk);
mux2 m01(a[30],a[1],op[0],lbout[30],clk);
mux2 m02(a[29],a[2],op[0],lbout[29],clk);
mux2 m03(a[28],a[3],op[0],lbout[28],clk);

mux2 m04(a[27],a[4],op[0],lbout[27],clk);
mux2 m05(a[26],a[5],op[0],lbout[26],clk);
mux2 m06(a[25],a[6],op[0],lbout[25],clk);
mux2 m07(a[24],a[7],op[0],lbout[24],clk);

mux2 m08(a[23],a[8],op[0],lbout[23],clk);
mux2 m09(a[22],a[9],op[0],lbout[22],clk);
mux2 m010(a[21],a[10],op[0],lbout[21],clk);
mux2 m011(a[20],a[11],op[0],lbout[20],clk);

mux2 m012(a[19],a[12],op[0],lbout[19],clk);
mux2 m013(a[18],a[13],op[0],lbout[18],clk);
mux2 m014(a[17],a[14],op[0],lbout[17],clk);
mux2 m015(a[16],a[15],op[0],lbout[16],clk);

mux2 m016(a[15],a[16],op[0],lbout[15],clk);
mux2 m017(a[14],a[17],op[0],lbout[14],clk);
mux2 m018(a[13],a[18],op[0],lbout[13],clk);
mux2 m019(a[12],a[19],op[0],lbout[12],clk);

mux2 m020(a[11],a[20],op[0],lbout[11],clk);
mux2 m021(a[10],a[21],op[0],lbout[10],clk);
mux2 m022(a[9],a[22],op[0],lbout[9],clk);
mux2 m023(a[8],a[23],op[0],lbout[8],clk);

mux2 m024(a[7],a[24],op[0],lbout[7],clk);
mux2 m025(a[6],a[25],op[0],lbout[6],clk);
mux2 m026(a[5],a[26],op[0],lbout[5],clk);
mux2 m027(a[4],a[27],op[0],lbout[4],clk);

mux2 m028(a[3],a[28],op[0],lbout[3],clk);
mux2 m029(a[2],a[29],op[0],lbout[2],clk);
mux2 m030(a[1],a[30],op[0],lbout[1],clk);
mux2 m031(a[0],a[31],op[0],lbout[0],clk);

dff d00(l1s,bits[0],clk);
dff d01(l2s[0],bits[1],clk);
dff d02(l3s[0],bits[2],clk);
dff d03(l4s[0],bits[3],clk);
dff d04(l5s[0],bits[4],clk);
dff d05(rb[0],op[0],clk);

//LEVEL 1

assign c1=lbout[0]&op[1];


mux2 m10(lbout[31],c1,l1s,l1out[31],clk);
mux2 m11(lbout[30],lbout[31],l1s,l1out[30],clk);
mux2 m12(lbout[29],lbout[30],l1s,l1out[29],clk);
mux2 m13(lbout[28],lbout[29],l1s,l1out[28],clk);

mux2 m14(lbout[27],lbout[28],l1s,l1out[27],clk);
mux2 m15(lbout[26],lbout[27],l1s,l1out[26],clk);
mux2 m16(lbout[25],lbout[26],l1s,l1out[25],clk);
mux2 m17(lbout[24],lbout[25],l1s,l1out[24],clk);

mux2 m18(lbout[23],lbout[24],l1s,l1out[23],clk);
mux2 m19(lbout[22],lbout[23],l1s,l1out[22],clk);
mux2 m110(lbout[21],lbout[22],l1s,l1out[21],clk);
mux2 m111(lbout[20],lbout[21],l1s,l1out[20],clk);

mux2 m112(lbout[19],lbout[20],l1s,l1out[19],clk);
mux2 m113(lbout[18],lbout[19],l1s,l1out[18],clk);
mux2 m114(lbout[17],lbout[18],l1s,l1out[17],clk);
mux2 m115(lbout[16],lbout[17],l1s,l1out[16],clk);

mux2 m116(lbout[15],lbout[16],l1s,l1out[15],clk);
mux2 m117(lbout[14],lbout[15],l1s,l1out[14],clk);
mux2 m118(lbout[13],lbout[14],l1s,l1out[13],clk);
mux2 m119(lbout[12],lbout[13],l1s,l1out[12],clk);

mux2 m120(lbout[11],lbout[12],l1s,l1out[11],clk);
mux2 m121(lbout[10],lbout[11],l1s,l1out[10],clk);
mux2 m122(lbout[9],lbout[10],l1s,l1out[9],clk);
mux2 m123(lbout[8],lbout[9],l1s,l1out[8],clk);

mux2 m124(lbout[7],lbout[8],l1s,l1out[7],clk);
mux2 m125(lbout[6],lbout[7],l1s,l1out[6],clk);
mux2 m126(lbout[5],lbout[6],l1s,l1out[5],clk);
mux2 m127(lbout[4],lbout[5],l1s,l1out[4],clk);

mux2 m128(lbout[3],lbout[4],l1s,l1out[3],clk);
mux2 m129(lbout[2],lbout[3],l1s,l1out[2],clk);
mux2 m130(lbout[1],lbout[2],l1s,l1out[1],clk);
mux2 m131(lbout[0],lbout[1],l1s,l1out[0],clk);


dff d11(l2s[1],l2s[0],clk);
dff d12(l3s[1],l3s[0],clk);
dff d13(l4s[1],l4s[0],clk);
dff d14(l5s[1],l5s[0],clk);
dff d15(rb[1],rb[0],clk);



//LEVEL 2

assign c2[1]=op[1]&l1out[0];
assign c2[0]=op[1]&l1out[1];

mux2 m20(l1out[31],c2[0],l2s[1],l2out[31],clk);
mux2 m21(l1out[30],c2[1],l2s[1],l2out[30],clk);
mux2 m22(l1out[29],l1out[31],l2s[1],l2out[29],clk);
mux2 m23(l1out[28],l1out[30],l2s[1],l2out[28],clk);

mux2 m24(l1out[27],l1out[29],l2s[1],l2out[27],clk);
mux2 m25(l1out[26],l1out[28],l2s[1],l2out[26],clk);
mux2 m26(l1out[25],l1out[27],l2s[1],l2out[25],clk);
mux2 m27(l1out[24],l1out[26],l2s[1],l2out[24],clk);

mux2 m28(l1out[23],l1out[25],l2s[1],l2out[23],clk);
mux2 m29(l1out[22],l1out[24],l2s[1],l2out[22],clk);
mux2 m210(l1out[21],l1out[23],l2s[1],l2out[21],clk);
mux2 m211(l1out[20],l1out[22],l2s[1],l2out[20],clk);

mux2 m212(l1out[19],l1out[21],l2s[1],l2out[19],clk);
mux2 m213(l1out[18],l1out[20],l2s[1],l2out[18],clk);
mux2 m214(l1out[17],l1out[19],l2s[1],l2out[17],clk);
mux2 m215(l1out[16],l1out[18],l2s[1],l2out[16],clk);

mux2 m216(l1out[15],l1out[17],l2s[1],l2out[15],clk);
mux2 m217(l1out[14],l1out[16],l2s[1],l2out[14],clk);
mux2 m218(l1out[13],l1out[15],l2s[1],l2out[13],clk);
mux2 m219(l1out[12],l1out[14],l2s[1],l2out[12],clk);

mux2 m220(l1out[11],l1out[13],l2s[1],l2out[11],clk);
mux2 m221(l1out[10],l1out[12],l2s[1],l2out[10],clk);
mux2 m222(l1out[9],l1out[11],l2s[1],l2out[9],clk);
mux2 m223(l1out[8],l1out[10],l2s[1],l2out[8],clk);

mux2 m224(l1out[7],l1out[9],l2s[1],l2out[7],clk);
mux2 m225(l1out[6],l1out[8],l2s[1],l2out[6],clk);
mux2 m226(l1out[5],l1out[7],l2s[1],l2out[5],clk);
mux2 m227(l1out[4],l1out[6],l2s[1],l2out[4],clk);

mux2 m228(l1out[3],l1out[5],l2s[1],l2out[3],clk);
mux2 m229(l1out[2],l1out[4],l2s[1],l2out[2],clk);
mux2 m230(l1out[1],l1out[3],l2s[1],l2out[1],clk);
mux2 m231(l1out[0],l1out[2],l2s[1],l2out[0],clk);


dff d22(l3s[2],l3s[1],clk);
dff d23(l4s[2],l4s[1],clk);
dff d24(l5s[2],l5s[1],clk);
dff d25(rb[2],rb[1],clk);



//LEVEL 3

assign c3[3]=op[1]&l2out[0];
assign c3[2]=op[1]&l2out[1];
assign c3[1]=op[1]&l2out[2];
assign c3[0]=op[1]&l2out[3];

mux2 m30(l2out[31],c3[0],l3s[2],l3out[31],clk);
mux2 m31(l2out[30],c3[1],l3s[2],l3out[30],clk);
mux2 m32(l2out[29],c3[2],l3s[2],l3out[29],clk);
mux2 m33(l2out[28],c3[3],l3s[2],l3out[28],clk);

mux2 m34(l2out[27],l2out[31],l3s[2],l3out[27],clk);
mux2 m35(l2out[26],l2out[30],l3s[2],l3out[26],clk);
mux2 m36(l2out[25],l2out[29],l3s[2],l3out[25],clk);
mux2 m37(l2out[24],l2out[28],l3s[2],l3out[24],clk);

mux2 m38(l2out[23],l2out[27],l3s[2],l3out[23],clk);
mux2 m39(l2out[22],l2out[26],l3s[2],l3out[22],clk);
mux2 m310(l2out[21],l2out[25],l3s[2],l3out[21],clk);
mux2 m311(l2out[20],l2out[24],l3s[2],l3out[20],clk);

mux2 m312(l2out[19],l2out[23],l3s[2],l3out[19],clk);
mux2 m313(l2out[18],l2out[22],l3s[2],l3out[18],clk);
mux2 m314(l2out[17],l2out[21],l3s[2],l3out[17],clk);
mux2 m315(l2out[16],l2out[20],l3s[2],l3out[16],clk);

mux2 m316(l2out[15],l2out[19],l3s[2],l3out[15],clk);
mux2 m317(l2out[14],l2out[18],l3s[2],l3out[14],clk);
mux2 m318(l2out[13],l2out[17],l3s[2],l3out[13],clk);
mux2 m319(l2out[12],l2out[16],l3s[2],l3out[12],clk);

mux2 m320(l2out[11],l2out[15],l3s[2],l3out[11],clk);
mux2 m321(l2out[10],l2out[14],l3s[2],l3out[10],clk);
mux2 m322(l2out[9],l2out[13],l3s[2],l3out[9],clk);
mux2 m323(l2out[8],l2out[12],l3s[2],l3out[8],clk);

mux2 m324(l2out[7],l2out[11],l3s[2],l3out[7],clk);
mux2 m325(l2out[6],l2out[10],l3s[2],l3out[6],clk);
mux2 m326(l2out[5],l2out[9],l3s[2],l3out[5],clk);
mux2 m327(l2out[4],l2out[8],l3s[2],l3out[4],clk);

mux2 m328(l2out[3],l2out[7],l3s[2],l3out[3],clk);
mux2 m329(l2out[2],l2out[6],l3s[2],l3out[2],clk);
mux2 m330(l2out[1],l2out[5],l3s[2],l3out[1],clk);
mux2 m331(l2out[0],l2out[4],l3s[2],l3out[0],clk);

dff d33(l4s[3],l4s[2],clk);
dff d34(l5s[3],l5s[2],clk);
dff d35(rb[3],rb[2],clk);



//LEVEL 4

assign c4[7]=op[1]&l3out[0];
assign c4[6]=op[1]&l3out[1];
assign c4[5]=op[1]&l3out[2];
assign c4[4]=op[1]&l3out[3];

assign c4[3]=op[1]&l3out[4];
assign c4[2]=op[1]&l3out[5];
assign c4[1]=op[1]&l3out[6];
assign c4[0]=op[1]&l3out[7];

mux2 m40(l3out[31],c4[0],l4s[3],l4out[31],clk);
mux2 m41(l3out[30],c4[1],l4s[3],l4out[30],clk);
mux2 m42(l3out[29],c4[2],l4s[3],l4out[29],clk);
mux2 m43(l3out[28],c4[3],l4s[3],l4out[28],clk);

mux2 m44(l3out[27],c4[4],l4s[3],l4out[27],clk);
mux2 m45(l3out[26],c4[5],l4s[3],l4out[26],clk);
mux2 m46(l3out[25],c4[6],l4s[3],l4out[25],clk);
mux2 m47(l3out[24],c4[7],l4s[3],l4out[24],clk);

mux2 m48(l3out[23],l3out[31],l4s[3],l4out[23],clk);
mux2 m49(l3out[22],l3out[30],l4s[3],l4out[22],clk);
mux2 m410(l3out[21],l3out[29],l4s[3],l4out[21],clk);
mux2 m411(l3out[20],l3out[28],l4s[3],l4out[20],clk);



mux2 m412(l3out[19],l3out[27],l4s[3],l4out[19],clk);
mux2 m413(l3out[18],l3out[26],l4s[3],l4out[18],clk);
mux2 m414(l3out[17],l3out[25],l4s[3],l4out[17],clk);
mux2 m415(l3out[16],l3out[24],l4s[3],l4out[16],clk);

mux2 m416(l3out[15],l3out[23],l4s[3],l4out[15],clk);
mux2 m417(l3out[14],l3out[22],l4s[3],l4out[14],clk);
mux2 m418(l3out[13],l3out[21],l4s[3],l4out[13],clk);
mux2 m419(l3out[12],l3out[20],l4s[3],l4out[12],clk);

mux2 m420(l3out[11],l3out[19],l4s[3],l4out[11],clk);
mux2 m421(l3out[10],l3out[18],l4s[3],l4out[10],clk);
mux2 m422(l3out[9],l3out[17],l4s[3],l4out[9],clk);
mux2 m423(l3out[8],l3out[16],l4s[3],l4out[8],clk);

mux2 m424(l3out[7],l3out[15],l4s[3],l4out[7],clk);
mux2 m425(l3out[6],l3out[14],l4s[3],l4out[6],clk);
mux2 m426(l3out[5],l3out[13],l4s[3],l4out[5],clk);
mux2 m427(l3out[4],l3out[12],l4s[3],l4out[4],clk);

mux2 m428(l3out[3],l3out[11],l4s[3],l4out[3],clk);
mux2 m429(l3out[2],l3out[10],l4s[3],l4out[2],clk);
mux2 m430(l3out[1],l3out[9],l4s[3],l4out[1],clk);
mux2 m431(l3out[0],l3out[8],l4s[3],l4out[0],clk);


dff d314(l5s[4],l5s[3],clk);
dff d315(rb[4],rb[3],clk);



//LEVEL 5

assign c5[15]=op[1]&l4out[0];
assign c5[14]=op[1]&l4out[1];
assign c5[13]=op[1]&l4out[2];
assign c5[12]=op[1]&l4out[3];

assign c5[11]=op[1]&l4out[4];
assign c5[10]=op[1]&l4out[5];
assign c5[9]=op[1]&l4out[6];
assign c5[8]=op[1]&l4out[7];

assign c5[7]=op[1]&l4out[8];
assign c5[6]=op[1]&l4out[9];
assign c5[5]=op[1]&l4out[10];
assign c5[4]=op[1]&l4out[11];

assign c5[3]=op[1]&l4out[12];
assign c5[2]=op[1]&l4out[13];
assign c5[1]=op[1]&l4out[14];
assign c5[0]=op[1]&l4out[15];

mux2 m50(l4out[31],c5[0],l5s[4],l5out[31],clk);
mux2 m51(l4out[30],c5[1],l5s[4],l5out[30],clk);
mux2 m52(l4out[29],c5[2],l5s[4],l5out[29],clk);
mux2 m53(l4out[28],c5[3],l5s[4],l5out[28],clk);

mux2 m54(l4out[27],c5[4],l5s[4],l5out[27],clk);
mux2 m55(l4out[26],c5[5],l5s[4],l5out[26],clk);
mux2 m56(l4out[25],c5[6],l5s[4],l5out[25],clk);
mux2 m57(l4out[24],c5[7],l5s[4],l5out[24],clk);

mux2 m58(l4out[23],c5[8],l5s[4],l5out[23],clk);
mux2 m59(l4out[22],c5[9],l5s[4],l5out[22],clk);
mux2 m510(l4out[21],c5[10],l5s[4],l5out[21],clk);
mux2 m511(l4out[20],c5[11],l5s[4],l5out[20],clk);

mux2 m512(l4out[19],c5[12],l5s[4],l5out[19],clk);
mux2 m513(l4out[18],c5[13],l5s[4],l5out[18],clk);
mux2 m514(l4out[17],c5[14],l5s[4],l5out[17],clk);
mux2 m515(l4out[16],c5[15],l5s[4],l5out[16],clk);

mux2 m516(l4out[15],l4out[31],l5s[4],l5out[15],clk);
mux2 m517(l4out[14],l4out[30],l5s[4],l5out[14],clk);
mux2 m518(l4out[13],l4out[29],l5s[4],l5out[13],clk);
mux2 m519(l4out[12],l4out[28],l5s[4],l5out[12],clk);

mux2 m520(l4out[11],l4out[27],l5s[4],l5out[11],clk);
mux2 m521(l4out[10],l4out[26],l5s[4],l5out[10],clk);
mux2 m522(l4out[9],l4out[25],l5s[4],l5out[9],clk);
mux2 m523(l4out[8],l4out[24],l5s[4],l5out[8],clk);

mux2 m524(l4out[7],l4out[23],l5s[4],l5out[7],clk);
mux2 m525(l4out[6],l4out[22],l5s[4],l5out[6],clk);
mux2 m526(l4out[5],l4out[21],l5s[4],l5out[5],clk);
mux2 m527(l4out[4],l4out[20],l5s[4],l5out[4],clk);

mux2 m528(l4out[3],l4out[19],l5s[4],l5out[3],clk);
mux2 m529(l4out[2],l4out[18],l5s[4],l5out[2],clk);
mux2 m530(l4out[1],l4out[17],l5s[4],l5out[1],clk);
mux2 m531(l4out[0],l4out[16],l5s[4],l5out[0],clk);


dff d55(rb[5],rb[4],clk);


//bit reversal level 2


mux2 m60(l5out[31],l5out[0],rb[5],out[31],clk);
mux2 m61(l5out[30],l5out[1],rb[5],out[30],clk);
mux2 m62(l5out[29],l5out[2],rb[5],out[29],clk);
mux2 m63(l5out[28],l5out[3],rb[5],out[28],clk);

mux2 m64(l5out[27],l5out[4],rb[5],out[27],clk);
mux2 m65(l5out[26],l5out[5],rb[5],out[26],clk);
mux2 m66(l5out[25],l5out[6],rb[5],out[25],clk);
mux2 m67(l5out[24],l5out[7],rb[5],out[24],clk);

mux2 m68(l5out[23],l5out[8],rb[5],out[23],clk);
mux2 m69(l5out[22],l5out[9],rb[5],out[22],clk);
mux2 m610(l5out[21],l5out[10],rb[5],out[21],clk);
mux2 m611(l5out[20],l5out[11],rb[5],out[20],clk);

mux2 m612(l5out[19],l5out[12],rb[5],out[19],clk);
mux2 m613(l5out[18],l5out[13],rb[5],out[18],clk);
mux2 m614(l5out[17],l5out[14],rb[5],out[17],clk);
mux2 m615(l5out[16],l5out[15],rb[5],out[16],clk);

mux2 m616(l5out[15],l5out[16],rb[5],out[15],clk);
mux2 m617(l5out[14],l5out[17],rb[5],out[14],clk);
mux2 m618(l5out[13],l5out[18],rb[5],out[13],clk);
mux2 m619(l5out[12],l5out[19],rb[5],out[12],clk);

mux2 m620(l5out[11],l5out[20],rb[5],out[11],clk);
mux2 m621(l5out[10],l5out[21],rb[5],out[10],clk);
mux2 m622(l5out[9],l5out[22],rb[5],out[9],clk);
mux2 m623(l5out[8],l5out[23],rb[5],out[8],clk);

mux2 m624(l5out[7],l5out[24],rb[5],out[7],clk);
mux2 m625(l5out[6],l5out[25],rb[5],out[6],clk);
mux2 m626(l5out[5],l5out[26],rb[5],out[5],clk);
mux2 m627(l5out[4],l5out[27],rb[5],out[4],clk);

mux2 m628(l5out[3],l5out[28],rb[5],out[3],clk);
mux2 m629(l5out[2],l5out[29],rb[5],out[2],clk);
mux2 m630(l5out[1],l5out[30],rb[5],out[1],clk);
mux2 m631(l5out[0],l5out[31],rb[5],out[0],clk);

endmodule
