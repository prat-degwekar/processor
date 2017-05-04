//`include "df32.v"
//`include "shifter_rotator.v"
//`include "mux32.v"
//`include "dff.v"
//`include "pipelinedprefix32.v"
`include "stuff/shifter_rotator.v"
`include "stuff/mux32.v"
//`include "multiplier/dff.v"
//`include "adder/adder.v"
`include "stuff/df.v"
`include "stuff/df32.v"


module floatadder(a,b,cin,out,clk);

input [31:0]a,b;
input cin,clk;
output [31:0]out;


wire cin;
wire sign[26:0];
wire [31:0]a1,b1,sub1,sub2,a2[6:0],b2[6:0],s1,s2,s3,a12[4:0],b12[4:0];
wire cout1;
//wire c[14:0];
wire [31:0]e,ex1[5:0],ex2[5:0],expo[19:0],exponent,e1,e2;
wire [31:0]shift[2:0];
wire [31:0]sh[12:0];
wire [4:0]sh1;
wire [31:0]s;

assign ex1[0][7:0]=a[30:23];
assign ex1[0][31:8]=24'd0;
assign ex2[0][7:0]=b[30:23];
assign ex2[0][31:8]=24'd0;


// for checking which way to shift (doing a-b and b-a)

adder p0(ex1[0],ex2[0],1,sub1,cout1,clk);
adder p1(ex2[0],ex1[0],1,sub2,cout2,clk);




// Just pipelining ignore
df32 d41(ex1[1],ex1[0],clk);
df32 d42(ex1[2],ex1[1],clk);
df32 d43(ex1[3],ex1[2],clk);
df32 d44(ex1[4],ex1[3],clk);
df32 d45_5(ex1[5],ex1[4],clk);

df32 d45(ex2[1],ex2[0],clk);
df32 d46(ex2[2],ex2[1],clk);
df32 d47(ex2[3],ex2[2],clk);
df32 d48(ex2[4],ex2[3],clk);
df32 d49(ex2[5],ex2[4],clk);




//preparing shift bits

