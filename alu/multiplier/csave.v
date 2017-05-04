module csave(a,b,c,s,ca,clk);
    input [62:0]a,b,c;
    input clk;
    wire [63:0]sum,carry;
    output [63:0]s,ca;

    assign sum[62:0]=a^b^c;
    assign carry[63:1]= a&b | b&c | c&a;
    assign carry[0]=0;
    assign sum[63]=0;

    dff_64 d1(s,clk,sum);
    dff_64 d2(ca,clk,carry);
endmodule 
