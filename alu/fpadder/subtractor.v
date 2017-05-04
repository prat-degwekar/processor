`include "cla9.v"

module subtractor(a,b,out,select,out_exp);
output reg [8:0]out;
output reg [7:0]out_exp;								//shift magnitude
output reg [1:0]select;
wire [8:0]out_t;
input [8:0]a,b;

wire [8:0]b_temp;
wire cout;

assign b_temp=~b+1;
cla9 adder9(cout,out_t,a,b_temp,0);

always@(out_t)
begin
	if(out_t[8]==1)						//expA-expB<0  shift A
	begin
		out=~out_t+1;
		select=1;
		out_exp=b[7:0];
	end
	else if(out_t==0)					//expA=expB	   shift none
	begin out=out_t;
		select=0;
		out_exp=b[7:0];
	end
	else if(out_t[8]==0)							//expA-expB>0  shift B
	begin out=out_t;
	      select=2;
	      out_exp=a[7:0];
	end
end

endmodule