mux32 m1(sub1,32'd0,sub1[31],shift[0],clk);
mux32 m2(sub2,32'd0,sub2[31],shift[1],clk);







// shifting


assign a2[0][22:0]=a[22:0];
assign a2[0][23]=1;
assign a2[0][31:24]=8'd0;
assign b2[0][22:0]=b[22:0];
assign b2[0][23]=1;
assign b2[0][31:24]=8'd0;

//pipelining
df32 d20(a2[1],a2[0],clk);
df32 d21(a2[2],a2[1],clk);
df32 d22(a2[3],a2[2],clk);
df32 d23(a2[4],a2[3],clk);

df32 d24(a2[5],a2[4],clk);
df32 d25(a2[6],a2[5],clk);



df32 d10(b2[1],b2[0],clk);
df32 d11(b2[2],b2[1],clk);
df32 d12(b2[3],b2[2],clk);
df32 d13(b2[4],b2[3],clk);

df32 d14(b2[5],b2[4],clk);
df32 d15(b2[6],b2[5],clk);




//    now shifting
shifter_rotator sr0(b2[6],2'b01,shift[1][4:0],b1,clk);// a1 and b1 27 clk   <-- ignore comments like these Just checking for the pipelining ;)
shifter_rotator sr1(a2[6],2'b01,shift[0][4:0],a1,clk);




//selecting exponent and sign



    //pipeining ..... ignore
df32 d51(a12[0],a,clk);
df32 d52(a12[1],a12[0],clk);
df32 d53(a12[2],a12[1],clk);
df32 d54(a12[3],a12[2],clk);
df32 d54_5(a12[4],a12[3],clk);

df32 d55(b12[0],b,clk);
df32 d56(b12[1],b12[0],clk);
df32 d57(b12[2],b12[1],clk);
df32 d58(b12[3],b12[2],clk);
df32 d59(b12[4],b12[3],clk);





// selecting
mux32  m3(ex1[5],ex2[5],sub1[31],expo[0],clk);//expo[0] sign[0] 13
mux2   m11(a12[4][31],b12[4][31],sub1[31],sign[0],clk);





//// Again pipelining so please ignore....................
df32 d31(expo[1],expo[0],clk);
df32 d32(expo[2],expo[1],clk);
df32 d33(expo[3],expo[2],clk);
df32 d34(expo[4],expo[3],clk);

df32 d35(expo[5],expo[4],clk);
df32 d36(expo[6],expo[5],clk);
df32 d37(expo[7],expo[6],clk);
df32 d38(expo[8],expo[7],clk);

df32 d39(expo[9],expo[8],clk);
df32 d310(expo[10],expo[9],clk);
df32 d311(expo[11],expo[10],clk);
df32 d312(expo[12],expo[11],clk);

df32 d313(expo[13],expo[12],clk);
df32 d314(expo[14],expo[13],clk);
df32 d315(expo[15],expo[14],clk);
df32 d316(expo[16],expo[15],clk);

df32 d317(expo[17],expo[16],clk);
df32 d318(expo[18],expo[17],clk);
df32 d319(expo[19],expo[18],clk);



df d01(sign[1],sign[0],clk);
df d02(sign[2],sign[1],clk);
df d03(sign[3],sign[2],clk);
df d04(sign[4],sign[3],clk);

df d05(sign[5],sign[4],clk);
df d06(sign[6],sign[5],clk);
df d07(sign[7],sign[6],clk);
df d08(sign[8],sign[7],clk);

df d09(sign[9],sign[8],clk);
df d010(sign[10],sign[9],clk);
df d011(sign[11],sign[10],clk);
df d012(sign[12],sign[11],clk);

df d013(sign[13],sign[12],clk);
df d014(sign[14],sign[13],clk);
df d015(sign[15],sign[14],clk);
df d016(sign[16],sign[15],clk);

df d017(sign[17],sign[16],clk);
df d018(sign[18],sign[17],clk);
df d019(sign[19],sign[18],clk);
df d020(sign[20],sign[19],clk);

df d021(sign[21],sign[20],clk);
df d022(sign[22],sign[21],clk);
df d023(sign[23],sign[22],clk);
df d024(sign[24],sign[23],clk);

df d025(sign[25],sign[24],clk);
df d026(sign[26],sign[25],clk);
//pipelining ends...............



//adding






adder p2(a1,b1,0,s1,cout,clk); //s1 37





//              Logic Here is: Since the MSB is always 1 (hidden bit ) so after addition, suppose we shifted n bits earlier, this time we would 
//                              we would have to shift max by n+1 bits



//shifting back  



assign sh[0][4:0]=shift[0][4:0] | shift[1][4:0];
assign sh[0][31:5]=27'd0;

df32 d81(sh[1],sh[0],clk);
df32 d82(sh[2],sh[1],clk);
df32 d83(sh[3],sh[2],clk);
df32 d84(sh[4],sh[3],clk);

df32 d85(sh[5],sh[4],clk);
df32 d86(sh[6],sh[5],clk);
df32 d87(sh[7],sh[6],clk);
df32 d88(sh[8],sh[7],clk);

df32 d89(sh[9],sh[8],clk);
df32 d810(sh[10],sh[9],clk);
df32 d811(sh[11],sh[10],clk);
df32 d812(sh[12],sh[11],clk);

shifter_rotator sr2(s1,2'b00,sh[12][4:0],s2,clk);// s2 51





//shifting again and adding to coeff if required 

assign sh1[0]=s2[24];
assign sh1[4:1]=4'd0;
shifter_rotator sr3(s2,2'b00,sh1,s3,clk);  //s3 65




assign e[0]=s2[24];
assign e[31:1]=31'd0;

adder p3(expo[19],e,0,e1,cout2,clk);
df32     d1(e2,e1,clk);
df32     d2(exponent,e2,clk);


//preparing result


assign s[31]=sign[26];
assign s[30:23]=exponent[7:0];
assign s[22:0]=s3[22:0];

assign out = (a === 32'bz) ? 32'bz : s;


//assign s=expo[19];

endmodule
